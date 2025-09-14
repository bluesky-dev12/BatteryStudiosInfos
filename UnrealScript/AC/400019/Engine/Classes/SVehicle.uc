class SVehicle extends Vehicle
    abstract
    native
    placeable;

var() export editinline array<export editinline SVehicleWheel> Wheels;
var const bool bVehicleOnGround;
var() float VehicleMass;
var() float FlipTorque;
var() float FlipTime;
var float FlipScale;
var float FlipTimeLeft;
var Vector FlipAxis;
var() Class<Actor> DestroyEffectClass;

// Export USVehicle::execGraphData(FFrame&, void* const)
native final function GraphData(string DataName, float DataValue)
{
    //native.DataName;
    //native.DataValue;        
}

event VehicleStateReceived()
{
    //return;    
}

// Export USVehicle::execUpdateVehicle(FFrame&, void* const)
native event UpdateVehicle(float DeltaTime)
{
    //native.DeltaTime;        
}

simulated function PostNetBeginPlay()
{
    super(Pawn).PostNetBeginPlay();
    SVehicleUpdateParams();
    //return;    
}

function JumpOffPawn()
{
    //return;    
}

simulated event SVehicleUpdateParams()
{
    KSetMass(VehicleMass);
    //return;    
}

function Flip(Vector HitNormal, float ForceScale)
{
    // End:0x0D
    if(!bCanFlip)
    {
        return;
    }
    FlipTimeLeft = FlipTime;
    FlipScale = ForceScale;
    FlipAxis = HitNormal;
    FlipAxis.Z = 0.0000000;
    Enable('Tick');
    //return;    
}

simulated function KApplyForce(out Vector Force, out Vector Torque)
{
    local float torqueScale;
    local Vector worldUp, torqueAxis;

    super(Actor).KApplyForce(Force, Torque);
    // End:0x1F
    if(FlipTimeLeft <= float(0))
    {
        return;
    }
    worldUp = vect(0.0000000, 0.0000000, 1.0000000) >> Rotation;
    torqueAxis = Normal(FlipAxis Cross worldUp);
    torqueScale = Acos(worldUp Dot vect(0.0000000, 0.0000000, 1.0000000)) / 3.1415999;
    Torque = ((FlipScale * FlipTorque) * torqueScale) * torqueAxis;
    //return;    
}

simulated function Tick(float DeltaTime)
{
    super(Pawn).Tick(DeltaTime);
    // End:0x4B
    if(FlipTimeLeft > float(0))
    {
        KWake();
        FlipTimeLeft -= DeltaTime;
        // End:0x4B
        if((FlipTimeLeft <= float(0)) && !bDriving)
        {
            Disable('Tick');
        }
    }
    //return;    
}

simulated function Destroyed()
{
    // End:0x1F
    if(DestroyEffectClass != none)
    {
        Spawn(DestroyEffectClass,,, Location, Rotation);
    }
    super.Destroyed();
    //return;    
}

defaultproperties
{
    VehicleMass=1.0000000
    FlipTorque=300.0000000
    FlipTime=2.0000000
    bSpecialCalcView=true
    bAlwaysRelevant=false
    bNetInitialRotation=true
    Physics=13
    bCollideWorld=false
    bBlockKarma=true
    bEdShouldSnap=true
}