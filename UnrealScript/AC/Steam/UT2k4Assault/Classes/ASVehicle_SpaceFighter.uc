/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicle_SpaceFighter.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:47
 *	Functions:41
 *	States:1
 *
 *******************************************************************************/
class ASVehicle_SpaceFighter extends ASVehicle
    abstract;

const SpeedFilterFrames = 20;

var Quat SpaceFighterRotation;
var float YawAccel;
var float PitchAccel;
var float RollAccel;
var float DesiredVelocity;
var() const float EngineMinVelocity;
var() const float VehicleRotationSpeed;
var() const float RotationInertia;
var() float StrafeAccel;
var() float StrafeAccelRate;
var() float MaxStrafe;
var() float RollAutoCorrectSpeed;
var bool bInitialized;
var bool bPostNetCalled;
var bool bGearUp;
var bool bSpeedFilterWarmup;
var bool bAutoTarget;
var bool bTargetClosestToCrosshair;
var bool bRocketLoaded;
var bool bHumanShip;
var Rotator ShotDownRotation;
var int TopGunCount;
var name FlyingAnim;
var Rotator LastCamRot;
var float myDeltaTime;
var float LastTimeSeconds;
var float CamRotationInertia;
var string DelayedDebugString;
var localized string Text_Speed;
var Emitter TrailEmitter;
var float TrailOffset;
var Emitter SmokeTrail;
var class<Emitter> ShotDownFXClass;
var float SpeedFilter[20];
var int NextSpeedFilterSlot;
var float SmoothedSpeedRatio;
var Vector RocketOffset;
var class<Actor> GenericShieldEffect[2];
var float NextShieldTime;
var Vehicle CurrentTarget;
var float MaxTargetingRange;
var float LastAutoTargetTime;
var Vector CrosshairPos;
var Sound TargetAcquiredSound;
var Texture WeaponInfoTexture;
var Texture SpeedInfoTexture;
var Sound RocketLoadedSound;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && bNetOwner && Role == 4)
        CurrentTarget;

    // Pos:0x23
    reliable if(Role < 4)
        ServerNextTarget, ServerPrevTarget,
        ServerSetTarget;

}

function BlowUp(Vector HitNormal);
simulated function PostNetBeginPlay()
{
    super(Pawn).PostNetBeginPlay();
    bPostNetCalled = true;
    PlayTakeOff();
    // End:0x51
    if(ASGameInfo(Level.Game) != none)
    {
        bThumped = ASGameInfo(Level.Game).DivertSpaceFighter();
    }
}

simulated function PlayTakeOff();
simulated event TeamChanged()
{
    // End:0x25
    if(Level.NetMode != 1)
    {
        SetTrailFX();
        AdjustFX();
    }
}

simulated function SetTrailFX();
simulated function Destroyed()
{
    // End:0x17
    if(TrailEmitter != none)
    {
        TrailEmitter.Destroy();
    }
    // End:0x2e
    if(SmokeTrail != none)
    {
        SmokeTrail.Destroy();
    }
    super.Destroyed();
}

function PossessedBy(Controller C)
{
    super.PossessedBy(C);
    Velocity = EngineMinVelocity * vector(Rotation);
    Acceleration = Velocity;
}

function Vector GetBotError(Vector StartLocation)
{
    local Vector ErrorDir, VelDir;

    Controller.ShotTarget = Pawn(Controller.Target);
    ErrorDir = Normal(Controller.Target.Location - Location Cross vect(0.0, 0.0, 1.0));
    // End:0xb6
    if(Controller.Target != OldTarget)
    {
        BotError = float(1500) - float(100) * Level.Game.GameDifficulty * ErrorDir;
        OldTarget = Controller.Target;
    }
    VelDir = Normal(Controller.Target.Velocity);
    BotError += float(100) - float(200) * FRand() * ErrorDir + VelDir;
    // End:0x165
    if(Level.Game.GameDifficulty < float(6) && VSize(BotError) < float(120))
    {
        // End:0x153
        if(BotError Dot VelDir < float(0))
        {
            BotError += float(10) * VelDir;
        }
        // End:0x165
        else
        {
            BotError -= float(10) * VelDir;
        }
    }
    // End:0x19a
    if(Pawn(OldTarget) != none && Pawn(OldTarget).bStationary)
    {
        BotError *= 0.60;
    }
    BotError = Normal(BotError) * FMin(VSize(BotError), FMin(1500.0 - float(100) * Level.Game.GameDifficulty, 0.20 * VSize(Controller.Target.Location - StartLocation)));
    return BotError;
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    super.ClientKDriverEnter(PC);
    Velocity = EngineMinVelocity * vector(Rotation);
    Acceleration = Velocity;
}

