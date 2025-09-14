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

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Kappa;
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
        Spawn(Class'XEffects.XWFX_Alien_explosion',,, Location);
        bHidden = true;
        //return;        
    }

    event Landed(Vector HitNormal)
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    CONFIG_DyingLifeSpan=5.0000000
    CONFIG_DyingImpluse=0.0000000
    CONFIG_DyingImpluseFactor=0.0000000
    CONFIG_FinalExplosionSoundExplosion=none
    CONFIG_FinalExlosionSoundRadius=0.0000000
    bBombExplosion=false
    MinimapIconEnemy=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_fly',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    StaySound=none
    MoveSound=Sound'Warfare_Sound_Defense_Mode.Monster_Kappa.char_enemy_move_kappa'
    MoveDamagedSound=Sound'Warfare_Sound_Defense_Mode.Monster_Kappa.char_enemy_wail_kappa'
    SpindownSound=Sound'Warfare_Sound_Defense_Mode.Monster_Kappa.char_enemy_death_kappa'
    CONFIG_SPINDOWN_SOUND_RADIUS=0.0000000
    ControllerClass=Class'WGame_Decompressed.wFlyingDefenceBotController'
    CollisionRadius=350.0000000
    CollisionHeight=430.0000000
}