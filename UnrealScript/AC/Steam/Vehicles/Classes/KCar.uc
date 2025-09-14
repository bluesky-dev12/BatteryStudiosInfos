/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Vehicles\Classes\KCar.uc
 * Package Imports:
 *	Vehicles
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:54
 *	Functions:11
 *
 *******************************************************************************/
class KCar extends KVehicle
    abstract;

struct KCarState
{
    var KRBVec ChassisPosition;
    var Quat ChassisQuaternion;
    var KRBVec ChassisLinVel;
    var KRBVec ChassisAngVel;
    var float WheelHeight[4];
    var float FrontWheelAng[2];
    var float WheelVertVel[4];
    var float ServerSteering;
    var float ServerTorque;
    var bool ServerBrake;
    var bool ServerHandbrakeOn;
    var bool bNewState;
};

var KTire frontLeft;
var KTire frontRight;
var KTire rearLeft;
var KTire rearRight;
var() class<KTire> FrontTireClass;
var() class<KTire> RearTireClass;
var const float WheelFrontAlong;
var const float WheelFrontAcross;
var const float WheelRearAlong;
var const float WheelRearAcross;
var const float WheelVert;
var() float MaxSteerAngle;
var() float MaxBrakeTorque;
var() float TorqueSplit;
var() float SteerPropGap;
var() float SteerTorque;
var() float SteerSpeed;
var() float SuspStiffness;
var() float SuspDamping;
var() float SuspHighLimit;
var() float SuspLowLimit;
var() float SuspRef;
var() float TireRollFriction;
var() float TireLateralFriction;
var() float TireRollSlip;
var() float TireLateralSlip;
var() float TireMinSlip;
var() float TireSlipRate;
var() float TireSoftness;
var() float TireAdhesion;
var() float TireRestitution;
var() float TireMass;
var() float HandbrakeThresh;
var() float TireHandbrakeSlip;
var() float TireHandbrakeFriction;
var() float ChassisMass;
var() float StopThreshold;
var() InterpCurve TorqueCurve;
var() float FlipTorque;
var() float FlipTime;
var() float MaxNetUpdateInterval;
var int Gear;
var float WheelSpinSpeed;
var float ForwardVel;
var bool bIsInverted;
var bool IsDriving;
var float FlipTimeLeft;
var float NextNetUpdateTime;
var bool OutputBrake;
var float OutputTorque;
var bool OutputHandbrakeOn;
var KRigidBodyState ChassisState;
var KCarState CarState;
var bool bNewCarState;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        Gear, CarState;

    // Pos:0x0d
    reliable if(Role == 4)
        FlipTimeLeft;

}

