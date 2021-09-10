--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Miranda Class"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]UFP"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/mirandav3.mdl"

ENT.AITEAM = 1

ENT.Mass = 800
ENT.Inertia = Vector(40000,40000,40000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 200
ENT.MaxRPM = 1200
ENT.LimitRPM = 1400

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 1900

ENT.MaxThrust = 2000

ENT.MaxTurnPitch = 350
ENT.MaxTurnYaw = 450
ENT.MaxTurnRoll = 350
ENT.RPMThrottleIncrement = 120

ENT.MaxPerfVelocity = 2000

ENT.MaxHealth = 6100
ENT.MaxShield = 150

ENT.Stability = 1

ENT.MaxPrimaryAmmo = 8000
ENT.MaxSecondaryAmmo = 32

ENT.MaintenanceTime = 25
ENT.MaintenanceRepairAmount = 250

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)