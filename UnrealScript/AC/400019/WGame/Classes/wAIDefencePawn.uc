class wAIDefencePawn extends wAIPawn;

var bool bReached;
var float ReacheRadius;
var wFlagObjectiveBase AttackFlag;
var Class<Emitter> SpawnEffectExplosion;
var Class<Emitter> SpawnEffectAttack;
var name AttackMotion;
var int MeshItemID;
var int iNpcID;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        MeshItemID, iNpcID;
}

simulated function SetBotMesh()
{
    local wAILevel AILevel;
    local bool bSuc;

    // End:0x3E
    if(MeshItemID != 0)
    {
        bAlreadySetup = true;
        LinkMesh(Level.GameMgr.GetItemResourceMesh(MeshItemID, true, byte(TeamIndex)));
    }
    //return;    
}

simulated event PostNetBeginPlay()
{
    super(wPawn).PostNetBeginPlay();
    SetBotMesh();
    //return;    
}

static function wAIDefencePawn Create(LevelInfo Level, Vector Location, Rotator Rotation)
{
    local wAIDefencePawn wBot;

    wBot = Level.Spawn(Class'WGame_Decompressed.wAIDefencePawn',,, Location, Rotation, true);
    // End:0x53
    if(wBot == none)
    {
        Log("failed to spawn wAIDefencePawn");
        return none;
    }
    return wBot;
    //return;    
}

function InitDefencePawn(LevelInfo Level, int Grade, int RegenLoc)
{
    // End:0xA2
    if(Controller != none)
    {
        wAIDefenceBot(Controller).AILevel = wAILevel(Level.GetAILevel());
        wAIDefenceBot(Controller).NPCParam = wAILevel(Level.GetAILevel()).GetNPCParam(Grade);
        Controller.InitBot(Grade);
        Controller.RegenLoc = RegenLoc;
        Controller.Possess(self);
    }
    SetBotMesh();
    Level.Game.AddDefaultInventory(self);
    //return;    
}

simulated function Setup(PlayerRecord Rec, optional bool bLoadNow)
{
    //return;    
}

simulated event PostNetReceive()
{
    super(wPawn).PostNetReceive();
    // End:0x1E
    if(self.MeshItemID != 0)
    {
        bNetNotify = false;
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super(wPawn).PostBeginPlay();
    // End:0x3E
    if(((int(Role) == int(ROLE_Authority)) && ControllerClass != none) && Controller == none)
    {
        Controller = Spawn(ControllerClass);
    }
    ReacheRadius = CollisionRadius * float(2);
    // End:0x70
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        bIsNeedUpdateAnim = false;
    }
    //return;    
}

function Process_TossWeapon_When_Dying(LevelInfo levenInfo, Pawn Pawn, wWeapon Weapon)
{
    levenInfo.Game.SC.KDLog.DeathWeapon = self.iNpcID;
    //return;    
}

function PlayDyingAnimation(Class<DamageType> DamageType, Vector HitLoc)
{
    local PlayerController PC;

    // End:0x0D
    if(Mesh == none)
    {
        return;
    }
    // End:0x46
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x46
        if(Level.GetIsNoGore() == false)
        {
            MakeGorePawn(iDiedCollisionPart);
        }
    }
    Velocity += TearOffMomentum;
    BaseEyeHeight = default.BaseEyeHeight;
    // End:0xBF
    if(OldController != none)
    {
        PC = PlayerController(OldController);
        // End:0xBC
        if(((PC == none) || PC.ViewTarget != self) || Viewport(PC.Player) == none)
        {
            SetTwistLook(0, 0);
        }        
    }
    else
    {
        SetTwistLook(0, 0);
    }
    SetInvisibility(0.0000000);
    PlayDirectionalDeath(HitLoc);
    SetPhysics(2);
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
    NotifyAddDefaultInventory();
    //return;    
}

function ChangedWeapon()
{
    super(wPawn).ChangedWeapon();
    //return;    
}

