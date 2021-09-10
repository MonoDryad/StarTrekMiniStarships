--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Class 7 Shuttle"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]UFP"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/class_c3x.mdl"

ENT.AITEAM = 1

ENT.Mass = 800
ENT.Inertia = Vector(40000,40000,40000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-25,0,-26)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 200
ENT.MaxRPM = 500
ENT.LimitRPM = 1000
ENT.RPMThrottleIncrement = 60

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 1300

ENT.MaxThrust = 1300

ENT.MaxTurnPitch = 150
ENT.MaxTurnYaw = 150
ENT.MaxTurnRoll = 150

ENT.MaxPerfVelocity = 1200

ENT.MaxHealth = 1000
ENT.MaxShield = 50

ENT.Stability = 1

ENT.MaxPrimaryAmmo = 5000

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)