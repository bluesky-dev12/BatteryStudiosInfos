class wFlyingDefenceBot extends wHelicopter;

var int MeshItemID;
var int iNpcID;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        MeshItemID, iNpcID;
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
    wBot = Level.Spawn(Class'WGame_Decompressed.wFlyingDefenceBot',,, loc, Rotation, true);
    // End:0xD9
    if(wBot == none)
    {
        Log("failed to spawn wFlyingDefenceBot");
        return none;
    }
    wBot.iCurrentPoint = iCurrentPoint;
    wBot.SetRequiredEquipment(Grade);
    Level.Game.AddDefaultInventory(wBot);
    wBot.TeamIndex = int(TeamNum);
    wBot.Controller.InitBot(Grade);
    wBot.Controller.RegenLoc = RegenLoc;
    // End:0x196
    if(int(wBot.Role) == int(ROLE_Authority))
    {
        wBot.SetBotMesh();
    }
    return wBot;
    //return;    
}

function SetRequiredEquipment(int Grade)
{
    // End:0x2C
    if(910 == Grade)
    {
        wRequiredEquipment[0] = 90020;
        wRequiredEquipment[1] = 90021;        
    }
    else
    {
        // End:0x58
        if(911 == Grade)
        {
            wRequiredEquipment[0] = 90022;
            wRequiredEquipment[1] = 90023;            
        }
        else
        {
            wRequiredEquipment[0] = 0;
            wRequiredEquipment[1] = 0;
        }
    }
    //return;    
}

