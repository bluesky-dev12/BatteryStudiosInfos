class KConstraint extends KActor
    abstract
    native
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
native final function KGetConstraintForce(out Vector Force)
{
    //native.Force;        
}

// Export UKConstraint::execKGetConstraintTorque(FFrame&, void* const)
native final function KGetConstraintTorque(out Vector Torque)
{
    //native.Torque;        
}

event KForceExceed(float forceMag)
{
    //return;    
}

defaultproperties
{
    bKDisableCollision=true
    KPriAxis1=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    KSecAxis1=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    KPriAxis2=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    KSecAxis2=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    DrawType=1
    bHidden=true
    Texture=Texture'Engine_Decompressed.S_KConstraint'
    bCollideActors=false
    bBlockActors=false
    bProjTarget=false
    bBlockKarma=false
}