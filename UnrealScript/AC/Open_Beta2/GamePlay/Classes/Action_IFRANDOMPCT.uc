class Action_IFRANDOMPCT extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) float Probability;

function ProceedToNextAction(ScriptedController C)
{
    C.ActionNum += 1;
    // End:0x28
    if(FRand() > Probability)
    {
        ProceedToSectionEnd(C);
    }
    //return;    
}

function bool StartsSection()
{
    return true;
    //return;    
}
