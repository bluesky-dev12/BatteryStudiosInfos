class GUIMultiComponent extends GUIComponent
    abstract
    native
    editinlinenew
    instanced;

var(Menu) export editinlinenotify array<export editinlinenotify GUIComponent> Controls;
var(State) /*0x00000000-0x00000008*/ editconst noexport editinline GUIComponent FocusedControl;
var(Menu) editconstarray noexport array<export editinline GUIComponent> Components;
var() editconst noexport int AnimationCount;
var() bool PropagateVisibility;
var() bool bOldStyleMenus;
var(State) bool bDrawFocusedLast;
var() bool bAlwaysAutomate;
//var delegate<HandleContextMenuOpen> __HandleContextMenuOpen__Delegate;
//var delegate<HandleContextMenuClose> __HandleContextMenuClose__Delegate;
//var delegate<NotifyContextSelect> __NotifyContextSelect__Delegate;
//var delegate<OnCreateComponent> __OnCreateComponent__Delegate;

delegate bool HandleContextMenuOpen(GUIComponent Sender, GUIContextMenu Menu, GUIComponent ContextMenuOwner)
{
    return true;
    //return;    
}

delegate bool HandleContextMenuClose(GUIContextMenu Sender)
{
    return true;
    //return;    
}

delegate bool NotifyContextSelect(GUIContextMenu Sender, int ClickIndex)
{
    return false;
    //return;    
}

delegate OnCreateComponent(GUIComponent NewComponent, GUIComponent Sender)
{
    //return;    
}

// Export UGUIMultiComponent::execInitializeControls(FFrame&, void* const)
native final function InitializeControls();

// Export UGUIMultiComponent::execRemapComponents(FFrame&, void* const)
native final function RemapComponents();

// Export UGUIMultiComponent::execFindComponentIndex(FFrame&, void* const)
native final function int FindComponentIndex(GUIComponent Who)
{
    //native.Who;        
}

function InternalOnShow()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    InitializeControls();
    i = 0;
    J0x1D:

    // End:0xEA [Loop If]
    if(i < Controls.Length)
    {
        // End:0xAF
        if(Controls[i] == none)
        {
            // End:0x9E
            if(Controller.bModAuthor)
            {
                Log(((((string(Name) @ "- Invalid control found in") @ GetMenuPath()) $ "!! (Control") @ string(i)) $ ")", 'ModAuthor');
            }
            Controls.Remove(i--, 1);
            // [Explicit Continue]
            goto J0xE0;
        }
        OnCreateComponent(Controls[i], self);
        Controls[i].InitComponent(MyController, self);
        J0xE0:

        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    RemapComponents();
    //return;    
}

event GUIComponent AddComponent(string ComponentClass, optional bool SkipRemap)
{
    local Class<GUIComponent> NewCompClass;
    local export editinline GUIComponent NewComp;

    // End:0x28
    if(Controller != none)
    {
        NewCompClass = Controller.AddComponentClass(ComponentClass);        
    }
    else
    {
        NewCompClass = Class<GUIComponent>(DynamicLoadObject(ComponentClass, Class'Core.Class'));
    }
    // End:0x85
    if(NewCompClass != none)
    {
        NewComp = new (none) NewCompClass;
        // End:0x85
        if(NewComp != none)
        {
            NewComp = AppendComponent(NewComp, SkipRemap);
            return NewComp;
        }
    }
    Log((string(Name) @ "could not create component") @ ComponentClass, 'AddComponent');
    return none;
    //return;    
}

event GUIComponent InsertComponent(GUIComponent NewComp, int Index, optional bool SkipRemap)
{
    // End:0x29
    if((Index < 0) || Index >= Controls.Length)
    {
        return AppendComponent(NewComp);
    }
    Controls.Insert(Index, 1);
    Controls[Index] = NewComp;
    // End:0x57
    if(!SkipRemap)
    {
        RemapComponents();
    }
    return NewComp;
    //return;    
}

event GUIComponent AppendComponent(GUIComponent NewComp, optional bool SkipRemap)
{
    local int Index;

    J0x00:
    // End:0x50 [Loop If]
    if(Index < Controls.Length)
    {
        // End:0x46
        if(NewComp.RenderWeight < Controls[Index].RenderWeight)
        {
            Controls.Insert(Index, 1);
            // [Explicit Break]
            goto J0x50;
        }
        Index++;
        // [Loop Continue]
        goto J0x00;
    }
    J0x50:

    Controls[Index] = NewComp;
    OnCreateComponent(NewComp, self);
    // End:0x9A
    if(NewComp.Controller == none)
    {
        NewComp.InitComponent(Controller, self);
    }
    // End:0xAB
    if(!SkipRemap)
    {
        RemapComponents();
    }
    // End:0xCD
    if(Controller.bCurMenuInitialized)
    {
        NewComp.Opened(self);
    }
    return NewComp;
    //return;    
}

