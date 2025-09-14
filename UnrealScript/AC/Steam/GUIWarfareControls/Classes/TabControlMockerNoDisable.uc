/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\TabControlMockerNoDisable.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:8
 *
 *******************************************************************************/
class TabControlMockerNoDisable extends GUIComponent
    editinlinenew
    instanced;

var array<export editinline GUIButton> Buttons;
var array<export editinline GUIPanel> Panels;
var export editinline GUIButton VisiblePanelsButton;
var export editinline GUIPanel VisiblePanel;
var int CurrentTabIndex;
var delegate<OnVisiblePanelChanged> __OnVisiblePanelChanged__Delegate;

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
    // End:0x70
    if(TabButton != none && Panel != none)
    {
        TabButton.__OnClick__Delegate = TabButton_OnClick;
        Buttons[Buttons.Length] = TabButton;
        Panels[Panels.Length] = Panel;
        Panel.Hide();
        Panel.bAcceptsInput = false;
    }
}

function SetVisiblePanel(int Index, optional bool bChange)
{
    local int lp1;

    // End:0x1d
    if(Buttons[Index].bVisible == false)
    {
        return;
    }
    // End:0xa5
    if(VisiblePanel != none)
    {
        lp1 = 0;
        J0x2f:
        // End:0xa5 [While If]
        if(lp1 < Panels.Length)
        {
            // End:0x9b
            if(Buttons[lp1].bVisible == true)
            {
                Buttons[lp1].EnableMe();
                Panels[lp1].bAcceptsInput = false;
                Panels[lp1].Hide();
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
    }
    Panels[Index].bAcceptsInput = true;
    Panels[Index].Show();
    Buttons[Index].DisableMe();
    VisiblePanel = Panels[Index];
    VisiblePanelsButton = Buttons[Index];
    CurrentTabIndex = Index;
    // End:0x12e
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