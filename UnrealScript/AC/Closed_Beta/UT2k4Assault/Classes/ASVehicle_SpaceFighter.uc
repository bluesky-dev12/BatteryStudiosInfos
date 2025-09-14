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
var Class<Emitter> ShotDownFXClass;
var float SpeedFilter[20];
var int NextSpeedFilterSlot;
var float SmoothedSpeedRatio;
var Vector RocketOffset;
var Class<Actor> GenericShieldEffect[2];
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
    // Pos:0x000
    reliable if((bNetDirty && bNetOwner) && int(Role) == int(ROLE_Authority))
        CurrentTarget;

    // Pos:0x023
    reliable if(int(Role) < int(ROLE_Authority))
        ServerNextTarget, ServerPrevTarget, 
        ServerSetTarget;
}

function BlowUp(Vector HitNormal)
{
    //return;    
}

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
    //return;    
}

simulated function PlayTakeOff()
{
    //return;    
}

simulated event TeamChanged()
{
    // End:0x25
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        SetTrailFX();
        AdjustFX();
    }
    //return;    
}

simulated function SetTrailFX()
{
    //return;    
}

simulated function Destroyed()
{
    // End:0x17
    if(TrailEmitter != none)
    {
        TrailEmitter.Destroy();
    }
    // End:0x2E
    if(SmokeTrail != none)
    {
        SmokeTrail.Destroy();
    }
    super.Destroyed();
    //return;    
}

function PossessedBy(Controller C)
{
    super.PossessedBy(C);
    Velocity = EngineMinVelocity * Vector(Rotation);
    Acceleration = Velocity;
    //return;    
}

