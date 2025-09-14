/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4CustomFilterPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:7
 *
 *******************************************************************************/
class UT2K4CustomFilterPage extends FilterPageBase
    dependson(FilterPageBase)
    dependson(GUIFilterPanel)
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
    J0x7f:
    // End:0xec [While If]
    if(i < FilterPI.Groups.Length)
    {
        c_Info.AddTab(FilterPI.Groups[i], PanelClass[2],, FilterPI.Groups[i] @ PanelHint[2]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7f;
    }
}

function CheckFM()
{
    super.CheckFM();
    FilterPI = UT2k4ServerBrowser(ParentPage).FilterInfo;
}

function ApplyRules(int FilterIndex, optional bool bRefresh)
{
    local int i;

    // End:0x1eb
    if(FilterIndex >= 0)
    {
        EnableComponent(c_Info);
        UT2k4ServerBrowser(ParentPage).SetFilterInfo();
        FM.LoadSettings(FilterIndex);
        i = 0;
        J0x45:
        // End:0x13e [While If]
        if(i < c_Info.TabStack.Length)
        {
            // End:0x134
            if(c_Info.TabStack[i] != none && GUIFilterPanel(c_Info.TabStack[i].MyPanel) != none)
            {
                GUIFilterPanel(c_Info.TabStack[i].MyPanel).bRefresh = bRefresh || GUIFilterPanel(c_Info.TabStack[i].MyPanel).bRefresh;
                GUIFilterPanel(c_Info.TabStack[i].MyPanel).bUpdate = true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
        // End:0x192
        if(c_Info.ActiveTab != none && c_Info.ActiveTab.MyPanel != none)
        {
            c_Info.ActivateTab(c_Info.ActiveTab, true);
        }
        // End:0x1c7
        else
        {
            // End:0x1c7
            if(c_Info.TabStack.Length > 0)
            {
                c_Info.ActivateTab(c_Info.TabStack[0], true);
            }
        }
        // End:0x1eb
        if(!FM.IsActiveAt(FilterIndex))
        {
            DisableComponent(c_Info);
        }
    }
}

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    // End:0x8e
    if(Sender == li_Filter)
    {
        // End:0x87
        if(li_Filter.ValidIndex(li_Filter.Index) && Controller.bCurMenuInitialized && FM != none && FM.IsActiveAt(li_Filter.Index))
        {
            ToggleTabControl(true);
        }
        // End:0x8e
        else
        {
            ToggleTabControl(false);
        }
    }
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
    // End:0xde
    if(GUISplitter(Sender) != none)
    {
        // End:0xde
        if(GUITabControl(NewComp) != none)
        {
            c_Info = GUITabControl(NewComp);
            c_Info.WinHeight = 0.90;
            c_Info.TabHeight = 0.040;
            c_Info.bDrawTabAbove = false;
            c_Info.bFillSpace = true;
            c_Info.bAcceptsInput = true;
            c_Info.bDockPanels = true;
            c_Info.__OnChange__Delegate = InternalOnChange;
            c_Info.BackgroundStyleName = "TabBackground";
        }
    }
}

function ToggleTabControl(bool bEnable)
{
    // End:0xb4
    if(c_Info != none)
    {
        // End:0x70
        if(bEnable && c_Info.MenuState == 4)
        {
            c_Info.EnableMe();
            c_Info.Show();
            c_Info.ActivateTab(c_Info.TabStack[0], true);
        }
        // End:0xb4
        else
        {
            // End:0xb4
            if(!bEnable && c_Info.MenuState != 4)
            {
                c_Info.DisableMe();
                c_Info.Hide();
            }
        }
    }
}

function InternalReleaseSplitter(GUIComponent Splitter, float NewPos)
{
    // End:0x1d
    if(Splitter == sp_Filter)
    {
        FilterSplitterPosition = NewPos;
        SaveConfig();
    }
}

defaultproperties
{
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    begin object name=FilterSplitter class=GUISplitter
        SplitOrientation=1
        DefaultPanels[0]="GUI2K4.UT2K4FilterControlPanel"
        DefaultPanels[1]="XInterface.GUITabControl"
        MaxPercentage=0.90
        OnReleaseSplitter=InternalReleaseSplitter
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        RenderWeight=1.0
        OnLoadINI=InternalOnLoad
    object end
    // Reference: GUISplitter'UT2K4CustomFilterPage.FilterSplitter'
    sp_Filter=FilterSplitter
}