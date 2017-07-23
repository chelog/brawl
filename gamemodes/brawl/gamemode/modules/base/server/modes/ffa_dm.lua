local mode = {
    name = "FFA Deathmatch",
    maxRounds = 1,
    maxKills = 20,
    agenda = "Have 20 kills to win",
}

function mode.Think()

    if GetGlobalInt( "brawl.RoundState" ) < 3 then
        for k, ply in pairs( player.GetAll() ) do
            if not IsValid( ply ) then continue end
            if ply:Frags() >= mode.maxKills then
                brawl.EndRound({
                    winner = ply
                })
            end
        end
    end

end

local intermissionTime = 10
function mode.EndRound( data )

    if data.winner then
        local ply = data.winner
        if not IsValid( ply ) then return end

        timer.Simple( intermissionTime, brawl.NewRound )
        SetGlobalFloat( "RoundStart", CurTime() + intermissionTime )

        SetGlobalInt( "brawl.RoundState", 3 )
        brawl.NotifyAll({
			Color(255,212,50), ply:Name(),
			color_white, " won the round!"
		})

        ply:AddXP( 1000, "Round winner" )
    end

end

function mode.NewRound( type )

    game.CleanUpMap()
    brawl.CleanUpMap()

    for k, ply in pairs( player.GetAll() ) do
        if not ply:GetNWBool( "SpectateOnly" ) then
            ply:SetFrags( 0 )
            ply:SetDeaths( 0 )
            ply:KillSilent()
            ply:UnSpectate()
            ply:SetNWBool( "Spectating", false )
            ply:Spawn()
            ply:Freeze( true )
        end
    end

    SetGlobalInt( "brawl.RoundState", 1 )

    timer.Simple( 5, function()
        for k, ply in pairs( player.GetAll() ) do
            ply:Freeze( false )
        end

        SetGlobalInt( "brawl.RoundState", 2 )
        brawl.NotifyAll( "A new round has started!" )
    end)

end

function mode.PlayerSpawn( ply )

    local spawn = brawl.spawn.findFarthest( ply )
    if spawn.pos then ply:SetPos( spawn.pos + Vector(0,0,5) ) end
    if spawn.ang then ply:SetEyeAngles( spawn.ang ) end

    ply:LoadModel()
    ply:LoadWeapons()
    ply:LoadSkills()

end

function mode.DeathThink( ply )

    local spawnTime = ply:GetNWFloat( "RespawnTime" )

    if CurTime() >= spawnTime then
        if ply:GetNWBool( "SpectateOnly" ) then
            ply:StartSpectating()
        else
            ply:Spawn()
        end
    end

    return false

end

function mode.PlayerCanTalkTo( listener, talker, team, text )

    return true

end

function mode.PlayerCanSpectate( ply, ent )

    return true

end

function mode.PlayerInitialSpawn( ply )

    timer.Simple(0, function()
        ply:KillSilent()
        ply:SetNWFloat( "RespawnTime", CurTime() + 5 )
        ply:SetTeam( 1001 )
        ply:SetScore( -1 )
    end)

end

function mode.PlayerDeath( ply )

    ply:SetNWFloat( "RespawnTime", CurTime() + 8 )

end

brawl.modes.register( "ffa_dm", mode )
