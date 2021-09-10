--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "vehicle"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Strider Class"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]Terran Empire"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/striderterran/striderv2.mdl"

ENT.AITEAM = 2

ENT.Mass = 800
ENT.Inertia = Vector(40000,40000,40000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 200
ENT.MaxRPM = 1000
ENT.LimitRPM = 1400
ENT.RPMThrottleIncrement = 50

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 1600

ENT.MaxThrust = 2600

ENT.MaxTurnPitch = 450
ENT.MaxTurnYaw = 350
ENT.MaxTurnRoll = 450

ENT.MaxPerfVelocity = 2000

ENT.MaxHealth = 8000
ENT.MaxShield = 150

ENT.Stability = 0.8

ENT.MaxPrimaryAmmo = 8000
ENT.MaxSecondaryAmmo = 66

ENT.MaintenanceTime = 25
ENT.MaintenanceRepairAmount = 250

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)
