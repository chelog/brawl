# Brawl

This is a submission for gmodstore Gamemode Competition.

### Overview
Brawl is a quick first person shooter gamemode inspired by games like Counter-Strike, Insurgency and Overwatch (I know they're very different but I thried to combine some elements out of them). It isn't innovative or somewhat really unique but simply well-balanced and smooth shooter gamemode fun to play on. Just enter the game and play on any map (you should setup spawnpoints for new maps however, read about it below). When mode goal is archieved players should vote for next mode.

### Modes
**Currently you can play these modes:**
- Free for all Deathmatch
- Team Deathmatch
- Squad Deathmatch
- Free for all Elimination
- Team Elimination
- Squad Elimination
- Gun Game

*Team gamemodes present 2 teams, squad have 4 teams (squads), some of this modes will be removed after adding some planned ones*

**Planned modes:**
- Bomb defuse *(probably will use CSS maps)*
- Point capture
- Protect the VIP
- Siege

### Controls
`Spawnmenu (default: Q)` - open weapon switcher

`Weapons slot 1-4 (default numeric 1-4)` - fast switching weapons

`Context menu (default: C)` - open weapon cutomization mode

`Secondary attack while in weapon switcher (default: RMB)` - drop highlighted weapon

In main menu (opened by ESC) on **Game** tab you can change teams or toggle spectating mode.

### Installation

1. [Download](https://github.com/chelog/brawl/archive/master.zip) the zip or clone the repository and place `addons` and `gamemodes` folders inside `garrysmod` folder of your server
2. Choose gamemode by adding `gamemode brawl` line in your `garrysmod/cfg/autoexec.cfg`
3. Add [this workshop collection](https://steamcommunity.com/sharedfiles/filedetails/?id=628802365) to server for testing or if you want to assembly your own collection, add [this](https://steamcommunity.com/sharedfiles/filedetails/?id=1095528851), [this](https://steamcommunity.com/sharedfiles/filedetails/?id=400617936) and [this](https://steamcommunity.com/sharedfiles/filedetails/?id=232636218) addons to your collection for server to function properly, no client subscribtions needed
4. Set up your server name, password and other parameters by editing `garrysmod/gamemodes/brawl/gamemode/config.lua`

*I recommend keeping original map list for smooth experience during testing. However if you want to set your own maps read below.*

### Adding maps

1. Add map to server's workshop collection
2. Add map to `config.lua` using the exapmle at the bottom of map list
3. Run server on new map and use `brawl_spawn_add` and `brawl_spawn_remove ID` to edit spawns on the map
4. Reload map and see how it works

**I recommend setting from 20 to 35 spawnpoints for new maps. All maps included in test collection have predefined spawnpoints.**

### Support
If you need any help on gamemode write me on chelog@octothorp.team
