class ACTION_SubTitles extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var() SceneSubtitles.ESST_Mode SubTitleMode;

function bool InitActionFor(ScriptedController C)
{
    C.Level.GetLocalPlayerController().myHUD.SubTitles.ProcessEvent(SubTitleMode);
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString;
    //return;    
}

defaultproperties
{
    ActionString="?????"
}