class Action_ENDSECTION extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function ProceedToNextAction(ScriptedController C)
{
    // End:0x44
    if(C.IterationCounter > 0)
    {
        C.ActionNum = C.IterationSectionStart;
        C.IterationCounter--;        
    }
    else
    {
        C.ActionNum += 1;
        C.IterationSectionStart = -1;
    }
    //return;    
}

function bool EndsSection()
{
    return true;
    //return;    
}

defaultproperties
{
    ActionString="??? ????"
}