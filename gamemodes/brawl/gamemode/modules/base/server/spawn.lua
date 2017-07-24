brawl.spawn = {}
brawl.spawns = brawl.spawns or {}

function brawl.spawn.add( t )

	if not t or not t.pos then return end

	table.insert( brawl.spawns, t )
	brawl.spawn.update()

end

function brawl.spawn.remove( id )

	brawl.spawns[ id ] = nil
	brawl.spawn.update()

end

function brawl.spawn.update()

	brawl.spawn.save()

	net.Start( "brawl.spawn" )
		net.WriteTable( brawl.spawns )
	net.Broadcast()

end

function brawl.spawn.findFarthest( ply )

	if not IsValid( ply ) then return end

	local plys = {}
	for k, pl in pairs( player.GetAll() ) do
		if pl == ply or not pl:Alive() or pl:GetNWBool("Spectating") then continue end
		table.insert( plys, pl:GetPos() )
	end

	if table.Count( plys ) < 1 then
		return table.Random( brawl.spawns )
	end

	local farthest, maxDist = table.Random( brawl.spawns ), 0
	math.randomseed( CurTime() )
	for k1, sp in RandomPairs( brawl.spawns ) do
		local minDist
		for k2, plyPos in pairs( plys ) do
			local dist = sp.pos:DistToSqr( plyPos )
			minDist = math.min( minDist or dist, dist )
		end
		if minDist > maxDist then
			maxDist = minDist
			farthest = sp
		end
	end

	return farthest

end

function brawl.spawn.findNearest( ply )

	if not IsValid( ply ) then return end

	local tID = ply:Team()
	local plys = {}
	for k, pl in pairs( player.GetAll() ) do
		if pl == ply or ply:Team() ~= tID or not pl:Alive() or pl:GetNWBool("Spectating") then continue end
		table.insert( plys, pl:GetPos() )
	end

	if table.Count( plys ) < 1 then
		return brawl.spawn.findFarthest( ply )
	end

	local nearest, minDist2 = table.Random( brawl.spawns ), math.huge
	for k1, sp in RandomPairs( brawl.spawns ) do
		local minDist
		for k2, plyPos in pairs( plys ) do
			local dist = sp.pos:DistToSqr( plyPos )
			minDist = math.min( minDist or dist, dist )
		end
		if minDist < minDist2 then
			minDist2 = minDist
			nearest = { pos = util.FindPosition( sp.pos, ply, { around = 50, above = 0 } ), ang = sp.ang }
		end
	end

	return nearest

end

function brawl.spawn.findNearestTeam( ply )

	local tID = ply:Team()
	local plys = {}
	for k, pl in pairs( player.GetAll() ) do
		if pl == ply or pl:Team() ~= tID or not pl:Alive() or pl:GetNWBool("Spectating") then continue end
		if pl.lastHit and CurTime() < pl.lastHit + 15 then continue end

		local dir = pl:GetAimVector()
		dir.z = -0.1
		table.insert( plys, pl:GetPos() - dir:GetNormalized() * 50 )
	end

	for k, pos in RandomPairs( plys ) do
		local foundPos = util.FindPosition( pos, ply, { around = 50, above = 0 } )
		if foundPos then return { pos = foundPos, ang = (foundPos - pos):Angle() } end
	end

	return brawl.spawn.findFarthest( ply )

end

function brawl.spawn.initData()

	-- MySQLite.query([[
	--	 CREATE TABLE IF NOT EXISTS brawl_spawns (
	--		 map VARCHAR(50) NOT NULL,
	--		 name VARCHAR(50) NOT NULL,
	--		 data TEXT NOT NULL
	--	 )
	-- ]])

	if not file.Exists( "brawl_spawns", "DATA" ) then
		file.CreateDir( "brawl_spawns" )
	end

end

function brawl.spawn.save( name )

	name = name or "default"
	local map = game.GetMap()
	local data = util.TableToJSON( brawl.spawns )

	-- MySQLite.query(string.format("SELECT * FROM brawl_spawns WHERE map = %s AND name = %s",
	--	 MySQLite.SQLStr( map ), MySQLite.SQLStr( name )
	-- ), function( res )
	-- 	if not res or #res < 1 then
	-- 		MySQLite.query(string.format([[
	-- 			INSERT INTO brawl_spawns( map, name, data )
	-- 			VALUES ( %s, %s, %s )
	-- 			]], MySQLite.SQLStr( map ), MySQLite.SQLStr( name ), MySQLite.SQLStr( data )
	-- 		))
	-- 	else
	-- 		MySQLite.query(string.format([[
	-- 			UPDATE brawl_spawns
	-- 			SET data = %s WHERE map = %s AND name = %s
	--			 ]], MySQLite.SQLStr( data ), MySQLite.SQLStr( map ), MySQLite.SQLStr( name )
	-- 		))
	--
	-- 	end
	--
	--	 brawl.msg( "Saved spawnpoints for %s (%s)", brawl.config.maps[map].name or map, name )
	-- end)

	local fname = "brawl_spawns/" .. map .. "_" .. name .. ".dat"
	file.Write( fname, data )
	brawl.msg( "Saved spawnpoints for %s (%s)", brawl.config.maps[map].name or map, name )

end

function brawl.spawn.load( name )

	name = name or "default"
	local map = game.GetMap()

	-- MySQLite.query(string.format("SELECT * FROM brawl_spawns WHERE map = %s AND name = %s",
	--	 MySQLite.SQLStr( map ), MySQLite.SQLStr( name )
	-- ), function( res )
	--	 if res and res[1] then
	--		 local data = util.JSONToTable( res[1].data )
	--		 brawl.spawns = data
	--
	--		 brawl.msg( "Loaded spawnpoints for %s (%s)", brawl.config.maps[ res[1].map ].name or res[1].map, res[1].name )
	--		 brawl.spawn.update()
	--	 end
	-- end)

	local fname = "brawl_spawns/" .. map .. "_" .. name .. ".dat"
	if file.Exists( "data/" .. fname, "GAME" ) then
		local data = util.JSONToTable( file.Read( "data/" .. fname, "GAME" ) )
		brawl.spawns = data

		brawl.msg( "Loaded spawnpoints for %s (%s)", brawl.config.maps[ map ].name or map, name )
		brawl.spawn.update()
	else
		brawl.msg( "No spawnpoints found for %s", brawl.config.maps[ map ].name or map )
	end

end

-- ULib.ucl.registerAccess( "brawl_edit_spawns", ULib.ACCESS_SUPERADMIN, "Edit Brawl spawns", "Brawl" )
function brawl.spawn.isAllowed( ply )

	return ply:IsSuperAdmin()

end

net.Receive( "brawl.spawn.add", function( len, ply )

	if not brawl.spawn.isAllowed( ply ) then return end

	local t = net.ReadTable()
	brawl.spawn.add( t )

end)

net.Receive( "brawl.spawn.remove", function( len, ply )

	if not brawl.spawn.isAllowed( ply ) then return end

	local id = net.ReadInt( 8 )
	brawl.spawn.remove( id )

end)

net.Receive( "brawl.spawn.get", function( len, ply )

	net.Start( "brawl.spawn" )
		net.WriteTable( brawl.spawns )
	net.Send( ply )

end)

concommand.Add( "brawl_spawn_reload", function( ply, cmd, arg, argStr)

	brawl.spawn.load()

end)
