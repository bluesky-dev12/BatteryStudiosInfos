class Action_ConsoleCommand extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) string CommandStr;

function bool InitActionFor(ScriptedController C)
{
    // End:0x21
    if(CommandStr != "")
    {
        C.ConsoleCommand(CommandStr);
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ CommandStr;
    //return;    
}

defaultproperties
{
    ActionString="??? ??? ?????"
}