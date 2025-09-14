/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_CHANGELEVEL.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Action_CHANGELEVEL extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) string URL;
var(Action) bool bShowLoadingMessage;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2a
    if(bShowLoadingMessage)
    {
        C.Level.ServerTravel(URL, false);
    }
    // End:0x52
    else
    {
        C.Level.ServerTravel(URL $ "?quiet", false);
    }
    return true;
}

function string GetActionString()
{
    return ActionString;
}

defaultproperties
{
    ActionString="??? ?????"
}