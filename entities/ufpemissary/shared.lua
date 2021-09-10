--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Emissary Class"
ENT.Author = "Driad[Iar]"
ENT.Information = ""
ENT.Category = "[LFS StarTrek] [M]UFP"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/emissaryv2.mdl"

ENT.AITEAM = 1

ENT.Mass = 3000
ENT.Inertia = Vector(220000,220000,220000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 100
ENT.MaxRPM = 800
ENT.LimitRPM = 1000

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 2100

ENT.MaxThrust = 6500

ENT.MaxTurnPitch = 360
ENT.MaxTurnYaw = 560
ENT.MaxTurnRoll = 260

ENT.MaxPerfVelocity = 2000

ENT.MaxHealth = 39000
ENT.MaxShield = 1000

ENT.Stability = 0.7

ENT.MaxPrimaryAmmo = 15000
ENT.MaxSecondaryAmmo = 155

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)
