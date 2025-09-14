/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4QuitPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4QuitPage extends BlackoutWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton YesButton;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton NoButton;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel QuitDesc;

function bool InternalOnClick(GUIComponent Sender)
{
    Log("[UT2K4QuitPage::InternalOnClick]");
    // End:0xb9
    if(Sender == YesButton)
    {
        Log("[UT2K4QuitPage::InternalOnClick] YES");
        // End:0xa2
        if(PlayerOwner().Level.IsDemoBuild())
        {
            Controller.ReplaceMenu("XInterface.UT2DemoQuitPage");
        }
        // End:0xb6
        else
        {
            PlayerOwner().ConsoleCommand("exit");
        }
    }
    // End:0xf0
    else
    {
        Log("[UT2K4QuitPage::InternalOnClick] NO");
        Controller.CloseMenu(false);
    }
    return true;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x43
    if(State == 3)
    {
        // End:0x2a
        if(key == 11)
        {
            InternalOnClick(NoButton);
        }
        // End:0x43
        else
        {
            // End:0x43
            if(key == 13)
            {
                InternalOnClick(YesButton);
            }
        }
    }
    return false;
}

defaultproperties
{
    begin object name=cYesButton class=GUIButton
        Caption="?"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5156250
        WinLeft=0.1640630
        WinWidth=0.20
        TabOrder=0
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4QuitPage.cYesButton'
    YesButton=cYesButton
    begin object name=cNoButton class=GUIButton
        Caption="???"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5156250
        WinLeft=0.6109370
        WinWidth=0.20
        TabOrder=1
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4QuitPage.cNoButton'
    NoButton=cNoButton
    begin object name=cQuitDesc class=GUILabel
        Caption="?? ????????"
        TextAlign=1
        TextColor=(R=253,G=237,B=244,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4260420
        WinHeight=32.0
        RenderWeight=4.0
    object end
    // Reference: GUILabel'UT2K4QuitPage.cQuitDesc'
    QuitDesc=cQuitDesc
    OnKeyEvent=InternalOnKeyEvent
}