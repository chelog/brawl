brawl.modes = {
	registered = {}
}

function brawl.modes.register( name, t )

	if not brawl.modes.registered[ name ] then
		brawl.modes.registered[ name ] = t
		brawl.msg( "Registered mode: %s", name )
	else
		brawl.msg( "[ERROR] Mode %s is already registered!", name )
	end

end

net.Receive( "brawl.endRound", function( len )

	local data = net.ReadTable()

	LocalPlayer():EmitSound( "brawl/round-end.ogg", 100 )

end)

local path = brawl.getModulePath( "base", true )
includeFolder( path .. "/client/modes" )
