AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

local haveWeapon = true

if CLIENT then
	
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "A35"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1
	
	SWEP.IconLetter = "k"
	killicon.Add("cw_a35", "vgui/kills/cw_a35", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_a35")
	
	SWEP.MuzzleEffect = "muzzleflash_m3"
	SWEP.PosBasedMuz = true
	SWEP.MuzzlePosMod = {x = 0, y = 45, z = -1}
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.Shell = "shotshell"
	SWEP.ShellDelay = 0.3
	
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 1
	
	SWEP.SightWithRail = true
		
	SWEP.IronsightPos = Vector(2.64, 0, 2.68)
	SWEP.IronsightAng = Vector(0, 2.813, 0)

	SWEP.MicroT1Pos = Vector(2.654, 0, 2.365)
	SWEP.MicroT1Ang = Vector(0, 2.813, 0)
	
	SWEP.EoTechPos = Vector(2.635, 0, 2.1)
	SWEP.EoTechAng = Vector(0, 2.813, 0)
	
	SWEP.AimpointPos = Vector(2.65, 0, 2.349)
	SWEP.AimpointAng = Vector(-1, 2.813, 0)
			
	SWEP.ACOGPos = Vector(2.75, 0, 2.42)
	SWEP.ACOGAng = Vector(-2, 3.2, 0)
	
	SWEP.SprintPos = Vector(-0.281, -1, -2.08)
	SWEP.SprintAng = Vector(4.925, -36.584, 13.366)

	//SWEP.CustomizePos = Vector(-3.08, -4.624, 0.92)
	//SWEP.CustomizeAng = Vector(16.18, -35.88, -7.739)
	SWEP.CustomizePos = Vector(-1.56, -1.407, 0.33)
	SWEP.CustomizeAng = Vector(10.553, -12.664, -0.704)

	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(2.74, 0, 1.679), [2] = Vector(-2, 3.2, 0)}}

	SWEP.SightWithRail = false
	SWEP.ACOGAxisAlign = {right = 0, up = 180, forward = 0}
	
	SWEP.AlternativePos = Vector(-0.64, 0.294, -0.978)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.CustomizationMenuScale = 0.016
	SWEP.ReticleInactivityPostFire = 0.6

	SWEP.AttachmentModelsVM = {
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "body", rel = "", pos = Vector(2.596, 2.25, -0.5), angle = Angle(90, 90, 0), size = Vector(0.25, 0.25, 0.25)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "body", rel = "", pos = Vector(-5.715, 1.557, -0.401), angle = Angle(0, 0, 90), size = Vector(0.349, 0.349, 0.349)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "body", rel = "", pos = Vector(6.752, -1.5, -0.331), angle = Angle(-90, -90, 0), size = Vector(0.649, 0.649, 0.649)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "body", rel = "", pos = Vector(10.899, -5.901, -0.7), angle = Angle(0, -180, -90), size = Vector(0.75, 0.75, 0.75)},
		["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "body", rel = "", pos = Vector(5.714, -1.601, -0.225), angle = Angle(-90, -90, 0), size = Vector(0.649, 0.649, 0.649)},
	}
	
	SWEP.LuaViewmodelRecoil = true
	SWEP.LuaVMRecoilAxisMod = {vert = 1.5, hor = 2, roll = 1, forward = 1, pitch = 1}
	
	SWEP.LaserPosAdjust = Vector(0, 0, 0)
	SWEP.LaserAngAdjust = Angle(5, 177, 0)
	
	
end

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = false

	SWEP.Attachments = {
	[1] = {header = "Sight", offset = {200, -300}, atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
	//[2] = {header = "Rail", offset = {-350, 300}, atts = {"md_anpeq15"}},
	//["+reload"] = {header = "Ammo", offset = {-350, -100}, atts = {"am_slugrounds", "am_flechetterounds"}},
	}

	
SWEP.Animations = {
	fire = {"shoot1", "shoot2"},
	reload_start = "start_reload",
	insert = "insert",
	reload_end = "after_reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {start_reload = {{time = 0.05, sound = "CW_FOLEY_LIGHT"}},
	insert = {{time = 0.1, sound = "CW_A35_INSERT"}},
	
	after_reload = {{time = 0.1, sound = "CW_A35_PUMP"},
	{time = 0.6, sound = "CW_FOLEY_LIGHT"}},
	
	}//draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"},
	//{time = 0.55, sound = "CW_A35_PUMP"}}}

SWEP.SpeedDec = 15

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.AimViewModelFOV = 50
SWEP.ViewModelFOV	= 70
SWEP.ViewModelFlip	= true
SWEP.ViewModel		= "models/weapons/a35/v_mgl_cwwsa35.mdl"
SWEP.WorldModel		= "models/weapons/a35/w_mgl_cwwsa35.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/a35/w_mgl_cwwsa35.mdl"
SWEP.WMPos = Vector(-1, 5, 0)
SWEP.WMAng = Vector(0, 0, 180)
SWEP.CustomizationMenuScale = 0.01

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 6
SWEP.Primary.DefaultClip	= 6
SWEP.Primary.Automatic		= false

if haveWeapon then
	SWEP.Primary.Ammo			= "40mm"
else
	SWEP.Primary.Ammo			= "7.62x51MM"
end

SWEP.FireDelay = 0.25
SWEP.FireSound = "CW_A35_FIRE"
SWEP.Recoil = 10

SWEP.HipSpread = 0.05
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.9
SWEP.MaxSpreadInc = 0.06
SWEP.ClumpSpread = 0.013
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 12
SWEP.Damage = 10
SWEP.DeployTime = 1

SWEP.ReloadStartTime = 0.3
SWEP.InsertShellTime = 0.5
SWEP.ReloadFinishWait = 1
SWEP.ShotgunReload = true
SWEP.Primary.TakeAmmo	= 1
SWEP.Chamberable = false

if haveWeapon then
function SWEP:PrimaryAttack()

	local tr = self.Owner:GetEyeTrace()

	if ( !self:CanPrimaryAttack() ) then return end
	self.Reloadaftershoot = CurTime() + self.FireDelay
	self.Weapon:TakePrimaryAmmo( 1 )
	self.Weapon:SetNextPrimaryFire(CurTime() + self.FireDelay)
	self.Weapon:EmitSound( Sound("weapons/A35CW/xm1014-1.wav") )  
	if SERVER then
		//a35_grenade
			local ent = ents.Create ("tempa35_grenade")
			local PlayerAim = self.Owner:GetAimVector()

			local v = self.Owner:GetShootPos()
				v = v + self.Owner:GetForward() * 5
				v = v + self.Owner:GetRight() * 9
				v = v + self.Owner:GetUp() * -8.5
			ent:SetPos( v )

			ent:SetAngles(PlayerAim:Angle())
			ent.GrenadeOwner = self.Owner
			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			local shot_length = tr.HitPos:Length()

			self.Force = 10	--velocity of object

			phys:ApplyForceCenter(self.Owner:GetAimVector() * self.Force * 10000 + Vector(0 ,0 ,0))
			
			self.Owner:ViewPunch(Angle(math.Rand(-0.5,-2.5) * (self.Recoil), math.Rand(-1,1) * (self.Recoil), 0))	
	end
end
end