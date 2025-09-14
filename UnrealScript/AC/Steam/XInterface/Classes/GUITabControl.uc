/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUITabControl.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:29
 *
 *******************************************************************************/
class GUITabControl extends GUIMultiComponent
    dependson(GUIMultiComponent)
    native
    editinlinenew
    instanced;

var() bool bFillSpace;
var() bool bDockPanels;
var() bool bDrawTabAbove;
var() bool bFillBackground;
var() Color FillColor;
var() float FadeInTime;
var() float TabHeight;
var() string BackgroundStyleName;
var() Material BackgroundImage;
var() editconst noexport array<editconst export editinline GUITabButton> TabStack;
var() editconst noexport editinline GUITabButton ActiveTab;
var() editconst noexport editinline GUITabButton PendingTab;
var() editconst noexport editinline GUIStyles BackgroundStyle;
var() editconst noexport editinline GUIBorder MyFooter;
var() bool bForceManualTabButtonStyle;
var() string ManualTabButtonStyleName;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x3b
    if(BackgroundStyleName != "")
    {
        BackgroundStyle = Controller.GetStyle(BackgroundStyleName, FontScale);
    }
    __OnKeyEvent__Delegate = InternalOnKeyEvent;
}

event Opened(GUIComponent Sender)
{
    local int i;

    super.Opened(Sender);
    i = 0;
    J0x12:
    // End:0x53 [While If]
    if(i < TabStack.Length)
    {
        // End:0x49
        if(TabStack[i] != none)
        {
            TabStack[i].Opened(self);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    // End:0x98
    if(!bInit && bVisible && ActiveTab != none && ActiveTab.MyPanel != none)
    {
        ActivateTab(ActiveTab, true);
    }
    bInit = false;
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local int i;

    super.Closed(Sender, bCancelled);
    i = 0;
    J0x18:
    // End:0x63 [While If]
    if(i < TabStack.Length)
    {
        // End:0x59
        if(TabStack[i] != none)
        {
            TabStack[i].Closed(Sender, bCancelled);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local int i, aTabIndex, StartIndex;

    // End:0x1b
    if(FocusedControl != none || TabStack.Length <= 0)
    {
        return false;
    }
    // End:0x28
    if(ActiveTab == none)
    {
        return false;
    }
    i = 0;
    J0x2f:
    // End:0x6c [While If]
    if(i < TabStack.Length)
    {
        // End:0x62
        if(TabStack[i] == ActiveTab)
        {
            aTabIndex = i;
        }
        // End:0x6c
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
    }
    // End:0xea
    if(key == 37 && State == 1)
    {
        StartIndex = aTabIndex;
        J0x94:
        // End:0xe8 [While If]
        if(true)
        {
            // End:0xb5
            if(aTabIndex == 0)
            {
                aTabIndex = TabStack.Length - 1;
            }
            // End:0xbc
            else
            {
                -- aTabIndex;
            }
            // End:0xe5
            if(aTabIndex == StartIndex || ActivateTab(TabStack[aTabIndex], false))
            {
            }
            // End:0xe8
            else
            {
                // This is an implied JumpToken; Continue!
                goto J0x94;
            }
        }
        return true;
    }
    // End:0x162
    if(key == 39 && State == 1)
    {
        StartIndex = aTabIndex;
        J0x112:
        // End:0x160 [While If]
        if(true)
        {
            ++ aTabIndex;
            // End:0x134
            if(aTabIndex == TabStack.Length)
            {
                aTabIndex = 0;
            }
            // End:0x15d
            if(StartIndex == aTabIndex || ActivateTab(TabStack[aTabIndex], false))
            {
            }
            // End:0x160
            else
            {
                // This is an implied JumpToken; Continue!
                goto J0x112;
            }
        }
        return true;
    }
    return false;
}

function GUITabPanel AddTabItem(GUITabItem Item)
{
    return AddTab(Item.Caption, Item.ClassName,, Item.Hint);
}

function GUITabPanel AddTab(string InCaption, string PanelClass, optional GUITabPanel ExistingPanel, optional string InHint, optional bool bForceActive)
{
    local class<GUITabPanel> NewPanelClass;
    local export editinline GUITabButton NewTabButton;
    local export editinline GUITabPanel NewTabPanel;
    local GUI.eFontScale myFontScale;
    local int i;

    i = 0;
    J0x07:
    // End:0x75 [While If]
    if(i < TabStack.Length)
    {
        // End:0x6b
        if(TabStack[i].Caption ~= InCaption)
        {
            Log("A tab with the caption" @ InCaption @ "already exists.");
            return none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x9f
    if(ExistingPanel == none)
    {
        NewPanelClass = class<GUITabPanel>(Controller.AddComponentClass(PanelClass));
    }
    // End:0x3da
    if(ExistingPanel != none || NewPanelClass != none)
    {
        // End:0xdc
        if(ExistingPanel != none)
        {
            NewTabPanel = GUITabPanel(AppendComponent(ExistingPanel, true));
        }
        // End:0xfe
        else
        {
            // End:0xfe
            if(NewPanelClass != none)
            {
                NewTabPanel = GUITabPanel(AddComponent(PanelClass, true));
            }
        }
        // End:0x132
        if(NewTabPanel == none)
        {
            Log("Could not create panel for" @ string(NewPanelClass));
            return none;
        }
        // End:0x15d
        if(NewTabPanel.MyButton != none)
        {
            NewTabButton = NewTabPanel.MyButton;
        }
        // End:0x288
        else
        {
            NewTabButton = new class'GUITabButton';
            // End:0x19e
            if(NewTabButton == none)
            {
                Log("Could not create tab for" @ string(NewPanelClass));
                return none;
            }
            NewTabButton.InitComponent(Controller, self);
            NewTabButton.Opened(self);
            NewTabPanel.MyButton = NewTabButton;
            // End:0x243
            if(!bDrawTabAbove)
            {
                NewTabPanel.MyButton.bBoundToParent = false;
                NewTabPanel.MyButton.Style = Controller.GetStyle("FlippedTabButton", NewTabPanel.FontScale);
            }
            // End:0x288
            if(bForceManualTabButtonStyle)
            {
                NewTabButton.Style = Controller.GetStyle(ManualTabButtonStyleName, myFontScale);
                NewTabButton.StyleName = ManualTabButtonStyleName;
            }
        }
        NewTabPanel.MyButton.Hint = Eval(InHint != "", InHint, NewTabPanel.Hint);
        NewTabPanel.MyButton.Caption = Eval(InCaption != "", InCaption, NewTabPanel.PanelCaption);
        NewTabPanel.MyButton.__OnClick__Delegate = InternalTabClick;
        NewTabPanel.MyButton.MyPanel = NewTabPanel;
        NewTabPanel.MyButton.FocusInstead = self;
        NewTabPanel.MyButton.bNeverFocus = true;
        NewTabPanel.InitPanel();
        TabStack[TabStack.Length] = NewTabPanel.MyButton;
        // End:0x3c5
        if(TabStack.Length == 1 && bVisible || bForceActive)
        {
            ActivateTab(NewTabPanel.MyButton, true);
        }
        // End:0x3d4
        else
        {
            NewTabPanel.Hide();
        }
        return NewTabPanel;
    }
    return none;
}

function GUITabPanel InsertTab(int pos, string Caption, string PanelClass, optional GUITabPanel ExistingPanel, optional string InHint, optional bool bForceActive)
{
    local class<GUITabPanel> NewPanelClass;
    local export editinline GUITabPanel NewTabPanel;
    local export editinline GUITabButton NewTabButton;

    // End:0x2a
    if(ExistingPanel == none)
    {
        NewPanelClass = class<GUITabPanel>(Controller.AddComponentClass(PanelClass));
    }
    // End:0x282
    if(ExistingPanel != none || NewPanelClass != none)
    {
        // End:0x67
        if(ExistingPanel != none)
        {
            NewTabPanel = GUITabPanel(AppendComponent(ExistingPanel, true));
        }
        // End:0x89
        else
        {
            // End:0x89
            if(NewPanelClass != none)
            {
                NewTabPanel = GUITabPanel(AddComponent(PanelClass, true));
            }
        }
        // End:0xbd
        if(NewTabPanel == none)
        {
            Log("Could not create panel for" @ string(NewPanelClass));
            return none;
        }
        // End:0xe8
        if(NewTabPanel.MyButton != none)
        {
            NewTabButton = NewTabPanel.MyButton;
        }
        // End:0x162
        else
        {
            NewTabButton = new class'GUITabButton';
            // End:0x129
            if(NewTabButton == none)
            {
                Log("Could not create tab for" @ string(NewPanelClass));
                return none;
            }
            NewTabButton.InitComponent(Controller, self);
            NewTabButton.Opened(self);
            NewTabPanel.MyButton = NewTabButton;
        }
        NewTabPanel.MyButton.Caption = Caption;
        NewTabPanel.MyButton.Hint = InHint;
        NewTabPanel.MyButton.__OnClick__Delegate = InternalTabClick;
        NewTabPanel.MyButton.MyPanel = NewTabPanel;
        NewTabPanel.MyButton.FocusInstead = self;
        NewTabPanel.MyButton.bNeverFocus = true;
        NewTabPanel.InitPanel();
        TabStack.Insert(pos, 1);
        TabStack[pos] = NewTabPanel.MyButton;
        // End:0x26d
        if(TabStack.Length == 1 || bForceActive)
        {
            ActivateTab(NewTabPanel.MyButton, true);
        }
        // End:0x27c
        else
        {
            NewTabPanel.Hide();
        }
        return NewTabPanel;
    }
    return none;
}

function GUITabPanel ReplaceTab(GUITabButton Which, string Caption, string PanelClass, optional GUITabPanel ExistingPanel, optional string InHint, optional bool bForceActive)
{
    local class<GUITabPanel> NewPanelClass;
    local export editinline GUITabPanel NewTabPanel, OldTabPanel;

    // End:0x2a
    if(ExistingPanel == none)
    {
        NewPanelClass = class<GUITabPanel>(Controller.AddComponentClass(PanelClass));
    }
    // End:0x171
    if(ExistingPanel != none || NewPanelClass != none)
    {
        OldTabPanel = Which.MyPanel;
        // End:0x7b
        if(ExistingPanel == none)
        {
            NewTabPanel = GUITabPanel(AddComponent(PanelClass, true));
        }
        // End:0x92
        else
        {
            NewTabPanel = GUITabPanel(AppendComponent(ExistingPanel, true));
        }
        // End:0xc2
        if(NewTabPanel == none)
        {
            Log("Could not create panel" @ string(NewPanelClass));
            return none;
        }
        Which.Caption = Caption;
        Which.Hint = InHint;
        Which.MyPanel = NewTabPanel;
        NewTabPanel.MyButton = Which;
        NewTabPanel.InitPanel();
        // End:0x142
        if(bForceActive)
        {
            ActivateTab(NewTabPanel.MyButton, true);
        }
        // End:0x151
        else
        {
            NewTabPanel.Hide();
        }
        RemoveComponent(OldTabPanel);
        OldTabPanel.free();
        return NewTabPanel;
    }
    return none;
}

function RemoveTab(optional string Caption, optional GUITabButton Who)
{
    local int i;
    local bool bActive;
    local export editinline GUITabPanel OldPanel;

    // End:0x1b
    if(Caption == "" && Who == none)
    {
        return;
    }
    // End:0x3a
    if(Who == none)
    {
        i = TabIndex(Caption);
    }
    // End:0x54
    else
    {
        i = TabIndex(Who.Caption);
    }
    // End:0x61
    if(i < 0)
    {
        return;
    }
    OldPanel = TabStack[i].MyPanel;
    bActive = TabStack[i] == ActiveTab;
    TabStack[i].__OnClick__Delegate = None;
    TabStack[i].free();
    TabStack.Remove(i, 1);
    RemoveComponent(OldPanel, true);
    OldPanel.free();
    // End:0xf9
    if(bActive)
    {
        LostActiveTab();
    }
}

function bool LostActiveTab()
{
    local int i;

    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return false;
    }
    i = 0;
    J0x1d:
    // End:0x4e [While If]
    if(i < TabStack.Length)
    {
        // End:0x44
        if(ActivateTab(TabStack[i], true))
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    return false;
}

event MakeTabActive(GUITabButton Who)
{
    // End:0x1c
    if(ActiveTab != none)
    {
        ActiveTab.ChangeActiveState(false, false);
    }
    PendingTab = none;
    ActiveTab = Who;
    OnChange(Who);
}

function bool ActivateTab(GUITabButton Who, bool bFocusPanel)
{
    // End:0x30
    if(Who == none || PendingTab != none || !Who.CanShowPanel())
    {
        return false;
    }
    Who.bForceFlash = false;
    // End:0x6d
    if(Who == ActiveTab)
    {
        // End:0x6b
        if(ActiveTab.ChangeActiveState(true, bFocusPanel))
        {
            return true;
        }
        return false;
    }
    PendingTab = Who;
    // End:0x124
    if(PendingTab.ChangeActiveState(true, bFocusPanel))
    {
        // End:0xcf
        if(PendingTab.MyPanel.FadeInTime == 0.0 || TabStack.Length < 2)
        {
            MakeTabActive(Who);
        }
        // End:0x122
        else
        {
            FadeInTime = PendingTab.MyPanel.FadeInTime;
            // End:0x122
            if(!Controller.bQuietMenu)
            {
                PlayerOwner().PlayOwnedSound(Controller.FadeSound, 6, 1.0);
            }
        }
        return true;
    }
    PendingTab = none;
    return false;
}

function bool ActivateTabByName(string tabname, bool bFocusPanel)
{
    local int i;

    i = TabIndex(tabname);
    // End:0x30
    if(i < 0 || i >= TabStack.Length)
    {
        return false;
    }
    return ActivateTab(TabStack[i], bFocusPanel);
}

function bool ActivateTabByPanel(GUITabPanel Panel, bool bFocusPanel)
{
    local int i;

    // End:0x23
    if(Panel == none || !Panel.CanShowPanel())
    {
        return false;
    }
    i = 0;
    J0x2a:
    // End:0x8d [While If]
    if(i < TabStack.Length)
    {
        // End:0x83
        if(TabStack[i] != none && TabStack[i].MyPanel == Panel)
        {
            return ActivateTab(TabStack[i], bFocusPanel);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    return false;
}

function bool InternalTabClick(GUIComponent Sender)
{
    local export editinline GUITabButton But;

    But = GUITabButton(Sender);
    // End:0x1d
    if(But == none)
    {
        return false;
    }
    ActivateTab(But, true);
    return true;
}

event bool NextPage()
{
    local int i;

    // End:0x14
    if(TabStack.Length < 2)
    {
        return super(GUIComponent).NextPage();
    }
    // End:0x29
    if(ActiveTab == none)
    {
        i = 0;
    }
    // End:0x5d
    else
    {
        i = TabIndex(ActiveTab.Caption) + 1;
        // End:0x5d
        if(i >= TabStack.Length)
        {
            i = 0;
        }
    }
    return ActivateTab(TabStack[i], true);
}

event bool PrevPage()
{
    local int i;

    // End:0x14
    if(TabStack.Length < 2)
    {
        return super(GUIComponent).PrevPage();
    }
    // End:0x31
    if(ActiveTab == none)
    {
        i = TabStack.Length - 1;
    }
    // End:0x68
    else
    {
        i = TabIndex(ActiveTab.Caption) - 1;
        // End:0x68
        if(i < 0)
        {
            i = TabStack.Length - 1;
        }
    }
    return ActivateTab(TabStack[i], true);
}

event bool NextControl(GUIComponent Sender)
{
    // End:0x17
    if(Sender != none)
    {
        SetFocus(none);
        return true;
    }
    // End:0x2f
    else
    {
        // End:0x26
        if(super(GUIComponent).NextControl(self))
        {
            return true;
        }
        // End:0x2d
        else
        {
            FocusFirst(none);
        }
        return true;
    }
    return false;
}

event bool PrevControl(GUIComponent Sender)
{
    // End:0x17
    if(Sender != none)
    {
        SetFocus(none);
        return true;
    }
    // End:0x2d
    else
    {
        // End:0x26
        if(super(GUIComponent).PrevControl(self))
        {
            return true;
        }
        // End:0x2d
        else
        {
            FocusLast(none);
        }
    }
    return false;
}

function int TabIndex(string tabname)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < TabStack.Length)
    {
        // End:0x3b
        if(TabStack[i].Caption ~= tabname)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function GUITabPanel FindPanelClass(class<GUITabPanel> PanelClass)
{
    local int i;

    // End:0x0d
    if(PanelClass == none)
    {
        return none;
    }
    i = 0;
    J0x14:
    // End:0x9a [While If]
    if(i < TabStack.Length)
    {
        // End:0x90
        if(TabStack[i] != none && TabStack[i].MyPanel != none && ClassIsChildOf(TabStack[i].MyPanel.Class, PanelClass))
        {
            return TabStack[i].MyPanel;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return none;
}

function GUITabPanel BorrowPanel(string Caption)
{
    local int i;

    // End:0x0e
    if(Caption == "")
    {
        return none;
    }
    i = TabIndex(Caption);
    // End:0x2c
    if(i < 0)
    {
        return none;
    }
    return TabStack[i].MyPanel;
}

function SetVisibility(bool bIsVisible)
{
    super.SetVisibility(bIsVisible);
    // End:0x2d
    if(ActiveTab != none)
    {
        ActiveTab.ChangeActiveState(bIsVisible, false);
    }
}

function InternalOnActivate()
{
    // End:0x11
    if(ActiveTab == none)
    {
        LostActiveTab();
    }
}

function bool FocusFirst(GUIComponent Sender)
{
    // End:0x61
    if(ActiveTab != none && ActiveTab.MyPanel != none && ActiveTab.MyPanel.CanAcceptFocus() && ActiveTab.MyPanel.FocusFirst(none))
    {
        return true;
    }
    // End:0x78
    else
    {
        // End:0x78
        if(!super.FocusFirst(Sender))
        {
            SetFocus(none);
        }
    }
    return true;
}

function bool FocusLast(GUIComponent Sender)
{
    // End:0x61
    if(ActiveTab != none && ActiveTab.MyPanel != none && ActiveTab.MyPanel.CanAcceptFocus() && ActiveTab.MyPanel.FocusLast(none))
    {
        return true;
    }
    // End:0x78
    else
    {
        // End:0x78
        if(!super.FocusLast(Sender))
        {
            SetFocus(none);
        }
    }
    return true;
}

function CenterMouse()
{
    // End:0x1d
    if(ActiveTab != none)
    {
        ActiveTab.CenterMouse();
    }
    // End:0x23
    else
    {
        super.CenterMouse();
    }
}

event free()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < TabStack.Length)
    {
        // End:0x3d
        if(TabStack[i] != none)
        {
            TabStack[i].free();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super.free();
}

function LevelChanged()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < TabStack.Length)
    {
        // End:0x3d
        if(TabStack[i] != none)
        {
            TabStack[i].LevelChanged();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super.LevelChanged();
}

defaultproperties
{
    bDrawTabAbove=true
    TabHeight=0.080
    OnActivate=InternalOnActivate
}