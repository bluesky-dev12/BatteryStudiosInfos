/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_WaitForLIPSincAnimEnd.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_WaitForLIPSincAnimEnd extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool CompleteOnLIPSincAnim()
{
    return true;
}

defaultproperties
{
    ActionString="Wait for LIPSincAnimEnd"
    bValidForTrigger=true
}