simulated event VehicleStateReceived()
{
    local Vector ChassisY, SteerY, ChassisZ, calcPos, WheelY, lPos,
	    chassisPos, ChassisLinVel, ChassisAngVel, WheelLinVel, wPosRel;

    local Quat relQ, WheelQ;

    // End:0x12
    if(!CarState.bNewState)
    {
        return;
    }
    // End:0x46
    if(frontLeft == none || frontRight == none || rearLeft == none || rearRight == none)
    {
        return;
    }
    ChassisState.Position = CarState.ChassisPosition;
    ChassisState.Quaternion = CarState.ChassisQuaternion;
    ChassisState.LinVel = CarState.ChassisLinVel;
    ChassisState.AngVel = CarState.ChassisAngVel;
    chassisPos = KRBVecToVector(CarState.ChassisPosition);
    ChassisLinVel = KRBVecToVector(CarState.ChassisLinVel);
    ChassisAngVel = KRBVecToVector(CarState.ChassisAngVel);
    ChassisY = QuatRotateVector(CarState.ChassisQuaternion, vect(0.0, 1.0, 0.0));
    ChassisZ = QuatRotateVector(CarState.ChassisQuaternion, vect(0.0, 0.0, 1.0));
    ChassisState.Position = CarState.ChassisPosition;
    ChassisState.Quaternion = CarState.ChassisQuaternion;
    ChassisState.LinVel = CarState.ChassisLinVel;
    ChassisState.AngVel = CarState.ChassisAngVel;
    frontLeft.KGetRigidBodyState(frontLeft.ReceiveState);
    lPos.X = WheelFrontAlong;
    lPos.Y = WheelFrontAcross;
    lPos.Z = CarState.WheelHeight[0];
    calcPos = chassisPos + QuatRotateVector(CarState.ChassisQuaternion, lPos);
    frontLeft.ReceiveState.Position = KRBVecFromVector(calcPos);
    WheelQ = frontLeft.KGetRBQuaternion();
    WheelY = QuatRotateVector(WheelQ, vect(0.0, 1.0, 0.0));
    SteerY = QuatRotateVector(QuatFromAxisAndAngle(ChassisZ, CarState.FrontWheelAng[0]), ChassisY);
    relQ = QuatFindBetween(WheelY, SteerY);
    frontLeft.ReceiveState.Quaternion = QuatProduct(relQ, WheelQ);
    wPosRel = calcPos - chassisPos;
    WheelLinVel = ChassisLinVel + ChassisAngVel Cross wPosRel;
    WheelLinVel += CarState.WheelVertVel[0] * ChassisZ;
    frontLeft.ReceiveState.LinVel = KRBVecFromVector(WheelLinVel);
    frontLeft.bReceiveStateNew = true;
    frontRight.KGetRigidBodyState(frontRight.ReceiveState);
    lPos.X = WheelFrontAlong;
    lPos.Y = -WheelFrontAcross;
    lPos.Z = CarState.WheelHeight[1];
    calcPos = chassisPos + QuatRotateVector(CarState.ChassisQuaternion, lPos);
    frontRight.ReceiveState.Position = KRBVecFromVector(calcPos);
    WheelQ = frontRight.KGetRBQuaternion();
    WheelY = QuatRotateVector(WheelQ, vect(0.0, 1.0, 0.0));
    SteerY = QuatRotateVector(QuatFromAxisAndAngle(ChassisZ, CarState.FrontWheelAng[1]), ChassisY);
    relQ = QuatFindBetween(WheelY, SteerY);
    frontRight.ReceiveState.Quaternion = QuatProduct(relQ, WheelQ);
    wPosRel = calcPos - chassisPos;
    WheelLinVel = ChassisLinVel + ChassisAngVel Cross wPosRel;
    WheelLinVel += CarState.WheelVertVel[1] * ChassisZ;
    frontRight.ReceiveState.LinVel = KRBVecFromVector(WheelLinVel);
    frontRight.bReceiveStateNew = true;
    rearLeft.KGetRigidBodyState(rearLeft.ReceiveState);
    lPos.X = WheelRearAlong;
    lPos.Y = WheelFrontAcross;
    lPos.Z = CarState.WheelHeight[2];
    calcPos = chassisPos + QuatRotateVector(CarState.ChassisQuaternion, lPos);
    rearLeft.ReceiveState.Position = KRBVecFromVector(calcPos);
    WheelQ = rearLeft.KGetRBQuaternion();
    WheelY = QuatRotateVector(WheelQ, vect(0.0, 1.0, 0.0));
    relQ = QuatFindBetween(WheelY, ChassisY);
    rearLeft.ReceiveState.Quaternion = QuatProduct(relQ, WheelQ);
    wPosRel = calcPos - chassisPos;
    WheelLinVel = ChassisLinVel + ChassisAngVel Cross wPosRel;
    WheelLinVel += CarState.WheelVertVel[2] * ChassisZ;
    rearLeft.ReceiveState.LinVel = KRBVecFromVector(WheelLinVel);
    rearLeft.bReceiveStateNew = true;
    rearRight.KGetRigidBodyState(rearRight.ReceiveState);
    lPos.X = WheelRearAlong;
    lPos.Y = -WheelFrontAcross;
    lPos.Z = CarState.WheelHeight[3];
    calcPos = chassisPos + QuatRotateVector(CarState.ChassisQuaternion, lPos);
    rearRight.ReceiveState.Position = KRBVecFromVector(calcPos);
    WheelQ = rearRight.KGetRBQuaternion();
    WheelY = QuatRotateVector(WheelQ, vect(0.0, 1.0, 0.0));
    relQ = QuatFindBetween(WheelY, ChassisY);
    rearRight.ReceiveState.Quaternion = QuatProduct(relQ, WheelQ);
    wPosRel = calcPos - chassisPos;
    WheelLinVel = ChassisLinVel + ChassisAngVel Cross wPosRel;
    WheelLinVel += CarState.WheelVertVel[3] * ChassisZ;
    rearRight.ReceiveState.LinVel = KRBVecFromVector(WheelLinVel);
    rearRight.bReceiveStateNew = true;
    Steering = CarState.ServerSteering;
    OutputTorque = CarState.ServerTorque;
    OutputBrake = CarState.ServerBrake;
    OutputHandbrakeOn = CarState.ServerHandbrakeOn;
    CarState.bNewState = false;
    bNewCarState = true;
}

