/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDomPointB.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wDomPointB extends wDomPoint
    hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
}

defaultproperties
{
    PointName="B"
    ControlEvent=wDOMMonitorB
    ObjectiveName="B ??"
}