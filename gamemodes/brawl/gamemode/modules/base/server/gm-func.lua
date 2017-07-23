GM = GM or GAMEMODE

function GM:InitPostEntity ()

    brawl.CleanUpMap()

end

hook.Add( "ChatText", "hide_joinleave", function( index, name, text, typ )
	if ( typ == "joinleave" ) then return true end
end)

gameevent.Listen("player_connect")
gameevent.Listen("player_disconnect")
hook.Add("player_connect", "ShowConnect", function( data )

    local steamID = data.networkid
    local name = data.name
    brawl.NotifyAll( name .. " joined the game!", "join" )

end)

hook.Add("player_disconnect", "ShowDisconnect", function( data )

    local steamID = data.networkid
    local name = data.name
    brawl.NotifyAll( name .. " left the game", "leave" )

end)

function brawl.CleanUpMap()

    brawl.msg( "Cleaning up map" )
    for k, ent in pairs( ents.GetAll() ) do

        local class = ent:GetClass()
        if class and string.StartWith( class, "item" ) or string.StartWith( class, "weapon" ) then
            ent:Remove()
        end

    end

end

function GM:PlayerInitialSpawn( ply )

    brawl.PlayerInitialSpawn( ply )

end

function GM:PlayerSpawn ( ply )

	if not IsValid(ply) then return end

    brawl.modes.active.PlayerSpawn( ply )

	ply.BabyGod = true
    timer.Simple( 3, function()
        ply.BabyGod = false
    end)

end

function GM:DoPlayerDeath( victim, attacker, dmg )

    brawl.DoPlayerDeath( victim, attacker, dmg )
    victim:DoPlayerDeath( attacker, dmg )

end

function GM:PlayerDeath( ply )

    brawl.PlayerDeath( ply )

end

function GM:PlayerCanHearPlayersVoice( listener, talker )

    return brawl.PlayerCanTalkTo( listener, talker, true )

end

function GM:PlayerCanSeePlayersChat( text, team, listener, talker )

	if talker == NULL then return true end
    return brawl.PlayerCanTalkTo( listener, talker, team, text )

end

local damage = {
    [1] = 2.5,
    [2] = 1.5,
    [3] = 1,
    [4] = 0.5,
    [5] = 0.5,
    [6] = 0.5,
    [7] = 0.5
}

function GM:ScalePlayerDamage( ply, hitGroup, dmg )

	ply.lastHitGroup = hitGroup
    ply:SetNWFloat( "LastHit", CurTime() )

    dmg:ScaleDamage( damage[ hitGroup ] or 1 )

end

function GM:EntityTakeDamage( ent, dmg )

    if ent.ULXHasGod or ent.BabyGod then
		dmg:SetDamage( 0 )
		return
	end

    local damage = dmg:GetDamage()

    local attacker = dmg:GetAttacker()
    if ent:IsPlayer() then
        net.Start( "brawl.hit" )
            net.WriteTable({
                victim = ent,
                attacker = dmg:GetAttacker(),
                inflictor = dmg:GetInflictor(),
                damage = damage,
                pos = dmg:GetDamagePosition(),
                type = dmg:GetDamageType()
            })
        net.Send({ attacker:IsPlayer() and attacker, ent })
    end

    ent:SetHealth( ent:Health() - damage )
    if ent:IsPlayer() then
        ent:ViewPunch( Angle(
            math.random( -damage, damage ) / 3,
            math.random( -damage, damage ) / 3,
            math.random( -damage, damage ) / 6
        ))
    end

	if not ent.attacks then ent.attacks = {} end
	if IsValid( dmg:GetAttacker() ) then
		ent.attacks[ dmg:GetAttacker() ] = ent.attacks[ dmg:GetAttacker() ] or {}
		local data = ent.attacks[ dmg:GetAttacker() ]
		data.lastHit = CurTime()
		data.dmg = data.dmg and (data.dmg + damage) or damage
	end

    dmg:SetDamage( 0 )

end

function GM:GetFallDamage( ply, vel )

    return vel / 6

end

function GM:PlayerCanPickupWeapon( ply, wep )

    if not ply:CanPickupWeapon( wep ) then return end
    return true

end

function GM:PlayerDeathThink( ply )

    brawl.DeathThink( ply )

end

function GM:PlayerDeathSound()

    return true

end
