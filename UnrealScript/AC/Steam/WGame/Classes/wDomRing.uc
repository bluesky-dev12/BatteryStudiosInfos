/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wDomRing.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class wDomRing extends Decoration;

var() Material RedTeamShader;
var() Material BlueTeamShader;
var() Material NeutralShader;

defaultproperties
{
    DrawType=8
    bStatic=true
    bStasis=true
    Physics=5
    DrawScale=0.250
    bNetNotify=true
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=-16000,Roll=48000)
}