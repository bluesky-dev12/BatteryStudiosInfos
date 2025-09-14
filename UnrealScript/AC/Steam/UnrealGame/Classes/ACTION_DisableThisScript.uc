/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ACTION_DisableThisScript.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_DisableThisScript extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool InitActionFor(ScriptedController C)
{
    // End:0x38
    if(UnrealScriptedSequence(C.SequenceScript) != none)
    {
        UnrealScriptedSequence(C.SequenceScript).bDisabled = true;
    }
    return false;
}

defaultproperties
{
    ActionString="? ????? ????"
}