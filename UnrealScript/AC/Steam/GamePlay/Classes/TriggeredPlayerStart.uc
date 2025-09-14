/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\TriggeredPlayerStart.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class TriggeredPlayerStart extends PlayerStart
    hidecategories(Lighting,LightColor,Karma,Force);

function Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = !bEnabled;
}

defaultproperties
{
    bStatic=true
}