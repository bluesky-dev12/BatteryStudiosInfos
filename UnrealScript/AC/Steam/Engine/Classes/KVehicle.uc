/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KVehicle.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:7
 *	Functions:12
 *
 *******************************************************************************/
class KVehicle extends Vehicle
    native
    abstract
    placeable;

const FilterFrames = 5;

var() class<Actor> DestroyEffectClass;
var() bool bAutoDrive;
var bool bVehicleIsFiring;
var bool bVehicleIsAltFiring;
var Vector CameraHistory[5];
var int NextHistorySlot;
var bool bHistoryWarmup;

// Export UKVehicle::execGraphData(FFrame&, void* const)
native final function GraphData(string DataName, float DataValue);
function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
}

event VehicleStateReceived();
simulated event KVehicleUpdateParams();
function bool TryToDrive(Pawn P)
{
    // End:0x56
    if(P.bIsCrouched || P.Controller == none || Driver != none || !P.Controller.bIsPlayer)
    {
        return false;
    }
    // End:0x98
    if(!P.IsHumanControlled() || !P.Controller.IsInState('PlayerDriving'))
    {
        KDriverEnter(P);
        return true;
    }
    return false;
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    PC.myHUD.bCrosshairShow = false;
    PC.myHUD.bShowWeaponInfo = false;
    PC.myHUD.bShowPoints = false;
    PC.bBehindView = true;
    PC.bFreeCamera = true;
    PC.SetRotation(rotator(vect(-1.0, 0.0, 0.0) >> Rotation));
}

function KDriverEnter(Pawn P)
{
    local PlayerController PC;
    local Controller C;

    Driver = P;
    Driver.SetCollision(false, false);
    Driver.bCollideWorld = false;
    Driver.bPhysicsAnimUpdate = false;
    Driver.Velocity = vect(0.0, 0.0, 0.0);
    Driver.SetPhysics(0);
    Driver.SetBase(self);
    C = P.Controller;
    P.Controller.UnPossess();
    Driver.SetOwner(C);
    C.Possess(self);
    PC = PlayerController(C);
    // End:0x105
    if(PC != none)
    {
        PC.ClientSetViewTarget_N(self);
        PC.GotoState('PlayerDriving');
        ClientKDriverEnter(PC);
    }
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    PC.bBehindView = false;
    PC.bFreeCamera = false;
    PC.myHUD.bCrosshairShow = PC.myHUD.default.bCrosshairShow;
    PC.myHUD.bShowWeaponInfo = PC.myHUD.default.bShowWeaponInfo;
    PC.myHUD.bShowPoints = PC.myHUD.default.bShowPoints;
    NextHistorySlot = 0;
    bHistoryWarmup = true;
}

function bool KDriverLeave(bool bForceLeave)
{
    local PlayerController PC;
    local int i;
    local bool havePlaced;
    local Vector HitLocation, HitNormal, tryPlace;

    // End:0x0d
    if(Driver == none)
    {
        return false;
    }
    // End:0x124
    if(!bRemoteControlled)
    {
        Driver.bCollideWorld = true;
        Driver.SetCollision(true, true);
        havePlaced = false;
        i = 0;
        J0x46:
        // End:0xd0 [While If]
        if(i < ExitPositions.Length && havePlaced == false)
        {
            tryPlace = Location + ExitPositions[i] >> Rotation;
            // End:0xa5
            if(Trace(HitLocation, HitNormal, tryPlace, Location, false) != none)
            {
            }
            // End:0xc6
            else
            {
                // End:0xbe
                if(!Driver.SetLocation(tryPlace))
                {
                }
                // End:0xc6
                else
                {
                    havePlaced = true;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x46;
        }
        // End:0x124
        if(!havePlaced && !bForceLeave)
        {
            Log("Could not place driver.");
            Driver.bCollideWorld = false;
            Driver.SetCollision(false, false);
            return false;
        }
    }
    PC = PlayerController(Controller);
    ClientKDriverLeave(PC);
    PC.UnPossess();
    PC.Possess(Driver);
    PC.ClientSetViewTarget_M(Driver);
    Controller = none;
    Driver.PlayWaiting();
    Driver.bPhysicsAnimUpdate = Driver.default.bPhysicsAnimUpdate;
    // End:0x1ed
    if(!bRemoteControlled)
    {
        Driver.Acceleration = vect(0.0, 0.0, 24000.0);
        Driver.SetPhysics(2);
        Driver.SetBase(none);
    }
    Driver = none;
    Throttle = 0.0;
    Steering = 0.0;
    bVehicleIsFiring = false;
    bVehicleIsAltFiring = false;
    return true;
}

simulated function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector CamLookAt, HitLocation, HitNormal;
    local PlayerController PC;
    local int i, averageOver;

    PC = PlayerController(Controller);
    // End:0x33
    if(PC == none || PC.ViewTarget != self)
    {
        return false;
    }
    ViewActor = self;
    CamLookAt = Location + vect(-100.0, 0.0, 100.0) >> Rotation;
    CameraHistory[NextHistorySlot] = CamLookAt;
    ++ NextHistorySlot;
    // End:0x8b
    if(bHistoryWarmup)
    {
        averageOver = NextHistorySlot;
    }
    // End:0x93
    else
    {
        averageOver = 5;
    }
    CamLookAt = vect(0.0, 0.0, 0.0);
    i = 0;
    J0xad:
    // End:0xd8 [While If]
    if(i < averageOver)
    {
        CamLookAt += CameraHistory[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    CamLookAt /= float(averageOver);
    // End:0x101
    if(NextHistorySlot == 5)
    {
        NextHistorySlot = 0;
        bHistoryWarmup = false;
    }
    CameraLocation = CamLookAt + vect(-600.0, 0.0, 0.0) >> CameraRotation;
    // End:0x159
    if(Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(10.0, 10.0, 10.0)) != none)
    {
        CameraLocation = HitLocation;
    }
    return true;
}

simulated function Destroyed()
{
    // End:0x17
    if(Driver != none)
    {
        Driver.Destroy();
    }
    // End:0x36
    if(DestroyEffectClass != none)
    {
        Spawn(DestroyEffectClass,,, Location, Rotation);
    }
    super.Destroyed();
}

simulated event Tick(float DeltaSeconds);

defaultproperties
{
    bHistoryWarmup=true
    bSpecialCalcView=true
    bNetInitialRotation=true
    Physics=13
    bCollideWorld=true
    bBlockKarma=true
    bEdShouldSnap=true
}