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

net.Receive( "brawl.spawn.send", function( len )

	local data = net.ReadTable()
	brawl.spawns = data

end)
