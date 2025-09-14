/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_DISPLAYMESSAGE.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class Action_DISPLAYMESSAGE extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

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
    // End:0x75
    else
    {
        // End:0x75
        if(P != none)
        {
            P.ClientMessage(Message, MessageType);
        }
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ Message;
}

defaultproperties
{
    MessageType=CriticalEvent
    ActionString="???? ?????"
}