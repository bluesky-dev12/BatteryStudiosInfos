/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_SubTitles.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_SubTitles extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var() Engine.SceneSubtitles.ESST_Mode SubTitleMode;

function bool InitActionFor(ScriptedController C)
{
    C.Level.GetLocalPlayerController().myHUD.SubTitles.ProcessEvent(SubTitleMode);
    return false;
}

function string GetActionString()
{
    return ActionString;
}

defaultproperties
{
    ActionString="?????"
}