simulated event bool KUpdateState(out KRigidBodyState NewState)
{
    // End:0x1f
    if(Role == 4 || !bNewCarState)
    {
        return false;
    }
    NewState = ChassisState;
    bNewCarState = false;
    return true;
}

function PackState()
{
    local Vector lPos, wPos, chassisPos, ChassisLinVel, ChassisAngVel, wPosRel,
	    WheelLinVel, ChassisX, ChassisZ, WheelY, OldPos,
	    oldLinVel;

    local KRigidBodyState CurrentChassisState, WheelState;

    KGetRigidBodyState(CurrentChassisState);
    chassisPos = KRBVecToVector(CurrentChassisState.Position);
    ChassisLinVel = KRBVecToVector(CurrentChassisState.LinVel);
    ChassisAngVel = KRBVecToVector(CurrentChassisState.AngVel);
    OldPos = KRBVecToVector(CarState.ChassisPosition);
    oldLinVel = KRBVecToVector(CarState.ChassisLinVel);
    // End:0x86
    if(!KIsAwake())
    {
        return;
    }
    // End:0x12b
    if(VSize(OldPos - chassisPos) > float(5) || VSize(oldLinVel - ChassisLinVel) > float(1) || Abs(CarState.ServerTorque - OutputTorque) > 0.10 || Abs(CarState.ServerSteering - Steering) > 0.10 || Level.TimeSeconds > NextNetUpdateTime)
    {
        NextNetUpdateTime = Level.TimeSeconds + MaxNetUpdateInterval;
    }
    // End:0x12d
    else
    {
        return;
    }
    CarState.ChassisPosition = CurrentChassisState.Position;
    CarState.ChassisQuaternion = CurrentChassisState.Quaternion;
    CarState.ChassisLinVel = CurrentChassisState.LinVel;
    CarState.ChassisAngVel = CurrentChassisState.AngVel;
    ChassisX = QuatRotateVector(CarState.ChassisQuaternion, vect(1.0, 0.0, 0.0));
    ChassisZ = QuatRotateVector(CarState.ChassisQuaternion, vect(0.0, 0.0, 1.0));
    frontLeft.KGetRigidBodyState(WheelState);
    wPos = KRBVecToVector(WheelState.Position);
    lPos = QuatRotateVector(QuatInvert(CarState.ChassisQuaternion), wPos - chassisPos);
    CarState.WheelHeight[0] = lPos.Z;
    WheelY = QuatRotateVector(WheelState.Quaternion, vect(0.0, 1.0, 0.0));
    CarState.FrontWheelAng[0] = -Asin(ChassisX Dot WheelY);
    wPosRel = KRBVecToVector(WheelState.Position) - chassisPos;
    WheelLinVel = ChassisLinVel + ChassisAngVel Cross wPosRel;
    CarState.WheelVertVel[0] = WheelState.LinVel.X - WheelLinVel.X * ChassisZ.X + WheelState.LinVel.Y - WheelLinVel.Y * ChassisZ.Y + WheelState.LinVel.Z - WheelLinVel.Z * ChassisZ.Z;
    frontRight.KGetRigidBodyState(WheelState);
    wPos = KRBVecToVector(WheelState.Position);
    lPos = QuatRotateVector(QuatInvert(CarState.ChassisQuaternion), wPos - chassisPos);
    CarState.WheelHeight[1] = lPos.Z;
    WheelY = QuatRotateVector(WheelState.Quaternion, vect(0.0, 1.0, 0.0));
    CarState.FrontWheelAng[1] = -Asin(ChassisX Dot WheelY);
    CarState.WheelVertVel[1] = WheelState.LinVel.X - WheelLinVel.X * ChassisZ.X + WheelState.LinVel.Y - WheelLinVel.Y * ChassisZ.Y + WheelState.LinVel.Z - WheelLinVel.Z * ChassisZ.Z;
    rearLeft.KGetRigidBodyState(WheelState);
    wPos = KRBVecToVector(WheelState.Position);
    lPos = QuatRotateVector(QuatInvert(CarState.ChassisQuaternion), wPos - chassisPos);
    CarState.WheelHeight[2] = lPos.Z;
    wPosRel = KRBVecToVector(WheelState.Position) - chassisPos;
    WheelLinVel = ChassisLinVel + ChassisAngVel Cross wPosRel;
    CarState.WheelVertVel[2] = WheelState.LinVel.X - WheelLinVel.X * ChassisZ.X + WheelState.LinVel.Y - WheelLinVel.Y * ChassisZ.Y + WheelState.LinVel.Z - WheelLinVel.Z * ChassisZ.Z;
    WheelY = QuatRotateVector(WheelState.Quaternion, vect(0.0, 1.0, 0.0));
    rearRight.KGetRigidBodyState(WheelState);
    wPos = KRBVecToVector(WheelState.Position);
    lPos = QuatRotateVector(QuatInvert(CarState.ChassisQuaternion), wPos - chassisPos);
    CarState.WheelHeight[3] = lPos.Z;
    wPosRel = KRBVecToVector(WheelState.Position) - chassisPos;
    WheelLinVel = ChassisLinVel + ChassisAngVel Cross wPosRel;
    CarState.WheelVertVel[3] = WheelState.LinVel.X - WheelLinVel.X * ChassisZ.X + WheelState.LinVel.Y - WheelLinVel.Y * ChassisZ.Y + WheelState.LinVel.Z - WheelLinVel.Z * ChassisZ.Z;
    WheelY = QuatRotateVector(WheelState.Quaternion, vect(0.0, 1.0, 0.0));
    CarState.ServerSteering = Steering;
    CarState.ServerTorque = OutputTorque;
    CarState.ServerBrake = OutputBrake;
    CarState.ServerHandbrakeOn = OutputHandbrakeOn;
    CarState.bNewState = true;
}

