/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicle.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:34
 *	States:1
 *
 *******************************************************************************/
class ASVehicle extends Vehicle
    abstract;

var() string DefaultWeaponClassName;
var() Vector VehicleProjSpawnOffset;
var Pawn DamLastInstigator;
var float DamLastDamageTime;
var Material DefaultCrosshair;
var Material CrosshairHitFeedbackTex;
var float CrosshairScale;
var bool bCHZeroYOffset;
var bool bCustomHealthDisplay;
var float LastCalcWeaponFire;
var Actor LastCalcHA;
var Vector LastCalcHL;
var Vector LastCalcHN;
var() Sound LockedOnSound;
var Controller DestroyPrevController;
var Emitter ExplosionEffect;
var Emitter DebugFX;
var Vector BotError;
var Actor OldTarget;

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart);
function ClientDying(class<DamageType> DamageType, Vector HitLocation);
simulated function Tick(float DeltaTime);
simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x4a
    if(Level.Game != none)
    {
        BotError = float(1000) - float(50) * Level.Game.GameDifficulty * VRand();
    }
    GetBoneCoords('None');
    SetCollision(false, false);
    SetCollision(true, true);
}

simulated event Destroyed()
{
    // End:0x2d
    if(Level.Game != none)
    {
        Level.Game.DiscardInventory(self);
    }
    super.Destroyed();
}

function AddDefaultInventory()
{
    GiveWeapon(DefaultWeaponClassName);
    // End:0x25
    if(Controller != none)
    {
        Controller.ClientSwitchToBestWeapon();
    }
}

function PossessedBy(Controller C)
{
    Level.Game.DiscardInventory(self);
    super.PossessedBy(C);
    NetUpdateTime = Level.TimeSeconds - float(1);
    bStasis = false;
    C.Pawn = self;
    AddDefaultInventory();
    // End:0xae
    if(Weapon != none)
    {
        Weapon.NetUpdateTime = Level.TimeSeconds - float(1);
        Weapon.Instigator = self;
        PendingWeapon = none;
        Weapon.BringUp();
    }
}

