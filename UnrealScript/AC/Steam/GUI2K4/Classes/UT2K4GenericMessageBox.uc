/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GenericMessageBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4GenericMessageBox extends MessageWindow
    dependson(MessageWindow)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Text;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Text2;

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

function HandleParameters(string Param1, string Param2)
{
    // End:0x20
    if(Param1 != "")
    {
        l_Text.Caption = Param1;
    }
    // End:0x40
    if(Param2 != "")
    {
        l_Text2.Caption = Param2;
    }
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2a
    if(key == 13 && State == 3)
    {
        return InternalOnClick(b_OK);
    }
    return false;
}

defaultproperties
{
    begin object name=OkButton class=GUIButton
        Caption="??"
        StyleName="STY2Warfare_MainButton"
        WinTop=0.5494790
        WinLeft=0.40
        WinWidth=0.20
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4GenericMessageBox.OkButton'
    b_OK=OkButton
    begin object name=DialogText class=GUILabel
        Caption="??"
        TextAlign=1
        VertAlign=1
        FontScale=2
        StyleName="TextButton"
        WinTop=0.3898430
        WinLeft=0.0567710
        WinWidth=0.8847220
        WinHeight=0.0421490
    object end
    // Reference: GUILabel'UT2K4GenericMessageBox.DialogText'
    l_Text=DialogText
    begin object name=DialogText2 class=GUILabel
        TextAlign=1
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.4312490
        WinLeft=0.043750
        WinWidth=0.91250
        WinHeight=0.1265240
    object end
    // Reference: GUILabel'UT2K4GenericMessageBox.DialogText2'
    l_Text2=DialogText2
    OnKeyEvent=InternalOnKeyEvent
}