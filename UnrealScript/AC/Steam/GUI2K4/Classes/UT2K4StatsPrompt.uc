/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4StatsPrompt.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4StatsPrompt extends UT2StatsPrompt
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_PageBG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Title;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Message;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0xb1
    if(Sender == b_OK)
    {
        // End:0xae
        if(Controller.OpenMenu(Controller.GetSettingsPage(), class'UT2K4SettingsPage'.default.PanelCaption[3]))
        {
            // End:0xae
            if(UT2K4SettingsPage(Controller.ActivePage) != none && UT2K4SettingsPage(Controller.ActivePage).tp_Game != none)
            {
                UT2K4SettingsPage(Controller.ActivePage).tp_Game.ch_TrackStats.Checked(true);
            }
        }
    }
    // End:0xe1
    else
    {
        // End:0xe1
        if(Sender == b_Cancel)
        {
            Controller.ReplaceMenu(Controller.GetServerBrowserPage(),,, true);
        }
    }
    return true;
}

function ReOpen()
{
    // End:0x36
    if(Len(PlayerOwner().StatsUsername) >= 4 && Len(PlayerOwner().StatsPassword) >= 6)
    {
        OnClose();
    }
}

defaultproperties
{
    begin object name=PasswordBackground class=GUIImage
        ImageStyle=1
        ImageRenderStyle=1
        DropShadowY=10
        WinHeight=251.0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'UT2K4StatsPrompt.PasswordBackground'
    i_Background=PasswordBackground
    begin object name=menuBackground class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        X1=0
        Y1=0
        X2=1024
        Y2=768
        RenderWeight=0.00010
    object end
    // Reference: GUIImage'UT2K4StatsPrompt.menuBackground'
    i_PageBG=menuBackground
    begin object name=YesButton class=GUIButton
        Caption="?"
        WinTop=0.810
        WinLeft=0.1250
        WinWidth=0.20
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4StatsPrompt.YesButton'
    b_OK=YesButton
    begin object name=NoButton class=GUIButton
        Caption="???"
        WinTop=0.810
        WinLeft=0.650
        WinWidth=0.20
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4StatsPrompt.NoButton'
    b_Cancel=NoButton
    begin object name=PromptHeader class=GUILabel
        Caption="? ??? UT2004 ?? ??? ??? ?? ????!"
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.3541660
        WinHeight=0.0515630
    object end
    // Reference: GUILabel'UT2K4StatsPrompt.PromptHeader'
    l_Title=PromptHeader
    begin object name=PromptDesc class=GUILabel
        Caption="? ??? ???? ??? ??? ??? ??? ??? ?? ??? ??? ????? ???? ???. ??? ??? ??? ???? ?? ???, ???? ?? ?? ??? ????? ???? ??? ?????.||?? ??? ??? ????? ?? ??? ??? ??? ????? ?? ????????"
        TextAlign=1
        bMultiLine=true
        StyleName="TextLabel"
        WinTop=0.4229170
        WinHeight=0.2562510
    object end
    // Reference: GUILabel'UT2K4StatsPrompt.PromptDesc'
    l_Message=PromptDesc
    bAlwaysAutomate=true
}