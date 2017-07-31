brawl.spawn = brawl.spawn or {}
brawl.spawns = brawl.spawns or {}

function brawl.spawn.isAllowed( ply )

	return ply:IsSuperAdmin()

end

hook.Add("PlayerInitialSpawn", "brawl.spawn.send", function( ply )

	if not IsValid(ply) then return end

	brawl.spawn.update(ply)

end)
