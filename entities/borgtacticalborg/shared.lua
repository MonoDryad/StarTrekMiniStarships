--DO NOT EDIT OR REUPLOAD THIS FILE

ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Borg Tactical Cube"
ENT.Author = "Driad[Iar]"
ENT.Information = ""
ENT.Category = "[LFS StarTrek] [M]Borg"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/borgcubetactical.mdl"

ENT.AITEAM = 2

ENT.Mass = 5000
ENT.Inertia = Vector(220000,220000,220000)
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

ENT.MaxVelocity = 4800

ENT.MaxThrust = 14000

ENT.MaxTurnPitch = 350
ENT.MaxTurnYaw = 550
ENT.MaxTurnRoll = 250

ENT.MaxPerfVelocity = 4000

ENT.MaxHealth = 412278

ENT.Stability = 0.6

ENT.MaxPrimaryAmmo = 9999999
ENT.MaxSecondaryAmmo = 9999999

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)
