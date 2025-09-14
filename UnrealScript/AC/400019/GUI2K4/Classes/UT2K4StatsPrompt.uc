class UT2K4StatsPrompt extends UT2StatsPrompt
    editinlinenew
    instanced;

var() automated GUIImage i_Background;
var() automated GUIImage i_PageBG;
var() automated GUIButton b_OK;
var() automated GUIButton b_Cancel;
var() automated GUILabel l_Title;
var() automated GUILabel l_Message;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0xB1
    if(Sender == b_OK)
    {
        // End:0xAE
        if(Controller.OpenMenu(Controller.GetSettingsPage(), Class'GUI2K4_Decompressed.UT2K4SettingsPage'.default.PanelCaption[3]))
        {
            // End:0xAE
            if((UT2K4SettingsPage(Controller.ActivePage) != none) && UT2K4SettingsPage(Controller.ActivePage).tp_Game != none)
            {
                UT2K4SettingsPage(Controller.ActivePage).tp_Game.ch_TrackStats.Checked(true);
            }
        }        
    }
    else
    {
        // End:0xE1
        if(Sender == b_Cancel)
        {
            Controller.ReplaceMenu(Controller.GetServerBrowserPage(),,, true);
        }
    }
    return true;
    //return;    
}

function ReOpen()
{
    // End:0x36
    if((Len(PlayerOwner().StatsUsername) >= 4) && Len(PlayerOwner().StatsPassword) >= 6)
    {
        OnClose();
    }
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4StatsPrompt.PasswordBackground'
    begin object name="PasswordBackground" class=XInterface.GUIImage
        ImageStyle=1
        ImageRenderStyle=1
        DropShadowY=10
        WinHeight=251.0000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_Background=PasswordBackground
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4StatsPrompt.menuBackground'
    begin object name="menuBackground" class=XInterface.GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        X1=0
        Y1=0
        X2=1024
        Y2=768
        RenderWeight=0.0001000
    end object
    i_PageBG=menuBackground
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4StatsPrompt.YesButton'
    begin object name="YesButton" class=XInterface.GUIButton
        Caption="?"
        WinTop=0.8100000
        WinLeft=0.1250000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2K4StatsPrompt.InternalOnClick
        OnKeyEvent=YesButton.InternalOnKeyEvent
    end object
    b_OK=YesButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4StatsPrompt.NoButton'
    begin object name="NoButton" class=XInterface.GUIButton
        Caption="???"
        WinTop=0.8100000
        WinLeft=0.6500000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2K4StatsPrompt.InternalOnClick
        OnKeyEvent=NoButton.InternalOnKeyEvent
    end object
    b_Cancel=NoButton
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4StatsPrompt.PromptHeader'
    begin object name="PromptHeader" class=XInterface.GUILabel
        Caption="? ??? UT2004 ?? ??? ??? ?? ????!"
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3541660
        WinHeight=0.0515630
    end object
    l_Title=PromptHeader
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4StatsPrompt.PromptDesc'
    begin object name="PromptDesc" class=XInterface.GUILabel
        Caption="? ??? ???? ??? ‘?? ??’ ??? ??? ?? ??? ??? ????? ???? ???. ‘?? ??’ ??? ???? ?? ???, ???? ?? ?? ??? ????? ???? ??? ?????.||?? ??? ??? ????? ?? ??? ??? ??? ????? ?? ????????"
        TextAlign=1
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.4229170
        WinHeight=0.2562510
    end object
    l_Message=PromptDesc
    bAlwaysAutomate=true
}