function Vector GetBotError(Vector StartLocation)
{
    local Vector ErrorDir, VelDir;

    Controller.ShotTarget = Pawn(Controller.Target);
    ErrorDir = Normal((Controller.Target.Location - Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
    // End:0xB6
    if(Controller.Target != OldTarget)
    {
        BotError = (float(1500) - (float(100) * Level.Game.GameDifficulty)) * ErrorDir;
        OldTarget = Controller.Target;
    }
    VelDir = Normal(Controller.Target.Velocity);
    BotError += ((float(100) - (float(200) * FRand())) * (ErrorDir + VelDir));
    // End:0x165
    if((Level.Game.GameDifficulty < float(6)) && VSize(BotError) < float(120))
    {
        // End:0x153
        if((BotError Dot VelDir) < float(0))
        {
            BotError += (float(10) * VelDir);            
        }
        else
        {
            BotError -= (float(10) * VelDir);
        }
    }
    // End:0x19A
    if((Pawn(OldTarget) != none) && Pawn(OldTarget).bStationary)
    {
        BotError *= 0.6000000;
    }
    BotError = Normal(BotError) * FMin(VSize(BotError), FMin(1500.0000000 - (float(100) * Level.Game.GameDifficulty), 0.2000000 * VSize(Controller.Target.Location - StartLocation)));
    return BotError;
    //return;    
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    super.ClientKDriverEnter(PC);
    Velocity = EngineMinVelocity * Vector(Rotation);
    Acceleration = Velocity;
    //return;    
}

function bool KDriverLeave(bool bForceLeave)
{
    // End:0x3D
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
        else
        {
            return false;
        }        
    }
    else
    {
        TargetUnSet();
        return false;
    }
    //return;    
}

function DriverDied()
{
    TakeDamage(default.Health * 2, self, Location, vect(0.0000000, 0.0000000, 0.0000000), none);
    //return;    
}

function bool CanAttack(Actor Other)
{
    // End:0x1D
    if(Controller != none)
    {
        return Controller.LineOfSightTo(Other);
    }
    return false;
    //return;    
}

simulated function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
    local Vector X, Y, Z;
    local float CurrentSpeed, EngineAccel, RotationSmoothFactor, RollChange;
    local Rotator NewRotation;

    // End:0x1A
    if(!bPostNetCalled || Controller == none)
    {
        return;
    }
    // End:0x52
    if(!bInitialized)
    {
        Acceleration = EngineMinVelocity * Vector(Rotation);
        SpaceFighterRotation = QuatFromRotator(Rotation);
        bInitialized = true;
    }
    // End:0x98
    if(bGearUp)
    {
        DesiredVelocity = FClamp(DesiredVelocity + ((PlayerController(Controller).aForward * DeltaTime) / 15.0000000), EngineMinVelocity, 1000.0000000);        
    }
    else
    {
        DesiredVelocity = EngineMinVelocity;
    }
    CurrentSpeed = FClamp(((Velocity Dot Vector(Rotation)) * 1000.0000000) / AirSpeed, 0.0000000, 1000.0000000);
    EngineAccel = (DesiredVelocity - CurrentSpeed) * 100.0000000;
    RotationSmoothFactor = FClamp(1.0000000 - (RotationInertia * DeltaTime), 0.0000000, 1.0000000);
    // End:0x174
    if((int(PlayerController(Controller).bDuck) > 0) && Abs(float(Rotation.Roll)) > float(500))
    {
        // End:0x164
        if(Rotation.Roll < 0)
        {
            RollChange = RollAutoCorrectSpeed;            
        }
        else
        {
            RollChange = -RollAutoCorrectSpeed;
        }        
    }
    else
    {
        // End:0x1AF
        if(PlayerController(Controller).aUp > float(0))
        {
            RollChange = PlayerController(Controller).aStrafe * 0.6600000;
        }
    }
    YawAccel = (RotationSmoothFactor * YawAccel) + ((DeltaTime * VehicleRotationSpeed) * YawChange);
    PitchAccel = (RotationSmoothFactor * PitchAccel) + ((DeltaTime * VehicleRotationSpeed) * PitchChange);
    RollAccel = (RotationSmoothFactor * RollAccel) + ((DeltaTime * VehicleRotationSpeed) * RollChange);
    YawAccel = FClamp(YawAccel, -AirSpeed, AirSpeed);
    PitchAccel = FClamp(PitchAccel, -AirSpeed, AirSpeed);
    RollAccel = FClamp(RollAccel, -AirSpeed, AirSpeed);
    GetAxes(QuatToRotator(SpaceFighterRotation), X, Y, Z);
    SpaceFighterRotation = QuatProduct(SpaceFighterRotation, QuatProduct(QuatFromAxisAndAngle(Y, DeltaTime * PitchAccel), QuatProduct(QuatFromAxisAndAngle(Z, (-1.0000000 * DeltaTime) * YawAccel), QuatFromAxisAndAngle(X, DeltaTime * RollAccel))));
    NewRotation = QuatToRotator(SpaceFighterRotation);
    // End:0x37F
    if((int(PlayerController(Controller).bDuck) > 0) && ((NewRotation.Roll < 0) && Rotation.Roll > 0) || (NewRotation.Roll > 0) && Rotation.Roll < 0)
    {
        NewRotation.Roll = 0;
        RollAccel = 0.0000000;
    }
    Acceleration = Vector(NewRotation) * DesiredVelocity;
    StrafeAccel = RotationSmoothFactor * StrafeAccel;
    // End:0x3E8
    if(PlayerController(Controller).aUp == float(0))
    {
        StrafeAccel += ((DeltaTime * StrafeAccelRate) * PlayerController(Controller).aStrafe);
    }
    StrafeAccel = FClamp(StrafeAccel, -MaxStrafe, MaxStrafe);
    GetAxes(NewRotation, X, Y, Z);
    Acceleration += (StrafeAccel * Y);
    NewRotation.Roll += int(StrafeAccel * float(15));
    DelayedDebugString = (("NewRotation.Roll:" @ string(NewRotation.Roll)) @ "StrafeAccel:") @ string(StrafeAccel);
    bRotateToDesired = true;
    bRollToDesired = true;
    DesiredRotation = NewRotation;
    SetRotation(NewRotation);
    //return;    
}

