class TabControlMocker extends GUIComponent
    editinlinenew
    instanced;

var array<export editinline GUIButton> Buttons;
var array<export editinline GUIPanel> Panels;
var export editinline GUIButton VisiblePanelsButton;
var export editinline GUIPanel VisiblePanel;
var int CurrentTabIndex;
//var delegate<OnVisiblePanelChanged> __OnVisiblePanelChanged__Delegate;
//var delegate<OnChangedTab> __OnChangedTab__Delegate;

delegate OnVisiblePanelChanged(int Index)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x3B [Loop If]
    if(lp1 < Buttons.Length)
    {
        Buttons[lp1].__OnClick__Delegate = TabButton_OnClick;
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    //return;    
}

function Clear()
{
    Buttons.Length = 0;
    Panels.Length = 0;
    //return;    
}

function SetVisiblePanel(int Index, optional bool bChange)
{
    local int lp1;

    // End:0x1D
    if(Buttons[Index].bVisible == false)
    {
        return;
    }
    // End:0xA5
    if(VisiblePanel != none)
    {
        lp1 = 0;
        J0x2F:

        // End:0xA5 [Loop If]
        if(lp1 < Panels.Length)
        {
            // End:0x9B
            if(Buttons[lp1].bVisible == true)
            {
                Buttons[lp1].EnableMe();
                Panels[lp1].bAcceptsInput = false;
                Panels[lp1].Hide();
            }
            lp1++;
            // [Loop Continue]
            goto J0x2F;
        }
    }
    Panels[Index].bAcceptsInput = true;
    Panels[Index].Show();
    Buttons[Index].DisableMe();
    VisiblePanel = Panels[Index];
    VisiblePanelsButton = Buttons[Index];
    OnChangedTab(Index, CurrentTabIndex);
    CurrentTabIndex = Index;
    // End:0x142
    if(bChange == false)
    {
        OnVisiblePanelChanged(Index);
    }
    //return;    
}

function GUIPanel GetVisiblePanel()
{
    return VisiblePanel;
    //return;    
}

function int GetVisiblePanelIndex()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x3F [Loop If]
    if(lp1 < Buttons.Length)
    {
        // End:0x35
        if(Panels[lp1].bVisible)
        {
            return lp1;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int GetCurrentTabIndex()
{
    return CurrentTabIndex;
    //return;    
}

delegate OnChangedTab(int CurrentIndex, int PrevIndex)
{
    //return;    
}

function bool TabButton_OnClick(GUIComponent Sender)
{
    local int lp1, Prev;

    lp1 = 0;
    J0x07:

    // End:0x44 [Loop If]
    if(lp1 < Buttons.Length)
    {
        // End:0x3A
        if(Buttons[lp1] == Sender)
        {
            SetVisiblePanel(lp1);
            // [Explicit Break]
            goto J0x44;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x44:

    return true;
    //return;    
}

defaultproperties
{
    WinWidth=0.0000000
    WinHeight=0.0000000
}