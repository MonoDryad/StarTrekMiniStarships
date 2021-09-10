--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "[Experimental] Planet Killer (Doomsday Machine)"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]Special"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/planetkillerv2.mdl"

ENT.AITEAM = 3

ENT.Mass = 800
ENT.Inertia = Vector(170000,170000,170000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 1
ENT.MaxRPM = 700
ENT.LimitRPM = 1000

ENT.RotorPos = Vector(405,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 1000

ENT.MaxThrust = 8000

ENT.MaxTurnPitch = 905
ENT.MaxTurnYaw = 905
ENT.MaxTurnRoll = 105

ENT.MaxPerfVelocity = 2000

ENT.MaxHealth = 69421 

ENT.Stability = 1

ENT.MaxPrimaryAmmo = 42169

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)