simulated function PostNetBeginPlay()
{
    local Vector RotX, RotY, RotZ, lPos;

    super(Pawn).PostNetBeginPlay();
    GetAxes(Rotation, RotX, RotY, RotZ);
    frontLeft = Spawn(FrontTireClass, self,, Location + WheelFrontAlong * RotX + WheelFrontAcross * RotY + WheelVert * RotZ, Rotation);
    frontLeft.SetDrawScale3D(vect(1.0, 1.0, 1.0));
    frontRight = Spawn(FrontTireClass, self,, Location + WheelFrontAlong * RotX - WheelFrontAcross * RotY + WheelVert * RotZ, Rotation);
    frontRight.SetDrawScale3D(vect(1.0, -1.0, 1.0));
    rearLeft = Spawn(RearTireClass, self,, Location + WheelRearAlong * RotX + WheelRearAcross * RotY + WheelVert * RotZ, Rotation);
    rearLeft.SetDrawScale3D(vect(1.0, 1.0, 1.0));
    rearRight = Spawn(RearTireClass, self,, Location + WheelRearAlong * RotX - WheelRearAcross * RotY + WheelVert * RotZ, Rotation);
    rearRight.SetDrawScale3D(vect(1.0, -1.0, 1.0));
    lPos.X = WheelFrontAlong;
    lPos.Y = WheelFrontAcross;
    lPos.Z = WheelVert;
    frontLeft.WheelJoint = Spawn(class'KCarWheelJoint', self);
    frontLeft.WheelJoint.KPos1 = lPos / float(50);
    frontLeft.WheelJoint.KPriAxis1 = vect(0.0, 0.0, 1.0);
    frontLeft.WheelJoint.KSecAxis1 = vect(0.0, 1.0, 0.0);
    frontLeft.WheelJoint.KConstraintActor1 = self;
    frontLeft.WheelJoint.KPos2 = vect(0.0, 0.0, 0.0);
    frontLeft.WheelJoint.KPriAxis2 = vect(0.0, 0.0, 1.0);
    frontLeft.WheelJoint.KSecAxis2 = vect(0.0, 1.0, 0.0);
    frontLeft.WheelJoint.KConstraintActor2 = frontLeft;
    frontLeft.WheelJoint.SetPhysics(13);
    lPos.Y = -WheelFrontAcross;
    frontRight.WheelJoint = Spawn(class'KCarWheelJoint', self);
    frontRight.WheelJoint.KPos1 = lPos / float(50);
    frontRight.WheelJoint.KPriAxis1 = vect(0.0, 0.0, 1.0);
    frontRight.WheelJoint.KSecAxis1 = vect(0.0, 1.0, 0.0);
    frontRight.WheelJoint.KConstraintActor1 = self;
    frontRight.WheelJoint.KPos2 = vect(0.0, 0.0, 0.0);
    frontRight.WheelJoint.KPriAxis2 = vect(0.0, 0.0, 1.0);
    frontRight.WheelJoint.KSecAxis2 = vect(0.0, 1.0, 0.0);
    frontRight.WheelJoint.KConstraintActor2 = frontRight;
    frontRight.WheelJoint.SetPhysics(13);
    lPos.X = WheelRearAlong;
    lPos.Y = WheelRearAcross;
    rearLeft.WheelJoint = Spawn(class'KCarWheelJoint', self);
    rearLeft.WheelJoint.KPos1 = lPos / float(50);
    rearLeft.WheelJoint.KPriAxis1 = vect(0.0, 0.0, 1.0);
    rearLeft.WheelJoint.KSecAxis1 = vect(0.0, 1.0, 0.0);
    rearLeft.WheelJoint.KConstraintActor1 = self;
    rearLeft.WheelJoint.KPos2 = vect(0.0, 0.0, 0.0);
    rearLeft.WheelJoint.KPriAxis2 = vect(0.0, 0.0, 1.0);
    rearLeft.WheelJoint.KSecAxis2 = vect(0.0, 1.0, 0.0);
    rearLeft.WheelJoint.KConstraintActor2 = rearLeft;
    rearLeft.WheelJoint.SetPhysics(13);
    lPos.Y = -WheelRearAcross;
    rearRight.WheelJoint = Spawn(class'KCarWheelJoint', self);
    rearRight.WheelJoint.KPos1 = lPos / float(50);
    rearRight.WheelJoint.KPriAxis1 = vect(0.0, 0.0, 1.0);
    rearRight.WheelJoint.KSecAxis1 = vect(0.0, 1.0, 0.0);
    rearRight.WheelJoint.KConstraintActor1 = self;
    rearRight.WheelJoint.KPos2 = vect(0.0, 0.0, 0.0);
    rearRight.WheelJoint.KPriAxis2 = vect(0.0, 0.0, 1.0);
    rearRight.WheelJoint.KSecAxis2 = vect(0.0, 1.0, 0.0);
    rearRight.WheelJoint.KConstraintActor2 = rearRight;
    rearRight.WheelJoint.SetPhysics(13);
    KVehicleUpdateParams();
}

