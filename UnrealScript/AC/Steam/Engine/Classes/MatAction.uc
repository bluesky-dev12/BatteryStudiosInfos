/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MatAction.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *
 *******************************************************************************/
class MatAction extends MatObject
    dependson(MatObject)
    native
    abstract;

var() InterpolationPoint IntPoint;
var() string Comment;
var(Time) float Duration;
var(Sub) export editinline array<export editinline MatSubAction> SubActions;
var(Path) bool bSmoothCorner;
var(Path) Vector StartControlPoint;
var(Path) Vector EndControlPoint;
var(Path) bool bConstantPathVelocity;
var(Path) float PathVelocity;
var float PathLength;
var transient array<Vector> SampleLocations;
var transient float PctStarting;
var transient float PctEnding;
var transient float PctDuration;

defaultproperties
{
    bSmoothCorner=true
    StartControlPoint=(X=800.0,Y=800.0,Z=0.0)
    EndControlPoint=(X=-800.0,Y=-800.0,Z=0.0)
}