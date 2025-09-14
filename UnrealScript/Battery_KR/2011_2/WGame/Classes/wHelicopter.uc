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

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        BehaviorState;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        ClientStopAllHeliSound, iCurrentPoint;
}

simulated function RemoveLevelHelicopter()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x5C [Loop If]
    if(lp1 < Level.Helicopters.Length)
    {
        // End:0x52
        if(Level.Helicopters[lp1] == self)
        {
            Level.Helicopters.Remove(lp1, 1);
            // [Explicit Break]
            goto J0x5C;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x5C:

    //return;    
}

event Destroyed()
{
    super.Destroyed();
    // End:0x20
    if(!bHidden)
    {
        Spawn(Class'XEffects.XWFX_SD_Bomb_explosion',,, Location);
    }
    StopLoopSoundByActor();
    // End:0x42
    if(!bHidden)
    {
        PlaySound(CONFIG_FinalExplosionSoundExplosion, 10,,, CONFIG_FinalExlosionSoundRadius);
    }
    RemoveLevelHelicopter();
    //return;    
}

simulated function StopAllHeliSound()
{
    dblog("[wHelicopter::StopAllHeliSound]");
    //return;    
}

simulated function ClientStopAllHeliSound()
{
    StopLoopSoundByActor();
    //return;    
}

simulated function ClientPlayMoveSound()
{
    Log("[wHelicopter::ClientPlayMoveSound]");
    StopLoopSoundByActor();
    // End:0x8A
    if(!bHidden)
    {
        // End:0x6F
        if(float(Health) > (float(default.Health) * 0.3000000))
        {
            PlaySoundHK(MoveSound, 0, 1.0000000, false, 4000.0000000,, true, true);            
        }
        else
        {
            PlaySoundHK(MoveDamagedSound, 0, 1.0000000, false, 4000.0000000,, true, true);
        }
    }
    //return;    
}

simulated function ClientPlayStaySound()
{
    Log("[wHelicopter::ClientPlayStaySound]");
    StopLoopSoundByActor();
    // End:0x8A
    if(!bHidden)
    {
        // End:0x6F
        if(float(Health) > (float(default.Health) * 0.3000000))
        {
            PlaySoundHK(StaySound, 0, 1.0000000, false, 4000.0000000,, true, true);            
        }
        else
        {
            PlaySoundHK(MoveDamagedSound, 0, 1.0000000, false, 4000.0000000,, true, true);
        }
    }
    //return;    
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
    else
    {
        ClientPlayStaySound();
    }
    Level.Helicopters[Level.Helicopters.Length] = self;
    //return;    
}

function RangedAttack(Actor A)
{
    local Vector Adjust;

    // End:0x0B
    if(bShotAnim)
    {
        return;
    }
    // End:0xD4
    if(VSize(A.Location - Location) < ((MeleeRange + CollisionRadius) + A.CollisionRadius))
    {
        Adjust = vect(0.0000000, 0.0000000, 0.0000000);
        Adjust.Z = Controller.Target.CollisionHeight;
        Acceleration = AccelRate * Normal((Controller.Target.Location - Location) + Adjust);
        // End:0xC6
        if(FRand() < 0.5000000)
        {
            SetAnimAction('TwoPunch');            
        }
        else
        {
            SetAnimAction('Pound');
        }        
    }
    else
    {
        SetAnimAction('Belch');
    }
    bShotAnim = true;
    //return;    
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
    local Vector X, Y, Z, duckDir;

    GetAxes(Rotation, X, Y, Z);
    // End:0x34
    if(int(DoubleClickMove) == int(3))
    {
        duckDir = X;        
    }
    else
    {
        // End:0x5B
        if(int(DoubleClickMove) == int(4))
        {
            duckDir = float(-1) * X;            
        }
        else
        {
            // End:0x79
            if(int(DoubleClickMove) == int(1))
            {
                duckDir = Y;                
            }
            else
            {
                // End:0x9D
                if(int(DoubleClickMove) == int(2))
                {
                    duckDir = float(-1) * Y;
                }
            }
        }
    }
    Controller.Destination = Location + (float(200) * duckDir);
    Velocity = AirSpeed * duckDir;
    Controller.GotoState('TacticalMove', 'DoMove');
    return true;
    //return;    
}

function SetMovementPhysics()
{
    SetPhysics(4);
    //return;    
}

singular function Falling()
{
    SetPhysics(4);
    //return;    
}

simulated function PlayDirectionalDeath(Vector HitLoc)
{
    //return;    
}

simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange)
{
    //return;    
}

