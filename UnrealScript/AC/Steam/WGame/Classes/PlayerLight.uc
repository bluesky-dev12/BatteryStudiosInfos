/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\PlayerLight.uc
 * Package Imports:
 *	WGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class PlayerLight extends ScaledSprite;

var() float ExtinguishTime;

singular function BaseChange();

defaultproperties
{
    ExtinguishTime=1.50
    bStatic=true
    bStasis=true
    RemoteRole=0
    DrawScale=0.150
    Style=6
    bShouldBaseAtStartup=true
    bHardAttach=true
    Mass=0.0
}