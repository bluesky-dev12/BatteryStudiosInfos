class UT2K4CustomFilterPage extends FilterPageBase
    config(User)
    editinlinenew
    instanced;

var export editinline GUITitleBar TabDock;
var export editinline GUITabControl c_Info;
var PlayInfo FilterPI;
var array<string> PanelClass;
var localized array<localized string> PanelCaption;
var localized array<localized string> PanelHint;

event Opened(GUIComponent Sender)
{
    local int i;

    // End:0x17
    if(c_Info.TabStack.Length > 0)
    {
        return;
    }
    CheckFM();
    super.Opened(Sender);
    InitFilterList();
    c_Info.AddTab(PanelCaption[0], PanelClass[0],, PanelHint[0]);
    c_Info.AddTab(PanelCaption[1], PanelClass[1],, PanelHint[1]);
    i = 0;
    J0x7F:

    // End:0xEC [Loop If]
    if(i < FilterPI.Groups.Length)
    {
        c_Info.AddTab(FilterPI.Groups[i], PanelClass[2],, FilterPI.Groups[i] @ PanelHint[2]);
        i++;
        // [Loop Continue]
        goto J0x7F;
    }
    //return;    
}

function CheckFM()
{
    super.CheckFM();
    FilterPI = UT2k4ServerBrowser(ParentPage).FilterInfo;
    //return;    
}

function ApplyRules(int FilterIndex, optional bool bRefresh)
{
    local int i;

    // End:0x1EB
    if(FilterIndex >= 0)
    {
        EnableComponent(c_Info);
        UT2k4ServerBrowser(ParentPage).SetFilterInfo();
        FM.LoadSettings(FilterIndex);
        i = 0;
        J0x45:

        // End:0x13E [Loop If]
        if(i < c_Info.TabStack.Length)
        {
            // End:0x134
            if((c_Info.TabStack[i] != none) && GUIFilterPanel(c_Info.TabStack[i].MyPanel) != none)
            {
                GUIFilterPanel(c_Info.TabStack[i].MyPanel).bRefresh = bRefresh || GUIFilterPanel(c_Info.TabStack[i].MyPanel).bRefresh;
                GUIFilterPanel(c_Info.TabStack[i].MyPanel).bUpdate = true;
            }
            i++;
            // [Loop Continue]
            goto J0x45;
        }
        // End:0x192
        if((c_Info.ActiveTab != none) && c_Info.ActiveTab.MyPanel != none)
        {
            c_Info.ActivateTab(c_Info.ActiveTab, true);            
        }
        else
        {
            // End:0x1C7
            if(c_Info.TabStack.Length > 0)
            {
                c_Info.ActivateTab(c_Info.TabStack[0], true);
            }
        }
        // End:0x1EB
        if(!FM.IsActiveAt(FilterIndex))
        {
            DisableComponent(c_Info);
        }
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    // End:0x8E
    if(Sender == li_Filter)
    {
        // End:0x87
        if(((li_Filter.ValidIndex(li_Filter.Index) && Controller.bCurMenuInitialized) && FM != none) && FM.IsActiveAt(li_Filter.Index))
        {
            ToggleTabControl(true);            
        }
        else
        {
            ToggleTabControl(false);
        }
    }
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
    // End:0xDE
    if(GUISplitter(Sender) != none)
    {
        // End:0xDE
        if(GUITabControl(NewComp) != none)
        {
            c_Info = GUITabControl(NewComp);
            c_Info.WinHeight = 0.9000000;
            c_Info.TabHeight = 0.0400000;
            c_Info.bDrawTabAbove = false;
            c_Info.bFillSpace = true;
            c_Info.bAcceptsInput = true;
            c_Info.bDockPanels = true;
            c_Info.__OnChange__Delegate = InternalOnChange;
            c_Info.BackgroundStyleName = "TabBackground";
        }
    }
    //return;    
}

function ToggleTabControl(bool bEnable)
{
    // End:0xB4
    if(c_Info != none)
    {
        // End:0x70
        if(bEnable && int(c_Info.MenuState) == int(4))
        {
            c_Info.EnableMe();
            c_Info.Show();
            c_Info.ActivateTab(c_Info.TabStack[0], true);            
        }
        else
        {
            // End:0xB4
            if(!bEnable && int(c_Info.MenuState) != int(4))
            {
                c_Info.DisableMe();
                c_Info.Hide();
            }
        }
    }
    //return;    
}

function InternalReleaseSplitter(GUIComponent Splitter, float NewPos)
{
    // End:0x1D
    if(Splitter == sp_Filter)
    {
        FilterSplitterPosition = NewPos;
        SaveConfig();
    }
    //return;    
}

defaultproperties
{
    PanelClass[0]="GUI2K4.UT2K4FilterSummaryPanel"
    PanelClass[1]="GUI2K4.UT2K4CustomRulesPanel"
    PanelClass[2]="GUI2K4.UT2K4FilterRulesPanel"
    PanelCaption[0]="?? ??"
    PanelCaption[1]="??? ?? ??"
    PanelHint[0]="? ??? ?? ?? ??? ??? ???"
    PanelHint[1]="??? ?? ?? ??"
    PanelHint[2]="??"
    // Reference: GUISplitter'GUI2K4_Decompressed.UT2K4CustomFilterPage.FilterSplitter'
    begin object name="FilterSplitter" class=XInterface.GUISplitter
        SplitOrientation=1
        DefaultPanels[0]="GUI2K4.UT2K4FilterControlPanel"
        DefaultPanels[1]="XInterface.GUITabControl"
        MaxPercentage=0.9000000
        OnReleaseSplitter=UT2K4CustomFilterPage.InternalReleaseSplitter
        OnCreateComponent=UT2K4CustomFilterPage.InternalOnCreateComponent
        IniOption="@Internal"
        RenderWeight=1.0000000
        OnLoadINI=UT2K4CustomFilterPage.InternalOnLoad
    end object
    sp_Filter=FilterSplitter
}