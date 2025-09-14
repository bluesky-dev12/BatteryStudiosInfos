/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_ENDSECTION.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class Action_ENDSECTION extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function ProceedToNextAction(ScriptedController C)
{
    // End:0x44
    if(C.IterationCounter > 0)
    {
        C.ActionNum = C.IterationSectionStart;
        -- C.IterationCounter;
    }
    // End:0x69
    else
    {
        C.ActionNum += 1;
        C.IterationSectionStart = -1;
    }
}

function bool EndsSection()
{
    return true;
}

defaultproperties
{
    ActionString="??? ????"
}