function wWeapon AddWeapon(BtrDouble iUniqueID, int iWeaponID, int iAddPartsID, optional bool bPickupChange, optional int iPainting_Item_ID)
{
    local wWeapon dWeapon;

    dWeapon = super(Pawn).AddWeapon(iUniqueID, iWeaponID, iAddPartsID, bPickupChange, iPainting_Item_ID);
    // End:0x42
    if(dWeapon != none)
    {
        dWeapon.bCanThrow = false;
    }
    return dWeapon;
    //return;    
}

function AddDefaultSkills(optional bool bQuickslotChange)
{
    //return;    
}

simulated function Class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return Class'XEffects.xAlienPawnGidGroup'.default.BloodHitClass_Alpha;
    //return;    
}

simulated function PlayMelee(bool bMeleeKnifeOrButt)
{
    local name CurrentMelee3rd;

    // End:0x61
    if(bIsProned == true)
    {
        // End:0x23
        if(bMeleeKnifeOrButt)
        {
            CurrentMelee3rd = Meele_Knife_Pr;            
        }
        else
        {
            // End:0x53
            if(int(WeaponAttachment.BaseParams.eType) == int(17))
            {
                CurrentMelee3rd = Knife_Fire_Pr;                
            }
            else
            {
                CurrentMelee3rd = Meele_Rifle_Pr;
            }
        }        
    }
    else
    {
        // End:0xC2
        if(bIsCrouched == true)
        {
            // End:0x84
            if(bMeleeKnifeOrButt)
            {
                CurrentMelee3rd = Meele_Knife_Cr;                
            }
            else
            {
                // End:0xB4
                if(int(WeaponAttachment.BaseParams.eType) == int(17))
                {
                    CurrentMelee3rd = Knife_Fire_Cr;                    
                }
                else
                {
                    CurrentMelee3rd = Meele_Rifle_Cr;
                }
            }            
        }
        else
        {
            CurrentMelee3rd = Meele_Knife;
        }
    }
    AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, FireRootBone);
    PlayAnim(CurrentMelee3rd, 1.0000000, 0.0000000, 1);
    Log("MeleeAni - " $ string(CurrentMelee3rd));
    //return;    
}

simulated function SpawnGoreGiblet(int iIndex)
{
    //return;    
}

simulated function SpawnGibs(Rotator HitRotation, float ChunkPerterbation)
{
    //return;    
}

function int SpawnSupplyItem()
{
    return super(wPawn).SpawnSupplyItem();
    //return;    
}

simulated function FootStepping(int side)
{
    FmodPlayOwnedSound(SoundFootsteps_3rd[0], 0);
    //return;    
}

event PlayLandedSound(int SurfType)
{
    // End:0x48
    if(((Health > 0) && !bHidden) && (Level.TimeSeconds - SplashTime) > 0.2500000)
    {
        FmodPlayOwnedSound(SoundFootsteps_3rd[0], 0);
    }
    //return;    
}

event bool CheckUpdateAnimation()
{
    return !int(Level.NetMode) == int(NM_DedicatedServer);
    //return;    
}

function bool deleOnReachedDestination(Vector Dir, Actor GoalActor)
{
    local float Size;

    Size = VSize(Dir);
    return Size < ReacheRadius;
    //return;    
}

simulated event Tick(float dt)
{
    super.Tick(dt);
    CheckDamageWithinRadius();
    //return;    
}

simulated function CheckDamageWithinRadius()
{
    //return;    
}

