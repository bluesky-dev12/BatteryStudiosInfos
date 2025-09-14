/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_CHANGESCRIPT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Action_CHANGESCRIPT extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name NextScriptTag;
var ScriptedSequence NextScript;

function ScriptedSequence GetScript(ScriptedSequence S)
{
    // End:0x83
    if(NextScript == none && NextScriptTag != 'None')
    {
        // End:0x3e
        foreach S.AllActors(class'ScriptedSequence', NextScript, NextScriptTag)
        {
            // End:0x3e
            break;                        
        }
        // End:0x83
        if(NextScript == none)
        {
            Warn("No Next script found for " $ string(self) $ " in " $ string(S));
            return S;
        }
    }
    return NextScript;
}

function bool InitActionFor(ScriptedController C)
{
    C.bBroken = true;
    return true;
}

defaultproperties
{
    ActionString="????? ?????"
    bValidForTrigger=true
}