function AddDefaultInventory(optional bool bQuickslotChange)
{
    local int i;
    local wWeapon NewItem;

    i = 0;
    J0x07:

    // End:0x57 [Loop If]
    if(i < wRequiredEquipment.Length)
    {
        // End:0x2E
        if(wRequiredEquipment[i] == 0)
        {
            // [Explicit Break]
            goto J0x57;
            // [Explicit Continue]
            goto J0x4D;
        }
        NewItem = AddWeapon(EmptyBtrDouble(), wRequiredEquipment[i], 0, false);
        J0x4D:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x57:

    PlayerReplicationInfo.fSpawnedTime = float(Level.Game.GameReplicationInfo.ElapsedTime);
    //return;    
}

simulated function SetBotMesh()
{
    local wAILevel AILevel;
    local bool bSuc;

    // End:0x45
    if(MeshItemID != 0)
    {
        LinkMesh(Level.GameMgr.GetItemResourceMesh(MeshItemID, true, byte(TeamIndex)));
        bSuc = LoopAnim('Idle');
    }
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(Actor.CollisionPartsType collisionParts)
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

function Process_TossWeapon_When_Dying(LevelInfo levenInfo, Pawn Pawn, wWeapon Weapon)
{
    levenInfo.Game.SC.KDLog.DeathWeapon = self.iNpcID;
    //return;    
}

function AdjustCollisionSize()
{
    SetCollisionRadius();
    //return;    
}

function SetCollisionRadius()
{
    switch(iNpcID)
    {
        // End:0x22
        case 9003:
            SetCollisionSizeEx(120.0000000, 100.0000000);
            // End:0xAC
            break;
        // End:0x3D
        case 9004:
            SetCollisionSizeEx(60.0000000, 50.0000000);
            // End:0xAC
            break;
        // End:0x58
        case 9005:
            SetCollisionSizeEx(80.0000000, 70.0000000);
            // End:0xAC
            break;
        // End:0x73
        case 9006:
            SetCollisionSizeEx(150.0000000, 130.0000000);
            // End:0xAC
            break;
        // End:0x8E
        case 9010:
            SetCollisionSizeEx(110.0000000, 150.0000000);
            // End:0xAC
            break;
        // End:0xA9
        case 9011:
            SetCollisionSizeEx(160.0000000, 220.0000000);
            // End:0xAC
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(iNpcID)
    {
        // End:0xBB
        case 9003:
        // End:0xC3
        case 9004:
        // End:0xCB
        case 9005:
        // End:0x1B1
        case 9006:
            MoveDamagedSound = "Warfare_Sound_Defense_Mode/Monster_delta/char_enemy_wail_delta";
            SpindownSound = "";
            MoveSound = "Warfare_Sound_Defense_Mode/Monster_delta/char_enemy_move_delta";
            ExplosionSoundWhenDying = "Warfare_Sound_Defense_Mode/Monster_delta/char_enemy_death_delta";
            // End:0x1B7
            break;
        // End:0xFFFF
        default:
            // End:0x1B7
            break;
            break;
    }
    //return;    
}

function SetCollisionSizeEx(float fRadius, float fHeight)
{
    SetCollisionSize(fRadius, fHeight);
    StandHeight = fHeight;
    StandRadius = fRadius;
    //return;    
}

simulated function HeliExplosionWhenDestroyed()
{
    StopLoopSoundByActor();
    //return;    
}

state Dying
{
    simulated function BeginState()
    {
        local wFlyingDefenceBotController flyingBotController;
        local Controller C;
        local PlayerController PC;

        super.BeginState();
        switch(iNpcID)
        {
            // End:0x15
            case 9003:
            // End:0x1D
            case 9004:
            // End:0x25
            case 9005:
            // End:0x3F
            case 9006:
                Spawn(Class'XEffects.XWFX_Alien_death_explosion',,, Location);
                // End:0x64
                break;
            // End:0x47
            case 9010:
            // End:0x61
            case 9011:
                Spawn(Class'XEffects.XWFX_Alien_explosion',,, Location);
                // End:0x64
                break;
            // End:0xFFFF
            default:
                break;
        }
        C = Level.ControllerList;
        J0x78:

        // End:0xDE [Loop If]
        if(C != none)
        {
            PC = PlayerController(C);
            // End:0xC7
            if(PC != none)
            {
                PC.ClientFmodPlaySoundLocal(ExplosionSoundWhenDying, 0, 1.0000000, false, true, false, -1, false, Location);
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x78;
        }
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
    CONFIG_FinalExplosionSoundExplosion=""
    CONFIG_FinalExlosionSoundRadius=0.0000000
    bBombExplosion=false
    MinimapIconEnemy=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.minimapicon.enemy_target_monster_fly',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ProjectileClass=Class'WGame_Decompressed.wRocket_Alien'
    StaySound=""
    MoveSound="Warfare_Sound_Defense_Mode/Monster_kappa/char_enemy_move_kappa"
    MoveDamagedSound="Warfare_Sound_Defense_Mode/Monster_kappa/char_enemy_wail_kappa"
    SpindownSound=""
    ExplosionSoundWhenDying="Warfare_Sound_Defense_Mode/Monster_kappa/char_enemy_death_kappa"
    CONFIG_SPINDOWN_SOUND_RADIUS=0.0000000
    wRequiredEquipment[0]=90022
    wRequiredEquipment[1]=90023
    wRequiredEquipment[2]=0
    wRequiredEquipment[3]=0
    wRequiredEquipment[4]=0
    wRequiredEquipment[5]=0
    wRequiredEquipment[6]=0
    wRequiredEquipment[7]=0
    wRequiredEquipment[8]=0
    wRequiredEquipment[9]=0
    wRequiredEquipment[10]=0
    wRequiredEquipment[11]=0
    wRequiredEquipment[12]=0
    wRequiredEquipment[13]=2020
    wRequiredEquipment[14]=2021
    wRequiredEquipment[15]=2030
    wRequiredEquipment[16]=2031
    wRequiredEquipment[17]=2040
    wRequiredEquipment[18]=2041
    wRequiredEquipment[19]=2042
    wRequiredEquipment[20]=2043
    wRequiredEquipment[21]=2044
    wRequiredEquipment[22]=3000
    wRequiredEquipment[23]=3010
    wRequiredEquipment[24]=3011
    wRequiredEquipment[25]=3020
    wRequiredEquipment[26]=3021
    wRequiredEquipment[27]=3030
    wRequiredEquipment[28]=3031
    wRequiredEquipment[29]=3032
    wRequiredEquipment[30]=3033
    wRequiredEquipment[31]=3034
    wRequiredEquipment[32]=3035
    wRequiredEquipment[33]=4000
    wRequiredEquipment[34]=4010
    wRequiredEquipment[35]=4011
    wRequiredEquipment[36]=4020
    wRequiredEquipment[37]=4030
    wRequiredEquipment[38]=4031
    wRequiredEquipment[39]=4040
    wRequiredEquipment[40]=4041
    wRequiredEquipment[41]=4042
    wRequiredEquipment[42]=4043
    wRequiredEquipment[43]=4044
    wRequiredEquipment[44]=4045
    wRequiredEquipment[45]=6000
    wRequiredEquipment[46]=6001
    wRequiredEquipment[47]=6002
    wRequiredEquipment[48]=7001
    wRequiredEquipment[49]=5001
    wRequiredEquipment[50]=5003
    wRequiredEquipment[51]=40005
    wRequiredEquipment[52]=40006
    wRequiredEquipment[53]=1031
    wRequiredEquipment[54]=1032
    wRequiredEquipment[55]=9000
    wRequiredEquipment[56]=5011
    wRequiredEquipment[57]=2050
    wRequiredEquipment[58]=2051
    wRequiredEquipment[59]=4051
    wRequiredEquipment[60]=3093
    wRequiredEquipment[61]=3094
    bAddToLevelPawnList=true
    ControllerClass=Class'WGame_Decompressed.wFlyingDefenceBotController'
    bSyncCollsionSizeHK=true
    CollisionRadius=160.0000000
    CollisionHeight=220.0000000
}