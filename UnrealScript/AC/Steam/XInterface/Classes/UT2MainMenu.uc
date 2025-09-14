/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2MainMenu.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class UT2MainMenu extends UT2K3GUIPage
    editinlinenew
    instanced;

var bool AllowClose;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    // End:0x50
    if(PlayerOwner().Level.IsDemoBuild())
    {
        Controls[3].SetFocus(none);
        Controls[2].MenuStateChange(4);
    }
}

function OnClose(optional bool bCanceled);
function bool MyKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2a
    if(key == 27 && State == 1)
    {
        AllowClose = true;
        return true;
    }
    // End:0x2c
    else
    {
        return false;
    }
}

function bool CanClose(optional bool bCanceled)
{
    // End:0x30
    if(AllowClose)
    {
        Controller.OpenMenu("xinterface.UT2QuitPage");
    }
    return false;
}

function bool ButtonClick(GUIComponent Sender)
{
    // End:0x41
    if(Sender == Controls[2])
    {
        Controller.OpenMenu("xinterface.UT2SinglePlayerMain");
    }
    // End:0x7c
    if(Sender == Controls[3])
    {
        Controller.OpenMenu("xinterface.ServerBrowser");
    }
    // End:0xc0
    if(Sender == Controls[4])
    {
        Controller.OpenMenu("xinterface.UT2MultiplayerHostPage");
    }
    // End:0x102
    if(Sender == Controls[5])
    {
        Controller.OpenMenu("xinterface.UT2InstantActionPage");
    }
    // End:0x13f
    if(Sender == Controls[6])
    {
        Controller.OpenMenu("xinterface.UT2SettingsPage");
    }
    // End:0x178
    if(Sender == Controls[7])
    {
        Controller.OpenMenu("xinterface.UT2QuitPage");
    }
    return true;
}

defaultproperties
{
    bDisconnectOnOpen=true
    bAllowedAsLast=true
    OnCanClose=CanClose
    Controls=// Object reference not set to an instance of an object.
    
    OnKeyEvent=MyKeyEvent
}