/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_DESTROYPAWN.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Action_DESTROYPAWN extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool InitActionFor(ScriptedController C)
{
    C.DestroyPawn();
    return true;
}

defaultproperties
{
    ActionString="pawn? ?????"
    bValidForTrigger=true
}