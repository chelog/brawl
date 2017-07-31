AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")
//SCK name: JNG

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "MKEK JNG-90"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 1.15
	
	SWEP.IconLetter = "i"
	killicon.Add("cw_jng90", "vgui/kills/cw_jng90", Color(255, 80, 0, 150))
	SWEP.SelectIcon = surface.GetTextureID("vgui/kills/cw_jng90")
	
	SWEP.MuzzleEffect = "muzzleflash_g3"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = 4, y = 0, z = -3}
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.9
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.8
	SWEP.FireMoveMod = 0.6
	
	SWEP.IronsightPos = Vector(-2.84, -2.5, 1.31)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	
	//Troy sights
	SWEP.TroySightPos = Vector(-2.85, 0, 0.239)
	SWEP.TroySightAng = Vector(0.649, 0.035, 0)
	SWEP.FoldSightPos = Vector(-2.85, 0, 0.239)
	SWEP.FoldSightAng = Vector(0.649, 0.035, 0)
	
	SWEP.CoD4ReflexPos = Vector(-2.825, 0, 0.3)
	SWEP.CoD4ReflexAng = Vector(0.649, 0.035, 0)

	SWEP.EoTech552Pos = Vector(-2.77, 0, 0.10)
	SWEP.EoTech552Ang = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.875, 0, 0.2)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.EoTech553Pos = Vector(-2.83, 0, 0.25)
	SWEP.EoTech553Ang = Vector(0, 0, 0)
	
	SWEP.AimpointPos = Vector(-2.83, 0, 0.485)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos = Vector(-2.84, 0, 0.74)
	SWEP.CoD4TascoAng = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos = Vector(-2.8, 0, 0.529)
	SWEP.FAS2AimpointAng = Vector(0, 0, 0)

	SWEP.MicroT1Pos = Vector(-2.846, 0, 0.449)
	SWEP.MicroT1Ang = Vector(0, 0, 0)
	
	SWEP.CoD4ACOGPos = Vector(-2.8, 0, 0.06)
	SWEP.CoD4ACOGAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-2.846, 0, 0.05)
	SWEP.ACOGAng = Vector(0, 0, 0)
	
	SWEP.LeupoldPos = Vector(-2.84, 0, 0.079)
	SWEP.LeupoldAng = Vector(0, 0, 0)
	SWEP.LeupoldAxisAlign = {right = 1, up = 0, forward = 0}
	
	SWEP.HoloPos = Vector(-2.836, 0, 0.125)
	SWEP.HoloAng = Vector(0.85, 0, 0)
	
	SWEP.BackupSights = {["md_acog"] = {[1] = Vector(-2.836, 0, -0.9), [2] = Vector(0, 0, 0)}}

	SWEP.SightWithRail = false
	SWEP.ACOGAxisAlign = {right = 0, up = 0, forward = 0}
	SWEP.CoD4ACOGAxisAlign = {right = -1, up = 180.05, forward = 0}
	
	SWEP.RscopePos  = Vector(-2.86, 0, 0.54)
	SWEP.RscopeAng = Vector(0 ,0, 0)
	SWEP.BFRIFLEAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.MW3SPos  = Vector(-2.82, 0, -0.06)
	SWEP.MW3SAng = Vector(0 ,0 , 0)
	SWEP.MW3SAxisAlign = {right = 0, up = 0, forward = 0}
	
	SWEP.BackupReflexPos = Vector(-4.45, 0, 0.99)
	SWEP.BackupReflexAng = Vector(0, 1, -45)	
	
	SWEP.CantedPos = Vector(-4.16, -1.609, 1.039)
	SWEP.CantedAng = Vector(0, 0, -45)
	
	SWEP.MagnifierPos = Vector(-2.856, 0, 0.209)
	SWEP.MagnifierAng = Vector(0, 0, 0)
	
	//Magnifer scopes
	SWEP.MagnifierScopeAxisAlign = {right = 1, up = 0, forward = 0}
	
	SWEP.CoD4ReflexPos_mag3x = Vector(-2.825, 0, 0.2)
	SWEP.CoD4ReflexAng_mag3x = Vector(0, 0.035, 0)
	
	SWEP.EoTech552Pos_mag3x = Vector(-2.83, 0, 0.15)
	SWEP.EoTech552Ang_mag3x = Vector(0, 0, 0)
	
	SWEP.EoTech553Pos_mag3x = Vector(-2.85, 0, 0.08)
	SWEP.EoTech553Ang_mag3x = Vector(0, 0, 0)
	
	SWEP.CoD4TascoPos_mag3x = Vector(-2.84, 0, 0.365)
	SWEP.CoD4TascoAng_mag3x = Vector(0, 0, 0)
	
	SWEP.FAS2AimpointPos_mag3x = Vector(-2.85, 0, 0.2)
	SWEP.FAS2AimpointAng_mag3x = Vector(0, 0, 0)
	
	SWEP.HoloPos_mag3x = Vector(-2.836, 0, 0.125)
	SWEP.HoloAng_mag3x = Vector(0.85, 0, 0)
	
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)

	if CustomizableWeaponry_KK_HK416 then
	SWEP.AttachmentModelsVM = {
	
		["md_backup_reflex_rail"] = { type = "Model", model = "models/c_angled_rails.mdl", bone = "gun-main", rel = "", pos = Vector(9, -1.558, 0.3), angle = Angle(0, -180, 0), size = Vector(1.2, 1.2, 1.2)},
		["md_backup_reflex"] = { type = "Model", model = "models/c_docter.mdl", bone = "gun-main", rel = "", pos = Vector(10, -2.1, 1.1), angle = Angle(0, 0, -45), size = Vector(0.898, 0.898, 0.898)},
		["md_cantedsights"] = { type = "Model", model = "models/rageattachments/cantedsightfront.mdl", bone = "gun-main", rel = "", pos = Vector(9.869, -2.151, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_couldbewhat"] = { type = "Model", model = "models/rageattachments/cantedsightrear.mdl", bone = "gun-main", rel = "", pos = Vector(0.3, -1.9, -0.101), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},

		["md_troyrearsight_kk"] = { type = "Model", model = "models/c_troy_sight_rear.mdl", bone = "gun-main", rel = "", pos = Vector(7, -1.851, -0.101), angle = Angle(0, 0, -90), size = Vector(1.149, 1.149, 1.149), active = true },
		["md_troyfrontsight_kk"] = { type = "Model", model = "models/c_troy_sight_front.mdl", bone = "gun-main", rel = "", pos = Vector(9.869, -1.89, -0.101), angle = Angle(180, -180, 90), size = Vector(1.149, 1.149, 1.149), active = true },
		["larue_mount"] = { type = "Model", model = "models/c_larue_kkhx.mdl", bone = "gun-main", rel = "", pos = Vector(5.714, -2.5, -0.35), angle = Angle(0, 0, -90), size = Vector(1.1, 1.1, 1.1)},
		["md_magnifier_scope"] = { type = "Model", model = "models/c_magnifier_scope.mdl", bone = "gun-main", rel = "", pos = Vector(7.791, -1.9, -0.101), angle = Angle(0, 0, -90), size = Vector(1.149, 1.149, 1.149), adjustment = {min = 5.85, max = 15, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_bfriflescope"] = { type = "Model", model = "models/rageattachments/sniperscopesv.mdl", bone = "gun-main", rel = "", pos = Vector(2.596, -2.151, -0.051), angle = Angle(90, -90, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = 0.15, max = 9, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_mw3scope"] = { type = "Model", model = "models/rageattachments/v_msrscope.mdl", bone = "gun-main", rel = "", pos = Vector(3.63, -1.491, -0.25), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75), adjustment = {min = 1.2, max = 9, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_eotech"] = { type = "Model", model = "models/c_fas2_eotech.mdl", bone = "gun-main", rel = "", pos = Vector(6.699, -1.8, -0.13), angle = Angle(0, 0, -90), size = Vector(1.149, 1.149, 1.149), adjustment = {min = 4.3, max = 13, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_eotech_stencil"] = { type = "Model", model = "models/c_fas2_eotech_stencil.mdl", bone = "gun-main", rel = "", pos = Vector(6.699, -1.8, -0.13), angle = Angle(0, 0, -90), size = Vector(1.149, 1.149, 1.149)},
		["md_lasersight"] = { type = "Model", model = "models/rageattachments/anpeqbf.mdl", bone = "gun-main", rel = "", pos = Vector(11.7, -0.401, -1.1), angle = Angle(0, 0, -90), size = Vector(0.75, 1, 1)},
		//["md_foregrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "gun-main", rel = "", pos = Vector(-3.636, 2, 0), angle = Angle(-90, 0, -90), size = Vector(0.75, 0.75, 0.75)},
		["md_fas2_holo"] = { type = "Model", model = "models/v_holo_sight_kkrc.mdl", bone = "gun-main", rel = "", pos = Vector(1, 1.1, -0.11), angle = Angle(0, 0, -90), size = Vector(0.648, 0.648, 0.648), adjustment = {min = -2, max = 7, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_holo_aim"] = { type = "Model", model = "models/v_holo_sight_orig_hx.mdl", bone = "gun-main", rel = "", pos = Vector(1, 1.1, -0.11), angle = Angle(0, 0, -90), size = Vector(0.648, 0.648, 0.648)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "gun-main", rel = "", pos = Vector(10, -1.558, -0.9), angle = Angle(0, -180, 180), size = Vector(0.699, 0.699, 0.699)},
		["md_cod4_acog_v2"] = { type = "Model", model = "models/v_cod4_acog.mdl", bone = "gun-main", rel = "", pos = Vector(0, 0.25, -0.151), angle = Angle(0, -180, 90), size = Vector(0.898, 0.898, 0.898), adjustment = {min = -2.85, max = 5.5, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_aimpoint"] = { type = "Model", model = "models/c_fas2_aimpoint_rigged.mdl", bone = "gun-main", rel = "", pos = Vector(6.5, -1.601, -0.151), angle = Angle(0, 0, -90), size = Vector(1.149, 1.149, 1.149), adjustment = {min = 3.8, max = 12.5, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "gun-main", rel = "", pos = Vector(-2.597, 2.7, 0.1), angle = Angle(-90, 90, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = -5.2, max = 3.8, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_cod4_aimpoint_v2"] = { type = "Model", model = "models/v_cod4_aimpoint.mdl", bone = "gun-main", rel = "", pos = Vector(-1.558, 0.55, -0.115), angle = Angle(-180, 0, -90), size = Vector(0.898, 0.898, 0.898), adjustment = {min = -3.5, max = 4.2, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_cod4_eotech_v2"] = { type = "Model", model = "models/v_cod4_eotech.mdl", bone = "gun-main", rel = "", pos = Vector(-1.558, 0.5, -0.151), angle = Angle(0, -180, 90), size = Vector(0.898, 0.898, 0.898), adjustment = {min = -3.2, max = 4.5, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_hk416_bipod"] = { type = "Model", model = "models/c_bipod.mdl", bone = "gun-main", rel = "", pos = Vector(9, 0.5, 0), angle = Angle(-90, 90, 0), size = Vector(1.2, 1.2, 1.2)},
		["md_cod4_reflex"] = { type = "Model", model = "models/v_cod4_reflex.mdl", bone = "gun-main", rel = "", pos = Vector(-0.519, 0.349, -0.101), angle = Angle(-180, 0, -90), size = Vector(0.85, 0.85, 0.85), adjustment = {min = -3.5, max = 5.85, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_fas2_leupold_mount"] = { type = "Model", model = "models/v_fas2_leupold_mounts.mdl", bone = "gun-main", rel = "", pos = Vector(1.5, -3.636, -0.101), angle = Angle(0, 0, -90), size = Vector(1.799, 1.799, 1.799)},
		["md_fas2_leupold"] = { type = "Model", model = "models/v_fas2_leupold.mdl", bone = "gun-main", rel = "", pos = Vector(2, -3.701, -0.101), angle = Angle(0, 0, -90), size = Vector(1.799, 1.799, 1.799)},
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "gun-main", rel = "", pos = Vector(5.714, -1.851, -2.5), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun-main", rel = "", pos = Vector(-7.801, 8.25, -0.35), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), adjustment = {min = -10.7, max = -1.5, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "gun-main", rel = "", pos = Vector(2.596, -2.6, -0.12), angle = Angle(90, 0, -90), size = Vector(0.4, 0.4, 0.4), adjustment = {min = -0.1, max = 10, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "gun-main", rel = "", pos = Vector(-2, 2.65, 0.215), angle = Angle(-90, 90, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = -4.9, max = 4, axis = "x", inverse = true, inverseOffsetCalc = true}}
	}
	else
		SWEP.AttachmentModelsVM = {
		["md_cantedsights"] = { type = "Model", model = "models/rageattachments/cantedsightfront.mdl", bone = "gun-main", rel = "", pos = Vector(9.869, -2.151, 0), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_couldbewhat"] = { type = "Model", model = "models/rageattachments/cantedsightrear.mdl", bone = "gun-main", rel = "", pos = Vector(0.3, -1.9, -0.101), angle = Angle(0, 0, -90), size = Vector(1, 1, 1)},
		["md_bfriflescope"] = { type = "Model", model = "models/rageattachments/sniperscopesv.mdl", bone = "gun-main", rel = "", pos = Vector(2.596, -2.151, -0.051), angle = Angle(90, -90, 0), size = Vector(0.8, 0.8, 0.8), adjustment = {min = 0.15, max = 9, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_mw3scope"] = { type = "Model", model = "models/rageattachments/v_msrscope.mdl", bone = "gun-main", rel = "", pos = Vector(3.63, -1.491, -0.25), angle = Angle(0, 0, -90), size = Vector(0.75, 0.75, 0.75), adjustment = {min = 1.2, max = 9, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_lasersight"] = { type = "Model", model = "models/rageattachments/anpeqbf.mdl", bone = "gun-main", rel = "", pos = Vector(11.7, -0.401, -1.1), angle = Angle(0, 0, -90), size = Vector(0.75, 1, 1)},
		//["md_foregrip"] = { type = "Model", model = "models/wystan/attachments/foregrip1.mdl", bone = "gun-main", rel = "", pos = Vector(-3.636, 2, 0), angle = Angle(-90, 0, -90), size = Vector(0.75, 0.75, 0.75)},
		["md_anpeq15"] = { type = "Model", model = "models/cw2/attachments/anpeq15.mdl", bone = "gun-main", rel = "", pos = Vector(10, -1.558, -0.9), angle = Angle(0, -180, 180), size = Vector(0.699, 0.699, 0.699)},
		["md_aimpoint"] = { type = "Model", model = "models/wystan/attachments/aimpoint.mdl", bone = "gun-main", rel = "", pos = Vector(-2.597, 2.7, 0.1), angle = Angle(-90, 90, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = -5.2, max = 3.8, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_saker"] = { type = "Model", model = "models/cw2/attachments/556suppressor.mdl", bone = "gun-main", rel = "", pos = Vector(5.714, -1.851, -2.5), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_eotech"] = { type = "Model", model = "models/wystan/attachments/2otech557sight.mdl", bone = "gun-main", rel = "", pos = Vector(-7.801, 8.25, -0.35), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), adjustment = {min = -10.7, max = -1.5, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_microt1"] = { type = "Model", model = "models/cw2/attachments/microt1.mdl", bone = "gun-main", rel = "", pos = Vector(2.596, -2.6, -0.12), angle = Angle(90, 0, -90), size = Vector(0.4, 0.4, 0.4), adjustment = {min = -0.1, max = 10, axis = "x", inverse = true, inverseOffsetCalc = true}},
		["md_acog"] = { type = "Model", model = "models/wystan/attachments/2cog.mdl", bone = "gun-main", rel = "", pos = Vector(-2, 2.65, 0.215), angle = Angle(-90, 90, 0), size = Vector(0.898, 0.898, 0.898), adjustment = {min = -4.9, max = 4, axis = "x", inverse = true, inverseOffsetCalc = true}}
	}
	end
	
	if CustomizableWeaponry_KK_HK416 then
	function SWEP:RenderTargetFunc()
	local wm = self.WMEnt
	local isAiming = self:isAiming()
		
			wm:SetBodygroup(self.SightBGs.main, self.CW_VM:GetBodygroup(self.SightBGs.main))
				local fent = self.AttachmentModelsVM.md_troyfrontsight_kk.ent
				local rent = self.AttachmentModelsVM.md_troyrearsight_kk.ent
			
				if not (self.AimPos == self.TroySightPos and self.AimAng == self.TroySightAng) then
					fent:ManipulateBoneAngles(fent:LookupBone("sight"), Angle(0, 0, -85))
					rent:ManipulateBoneAngles(rent:LookupBone("sight"), Angle(0, 0, -85))
					fent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 850))
					rent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 850))
				else
					fent:ManipulateBoneAngles(fent:LookupBone("sight"), Angle(0, 0, 0))
					rent:ManipulateBoneAngles(rent:LookupBone("sight"), Angle(0, 0, 0))
					fent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 0))
					rent:ManipulateBonePosition(rent:LookupBone("boner"), Vector(0, 0, 0))
				end
				
				
				if self.ActiveAttachments.md_magnifier_scope then
				if self.ActiveAttachments.md_cod4_reflex then
					self.AttachmentModelsVM.larue_mount.active = true
				end
				
				if self.ActiveAttachments.md_cod4_aimpoint_v2 then
					self.AttachmentModelsVM.larue_mount.active = true
					self.AttachmentModelsVM.md_cod4_aimpoint_v2.ent:SetBodygroup(1,1)
				end	
			else
				self.AttachmentModelsVM.larue_mount.active = false
				self.AttachmentModelsVM.md_cod4_aimpoint_v2.ent:SetBodygroup(1,0)
			end		
			
		end
	end
	
	
	SWEP.ForeGripHoldPos = {
		["arm_controller_01"] = { scale = Vector(1, 1, 1), pos = Vector(-1.329, -8.544, -3.228), angle = Angle(19.367, -37.596, 67.214) }
	}
	
	SWEP.AttachmentPosDependency = {
		["md_fas2_aimpoint"] = {
			["md_magnifier_scope"] = Vector(9, -2, -0.1),
		},
		["md_fas2_eotech"] = {
			["md_magnifier_scope"] = Vector(9, -2, -0.1),
		},
		["md_cod4_reflex"] = {
			["md_magnifier_scope"] = Vector(1.5, 0.1,-0.1),
		},
		["md_cod4_aimpoint_v2"] = {
			["md_magnifier_scope"] = Vector(1.5, 0.1,-0.1),
		},		
		["md_cod4_eotech_v2"] = {
			["md_magnifier_scope"] = Vector(1.5, 0.5,-0.1),
		},
		["md_fas2_holo"] = {
			["md_magnifier_scope"] = Vector(3, 1.1, -0.1),
		},
		}
	
	
	SWEP.CompM4SBoneMod = {}

	SWEP.LuaVMRecoilAxisMod = {vert = 0.5, hor = 1, roll = 1, forward = 0.5, pitch = 0.5}
	if CustomizableWeaponry_Fluffy_Zorua then
		SWEP.LaserPosAdjust = Vector(0, 0, 1.5)
		SWEP.LaserAngAdjust = Angle(1, 0, 0) 
	else
		SWEP.LaserPosAdjust = Vector(0.5, 0, 0)
		SWEP.LaserAngAdjust = Angle(0, 178.85, 3) 
	end
end

SWEP.SightBGs		= {main = 2, carryhandle = 0, foldsight = 2, none = 1, foldfold = 3}
SWEP.ForegripBGs	= {main = 3, regular = 0, covered = 1}
SWEP.MagBGs			= {main = 4, regular = 0, round34 = 1, round100 = 2, round100_empty = 3, none = 4, regular_empty = 5, round34_empty = 6}
SWEP.StockBGs		= {main = 5, regular = 0, heavy = 1, none = 2}
SWEP.SilencerBGs	= {main = 6, off = 0, on = 1, long_off = 2, long_on = 3}
SWEP.LuaViewmodelRecoil = false

SWEP.AttachmentDependencies = {
	["md_magnifier_scope"] = {"md_cod4_reflex","md_cod4_eotech_v2","md_cod4_aimpoint_v2","md_fas2_eotech","md_fas2_aimpoint","md_fas2_holo"},
	["md_cantedsights"] = {"md_bfriflescope", "md_mw3scope"}
}
SWEP.AttachmentExclusions = {
	["md_backup_reflex"] = {"bg_hk416_foldsight", "md_cod4_reflex","md_cod4_eotech_v2","md_cod4_aimpoint_v2","md_fas2_eotech","md_fas2_aimpoint","md_fas2_holo", "md_bfriflescope", "md_mw3scope"}
}

if CustomizableWeaponry_KK_HK416 and CustomizableWeaponry_Fluffy_Zorua then
	SWEP.Attachments = {
		[1] = {header = "Sight", offset = {100, -450},  atts = {"bg_hk416_foldsight", "md_cod4_reflex","md_microt1","md_eotech","md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_acog","md_cod4_acog_v2","md_fas2_holo", "md_fas2_leupold", "md_bfriflescope", "md_mw3scope"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-250, 150}, atts = {"md_hk416_bipod"}},
		[4] = {header = "Rail", offset = {-250, 600}, atts = {"md_lasersight"}},
		[5] = {header = "Hybrid Scopes", offset = {500, 600}, atts = {"md_backup_reflex", "md_magnifier_scope", "md_cantedsights"}},
		["+attack2"] = {header = "Perks", offset = {1300, 300}, atts = {"pk_sleightofhand", "pk_light"}},
		["impulse 100"] = {header = "Skins", offset = {1300, -100}, atts = {"bg_wsjng_paint1", "bg_wsjng_paint2", "bg_wsjng_paint3"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
	elseif CustomizableWeaponry_KK_HK416 then
		SWEP.Attachments = {
		[1] = {header = "Sight", offset = {100, -450},  atts = {"bg_hk416_foldsight", "md_cod4_reflex","md_microt1","md_eotech","md_cod4_eotech_v2", "md_fas2_eotech", "md_aimpoint", "md_cod4_aimpoint_v2","md_fas2_aimpoint","md_acog","md_cod4_acog_v2","md_fas2_holo", "md_fas2_leupold"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-250, 150}, atts = {"md_hk416_bipod"}},
		[4] = {header = "Side Rail Front", offset = {-250, 600}, atts = {"md_anpeq15"}},
		[5] = {header = "Hybrid Sights", offset = {500, 600}, atts = {"md_backup_reflex", "md_magnifier_scope"}},
		["impulse 100"] = {header = "Skins", offset = {1300, -100}, atts = {"bg_wsjng_paint1", "bg_wsjng_paint2", "bg_wsjng_paint3"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}},
	}	
	elseif CustomizableWeaponry_Fluffy_Zorua then
		SWEP.Attachments = {[1] = {header = "Sight", offset = {100, -450},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog", "md_bfriflescope", "md_mw3scope"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Handguard", offset = {-250, 150}, atts = {"md_foregrip", "md_m203"}},
		[4] = {header = "Rail", offset = {-250, 600}, atts = {"md_lasersight"}},
		[5] = {header = "Hybrid Sights", offset = {500, 600}, atts = {"md_cantedsights"}},
		["+reload"] = {header = "Ammo", offset = {800, 100}, atts = {"am_magnum", "am_matchgrade"}},
		["+attack2"] = {header = "Perks", offset = {1300, 300}, atts = {"pk_sleightofhand", "pk_light"}},
		["impulse 100"] = {header = "Skins", offset = {1300, -100}, atts = {"bg_wsjng_paint1", "bg_wsjng_paint2", "bg_wsjng_paint3"}}
	}	
else
	SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -300},  atts = {"md_microt1", "md_eotech", "md_aimpoint", "md_acog"}},
		[2] = {header = "Barrel", offset = {-250, -300},  atts = {"md_saker"}},
		[3] = {header = "Rail", offset = {-250, 600}, atts = {"md_anpeq15"}},
		["impulse 100"] = {header = "Skins", offset = {1300, -100}, atts = {"bg_wsjng_paint1", "bg_wsjng_paint2", "bg_wsjng_paint3"}},
		["+reload"] = {header = "Ammo", offset = {1500, 100}, atts = {"am_magnum", "am_matchgrade"}}
	}
end

SWEP.Animations = {fire = {"J97_fire"},
	reload = "J97_reload",
	idle = "J97_idle",
	draw = "J97_draw"}
	
SWEP.Sounds = {

	J97_reload = {
	[1] = {time = 0.5, sound = "CW_JNG_PULL"},
	[2] = {time = 1, sound = "CW_JNG_MAGOUT"},
	[3] = {time = 1.85, sound = "CW_JNG_MAGIN"},
	[4] = {time = 2.31, sound = "CW_JNG_RELEASE"}},
	
	J97_draw = {[1] = {time = 0.5, sound = "CW_JNG_RELEASE"}},
	
	J97_fire = {
	[1] = {time = 0.3, sound = "CW_JNG_PULL"},
	[2] = {time = 0.5, sound = "CW_JNG_RELEASE"}}
	
	}
	

SWEP.SpeedDec = 35

SWEP.ADSFireAnim = true
SWEP.BipodFireAnim = true
SWEP.AimBreathingIntensity = 1
SWEP.AimBreathingEnabled = true

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"bolt"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0 White Snow"

SWEP.Author			= "White Snow"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 70
SWEP.AimViewModelFOV = 50
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/JNG/v_snip_jngcw.mdl"
SWEP.WorldModel		= "models/weapons/JNG/w_snip_jngcw.mdl"
SWEP.DrawTraditionalWorldModel = false
SWEP.WM = "models/weapons/JNG/w_snip_jngcw.mdl"
SWEP.WMPos = Vector(-1, -1, -0.2)
SWEP.WMAng = Vector(-3,1,180)

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 10
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "7.62x51MM"
SWEP.magType = "srMag"

SWEP.FireDelay = 1
SWEP.FireSound = "CW_JNG_FIRE"
SWEP.FireSoundSuppressed = "CW_JNG_SUB"
SWEP.Recoil = 2.5
SWEP.AimViewModelFOV = 60
SWEP.CustomizationMenuScale = 0.0145
SWEP.ForceBackToHipAfterAimedShot = true
SWEP.GlobalDelayOnShoot = 1.1

SWEP.HipSpread = 0.015
SWEP.AimSpread = 0.00045
SWEP.VelocitySensitivity = 1.8
SWEP.MaxSpreadInc = 0.01
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 0.10
SWEP.Shots = 1
SWEP.Damage = 100
SWEP.DeployTime = 1

SWEP.ReloadSpeed = 1.25
SWEP.ReloadTime = 3.5
SWEP.ReloadTime_Empty = 3.5
SWEP.ReloadHalt = 0.65
SWEP.ReloadHalt_Empty = 0.65
SWEP.Chamberable = false