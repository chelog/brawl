function brawl.Notify( ply, text, t )

    if not IsValid( ply ) then return end
    net.Start( "brawl.notify" )
        net.WriteTable({
            text = text,
            type = t or "info"
        })
    net.Send( ply )

end

function brawl.NotifyAll( text, t )

    for k, ply in pairs( player.GetAll() ) do
        brawl.Notify( ply, text, t )
    end

    brawl.msg( "[NotifyAll] %s", text )

end

local meta = FindMetaTable "Player"

function meta:Notify( text, t )

    brawl.Notify( self, text, t )

end

concommand.Add( "brawl_notify", function( ply, cmd, args, argStr )

    brawl.NotifyAll( argStr, "other" )

end)

local path = brawl.getModulePath( "base", true )
AddCSLuaFolder( path .. "/client/vgui" )
