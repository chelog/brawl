brawl.spawns = brawl.spawns or {}

hook.Add( "HUDPaint", "brawl.spawn", function()

	if not brawl.config.debug then return end

	-- for id, p in pairs( brawl.spawns ) do
	--	 local pos = p.pos:ToScreen()
	--	 if pos.visible then
	--		 draw.RoundedBox( 2, pos.x, pos.y, 4, 4, Color(255,255,255, 100) )
	--		 draw.Text({
	--			 font = "brawl.hud.small",
	--			 text = "Spawnpoint #" .. id,
	--			 pos = { pos.x, pos.y + 5 },
	--			 color = Color(255,255,255, 100),
	--			 xalign = TEXT_ALIGN_CENTER,
	--			 yalign = TEXT_ALIGN_TOP,
	--		 })
	--	 end
	-- end

end)

concommand.Add( "brawl_spawn_add",function( ply, cmd, args, argStr )

	if not IsValid( LocalPlayer() ) then return end

	local pos = LocalPlayer():GetEyeTrace().HitPos
	local ang = LocalPlayer():EyeAngles()
	ang.p, ang.r = 0, 0

	net.Start( "brawl.spawn.add" )
		net.WriteTable({
			pos = pos,
			ang = ang
		})
	net.SendToServer()

end)

concommand.Add( "brawl_spawn_remove",function( ply, cmd, args, argStr )

	local id = tonumber( args[1] )
	if not id then return end

	net.Start( "brawl.spawn.remove" )
		net.WriteInt( id, 8 )
	net.SendToServer()

end)

net.Receive( "brawl.spawn", function( len )

	local data = net.ReadTable()
	brawl.spawns = data

end)

hook.Add( "Initialize", "brawl.spawn.get", function()

	net.Start( "brawl.spawn.get" )
	net.SendToServer()

end)
