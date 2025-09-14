/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Vignette.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Vignette extends Actor
    native
    transient
    abstract
    notplaceable;

var() string MapName;
var() class<GameInfo> GameClass;

simulated event Init();
simulated event DrawVignette(Canvas C, float Progress);

defaultproperties
{
    DrawType=0
    bNetTemporary=true
    RemoteRole=0
    bUnlit=true
    bGameRelevant=true
    CollisionRadius=0.0
    CollisionHeight=0.0
}