function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
    // End:0x56
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x1D
        if(!bPostNetCalled)
        {
            return;
        }
        UpdateAutoTargetting();
        // End:0x56
        if(VSize(Velocity) < float(100))
        {
            TakeDamage(default.Health * 2, self, Location, vect(0.0000000, 0.0000000, 0.0000000), none);
        }
    }
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local Vector X, Y, Z;
    local float ForwardVelocity;
    local Controller C;

    super(Vehicle).DisplayDebug(Canvas, YL, YPos);
    // End:0xAD
    if(Controller == none)
    {
        Canvas.SetDrawColor(byte(255), 0, 0);
        Canvas.DrawText("LOCAL CONTROLLER");
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        C = Level.GetLocalPlayerController();
        C.DisplayDebug(Canvas, YL, YPos);
    }
    Canvas.DrawText("-- SPACEFIGHTER");
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    GetAxes(Rotation, X, Y, Z);
    Canvas.DrawText((((("-- GetAxes, X:" @ string(X)) $ ", Y:") @ string(Y)) $ ", Z:") @ string(Z));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("-- Acceleration:" @ string(Acceleration));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    ForwardVelocity = Velocity Dot Vector(Rotation);
    Canvas.DrawText((("-- Gear:" @ string(DesiredVelocity / 10.0000000)) $ "% Forward Velocity:") @ string(ForwardVelocity));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("-- DDS" @ DelayedDebugString);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

