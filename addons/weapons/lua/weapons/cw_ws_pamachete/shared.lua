AddCSLuaFile()

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Apocalyptic Machete"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.DisableSprintViewSimulation = true
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/melee/w_ws_pamachete.mdl"
	SWEP.WMPos = Vector(-1, 1, -1)
	SWEP.WMAng = Vector(-15, -90, 180)
	
	SWEP.IconLetter = "j"
	killicon.Add("cw_ws_pamachete", "vgui/kills/cw_ws_pamachete", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_ws_pamachete")
end

SWEP.Animations = {
	slash_primary = "hitcenter1",
	slash_secondary = "hitcenter3",
	draw = "draw"
}

SWEP.Sounds = {
	hitcenter1 = {{time = 0.05, sound = "CW_KNIFE_SLASH"}},
	//hitcenter3 = {{time = 0.05, sound = "CW_KNIFE_SLASH"}},
	hitcenter2 = {{time = 0.1, sound = "CW_KNIFE_SLASH"}},
	draw = {{time = 0.1, sound = "CW_KNIFE_DRAW"}},
}

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.Base = "cw_melee_base"
SWEP.Category = "CW 2.0 White Snow"
SWEP.NormalHoldType = "melee"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 55
SWEP.ViewModelFlip	= false
SWEP.ViewModel = "models/weapons/melee/v_ws_pamachete.mdl"
SWEP.WorldModel = "models/weapons/melee/w_ws_pamachete.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 0
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.PrimaryAttackDelay = 0.75
SWEP.SecondaryAttackDelay = 0.90

SWEP.PrimaryAttackDamage = {50, 60}
SWEP.SecondaryAttackDamage = {90, 100}

SWEP.PrimaryAttackRange = 65

SWEP.HolsterTime = 0.4
SWEP.DeployTime = 0.6

SWEP.PrimaryAttackImpactTime = 0.2
SWEP.PrimaryAttackDamageWindow = 0.15

SWEP.SecondaryAttackImpactTime = 0.2
SWEP.SecondaryAttackDamageWindow = 0.15

SWEP.PrimaryHitAABB = {
	//Vector(-10, -5, -5),
	//Vector(10, 5, 5)
	Vector(-25, -20, -20),
	Vector(25, 20, 20)
}