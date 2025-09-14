class UT2K4SPTab_ExtraLadder extends UT2K4SPTab_Base
    editinlinenew
    instanced;

var() automated GUITabControl tcTabs;
var string CustomLadderTab;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super.InitComponent(pMyController, myOwner);
    bInit = true;
    //return;    
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

        // End:0x182 [Loop If]
        if(i < GP.UT2K4GameLadder.default.AdditionalLadders.Length)
        {
            Log("Custom Ladder:" @ string(GP.UT2K4GameLadder.default.AdditionalLadders[i]));
            GP.RegisterCustomLadder(string(GP.UT2K4GameLadder.default.AdditionalLadders[i]));
            tsl = UT2K4SPTab_CustomLadder(tcTabs.AddTab(GP.UT2K4GameLadder.default.AdditionalLadders[i].default.LadderName, CustomLadderTab,,, false));
            tsl.CustomLadderClass = string(GP.UT2K4GameLadder.default.AdditionalLadders[i]);
            tsl.LadderId = 10 + i;
            tsl.EntryLabels = GP.UT2K4GameLadder.default.AdditionalLadders[i].default.EntryLabels;
            tsl.InitCustom();
            i++;
            // [Loop Continue]
            goto J0x23;
        }
    }
    super.ShowPanel(bShow);
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    //return;    
}

function bool onPlayClick()
{
    // End:0x49
    if(UT2K4SPTab_Base(tcTabs.ActiveTab.MyPanel) != none)
    {
        return UT2K4SPTab_Base(tcTabs.ActiveTab.MyPanel).onPlayClick();
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUITabControl'GUI2K4_Decompressed.UT2K4SPTab_ExtraLadder.PageTabs'
    begin object name="PageTabs" class=XInterface.GUITabControl
        bDockPanels=true
        TabHeight=0.0360000
        BackgroundStyleName="TabBackground"
        WinHeight=0.0400000
        RenderWeight=0.4900000
        TabOrder=3
        bBoundToParent=true
        bAcceptsInput=true
        OnActivate=PageTabs.InternalOnActivate
        OnChange=UT2K4SPTab_ExtraLadder.InternalOnChange
    end object
    tcTabs=PageTabs
    CustomLadderTab="GUI2K4.UT2K4SPTab_CustomLadder"
    PanelCaption="?? ??"
}