simulated function Rotator GetViewRotation()
{
    // End:0x25
    if((IsLocallyControlled()) && Health > 0)
    {
        return QuatToRotator(SpaceFighterRotation);        
    }
    else
    {
        return Rotation;
    }
    //return;    
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
    CameraLocation = ((CameraLocation + (PC.ShakeOffset.X * X)) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
    CameraLocation = CameraLocation + (FPCamPos >> (GetViewRotation()));
    //return;    
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
    if((PC == none) || PC.ViewTarget == none)
    {
        return false;
    }
    ViewActor = self;
    // End:0x6A
    if(!PC.bBehindView)
    {
        SpecialCalcFirstPersonView(PC, ViewActor, CameraLocation, CameraRotation);
        return true;
    }
    myDeltaTime = Level.TimeSeconds - LastTimeSeconds;
    LastTimeSeconds = Level.TimeSeconds;
    CamLookAt = ViewActor.Location + (vect(60.0000000, 0.0000000, 0.0000000) >> ViewActor.Rotation);
    // End:0xE7
    if(ViewActor == self)
    {
        TargetRotation = GetViewRotation();        
    }
    else
    {
        TargetRotation = ViewActor.Rotation;
    }
    // End:0x142
    if(IsInState('ShotDown'))
    {
        TargetRotation.Yaw += 32768;
        Normalize(TargetRotation);
        CamRotationInertia = default.CamRotationInertia * 10.0000000;
        CamDistFactor = 2.0000000;        
    }
    else
    {
        // End:0x16D
        if(IsInState('Dying'))
        {
            CamRotationInertia = default.CamRotationInertia * 50.0000000;
            CamDistFactor = 3.0000000;            
        }
        else
        {
            CamDistFactor = 1.0000000 - (DesiredVelocity / AirSpeed);
        }
    }
    CamRotationRate = Normalize(TargetRotation - LastCamRot);
    CameraRotation.Yaw = int(CalcInertia(myDeltaTime, CamRotationInertia, float(CamRotationRate.Yaw), float(LastCamRot.Yaw)));
    CameraRotation.Pitch = int(CalcInertia(myDeltaTime, CamRotationInertia, float(CamRotationRate.Pitch), float(LastCamRot.Pitch)));
    CameraRotation.Roll = int(CalcInertia(myDeltaTime, CamRotationInertia, float(CamRotationRate.Roll), float(LastCamRot.Roll)));
    LastCamRot = CameraRotation;
    CamDistance = vect(-180.0000000, 0.0000000, 80.0000000);
    CamDistance.X -= (CamDistFactor * 200.0000000);
    CameraLocation = CamLookAt + (CamDistance >> CameraRotation);
    // End:0x2DA
    if(Trace(HitLocation, HitNormal, CameraLocation, ViewActor.Location, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
    {
        CameraLocation = HitLocation + (HitNormal * float(10));
    }
    return true;
    //return;    
}

simulated function bool IsTargetRelevant(Vehicle Target)
{
    // End:0x0D
    if(Target == none)
    {
        return false;
    }
    // End:0x78
    if((((int(Target.Team) == int(Team)) || Target.Health < 1) || Target.bDeleteMe) || VSize(Location - Target.Location) > MaxTargetingRange)
    {
        return false;
    }
    // End:0xA0
    if(((Target.Location - Location) Dot Vector(Rotation)) < float(0))
    {
        return false;
    }
    return true;
    //return;    
}

simulated function PrevWeapon()
{
    ServerPrevTarget(false);
    //return;    
}

simulated function NextWeapon()
{
    ServerNextTarget(false);
    //return;    
}

exec function TargetClosestToCrosshair()
{
    bTargetClosestToCrosshair = true;
    //return;    
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
    // End:0x4D
    if(CurrentTarget != none)
    {
        CurrentTargetDist = VSize(Location - CurrentTarget.Location);        
    }
    else
    {
        CurrentTargetDist = 0.0000000;
    }
    C = Level.ControllerList;
    J0x6C:

    // End:0x13D [Loop If]
    if(C != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x126
        if(((V != none) && V != CurrentTarget) && IsTargetRelevant(V))
        {
            dist = VSize(Location - V.Location);
            numtargets++;
            // End:0x126
            if(((dist > CurrentTargetDist) && dist < BestDist) && LineOfSightTo(V))
            {
                BestV = V;
                BestDist = dist;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x6C;
    }
    // End:0x156
    if(BestV != none)
    {
        ServerSetTarget(BestV);        
    }
    else
    {
        // End:0x189
        if((!bTryOnce && CurrentTarget != none) && numtargets > 0)
        {
            CurrentTarget = none;
            ServerNextTarget(true);
        }
    }
    //return;    
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
    else
    {
        CurrentTargetDist = MaxTargetingRange;
    }
    C = Level.ControllerList;
    J0x61:

    // End:0x132 [Loop If]
    if(C != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x11B
        if(((V != none) && V != CurrentTarget) && IsTargetRelevant(V))
        {
            numtargets++;
            dist = VSize(Location - V.Location);
            // End:0x11B
            if(((dist < CurrentTargetDist) && dist > BestDist) && LineOfSightTo(V))
            {
                BestV = V;
                BestDist = dist;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x61;
    }
    // End:0x14B
    if(BestV != none)
    {
        ServerSetTarget(BestV);        
    }
    else
    {
        // End:0x17E
        if((!bTryOnce && CurrentTarget != none) && numtargets > 0)
        {
            CurrentTarget = none;
            ServerPrevTarget(true);
        }
    }
    //return;    
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
    //return;    
}

function TargetUnSet()
{
    CurrentTarget = none;
    bAutoTarget = true;
    //return;    
}

function UpdateAutoTargetting()
{
    local float BestDist, dist;
    local Controller C;
    local Vehicle V, BestV;

    // End:0x12
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    // End:0x9D
    if((((CurrentTarget == none) || CurrentTarget.Health < 1) || CurrentTarget.bDeleteMe) || VSize(CurrentTarget.Location - Location) > MaxTargetingRange)
    {
        // End:0x95
        if(CurrentTarget != none)
        {
            PlayerController(Controller).ClientPlaySound(LockedOnSound);
            CurrentTarget = none;
        }
        bAutoTarget = true;
    }
    // End:0xC9
    if(!bAutoTarget || (LastAutoTargetTime + float(1)) > Level.TimeSeconds)
    {
        return;
    }
    LastAutoTargetTime = Level.TimeSeconds;
    // End:0xF6
    if(CurrentTarget == none)
    {
        BestDist = MaxTargetingRange;        
    }
    else
    {
        BestDist = VSize(Location - CurrentTarget.Location);
    }
    C = Level.ControllerList;
    J0x127:

    // End:0x213 [Loop If]
    if(C != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x1FC
        if(((V != none) && V != CurrentTarget) && IsTargetRelevant(V))
        {
            dist = VSize(Location - V.Location);
            // End:0x1BA
            if(V.IsA('ASVehicle_SpaceFighter'))
            {
                dist = dist * 0.6700000;
            }
            // End:0x1FC
            if(((BestV == none) || dist < BestDist) && LineOfSightTo(V))
            {
                BestV = V;
                BestDist = dist;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x127;
    }
    // End:0x229
    if(BestV != none)
    {
        ServerSetTarget(BestV);
    }
    //return;    
}

simulated function VehicleCollision(Vector HitNormal, Actor Other)
{
    local float Damage, NormalSpeed;
    local Pawn Inst;

    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    NormalSpeed = Abs(Velocity Dot HitNormal);
    Damage = (NormalSpeed - float(200)) / 100.0000000;
    // End:0xBC
    if(Damage > 1.0000000)
    {
        Damage *= Damage;
        Inst = Pawn(Other);
        // End:0x80
        if(Instigator != none)
        {
            Damage += HealthMax;
        }
        TakeDamage(int(Damage), Inst, Location - (HitNormal * CollisionRadius), (HitNormal * Damage) * 100.0000000, none);        
    }
    else
    {
        // End:0xEF
        if(VSize(Velocity) < float(100))
        {
            TakeDamage(default.Health * 2, self, Location, vect(0.0000000, 0.0000000, 0.0000000), none);
        }
    }
    //return;    
}

simulated function Landed(Vector HitNormal)
{
    VehicleCollision(HitNormal, none);
    //return;    
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    VehicleCollision(HitNormal, Wall);
    //return;    
}

singular simulated function Touch(Actor Other)
{
    local Vector HitNormal;

    // End:0x64
    if(((Other != none) && !Other.IsA('Projectile')) && Other.bBlockActors)
    {
        HitNormal = Normal(Location - Other.Location);
        VehicleCollision(HitNormal, Other);
    }
    //return;    
}

simulated function Bump(Actor Other)
{
    local Vector HitNormal;

    // End:0x64
    if(((Other != none) && !Other.IsA('Projectile')) && Other.bBlockActors)
    {
        HitNormal = Normal(Location - Other.Location);
        VehicleCollision(HitNormal, Other);
    }
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x142
    if(bHumanShip && int(Level.NetMode) != int(NM_Client))
    {
        // End:0xE3
        if(int(Level.NetMode) == int(NM_Standalone))
        {
            // End:0xE0
            if((((((instigatedBy != none) && instigatedBy != self) && !bThumped || instigatedBy.bStationary) && PlayerController(Instigator.Controller) == none) && PlayerReplicationInfo != none) && Level.GetLocalPlayerController().PlayerReplicationInfo.Team != PlayerReplicationInfo.Team)
            {
                Damage *= 0.3000000;
            }            
        }
        else
        {
            // End:0x142
            if(DeathMatch(Level.Game).bPlayersVsBots)
            {
                // End:0x142
                if(((instigatedBy != none) && instigatedBy != self) && PlayerController(Instigator.Controller) == none)
                {
                    Damage *= 0.7000000;
                }
            }
        }
    }
    // End:0x157
    if(instigatedBy == none)
    {
        HitFxTicker = 0;        
    }
    else
    {
        // End:0x16C
        if(instigatedBy == self)
        {
            HitFxTicker = 1;            
        }
        else
        {
            HitFxTicker = 2;
        }
    }
    // End:0x19D
    if(int(Role) == int(ROLE_Authority))
    {
        DoShieldEffect(HitLocation, Normal(Location - HitLocation));
    }
    super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    //return;    
}

function DoShieldEffect(Vector HitLocation, Vector HitNormal)
{
    local Actor ShieldEffect;

    // End:0x0F
    if(int(Team) > 1)
    {
        return;
    }
    // End:0x91
    if((EffectIsRelevant(HitLocation, true)) && NextShieldTime < Level.TimeSeconds)
    {
        NextShieldTime = Level.TimeSeconds + 0.1000000;
        ShieldEffect = Spawn(GenericShieldEffect[int(Team)], self,, HitLocation, Rotator(-HitNormal));
        // End:0x91
        if(ShieldEffect != none)
        {
            ShieldEffect.SetBase(self);
        }
    }
    //return;    
}

event AnimEnd(int Channel)
{
    Disable('AnimEnd');
    bGearUp = true;
    // End:0x4C
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x40
        if(HasAnim(FlyingAnim))
        {
            PlayAnim(FlyingAnim, 0.0001000);
        }
        StopAnimating();
        Timer();
    }
    //return;    
}

simulated function AdjustFX()
{
    //return;    
}

simulated function Timer()
{
    local float NewTimerRate;

    AdjustFX();
    // End:0x1D
    if(IsLocallyControlled())
    {
        NewTimerRate = 0.0200000;        
    }
    else
    {
        // End:0x3A
        if(EffectIsRelevant(Location, false))
        {
            NewTimerRate = 0.0400000;            
        }
        else
        {
            NewTimerRate = 0.0800000;
        }
    }
    // End:0x6D
    if(int(Level.DetailMode) == int(1))
    {
        NewTimerRate += 0.0200000;        
    }
    else
    {
        // End:0x92
        if(int(Level.DetailMode) == int(0))
        {
            NewTimerRate += 0.0400000;
        }
    }
    SetTimer(NewTimerRate, false);
    //return;    
}

simulated function Vector GetRocketSpawnLocation()
{
    return RocketOffset;
    //return;    
}

final simulated function MyRandSpin(float spinRate)
{
    DesiredRotation = RotRand(true);
    RotationRate.Yaw = 0;
    RotationRate.Pitch = Max(int((FRand() * spinRate) / float(8)), int(spinRate / float(30)));
    RotationRate.Roll = Max(int(FRand() * spinRate), int(spinRate / float(8)));
    // End:0x89
    if(FRand() > 0.5000000)
    {
        RotationRate.Pitch = -RotationRate.Pitch;
    }
    // End:0xAC
    if(FRand() > 0.5000000)
    {
        RotationRate.Roll = -RotationRate.Roll;
    }
    //return;    
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
    //return;    
}

simulated event PlayDying(Class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    local Vector HitNormal;

    // End:0x2D
    if(Level.Game != none)
    {
        Level.Game.DiscardInventory(self);
    }
    // End:0x5F
    if((PlayerController(Controller) != none) && PlayerController(Controller).Pawn != self)
    {
        Controller = none;
    }
    // End:0x8F
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
        // End:0x10C
        if(int(Level.NetMode) != int(NM_DedicatedServer))
        {
            SmokeTrail = Spawn(ShotDownFXClass, self,, Location);
            // End:0x10C
            if(SmokeTrail != none)
            {
                SmokeTrail.SetBase(self);
            }
        }
        GotoState('ShotDown');        
    }
    else
    {
        // End:0x12E
        if(HitFxTicker == 0)
        {
            HitNormal = Normal(TearOffMomentum);
        }
        Explode(Location, HitNormal);
        GotoState('Dying');
    }
    //return;    
}

state ShotDown
{
    ignores EndState, BeginState, BlowUp, VehicleCollision, Timer, VehicleSwitchView, 
	    TakeDamage, Died, BaseChange, LieStill, AnimEnd, 
	    LandThump, ReduceCylinder, FellOutOfWorld, PlayNextAnimation, PlayTakeHit, 
	    PlayWeaponSwitch, PlayFiring, StopPlayFiring, ChangeAnimation;

    event ChangeAnimation()
    {
        //return;        
    }

    event StopPlayFiring()
    {
        //return;        
    }

    function PlayFiring(float Rate, name FiringMode)
    {
        //return;        
    }

    function PlayWeaponSwitch(wWeapon newWeapon)
    {
        //return;        
    }

    function PlayTakeHit(Vector HitLoc, int Damage, Class<DamageType> DamageType)
    {
        //return;        
    }

    simulated function PlayNextAnimation()
    {
        //return;        
    }

    event FellOutOfWorld(Actor.eKillZType KillType)
    {
        //return;        
    }

    function ReduceCylinder()
    {
        //return;        
    }

    function LandThump()
    {
        //return;        
    }

    event AnimEnd(int Channel)
    {
        //return;        
    }

    function LieStill()
    {
        //return;        
    }

    singular function BaseChange()
    {
        //return;        
    }

    function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }

    function VehicleSwitchView(bool bUpdating)
    {
        //return;        
    }

    simulated function Timer()
    {
        BlowUp(vect(0.0000000, 0.0000000, 0.0000000));
        //return;        
    }

    simulated function VehicleCollision(Vector HitNormal, Actor Other)
    {
        BlowUp(HitNormal);
        //return;        
    }

    simulated function BlowUp(Vector HitNormal)
    {
        Explode(Location, HitNormal);
        GotoState('Dying');
        //return;        
    }

    simulated function BeginState()
    {
        local PlayerController PC;

        bRotateToDesired = true;
        bRollToDesired = true;
        MyRandSpin(200000.0000000);
        Acceleration.Z -= (VSize(Velocity) * 0.6700000);
        PC = PlayerController(Controller);
        // End:0x77
        if((PC != none) && !PC.bBehindView)
        {
            PC.bBehindView = true;
        }
        // End:0x93
        if((Driver != none) && bDrawDriverInTP)
        {
            Destroyed_HandleDriver();
        }
        // End:0xAE
        if(Controller != none)
        {
            Controller.PawnDied(self);
        }
        //return;        
    }

    simulated function EndState()
    {
        AmbientSound = none;
        bDynamicLight = false;
        LightType = 0;
        //return;        
    }
Begin:

    SetTimer(4.0000000, false);
    stop;            
}

defaultproperties
{
    EngineMinVelocity=600.0000000
    VehicleRotationSpeed=0.0090000
    RotationInertia=10.0000000
    StrafeAccelRate=0.5000000
    MaxStrafe=300.0000000
    RollAutoCorrectSpeed=3000.0000000
    bSpeedFilterWarmup=true
    bAutoTarget=true
    bHumanShip=true
    CamRotationInertia=0.3300000
    Text_Speed="??:"
    TrailOffset=80.0000000
    MaxTargetingRange=20000.0000000
    CrosshairScale=0.5000000
    bCHZeroYOffset=true
    bHasRadar=true
    CenterSpringForce="SpringSpaceFighter"
    CenterSpringRangePitch=0
    CenterSpringRangeRoll=0
    DriverDamageMult=0.0000000
    VehiclePositionString="??????? ??"
    VehicleNameString="?? ???? ???"
    bCanFly=true
    bCanStrafe=true
    bSimulateGravity=false
    bDirectHitWall=true
    bServerMoveSetPawnRot=false
    bSpecialHUD=true
    bSpecialCalcView=true
    SightRadius=25000.0000000
    AirSpeed=2000.0000000
    AccelRate=2000.0000000
    HealthMax=250.0000000
    Health=250
    LandMovementState="PlayerSpaceFlying"
    MinFlySpeed=1100.0000000
    MaxRotation=0.8500000
    Physics=4
    CollisionRadius=60.0000000
    CollisionHeight=30.0000000
    RotationRate=(Pitch=32768,Yaw=32768,Roll=32768)
    ForceType=1
    ForceRadius=100.0000000
    ForceScale=5.0000000
}