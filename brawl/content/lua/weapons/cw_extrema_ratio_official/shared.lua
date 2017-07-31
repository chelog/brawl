AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Extrema Ratio MK21"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/wcw_ex_ra.mdl"
	SWEP.WMPos = Vector(0.25, -1, 1.25)
	SWEP.WMAng = Vector(-10, 90, 180)
	
	SWEP.IconLetter = "j"
	killicon.AddFont("cw_extrema_ratio_official", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
end

SWEP.Animations = {
	slash_primary = {"midslash1", "midslash2"},
	slash_secondary = "stab",
	draw = "draw"
}

SWEP.Sounds = {
	midslash1 = {{time = 0.05, sound = "CW_KNIFE_SLASH"}},
	midslash2 = {{time = 0.05, sound = "CW_KNIFE_SLASH"}},
	stab = {{time = 0.1, sound = "CW_KNIFE_SLASH"}},
	draw = {{time = 0.1, sound = "CW_KNIFE_DRAW"}},
}

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.Base = "cw_melee_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel = "models/weapons/cw2_ex_ra.mdl"
SWEP.WorldModel = "models/weapons/wcw_ex_ra.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.PrimaryAttackDelay = 0.5
SWEP.SecondaryAttackDelay = 0.75

SWEP.PrimaryAttackDamage = {30, 35}
SWEP.SecondaryAttackDamage = {65, 70}

SWEP.PrimaryAttackRange = 50

SWEP.HolsterTime = 0.4
SWEP.DeployTime = 0.6

SWEP.PrimaryAttackImpactTime = 0.2
SWEP.PrimaryAttackDamageWindow = 0.15

SWEP.SecondaryAttackImpactTime = 0.2
SWEP.SecondaryAttackDamageWindow = 0.15

SWEP.PrimaryHitAABB = {
	Vector(-10, -5, -5),
	Vector(10, 5, 5)
}