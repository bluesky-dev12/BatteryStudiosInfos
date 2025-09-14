class SVehicleWheel extends Object
    native;

enum EVehicleSteerType
{
    VST_Fixed,                      // 0
    VST_Steered,                    // 1
    VST_Inverted                    // 2
};

var() float Steer;
var() float DriveForce;
var() float LongFriction;
var() float LatFriction;
var() float LongSlip;
var() float LatSlip;
var() float ChassisTorque;
var() bool bPoweredWheel;
var() bool bHandbrakeWheel;
var() bool bTrackWheel;
var() bool bLeftTrack;
var() SVehicleWheel.EVehicleSteerType SteerType;
var() name BoneName;
var() Object.EAxis BoneRollAxis;
var() Object.EAxis BoneSteerAxis;
var() Vector BoneOffset;
var() float WheelRadius;
var() float Softness;
var() float PenScale;
var() float PenOffset;
var() float Restitution;
var() float Adhesion;
var() float WheelInertia;
var() float SuspensionTravel;
var() float SuspensionOffset;
var() float HandbrakeSlipFactor;
var() float HandbrakeFrictionFactor;
var() float SuspensionMaxRenderTravel;
var() name SupportBoneName;
var() Object.EAxis SupportBoneAxis;
var() InterpCurve LongFrictionFunc;
var() InterpCurve LatSlipFunc;
var Vector WheelPosition;
var float SupportPivotDistance;
var bool bWheelOnGround;
var float TireLoad;
var Vector WheelDir;
var Vector WheelAxle;
var float SpinVel;
var float TrackVel;
var float SlipAngle;
var float SlipVel;
var float SuspensionPosition;
var float CurrentRotation;
var const transient pointer KContact;

defaultproperties
{
    BoneSteerAxis=2
    WheelRadius=35.0000000
    Softness=0.0500000
    PenScale=1.0000000
    WheelInertia=1.0000000
    SuspensionTravel=50.0000000
    HandbrakeSlipFactor=1.0000000
    HandbrakeFrictionFactor=1.0000000
    SuspensionMaxRenderTravel=50.0000000
    SupportBoneAxis=1
}