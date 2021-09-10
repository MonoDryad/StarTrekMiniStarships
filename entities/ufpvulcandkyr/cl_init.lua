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
				particle:SetStartAlpha( 155 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( math.Rand(10,20) )
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
--[[
Baixo Linha 1
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 2
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 3
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 4
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 5
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 6
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 7
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 8
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,47,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 9
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 10
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 11
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 13
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 15
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 16
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	
--[[
Linha -1
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-4,-85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -2
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-10,-85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -3
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-16,-83) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -4
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-22,-82) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -5
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-29,-80) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -6
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-36,-77) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -7
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-42,-74) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -8
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-47,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-47.5,-70) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -9
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-53,-67) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -10
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-58,-62) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -11
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-62,-58) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-67,-53) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-71,-47) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -13
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-74,-41.5) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-77,-36) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-80,-30) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -15
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-82.5,-24) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -16
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-84,-17) ), Size, Size, Color( 0, 100, 255, 255) )
	
--[[
Cima Linha 1
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,4,85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 2
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,10,85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 3
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,16,83) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 4
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,22,82) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 5
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,29,80) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 6
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,36,77) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 7
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,42,74) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 8
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,47,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 9
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,53,67) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 10
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,58,62) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 11
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,62,58) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,67,53) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,71,47) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 13
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,77,36) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,80,30) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 15
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha 16
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	
--[[
Linha -1
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-4,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-4,85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -2
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-10,85) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-10,85) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -3
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-16,83) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-16,83) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -4
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-22,82) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-22,82) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -5
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-29,80) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-29,80) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -6
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-36,77) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-36,77) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -7
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-42,74) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-42,74) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -8
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-47,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-47.5,70) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -9
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-53,67) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-53,67) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -10
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-58,62) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-58,62) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -11
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-62,58) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-62,58) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-67,53) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-67,53) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -12
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-71,47) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-71,47) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -13
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-74,41.5) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-77,36) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-77,36) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -14
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-80,30) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-80,30) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -15
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-82.5,24) ), Size, Size, Color( 0, 100, 255, 255) )
--[[
Linha -16
]]--
	render.DrawSprite( self:LocalToWorld( Vector(-92.5,-84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-96,-84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-99,-84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-102,-84,17) ), Size, Size, Color( 0, 100, 255, 255) )
	render.DrawSprite( self:LocalToWorld( Vector(-105,-84,17) ), Size, Size, Color( 0, 100, 255, 255) )

end
