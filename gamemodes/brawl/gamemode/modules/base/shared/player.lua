local meta = FindMetaTable "Player"

function meta:GetStamina( val )

    return self:GetNWInt( "Stamina", val )

end

function meta:GetHealthStatus()

    local health, status = self:Health(), nil
    if health == 100 then
        status = "healthy"
    elseif health > 75 then
        status = "almost healthy"
    elseif health > 50 then
        status = "wounded"
    elseif health > 25 then
        status = "heavily wounded"
    elseif health > 0 then
        status = "nearly dead"
    else
        status = "dead"
    end

    return status

end

function meta:GetScore()

    return self:GetNWInt( "brawl.score" )

end

function meta:GetWeaponByCategory( cat )

	for k, wep in pairs( self:GetWeapons() ) do
		if wep:GetNWString( "WeaponCategory" ) == cat then
			return wep
		end
	end

end

function meta:SelectWeaponByCategory( cat )

	local wep = self:GetWeaponByCategory( cat )
	if wep then self:SelectWeapon( wep:GetClass() ) end

end

hook.Add( "PlayerFootstep", "brawl.step", function( ply )

    if ply:GetAbsVelocity():LengthSqr() < 16900 then
        return true
    end

end)