function UnPossessed()
{
    // End:0x5c
    if(Weapon != none)
    {
        Weapon.PawnUnpossessed();
        Weapon.ImmediateStopFire();
        Weapon.ServerStopFire(0);
        Weapon.ServerStopFire(1);
        Weapon.ServerStopFire(2);
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    super.UnPossessed();
}

event bool KDriverLeave(bool bForceLeave)
{
    local bool bLeft;
    local Pawn ExDriver;
    local Controller ExController;

    // End:0x1a
    if(Controller != none)
    {
        Controller.StopFiring();
    }
    ExController = Controller;
    ExDriver = Driver;
    bLeft = super.KDriverLeave(bForceLeave);
    // End:0xa5
    if(bLeft && ExDriver != none && ExDriver.Weapon == none && ExController != none && ExController.Pawn == ExDriver)
    {
        ExController.SwitchToBestWeapon();
    }
    return bLeft;
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    super.ClientKDriverEnter(PC);
    PC.Pawn = self;
    Controller = PC;
    SetOwner(PC);
    // End:0x52
    if(Weapon != none)
    {
        PendingWeapon = none;
        Weapon.BringUp();
    }
    // End:0x61
    else
    {
        PC.SwitchToBestWeapon();
    }
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    // End:0x27
    if(PC != none && Weapon != none)
    {
        Weapon.PawnUnpossessed();
    }
    super.ClientKDriverLeave(PC);
}

simulated function bool StopWeaponFiring()
{
    // End:0x0d
    if(Weapon == none)
    {
        return false;
    }
    Weapon.PawnUnpossessed();
    // End:0xeb
    if(Weapon.IsFiring())
    {
        // End:0xb6
        if(Controller != none)
        {
            // End:0x71
            if(!Controller.IsA('PlayerController'))
            {
                Weapon.ServerStopFire(byte(Weapon.BotMode));
            }
            // End:0xb3
            else
            {
                Controller.StopFiring();
                Weapon.ServerStopFire(0);
                Weapon.ServerStopFire(1);
                Weapon.ServerStopFire(2);
            }
        }
        // End:0xe9
        else
        {
            Weapon.ServerStopFire(0);
            Weapon.ServerStopFire(1);
            Weapon.ServerStopFire(2);
        }
        return true;
    }
    return false;
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int ActualDamage;
    local bool bAlreadyDead;
    local Controller Killer;

    // End:0x49
    if(Role < 4)
    {
        Log(string(self) $ " client damage type " $ string(DamageType) $ " by " $ string(instigatedBy));
        return;
    }
    // End:0x5f
    if(Level.Game == none)
    {
        return;
    }
    // End:0x84
    if(bSpawnProtected && instigatedBy != none && instigatedBy != self)
    {
        return;
    }
    // End:0xaf
    if(Level.TimeSeconds == DamLastDamageTime && instigatedBy == DamLastInstigator)
    {
        return;
    }
    DamLastInstigator = instigatedBy;
    DamLastDamageTime = Level.TimeSeconds;
    // End:0xe4
    if(DamageType == none)
    {
        DamageType = class'DamageType';
    }
    Damage *= DamageType.default.VehicleDamageScaling;
    Momentum *= DamageType.default.VehicleMomentumScaling * MomentumMult;
    bAlreadyDead = Health <= 0;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x170
    if(Weapon != none)
    {
        Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x19a
    if(instigatedBy != none && instigatedBy.HasUDamage())
    {
        Damage *= float(2);
    }
    ActualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
    // End:0x207
    if(DamageType.default.bArmorStops && ActualDamage > 0)
    {
        ActualDamage = ShieldAbsorb(ActualDamage);
    }
    // End:0x256
    if(bShowDamageOverlay && DamageType.default.DamageOverlayMaterial != none && ActualDamage > 0)
    {
        SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, true);
    }
    Health -= ActualDamage;
    // End:0x284
    if(HitLocation == vect(0.0, 0.0, 0.0))
    {
        HitLocation = Location;
    }
    // End:0x28f
    if(bAlreadyDead)
    {
        return;
    }
    PlayHit(float(ActualDamage), instigatedBy, HitLocation, DamageType, Momentum);
    // End:0x359
    if(Health <= 0)
    {
        // End:0x2d8
        if(bRemoteControlled && Driver != none)
        {
            KDriverLeave(false);
        }
        // End:0x2fb
        if(instigatedBy != none)
        {
            Killer = instigatedBy.GetKillerController();
        }
        // End:0x325
        else
        {
            // End:0x325
            if(DamageType != none && DamageType.default.bDelayedDamage)
            {
                Killer = DelayedDamageInstigatorController;
            }
        }
        Health = 0;
        TearOffMomentum = Momentum;
        Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType);
    }
    // End:0x391
    else
    {
        // End:0x391
        if(Controller != none)
        {
            Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
        }
    }
    MakeNoise(1.0);
}

simulated function Explode(Vector HitLocation, Vector HitNormal);
final simulated function float CalcInertia(float DeltaTime, float FrictionFactor, float OldValue, float NewValue)
{
    local float friction;

    friction = 1.0 - FClamp(0.020 * FrictionFactor ** DeltaTime, 0.0, 1.0);
    return OldValue * friction + NewValue;
}

simulated event PlayDying(class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    Explode(Location, vect(0.0, 0.0, 1.0));
    // End:0x45
    if(Level.Game != none)
    {
        Level.Game.DiscardInventory(self);
    }
    // End:0x77
    if(PlayerController(Controller) != none && PlayerController(Controller).Pawn != self)
    {
        Controller = none;
    }
    // End:0xce
    if(PlayerController(Controller) != none)
    {
        // End:0xb9
        if(bDrawDriverInTP && Driver != none)
        {
            PlayerController(Controller).SetViewTarget(Driver);
        }
        // End:0xce
        else
        {
            PlayerController(Controller).SetViewTarget(self);
        }
    }
    bCanTeleport = false;
    bReplicateMovement = false;
    bTearOff = true;
    bPlayedDeath = true;
    GotoState('Dying');
}

function name GetWeaponBoneFor(Inventory i)
{
    return 'None';
}

