/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BaseGUIController.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:13
 *
 *******************************************************************************/
class BaseGUIController extends Interaction
    native
    transient;

var Material DefaultPens[3];
var string NetworkMsgMenu;
var string QuestionMenuClass;
var int Time;
var int LocalTime;
var float CumulatedElapsedTime;
var delegate<OnAdminReply> __OnAdminReply__Delegate;

delegate OnAdminReply(string Reply);
event bool OpenMenu(string NewMenuName, optional string Param1, optional string Param2)
{
    return false;
}

event AutoLoadMenus();
event bool ReplaceMenu(string NewMenuName, optional string Param1, optional string Param2, optional bool bCancelled)
{
    return false;
}

event bool CloseMenu(optional bool bCanceled)
{
    return true;
}

event CloseAll(bool bCancel, optional bool bForced);
event bool ClickCloseWndBtn();
function SetControllerStatus(bool On)
{
    bActive = On;
    bVisible = On;
    bRequiresTick = On;
}

event InitializeController();
event bool NeedsMenuResolution();
event SetRequiredGameResolution(string GameRes);
event bool NeedToOffIME()
{
    // End:0x3d
    if(ViewportOwner != none && ViewportOwner.Console != none)
    {
        return ViewportOwner.Console.NeedToOffIME();
    }
    // End:0x3f
    else
    {
        return false;
    }
}

function SetTime(int newTime)
{
    Time = newTime;
    CumulatedElapsedTime = 0.0;
}

defaultproperties
{
    DefaultPens[0]=Texture'MenuWhite'
    DefaultPens[1]=Texture'MenuBlack'
    DefaultPens[2]=Texture'MenuGray'
    bActive=true
    bNativeEvents=true
}