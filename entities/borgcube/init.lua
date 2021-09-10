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
	
	self:SetNextPrimary( 1 )
	
	local fP = { Vector(61,616,51),Vector(61,-446,51),Vector(184,0,51),Vector(18,56,46),Vector(61,-56,-246),Vector(104,0,290) }

	self.NumPrim = self.NumPrim and self.NumPrim + 2 or 2
	if self.NumPrim > 6 then self.NumPrim = 2 end
	
	local startpos =  self:GetRotorPos()
	local TracePlane = util.TraceHull( {
		start = startpos,
		endpos = (startpos + self:GetForward() * 50000),
		mins = Vector( -10, -10, -10 ),
		maxs = Vector( 10, 10, 10 ),
		filter = self
	} )
	
	local bullet = {}
	bullet.Num 	= 10
	bullet.Src 	= self:LocalToWorld( fP[self.NumPrim] )
	bullet.Dir 	= (TracePlane.HitPos - bullet.Src):GetNormalized()
	bullet.Spread 	= Vector( 0.05,  0.5, 0.05 )
	bullet.Tracer	= 1
	bullet.TracerName	= "beam_effect_green_tracer"
	bullet.Force	= 0
	bullet.HullSize 	= 0
	bullet.Damage	= 25
	bullet.Attacker 	= self:GetDriver()
	bullet.AmmoType = "Pistol"
	bullet.Callback = function(att, tr, dmginfo)
		dmginfo:SetDamageType(DMG_AIRBOAT)
	end
	self:FireBullets( bullet )
	
	self:TakePrimaryAmmo()
	
end

function ENT:SecondaryAttack()
	if not self:CanSecondaryAttack() then return end

	self:EmitSound( "lfs/startreksoundsbyiar/borg_cut_clean3.wav" )
	
	self:SetNextSecondary( 2 )
	
	
	local startpos =  self:GetRotorPos()
	local TracePlane = util.TraceHull( {
		start = startpos,
		endpos = (startpos + self:GetForward() * 50000),
		mins = Vector( -10, -10, -10 ),
		maxs = Vector( 10, 10, 10 ),
		filter = self
	} )
	
	local bullet = {}
	bullet.Num 	= 20
	bullet.Src 	= self:LocalToWorld( Vector(152.24,0,0) )
	bullet.Dir 	= (TracePlane.HitPos - bullet.Src):GetNormalized()
	bullet.Spread 	= Vector( 1, 1, 2 )
	bullet.Tracer	= 1
	bullet.TracerName	= "beam_effect_green_tracer"
	bullet.Force	= 1500
	bullet.HullSize 	= 500
	bullet.Damage	= 500
	bullet.Attacker 	= self:GetDriver()
	bullet.AmmoType = "Pistol"
	bullet.Callback = function(att, tr, dmginfo)
		dmginfo:SetDamageType(DMG_AIRBOAT)
	end
	self:FireBullets( bullet )
	
	self:TakeSecondaryAmmo()
	
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