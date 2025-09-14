/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AnimNotify_Effect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *
 *******************************************************************************/
class AnimNotify_Effect extends AnimNotify
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

var() class<Actor> EffectClass;
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
    DrawScale=1.0
    DrawScale3D=(X=1.0,Y=1.0,Z=1.0)
}