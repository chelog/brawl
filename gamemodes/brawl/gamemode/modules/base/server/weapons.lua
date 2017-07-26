function brawl.AddWeaponClips( ply, wep, num, secondary )

	if isstring( wep ) then wep = ply:GetWeapon( wep ) end
	if not IsValid( ply ) or not IsValid( wep ) then return end

	local ammoType, amount
	if not secondary then
		ammoType = wep:GetPrimaryAmmoType()
		amount = wep:GetMaxClip1() * num
	else
		ammoType = wep:GetSecondaryAmmoType()
		amount = wep:GetMaxClip2() * num
	end

	ply:SetAmmo( ply:GetAmmoCount( ammoType ) + amount, ammoType )

end

concommand.Add( "dropweapon", function( ply, cmd, arg, argStr)

	ply:DropWeapon( ply:GetActiveWeapon() )

end)

net.Receive( "brawl.dropWeapon", function( len, ply )

	local cat = net.ReadString()
	ply:DropWeapon( ply:GetWeaponByCategory( cat ))

end)

net.Receive( "brawl.invalidWeapons", function( len, ply )

	brawl.msg( "%s has invalid weapons, fixing it up", ply:Name() )

	for k, wep in pairs( ply:GetWeapons() ) do
		if wep.noCategory then continue end

		local cat = wep:GetWeaponCategory()
		if cat then
			wep:SetNWString( "WeaponCategory", cat )
		else
			ply:StripWeapon( wep:GetClass() )
		end
	end

end)
