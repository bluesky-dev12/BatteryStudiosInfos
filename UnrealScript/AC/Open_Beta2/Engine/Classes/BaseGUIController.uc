class BaseGUIController extends Interaction
    transient
    native;

var Material DefaultPens[3];
var string NetworkMsgMenu;
var string QuestionMenuClass;
var int Time;
var int LocalTime;
var float CumulatedElapsedTime;
//var delegate<OnAdminReply> __OnAdminReply__Delegate;

delegate OnAdminReply(string Reply)
{
    //return;    
}

event bool OpenMenu(string NewMenuName, optional string Param1, optional string Param2)
{
    return false;
    //return;    
}

event AutoLoadMenus()
{
    //return;    
}

event bool ReplaceMenu(string NewMenuName, optional string Param1, optional string Param2, optional bool bCancelled)
{
    return false;
    //return;    
}

event bool CloseMenu(optional bool bCanceled)
{
    return true;
    //return;    
}

event CloseAll(bool bCancel, optional bool bForced)
{
    //return;    
}

event bool ClickCloseWndBtn()
{
    //return;    
}

function SetControllerStatus(bool On)
{
    bActive = On;
    bVisible = On;
    bRequiresTick = On;
    //return;    
}

event InitializeController()
{
    //return;    
}

event bool NeedsMenuResolution()
{
    //return;    
}

event SetRequiredGameResolution(string GameRes)
{
    //return;    
}

event bool NeedToOffIME()
{
    // End:0x3D
    if((ViewportOwner != none) && ViewportOwner.Console != none)
    {
        return ViewportOwner.Console.NeedToOffIME();        
    }
    else
    {
        return false;
    }
    //return;    
}

function SetTime(int newTime)
{
    Time = newTime;
    CumulatedElapsedTime = 0.0000000;
    //return;    
}

defaultproperties
{
    DefaultPens[0]=Texture'Engine_Decompressed.MenuWhite'
    DefaultPens[1]=Texture'Engine_Decompressed.MenuBlack'
    DefaultPens[2]=Texture'Engine_Decompressed.MenuGray'
    bActive=false
    bNativeEvents=true
}