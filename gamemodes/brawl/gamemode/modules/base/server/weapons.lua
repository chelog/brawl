brawl.weapons = {}
for k1, cat in pairs( brawl.config.weapons ) do
    brawl.weapons[ k1 ] = {}
    for k2, wep in pairs( cat ) do
		if istable( wep ) then
			brawl.weapons[ k1 ][ k2 ] = {}
			for k3, wep2 in pairs( wep ) do
		        brawl.weapons[ k1 ][ k2 ][ wep2 ] = true
			end
		else
			brawl.weapons[ k1 ][ wep ] = true
		end
    end
end

function brawl.GetWeaponCategory( class )

    for cat, data in pairs( brawl.weapons ) do
		if data[ class ] == true then
            return cat
        else
			for cat2, data2 in pairs( data ) do
				if not istable( data2 ) then break end
				if data2[ class ] then
					return cat
				end
			end
		end
    end

end

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
    print("brawl.dropWeapon received")
	ply:DropWeapon( ply:GetWeaponByCategory( cat ))
end)
