/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_RUN.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Action_RUN extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool InitActionFor(ScriptedController C)
{
    C.Pawn.ShouldCrouch(false);
    C.Pawn.SetSprinting(false);
    return false;
}

defaultproperties
{
    ActionString="????"
    bValidForTrigger=true
}