function bool KDriverLeave(bool bForceLeave)
{
    // End:0x3d
    if(bForceLeave)
    {
        // End:0x38
        if(super.KDriverLeave(bForceLeave))
        {
            // End:0x35
            if(!bDeleteMe && !IsInState('Dying'))
            {
                Destroy();
            }
        }
        // End:0x3a
        else
        {
            return false;
        }
    }
    // End:0x45
    else
    {
        TargetUnSet();
        return false;
    }
}

function DriverDied()
{
    TakeDamage(default.Health * 2, self, Location, vect(0.0, 0.0, 0.0), none);
}

function bool CanAttack(Actor Other)
{
    // End:0x1d
    if(Controller != none)
    {
        return Controller.LineOfSightTo(Other);
    }
    return false;
}

simulated function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
    local Vector X, Y, Z;
    local float CurrentSpeed, EngineAccel, RotationSmoothFactor, RollChange;
    local Rotator NewRotation;

    // End:0x1a
    if(!bPostNetCalled || Controller == none)
    {
        return;
    }
    // End:0x52
    if(!bInitialized)
    {
        Acceleration = EngineMinVelocity * vector(Rotation);
        SpaceFighterRotation = QuatFromRotator(Rotation);
        bInitialized = true;
    }
    // End:0x98
    if(bGearUp)
    {
        DesiredVelocity = FClamp(DesiredVelocity + PlayerController(Controller).aForward * DeltaTime / 15.0, EngineMinVelocity, 1000.0);
    }
    // End:0xa3
    else
    {
        DesiredVelocity = EngineMinVelocity;
    }
    CurrentSpeed = FClamp(Velocity Dot vector(Rotation) * 1000.0 / AirSpeed, 0.0, 1000.0);
    EngineAccel = DesiredVelocity - CurrentSpeed * 100.0;
    RotationSmoothFactor = FClamp(1.0 - RotationInertia * DeltaTime, 0.0, 1.0);
    // End:0x174
    if(PlayerController(Controller).bDuck > 0 && Abs(float(Rotation.Roll)) > float(500))
    {
        // End:0x164
        if(Rotation.Roll < 0)
        {
            RollChange = RollAutoCorrectSpeed;
        }
        // End:0x171
        else
        {
            RollChange = -RollAutoCorrectSpeed;
        }
    }
    // End:0x1af
    else
    {
        // End:0x1af
        if(PlayerController(Controller).aUp > float(0))
        {
            RollChange = PlayerController(Controller).aStrafe * 0.660;
        }
    }
    YawAccel = RotationSmoothFactor * YawAccel + DeltaTime * VehicleRotationSpeed * YawChange;
    PitchAccel = RotationSmoothFactor * PitchAccel + DeltaTime * VehicleRotationSpeed * PitchChange;
    RollAccel = RotationSmoothFactor * RollAccel + DeltaTime * VehicleRotationSpeed * RollChange;
    YawAccel = FClamp(YawAccel, -AirSpeed, AirSpeed);
    PitchAccel = FClamp(PitchAccel, -AirSpeed, AirSpeed);
    RollAccel = FClamp(RollAccel, -AirSpeed, AirSpeed);
    GetAxes(QuatToRotator(SpaceFighterRotation), X, Y, Z);
    SpaceFighterRotation = QuatProduct(SpaceFighterRotation, QuatProduct(QuatFromAxisAndAngle(Y, DeltaTime * PitchAccel), QuatProduct(QuatFromAxisAndAngle(Z, -1.0 * DeltaTime * YawAccel), QuatFromAxisAndAngle(X, DeltaTime * RollAccel))));
    NewRotation = QuatToRotator(SpaceFighterRotation);
    // End:0x37f
    if(PlayerController(Controller).bDuck > 0 && NewRotation.Roll < 0 && Rotation.Roll > 0 || NewRotation.Roll > 0 && Rotation.Roll < 0)
    {
        NewRotation.Roll = 0;
        RollAccel = 0.0;
    }
    Acceleration = vector(NewRotation) * DesiredVelocity;
    StrafeAccel = RotationSmoothFactor * StrafeAccel;
    // End:0x3e8
    if(PlayerController(Controller).aUp == float(0))
    {
        StrafeAccel += DeltaTime * StrafeAccelRate * PlayerController(Controller).aStrafe;
    }
    StrafeAccel = FClamp(StrafeAccel, -MaxStrafe, MaxStrafe);
    GetAxes(NewRotation, X, Y, Z);
    Acceleration += StrafeAccel * Y;
    NewRotation.Roll += int(StrafeAccel * float(15));
    DelayedDebugString = "NewRotation.Roll:" @ string(NewRotation.Roll) @ "StrafeAccel:" @ string(StrafeAccel);
    bRotateToDesired = true;
    bRollToDesired = true;
    DesiredRotation = NewRotation;
    SetRotation(NewRotation);
}