simulated event Destroyed()
{
    frontLeft.WheelJoint.Destroy();
    frontRight.WheelJoint.Destroy();
    rearLeft.WheelJoint.Destroy();
    rearRight.WheelJoint.Destroy();
    frontLeft.Destroy();
    frontRight.Destroy();
    rearLeft.Destroy();
    rearRight.Destroy();
    super.Destroyed();
}

simulated event KVehicleUpdateParams()
{
    super.KVehicleUpdateParams();
    rearLeft.WheelJoint.bKSteeringLocked = true;
    rearRight.WheelJoint.bKSteeringLocked = true;
    frontLeft.WheelJoint.bKSteeringLocked = false;
    frontLeft.WheelJoint.KProportionalGap = SteerPropGap;
    frontLeft.WheelJoint.KMaxSteerTorque = SteerTorque;
    frontLeft.WheelJoint.KMaxSteerSpeed = SteerSpeed;
    frontRight.WheelJoint.bKSteeringLocked = false;
    frontRight.WheelJoint.KProportionalGap = SteerPropGap;
    frontRight.WheelJoint.KMaxSteerTorque = SteerTorque;
    frontRight.WheelJoint.KMaxSteerSpeed = SteerSpeed;
    frontLeft.WheelJoint.KSuspHighLimit = SuspHighLimit;
    frontLeft.WheelJoint.KSuspLowLimit = SuspLowLimit;
    frontLeft.WheelJoint.KSuspStiffness = SuspStiffness;
    frontLeft.WheelJoint.KSuspDamping = SuspDamping;
    frontRight.WheelJoint.KSuspHighLimit = SuspHighLimit;
    frontRight.WheelJoint.KSuspLowLimit = SuspLowLimit;
    frontRight.WheelJoint.KSuspStiffness = SuspStiffness;
    frontRight.WheelJoint.KSuspDamping = SuspDamping;
    rearLeft.WheelJoint.KSuspHighLimit = SuspHighLimit;
    rearLeft.WheelJoint.KSuspLowLimit = SuspLowLimit;
    rearLeft.WheelJoint.KSuspStiffness = SuspStiffness;
    rearLeft.WheelJoint.KSuspDamping = SuspDamping;
    rearRight.WheelJoint.KSuspHighLimit = SuspHighLimit;
    rearRight.WheelJoint.KSuspLowLimit = SuspLowLimit;
    rearRight.WheelJoint.KSuspStiffness = SuspStiffness;
    rearRight.WheelJoint.KSuspDamping = SuspDamping;
    frontLeft.WheelJoint.KUpdateConstraintParams();
    frontRight.WheelJoint.KUpdateConstraintParams();
    rearLeft.WheelJoint.KUpdateConstraintParams();
    rearRight.WheelJoint.KUpdateConstraintParams();
    KSetMass(ChassisMass);
    frontLeft.KSetMass(TireMass);
    frontRight.KSetMass(TireMass);
    rearLeft.KSetMass(TireMass);
    rearRight.KSetMass(TireMass);
    frontLeft.RollFriction = TireRollFriction;
    frontLeft.LateralFriction = TireLateralFriction;
    frontLeft.RollSlip = TireRollSlip;
    frontLeft.LateralSlip = TireLateralSlip;
    frontLeft.MinSlip = TireMinSlip;
    frontLeft.SlipRate = TireSlipRate;
    frontLeft.Softness = TireSoftness;
    frontLeft.Adhesion = TireAdhesion;
    frontLeft.Restitution = TireRestitution;
    frontRight.RollFriction = TireRollFriction;
    frontRight.LateralFriction = TireLateralFriction;
    frontRight.RollSlip = TireRollSlip;
    frontRight.LateralSlip = TireLateralSlip;
    frontRight.MinSlip = TireMinSlip;
    frontRight.SlipRate = TireSlipRate;
    frontRight.Softness = TireSoftness;
    frontRight.Adhesion = TireAdhesion;
    frontRight.Restitution = TireRestitution;
    rearLeft.RollFriction = TireRollFriction;
    rearLeft.LateralFriction = TireLateralFriction;
    rearLeft.RollSlip = TireRollSlip;
    rearLeft.LateralSlip = TireLateralSlip;
    rearLeft.MinSlip = TireMinSlip;
    rearLeft.SlipRate = TireSlipRate;
    rearLeft.Softness = TireSoftness;
    rearLeft.Adhesion = TireAdhesion;
    rearLeft.Restitution = TireRestitution;
    rearRight.RollFriction = TireRollFriction;
    rearRight.LateralFriction = TireLateralFriction;
    rearRight.RollSlip = TireRollSlip;
    rearRight.LateralSlip = TireLateralSlip;
    rearRight.MinSlip = TireMinSlip;
    rearRight.SlipRate = TireSlipRate;
    rearRight.Softness = TireSoftness;
    rearRight.Adhesion = TireAdhesion;
    rearRight.Restitution = TireRestitution;
}

