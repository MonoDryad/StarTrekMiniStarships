--DO NOT EDIT OR REUPLOAD THIS FILE

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

	self:EmitSound( "STARTREK_FIRE" )
	
	self:SetNextPrimary( 0.13 )
	
	local fP = { Vector(8,19,4),Vector(8,-19,4),Vector(18,0,9),Vector(61,56,0),Vector(61,-56,0),Vector(104,0,0) }

	self.NumPrim = self.NumPrim and self.NumPrim + 1 or 1
	if self.NumPrim > 2 then self.NumPrim = 1 end
	
	local startpos =  self:GetRotorPos()
	local TracePlane = util.TraceHull( {
		start = startpos,
		endpos = (startpos + self:GetForward() * 50000),
		mins = Vector( -10, -10, -10 ),
		maxs = Vector( 10, 10, 10 ),
		filter = self
	} )
	
	local bullet = {}
	bullet.Num 	= 1
	bullet.Src 	= self:LocalToWorld( fP[self.NumPrim] )
	bullet.Dir 	= (TracePlane.HitPos - bullet.Src):GetNormalized()
	bullet.Spread 	= Vector( 0.05, 0.05, 0.05 )
	bullet.Tracer	= 1
	bullet.TracerName	= "beam_effect_white"
	bullet.Force	= 0
	bullet.HullSize 	= 0
	bullet.Damage	= 20
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

	self:EmitSound( "lfs/startreksoundsbyiar/fire4.wav" )
	
	self:SetNextSecondary( 4 )
	
	local startpos =  self:GetRotorPos()
	local TracePlane = util.TraceHull( {
		start = startpos,
		endpos = (startpos + self:GetForward() * 50000),
		mins = Vector( -10, -10, -10 ),
		maxs = Vector( 10, 10, 10 ),
		filter = self
	} )
	
	local bullet = {}
	bullet.Num 	= 4
	bullet.Src 	= self:LocalToWorld( Vector(10,0,12) )
	bullet.Dir 	= (TracePlane.HitPos - bullet.Src):GetNormalized()
	bullet.Spread 	= Vector( 0.05, 0.05, 0.05 )
	bullet.Tracer	= 1
	bullet.TracerName	= "lfs_laser_red_large"
	bullet.Force	= 150
	bullet.HullSize 	= 40
	bullet.Damage	= 150
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
			self:EmitSound( "STARTREK_BOOST" )
			self:DelayNextSound( 1 )
		end
	else
		if (self:GetRPM() + 1) > self:GetMaxRPM() then
			if self:CanSound() then
				self:EmitSound( "STARTREK_BRAKE" )
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