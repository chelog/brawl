local att = {}
att.name = "bg_mdemag"
att.displayName = "Extended mag"
att.displayNameShort = "Ext Mag"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.10,
OverallMouseSensMult = -0.1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/makarov_extmag")
	att.description = {[1] = {t = "Increases mag capacity by 6.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.mag2)
	self:unloadWeapon()
	self.Primary.ClipSize = 12
	self.Primary.ClipSize_Orig = 12
end

function att:detachFunc() 
	self:setBodygroup(self.MagBGs.main, self.MagBGs.mag1)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)