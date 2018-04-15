MODE.stages = {
	[1] = {
		kills = 3,
		weapons = { "cw_ak74", "cw_ar15" }
	},
	[2] = {
		kills = 2,
		weapons = { "khr_ak103", "cw_scarh" }
	},
	[3] = {
		kills = 2,
		weapons = { "khr_fmg9", "khr_mp5a5" }
	},
	[4] = {
		kills = 2,
		weapons = { "khr_veresk", "khr_p90" }
	},
	[5] = {
		kills = 2,
		weapons = { "khr_pkm", "cw_m249_official" }
	},
	[6] = {
		kills = 2,
		weapons = { "khr_m620", "cw_m3super90" }
	},
	[7] = {
		kills = 2,
		weapons = { "khr_sr338", "khr_m82a3" }
	},
	[8] = {
		kills = 2,
		weapons = { "khr_deagle", "cw_deagle" }
	},
	[9] = {
		kills = 2,
		weapons = { "khr_mp443", "khr_p226" }
	},
	[10] = {
		kills = 1,
		weapons = { "cw_fc2_machete", "cw_gerber_gator" }
	},
}

function MODE:Think()

	-- if GetGlobalInt( "brawl.RoundState" ) < 3 then
	-- 	for k, ply in pairs( player.GetAll() ) do
	-- 		if not IsValid( ply ) then continue end
	-- 		if ply:Frags() >= self.maxKills then
	-- 			brawl.EndRound({
	-- 				winner = ply
	-- 			})
	-- 		end
	-- 	end
	-- end

end

local intermissionTime = 10
function MODE:EndRound( data )

	if GetGlobalInt( "brawl.RoundState" ) == 3 then return end

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

function MODE:NewRound( type )

	local delay = 6.1

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

			net.Start( "brawl.round.start" )
				net.WriteFloat( delay )
				net.WriteString( self.name )
				net.WriteString( self.agenda )
			net.Send( ply )
		end
	end

	SetGlobalInt( "brawl.RoundState", 1 )

	timer.Simple( delay, function()
		for k, ply in pairs( player.GetAll() ) do
			ply:Freeze( false )
		end

		SetGlobalInt( "brawl.RoundState", 2 )
		brawl.NotifyAll( "A new round has started!" )
	end)

end

function MODE:PlayerSpawn( ply )

	local spawn = brawl.points.findFarthestSpawn( ply )
	if spawn.pos then ply:SetPos( spawn.pos + Vector(0,0,5) ) end
	if spawn.ang then ply:SetEyeAngles( spawn.ang ) end

	if not ply.ggStage then
		ply:SetScore(1)
		ply.ggStage = 1
	end

	ply:LoadModel()
	ply:LoadWeapons()
	ply:LoadSkills()

end

function MODE:DeathThink( ply )

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

function MODE:PlayerCanTalkTo( listener, talker, team, text )

	return true

end

function MODE:PlayerCanSpectate( ply, ent )

	return true

end

function MODE:PlayerInitialSpawn( ply )

	timer.Simple(0, function()
		local delay = 6.1

		ply:KillSilent()
		ply:SetNWFloat( "RespawnTime", CurTime() + delay )

		net.Start( "brawl.round.start" )
			net.WriteFloat( delay )
			net.WriteString( self.name )
			net.WriteString( self.agenda )
		net.Send( ply )
	end)

end

function MODE:PlayerDeath( ply )

	ply:SetNWFloat( "RespawnTime", CurTime() + 8 )

end

function MODE:PlayerLoadWeapons( ply )

	local stage = self.stages[ ply.ggStage ]
	local wep = table.Random( stage.weapons )
	ply:GiveWeapon( "cw_fc2_machete" )
	ply:GiveWeapon( wep, 2 )
	timer.Simple( 0, function()
		ply:SelectWeapon( wep )
	end)

end

function MODE:DoPlayerDeath( victim, attacker, dmg )

	if attacker:IsPlayer() then
		local stage = self.stages[ attacker.ggStage ]
		if attacker:Frags() >= stage.kills then
			if attacker.ggStage >= self.maxStage then
				return brawl.EndRound({
					winner = attacker
				})
			end

			timer.Simple( 1, function()
				self:AddStage( attacker, 1 )
				attacker:StripWeapons()
				attacker:SetFrags(0)

				self:PlayerLoadWeapons( attacker )
			end)
		end

		local wep = IsValid(dmg:GetInflictor()) and dmg:GetInflictor():IsWeapon() and dmg:GetInflictor() or attacker:GetActiveWeapon()
		if wep and wep:GetClass() == "cw_fc2_machete" or victim == attacker then
			self:AddStage( victim, -1 )
			victim:SetFrags(0)
		end
	end

end

function MODE:AddStage( ply, delta )

	ply.ggStage = math.max( ply.ggStage + delta, 1 )
	ply:SetScore( ply.ggStage )

end

function MODE:PlayerCanPickupWeaponClass( ply, class )

	return false

end

function MODE:PlayerCanDropWeapon( ply, wep )

	return false

end
