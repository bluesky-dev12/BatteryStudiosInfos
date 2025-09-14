class ACTION_DisableThisScript extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    // End:0x38
    if(UnrealScriptedSequence(C.SequenceScript) != none)
    {
        UnrealScriptedSequence(C.SequenceScript).bDisabled = true;
    }
    return false;
    //return;    
}

defaultproperties
{
    ActionString="? ????? ????"
}