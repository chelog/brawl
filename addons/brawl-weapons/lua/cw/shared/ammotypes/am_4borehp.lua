local att = {}
att.name = "am_4borehp"
att.displayName = "Overpressure Hollowpoint Rounds"
att.displayNameShort = "HP"

att.statModifiers = {DamageMult = 1,
	RecoilMult = 1}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {[1] = {t = "Are you hunting dinosaurs?", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
	self:updateSoundTo("CWM1911A1_FIRE_BF4", CustomizableWeaponry.sounds.UNSUPPRESSED)
end

function att:detachFunc()
	self:unloadWeapon()
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)