simulated function DrawHUD(Canvas C);
simulated function SpecialDrawCrosshair(Canvas C)
{
    local Vector ScreenPos;
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x47
    if(Health < 1 || PC == none || PC.myHUD.bShowScoreBoard)
    {
        return;
    }
    DrawCrosshair(C, ScreenPos);
    // End:0x70
    if(WeaponHitsCrosshairsHL())
    {
        DrawCrosshairAlignment(C, ScreenPos);
    }
    DrawEnemyName(C, HudCDeathmatch(PC.myHUD));
}

simulated function DrawVehicleHUD(Canvas C, PlayerController PC);
simulated function DrawWeaponInfo(Canvas C, HUD H);
simulated function DrawHealthInfo(Canvas C, PlayerController PC);
simulated function bool DrawCrosshair(Canvas C, out Vector ScreenPos)
{
    local Vector HitLocation;
    local float ratioX, ratioY, tileX, tileY, SizeX, SizeY;

    HitLocation = GetCrosshairWorldLocation();
    ScreenPos = C.WorldToScreen(HitLocation);
    SizeX = float(DefaultCrosshair.MaterialUSize());
    SizeY = float(DefaultCrosshair.MaterialVSize());
    ratioX = float(C.SizeX) / 640.0;
    ratioY = float(C.SizeY) / 480.0;
    tileX = CrosshairScale * SizeX * ratioX;
    tileY = CrosshairScale * SizeY * ratioX;
    class'HUD_Assault'.static.ClipScreenCoords(C, ScreenPos.X, ScreenPos.Y, tileX * 0.50, tileY * 0.50);
    C.Style = 5;
    C.DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(ScreenPos.X - tileX * 0.50, ScreenPos.Y - tileY * 0.50);
    C.DrawTile(DefaultCrosshair, tileX, tileY, 0.0, 0.0, SizeX, SizeY);
    return true;
}

simulated function bool WeaponHitsCrosshairsHL()
{
    local Vector DesiredHL, DesiredHN, HL, HN;
    local Actor DesiredHitActor, HitActor;

    DesiredHitActor = CalcWeaponFire(DesiredHL, DesiredHN);
    // End:0x23
    if(DesiredHitActor == none)
    {
        return true;
    }
    HitActor = PerformTrace(HL, HN, DesiredHL, GetFireStart());
    // End:0x55
    if(HL == DesiredHL)
    {
        return true;
    }
    return false;
}

simulated function DrawCrosshairAlignment(Canvas C, Vector ScreenPos)
{
    local float ratioX, ratioY;

    ratioX = float(C.SizeX) / 640.0;
    ratioY = float(C.SizeY) / 480.0;
    C.DrawColor = C.MakeColor(0, byte(255), 0, 192);
    C.Style = 5;
    C.SetPos(ScreenPos.X - float(16) * ratioX, ScreenPos.Y - float(16) * ratioY);
    C.DrawTile(CrosshairHitFeedbackTex, 32.0 * ratioX, 32.0 * ratioY, 0.0, 0.0, float(CrosshairHitFeedbackTex.MaterialUSize()), float(CrosshairHitFeedbackTex.MaterialVSize()));
}

simulated function DrawEnemyName(Canvas C, HudCDeathmatch H)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    // End:0x21
    if(H.bNoEnemyNames || Controller == none)
    {
        return;
    }
    HitActor = CalcWeaponFire(HitLocation, HitNormal);
    // End:0x147
    if(Pawn(HitActor) != none && HitActor != self && Pawn(HitActor).PlayerReplicationInfo != none && Team != Pawn(HitActor).GetTeamNum())
    {
        // End:0x125
        if(H.NamedPlayer != Pawn(HitActor).PlayerReplicationInfo || Level.TimeSeconds - H.NameTime > 0.50)
        {
            H.DisplayEnemyName(C, Pawn(HitActor).PlayerReplicationInfo);
            H.NameTime = Level.TimeSeconds;
        }
        H.NamedPlayer = Pawn(HitActor).PlayerReplicationInfo;
    }
}

event NotifyEnemyLockedOn()
{
    super.NotifyEnemyLockedOn();
    // End:0x3c
    if(PlayerController(Controller) != none && LockedOnSound != none)
    {
        PlayerController(Controller).ClientPlaySound(LockedOnSound);
    }
}

