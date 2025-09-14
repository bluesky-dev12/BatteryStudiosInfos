/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KCarWheelJoint.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *
 *******************************************************************************/
class KCarWheelJoint extends KConstraint
    native
    placeable;

var(KarmaConstraint) float KSteerAngle;
var(KarmaConstraint) float KProportionalGap;
var(KarmaConstraint) float KMaxSteerTorque;
var(KarmaConstraint) float KMaxSteerSpeed;
var(KarmaConstraint) bool bKSteeringLocked;
var(KarmaConstraint) float KMotorTorque;
var(KarmaConstraint) float KMaxSpeed;
var(KarmaConstraint) float KBraking;
var(KarmaConstraint) float KSuspLowLimit;
var(KarmaConstraint) float KSuspHighLimit;
var(KarmaConstraint) float KSuspStiffness;
var(KarmaConstraint) float KSuspDamping;
var(KarmaConstraint) float KSuspRef;
var const float KWheelHeight;

defaultproperties
{
    KProportionalGap=8200.0
    KMaxSteerTorque=1000.0
    KMaxSteerSpeed=2600.0
    bKSteeringLocked=true
    KMaxSpeed=1310700.0
    KSuspLowLimit=-1.0
    KSuspHighLimit=1.0
    KSuspStiffness=50.0
    KSuspDamping=5.0
    bNoDelete=true
}