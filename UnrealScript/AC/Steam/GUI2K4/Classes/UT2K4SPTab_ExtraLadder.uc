/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_ExtraLadder.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class UT2K4SPTab_ExtraLadder extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl tcTabs;
var string CustomLadderTab;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super.InitComponent(pMyController, myOwner);
    bInit = true;
}

function ShowPanel(bool bShow)
{
    local int i;
    local export editinline UT2K4SPTab_CustomLadder tsl;

    // End:0x182
    if(bShow && bInit)
    {
        bInit = false;
        i = 0;
        J0x23:
        // End:0x182 [While If]
        if(i < GP.UT2K4GameLadder.default.AdditionalLadders.Length)
        {
            Log("Custom Ladder:" @ string(GP.UT2K4GameLadder.default.AdditionalLadders[i]));
            GP.RegisterCustomLadder(string(GP.UT2K4GameLadder.default.AdditionalLadders[i]));
            tsl = UT2K4SPTab_CustomLadder(tcTabs.AddTab(GP.UT2K4GameLadder.default.AdditionalLadders[i].default.LadderName, CustomLadderTab,,, false));
            tsl.CustomLadderClass = string(GP.UT2K4GameLadder.default.AdditionalLadders[i]);
            tsl.LadderId = 10 + i;
            tsl.EntryLabels = GP.UT2K4GameLadder.default.AdditionalLadders[i].default.EntryLabels;
            tsl.InitCustom();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x23;
        }
    }
    super.ShowPanel(bShow);
}

function InternalOnChange(GUIComponent Sender);
function bool onPlayClick()
{
    // End:0x49
    if(UT2K4SPTab_Base(tcTabs.ActiveTab.MyPanel) != none)
    {
        return UT2K4SPTab_Base(tcTabs.ActiveTab.MyPanel).onPlayClick();
    }
    return false;
}

defaultproperties
{
    begin object name=PageTabs class=GUITabControl
        bDockPanels=true
        TabHeight=0.0360
        BackgroundStyleName="TabBackground"
        WinHeight=0.040
        RenderWeight=0.490
        TabOrder=3
        bBoundToParent=true
        bAcceptsInput=true
        OnActivate=InternalOnActivate
        OnChange=InternalOnChange
    object end
    // Reference: GUITabControl'UT2K4SPTab_ExtraLadder.PageTabs'
    tcTabs=PageTabs
    CustomLadderTab="GUI2K4.UT2K4SPTab_CustomLadder"
    PanelCaption="?? ??"
}