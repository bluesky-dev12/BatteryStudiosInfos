/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\KConstraint.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:4
 *
 *******************************************************************************/
class KConstraint extends KActor
    dependson(KActor)
    native
    abstract
    placeable;

var const transient pointer KConstraintData;
var(KarmaConstraint) edfindable Actor KConstraintActor1;
var(KarmaConstraint) edfindable Actor KConstraintActor2;
var(KarmaConstraint) name KConstraintBone1;
var(KarmaConstraint) name KConstraintBone2;
var(KarmaConstraint) const bool bKDisableCollision;
var Vector KPos1;
var Vector KPriAxis1;
var Vector KSecAxis1;
var Vector KPos2;
var Vector KPriAxis2;
var Vector KSecAxis2;
var const bool bKForceFrameUpdate;
var(KarmaConstraint) float KForceThreshold;

// Export UKConstraint::execKUpdateConstraintParams(FFrame&, void* const)
native function KUpdateConstraintParams();
// Export UKConstraint::execKGetConstraintForce(FFrame&, void* const)
native final function KGetConstraintForce(out Vector Force);
// Export UKConstraint::execKGetConstraintTorque(FFrame&, void* const)
native final function KGetConstraintTorque(out Vector Torque);
event KForceExceed(float forceMag);

defaultproperties
{
    bKDisableCollision=true
    KPriAxis1=(X=1.0,Y=0.0,Z=0.0)
    KSecAxis1=(X=0.0,Y=1.0,Z=0.0)
    KPriAxis2=(X=1.0,Y=0.0,Z=0.0)
    KSecAxis2=(X=0.0,Y=1.0,Z=0.0)
    DrawType=1
    bHidden=true
    Texture=Texture'S_KConstraint'
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
}