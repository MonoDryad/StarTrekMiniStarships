ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Borg Probe"
ENT.Author = "Driad[Iar]"
ENT.Information = ""
ENT.Category = "[LFS StarTrek] [M]Borg"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/probe.mdl"

ENT.AITEAM = 2

ENT.Mass = 3900
ENT.Inertia = Vector(220000,220000,220000)
ENT.Drag = 1

ENT.HideDriver = true
ENT.SeatPos = Vector(89,0,-21)
ENT.SeatAng = Angle(0,90,7)

ENT.IdleRPM = 1
ENT.MaxRPM = 700
ENT.LimitRPM = 1000

ENT.RotorPos = Vector(0,0,0)
ENT.WingPos = Vector(100,0,0)
ENT.ElevatorPos = Vector(-80,0,0)
ENT.RudderPos = Vector(-200,0,0)

ENT.MaxVelocity = 2800

ENT.MaxThrust = 5000

ENT.MaxTurnPitch = 1000
ENT.MaxTurnYaw = 1000
ENT.MaxTurnRoll = 1000

ENT.MaxPerfVelocity = 2800

ENT.MaxHealth = 35191

ENT.Stability = 0.6

ENT.MaxPrimaryAmmo = 999999
ENT.MaxSecondaryAmmo = 999999

ENT.MISSILEENT = "lunasflightschool_missile"
ENT.MISSILES = {}
ENT.MISSILES[1] = Vector(62,59,-29)
ENT.MISSILES[2] = Vector(62,-59,-29)

sound.Add( {
	name = "BORGSTARTREK_BRAKE",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 110,
	sound = "lfs/startreksoundsbyiar/resistanceisfutileattack.wav"
} )

sound.Add( {
	name = "BORGSTARTREK_DIST",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 110,
	sound = "lfs/startreksoundsbyiar/borgenginesound.wav"
} )

sound.Add( {
	name = "BORGSTARTREK_BOOST",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 355,
	sound = "lfs/startreksoundsbyiar/wearetheborg.wav"
} )

sound.Add( {
	name = "BORGSTARTREK_FIRE",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 90,
	sound = "lfs/startreksoundsbyiar/cutcleanofborgweaponphaser.wav"
} )

sound.Add( {
	name = "BORGSTARTREK_FIRE2",
	channel = CHAN_WEAPON,
	volume = 1.0,
	level = 90,
	sound = "lfs/startreksoundsbyiar/borg_cut_clean3.wav"
} )
