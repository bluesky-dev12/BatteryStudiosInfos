/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GetDataMenu.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class UT2K4GetDataMenu extends UT2K4GenericMessageBox
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Data;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    ed_Data.TabOrder = 0;
    b_OK.TabOrder = 1;
    b_Cancel.TabOrder = 2;
    super(GUIPage).InitComponent(MyController, myOwner);
    RemoveComponent(l_Text2);
    b_OK.bBoundToParent = true;
    b_OK.bStandardized = true;
    b_OK.bScaleToParent = true;
    b_Cancel.bBoundToParent = true;
    b_Cancel.bStandardized = true;
    b_Cancel.bScaleToParent = true;
}

function HandleParameters(string A, string B)
{
    l_Text.Caption = A;
    ed_Data.SetCaption(B);
}

function string GetDataString()
{
    return ed_Data.GetText();
}

function SetDataString(string str)
{
    super(GUIPage).SetDataString(str);
    ed_Data.SetText(str);
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(Sender == b_Cancel);
    return true;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x2a
    if(State == 3 && key == 11)
    {
        return InternalOnClick(b_Cancel);
    }
    return super.InternalOnKeyEvent(key, State, Delta);
}

function bool InternalOnPreDraw(Canvas C)
{
    local bool B;
    local float W, L, t;

    B = super(PopupPageBase).InternalOnPreDraw(C);
    t = 1.0 - float(64) / ActualHeight() - b_Cancel.WinHeight;
    W = 0.150 + b_Cancel.WinWidth * float(2);
    L = 0.50 - W * 0.50;
    b_Cancel.SetPosition(L, t, b_Cancel.WinWidth, b_Cancel.WinHeight);
    L += 0.150 + b_Cancel.WinWidth;
    b_OK.SetPosition(L, t, b_Cancel.WinWidth, b_Cancel.WinHeight);
    return B;
}

defaultproperties
{
    begin object name=CancelButton class=GUIButton
        Caption="??"
        Hint="??? ??? ???? ??? ????."
        WinTop=0.5541670
        WinLeft=0.5730470
        WinWidth=0.1316410
        WinHeight=0.0478120
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4GetDataMenu.CancelButton'
    b_Cancel=CancelButton
    begin object name=Data class=moEditBox
        CaptionWidth=0.40
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.487710
        WinLeft=0.250
        WinHeight=0.0473050
        TabOrder=0
    object end
    // Reference: moEditBox'UT2K4GetDataMenu.Data'
    ed_Data=Data
    begin object name=DialogText class=GUILabel
        TextAlign=1
        FontScale=2
        StyleName="TextButton"
        WinTop=0.3882810
        WinHeight=0.093750
    object end
    // Reference: GUILabel'UT2K4GetDataMenu.DialogText'
    l_Text=DialogText
    WinTop=0.2895830
    WinHeight=0.4234380
}