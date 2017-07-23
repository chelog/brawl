include('shared.lua')

ENT.hintAl = 0
function ENT:Draw()

	local pos = self:GetPos()
	local fadeIn = LocalPlayer():GetShootPos():DistToSqr( pos ) < 9000
	self.hintAl = math.Approach( self.hintAl, fadeIn and 255 or 0, FrameTime() * 1000 )

	self:DrawModel()

	if not self.WeaponName then
		local data = weapons.GetStored( self:GetNWString( "WeaponClass" ) )
		self.WeaponName = data and data.PrintName
	end

	local dir = LocalPlayer():GetPos() - pos
	local ang = Angle( 0, self:GetAngles().y, 0)
	if self.WeaponName and self.hintAl > 0 then
		cam.Start3D2D( pos + Vector( 0,0,5 ), ang, 0.1 )
			draw.SimpleText( self.WeaponName, "brawl.hud.large", 1, 1, Color( 0,0,0, self.hintAl ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.SimpleText( self.WeaponName, "brawl.hud.large", 0, 0, Color( 220,220,220, self.hintAl ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		cam.End3D2D()
	end

end