simulated function EffectExplosion()
{
    Spawn(SpawnEffectExplosion,,, Location);
    bHidden = true;
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
        case 9001:
            SetCollisionSizeEx(80.0000000, 52.0000000);
            // End:0xE2
            break;
        // End:0x3D
        case 9002:
            SetCollisionSizeEx(100.0000000, 80.0000000);
            // End:0xE2
            break;
        // End:0x58
        case 9007:
            SetCollisionSizeEx(30.0000000, 32.0000000);
            // End:0xE2
            break;
        // End:0x73
        case 9008:
            SetCollisionSizeEx(100.0000000, 125.0000000);
            // End:0xE2
            break;
        // End:0x8E
        case 9009:
            SetCollisionSizeEx(75.0000000, 90.0000000);
            // End:0xE2
            break;
        // End:0xA9
        case 9012:
            SetCollisionSizeEx(170.0000000, 200.0000000);
            // End:0xE2
            break;
        // End:0xC4
        case 9013:
            SetCollisionSizeEx(43.0000000, 80.0000000);
            // End:0xE2
            break;
        // End:0xDF
        case 9014:
            SetCollisionSizeEx(105.0000000, 110.0000000);
            // End:0xE2
            break;
        // End:0xFFFF
        default:
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

function TakeFallingDamage()
{
    //return;    
}

state InvulnerableTime
{
    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }
Begin:

    // End:0x2D
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.IsInvulnerable = true;
        PlayerReplicationInfo.IsWaitingForStart = false;
    }
    self.AdjustCollisionSize();
    // End:0x151
    if(bInvulnerableOnRespawn)
    {
        Log(("Pawn" $ OwnerName) @ "is invulnerable");
        // End:0x8A
        if(Level.GetMatchMaker().BeginnerMode)
        {
            Sleep(fRespawnInvulnerableTimeBeginner);            
        }
        else
        {
            // End:0xC1
            if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_SD())
            {
                Sleep(fRespawnInvulnerableTime_SDMode);                
            }
            else
            {
                // End:0xF0
                if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
                {                    
                }
                else
                {
                    // End:0x129
                    if(Level.GetMatchMaker().BotTutorial && self.IsA('wAIPawn'))
                    {
                        Sleep(1.3300000);                        
                    }
                    else
                    {
                        Sleep(fRespawnInvulnerableTime);
                    }
                }
            }
        }
        Log(("Pawn" $ OwnerName) @ "is vulnerable");
    }
    // End:0x16D
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.IsInvulnerable = false;
    }
    self.GotoState('BeAction');
    stop;            
}

state BeAction
{
    function BeginState()
    {
        //return;        
    }

    function EndState()
    {
        //return;        
    }
    stop;    
}

state Dying
{
    simulated function BeginState()
    {
        super.BeginState();
        EffectExplosion();
        //return;        
    }
    stop;    
}

defaultproperties
{
    SpawnEffectExplosion=Class'XEffects.XWFX_Alien_death_explosion'
    FootstepVolume=1.0000000
    GibGroupClass=Class'XEffects.xAlienPawnGidGroup'
    SoundFootsteps_3rd="Warfare_Sound_Defense_Mode/Monster_Alpha/char_enemy_move_alpha"
    sndScream="Warfare_Sound_Defense_Mode/Monster_alpha/char_enemy_wail_alpha"
    sndDie="Warfare_Sound_Defense_Mode/Monster_alpha/char_enemy_death_alpha"
    bDoNotBackPathFinding=true
    ControllerClass=Class'WGame_Decompressed.wAIDefenceBot_Alpha'
    bDoTorsoTwist=false
    TakeoffStillAnim="AR_Idle"
    AirStillAnim="AR_Idle"
    TakeoffAnims[0]="AR_Idle"
    TakeoffAnims[1]="AR_Idle"
    TakeoffAnims[2]="AR_Idle"
    TakeoffAnims[3]="AR_Idle"
    AirAnims[0]="AR_Idle"
    AirAnims[1]="AR_Idle"
    AirAnims[2]="AR_Idle"
    AirAnims[3]="AR_Idle"
    LandAnims[0]="AR_Idle"
    LandAnims[1]="AR_Idle"
    LandAnims[2]="AR_Idle"
    LandAnims[3]="AR_Idle"
    LandAnims[4]="AR_Idle"
    CrouchAnims[0]="AR_Idle"
    CrouchAnims[1]="AR_Idle"
    CrouchAnims[2]="AR_Idle"
    CrouchAnims[3]="AR_Idle"
    OnReachedDestination=wAIDefencePawn.deleOnReachedDestination
    bSyncCollsionSizeHK=true
    CollisionRadius=50.0000000
    CollisionHeight=52.0000000
    RotationRate=(Pitch=4096,Yaw=4000,Roll=3072)
}