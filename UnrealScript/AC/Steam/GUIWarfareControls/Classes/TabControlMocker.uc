/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\TabControlMocker.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:10
 *
 *******************************************************************************/
class TabControlMocker extends GUIComponent
    editinlinenew
    instanced;

var array<export editinline GUIButton> Buttons;
var array<export editinline GUIPanel> Panels;
var export editinline GUIButton VisiblePanelsButton;
var export editinline GUIPanel VisiblePanel;
var int CurrentTabIndex;
var delegate<OnVisiblePanelChanged> __OnVisiblePanelChanged__Delegate;
var delegate<OnChangedTab> __OnChangedTab__Delegate;

delegate OnVisiblePanelChanged(int Index);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x3b [While If]
    if(lp1 < Buttons.Length)
    {
        Buttons[lp1].__OnClick__Delegate = TabButton_OnClick;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function BindTabButtonAndPanel(GUIButton TabButton, GUITabPanel Panel)
{
    // End:0x89
    if(TabButton != none)
    {
        TabButton.__OnKeyEvent__Delegate = TabButton.PageOwner.__OnKeyEvent__Delegate;
        TabButton.__OnClick__Delegate = TabButton_OnClick;
        Buttons[Buttons.Length] = TabButton;
        Panels[Panels.Length] = Panel;
        Panel.Hide();
        Panel.bAcceptsInput = false;
    }
}

function Clear()
{
    Buttons.Length = 0;
    Panels.Length = 0;
}

function SetVisiblePanel(int Index, optional bool bChange)
{
    local int lp1;

    // End:0x2b
    if(Buttons.Length == 0 || Buttons[Index].bVisible == false)
    {
        return;
    }
    // End:0xb3
    if(VisiblePanel != none)
    {
        lp1 = 0;
        J0x3d:
        // End:0xb3 [While If]
        if(lp1 < Panels.Length)
        {
            // End:0xa9
            if(Buttons[lp1].bVisible == true)
            {
                Buttons[lp1].EnableMe();
                Panels[lp1].bAcceptsInput = false;
                Panels[lp1].Hide();
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x3d;
        }
    }
    Panels[Index].bAcceptsInput = true;
    Panels[Index].Show();
    Buttons[Index].DisableMe();
    VisiblePanel = Panels[Index];
    VisiblePanelsButton = Buttons[Index];
    OnChangedTab(Index, CurrentTabIndex);
    CurrentTabIndex = Index;
    // End:0x150
    if(bChange == false)
    {
        OnVisiblePanelChanged(Index);
    }
}

function GUIPanel GetVisiblePanel()
{
    return VisiblePanel;
}

function int GetVisiblePanelIndex()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x3f [While If]
    if(lp1 < Buttons.Length)
    {
        // End:0x35
        if(Panels[lp1].bVisible)
        {
            return lp1;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int GetCurrentTabIndex()
{
    return CurrentTabIndex;
}

delegate OnChangedTab(int CurrentIndex, int PrevIndex);
function bool TabButton_OnClick(GUIComponent Sender)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x44 [While If]
    if(lp1 < Buttons.Length)
    {
        // End:0x3a
        if(Buttons[lp1] == Sender)
        {
            SetVisiblePanel(lp1);
        }
        // End:0x44
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    return true;
}

defaultproperties
{
    WinWidth=0.0
    WinHeight=0.0
}