simulated function Vector GetCrosshairWorldLocation()
{
    return GetFireStart(65536.0);
}

simulated function Vector GetFireStart(optional float XOffset)
{
    local Vector StartOffset, X, Y, Z;

    GetAxes(Rotation, X, Y, Z);
    StartOffset = VehicleProjSpawnOffset;
    // End:0x3a
    if(bCHZeroYOffset)
    {
        StartOffset.Y = 0.0;
    }
    return Location + X * StartOffset.X + XOffset + Y * StartOffset.Y + Z * StartOffset.Z;
}

function Vector GetBotError(Vector StartLocation)
{
    Controller.ShotTarget = Pawn(Controller.Target);
    // End:0x7e
    if(Controller.Target != OldTarget)
    {
        BotError = float(1500) - float(100) * Level.Game.GameDifficulty * VRand();
        OldTarget = Controller.Target;
    }
    BotError += float(100) * VRand() + float(100) - float(200) * FRand() * Normal(Controller.Target.Velocity);
    // End:0xed
    if(Pawn(OldTarget) != none && Pawn(OldTarget).bStationary)
    {
        BotError *= 0.60;
    }
    BotError = Normal(BotError) * FMin(VSize(BotError), FMin(1500.0 - float(100) * Level.Game.GameDifficulty, 0.20 * VSize(Controller.Target.Location - StartLocation)));
    return BotError;
}

simulated function Actor CalcWeaponFire(out Vector HitLocation, out Vector HitNormal)
{
    local Vector Target, StartLocation, CannonLocation;
    local Actor A;
    local Rotator Rot;
    local Vector X, Y, Z;
    local float Angle;

    // End:0x34
    if(LastCalcWeaponFire == Level.TimeSeconds)
    {
        HitLocation = LastCalcHL;
        HitNormal = LastCalcHN;
        return LastCalcHA;
    }
    CannonLocation = GetFireStart();
    // End:0x76
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).PlayerCalcView(A, StartLocation, Rot);
    }
    // End:0x8c
    else
    {
        StartLocation = CannonLocation;
        Rot = Rotation;
    }
    Target = GetCrosshairWorldLocation();
    // End:0xfa
    if(Controller != none)
    {
        // End:0xd4
        if(Controller.Target == none)
        {
            Controller.Target = Controller.Enemy;
        }
        // End:0xfa
        if(Controller.Target != none)
        {
            Target += GetBotError(StartLocation);
        }
    }
    A = PerformTrace(HitLocation, HitNormal, Target, StartLocation);
    GetAxes(Rot, X, Y, Z);
    Angle = HitLocation - CannonLocation Dot X;
    // End:0x181
    if(A == none || Angle < float(0))
    {
        HitLocation = Target;
        HitNormal = vect(0.0, 0.0, 0.0);
    }
    LastCalcWeaponFire = Level.TimeSeconds;
    LastCalcHA = A;
    LastCalcHL = HitLocation;
    LastCalcHN = HitNormal;
    return A;
}

simulated function Actor PerformTrace(out Vector HitLocation, out Vector HitNormal, Vector End, Vector Start)
{
    local Actor A;
    local bool bDriverBlockZeroExtent;

    bBlockZeroExtentTraces = false;
    // End:0x3a
    if(Driver != none)
    {
        bDriverBlockZeroExtent = Driver.bBlockZeroExtentTraces;
        Driver.bBlockZeroExtentTraces = false;
    }
    A = Trace(HitLocation, HitNormal, End, Start, true);
    // End:0x81
    if(A == none)
    {
        HitLocation = End;
        HitNormal = vect(0.0, 0.0, 0.0);
    }
    bBlockZeroExtentTraces = true;
    // End:0xaa
    if(Driver != none)
    {
        Driver.bBlockZeroExtentTraces = bDriverBlockZeroExtent;
    }
    return A;
}