simulated event KApplyForce(out Vector Force, out Vector Torque)
{
    local float torqueScale;
    local Vector worldForward, worldUp, worldRight, torqueAxis;

    // End:0x0f
    if(FlipTimeLeft == float(0))
    {
        return;
    }
    worldForward = vect(-1.0, 0.0, 0.0) >> Rotation;
    worldUp = vect(0.0, 0.0, 1.0) >> Rotation;
    worldRight = vect(0.0, 1.0, 0.0) >> Rotation;
    torqueAxis = Normal(worldUp Cross vect(0.0, 0.0, 1.0));
    torqueScale = Acos(worldUp Dot vect(0.0, 0.0, 1.0)) / 3.14160;
    Torque = FlipTorque * torqueScale * torqueAxis;
}

function StartFlip(Pawn Pusher)
{
    // End:0x0f
    if(FlipTimeLeft > float(0))
    {
        return;
    }
    FlipTimeLeft = FlipTime;
}

function float Engine(float Throttle)
{
    local float Torque;

    Torque = Abs(Throttle) * float(Gear) * InterpCurveEval(TorqueCurve, WheelSpinSpeed);
    GraphData("SpinSpeed", WheelSpinSpeed);
    GraphData("Torque", Torque);
    return -1.0 * Torque;
}

