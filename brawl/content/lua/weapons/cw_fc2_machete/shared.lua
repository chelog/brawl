AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Machete"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/cw2melee/w_fc2_machete.mdl"
	SWEP.WMPos = Vector(-2.403, -0.286, 1.167)
	SWEP.WMAng = Vector(-200.385, 180, 5.664)
	SWEP.IconLetter = "j"
	killicon.Add("cw_fc2_machete", "entities/machete_fc2_icon", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("entities/machete_fc2_icon")
end

SWEP.Animations = {
	slash_primary = {"midslash1", "midslash2"},
	slash_secondary = "stab",
	draw = "draw"
}

SWEP.Attachments = {
["impulse 100"] = {header = "Skin", offset = {100, -400}, atts = {"skin_rust","skin_blood"}},
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
SWEP.Category = "CW 2.0 Melee"
SWEP.NormalHoldType = "melee"
SWEP.RunHoldType = "melee"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= false
SWEP.ViewModel = "models/cw2melee/v_fc2_machete.mdl"
SWEP.WorldModel = "models/cw2melee/w_fc2_machete.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.PrimaryAttackDelay = 0.5
SWEP.SecondaryAttackDelay = 0.75

SWEP.PrimaryAttackDamage = {45, 50}
SWEP.SecondaryAttackDamage = {70, 80}

SWEP.PrimaryAttackRange = 75

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