--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Freedom Class"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]UFP"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/freedom_oldv2.mdl"

ENT.AITEAM = 1

ENT.Mass = 800
ENT.Inertia = Vector(40000,40000,40000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 200
ENT.MaxRPM = 1000
ENT.LimitRPM = 1200
ENT.RPMThrottleIncrement = 100

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)


ENT.MaxVelocity = 2000

ENT.MaxThrust = 3000

ENT.MaxTurnPitch = 350
ENT.MaxTurnYaw = 550
ENT.MaxTurnRoll = 300

ENT.MaxPerfVelocity = 3000

ENT.MaxHealth = 7000
ENT.MaxShield = 200

ENT.Stability = 1

ENT.MaxPrimaryAmmo = 8000
ENT.MaxSecondaryAmmo = 42

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)