function PlayVictory()
{
    //return;    
}

function SpawnBelch()
{
    FireProjectile();
    //return;    
}

function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Location + (0.5000000 * X);
    //return;    
}

function PunchDamageTarget()
{
    //return;    
}

function PoundDamageTarget()
{
    //return;    
}

function name GetWeaponBoneFor(Inventory i)
{
    return 'Bone_MainWeapon_Turret';
    //return;    
}

function bool deleOnReachedDestination(Vector Dir, Actor GoalActor)
{
    local float Size;

    Size = VSize(Dir);
    return Size < HelicopterDestinationFactor;
    //return;    
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    //return;    
}

function TossWeapon(Vector TossVel)
{
    //return;    
}

function TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer)
{
    //return;    
}

static function NavigationPoint GetFlyingPathNode(LevelInfo Level, int idx)
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:

    // End:0x6F [Loop If]
    if(N != none)
    {
        // End:0x58
        if(N.IsA('FlyingPathNode') && FlyingPathNode(N).iPathPoint == idx)
        {
            return N;
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

static function bool Call(LevelInfo Level, wHelicopter lastHeli, Controller Caller)
{
    local Class<wBotVehicle> mClass;
    local wBotVehicle wHeli;
    local NavigationPoint N;
    local Vector loc, focal;
    local int iCurrentPoint, Health;
    local Rotator Rotation;

    // End:0xFF
    if(lastHeli == none)
    {
        N = GetFlyingPathNode(Level, 0 + (Caller.GetTeamNum() * 100));
        // End:0x4F
        if(N == none)
        {
            N = GetFlyingPathNode(Level, 0);
        }
        loc = N.Location;
        N = GetFlyingPathNode(Level, 1 + (Caller.GetTeamNum() * 100));
        // End:0xA7
        if(N == none)
        {
            N = GetFlyingPathNode(Level, 1);
        }
        focal = N.Location;
        iCurrentPoint = FlyingPathNode(N).iPathPoint;
        Health = Class'WGame_Decompressed.wHelicopter'.default.Health;
        Rotation = Rotator(focal - loc);        
    }
    else
    {
        loc = lastHeli.Location;
        iCurrentPoint = lastHeli.iCurrentPoint;
        Health = lastHeli.Health;
        Rotation = lastHeli.Rotation;
        lastHeli.bHidden = true;
        lastHeli.Destroy();
    }
    // End:0x18F
    if(Caller.GetTeamNum() == 0)
    {
        mClass = Class'WGame_Decompressed.wHelicopter';        
    }
    else
    {
        mClass = Class'WGame_Decompressed.wHelicopterRSA';
    }
    wHeli = Level.Spawn(mClass,,, loc, Rotation);
    Caller.PlayerReplicationInfo.bySupply_Helipack = 0;
    // End:0x1FD
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
    //return;    
}

state Dying
{
    function Timer()
    {
        // End:0x1A
        if(!bHidden)
        {
            Spawn(Class'XEffects.XWFX_Grenade_explosion',,, Location);
        }
        //return;        
    }

    event Landed(Vector HitNormal)
    {
        Destroy();
        //return;        
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

        // End:0xA4 [Loop If]
        if(i < Attached.Length)
        {
            // End:0x9A
            if(Attached[i] != none)
            {
                Attached[i].PawnBaseDied();
            }
            i++;
            // [Loop Continue]
            goto J0x64;
        }
        bForceDesiredRotation = true;
        // End:0xC6
        if(!bHidden)
        {
            Spawn(Class'XEffects.XWFX_SD_Bomb_explosion',,, Location);
        }
        //return;        
    }

    function EndState()
    {
        super(Object).EndState();
        //return;        
    }

    function Tick(float dt)
    {
        CumulatedDyingTime += dt;
        RotationRate.Yaw = 30000;
        DesiredRotation = Rotation;
        DesiredRotation.Yaw += int(((CONFIG_DyingRotationRate * CumulatedDyingTime) * CONFIG_DyingRotationFactor) * dt);
        AddVelocity(MakeVector(0.0000000, 0.0000000, (CumulatedDyingTime * CONFIG_DyingImpluseFactor) * CONFIG_DyingImpluse));
        //return;        
    }
    stop;    
}

defaultproperties
{
    iCurrentPoint=1
    HelicopterDestinationFactor=200.0000000
    CONFIG_DyingLifeSpan=7.0000000
    CONFIG_DyingRotationFactor=2.0000000
    CONFIG_DyingRotationRate=20000.0000000
    CONFIG_DyingEffectInterval=0.2500000
    CONFIG_DyingImpluse=-200.0000000
    CONFIG_DyingImpluseFactor=2.0000000
    CONFIG_FinalExplosionSoundExplosion=SoundGroup'Warfare_Sound_Vehicle.bombing.veh_bombing_burst_near'
    CONFIG_FinalExlosionSoundRadius=6000.0000000
    bMeleeFighter=false
    bCanDodge=false
    DodgeSkillAdjust=4.0000000
    ProjectileClass=Class'Engine.wRocket'
    ScoringValue=5
    StaySound=Sound'Warfare_Sound_Vehicle.hind.veh_hind_stop'
    MoveSound=Sound'Warfare_Sound_Vehicle.hind.veh_hind_move'
    MoveDamagedSound=SoundGroup'Warfare_Sound_Vehicle.hind.veh_hind_damaged'
    SpindownSound=Sound'Warfare_Sound_Vehicle.hind.veh_hind_spindown'
    wRequiredEquipment[0]=50001
    wRequiredEquipment[1]=50002
    wRequiredEquipment[2]=50005
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
    bCanFly=true
    AirSpeed=1200.0000000
    AccelRate=10.0000000
    Health=2000
    ControllerClass=Class'WGame_Decompressed.wHelicopterController'
    DodgeAnims[0]="Idle"
    DodgeAnims[1]="Idle"
    DodgeAnims[2]="Idle"
    DodgeAnims[3]="Idle"
    IdleWeaponAnim="Idle"
    MovementAnims[0]="Idle"
    MovementAnims[1]="Idle"
    MovementAnims[2]="Idle"
    MovementAnims[3]="Idle"
    TakeoffStillAnim="Idle"
    AirStillAnim="Idle"
    TakeoffAnims[0]="Idle"
    TakeoffAnims[1]="Idle"
    TakeoffAnims[2]="Idle"
    TakeoffAnims[3]="Idle"
    AirAnims[0]="Idle"
    AirAnims[1]="Idle"
    AirAnims[2]="Idle"
    AirAnims[3]="Idle"
    LandAnims[0]="Idle"
    LandAnims[1]="Idle"
    LandAnims[2]="Idle"
    LandAnims[3]="Idle"
    CrouchAnims[0]="Idle"
    CrouchAnims[1]="Idle"
    CrouchAnims[2]="Idle"
    CrouchAnims[3]="Idle"
    OnReachedDestination=wHelicopter.deleOnReachedDestination
    Mesh=SkeletalMesh'VH_Heli_Ah64apache.AH64_APACHE'
    SoundOcclusion=1
    CollisionRadius=500.0000000
    CollisionHeight=400.0000000
    Mass=120.0000000
    RotationRate=(Pitch=20,Yaw=4000,Roll=100)
}