static function StaticPrecache(LevelInfo L)
{
    super.StaticPrecache(L);
    L.AddPrecacheMaterial(default.NoEntryTexture);
    L.AddPrecacheMaterial(default.TeamBeaconTexture);
    L.AddPrecacheMaterial(default.TeamBeaconBorderMaterial);
    L.AddPrecacheMaterial(default.CrosshairHitFeedbackTex);
    L.AddPrecacheMaterial(default.DefaultCrosshair);
    L.AddPrecacheMaterial(default.VehicleIcon.Material);
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(default.NoEntryTexture);
    Level.AddPrecacheMaterial(default.TeamBeaconTexture);
    Level.AddPrecacheMaterial(default.TeamBeaconBorderMaterial);
    Level.AddPrecacheMaterial(default.CrosshairHitFeedbackTex);
    Level.AddPrecacheMaterial(default.DefaultCrosshair);
    Level.AddPrecacheMaterial(VehicleIcon.Material);
    super(Actor).UpdatePrecacheMaterials();
}

state Dying
{
    ignores BreathTimer, ProcessMove, DriverDied;

    event ChangeAnimation();
    event StopPlayFiring();
    function PlayFiring(float Rate, name FiringMode);
    function PlayWeaponSwitch(wWeapon newWeapon);
    function PlayTakeHit(Vector HitLoc, int Damage, class<DamageType> DamageType);
    simulated function PlayNextAnimation();
    event FellOutOfWorld(Engine.Actor.eKillZType KillType);
    function Landed(Vector HitNormal);
    function ReduceCylinder();
    function LandThump();
    event AnimEnd(int Channel);
    function LieStill();
    singular function BaseChange();
    function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
    function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange);
    function VehicleSwitchView(bool bUpdating);
    simulated function Timer()
    {
        // End:0x0e
        if(!bDeleteMe)
        {
            Destroy();
        }
    }

    function BeginState()
    {
        local PlayerController PC, LocalPlayer;

        LocalPlayer = Level.GetLocalPlayerController();
        AmbientSound = none;
        Velocity = vect(0.0, 0.0, 0.0);
        Acceleration = Velocity;
        bHidden = true;
        SetPhysics(0);
        SetCollision(false, false, false);
        // End:0x7f
        if(PlayerController(Controller) != none && PlayerController(Controller).Pawn != self)
        {
            Controller = none;
        }
        // End:0xb1
        if(PlayerController(DestroyPrevController) != none && PlayerController(DestroyPrevController).ViewTarget != self)
        {
            DestroyPrevController = none;
        }
        // End:0xd4
        if(PlayerController(Controller) != none)
        {
            PC = PlayerController(Controller);
        }
        // End:0xf4
        else
        {
            // End:0xf4
            if(PlayerController(DestroyPrevController) != none)
            {
                PC = PlayerController(DestroyPrevController);
            }
        }
        // End:0x126
        if(PC != none && !PC.bBehindView)
        {
            PC.bBehindView = true;
        }
        // End:0x142
        if(Driver != none && bDrawDriverInTP)
        {
            Destroyed_HandleDriver();
        }
        // End:0x182
        if(Level.NetMode == 1 || Level.NetMode == 2)
        {
            SetTimer(1.0, false);
        }
        // End:0x26c
        else
        {
            // End:0x24e
            if(Driver == none || !bDrawDriverInTP && PC != none || LocalPlayer != none && LocalPlayer.ViewTarget == self)
            {
                // End:0x215
                if(Controller != none)
                {
                    DestroyPrevController = Controller;
                    Controller.SetRotation(Rotation);
                    Controller.PawnDied(self);
                    DestroyPrevController.SetRotation(Rotation);
                }
                // End:0x242
                else
                {
                    // End:0x242
                    if(DestroyPrevController != none)
                    {
                        DestroyPrevController.SetRotation(Rotation);
                        DestroyPrevController.SetLocation(Location);
                    }
                }
                SetTimer(5.0, false);
            }
            // End:0x26c
            else
            {
                // End:0x269
                if(Controller != none)
                {
                    Controller.PawnDied(self);
                }
                Destroy();
            }
        }
    }

}

defaultproperties
{
    CrosshairScale=0.1250
    bDrawVehicleShadow=true
    bShowDamageOverlay=true
    bAdjustDriversHead=true
    bDesiredBehindView=true
    bSpecialCrosshair=true
    BaseEyeHeight=0.0
    EyeHeight=0.0
    bStasis=true
    bNetInitialRotation=true
    bCanTeleport=true
    bBlockKarma=true
}