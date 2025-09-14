class GUITabControl extends GUIMultiComponent
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
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUITabButton ActiveTab;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUITabButton PendingTab;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIStyles BackgroundStyle;
var() /*0x00000000-0x00000008*/ editconst noexport editinline GUIBorder MyFooter;
var() bool bForceManualTabButtonStyle;
var() string ManualTabButtonStyleName;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x3B
    if(BackgroundStyleName != "")
    {
        BackgroundStyle = Controller.GetStyle(BackgroundStyleName, FontScale);
    }
    __OnKeyEvent__Delegate = InternalOnKeyEvent;
    //return;    
}

event Opened(GUIComponent Sender)
{
    local int i;

    super.Opened(Sender);
    i = 0;
    J0x12:

    // End:0x53 [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x49
        if(TabStack[i] != none)
        {
            TabStack[i].Opened(self);
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    // End:0x98
    if(((!bInit && bVisible) && ActiveTab != none) && ActiveTab.MyPanel != none)
    {
        ActivateTab(ActiveTab, true);
    }
    bInit = false;
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local int i;

    super.Closed(Sender, bCancelled);
    i = 0;
    J0x18:

    // End:0x63 [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x59
        if(TabStack[i] != none)
        {
            TabStack[i].Closed(Sender, bCancelled);
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local int i, aTabIndex, StartIndex;

    // End:0x1B
    if((FocusedControl != none) || TabStack.Length <= 0)
    {
        return false;
    }
    // End:0x28
    if(ActiveTab == none)
    {
        return false;
    }
    i = 0;
    J0x2F:

    // End:0x6C [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x62
        if(TabStack[i] == ActiveTab)
        {
            aTabIndex = i;
            // [Explicit Break]
            goto J0x6C;
        }
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    J0x6C:

    // End:0xEA
    if((int(key) == 37) && int(State) == 1)
    {
        StartIndex = aTabIndex;
        J0x94:

        // End:0xE8 [Loop If]
        if(true)
        {
            // End:0xB5
            if(aTabIndex == 0)
            {
                aTabIndex = TabStack.Length - 1;                
            }
            else
            {
                aTabIndex--;
            }
            // End:0xE5
            if((aTabIndex == StartIndex) || ActivateTab(TabStack[aTabIndex], false))
            {
                // [Explicit Break]
                goto J0xE8;
            }
            // [Loop Continue]
            goto J0x94;
        }
        J0xE8:

        return true;
    }
    // End:0x162
    if((int(key) == 39) && int(State) == 1)
    {
        StartIndex = aTabIndex;
        J0x112:

        // End:0x160 [Loop If]
        if(true)
        {
            aTabIndex++;
            // End:0x134
            if(aTabIndex == TabStack.Length)
            {
                aTabIndex = 0;
            }
            // End:0x15D
            if((StartIndex == aTabIndex) || ActivateTab(TabStack[aTabIndex], false))
            {
                // [Explicit Break]
                goto J0x160;
            }
            // [Loop Continue]
            goto J0x112;
        }
        J0x160:

        return true;
    }
    return false;
    //return;    
}

function GUITabPanel AddTabItem(GUITabItem Item)
{
    return AddTab(Item.Caption, Item.ClassName,, Item.Hint);
    //return;    
}

function GUITabPanel AddTab(string InCaption, string PanelClass, optional GUITabPanel ExistingPanel, optional string InHint, optional bool bForceActive)
{
    local Class<GUITabPanel> NewPanelClass;
    local export editinline GUITabButton NewTabButton;
    local export editinline GUITabPanel NewTabPanel;
    local GUI.eFontScale myFontScale;
    local int i;

    i = 0;
    J0x07:

    // End:0x75 [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x6B
        if(TabStack[i].Caption ~= InCaption)
        {
            Log(("A tab with the caption" @ InCaption) @ "already exists.");
            return none;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x9F
    if(ExistingPanel == none)
    {
        NewPanelClass = Class<GUITabPanel>(Controller.AddComponentClass(PanelClass));
    }
    // End:0x3DA
    if((ExistingPanel != none) || NewPanelClass != none)
    {
        // End:0xDC
        if(ExistingPanel != none)
        {
            NewTabPanel = GUITabPanel(AppendComponent(ExistingPanel, true));            
        }
        else
        {
            // End:0xFE
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
        // End:0x15D
        if(NewTabPanel.MyButton != none)
        {
            NewTabButton = NewTabPanel.MyButton;            
        }
        else
        {
            NewTabButton = new Class'XInterface_Decompressed.GUITabButton';
            // End:0x19E
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
        // End:0x3C5
        if(((TabStack.Length == 1) && bVisible) || bForceActive)
        {
            ActivateTab(NewTabPanel.MyButton, true);            
        }
        else
        {
            NewTabPanel.Hide();
        }
        return NewTabPanel;
    }
    return none;
    //return;    
}

function GUITabPanel InsertTab(int pos, string Caption, string PanelClass, optional GUITabPanel ExistingPanel, optional string InHint, optional bool bForceActive)
{
    local Class<GUITabPanel> NewPanelClass;
    local export editinline GUITabPanel NewTabPanel;
    local export editinline GUITabButton NewTabButton;

    // End:0x2A
    if(ExistingPanel == none)
    {
        NewPanelClass = Class<GUITabPanel>(Controller.AddComponentClass(PanelClass));
    }
    // End:0x282
    if((ExistingPanel != none) || NewPanelClass != none)
    {
        // End:0x67
        if(ExistingPanel != none)
        {
            NewTabPanel = GUITabPanel(AppendComponent(ExistingPanel, true));            
        }
        else
        {
            // End:0x89
            if(NewPanelClass != none)
            {
                NewTabPanel = GUITabPanel(AddComponent(PanelClass, true));
            }
        }
        // End:0xBD
        if(NewTabPanel == none)
        {
            Log("Could not create panel for" @ string(NewPanelClass));
            return none;
        }
        // End:0xE8
        if(NewTabPanel.MyButton != none)
        {
            NewTabButton = NewTabPanel.MyButton;            
        }
        else
        {
            NewTabButton = new Class'XInterface_Decompressed.GUITabButton';
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
        // End:0x26D
        if((TabStack.Length == 1) || bForceActive)
        {
            ActivateTab(NewTabPanel.MyButton, true);            
        }
        else
        {
            NewTabPanel.Hide();
        }
        return NewTabPanel;
    }
    return none;
    //return;    
}

function GUITabPanel ReplaceTab(GUITabButton Which, string Caption, string PanelClass, optional GUITabPanel ExistingPanel, optional string InHint, optional bool bForceActive)
{
    local Class<GUITabPanel> NewPanelClass;
    local export editinline GUITabPanel NewTabPanel, OldTabPanel;

    // End:0x2A
    if(ExistingPanel == none)
    {
        NewPanelClass = Class<GUITabPanel>(Controller.AddComponentClass(PanelClass));
    }
    // End:0x171
    if((ExistingPanel != none) || NewPanelClass != none)
    {
        OldTabPanel = Which.MyPanel;
        // End:0x7B
        if(ExistingPanel == none)
        {
            NewTabPanel = GUITabPanel(AddComponent(PanelClass, true));            
        }
        else
        {
            NewTabPanel = GUITabPanel(AppendComponent(ExistingPanel, true));
        }
        // End:0xC2
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
        else
        {
            NewTabPanel.Hide();
        }
        RemoveComponent(OldTabPanel);
        OldTabPanel.free();
        return NewTabPanel;
    }
    return none;
    //return;    
}

function RemoveTab(optional string Caption, optional GUITabButton Who)
{
    local int i;
    local bool bActive;
    local export editinline GUITabPanel OldPanel;

    // End:0x1B
    if((Caption == "") && Who == none)
    {
        return;
    }
    // End:0x3A
    if(Who == none)
    {
        i = TabIndex(Caption);        
    }
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
    // End:0xF9
    if(bActive)
    {
        LostActiveTab();
    }
    //return;    
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
    J0x1D:

    // End:0x4E [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x44
        if(ActivateTab(TabStack[i], true))
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    return false;
    //return;    
}

event MakeTabActive(GUITabButton Who)
{
    // End:0x1C
    if(ActiveTab != none)
    {
        ActiveTab.ChangeActiveState(false, false);
    }
    PendingTab = none;
    ActiveTab = Who;
    OnChange(Who);
    //return;    
}

function bool ActivateTab(GUITabButton Who, bool bFocusPanel)
{
    // End:0x30
    if(((Who == none) || PendingTab != none) || !Who.CanShowPanel())
    {
        return false;
    }
    Who.bForceFlash = false;
    // End:0x6D
    if(Who == ActiveTab)
    {
        // End:0x6B
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
        // End:0xCF
        if((PendingTab.MyPanel.FadeInTime == 0.0000000) || TabStack.Length < 2)
        {
            MakeTabActive(Who);            
        }
        else
        {
            FadeInTime = PendingTab.MyPanel.FadeInTime;
            // End:0x122
            if(!Controller.bQuietMenu)
            {
                PlayerOwner().PlayOwnedSound(Controller.FadeSound, 6, 1.0000000);
            }
        }
        return true;
    }
    PendingTab = none;
    return false;
    //return;    
}

function bool ActivateTabByName(string tabname, bool bFocusPanel)
{
    local int i;

    i = TabIndex(tabname);
    // End:0x30
    if((i < 0) || i >= TabStack.Length)
    {
        return false;
    }
    return ActivateTab(TabStack[i], bFocusPanel);
    //return;    
}

function bool ActivateTabByPanel(GUITabPanel Panel, bool bFocusPanel)
{
    local int i;

    // End:0x23
    if((Panel == none) || !Panel.CanShowPanel())
    {
        return false;
    }
    i = 0;
    J0x2A:

    // End:0x8D [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x83
        if((TabStack[i] != none) && TabStack[i].MyPanel == Panel)
        {
            return ActivateTab(TabStack[i], bFocusPanel);
        }
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    return false;
    //return;    
}

function bool InternalTabClick(GUIComponent Sender)
{
    local export editinline GUITabButton But;

    But = GUITabButton(Sender);
    // End:0x1D
    if(But == none)
    {
        return false;
    }
    ActivateTab(But, true);
    return true;
    //return;    
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
    else
    {
        i = (TabIndex(ActiveTab.Caption)) + 1;
        // End:0x5D
        if(i >= TabStack.Length)
        {
            i = 0;
        }
    }
    return ActivateTab(TabStack[i], true);
    //return;    
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
    else
    {
        i = (TabIndex(ActiveTab.Caption)) - 1;
        // End:0x68
        if(i < 0)
        {
            i = TabStack.Length - 1;
        }
    }
    return ActivateTab(TabStack[i], true);
    //return;    
}

event bool NextControl(GUIComponent Sender)
{
    // End:0x17
    if(Sender != none)
    {
        SetFocus(none);
        return true;        
    }
    else
    {
        // End:0x26
        if(super(GUIComponent).NextControl(self))
        {
            return true;            
        }
        else
        {
            FocusFirst(none);
        }
        return true;
    }
    return false;
    //return;    
}

event bool PrevControl(GUIComponent Sender)
{
    // End:0x17
    if(Sender != none)
    {
        SetFocus(none);
        return true;        
    }
    else
    {
        // End:0x26
        if(super(GUIComponent).PrevControl(self))
        {
            return true;            
        }
        else
        {
            FocusLast(none);
        }
    }
    return false;
    //return;    
}

function int TabIndex(string tabname)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x3B
        if(TabStack[i].Caption ~= tabname)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function GUITabPanel FindPanelClass(Class<GUITabPanel> PanelClass)
{
    local int i;

    // End:0x0D
    if(PanelClass == none)
    {
        return none;
    }
    i = 0;
    J0x14:

    // End:0x9A [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x90
        if(((TabStack[i] != none) && TabStack[i].MyPanel != none) && ClassIsChildOf(TabStack[i].MyPanel.Class, PanelClass))
        {
            return TabStack[i].MyPanel;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

function GUITabPanel BorrowPanel(string Caption)
{
    local int i;

    // End:0x0E
    if(Caption == "")
    {
        return none;
    }
    i = TabIndex(Caption);
    // End:0x2C
    if(i < 0)
    {
        return none;
    }
    return TabStack[i].MyPanel;
    //return;    
}

function SetVisibility(bool bIsVisible)
{
    super.SetVisibility(bIsVisible);
    // End:0x2D
    if(ActiveTab != none)
    {
        ActiveTab.ChangeActiveState(bIsVisible, false);
    }
    //return;    
}

function InternalOnActivate()
{
    // End:0x11
    if(ActiveTab == none)
    {
        LostActiveTab();
    }
    //return;    
}

function bool FocusFirst(GUIComponent Sender)
{
    // End:0x61
    if((((ActiveTab != none) && ActiveTab.MyPanel != none) && ActiveTab.MyPanel.CanAcceptFocus()) && ActiveTab.MyPanel.FocusFirst(none))
    {
        return true;        
    }
    else
    {
        // End:0x78
        if(!super.FocusFirst(Sender))
        {
            SetFocus(none);
        }
    }
    return true;
    //return;    
}

function bool FocusLast(GUIComponent Sender)
{
    // End:0x61
    if((((ActiveTab != none) && ActiveTab.MyPanel != none) && ActiveTab.MyPanel.CanAcceptFocus()) && ActiveTab.MyPanel.FocusLast(none))
    {
        return true;        
    }
    else
    {
        // End:0x78
        if(!super.FocusLast(Sender))
        {
            SetFocus(none);
        }
    }
    return true;
    //return;    
}

function CenterMouse()
{
    // End:0x1D
    if(ActiveTab != none)
    {
        ActiveTab.CenterMouse();        
    }
    else
    {
        super.CenterMouse();
    }
    //return;    
}

event free()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x3D
        if(TabStack[i] != none)
        {
            TabStack[i].free();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super.free();
    //return;    
}

function LevelChanged()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < TabStack.Length)
    {
        // End:0x3D
        if(TabStack[i] != none)
        {
            TabStack[i].LevelChanged();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super.LevelChanged();
    //return;    
}

defaultproperties
{
    bDrawTabAbove=true
    TabHeight=0.0800000
    OnActivate=GUITabControl.InternalOnActivate
}