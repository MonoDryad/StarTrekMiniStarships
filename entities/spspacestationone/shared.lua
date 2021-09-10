--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "[Experimental] Starbase One-Type"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]Special"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/disco_starbase.mdl"

ENT.AITEAM = 1

ENT.Mass = 800
ENT.Inertia = Vector(170000,170000,170000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 1
ENT.MaxRPM = 200
ENT.LimitRPM = 350
ENT.RPMThrottleIncrement = 10

ENT.RotorPos = Vector(0,0,300)
ENT.WingPos = Vector(100,0,500)
ENT.ElevatorPos = Vector(-80,0,300)
ENT.RudderPos = Vector(-200,0,300)

ENT.MaxVelocity = 215

ENT.MaxThrust = 100

ENT.MaxTurnPitch = 30
ENT.MaxTurnYaw = 30
ENT.MaxTurnRoll = 0

ENT.MaxPerfVelocity = 300

ENT.MaxHealth = 40000
ENT.MaxShield = 500

ENT.Stability = 1

ENT.MaxPrimaryAmmo = 5000
ENT.MaxSecondaryAmmo = 55

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)