function ProcessMove(float DeltaTime, Vector NewAccel, Engine.Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
    // End:0x56
    if(Role == 4)
    {
        // End:0x1d
        if(!bPostNetCalled)
        {
            return;
        }
        UpdateAutoTargetting();
        // End:0x56
        if(VSize(Velocity) < float(100))
        {
            TakeDamage(default.Health * 2, self, Location, vect(0.0, 0.0, 0.0), none);
        }
    }
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local Vector X, Y, Z;
    local float ForwardVelocity;
    local Controller C;

    super(Vehicle).DisplayDebug(Canvas, YL, YPos);
    // End:0xad
    if(Controller == none)
    {
        Canvas.SetDrawColor(byte(255), 0, 0);
        Canvas.DrawText("LOCAL CONTROLLER");
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
        C = Level.GetLocalPlayerController();
        C.DisplayDebug(Canvas, YL, YPos);
    }
    Canvas.DrawText("-- SPACEFIGHTER");
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    GetAxes(Rotation, X, Y, Z);
    Canvas.DrawText("-- GetAxes, X:" @ string(X) $ ", Y:" @ string(Y) $ ", Z:" @ string(Z));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("-- Acceleration:" @ string(Acceleration));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    ForwardVelocity = Velocity Dot vector(Rotation);
    Canvas.DrawText("-- Gear:" @ string(DesiredVelocity / 10.0) $ "% Forward Velocity:" @ string(ForwardVelocity));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("-- DDS" @ DelayedDebugString);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

simulated function Rotator GetViewRotation()
{
    // End:0x25
    if(IsLocallyControlled() && Health > 0)
    {
        return QuatToRotator(SpaceFighterRotation);
    }
    // End:0x2b
    else
    {
        return Rotation;
    }
}

simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector X, Y, Z;
    local Rotator R;

    CameraLocation = Location;
    ViewActor = self;
    R = GetViewRotation();
    GetAxes(R, X, Y, Z);
    CameraRotation = Normalize(R + PC.ShakeRot);
    CameraLocation = CameraLocation + PC.ShakeOffset.X * X + PC.ShakeOffset.Y * Y + PC.ShakeOffset.Z * Z;
    CameraLocation = CameraLocation + FPCamPos >> GetViewRotation();
}

