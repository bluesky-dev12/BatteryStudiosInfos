class KarmaParamsCollision extends Object
    native
    editinlinenew;

var const transient pointer KarmaData;
var const float KScale;
var const Vector KScale3D;
var Vector KAcceleration;
var() float KFriction;
var() float KRestitution;
var() float KImpactThreshold;
var const bool bContactingLevel;
var const Vector ContactRegionCenter;
var const Vector ContactRegionNormal;
var const float ContactRegionRadius;
var const float ContactRegionNormalForce;

// Export UKarmaParamsCollision::execCalcContactRegion(FFrame&, void* const)
native function CalcContactRegion();

defaultproperties
{
    KScale=1.0000000
    KScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    KImpactThreshold=1000000.0000000
}