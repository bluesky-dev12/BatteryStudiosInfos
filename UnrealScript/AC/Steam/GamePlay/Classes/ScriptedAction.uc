/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ScriptedAction.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:10
 *
 *******************************************************************************/
class ScriptedAction extends Object
    dependson(ScriptedSequence)
    hidecategories(Object)
    editinlinenew
    collapsecategories
    abstract;

var localized string ActionString;
var bool bValidForTrigger;

event ActionCompleted();
event PostBeginPlay(ScriptedSequence ss);
event Reset();
function bool InitActionFor(ScriptedController C)
{
    return false;
}

function bool EndsSection()
{
    return false;
}

function bool StartsSection()
{
    return false;
}

function ScriptedSequence GetScript(ScriptedSequence S)
{
    return S;
}

function ProceedToNextAction(ScriptedController C)
{
    C.ActionNum += 1;
}

function ProceedToSectionEnd(ScriptedController C)
{
    local int Nesting;
    local ScriptedAction A;

    // End:0xad [While If]
    if(C.ActionNum < C.SequenceScript.Actions.Length)
    {
        J0x00:
        A = C.SequenceScript.Actions[C.ActionNum];
        // End:0x73
        if(A.StartsSection())
        {
            ++ Nesting;
        }
        // End:0x99
        else
        {
            // End:0x99
            if(A.EndsSection())
            {
                -- Nesting;
                // End:0x99
                if(Nesting < 0)
                {
                    return;
                }
            }
        }
        C.ActionNum += 1;
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
}

function string GetActionString()
{
    return ActionString;
}

defaultproperties
{
    ActionString="??? ??"
    bValidForTrigger=true
}