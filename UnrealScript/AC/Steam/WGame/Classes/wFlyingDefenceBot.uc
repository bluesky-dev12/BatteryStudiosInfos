/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wFlyingDefenceBot.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *	States:1
 *
 *******************************************************************************/
class wFlyingDefenceBot extends wHelicopter;

var int MeshItemID;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
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
    Rotation = rotator(focal - loc);
    wBot = Level.Spawn(class'wFlyingDefenceBot',,, loc, Rotation);
    // End:0xd8
    if(wBot == none)
    {
        Log("failed to spawn wFlyingDefenceBot");
        return none;
    }
    wBot.iCurrentPoint = iCurrentPoint;
    Level.Game.AddDefaultInventory(wBot);
    wBot.TeamIndex = TeamNum;
    wBot.Controller.InitBot(Grade);
    wBot.Controller.RegenLoc = RegenLoc;
    // End:0x181
    if(wBot.Role == 4)
    {
        wBot.SetBotMesh();
    }
    return wBot;
}

simulated function SetBotMesh()
{
    local wAILevel AILevel;

    // End:0x3e
    if(MeshItemID != 0)
    {
        LinkMesh(Level.GameMgr.GetItemResourceMesh(MeshItemID, true, byte(TeamIndex)));
        LoopAnim('Idle');
    }
}

simulated function class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return class'xAlienPawnGidGroup'.default.BloodHitClass_Kappa;
}

simulated event PostNetBeginPlay()
{
    super(wPawn).PostNetBeginPlay();
    SetBotMesh();
}

state Dying
{
    function BeginState()
    {
        super.BeginState();
        Spawn(class'XWFX_Alien_explosion',,, Location);
        bHidden = true;
    }

    event Landed(Vector HitNormal);

}

defaultproperties
{
    CONFIG_DyingLifeSpan=5.0
    CONFIG_DyingImpluse=0.0
    CONFIG_DyingImpluseFactor=0.0
    CONFIG_FinalExplosionSoundExplosion=none
    CONFIG_FinalExlosionSoundRadius=0.0
    bBombExplosion=true
    MinimapIconEnemy=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_fly',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    StaySound=none
    MoveSound=Sound'Warfare_Sound_Defense_Mode.Monster_Kappa.char_enemy_move_kappa'
    MoveDamagedSound=Sound'Warfare_Sound_Defense_Mode.Monster_Kappa.char_enemy_wail_kappa'
    SpindownSound=Sound'Warfare_Sound_Defense_Mode.Monster_Kappa.char_enemy_death_kappa'
    CONFIG_SPINDOWN_SOUND_RADIUS=0.0
    ControllerClass=class'wFlyingDefenceBotController'
    CollisionRadius=350.0
    CollisionHeight=430.0
}