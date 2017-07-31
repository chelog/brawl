local att = {}
att.name = "am_7n31"
att.displayName = "9x19 7N31"
att.displayNameShort = "7N31"

att.statModifiers = {DamageMult = 0.25,
	RecoilMult = -0.15,
	HipSpreadMult = -0.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {[1] = {t = "Overpressure armor piercing round.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)