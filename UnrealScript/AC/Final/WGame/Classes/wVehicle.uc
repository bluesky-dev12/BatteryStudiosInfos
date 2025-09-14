class wVehicle extends Vehicle
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

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    //return;    
}

simulated function ClientDying(Class<DamageType> DamageType, Vector HitLocation)
{
    //return;    
}

simulated function Tick(float DeltaTime)
{
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x4A
    if(Level.Game != none)
    {
        BotError = (float(1000) - (float(50) * Level.Game.GameDifficulty)) * VRand();
    }
    GetBoneCoords('None');
    SetCollision(false, false);
    SetCollision(true, true);
    AddDefaultInventory();
    //return;    
}

simulated event Destroyed()
{
    // End:0x2D
    if(Level.Game != none)
    {
        Level.Game.DiscardInventory(self);
    }
    super.Destroyed();
    //return;    
}

function AddDefaultInventory()
{
    GiveWeapon(DefaultWeaponClassName);
    //return;    
}

function PossessedBy(Controller C)
{
    super.PossessedBy(C);
    NetUpdateTime = Level.TimeSeconds - float(1);
    bStasis = false;
    C.Pawn = self;
    // End:0x56
    if(Controller != none)
    {
        Controller.ClientSwitchToBestWeapon();
    }
    // End:0xA9
    if(Weapon != none)
    {
        Weapon.NetUpdateTime = Level.TimeSeconds - float(1);
        Weapon.Instigator = self;
        PendingWeapon = none;
        Weapon.BringUp();
    }
    //return;    
}

function UnPossessed()
{
    // End:0x5C
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
    //return;    
}

event bool KDriverLeave(bool bForceLeave)
{
    local bool bLeft;
    local Pawn ExDriver;
    local Controller ExController;

    // End:0x1A
    if(Controller != none)
    {
        Controller.StopFiring();
    }
    ExController = Controller;
    ExDriver = Driver;
    bLeft = super.KDriverLeave(bForceLeave);
    // End:0xA5
    if((((bLeft && ExDriver != none) && ExDriver.Weapon == none) && ExController != none) && ExController.Pawn == ExDriver)
    {
        ExController.SwitchToBestWeapon();
    }
    return bLeft;
    //return;    
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
    else
    {
        PC.SwitchToBestWeapon();
    }
    //return;    
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    // End:0x27
    if((PC != none) && Weapon != none)
    {
        Weapon.PawnUnpossessed();
    }
    super.ClientKDriverLeave(PC);
    //return;    
}

simulated function bool StopWeaponFiring()
{
    // End:0x0D
    if(Weapon == none)
    {
        return false;
    }
    Weapon.PawnUnpossessed();
    // End:0xEB
    if(Weapon.IsFiring())
    {
        // End:0xB6
        if(Controller != none)
        {
            // End:0x71
            if(!Controller.IsA('PlayerController'))
            {
                Weapon.ServerStopFire(byte(Weapon.BotMode));                
            }
            else
            {
                Controller.StopFiring();
                Weapon.ServerStopFire(0);
                Weapon.ServerStopFire(1);
                Weapon.ServerStopFire(2);
            }            
        }
        else
        {
            Weapon.ServerStopFire(0);
            Weapon.ServerStopFire(1);
            Weapon.ServerStopFire(2);
        }
        return true;
    }
    return false;
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int ActualDamage;
    local bool bAlreadyDead;
    local Controller Killer;

    // End:0x49
    if(int(Role) < int(ROLE_Authority))
    {
        Log((((string(self) $ " client damage type ") $ string(DamageType)) $ " by ") $ string(instigatedBy));
        return;
    }
    // End:0x5F
    if(Level.Game == none)
    {
        return;
    }
    // End:0x84
    if((bSpawnProtected && instigatedBy != none) && instigatedBy != self)
    {
        return;
    }
    // End:0xAF
    if((Level.TimeSeconds == DamLastDamageTime) && instigatedBy == DamLastInstigator)
    {
        return;
    }
    DamLastInstigator = instigatedBy;
    DamLastDamageTime = Level.TimeSeconds;
    // End:0xE4
    if(DamageType == none)
    {
        DamageType = Class'Engine.DamageType';
    }
    Damage *= DamageType.default.VehicleDamageScaling;
    Momentum *= (DamageType.default.VehicleMomentumScaling * MomentumMult);
    bAlreadyDead = Health <= 0;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x170
    if(Weapon != none)
    {
        Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x19A
    if((instigatedBy != none) && instigatedBy.HasUDamage())
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
    if((bShowDamageOverlay && DamageType.default.DamageOverlayMaterial != none) && ActualDamage > 0)
    {
        SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, true);
    }
    Health -= ActualDamage;
    // End:0x284
    if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
    {
        HitLocation = Location;
    }
    // End:0x28F
    if(bAlreadyDead)
    {
        return;
    }
    PlayHit(float(ActualDamage), instigatedBy, HitLocation, DamageType, Momentum);
    // End:0x359
    if(Health <= 0)
    {
        // End:0x2D8
        if(bRemoteControlled && Driver != none)
        {
            KDriverLeave(false);
        }
        // End:0x2FB
        if(instigatedBy != none)
        {
            Killer = instigatedBy.GetKillerController();            
        }
        else
        {
            // End:0x325
            if((DamageType != none) && DamageType.default.bDelayedDamage)
            {
                Killer = DelayedDamageInstigatorController;
            }
        }
        Health = 0;
        TearOffMomentum = Momentum;
        Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType);        
    }
    else
    {
        // End:0x391
        if(Controller != none)
        {
            Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
        }
    }
    MakeNoise(1.0000000);
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    //return;    
}

