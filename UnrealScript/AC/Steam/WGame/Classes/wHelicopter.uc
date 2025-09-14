/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wHelicopter.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:24
 *	States:1
 *
 *******************************************************************************/
class wHelicopter extends wBotVehicle;

var int BehaviorState;
var int iCurrentPoint;
var float HelicopterDestinationFactor;
var float CumulatedDyingTime;
var float CONFIG_DyingLifeSpan;
var float CONFIG_DyingRotationFactor;
var float CONFIG_DyingRotationRate;
var float CONFIG_DyingEffectInterval;
var float CONFIG_DyingImpluse;
var float CONFIG_DyingImpluseFactor;
var Sound CONFIG_FinalExplosionSoundExplosion;
var float CONFIG_FinalExlosionSoundRadius;
var bool bBombExplosion;
var SpriteWidget MinimapIconAlly;
var SpriteWidget MinimapIconEnemy;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        BehaviorState;

    // Pos:0x0d
    reliable if(Role == 4)
        iCurrentPoint, ClientStopAllHeliSound;

}

simulated function RemoveLevelHelicopter()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x5c [While If]
    if(lp1 < Level.Helicopters.Length)
    {
        // End:0x52
        if(Level.Helicopters[lp1] == self)
        {
            Level.Helicopters.Remove(lp1, 1);
        }
        // End:0x5c
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

event Destroyed()
{
    super.Destroyed();
    // End:0x2b
    if(!bHidden && bBombExplosion)
    {
        Spawn(class'XWFX_SD_Bomb_explosion',,, Location);
    }
    StopLoopSoundByActor();
    // End:0x4d
    if(!bHidden)
    {
        PlaySound(CONFIG_FinalExplosionSoundExplosion, 10,,, CONFIG_FinalExlosionSoundRadius);
    }
    RemoveLevelHelicopter();
}

simulated function StopAllHeliSound()
{
    dblog("[wHelicopter::StopAllHeliSound]");
}

simulated function ClientStopAllHeliSound()
{
    StopLoopSoundByActor();
}

simulated function ClientPlayMoveSound()
{
    Log("[wHelicopter::ClientPlayMoveSound]");
    StopLoopSoundByActor();
    // End:0x8a
    if(!bHidden)
    {
        // End:0x6f
        if(float(Health) > float(default.Health) * 0.30)
        {
            PlaySoundHK(MoveSound, 0, 1.0, false, 1500.0,, true, true);
        }
        // End:0x8a
        else
        {
            PlaySoundHK(MoveDamagedSound, 0, 1.0, false, 1500.0,, true, true);
        }
    }
}

simulated function ClientPlayStaySound()
{
    Log("[wHelicopter::ClientPlayStaySound]");
    StopLoopSoundByActor();
    // End:0x8a
    if(!bHidden)
    {
        // End:0x6f
        if(float(Health) > float(default.Health) * 0.30)
        {
            PlaySoundHK(StaySound, 0, 1.0, false, 1500.0,, true, true);
        }
        // End:0x8a
        else
        {
            PlaySoundHK(MoveDamagedSound, 0, 1.0, false, 1500.0,, true, true);
        }
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    LoopAnim('Idle');
    // End:0x22
    if(BehaviorState <= 1)
    {
        ClientPlayMoveSound();
    }
    // End:0x28
    else
    {
        ClientPlayStaySound();
    }
    Level.Helicopters[Level.Helicopters.Length] = self;
}

function RangedAttack(Actor A)
{
    local Vector Adjust;

    // End:0x0b
    if(bShotAnim)
    {
        return;
    }
    // End:0xd4
    if(VSize(A.Location - Location) < MeleeRange + CollisionRadius + A.CollisionRadius)
    {
        Adjust = vect(0.0, 0.0, 0.0);
        Adjust.Z = Controller.Target.CollisionHeight;
        Acceleration = AccelRate * Normal(Controller.Target.Location - Location + Adjust);
        // End:0xc6
        if(FRand() < 0.50)
        {
            SetAnimAction('TwoPunch');
        }
        // End:0xd1
        else
        {
            SetAnimAction('Pound');
        }
    }
    // End:0xdf
    else
    {
        SetAnimAction('Belch');
    }
    bShotAnim = true;
}

function bool Dodge(Engine.Actor.EDoubleClickDir DoubleClickMove)
{
    local Vector X, Y, Z, duckDir;

    GetAxes(Rotation, X, Y, Z);
    // End:0x34
    if(DoubleClickMove == 3)
    {
        duckDir = X;
    }
    // End:0x9d
    else
    {
        // End:0x5b
        if(DoubleClickMove == 4)
        {
            duckDir = float(-1) * X;
        }
        // End:0x9d
        else
        {
            // End:0x79
            if(DoubleClickMove == 1)
            {
                duckDir = Y;
            }
            // End:0x9d
            else
            {
                // End:0x9d
                if(DoubleClickMove == 2)
                {
                    duckDir = float(-1) * Y;
                }
            }
        }
    }
    Controller.Destination = Location + float(200) * duckDir;
    Velocity = AirSpeed * duckDir;
    Controller.GotoState('TacticalMove', 'DoMove');
    return true;
}

function SetMovementPhysics()
{
    SetPhysics(4);
}

singular function Falling()
{
    SetPhysics(4);
}

simulated function PlayDirectionalDeath(Vector HitLoc);
simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange);
function PlayVictory();
function SpawnBelch()
{
    FireProjectile();
}

function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Location + 0.50 * X;
}

