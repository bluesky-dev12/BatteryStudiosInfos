/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KarmaParams.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:26
 *
 *******************************************************************************/
class KarmaParams extends KarmaParamsCollision
    dependson(KarmaParamsCollision)
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
    KMass=1.0
    KLinearDamping=0.20
    KAngularDamping=0.20
    KActorGravScale=1.0
    KVelDropBelowThreshold=1000000.0
    KMaxSpeed=2500.0
    KMaxAngularSpeed=10.0
    bHighDetailOnly=true
    bClientOnly=true
    bDestroyOnSimError=true
    StayUprightStiffness=50.0
}