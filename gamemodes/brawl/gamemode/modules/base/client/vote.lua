brawl.vote = {
	data = {},
	menu = brawl.vote and brawl.vote.menu
}

local blur = Material( "pp/blurscreen" )
net.Receive( "brawl.vote.start", function( len )

	brawl.vote.data = net.ReadTable()

	brawl.vote.menu = vgui.Create( "DPanel" )
	local menu = brawl.vote.menu
	menu:Dock( FILL )
	menu:MakePopup()

	local endTime = CurTime() + 29.7
	menu:SetAlpha( 0 )
	menu:AlphaTo( 255, 2 )
	menu.Paint = function( self, w, h )
		local a = self:GetAlpha() / 255

		DrawColorModify({
			[ "$pp_colour_contrast" ] = 1 + 0.5 * a,
			[ "$pp_colour_colour" ] = 1 - a,
		})

		surface.SetDrawColor( 255, 255, 255, a * 255 )
		surface.SetMaterial( blur )

		for i = 1, 3 do
			blur:SetFloat( "$blur", a * i * 2 )
			blur:Recompute()

			render.UpdateScreenEffectTexture()
			surface.DrawTexturedRect( -1, -1, ScrW() + 2, ScrH() + 2 )
		end

		draw.RoundedBox( 0, 0, 0, w, h, Color( 0,0,0, 220 ) )
		local timeLeft = math.Clamp( math.ceil( endTime - CurTime() ), 0, 30 )
		if timeLeft > 0 then
			draw.Text({
				font = "brawl.hud.large",
				text = timeLeft,
				pos = { w / 2, 20 },
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_TOP,
				color = Color( 255,255,255, 150 )
			})
		end
	end

	timer.Simple( 2, function()
		menu.container = vgui.Create( "DPanel", menu )
		local container = menu.container
		container:SetPaintBackground( false )

		-- maps
		local maplist = vgui.Create( "DPanel", container )
		maplist.Paint = function( self, w, h )
			draw.Text({
				font = "brawl.hud.normal",
				text = "Next map",
				pos = { w / 2, 40 },
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_BOTTOM,
				color = Color( 220,220,220 )
			})
		end

		local k = 0
		for id, data in SortedPairs( brawl.vote.data ) do
			local x, y = 10 + (k % 3) * 266, 10 + (k % 2) * 266

			local url = brawl.config.maps[ data.map ].img
			local img = vgui.Create( "DHTML", maplist )
			img:SetSize( 256, 256 )
			img:SetPos( x, y )
			img:SetHTML([[<style>
				body {
					background-image: url(]] .. url .. [[);
					background-size: auto 100%;
					background-position: center;
					border-radius: 4px;
				}
			</style>
			<body></body>]])

			local but = vgui.Create( "DButton", img )
			but:SetSize( 256, 256 )
			but:SetPos( 0, 0 )
			but:SetText( "" )
			but.Paint = function( self, w, h )
				local mapName = brawl.config.maps[ data.map ].name
				local modeName = brawl.modes.registered[ data.mode ].name

				draw.RoundedBox( 0, 0, 0, w, h, self:IsHovered() and Color( 150,150,150, 30 ) or Color( 100,100,100, 30 ) )
				draw.RoundedBox( 0, 1, 1, w-2, h-2, Color( 0,0,0, 150 ) )
				-- surface.SetDrawColor( 255,255,255, 50 )
				-- surface.DrawOutlinedRect( 0, 0, 256, 256 )

				draw.SimpleText( modeName, "brawl.hud.scoreboard.normal", w - 10, h - 15, Color( 220,220,220 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
				draw.SimpleText( mapName, "brawl.hud.scoreboard.large", w - 10, h - 37, Color( 220,220,220 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )

				local votes = brawl.vote.data[ id ].votes
				if votes ~= 0 then
					draw.RoundedBox( 4, 7, 7, 21, 21, Color( 220,220,220 ) )
					draw.SimpleText( votes, "brawl.hud.scoreboard.normal", 18, 18, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end

			but.DoClick = function( self )
				net.Start( "brawl.vote.update" )
					net.WriteUInt( id, 8 )
				net.SendToServer()
			end

			k = k + 1
		end

		maplist:SetSize( 266 * 3 + 10, 266 * 2 + 10 )
		maplist:SetPos( 0, 0 )

		container:SetSize( 266 * 3 + 10, 266 * 2 + 10 )
		container:Center()
	end)

	surface.PlaySound( "brawl/vote-map.ogg" )

	timer.Simple( 29.7, function()
		menu.container:Clear()
		menu.container:SetAlpha( 0 )
	end)

end)

net.Receive( "brawl.vote.update", function( len )

	local data = net.ReadTable()
	for id, votes in pairs( data ) do
		brawl.vote.data[ id ].votes = votes
	end

end)

net.Receive( "brawl.vote.finish", function( len )

	local map = net.ReadString()
	local mode = net.ReadString()

	local mapName = brawl.config.maps[ map ].name
	local modeName = brawl.modes.registered[ mode ].name

	local container = brawl.vote.menu.container
	container:Dock( FILL )
	container.Paint = function( self, w, h )
		local txtData = {}
		txtData.xalign = TEXT_ALIGN_CENTER
		txtData.yalign = TEXT_ALIGN_CENTER

		txtData.font = "brawl.hud.large"
		txtData.text = "Upcoming"
		txtData.pos = { w / 2, h / 2 - 20 }
		txtData.color = Color( 220,220,220 )
		draw.Text( txtData )

		txtData.font = "brawl.hud.normal"
		txtData.text = modeName .. " on " .. mapName
		txtData.pos = { w / 2, h / 2 + 20 }
		txtData.color = Color( 255,255,255 )
		draw.Text( txtData )
	end
	container:AlphaTo( 255, 4 )

end)
