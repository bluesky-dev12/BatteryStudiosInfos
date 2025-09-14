/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SpawnTrigger.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class SpawnTrigger extends Triggers;

var() class<Actor> SpawnClass;

event Trigger(Actor Other, Pawn EventInstigator)
{
    Spawn(SpawnClass,,, Location);
}

defaultproperties
{
    SpawnClass=Class'Engine.wC4Explosive'
}