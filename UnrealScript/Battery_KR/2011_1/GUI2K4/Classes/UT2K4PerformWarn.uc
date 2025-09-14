class UT2K4PerformWarn extends UT2K4GenericMessageBox
    editinlinenew
    instanced;

var() automated moCheckBox ch_NeverShowAgain;

function HandleParameters(string Param1, string Param2)
{
    local float F;

    F = float(Param1);
    // End:0x24
    if(F != 0.0000000)
    {
        SetTimer(F);
    }
    //return;    
}

function Timer()
{
    Controller.CloseMenu(false);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function CheckBoxClick(GUIComponent Sender)
{
    Class'GUI2K4_Decompressed.Settings_Tabs'.default.bExpert = ch_NeverShowAgain.IsChecked();
    Class'GUI2K4_Decompressed.Settings_Tabs'.static.StaticSaveConfig();
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string Value)
{
    ch_NeverShowAgain.Checked(Class'GUI2K4_Decompressed.Settings_Tabs'.default.bExpert);
    //return;    
}

defaultproperties
{
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4PerformWarn.HideCheckbox'
    begin object name="HideCheckbox" class=XInterface.moCheckBox
        bFlipped=true
        ComponentJustification=0
        CaptionWidth=0.9300000
        ComponentWidth=0.0700000
        Caption="? ??? ?? ???? ?? ???"
        OnCreateComponent=HideCheckbox.InternalOnCreateComponent
        FontScale=0
        IniOption="@Internal"
        Hint="?? ??? ???? ??? ? ?? ???? ??? ?? ???"
        WinTop=0.4994790
        WinLeft=0.3125000
        WinWidth=0.3700000
        TabOrder=1
        OnChange=UT2K4PerformWarn.CheckBoxClick
        OnLoadINI=UT2K4PerformWarn.InternalOnLoadINI
    end object
    ch_NeverShowAgain=HideCheckbox
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4PerformWarn.OkButton'
    begin object name="OkButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.5500000
        WinLeft=0.4390630
        WinWidth=0.1218750
        TabOrder=0
        OnClick=UT2K4PerformWarn.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    b_OK=OkButton
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4PerformWarn.DialogText'
    begin object name="DialogText" class=XInterface.GUILabel
        Caption="??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.4000000
        WinHeight=0.0400000
    end object
    l_Text=DialogText
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4PerformWarn.DialogText2'
    begin object name="DialogText2" class=XInterface.GUILabel
        Caption="??? ??? ?? ??? ??? ? ? ????."
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.4500000
        WinHeight=0.0400000
    end object
    l_Text2=DialogText2
}