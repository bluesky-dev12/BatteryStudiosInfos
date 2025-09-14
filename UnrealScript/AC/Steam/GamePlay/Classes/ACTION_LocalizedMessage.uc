/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_LocalizedMessage.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_LocalizedMessage extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) class<LocalMessage> MessageClass;
var(Action) int MessageNum;

function bool InitActionFor(ScriptedController C)
{
    C.BroadcastLocalizedMessage(MessageClass, MessageNum, none, none, none);
    return false;
}

function string GetActionString()
{
    return ActionString @ MessageClass.static.GetString(MessageNum);
}

defaultproperties
{
    MessageClass=class'ActionMessage'
    ActionString="?? ???"
}