function PunchDamageTarget();
function PoundDamageTarget();
function name GetWeaponBoneFor(Inventory i)
{
    return 'Bone_MainWeapon_Turret';
}

function bool deleOnReachedDestination(Vector Dir, Actor GoalActor)
{
    local float Size;

    Size = VSize(Dir);
    return Size < HelicopterDestinationFactor;
}

simulated function class<wEmitter> GetBloodHitClass(bool bHeadShot)
{
    return GibGroupClass.default.HelicopterHitClass;
}

function TossWeapon(Vector TossVel);
static function NavigationPoint GetFlyingPathNode(LevelInfo Level, int idx, optional int RegenLoc)
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:
    // End:0x8e [While If]
    if(N != none)
    {
        // End:0x77
        if(N.IsA('FlyingPathNode') && FlyingPathNode(N).iPathPoint == idx && FlyingPathNode(N).RegenLoc == RegenLoc)
        {
            return N;
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return none;
}

static function bool Call(LevelInfo Level, wHelicopter lastHeli, Controller Caller)
{
    local class<wBotVehicle> mClass;
    local wBotVehicle wHeli;
    local NavigationPoint N;
    local Vector loc, focal;
    local int iCurrentPoint, Health;
    local Rotator Rotation;

    // End:0xff
    if(lastHeli == none)
    {
        N = GetFlyingPathNode(Level, 0 + Caller.GetTeamNum() * 100);
        // End:0x4f
        if(N == none)
        {
            N = GetFlyingPathNode(Level, 0);
        }
        loc = N.Location;
        N = GetFlyingPathNode(Level, 1 + Caller.GetTeamNum() * 100);
        // End:0xa7
        if(N == none)
        {
            N = GetFlyingPathNode(Level, 1);
        }
        focal = N.Location;
        iCurrentPoint = FlyingPathNode(N).iPathPoint;
        Health = class'wHelicopter'.default.Health;
        Rotation = rotator(focal - loc);
    }
    // End:0x16c
    else
    {
        loc = lastHeli.Location;
        iCurrentPoint = lastHeli.iCurrentPoint;
        Health = lastHeli.Health;
        Rotation = lastHeli.Rotation;
        lastHeli.bHidden = true;
        lastHeli.Destroy();
    }
    // End:0x18f
    if(Caller.GetTeamNum() == 0)
    {
        mClass = class'wHelicopter';
    }
    // End:0x19a
    else
    {
        mClass = class'wHelicopterRSA';
    }
    wHeli = Level.Spawn(mClass,,, loc, Rotation);
    Caller.PlayerReplicationInfo.bySupply_Helipack = 0;
    // End:0x1fd
    if(wHeli == none)
    {
        Log("failed to spawn wHeli");
        return false;
    }
    wHelicopter(wHeli).iCurrentPoint = iCurrentPoint;
    wHeli.Health = Health;
    Level.Game.AddDefaultInventory(wHeli);
    wHelicopter(wHeli).SetCaller(Caller);
    wHeli.TeamIndex = Caller.Pawn.GetTeamNum();
    Level.Game.AnnounceHelicopter(Caller);
    return true;
}

state Dying
{
    function Timer()
    {
        // End:0x25
        if(!bHidden && bBombExplosion)
        {
            Spawn(class'XWFX_Grenade_explosion',,, Location);
        }
    }

    event Landed(Vector HitNormal)
    {
        Destroy();
    }

    function BeginState()
    {
        local int i;

        super.BeginState();
        SetTimer(CONFIG_DyingEffectInterval, true);
        LifeSpan = CONFIG_DyingLifeSpan;
        SetPhysics(2);
        Log("[wHelicopter::BeginState] SetPhysics(PHYS_Falling)");
        bInvulnerableBody = true;
        i = 0;
        J0x64:
        // End:0xa4 [While If]
        if(i < Attached.Length)
        {
            // End:0x9a
            if(Attached[i] != none)
            {
                Attached[i].PawnBaseDied();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x64;
        }
        bForceDesiredRotation = true;
        // End:0xd1
        if(!bHidden && bBombExplosion)
        {
            Spawn(class'XWFX_SD_Bomb_explosion',,, Location);
        }
    }

    function EndState()
    {
        super(Object).EndState();
    }

    function Tick(float dt)
    {
        CumulatedDyingTime += dt;
        RotationRate.Yaw = 30000;
        DesiredRotation = Rotation;
        DesiredRotation.Yaw += int(CONFIG_DyingRotationRate * CumulatedDyingTime * CONFIG_DyingRotationFactor * dt);
        AddVelocity(MakeVector(0.0, 0.0, CumulatedDyingTime * CONFIG_DyingImpluseFactor * CONFIG_DyingImpluse));
    }

}

defaultproperties
{
    iCurrentPoint=1
    HelicopterDestinationFactor=200.0
    CONFIG_DyingLifeSpan=7.0
    CONFIG_DyingRotationFactor=2.0
    CONFIG_DyingRotationRate=20000.0
    CONFIG_DyingEffectInterval=0.250
    CONFIG_DyingImpluse=-200.0
    CONFIG_DyingImpluseFactor=2.0
    CONFIG_FinalExplosionSoundExplosion=SoundGroup'Warfare_Sound_Vehicle.bombing.veh_bombing_burst_near'
    CONFIG_FinalExlosionSoundRadius=3000.0
    bBombExplosion=true
    MinimapIconAlly=(WidgetTexture=TexRotator'Warfare_GP_UI_HUD_ETC.minimapicon.icon_wh_heli_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=127,Y2=127),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemy=(WidgetTexture=TexRotator'Warfare_GP_UI_HUD_ETC.minimapicon.icon_r_heli_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=127,Y2=127),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    bMeleeFighter=true
    bCanDodge=true
    DodgeSkillAdjust=4.0
    ProjectileClass=Class'Engine.wRocket'
    ScoringValue=5
    StaySound=Sound'Warfare_Sound_Vehicle.hind.veh_hind_stop'
    MoveSound=Sound'Warfare_Sound_Vehicle.hind.veh_hind_move'
    MoveDamagedSound=SoundGroup'Warfare_Sound_Vehicle.hind.veh_hind_damaged'
    SpindownSound=Sound'Warfare_Sound_Vehicle.hind.veh_hind_spindown'
    CONFIG_SPINDOWN_SOUND_RADIUS=2000.0
    sndScream=none
    sndDie=none
    wRequiredEquipment=// Object reference not set to an instance of an object.
    
    bCanFly=true
    AirSpeed=1200.0
    AccelRate=10.0
    Health=2000
    ControllerClass=class'wHelicopterController'
    DodgeAnims[0]=Idle
    DodgeAnims[1]=Idle
    DodgeAnims[2]=Idle
    DodgeAnims[3]=Idle
    IdleWeaponAnim=Idle
    MovementAnims[0]=Idle
    MovementAnims[1]=Idle
    MovementAnims[2]=Idle
    MovementAnims[3]=Idle
    TakeoffStillAnim=Idle
    AirStillAnim=Idle
    TakeoffAnims[0]=Idle
    TakeoffAnims[1]=Idle
    TakeoffAnims[2]=Idle
    TakeoffAnims[3]=Idle
    AirAnims[0]=Idle
    AirAnims[1]=Idle
    AirAnims[2]=Idle
    AirAnims[3]=Idle
    LandAnims[0]=Idle
    LandAnims[1]=Idle
    LandAnims[2]=Idle
    LandAnims[3]=Idle
    CrouchAnims[0]=Idle
    CrouchAnims[1]=Idle
    CrouchAnims[2]=Idle
    CrouchAnims[3]=Idle
    OnReachedDestination=deleOnReachedDestination
    Mesh=SkeletalMesh'VH_Heli_Ah64apache.AH64_APACHE'
    SoundOcclusion=1
    CollisionRadius=500.0
    CollisionHeight=400.0
    Mass=120.0
    RotationRate=(Pitch=20,Yaw=4000,Roll=100)
}