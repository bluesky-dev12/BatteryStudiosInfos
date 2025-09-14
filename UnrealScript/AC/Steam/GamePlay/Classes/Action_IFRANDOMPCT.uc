/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_IFRANDOMPCT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Action_IFRANDOMPCT extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) float Probability;

function ProceedToNextAction(ScriptedController C)
{
    C.ActionNum += 1;
    // End:0x28
    if(FRand() > Probability)
    {
        ProceedToSectionEnd(C);
    }
}

function bool StartsSection()
{
    return true;
}
