/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4CustomHUDMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:8
 *
 *******************************************************************************/
class UT2K4CustomHUDMenu extends LargeWindow
    editinlinenew
    abstract
    instanced;

var class<GameInfo> GameClass;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Reset;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;

function HandleParameters(string GameClassName, string Nothing)
{
    super(GUIPage).HandleParameters(GameClassName, Nothing);
    // End:0x24
    if(InitializeGameClass(GameClassName))
    {
        LoadSettings();
    }
}

function bool InitializeGameClass(string GameClassName);
event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    // End:0x1c
    if(bCancelled)
    {
        return;
    }
    SaveSettings();
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(Sender == b_Reset)
    {
        RestoreDefaults();
    }
    // End:0x48
    else
    {
        // End:0x48
        if(GUIButton(Sender) != none)
        {
            Controller.CloseMenu(GUIButton(Sender) == b_Cancel);
        }
    }
    return true;
}

function InternalOnChange(GUIComponent Sender);
function LoadSettings();
function SaveSettings();
function RestoreDefaults()
{
    LoadSettings();
}

defaultproperties
{
    DefaultLeft=0.1250
    DefaultTop=0.150
    DefaultWidth=0.5983980
    DefaultHeight=0.70
    WinTop=0.150
    WinLeft=0.1250
    WinWidth=0.5983980
    WinHeight=0.70
}