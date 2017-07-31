local att = {}
att.name = "skin_rust"
att.displayName = "Rust"
att.displayNameShort = "Rust"
att.isBG = false

att.statModifiers = {}

if CLIENT then
	att.displayIcon = surface.GetTextureID("entities/scattergun_backcountry_blaster")
	att.description = {[1] = {t = "Skin your weapon.", c = CustomizableWeaponry.textColors.COSMETIC}}
end

function att:attachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(2)
	end
end

function att:detachFunc()
	if SERVER then
		return
	end

	if self.CW_VM then
		self.CW_VM:SetSkin(0)
	end
end

CustomizableWeaponry:registerAttachment(att)