brawl.vote = { maps = {}, modes = {}, active = false }
function brawl.VoteStart()

	SetGlobalInt( "brawl.RoundState", 101 )

	for mode, data in pairs( brawl.modes.registered ) do
		brawl.vote.modes[ mode ] = { name = data.name, votes = 0 }
	end

	local mapsLeft = 8
	for map, data in RandomPairs( brawl.config.maps ) do
		if mapsLeft <= 0 then break end
		if map == game.GetMap() then continue end
		brawl.vote.maps[ map ] = { name = data.name, votes = 0 }
		mapsLeft = mapsLeft - 1
	end

	for k, ply in pairs( player.GetAll() ) do
		ply.lastModeVote = nil
		ply.lastMapVote = nil
	end

	net.Start( "brawl.vote.start" )
		net.WriteTable( brawl.vote.modes )
		net.WriteTable( brawl.vote.maps )
	net.Broadcast()

	timer.Simple( 31, brawl.VoteEnd )
	brawl.vote.active = true

end

function brawl.VoteEnd()

	local winnerModes = table.GetWinningByMember( brawl.vote.modes, "votes" )
	local winnerMaps = table.GetWinningByMember( brawl.vote.maps, "votes" )

	local modeData, mode = table.Random( winnerModes )
	local mapData, map = table.Random( winnerMaps )


	net.Start( "brawl.vote.finish" )
		net.WriteString( modeData.name )
		net.WriteString( mapData.name )
	net.Broadcast()

	GetConVar( "brawl_nextmode" ):SetString( mode )
	timer.Simple( 5, function() RunConsoleCommand( "changelevel", map ) end)

	brawl.vote.active = false

end

-- ULib.ucl.registerAccess( "brawl_double_vote", ULib.ACCESS_SUPERADMIN, "Double weight in votes", "Brawl" )
net.Receive( "brawl.vote.update", function( len, ply )

	if not brawl.vote.active then return end

	local isMode = net.ReadBool()
	local choise = net.ReadString()

	local data = {}
	local function send()
		net.Start( "brawl.vote.update" )
			net.WriteBool( isMode )
			net.WriteTable( data )
		net.Broadcast()
	end

	local voteWeight = ply:GetVoteWeight()
	if isMode then
		local lastChoise = ply.lastModeVote
		if lastChoise then
			brawl.vote.modes[ lastChoise ].votes = brawl.vote.modes[ lastChoise ].votes - voteWeight
			data[ lastChoise ] = brawl.vote.modes[ lastChoise ].votes
			if lastChoise == choise then
				ply.lastModeVote = nil
				send()
				return
			end
		end

		brawl.vote.modes[ choise ].votes = brawl.vote.modes[ choise ].votes + voteWeight
		data[ choise ] = brawl.vote.modes[ choise ].votes
		ply.lastModeVote = choise
	else
		local lastChoise = ply.lastMapVote
		if lastChoise then
			brawl.vote.maps[ lastChoise ].votes = brawl.vote.maps[ lastChoise ].votes - voteWeight
			data[ lastChoise ] = brawl.vote.maps[ lastChoise ].votes
			if lastChoise == choise then
				ply.lastMapVote = nil
				send()
				return
			end
		end

		brawl.vote.maps[ choise ].votes = brawl.vote.maps[ choise ].votes + voteWeight
		data[ choise ] = brawl.vote.maps[ choise ].votes
		ply.lastMapVote = choise
	end

	send()

end)

local meta = FindMetaTable "Player"

function meta:GetVoteWeight()

	return 1 + math.floor( self:GetLevel() / 10 )

end

concommand.Add( "brawl_vote", function( ply, cmd, args, argStr )

	if not ply:IsSuperAdmin() then
		brawl.Notify( ply, "You need to be superadmin for that", "error" )
		return
	end

	brawl.VoteStart()

end)
