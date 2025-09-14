/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4PerformWarn.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class UT2K4PerformWarn extends UT2K4GenericMessageBox
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_NeverShowAgain;

function HandleParameters(string Param1, string Param2)
{
    local float f;

    f = float(Param1);
    // End:0x24
    if(f != 0.0)
    {
        SetTimer(f);
    }
}

function Timer()
{
    Controller.CloseMenu(false);
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

function CheckBoxClick(GUIComponent Sender)
{
    class'Settings_Tabs'.default.bExpert = ch_NeverShowAgain.IsChecked();
    class'Settings_Tabs'.static.StaticSaveConfig();
}

function InternalOnLoadINI(GUIComponent Sender, string Value)
{
    ch_NeverShowAgain.Checked(class'Settings_Tabs'.default.bExpert);
}

defaultproperties
{
    begin object name=HideCheckbox class=moCheckBox
        bFlipped=true
        ComponentJustification=0
        CaptionWidth=0.930
        ComponentWidth=0.070
        Caption="? ??? ?? ???? ?? ???"
        OnCreateComponent=InternalOnCreateComponent
        FontScale=0
        IniOption="@Internal"
        Hint="?? ??? ???? ??? ? ?? ???? ??? ?? ???"
        WinTop=0.4994790
        WinLeft=0.31250
        WinWidth=0.370
        TabOrder=1
        OnChange=CheckBoxClick
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4PerformWarn.HideCheckbox'
    ch_NeverShowAgain=HideCheckbox
    begin object name=OkButton class=GUIButton
        Caption="??"
        WinTop=0.550
        WinLeft=0.4390630
        WinWidth=0.1218750
        TabOrder=0
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4PerformWarn.OkButton'
    b_OK=OkButton
    begin object name=DialogText class=GUILabel
        Caption="??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.40
        WinHeight=0.040
    object end
    // Reference: GUILabel'UT2K4PerformWarn.DialogText'
    l_Text=DialogText
    begin object name=DialogText2 class=GUILabel
        Caption="??? ??? ?? ??? ??? ? ? ????."
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.450
        WinHeight=0.040
    object end
    // Reference: GUILabel'UT2K4PerformWarn.DialogText2'
    l_Text2=DialogText2
}