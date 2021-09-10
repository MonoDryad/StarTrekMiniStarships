--DO NOT EDIT OR REUPLOAD THIS FILE

include("shared.lua")

function ENT:Initialize()	
end

function ENT:ExhaustFX()
	if not self:GetEngineActive() then return end
	
	self.nextEFX = self.nextEFX or 0
	
	local THR = (self:GetRPM() - self.IdleRPM) / (self.LimitRPM - self.IdleRPM)
	
	local Driver = self:GetDriver()
	if IsValid( Driver ) then
		local W = Driver:lfsGetInput( "+THROTTLE" )
		if W ~= self.oldW then
			self.oldW = W
			if W then
				self.BoostAdd = 80
			end
		end
	end
	
	self.BoostAdd = self.BoostAdd and (self.BoostAdd - self.BoostAdd * FrameTime()) or 0
	
	if self.nextEFX < CurTime() then
		self.nextEFX = CurTime() + 0.01
		
		local emitter = ParticleEmitter( self:GetPos(), false )
		local Pos = {

			Vector(-92.75,-41.74,20.54),
			Vector(-92.75,41.74,20.54),
			Vector(25,-11.74,13.54),
			Vector(25,11.74,13.54),
		}
		
		if emitter then
			for _, v in pairs( Pos ) do
				local Sub = Mirror and 1 or -1
				local vOffset = self:LocalToWorld( v )
				local vNormal = -self:GetForward()

				vOffset = vOffset + vNormal * 5

				local particle = emitter:Add( "effects/muzzleflash2", vOffset )
				if not particle then return end

				particle:SetVelocity( vNormal * math.Rand(500,1000) + self:GetVelocity() )
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 0.1 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand(5,20) )
				particle:SetEndSize( math.Rand(0,10) )
				particle:SetRoll( math.Rand(-1,1) * 100 )
				
				particle:SetColor( 0, 100, 200 )
			end
			
			emitter:Finish()
		end
	end
end

function ENT:CalcEngineSound( RPM, Pitch, Doppler )
	if self.ENG then
		self.ENG:ChangePitch(  math.Clamp(math.Clamp(  60 + Pitch * 50, 80,255) + Doppler,0,255) )
		self.ENG:ChangeVolume( math.Clamp( -1 + Pitch * 6, 0.5,1) )
	end
	
	if self.DIST then
		self.DIST:ChangePitch(  math.Clamp(math.Clamp(  Pitch * 100, 50,255) + Doppler * 1.25,0,255) )
		self.DIST:ChangeVolume( math.Clamp( -1.5 + Pitch * 6, 0.5,1) )
	end
end

function ENT:EngineActiveChanged( bActive )
	if bActive then
		self.ENG = CreateSound( self, "STARTREK_ENGINE" )
		self.ENG:PlayEx(0,0)
		
		self.DIST = CreateSound( self, "STARTREK_DIST" )
		self.DIST:PlayEx(0,0)
	else
		self:SoundStop()
	end
end

function ENT:OnRemove()
	self:SoundStop()
end

function ENT:SoundStop()
	if self.DIST then
		self.DIST:Stop()
	end
	
	if self.ENG then
		self.ENG:Stop()
	end
end

function ENT:AnimFins()
end

function ENT:AnimRotor()
end

function ENT:AnimCabin()
end

function ENT:AnimLandingGear()
end

local mat = Material( "sprites/light_glow02_add" )
function ENT:Draw()
	self:DrawModel()
	
	if not self:GetEngineActive() then return end
	
	local Boost = self.BoostAdd or 0
	
	local Size = 8 + (self:GetRPM() / self:GetLimitRPM()) * 40 + Boost

	render.SetMaterial( mat )
	render.DrawSprite( self:LocalToWorld( Vector(6,8.4,14.3) ), Size, Size, Color( 255, 0, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(7,11,14.3) ), Size, Size, Color( 255, 0, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(8,13,14.3) ), Size, Size, Color( 255, 0, 0, 255) )
	
	render.DrawSprite( self:LocalToWorld( Vector(6,-8.4,14.3) ), 16, 16, Color( 255, 0, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(7,-11,14.3) ), 12, 12, Color( 255, 0, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(8,-13,14.3) ), 16, 16, Color( 255, 0, 0, 255) )
	
	render.DrawSprite( self:LocalToWorld( Vector(56.44,-44.1,12.05) ), 12, 12, Color( 255, 0, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(56.44,-48.6,17.05) ), 12, 12, Color( 255, 0, 0, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(56.44,44.1,12.05) ), 12, 12, Color( 0, 100, 0, 100) )
	render.DrawSprite( self:LocalToWorld( Vector(56.44,48.6,17.05) ), 12, 12, Color( 0, 100, 0, 100) )

	render.DrawSprite( self:LocalToWorld( Vector(105,0,17) ), Size, Size, Color( 255, 255, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(100,0,12) ), Size, Size, Color( 255, 255, 255, 255) )

	render.DrawSprite( self:LocalToWorld( Vector(104,2,14) ), Size, Size, Color( 255, 255, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(104,0,14) ), Size, Size, Color( 255, 255, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(104,-2,14) ), Size, Size, Color( 255, 255, 255, 255) )
end
