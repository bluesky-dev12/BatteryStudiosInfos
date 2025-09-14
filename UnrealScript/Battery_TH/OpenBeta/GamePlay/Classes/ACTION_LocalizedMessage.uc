class ACTION_LocalizedMessage extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Class<LocalMessage> MessageClass;
var(Action) int MessageNum;

function bool InitActionFor(ScriptedController C)
{
    C.BroadcastLocalizedMessage(MessageClass, MessageNum, none, none, none);
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ MessageClass.static.GetString(MessageNum);
    //return;    
}

defaultproperties
{
    MessageClass=Class'GamePlay_Decompressed.ActionMessage'
    ActionString="?? ???"
}