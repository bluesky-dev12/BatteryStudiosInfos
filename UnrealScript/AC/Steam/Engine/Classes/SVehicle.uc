/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\SVehicle.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:10
 *
 *******************************************************************************/
class SVehicle extends Vehicle
    native
    abstract
    placeable;

var() export editinline array<export editinline SVehicleWheel> Wheels;
var const bool bVehicleOnGround;
var() float VehicleMass;
var() float FlipTorque;
var() float FlipTime;
var float FlipScale;
var float FlipTimeLeft;
var Vector FlipAxis;
var() class<Actor> DestroyEffectClass;

// Export USVehicle::execGraphData(FFrame&, void* const)
native final function GraphData(string DataName, float DataValue);
event VehicleStateReceived();
// Export USVehicle::execUpdateVehicle(FFrame&, void* const)
native event UpdateVehicle(float DeltaTime);
simulated function PostNetBeginPlay()
{
    super(Pawn).PostNetBeginPlay();
    SVehicleUpdateParams();
}

function JumpOffPawn();
simulated event SVehicleUpdateParams()
{
    KSetMass(VehicleMass);
}

function Flip(Vector HitNormal, float ForceScale)
{
    // End:0x0d
    if(!bCanFlip)
    {
        return;
    }
    FlipTimeLeft = FlipTime;
    FlipScale = ForceScale;
    FlipAxis = HitNormal;
    FlipAxis.Z = 0.0;
    Enable('Tick');
}

simulated function KApplyForce(out Vector Force, out Vector Torque)
{
    local float torqueScale;
    local Vector worldUp, torqueAxis;

    super(Actor).KApplyForce(Force, Torque);
    // End:0x1f
    if(FlipTimeLeft <= float(0))
    {
        return;
    }
    worldUp = vect(0.0, 0.0, 1.0) >> Rotation;
    torqueAxis = Normal(FlipAxis Cross worldUp);
    torqueScale = Acos(worldUp Dot vect(0.0, 0.0, 1.0)) / 3.14160;
    Torque = FlipScale * FlipTorque * torqueScale * torqueAxis;
}

simulated function Tick(float DeltaTime)
{
    super(Pawn).Tick(DeltaTime);
    // End:0x4b
    if(FlipTimeLeft > float(0))
    {
        KWake();
        FlipTimeLeft -= DeltaTime;
        // End:0x4b
        if(FlipTimeLeft <= float(0) && !bDriving)
        {
            Disable('Tick');
        }
    }
}

simulated function Destroyed()
{
    // End:0x1f
    if(DestroyEffectClass != none)
    {
        Spawn(DestroyEffectClass,,, Location, Rotation);
    }
    super.Destroyed();
}

defaultproperties
{
    VehicleMass=1.0
    FlipTorque=300.0
    FlipTime=2.0
    bSpecialCalcView=true
    bAlwaysRelevant=true
    bNetInitialRotation=true
    Physics=13
    bCollideWorld=true
    bBlockKarma=true
    bEdShouldSnap=true
}