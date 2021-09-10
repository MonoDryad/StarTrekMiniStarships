ENT.Type            = "anim"
DEFINE_BASECLASS( "lunasflightschool_basescript" )

ENT.PrintName = "WIP Borg Cube"
ENT.Author = "Dryad"
ENT.Information = ""
ENT.Category = "[LFS] [M]Borg"

ENT.Spawnable		= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/borgcube.mdl"

ENT.AITEAM = 2

ENT.Mass = 1000
ENT.Inertia = Vector(2200000,2200000,2200000)
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

ENT.MaxTurnPitch = 3500
ENT.MaxTurnYaw = 5500
ENT.MaxTurnRoll = 2500

ENT.MaxPerfVelocity = 4000

ENT.MaxHealth = 140000
ENT.MaxShield = 3000

ENT.Stability = 1

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
