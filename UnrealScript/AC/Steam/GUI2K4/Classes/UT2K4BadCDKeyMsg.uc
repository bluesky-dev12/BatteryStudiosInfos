/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4BadCDKeyMsg.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4BadCDKeyMsg extends BlackoutWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Title;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x2c
    if(Sender == b_OK)
    {
        Controller.ReplaceMenu(class'GameEngine'.default.MainMenuClass);
    }
    return true;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x3a
    if(State == 3 && key == 13 || key == 11)
    {
        return InternalOnClick(b_OK);
    }
    return false;
}

defaultproperties
{
    begin object name=OkButton class=GUIButton
        Caption="??"
        WinTop=0.550
        WinLeft=0.40
        WinWidth=0.20
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4BadCDKeyMsg.OkButton'
    b_OK=OkButton
    begin object name=BadCDLabel class=GUILabel
        Caption="???? ??? ?? ???? ??????"
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3833330
        WinHeight=0.231250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4BadCDKeyMsg.BadCDLabel'
    l_Title=BadCDLabel
    OnKeyEvent=InternalOnKeyEvent
}