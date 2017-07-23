brawl.data = {}

function brawl.data.init()

    brawl.spawn.initData()
    brawl.spawn.load()

end
-- hook.Add( "DatabaseInitialized", "brawl.data", brawl.data.init )
timer.Simple( 0, brawl.data.init )
