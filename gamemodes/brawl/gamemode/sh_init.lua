if SERVER then AddCSLuaFile() end

GM.Name = "Brawl"
GM.Author = "chelog"
GM.Email = "chelog@octothorp.team"
GM.Website = "http://www.octothorp.team"

brawl.version = "0.13"

include "lib/misc.lua"

team.SetUp( 1, "Blue", Color( 41,182,246 ) )
team.SetUp( 2, "Orange", Color( 255,152,0 ) )
team.SetUp( 3, "Green", Color( 139,195,74 ) )
team.SetUp( 4, "Purple", Color( 171,71,188 ) )

function brawl.getDebugEnabled()

	return GetGlobalBool( "brawl.debug", false )

end

function brawl.loadConfig()

	-- load default config
	local name = GAMEMODE.FolderName .. "/gamemode/config.lua"
	if SERVER then AddCSLuaFile( name ) end
	include( name )

	-- override by custom config
	if file.Exists( "brawl/config.lua", "LUA" ) then
		if SERVER then AddCSLuaFile( "brawl/config.lua" ) end
		include( "brawl/config.lua" )
	end

	hook.Run( "brawl.ConfigLoaded" )

end


function brawl.loadFiles()

	brawl.includeModuleFolders( "base", true )
	brawl.includeModuleFolders( "changelog", true )

	if CLIENT then
		local path = brawl.getModulePath( "base", true )
		includeFolder( path .. "/client/vgui" )
	end

end

function GM:Initialize()

	brawl.msg( "=====================================" )
	brawl.msg( "Initializing gamemode." )

	brawl.init()
	self:CreateTeams()

	brawl.msg( "Gamemode init successful." )
	brawl.msg( "=====================================" )

end

if brawl.getDebugEnabled() then

	brawl.init()

end
