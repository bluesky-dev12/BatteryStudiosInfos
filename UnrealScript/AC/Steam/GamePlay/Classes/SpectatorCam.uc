/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\SpectatorCam.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class SpectatorCam extends Keypoint;

var() bool bSkipView;
var() float FadeOutTime;

defaultproperties
{
    FadeOutTime=5.0
    bStasis=true
    Texture=Texture'Engine.S_Camera'
    bClientAnim=true
    CollisionRadius=20.0
    CollisionHeight=40.0
    bDirectional=true
}