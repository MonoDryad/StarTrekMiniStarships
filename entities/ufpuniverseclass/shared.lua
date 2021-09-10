ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Universe Class"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]UFP"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/enterprisej.mdl"

ENT.AITEAM = 1

ENT.Mass = 800
ENT.Inertia = Vector(40000,40000,40000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(-101,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 200
ENT.MaxRPM = 1900
ENT.LimitRPM = 3000
ENT.RPMThrottleIncrement = 500

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 10000

ENT.MaxThrust = 3000

ENT.MaxTurnPitch = 350
ENT.MaxTurnYaw = 250
ENT.MaxTurnRoll = 350

ENT.MaxPerfVelocity = 2800

ENT.MaxHealth = 15000
ENT.MaxShield = 500

ENT.Stability = 1

ENT.MaxPrimaryAmmo = 8000
ENT.MaxSecondaryAmmo = 12

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)

sound.Add( {
	name = "STARTREK_DIST",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 100,
	sound = "lfs/startreksoundsbyiar/2.ogg"
} )

sound.Add( {
	name = "STARTREK_BOOST",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 125,
	sound = "lfs/startreksoundsbyiar/2.ogg"
} )

sound.Add( {
	name = "STARTREK_FIRE",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 100,
	sound = "lfs/startreksoundsbyiar/tng_phaser3_cleanv2.wav"
} )

sound.Add( {
	name = "STARTREK_FIRE2",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 100,
	sound = "lfs/startreksoundsbyiar/fire4.wav"
} )