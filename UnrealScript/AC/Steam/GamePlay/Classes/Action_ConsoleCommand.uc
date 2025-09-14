/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_ConsoleCommand.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Action_ConsoleCommand extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) string CommandStr;

function bool InitActionFor(ScriptedController C)
{
    // End:0x21
    if(CommandStr != "")
    {
        C.ConsoleCommand(CommandStr);
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ CommandStr;
}

defaultproperties
{
    ActionString="??? ??? ?????"
}