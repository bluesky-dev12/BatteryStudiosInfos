class Action_CHANGESCRIPT extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name NextScriptTag;
var ScriptedSequence NextScript;

function ScriptedSequence GetScript(ScriptedSequence S)
{
    // End:0x83
    if((NextScript == none) && NextScriptTag != 'None')
    {
        // End:0x3E
        foreach S.AllActors(Class'GamePlay_Decompressed.ScriptedSequence', NextScript, NextScriptTag)
        {
            // End:0x3E
            break;            
        }        
        // End:0x83
        if(NextScript == none)
        {
            Warn((("No Next script found for " $ string(self)) $ " in ") $ string(S));
            return S;
        }
    }
    return NextScript;
    //return;    
}

function bool InitActionFor(ScriptedController C)
{
    C.bBroken = true;
    return true;
    //return;    
}

defaultproperties
{
    ActionString="????? ?????"
    bValidForTrigger=false
}