event bool RemoveComponent(GUIComponent Comp, optional bool SkipRemap)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x55 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x4B
        if(Controls[i] == Comp)
        {
            Controls.Remove(i, 1);
            // End:0x49
            if(!SkipRemap)
            {
                RemapComponents();
            }
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function SetFocusInstead(GUIComponent InFocusComp)
{
    local int i;

    super.SetFocusInstead(InFocusComp);
    i = 0;
    J0x12:

    // End:0x46 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].SetFocusInstead(InFocusComp);
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

event SetFocus(GUIComponent Who)
{
    // End:0x23
    if(Who == none)
    {
        // End:0x1E
        if(!FocusFirst(none))
        {
            super.SetFocus(none);
        }
        return;        
    }
    else
    {
        FocusedControl = Who;
    }
    MenuStateChange(2);
    // End:0x51
    if(MenuOwner != none)
    {
        MenuOwner.SetFocus(self);
    }
    //return;    
}

event LoseFocus(GUIComponent Sender)
{
    FocusedControl = none;
    super.LoseFocus(Sender);
    //return;    
}

function bool CanAcceptFocus()
{
    local int i;

    // End:0x16
    if(bAcceptsInput && super.CanAcceptFocus())
    {
        return true;
    }
    i = 0;
    J0x1D:

    // End:0x51 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x47
        if(Controls[i].CanAcceptFocus())
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

event bool FocusFirst(GUIComponent Sender)
{
    local int i;

    // End:0x4C
    if(Components.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0x4C [Loop If]
        if(i < Components.Length)
        {
            // End:0x42
            if(Components[i].FocusFirst(Sender))
            {
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    i = 0;
    J0x53:

    // End:0x8C [Loop If]
    if(i < Controls.Length)
    {
        // End:0x82
        if(Controls[i].FocusFirst(Sender))
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x53;
    }
    // End:0xA9
    if(bAcceptsInput && CanAcceptFocus())
    {
        SetFocus(none);
        return true;
    }
    return false;
    //return;    
}

event bool FocusLast(GUIComponent Sender)
{
    local int i;

    // End:0x4F
    if(Components.Length > 0)
    {
        i = Components.Length - 1;
        J0x1B:

        // End:0x4F [Loop If]
        if(i >= 0)
        {
            // End:0x45
            if(Components[i].FocusLast(Sender))
            {
                return true;
            }
            i--;
            // [Loop Continue]
            goto J0x1B;
        }
    }
    i = Controls.Length - 1;
    J0x5E:

    // End:0x92 [Loop If]
    if(i >= 0)
    {
        // End:0x88
        if(Controls[i].FocusLast(Sender))
        {
            return true;
        }
        i--;
        // [Loop Continue]
        goto J0x5E;
    }
    // End:0xAF
    if(bAcceptsInput && CanAcceptFocus())
    {
        SetFocus(none);
        return true;
    }
    return false;
    //return;    
}

event bool NextControl(GUIComponent Sender)
{
    local int Index;

    Index = FindComponentIndex(Sender);
    // End:0x4C
    if(Index >= 0)
    {
        J0x1C:

        // End:0x4C [Loop If]
        if(++Index < Components.Length)
        {
            // End:0x49
            if(Components[Index].FocusFirst(none))
            {
                return true;
            }
            // [Loop Continue]
            goto J0x1C;
        }
    }
    // End:0x58
    if(super.NextControl(self))
    {
        return true;
    }
    return FocusFirst(none);
    //return;    
}

event bool PrevControl(GUIComponent Sender)
{
    local int Index;

    Index = FindComponentIndex(Sender);
    J0x11:

    // End:0x3C [Loop If]
    if(--Index >= 0)
    {
        // End:0x39
        if(Components[Index].FocusLast(none))
        {
            return true;
        }
        // [Loop Continue]
        goto J0x11;
    }
    // End:0x48
    if(super.PrevControl(self))
    {
        return true;
    }
    return FocusLast(none);
    //return;    
}

singular function EnableMe()
{
    local int i;

    super.EnableMe();
    i = 0;
    J0x0D:

    // End:0x38 [Loop If]
    if(i < Controls.Length)
    {
        EnableComponent(Controls[i]);
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

singular function DisableMe()
{
    local int i;

    super.DisableMe();
    i = 0;
    J0x0D:

    // End:0x38 [Loop If]
    if(i < Controls.Length)
    {
        DisableComponent(Controls[i]);
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

event SetVisibility(bool bIsVisible)
{
    local int i;

    super.SetVisibility(bIsVisible);
    // End:0x19
    if(!PropagateVisibility)
    {
        return;
    }
    i = 0;
    J0x20:

    // End:0x55 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].SetVisibility(bIsVisible);
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    //return;    
}

event Opened(GUIComponent Sender)
{
    local int i;

    // End:0x12
    if(Sender == none)
    {
        Sender = self;
    }
    super.Opened(Sender);
    i = 0;
    J0x24:

    // End:0x58 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].Opened(Sender);
        i++;
        // [Loop Continue]
        goto J0x24;
    }
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    local int i;

    // End:0x12
    if(Sender == none)
    {
        Sender = self;
    }
    super.Closed(Sender, bCancelled);
    i = 0;
    J0x2A:

    // End:0x64 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].Closed(Sender, bCancelled);
        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    //return;    
}

event free()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].free();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Controls.Remove(0, Controls.Length);
    Components.Remove(0, Components.Length);
    FocusedControl = none;
    super.free();
    //return;    
}

event BeginAnimation(GUIComponent Animating)
{
    AnimationCount++;
    // End:0x1A
    if(AnimationCount > 0)
    {
        bAnimating = true;
    }
    // End:0x39
    if(MenuOwner != none)
    {
        MenuOwner.BeginAnimation(Animating);
    }
    //return;    
}

event EndAnimation(GUIComponent Animating, GUI.EAnimationType Type)
{
    AnimationCount--;
    // End:0x21
    if(AnimationCount <= 0)
    {
        bAnimating = false;
        AnimationCount = 0;
    }
    // End:0x45
    if(MenuOwner != none)
    {
        MenuOwner.EndAnimation(Animating, Type);
    }
    // End:0x64
    if(Animating == self)
    {
        OnEndAnimation(Animating, Type);
    }
    //return;    
}

function LevelChanged()
{
    local int i;

    super.LevelChanged();
    i = 0;
    J0x0D:

    // End:0x3C [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].LevelChanged();
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function CenterMouse()
{
    local int i;

    // End:0x1C
    if(FocusedControl != none)
    {
        FocusedControl.CenterMouse();
        return;
    }
    i = 0;
    J0x23:

    // End:0x6C [Loop If]
    if(i < Components.Length)
    {
        // End:0x62
        if(Components[i].CanAcceptFocus())
        {
            Components[i].CenterMouse();
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x23;
    }
    super.CenterMouse();
    //return;    
}

function DebugTabOrder()
{
    local int i;

    CheckInvalidTabOrder();
    CheckDuplicateTabOrder();
    i = 0;
    J0x13:

    // End:0x42 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].DebugTabOrder();
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    //return;    
}

function CheckInvalidTabOrder()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x96 [Loop If]
    if(i < Components.Length)
    {
        // End:0x8C
        if(Components[i].TabOrder == -1)
        {
            Log(((((GetMenuPath() @ "Component[") $ string(i)) $ "] (") $ Components[i].GetMenuPath()) $ ") has no tab order assigned!");
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function CheckDuplicateTabOrder()
{
    local int i, j;
    local array<IntBox> TabOrders;
    local bool bDup;

    i = 0;
    J0x07:

    // End:0x1AE [Loop If]
    if(i < Components.Length)
    {
        bDup = false;
        // End:0x40
        if(Components[i].TabOrder == -1)
        {
            // [Explicit Continue]
            goto J0x1A4;
        }
        j = 0;
        J0x47:

        // End:0x143 [Loop If]
        if(j < TabOrders.Length)
        {
            // End:0x139
            if(Components[i].TabOrder == TabOrders[j].X2)
            {
                Log(((((((((((GetMenuPath() @ "Dulicate tab order (") $ string(Components[i].TabOrder)) $ ") - components ") $ string(TabOrders[j].X1)) $ " (") $ Components[TabOrders[j].X1].GetMenuPath()) $ ") & ") $ string(i)) $ " (") $ Components[i].GetMenuPath()) $ ")");
                bDup = true;
            }
            j++;
            // [Loop Continue]
            goto J0x47;
        }
        // End:0x1A4
        if(!bDup)
        {
            j = TabOrders.Length;
            TabOrders.Length = j + 1;
            TabOrders[j].X1 = j;
            TabOrders[j].X2 = Components[i].TabOrder;
        }
        J0x1A4:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function GUIComponent NewComponent(GUIComponent newcompo, FloatBox fbNewCompo, optional float RenderWeight, optional GUIMultiComponent ParentComponent)
{
    newcompo.bUseAWinPos = true;
    newcompo.AWinPos = fbNewCompo;
    // End:0x37
    if(ParentComponent == none)
    {
        ParentComponent = self;
    }
    newcompo.InitComponent(Controller, ParentComponent);
    // End:0x71
    if(RenderWeight > float(0))
    {
        newcompo.RenderWeight = RenderWeight;
    }
    ParentComponent.AppendComponent(newcompo);
    return newcompo;
    //return;    
}

function TraversalApplyAWinPos()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < Components.Length)
    {
        Components[i].TraversalApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x3D:

    // End:0x6C [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].TraversalApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x3D;
    }
    ApplyAWinPos();
    //return;    
}

function bool RecursiveActiveOwner(GUIComponent checkComponent)
{
    local bool bActive;

    // End:0x1F
    if(Controller.ActivePage == none)
    {
        bActive = false;        
    }
    else
    {
        bActive = Controller.ActivePage == checkComponent;
    }
    // End:0x78
    if((bActive == false) && checkComponent.MenuOwner != none)
    {
        bActive = RecursiveActiveOwner(checkComponent.MenuOwner);
    }
    return bActive;
    //return;    
}

defaultproperties
{
    bDrawFocusedLast=true
    bTabStop=true
}