simulated function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector CamLookAt, HitLocation, HitNormal;
    local PlayerController PC;
    local float CamDistFactor;
    local Vector CamDistance;
    local Rotator CamRotationRate, TargetRotation;

    PC = PlayerController(Controller);
    // End:0x33
    if(PC == none || PC.ViewTarget == none)
    {
        return false;
    }
    ViewActor = self;
    // End:0x6a
    if(!PC.bBehindView)
    {
        SpecialCalcFirstPersonView(PC, ViewActor, CameraLocation, CameraRotation);
        return true;
    }
    myDeltaTime = Level.TimeSeconds - LastTimeSeconds;
    LastTimeSeconds = Level.TimeSeconds;
    CamLookAt = ViewActor.Location + vect(60.0, 0.0, 0.0) >> ViewActor.Rotation;
    // End:0xe7
    if(ViewActor == self)
    {
        TargetRotation = GetViewRotation();
    }
    // End:0xfb
    else
    {
        TargetRotation = ViewActor.Rotation;
    }
    // End:0x142
    if(IsInState('ShotDown'))
    {
        TargetRotation.Yaw += 32768;
        Normalize(TargetRotation);
        CamRotationInertia = default.CamRotationInertia * 10.0;
        CamDistFactor = 2.0;
    }
    // End:0x186
    else
    {
        // End:0x16d
        if(IsInState('Dying'))
        {
            CamRotationInertia = default.CamRotationInertia * 50.0;
            CamDistFactor = 3.0;
        }
        // End:0x186
        else
        {
            CamDistFactor = 1.0 - DesiredVelocity / AirSpeed;
        }
    }
    CamRotationRate = Normalize(TargetRotation - LastCamRot);
    CameraRotation.Yaw = int(CalcInertia(myDeltaTime, CamRotationInertia, float(CamRotationRate.Yaw), float(LastCamRot.Yaw)));
    CameraRotation.Pitch = int(CalcInertia(myDeltaTime, CamRotationInertia, float(CamRotationRate.Pitch), float(LastCamRot.Pitch)));
    CameraRotation.Roll = int(CalcInertia(myDeltaTime, CamRotationInertia, float(CamRotationRate.Roll), float(LastCamRot.Roll)));
    LastCamRot = CameraRotation;
    CamDistance = vect(-180.0, 0.0, 80.0);
    CamDistance.X -= CamDistFactor * 200.0;
    CameraLocation = CamLookAt + CamDistance >> CameraRotation;
    // End:0x2da
    if(Trace(HitLocation, HitNormal, CameraLocation, ViewActor.Location, false, vect(10.0, 10.0, 10.0)) != none)
    {
        CameraLocation = HitLocation + HitNormal * float(10);
    }
    return true;
}

simulated function bool IsTargetRelevant(Vehicle Target)
{
    // End:0x0d
    if(Target == none)
    {
        return false;
    }
    // End:0x78
    if(Target.Team == Team || Target.Health < 1 || Target.bDeleteMe || VSize(Location - Target.Location) > MaxTargetingRange)
    {
        return false;
    }
    // End:0xa0
    if(Target.Location - Location Dot vector(Rotation) < float(0))
    {
        return false;
    }
    return true;
}

simulated function PrevWeapon()
{
    ServerPrevTarget(false);
}

simulated function NextWeapon()
{
    ServerNextTarget(false);
}

exec function TargetClosestToCrosshair()
{
    bTargetClosestToCrosshair = true;
}

