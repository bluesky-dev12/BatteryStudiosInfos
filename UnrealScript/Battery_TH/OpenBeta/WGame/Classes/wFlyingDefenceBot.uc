class wFlyingDefenceBot extends wHelicopter;

var int MeshItemID;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        MeshItemID;
}

static function wFlyingDefenceBot CallFlyingDefenceBot(LevelInfo Level, byte TeamNum, int Grade, int RegenLoc)
{
    local wFlyingDefenceBot wBot;
    local NavigationPoint N;
    local Vector loc, focal;
    local int iCurrentPoint, i, SpawnCount;
    local Rotator Rotation;

    N = GetFlyingPathNode(Level, 0, RegenLoc);
    loc = N.Location;
    N = GetFlyingPathNode(Level, 1, RegenLoc);
    focal = N.Location;
    iCurrentPoint = FlyingPathNode(N).iPathPoint;
    Rotation = Rotator(focal - loc);
    wBot = Level.Spawn(Class'WGame_Decompressed.wFlyingDefenceBot',,, loc, Rotation);
    // End:0xD8
    if(wBot == none)
    {
        Log("failed to spawn wFlyingDefenceBot");
        return none;
    }
    wBot.iCurrentPoint = iCurrentPoint;
    Level.Game.AddDefaultInventory(wBot);
    wBot.TeamIndex = int(TeamNum);
    wBot.Controller.InitBot(Grade);
    wBot.Controller.RegenLoc = RegenLoc;
    // End:0x181
    if(int(wBot.Role) == int(ROLE_Authority))
    {
        wBot.SetBotMesh();
    }
    return wBot;
    //return;    
}

simulated function SetBotMesh()
{
    local wAILevel AILevel;

    // End:0x3E
    if(MeshItemID != 0)
    {
        LinkMesh(Level.GameMgr.GetItemResourceMesh(MeshItemID, true, byte(TeamIndex)));
        LoopAnim('Idle');
    }
    //return;    
}

simulated event PostNetBeginPlay()
{
    super(wPawn).PostNetBeginPlay();
    SetBotMesh();
    //return;    
}

state Dying
{
    function BeginState()
    {
        super.BeginState();
        PlayAnim('Down',, 0.0000000);
        //return;        
    }
    stop;    
}

defaultproperties
{
    CONFIG_DyingLifeSpan=10.0000000
    CONFIG_DyingImpluse=-100.0000000
    CONFIG_DyingImpluseFactor=1.0000000
    CONFIG_FinalExplosionSoundExplosion=none
    CONFIG_FinalExlosionSoundRadius=0.0000000
    bBombExplosion=false
    StaySound=none
    MoveSound=none
    MoveDamagedSound=none
    SpindownSound=none
    CONFIG_SPINDOWN_SOUND_RADIUS=0.0000000
    ControllerClass=Class'WGame_Decompressed.wFlyingDefenceBotController'
    CollisionRadius=350.0000000
    CollisionHeight=430.0000000
}