function ProcessCarInput()
{
    local Vector worldForward, worldUp;

    worldForward = vect(-1.0, 0.0, 0.0) >> Rotation;
    worldUp = vect(0.0, 0.0, 1.0) >> Rotation;
    ForwardVel = Velocity Dot worldForward;
    bIsInverted = worldUp.Z < 0.20;
    // End:0x7b
    if(bIsInverted)
    {
        ForwardVel = 2.0 * StopThreshold;
    }
    // End:0xd2
    if(Driver == none)
    {
        // End:0xc0
        if(bAutoDrive == true)
        {
            Gear = 1;
            OutputBrake = false;
            Throttle = 0.40;
            Steering = 1.0;
            KWake();
        }
        // End:0xcf
        else
        {
            Gear = 0;
            OutputBrake = true;
        }
    }
    // End:0x1e7
    else
    {
        // End:0x133
        if(Throttle > 0.010)
        {
            // End:0x119
            if(ForwardVel < -StopThreshold && Gear != 1)
            {
                Gear = 0;
                OutputBrake = true;
                IsDriving = false;
            }
            // End:0x130
            else
            {
                Gear = 1;
                OutputBrake = false;
                IsDriving = true;
            }
        }
        // End:0x1e1
        else
        {
            // End:0x197
            if(Throttle < -0.010)
            {
                // End:0x17d
                if(ForwardVel < StopThreshold && IsDriving == false)
                {
                    Gear = -1;
                    OutputBrake = false;
                    IsDriving = false;
                }
                // End:0x194
                else
                {
                    Gear = 0;
                    OutputBrake = true;
                    IsDriving = true;
                }
            }
            // End:0x1e1
            else
            {
                // End:0x1ca
                if(Abs(ForwardVel) < StopThreshold)
                {
                    Gear = 0;
                    OutputBrake = true;
                    IsDriving = false;
                    OutputHandbrakeOn = false;
                }
                // End:0x1e1
                else
                {
                    Gear = 0;
                    OutputBrake = false;
                    IsDriving = false;
                }
            }
        }
        KWake();
    }
    // End:0x230
    if(ForwardVel > HandbrakeThresh || OutputHandbrakeOn == true && Abs(Steering) > 0.010 && OutputBrake == true)
    {
        OutputHandbrakeOn = true;
    }
    // End:0x238
    else
    {
        OutputHandbrakeOn = false;
    }
    OutputTorque = Engine(Throttle);
}

