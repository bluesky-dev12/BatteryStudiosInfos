class KarmaParams extends KarmaParamsCollision
    native
    editinlinenew;

var const transient pointer KAng3;
var const transient pointer KTriList;
var const transient float KLastVel;
var() float KMass;
var() float KLinearDamping;
var() float KAngularDamping;
var() float KBuoyancy;
var() bool KStartEnabled;
var() Vector KStartLinVel;
var() Vector KStartAngVel;
var() bool bKNonSphericalInertia;
var() float KActorGravScale;
var() float KVelDropBelowThreshold;
var() float KMaxSpeed;
var() float KMaxAngularSpeed;
var() bool bHighDetailOnly;
var bool bClientOnly;
var() const bool bKDoubleTickRate;
var() bool bKStayUpright;
var() bool bKAllowRotate;
var bool bDestroyOnSimError;
var() bool bDestroyOnWorldPenetrate;
var() bool bDoSafetime;
var() float StayUprightStiffness;
var() float StayUprightDamping;
var() array<KRepulsor> Repulsors;

defaultproperties
{
    KMass=1.0000000
    KLinearDamping=0.2000000
    KAngularDamping=0.2000000
    KActorGravScale=1.0000000
    KVelDropBelowThreshold=1000000.0000000
    KMaxSpeed=2500.0000000
    KMaxAngularSpeed=10.0000000
    bHighDetailOnly=true
    bClientOnly=true
    bDestroyOnSimError=true
    StayUprightStiffness=50.0000000
}