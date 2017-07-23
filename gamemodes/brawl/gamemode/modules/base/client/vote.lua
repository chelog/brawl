brawl.vote = {
	maps = {},
	modes = {},
	menu = brawl.vote and brawl.vote.menu
}

local blur = Material( "pp/blurscreen" )
net.Receive( "brawl.vote.start", function( len )

	brawl.vote.modes = net.ReadTable()
	brawl.vote.maps = net.ReadTable()

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

		-- modes
		local modelist = vgui.Create( "DPanel", container )
		modelist.Paint = function( self, w, h )
			draw.Text({
				font = "brawl.hud.normal",
				text = "Next mode",
				pos = { w / 2, 40 },
				xalign = TEXT_ALIGN_CENTER,
				yalign = TEXT_ALIGN_BOTTOM,
				color = Color( 220,220,220 )
			})
		end

		local k = 1
		for name, data in SortedPairs( brawl.vote.modes ) do
			local but = vgui.Create( "DButton", modelist )
			but:SetSize( 280, 35 )
			but:SetPos( 10, k * 40 + 10 )
			but:SetText( "" )
			but.Paint = function( self, w, h )
				draw.RoundedBox( 5, 0, 0, w, h, self:IsHovered() and Color( 120,120,120, 50 ) or Color( 100,100,100, 50 ) )
				draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 0,0,0, 200 ) )
				draw.SimpleText( data.name, "brawl.hud.scoreboard.normal", 10, h / 2, Color( 220,220,220 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

				local votes = brawl.vote.modes[ name ].votes
				if votes ~= 0 then
					draw.RoundedBox( 4, w-28, 7, 21, 21, Color( 220,220,220 ) )
					draw.SimpleText( votes, "brawl.hud.scoreboard.normal", w-18, 18, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end

			but.DoClick = function( self )
				net.Start( "brawl.vote.update" )
					net.WriteBit( true )
					net.WriteString( name )
				net.SendToServer()
			end

			k = k + 1
		end
		modelist:SetSize( 300, k * 40 + 15 )
		modelist:SetPos( 0, 0 )

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

		local k = 1
		for name, data in SortedPairs( brawl.vote.maps ) do
			local but = vgui.Create( "DButton", maplist )
			but:SetSize( 280, 35 )
			but:SetPos( 10, k * 40 + 10 )
			but:SetText( "" )
			but.Paint = function( self, w, h )
				draw.RoundedBox( 5, 0, 0, w, h, self:IsHovered() and Color( 120,120,120, 50 ) or Color( 100,100,100, 50 ) )
				draw.RoundedBox( 4, 1, 1, w-2, h-2, Color( 0,0,0, 200 ) )
				draw.SimpleText( data.name, "brawl.hud.scoreboard.normal", 10, h / 2, Color( 220,220,220 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )

				local votes = brawl.vote.maps[ name ].votes
				if votes ~= 0 then
					draw.RoundedBox( 4, w-28, 7, 21, 21, Color( 220,220,220 ) )
					draw.SimpleText( votes, "brawl.hud.scoreboard.normal", w-18, 18, Color( 0,0,0 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end

			but.DoClick = function( self )
				net.Start( "brawl.vote.update" )
					net.WriteBool( false )
					net.WriteString( name )
				net.SendToServer()
			end

			k = k + 1
		end

		maplist:SetSize( 300, k * 40 + 55 )
		maplist:SetPos( 300, 0 )

		container:SetSize( 600, k * 40 + 55 )
		container:Center()
	end)

	surface.PlaySound( "brawl/vote-map.ogg" )

	timer.Simple( 29.7, function()
		menu.container:Clear()
		menu.container:SetAlpha( 0 )
	end)

end)

net.Receive( "brawl.vote.update", function( len )

	local isMode = net.ReadBool()
	local data = net.ReadTable()

	if isMode then
		for mode, votes in pairs( data ) do
			brawl.vote.modes[ mode ].votes = votes
		end
	else
		for map, votes in pairs( data ) do
			brawl.vote.maps[ map ].votes = votes
		end
	end

end)

net.Receive( "brawl.vote.finish", function( len )

	local mode = net.ReadString()
	local map = net.ReadString()

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
		txtData.text = mode .. " on " .. map
		txtData.pos = { w / 2, h / 2 + 20 }
		txtData.color = Color( 255,255,255 )
		draw.Text( txtData )
	end
	container:AlphaTo( 255, 4 )

end)