simulated function Tick(float Delta)
{
    local float tana, sFactor;

    super.Tick(Delta);
    WheelSpinSpeed = rearLeft.SpinSpeed + rearRight.SpinSpeed / float(2);
    // End:0x48
    if(FlipTimeLeft > float(0))
    {
        KWake();
    }
    // End:0x64
    if(Role == 4)
    {
        ProcessCarInput();
        PackState();
    }
    frontLeft.WheelJoint.KMotorTorque = 0.50 * OutputTorque * float(1) - TorqueSplit;
    frontRight.WheelJoint.KMotorTorque = 0.50 * OutputTorque * float(1) - TorqueSplit;
    rearLeft.WheelJoint.KMotorTorque = 0.50 * OutputTorque * TorqueSplit;
    rearRight.WheelJoint.KMotorTorque = 0.50 * OutputTorque * TorqueSplit;
    // End:0x19a
    if(OutputBrake)
    {
        frontLeft.WheelJoint.KBraking = MaxBrakeTorque;
        frontRight.WheelJoint.KBraking = MaxBrakeTorque;
        rearLeft.WheelJoint.KBraking = MaxBrakeTorque;
        rearRight.WheelJoint.KBraking = MaxBrakeTorque;
    }
    // End:0x20e
    else
    {
        frontLeft.WheelJoint.KBraking = 0.0;
        frontRight.WheelJoint.KBraking = 0.0;
        rearLeft.WheelJoint.KBraking = 0.0;
        rearRight.WheelJoint.KBraking = 0.0;
    }
    tana = Tan(6.2830 / float(65536) * Steering * MaxSteerAngle);
    sFactor = 0.50 * tana * float(2) * WheelFrontAcross / Abs(WheelFrontAlong - WheelRearAlong);
    frontLeft.WheelJoint.KSteerAngle = 65536.0 / 6.2830 * Atan(tana, 1.0 - sFactor);
    frontRight.WheelJoint.KSteerAngle = 65536.0 / 6.2830 * Atan(tana, 1.0 + sFactor);
    // End:0x34e
    if(OutputHandbrakeOn == true)
    {
        rearLeft.LateralFriction = TireLateralFriction + TireHandbrakeFriction;
        rearLeft.LateralSlip = TireLateralSlip + TireHandbrakeSlip;
        rearRight.LateralFriction = TireLateralFriction + TireHandbrakeFriction;
        rearRight.LateralSlip = TireLateralSlip + TireHandbrakeSlip;
    }
    // End:0x39e
    else
    {
        rearLeft.LateralFriction = TireLateralFriction;
        rearLeft.LateralSlip = TireLateralSlip;
        rearRight.LateralFriction = TireLateralFriction;
        rearRight.LateralSlip = TireLateralSlip;
    }
    // End:0x3c9
    if(FlipTimeLeft > float(0))
    {
        FlipTimeLeft -= Delta;
        FlipTimeLeft = FMax(FlipTimeLeft, 0.0);
    }
}

defaultproperties
{
    WheelFrontAlong=-180.0
    WheelFrontAcross=140.0
    WheelRearAlong=160.0
    WheelRearAcross=140.0
    WheelVert=-0.50
    MaxSteerAngle=3900.0
    MaxBrakeTorque=50.0
    TorqueSplit=0.50
    SteerPropGap=1000.0
    SteerTorque=1000.0
    SteerSpeed=15000.0
    SuspStiffness=50.0
    SuspDamping=5.0
    SuspHighLimit=1.0
    SuspLowLimit=-1.0
    TireRollFriction=1.0
    TireLateralFriction=1.0
    TireRollSlip=0.0850
    TireLateralSlip=0.060
    TireMinSlip=0.0010
    TireSlipRate=0.00050
    TireSoftness=0.00020
    TireMass=0.50
    HandbrakeThresh=1000.0
    TireHandbrakeSlip=0.060
    TireHandbrakeFriction=-0.50
    ChassisMass=4.0
    StopThreshold=100.0
    TorqueCurve=(Points=// Object reference not set to an instance of an object.
    ,InVal=0.0,OutVal=150.0)
    FlipTorque=350.0
    FlipTime=3.0
    MaxNetUpdateInterval=0.40
    Gear=1
}