final simulated function float CalcInertia(float DeltaTime, float FrictionFactor, float OldValue, float NewValue)
{
    local float friction;

    friction = 1.0000000 - FClamp((0.0200000 * FrictionFactor) ** DeltaTime, 0.0000000, 1.0000000);
    return (OldValue * friction) + NewValue;
    //return;    
}

simulated event PlayDying(Class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
    // End:0x45
    if(Level.Game != none)
    {
        Level.Game.DiscardInventory(self);
    }
    // End:0x77
    if((PlayerController(Controller) != none) && PlayerController(Controller).Pawn != self)
    {
        Controller = none;
    }
    // End:0xCE
    if(PlayerController(Controller) != none)
    {
        // End:0xB9
        if(bDrawDriverInTP && Driver != none)
        {
            PlayerController(Controller).SetViewTarget(Driver);            
        }
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
    //return;    
}

function name GetWeaponBoneFor(Inventory i)
{
    return 'None';
    //return;    
}

simulated function DrawHUD(Canvas C)
{
    //return;    
}

simulated function SpecialDrawCrosshair(Canvas C)
{
    //return;    
}

simulated function DrawVehicleHUD(Canvas C, PlayerController PC)
{
    //return;    
}

simulated function DrawWeaponInfo(Canvas C, HUD H)
{
    //return;    
}

simulated function DrawHealthInfo(Canvas C, PlayerController PC)
{
    //return;    
}

simulated function bool DrawCrosshair(Canvas C, out Vector ScreenPos)
{
    return true;
    //return;    
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
    //return;    
}

simulated function DrawCrosshairAlignment(Canvas C, Vector ScreenPos)
{
    local float ratioX, ratioY;

    ratioX = float(C.SizeX) / 640.0000000;
    ratioY = float(C.SizeY) / 480.0000000;
    C.DrawColor = C.MakeColor(0, byte(255), 0, 192);
    C.Style = 5;
    C.SetPos(ScreenPos.X - (float(16) * ratioX), ScreenPos.Y - (float(16) * ratioY));
    C.DrawTile(CrosshairHitFeedbackTex, 32.0000000 * ratioX, 32.0000000 * ratioY, 0.0000000, 0.0000000, float(CrosshairHitFeedbackTex.MaterialUSize()), float(CrosshairHitFeedbackTex.MaterialVSize()));
    //return;    
}

event NotifyEnemyLockedOn()
{
    super.NotifyEnemyLockedOn();
    //return;    
}

simulated function Vector GetCrosshairWorldLocation()
{
    return GetFireStart(65536.0000000);
    //return;    
}

simulated function Vector GetFireStart(optional float XOffset)
{
    local Vector StartOffset, X, Y, Z;

    GetAxes(Rotation, X, Y, Z);
    StartOffset = VehicleProjSpawnOffset;
    // End:0x3A
    if(bCHZeroYOffset)
    {
        StartOffset.Y = 0.0000000;
    }
    return ((Location + (X * (StartOffset.X + XOffset))) + (Y * StartOffset.Y)) + (Z * StartOffset.Z);
    //return;    
}

function Vector GetBotError(Vector StartLocation)
{
    Controller.ShotTarget = Pawn(Controller.Target);
    // End:0x7E
    if(Controller.Target != OldTarget)
    {
        BotError = (float(1500) - (float(100) * Level.Game.GameDifficulty)) * VRand();
        OldTarget = Controller.Target;
    }
    BotError += ((float(100) * VRand()) + ((float(100) - (float(200) * FRand())) * Normal(Controller.Target.Velocity)));
    // End:0xED
    if((Pawn(OldTarget) != none) && Pawn(OldTarget).bStationary)
    {
        BotError *= 0.6000000;
    }
    BotError = Normal(BotError) * FMin(VSize(BotError), FMin(1500.0000000 - (float(100) * Level.Game.GameDifficulty), 0.2000000 * VSize(Controller.Target.Location - StartLocation)));
    return BotError;
    //return;    
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
    else
    {
        StartLocation = CannonLocation;
        Rot = Rotation;
    }
    Target = GetCrosshairWorldLocation();
    // End:0xFA
    if(Controller != none)
    {
        // End:0xD4
        if(Controller.Target == none)
        {
            Controller.Target = Controller.Enemy;
        }
        // End:0xFA
        if(Controller.Target != none)
        {
            Target += (GetBotError(StartLocation));
        }
    }
    A = PerformTrace(HitLocation, HitNormal, Target, StartLocation);
    GetAxes(Rot, X, Y, Z);
    Angle = (HitLocation - CannonLocation) Dot X;
    // End:0x181
    if((A == none) || Angle < float(0))
    {
        HitLocation = Target;
        HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
    }
    LastCalcWeaponFire = Level.TimeSeconds;
    LastCalcHA = A;
    LastCalcHL = HitLocation;
    LastCalcHN = HitNormal;
    return A;
    //return;    
}

simulated function Actor PerformTrace(out Vector HitLocation, out Vector HitNormal, Vector End, Vector Start)
{
    local Actor A;
    local bool bDriverBlockZeroExtent;

    bBlockZeroExtentTraces = false;
    // End:0x3A
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
        HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
    }
    bBlockZeroExtentTraces = true;
    // End:0xAA
    if(Driver != none)
    {
        Driver.bBlockZeroExtentTraces = bDriverBlockZeroExtent;
    }
    return A;
    //return;    
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
    //return;    
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
    //return;    
}

