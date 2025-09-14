class Action_CHANGELEVEL extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) string URL;
var(Action) bool bShowLoadingMessage;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2A
    if(bShowLoadingMessage)
    {
        C.Level.ServerTravel(URL, false);        
    }
    else
    {
        C.Level.ServerTravel(URL $ "?quiet", false);
    }
    return true;
    //return;    
}

function string GetActionString()
{
    return ActionString;
    //return;    
}

defaultproperties
{
    ActionString="??? ?????"
}