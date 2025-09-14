/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\AttractCamera.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class AttractCamera extends Keypoint;

var() float ViewAngle;
var() float MinZoomDist;
var() float MaxZoomDist;

defaultproperties
{
    ViewAngle=100.0
    MinZoomDist=600.0
    MaxZoomDist=1200.0
    bStasis=true
}