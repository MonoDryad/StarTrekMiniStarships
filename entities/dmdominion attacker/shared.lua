--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Jem'hadar Attack Class"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]Gamma Quadrant"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/correctattackship.mdl"

ENT.AITEAM = 1

ENT.Mass = 800
ENT.Inertia = Vector(40000,40000,40000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 200
ENT.MaxRPM = 700
ENT.LimitRPM = 1000
ENT.RPMThrottleIncrement = 45

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 1400

ENT.MaxThrust = 2600

ENT.MaxTurnPitch = 380
ENT.MaxTurnYaw = 580
ENT.MaxTurnRoll = 280

ENT.MaxPerfVelocity = 1400

ENT.MaxHealth = 7000
ENT.MaxShield = 700

ENT.Stability = 0.41

ENT.MaxPrimaryAmmo = 16000
ENT.MaxSecondaryAmmo = 100

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)
