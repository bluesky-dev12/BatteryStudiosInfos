class AnimNotify_Effect extends AnimNotify
    native
    editinlinenew
    collapsecategories
    hidecategories(Object);

var() Class<Actor> EffectClass;
var() name Bone;
var() Vector OffsetLocation;
var() Rotator OffsetRotation;
var() bool Attach;
var() name Tag;
var() float DrawScale;
var() Vector DrawScale3D;
var private transient Actor LastSpawnedEffect;

defaultproperties
{
    DrawScale=1.0000000
    DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
}