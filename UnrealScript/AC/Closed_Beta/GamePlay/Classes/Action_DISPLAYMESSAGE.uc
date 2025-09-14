class Action_DISPLAYMESSAGE extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) localized string Message;
var(Action) bool bBroadcast;
var(Action) name MessageType;

function bool InitActionFor(ScriptedController C)
{
    local Pawn P;

    P = C.GetInstigator();
    // End:0x51
    if(bBroadcast)
    {
        C.Level.Game.Broadcast(P, Message, MessageType);        
    }
    else
    {
        // End:0x75
        if(P != none)
        {
            P.ClientMessage(Message, MessageType);
        }
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ Message;
    //return;    
}

defaultproperties
{
    MessageType="CriticalEvent"
    ActionString="???? ?????"
}