function ServerNextTarget(bool bTryOnce)
{
    local float CurrentTargetDist, BestDist, dist;
    local Controller C;
    local Vehicle V, BestV;
    local int numtargets;

    BestDist = MaxTargetingRange;
    // End:0x22
    if(!IsTargetRelevant(CurrentTarget))
    {
        CurrentTarget = none;
    }
    // End:0x4d
    if(CurrentTarget != none)
    {
        CurrentTargetDist = VSize(Location - CurrentTarget.Location);
    }
    // End:0x58
    else
    {
        CurrentTargetDist = 0.0;
    }
    C = Level.ControllerList;
    J0x6c:
    // End:0x13d [While If]
    if(C != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x126
        if(V != none && V != CurrentTarget && IsTargetRelevant(V))
        {
            dist = VSize(Location - V.Location);
            ++ numtargets;
            // End:0x126
            if(dist > CurrentTargetDist && dist < BestDist && LineOfSightTo(V))
            {
                BestV = V;
                BestDist = dist;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x6c;
    }
    // End:0x156
    if(BestV != none)
    {
        ServerSetTarget(BestV);
    }
    // End:0x189
    else
    {
        // End:0x189
        if(!bTryOnce && CurrentTarget != none && numtargets > 0)
        {
            CurrentTarget = none;
            ServerNextTarget(true);
        }
    }
}

function ServerPrevTarget(bool bTryOnce)
{
    local float CurrentTargetDist, BestDist, dist;
    local Controller C;
    local Vehicle V, BestV;
    local int numtargets;

    // End:0x17
    if(!IsTargetRelevant(CurrentTarget))
    {
        CurrentTarget = none;
    }
    // End:0x42
    if(CurrentTarget != none)
    {
        CurrentTargetDist = VSize(Location - CurrentTarget.Location);
    }
    // End:0x4d
    else
    {
        CurrentTargetDist = MaxTargetingRange;
    }
    C = Level.ControllerList;
    J0x61:
    // End:0x132 [While If]
    if(C != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x11b
        if(V != none && V != CurrentTarget && IsTargetRelevant(V))
        {
            ++ numtargets;
            dist = VSize(Location - V.Location);
            // End:0x11b
            if(dist < CurrentTargetDist && dist > BestDist && LineOfSightTo(V))
            {
                BestV = V;
                BestDist = dist;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x61;
    }
    // End:0x14b
    if(BestV != none)
    {
        ServerSetTarget(BestV);
    }
    // End:0x17e
    else
    {
        // End:0x17e
        if(!bTryOnce && CurrentTarget != none && numtargets > 0)
        {
            CurrentTarget = none;
            ServerPrevTarget(true);
        }
    }
}

function ServerSetTarget(Vehicle NewTarget)
{
    // End:0x29
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).ClientPlaySound(TargetAcquiredSound);
    }
    CurrentTarget = NewTarget;
    bAutoTarget = false;
}

function TargetUnSet()
{
    CurrentTarget = none;
    bAutoTarget = true;
}

function UpdateAutoTargetting()
{
    local float BestDist, dist;
    local Controller C;
    local Vehicle V, BestV;

    // End:0x12
    if(Role != 4)
    {
        return;
    }
    // End:0x9d
    if(CurrentTarget == none || CurrentTarget.Health < 1 || CurrentTarget.bDeleteMe || VSize(CurrentTarget.Location - Location) > MaxTargetingRange)
    {
        // End:0x95
        if(CurrentTarget != none)
        {
            PlayerController(Controller).ClientPlaySound(LockedOnSound);
            CurrentTarget = none;
        }
        bAutoTarget = true;
    }
    // End:0xc9
    if(!bAutoTarget || LastAutoTargetTime + float(1) > Level.TimeSeconds)
    {
        return;
    }
    LastAutoTargetTime = Level.TimeSeconds;
    // End:0xf6
    if(CurrentTarget == none)
    {
        BestDist = MaxTargetingRange;
    }
    // End:0x113
    else
    {
        BestDist = VSize(Location - CurrentTarget.Location);
    }
    C = Level.ControllerList;
    J0x127:
    // End:0x213 [While If]
    if(C != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x1fc
        if(V != none && V != CurrentTarget && IsTargetRelevant(V))
        {
            dist = VSize(Location - V.Location);
            // End:0x1ba
            if(V.IsA('ASVehicle_SpaceFighter'))
            {
                dist = dist * 0.670;
            }
            // End:0x1fc
            if(BestV == none || dist < BestDist && LineOfSightTo(V))
            {
                BestV = V;
                BestDist = dist;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x127;
    }
    // End:0x229
    if(BestV != none)
    {
        ServerSetTarget(BestV);
    }
}

simulated function VehicleCollision(Vector HitNormal, Actor Other)
{
    local float Damage, NormalSpeed;
    local Pawn Inst;

    // End:0x12
    if(Role < 4)
    {
        return;
    }
    NormalSpeed = Abs(Velocity Dot HitNormal);
    Damage = NormalSpeed - float(200) / 100.0;
    // End:0xbc
    if(Damage > 1.0)
    {
        Damage *= Damage;
        Inst = Pawn(Other);
        // End:0x80
        if(Instigator != none)
        {
            Damage += HealthMax;
        }
        TakeDamage(int(Damage), Inst, Location - HitNormal * CollisionRadius, HitNormal * Damage * 100.0, none);
    }
    // End:0xef
    else
    {
        // End:0xef
        if(VSize(Velocity) < float(100))
        {
            TakeDamage(default.Health * 2, self, Location, vect(0.0, 0.0, 0.0), none);
        }
    }
}

simulated function Landed(Vector HitNormal)
{
    VehicleCollision(HitNormal, none);
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    VehicleCollision(HitNormal, Wall);
}

singular simulated function Touch(Actor Other)
{
    local Vector HitNormal;

    // End:0x64
    if(Other != none && !Other.IsA('Projectile') && Other.bBlockActors)
    {
        HitNormal = Normal(Location - Other.Location);
        VehicleCollision(HitNormal, Other);
    }
}

simulated function Bump(Actor Other)
{
    local Vector HitNormal;

    // End:0x64
    if(Other != none && !Other.IsA('Projectile') && Other.bBlockActors)
    {
        HitNormal = Normal(Location - Other.Location);
        VehicleCollision(HitNormal, Other);
    }
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x142
    if(bHumanShip && Level.NetMode != 3)
    {
        // End:0xe3
        if(Level.NetMode == 0)
        {
            // End:0xe0
            if(instigatedBy != none && instigatedBy != self && !bThumped || instigatedBy.bStationary && PlayerController(Instigator.Controller) == none && PlayerReplicationInfo != none && Level.GetLocalPlayerController().PlayerReplicationInfo.Team != PlayerReplicationInfo.Team)
            {
                Damage *= 0.30;
            }
        }
        // End:0x142
        else
        {
            // End:0x142
            if(DeathMatch(Level.Game).bPlayersVsBots)
            {
                // End:0x142
                if(instigatedBy != none && instigatedBy != self && PlayerController(Instigator.Controller) == none)
                {
                    Damage *= 0.70;
                }
            }
        }
    }
    // End:0x157
    if(instigatedBy == none)
    {
        HitFxTicker = 0;
    }
    // End:0x174
    else
    {
        // End:0x16c
        if(instigatedBy == self)
        {
            HitFxTicker = 1;
        }
        // End:0x174
        else
        {
            HitFxTicker = 2;
        }
    }
    // End:0x19d
    if(Role == 4)
    {
        DoShieldEffect(HitLocation, Normal(Location - HitLocation));
    }
    super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
}

function DoShieldEffect(Vector HitLocation, Vector HitNormal)
{
    local Actor ShieldEffect;

    // End:0x0f
    if(Team > 1)
    {
        return;
    }
    // End:0x91
    if(EffectIsRelevant(HitLocation, true) && NextShieldTime < Level.TimeSeconds)
    {
        NextShieldTime = Level.TimeSeconds + 0.10;
        ShieldEffect = Spawn(GenericShieldEffect[Team], self,, HitLocation, rotator(-HitNormal));
        // End:0x91
        if(ShieldEffect != none)
        {
            ShieldEffect.SetBase(self);
        }
    }
}

event AnimEnd(int Channel)
{
    Disable('AnimEnd');
    bGearUp = true;
    // End:0x4c
    if(Level.NetMode != 1)
    {
        // End:0x40
        if(HasAnim(FlyingAnim))
        {
            PlayAnim(FlyingAnim, 0.00010);
        }
        StopAnimating();
        Timer();
    }
}

simulated function AdjustFX();
simulated function Timer()
{
    local float NewTimerRate;

    AdjustFX();
    // End:0x1d
    if(IsLocallyControlled())
    {
        NewTimerRate = 0.020;
    }
    // End:0x45
    else
    {
        // End:0x3a
        if(EffectIsRelevant(Location, false))
        {
            NewTimerRate = 0.040;
        }
        // End:0x45
        else
        {
            NewTimerRate = 0.080;
        }
    }
    // End:0x6d
    if(Level.DetailMode == 1)
    {
        NewTimerRate += 0.020;
    }
    // End:0x92
    else
    {
        // End:0x92
        if(Level.DetailMode == 0)
        {
            NewTimerRate += 0.040;
        }
    }
    SetTimer(NewTimerRate, false);
}

simulated function Vector GetRocketSpawnLocation()
{
    return RocketOffset;
}

final simulated function MyRandSpin(float spinRate)
{
    DesiredRotation = RotRand(true);
    RotationRate.Yaw = 0;
    RotationRate.Pitch = Max(int(FRand() * spinRate / float(8)), int(spinRate / float(30)));
    RotationRate.Roll = Max(int(FRand() * spinRate), int(spinRate / float(8)));
    // End:0x89
    if(FRand() > 0.50)
    {
        RotationRate.Pitch = -RotationRate.Pitch;
    }
    // End:0xac
    if(FRand() > 0.50)
    {
        RotationRate.Roll = -RotationRate.Roll;
    }
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    // End:0x21
    if(SmokeTrail != none)
    {
        SmokeTrail.Kill();
        SmokeTrail = none;
    }
    // End:0x42
    if(TrailEmitter != none)
    {
        TrailEmitter.Kill();
        TrailEmitter = none;
    }
    bDynamicLight = false;
    LightType = 0;
}

simulated event PlayDying(class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    local Vector HitNormal;

    // End:0x2d
    if(Level.Game != none)
    {
        Level.Game.DiscardInventory(self);
    }
    // End:0x5f
    if(PlayerController(Controller) != none && PlayerController(Controller).Pawn != self)
    {
        Controller = none;
    }
    // End:0x8f
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).SetViewTarget(self);
        DestroyPrevController = Controller;
    }
    bCanTeleport = false;
    bReplicateMovement = false;
    bTearOff = true;
    bPlayedDeath = true;
    // End:0x116
    if(HitFxTicker == 2)
    {
        ShotDownRotation = Rotation;
        // End:0x10c
        if(Level.NetMode != 1)
        {
            SmokeTrail = Spawn(ShotDownFXClass, self,, Location);
            // End:0x10c
            if(SmokeTrail != none)
            {
                SmokeTrail.SetBase(self);
            }
        }
        GotoState('ShotDown');
    }
    // End:0x145
    else
    {
        // End:0x12e
        if(HitFxTicker == 0)
        {
            HitNormal = Normal(TearOffMomentum);
        }
        Explode(Location, HitNormal);
        GotoState('Dying');
    }
}

state ShotDown
{
    ignores BreathTimer, DriverDied, ProcessMove, UpdateRocketAcceleration;

    event ChangeAnimation();
    event StopPlayFiring();
    function PlayFiring(float Rate, name FiringMode);
    function PlayWeaponSwitch(wWeapon newWeapon);
    function PlayTakeHit(Vector HitLoc, int Damage, class<DamageType> DamageType);
    simulated function PlayNextAnimation();
    event FellOutOfWorld(Engine.Actor.eKillZType KillType);
    function ReduceCylinder();
    function LandThump();
    event AnimEnd(int Channel);
    function LieStill();
    singular function BaseChange();
    function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
    function VehicleSwitchView(bool bUpdating);
    simulated function Timer()
    {
        BlowUp(vect(0.0, 0.0, 0.0));
    }

    simulated function VehicleCollision(Vector HitNormal, Actor Other)
    {
        BlowUp(HitNormal);
    }

    simulated function BlowUp(Vector HitNormal)
    {
        Explode(Location, HitNormal);
        GotoState('Dying');
    }

    simulated function BeginState()
    {
        local PlayerController PC;

        bRotateToDesired = true;
        bRollToDesired = true;
        MyRandSpin(200000.0);
        Acceleration.Z -= VSize(Velocity) * 0.670;
        PC = PlayerController(Controller);
        // End:0x77
        if(PC != none && !PC.bBehindView)
        {
            PC.bBehindView = true;
        }
        // End:0x93
        if(Driver != none && bDrawDriverInTP)
        {
            Destroyed_HandleDriver();
        }
        // End:0xae
        if(Controller != none)
        {
            Controller.PawnDied(self);
        }
    }

    simulated function EndState()
    {
        AmbientSound = none;
        bDynamicLight = false;
        LightType = 0;
    }

Begin:
    SetTimer(4.0, false);
    stop;
}

defaultproperties
{
    EngineMinVelocity=600.0
    VehicleRotationSpeed=0.0090
    RotationInertia=10.0
    StrafeAccelRate=0.50
    MaxStrafe=300.0
    RollAutoCorrectSpeed=3000.0
    bSpeedFilterWarmup=true
    bAutoTarget=true
    bHumanShip=true
    CamRotationInertia=0.330
    Text_Speed="??:"
    TrailOffset=80.0
    MaxTargetingRange=20000.0
    CrosshairScale=0.50
    bCHZeroYOffset=true
    bHasRadar=true
    CenterSpringForce="SpringSpaceFighter"
    CenterSpringRangePitch=0
    CenterSpringRangeRoll=0
    DriverDamageMult=0.0
    VehiclePositionString="??????? ??"
    VehicleNameString="?? ???? ???"
    bCanFly=true
    bCanStrafe=true
    bSimulateGravity=true
    bDirectHitWall=true
    bServerMoveSetPawnRot=true
    bSpecialHUD=true
    bSpecialCalcView=true
    SightRadius=25000.0
    AirSpeed=2000.0
    AccelRate=2000.0
    HealthMax=250.0
    Health=250
    LandMovementState=PlayerSpaceFlying
    MinFlySpeed=1100.0
    MaxRotation=0.850
    Physics=4
    CollisionRadius=60.0
    CollisionHeight=30.0
    RotationRate=(Pitch=32768,Yaw=32768,Roll=32768)
    ForceType=1
    ForceRadius=100.0
    ForceScale=5.0
}