class KVehicle extends Vehicle
    abstract
    native
    placeable;

const FilterFrames = 5;

var() Class<Actor> DestroyEffectClass;
var() bool bAutoDrive;
var bool bVehicleIsFiring;
var bool bVehicleIsAltFiring;
var Vector CameraHistory[5];
var int NextHistorySlot;
var bool bHistoryWarmup;

// Export UKVehicle::execGraphData(FFrame&, void* const)
native final function GraphData(string DataName, float DataValue)
{
    //native.DataName;
    //native.DataValue;        
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    //return;    
}

event VehicleStateReceived()
{
    //return;    
}

simulated event KVehicleUpdateParams()
{
    //return;    
}

function bool TryToDrive(Pawn P)
{
    // End:0x56
    if(((P.bIsCrouched || P.Controller == none) || Driver != none) || !P.Controller.bIsPlayer)
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
    //return;    
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    PC.myHUD.bCrosshairShow = false;
    PC.myHUD.bShowWeaponInfo = false;
    PC.myHUD.bShowPoints = false;
    PC.bBehindView = true;
    PC.bFreeCamera = true;
    PC.SetRotation(Rotator(vect(-1.0000000, 0.0000000, 0.0000000) >> Rotation));
    //return;    
}

function KDriverEnter(Pawn P)
{
    local PlayerController PC;
    local Controller C;

    Driver = P;
    Driver.SetCollision(false, false);
    Driver.bCollideWorld = false;
    Driver.bPhysicsAnimUpdate = false;
    Driver.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
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
    //return;    
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
    //return;    
}

function bool KDriverLeave(bool bForceLeave)
{
    local PlayerController PC;
    local int i;
    local bool havePlaced;
    local Vector HitLocation, HitNormal, tryPlace;

    // End:0x0D
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

        // End:0xD0 [Loop If]
        if((i < ExitPositions.Length) && havePlaced == false)
        {
            tryPlace = Location + (ExitPositions[i] >> Rotation);
            // End:0xA5
            if(Trace(HitLocation, HitNormal, tryPlace, Location, false) != none)
            {
                // [Explicit Continue]
                goto J0xC6;
            }
            // End:0xBE
            if(!Driver.SetLocation(tryPlace))
            {
                // [Explicit Continue]
                goto J0xC6;
            }
            havePlaced = true;
            J0xC6:

            i++;
            // [Loop Continue]
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
    // End:0x1ED
    if(!bRemoteControlled)
    {
        Driver.Acceleration = vect(0.0000000, 0.0000000, 24000.0000000);
        Driver.SetPhysics(2);
        Driver.SetBase(none);
    }
    Driver = none;
    Throttle = 0.0000000;
    Steering = 0.0000000;
    bVehicleIsFiring = false;
    bVehicleIsAltFiring = false;
    return true;
    //return;    
}

simulated function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector CamLookAt, HitLocation, HitNormal;
    local PlayerController PC;
    local int i, averageOver;

    PC = PlayerController(Controller);
    // End:0x33
    if((PC == none) || PC.ViewTarget != self)
    {
        return false;
    }
    ViewActor = self;
    CamLookAt = Location + (vect(-100.0000000, 0.0000000, 100.0000000) >> Rotation);
    CameraHistory[NextHistorySlot] = CamLookAt;
    NextHistorySlot++;
    // End:0x8B
    if(bHistoryWarmup)
    {
        averageOver = NextHistorySlot;        
    }
    else
    {
        averageOver = 5;
    }
    CamLookAt = vect(0.0000000, 0.0000000, 0.0000000);
    i = 0;
    J0xAD:

    // End:0xD8 [Loop If]
    if(i < averageOver)
    {
        CamLookAt += CameraHistory[i];
        i++;
        // [Loop Continue]
        goto J0xAD;
    }
    CamLookAt /= float(averageOver);
    // End:0x101
    if(NextHistorySlot == 5)
    {
        NextHistorySlot = 0;
        bHistoryWarmup = false;
    }
    CameraLocation = CamLookAt + (vect(-600.0000000, 0.0000000, 0.0000000) >> CameraRotation);
    // End:0x159
    if(Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
    {
        CameraLocation = HitLocation;
    }
    return true;
    //return;    
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
    //return;    
}

simulated event Tick(float DeltaSeconds)
{
    //return;    
}

defaultproperties
{
    bHistoryWarmup=true
    bSpecialCalcView=true
    bNetInitialRotation=true
    Physics=13
    bCollideWorld=false
    bBlockKarma=true
    bEdShouldSnap=true
}