ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "Borg Scoutship"
ENT.Author = "Driad[Iar]"
ENT.Information = ""
ENT.Category = "[LFS StarTrek] [M]Borg"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/borgscoutcube.mdl"

ENT.AITEAM = 2

ENT.Mass = 1900
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

ENT.MaxThrust = 26000

ENT.MaxTurnPitch = 600
ENT.MaxTurnYaw = 600
ENT.MaxTurnRoll = 600

ENT.MaxPerfVelocity = 4800

ENT.MaxHealth = 69191

ENT.Stability = 0.7

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
