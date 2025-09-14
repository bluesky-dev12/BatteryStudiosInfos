/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_SetPhysics.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_SetPhysics extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) Engine.Actor.EPhysics NewPhysicsMode;

function bool InitActionFor(ScriptedController C)
{
    C.GetInstigator().SetPhysics(NewPhysicsMode);
    return false;
}

function string GetActionString()
{
    return ActionString @ string(NewPhysicsMode);
}

defaultproperties
{
    ActionString="Physics? ???? ????? "
}