state Dying
{
    ignores BeginState, Timer, VehicleSwitchView, UpdateRocketAcceleration, TakeDamage, Died, 
	    BaseChange, LieStill, AnimEnd, LandThump, ReduceCylinder, 
	    Landed, FellOutOfWorld, PlayNextAnimation, PlayTakeHit, PlayWeaponSwitch, 
	    PlayFiring, StopPlayFiring, ChangeAnimation;

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

    function Landed(Vector HitNormal)
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

    function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
    {
        //return;        
    }

    function VehicleSwitchView(bool bUpdating)
    {
        //return;        
    }

    simulated function Timer()
    {
        // End:0x0E
        if(!bDeleteMe)
        {
            Destroy();
        }
        //return;        
    }

    function BeginState()
    {
        local PlayerController PC, LocalPlayer;

        LocalPlayer = Level.GetLocalPlayerController();
        AmbientSound = none;
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Acceleration = Velocity;
        bHidden = true;
        SetPhysics(0);
        SetCollision(false, false, false);
        // End:0x7F
        if((PlayerController(Controller) != none) && PlayerController(Controller).Pawn != self)
        {
            Controller = none;
        }
        // End:0xB1
        if((PlayerController(DestroyPrevController) != none) && PlayerController(DestroyPrevController).ViewTarget != self)
        {
            DestroyPrevController = none;
        }
        // End:0xD4
        if(PlayerController(Controller) != none)
        {
            PC = PlayerController(Controller);            
        }
        else
        {
            // End:0xF4
            if(PlayerController(DestroyPrevController) != none)
            {
                PC = PlayerController(DestroyPrevController);
            }
        }
        // End:0x126
        if((PC != none) && !PC.bBehindView)
        {
            PC.bBehindView = true;
        }
        // End:0x142
        if((Driver != none) && bDrawDriverInTP)
        {
            Destroyed_HandleDriver();
        }
        // End:0x182
        if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
        {
            SetTimer(1.0000000, false);            
        }
        else
        {
            // End:0x24E
            if(((Driver == none) || !bDrawDriverInTP) && (PC != none) || (LocalPlayer != none) && LocalPlayer.ViewTarget == self)
            {
                // End:0x215
                if(Controller != none)
                {
                    DestroyPrevController = Controller;
                    Controller.SetRotation(Rotation);
                    Controller.PawnDied(self);
                    DestroyPrevController.SetRotation(Rotation);                    
                }
                else
                {
                    // End:0x242
                    if(DestroyPrevController != none)
                    {
                        DestroyPrevController.SetRotation(Rotation);
                        DestroyPrevController.SetLocation(Location);
                    }
                }
                SetTimer(5.0000000, false);                
            }
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
        //return;        
    }
    stop;    
}

defaultproperties
{
    CrosshairScale=0.1250000
    bDrawVehicleShadow=false
    bShowDamageOverlay=true
    bAdjustDriversHead=false
    bDesiredBehindView=false
    bSpecialCrosshair=true
    BaseEyeHeight=0.0000000
    EyeHeight=0.0000000
    bStasis=false
    bNetInitialRotation=true
    bCanTeleport=false
    bBlockKarma=true
}