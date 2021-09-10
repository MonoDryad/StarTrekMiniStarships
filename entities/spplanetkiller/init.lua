AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:SpawnFunction( ply, tr, ClassName ) -- called by garry
	if not tr.Hit then return end

	local ent = ents.Create( ClassName )
	ent.dOwnerEntLFS = ply  -- this is important
	ent:SetPos( tr.HitPos + tr.HitNormal * 20 ) -- spawn 20 units above ground
	ent:Spawn()
	ent:Activate()

	return ent
end

function ENT:RunOnSpawn()
end

function ENT:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:EmitSound( "BORGSTARTREK_FIRE" )
	
	self:SetNextPrimary( 1.6 )
	
	local fP = { Vector(500,0,0)}

	self.NumPrim = self.NumPrim and self.NumPrim + 1 or 1
	if self.NumPrim > 1 then self.NumPrim = 1 end
	
	local startpos =  self:GetRotorPos()
	local TracePlane = util.TraceHull( {
		start = startpos,
		endpos = (startpos + self:GetForward() * 50000),
		mins = Vector( -10, -10, -10 ),
		maxs = Vector( 10, 10, 10 ),
		filter = self
	} )
	
	local bullet = {}
	bullet.Num 	= 40
	bullet.Src 	= self:LocalToWorld( fP[self.NumPrim] )
	bullet.Dir 	= (TracePlane.HitPos - bullet.Src):GetNormalized()
	bullet.Spread 	= Vector( 0.3,  0.3, 0 )
	bullet.Tracer	= 1
	bullet.TracerName	= "lfs_laser_red_large"
	bullet.Force	= 1000
	bullet.HullSize 	= 0
	bullet.Damage	= 1000
	bullet.Attacker 	= self:GetDriver()
	bullet.AmmoType = "Pistol"
	bullet.Callback = function(att, tr, dmginfo)
		dmginfo:SetDamageType(DMG_AIRBOAT)
	end
	self:FireBullets( bullet )
	
	self:TakePrimaryAmmo()
	
end

function ENT:SecondaryAttack()
end

function ENT:OnKeyThrottle( bPressed )
	if bPressed then
		if self:CanSound() then
			self:EmitSound( "BORGSTARTREK_BOOST" )
			self:DelayNextSound( 1 )
		end
	else
		if (self:GetRPM() + 1) > self:GetMaxRPM() then
			if self:CanSound() then
				self:EmitSound( "BORGSTARTREK_BRAKE" )
				self:DelayNextSound( 0.5 )
			end
		end
	end
end

function ENT:CreateAI()
end

function ENT:RemoveAI()
end

function ENT:ToggleLandingGear()
end

function ENT:RaiseLandingGear()
end

function ENT:HandleWeapons(Fire1, Fire2)
	local Driver = self:GetDriver()
	
	if IsValid( Driver ) then
		if self:GetAmmoPrimary() > 0 then
			Fire1 = Driver:KeyDown( IN_ATTACK )
		end
		if self:GetAmmoSecondary() > 0 then
			Fire2 = Driver:KeyDown( IN_ATTACK2 )
		end
	end
	
	if Fire1 then
		self:PrimaryAttack()
	end
	
	if Fire2 then
		self:SecondaryAttack()
			end
end