/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIMultiComponent.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:37
 *
 *******************************************************************************/
class GUIMultiComponent extends GUIComponent
    native
    editinlinenew
    abstract
    instanced;

var(Menu) databinding export editinlinenotify array<databinding export editinlinenotify GUIComponent> Controls;
var(State) editconst noexport editinline GUIComponent FocusedControl;
var(Menu) editconstarray noexport array<export editinline GUIComponent> Components;
var() editconst noexport int AnimationCount;
var() bool PropagateVisibility;
var() bool bOldStyleMenus;
var(State) bool bDrawFocusedLast;
var() bool bAlwaysAutomate;
var delegate<HandleContextMenuOpen> __HandleContextMenuOpen__Delegate;
var delegate<HandleContextMenuClose> __HandleContextMenuClose__Delegate;
var delegate<NotifyContextSelect> __NotifyContextSelect__Delegate;
var delegate<OnCreateComponent> __OnCreateComponent__Delegate;

delegate bool HandleContextMenuOpen(GUIComponent Sender, GUIContextMenu Menu, GUIComponent ContextMenuOwner)
{
    return true;
}

delegate bool HandleContextMenuClose(GUIContextMenu Sender)
{
    return true;
}

delegate bool NotifyContextSelect(GUIContextMenu Sender, int ClickIndex)
{
    return false;
}

delegate OnCreateComponent(GUIComponent NewComponent, GUIComponent Sender);
// Export UGUIMultiComponent::execInitializeControls(FFrame&, void* const)
native final function InitializeControls();
// Export UGUIMultiComponent::execRemapComponents(FFrame&, void* const)
native final function RemapComponents();
// Export UGUIMultiComponent::execFindComponentIndex(FFrame&, void* const)
native final function int FindComponentIndex(GUIComponent Who);
function InternalOnShow();
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    InitializeControls();
    i = 0;
    J0x1d:
    // End:0xea [While If]
    if(i < Controls.Length)
    {
        // End:0xaf
        if(Controls[i] == none)
        {
            // End:0x9e
            if(Controller.bModAuthor)
            {
                Log(string(Name) @ "- Invalid control found in" @ GetMenuPath() $ "!! (Control" @ string(i) $ ")", 'ModAuthor');
            }
            Controls.Remove(-- i, 1);
        }
        // End:0xe0
        else
        {
            OnCreateComponent(Controls[i], self);
            Controls[i].InitComponent(MyController, self);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    RemapComponents();
}

event GUIComponent AddComponent(string ComponentClass, optional bool SkipRemap)
{
    local class<GUIComponent> NewCompClass;
    local export editinline GUIComponent NewComp;

    // End:0x28
    if(Controller != none)
    {
        NewCompClass = Controller.AddComponentClass(ComponentClass);
    }
    // End:0x43
    else
    {
        NewCompClass = class<GUIComponent>(DynamicLoadObject(ComponentClass, class'Class'));
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
    Log(string(Name) @ "could not create component" @ ComponentClass, 'AddComponent');
    return none;
}

event GUIComponent InsertComponent(GUIComponent NewComp, int Index, optional bool SkipRemap)
{
    // End:0x29
    if(Index < 0 || Index >= Controls.Length)
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
}

event GUIComponent AppendComponent(GUIComponent NewComp, optional bool SkipRemap)
{
    local int Index;

    // End:0x50 [While If]
    if(Index < Controls.Length)
    {
        J0x00:
        // End:0x46
        if(NewComp.RenderWeight < Controls[Index].RenderWeight)
        {
            Controls.Insert(Index, 1);
        }
        // End:0x50
        else
        {
            ++ Index;
            // This is an implied JumpToken; Continue!
            goto J0x00;
        }
    }
    Controls[Index] = NewComp;
    OnCreateComponent(NewComp, self);
    // End:0x9a
    if(NewComp.Controller == none)
    {
        NewComp.InitComponent(Controller, self);
    }
    // End:0xab
    if(!SkipRemap)
    {
        RemapComponents();
    }
    // End:0xcd
    if(Controller.bCurMenuInitialized)
    {
        NewComp.Opened(self);
    }
    return NewComp;
}

event bool RemoveComponent(GUIComponent Comp, optional bool SkipRemap)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x55 [While If]
    if(i < Controls.Length)
    {
        // End:0x4b
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function SetFocusInstead(GUIComponent InFocusComp)
{
    local int i;

    super.SetFocusInstead(InFocusComp);
    i = 0;
    J0x12:
    // End:0x46 [While If]
    if(i < Controls.Length)
    {
        Controls[i].SetFocusInstead(InFocusComp);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
}

event SetFocus(GUIComponent Who)
{
    // End:0x23
    if(Who == none)
    {
        // End:0x1e
        if(!FocusFirst(none))
        {
            super.SetFocus(none);
        }
        return;
    }
    // End:0x2e
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
}

event LoseFocus(GUIComponent Sender)
{
    FocusedControl = none;
    super.LoseFocus(Sender);
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
    J0x1d:
    // End:0x51 [While If]
    if(i < Controls.Length)
    {
        // End:0x47
        if(Controls[i].CanAcceptFocus())
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    return false;
}

event bool FocusFirst(GUIComponent Sender)
{
    local int i;

    // End:0x4c
    if(Components.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x4c [While If]
        if(i < Components.Length)
        {
            // End:0x42
            if(Components[i].FocusFirst(Sender))
            {
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    i = 0;
    J0x53:
    // End:0x8c [While If]
    if(i < Controls.Length)
    {
        // End:0x82
        if(Controls[i].FocusFirst(Sender))
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x53;
    }
    // End:0xa9
    if(bAcceptsInput && CanAcceptFocus())
    {
        SetFocus(none);
        return true;
    }
    return false;
}

event bool FocusLast(GUIComponent Sender)
{
    local int i;

    // End:0x4f
    if(Components.Length > 0)
    {
        i = Components.Length - 1;
        J0x1b:
        // End:0x4f [While If]
        if(i >= 0)
        {
            // End:0x45
            if(Components[i].FocusLast(Sender))
            {
                return true;
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
    i = Controls.Length - 1;
    J0x5e:
    // End:0x92 [While If]
    if(i >= 0)
    {
        // End:0x88
        if(Controls[i].FocusLast(Sender))
        {
            return true;
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    // End:0xaf
    if(bAcceptsInput && CanAcceptFocus())
    {
        SetFocus(none);
        return true;
    }
    return false;
}

event bool NextControl(GUIComponent Sender)
{
    local int Index;

    Index = FindComponentIndex(Sender);
    // End:0x4c
    if(Index >= 0)
    {
        J0x1c:
        // End:0x4c [While If]
        if(++ Index < Components.Length)
        {
            // End:0x49
            if(Components[Index].FocusFirst(none))
            {
                return true;
            }
            // This is an implied JumpToken; Continue!
            goto J0x1c;
        }
    }
    // End:0x58
    if(super.NextControl(self))
    {
        return true;
    }
    return FocusFirst(none);
}

event bool PrevControl(GUIComponent Sender)
{
    local int Index;

    Index = FindComponentIndex(Sender);
    J0x11:
    // End:0x3c [While If]
    if(-- Index >= 0)
    {
        // End:0x39
        if(Components[Index].FocusLast(none))
        {
            return true;
        }
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
    // End:0x48
    if(super.PrevControl(self))
    {
        return true;
    }
    return FocusLast(none);
}

singular function EnableMe()
{
    local int i;

    super.EnableMe();
    i = 0;
    J0x0d:
    // End:0x38 [While If]
    if(i < Controls.Length)
    {
        EnableComponent(Controls[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

singular function DisableMe()
{
    local int i;

    super.DisableMe();
    i = 0;
    J0x0d:
    // End:0x38 [While If]
    if(i < Controls.Length)
    {
        DisableComponent(Controls[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
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
    // End:0x55 [While If]
    if(i < Controls.Length)
    {
        Controls[i].SetVisibility(bIsVisible);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
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
    // End:0x58 [While If]
    if(i < Controls.Length)
    {
        Controls[i].Opened(Sender);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x24;
    }
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
    J0x2a:
    // End:0x64 [While If]
    if(i < Controls.Length)
    {
        Controls[i].Closed(Sender, bCancelled);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
}

event free()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < Controls.Length)
    {
        Controls[i].free();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Controls.Remove(0, Controls.Length);
    Components.Remove(0, Components.Length);
    FocusedControl = none;
    super.free();
}

event BeginAnimation(GUIComponent Animating)
{
    ++ AnimationCount;
    // End:0x1a
    if(AnimationCount > 0)
    {
        bAnimating = true;
    }
    // End:0x39
    if(MenuOwner != none)
    {
        MenuOwner.BeginAnimation(Animating);
    }
}

event EndAnimation(GUIComponent Animating, GUI.EAnimationType Type)
{
    -- AnimationCount;
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
}

function LevelChanged()
{
    local int i;

    super.LevelChanged();
    i = 0;
    J0x0d:
    // End:0x3c [While If]
    if(i < Controls.Length)
    {
        Controls[i].LevelChanged();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function CenterMouse()
{
    local int i;

    // End:0x1c
    if(FocusedControl != none)
    {
        FocusedControl.CenterMouse();
        return;
    }
    i = 0;
    J0x23:
    // End:0x6c [While If]
    if(i < Components.Length)
    {
        // End:0x62
        if(Components[i].CanAcceptFocus())
        {
            Components[i].CenterMouse();
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23;
    }
    super.CenterMouse();
}

function DebugTabOrder()
{
    local int i;

    CheckInvalidTabOrder();
    CheckDuplicateTabOrder();
    i = 0;
    J0x13:
    // End:0x42 [While If]
    if(i < Controls.Length)
    {
        Controls[i].DebugTabOrder();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
}

function CheckInvalidTabOrder()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x96 [While If]
    if(i < Components.Length)
    {
        // End:0x8c
        if(Components[i].TabOrder == -1)
        {
            Log(GetMenuPath() @ "Component[" $ string(i) $ "] (" $ Components[i].GetMenuPath() $ ") has no tab order assigned!");
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function CheckDuplicateTabOrder()
{
    local int i, j;
    local array<IntBox> TabOrders;
    local bool bDup;

    i = 0;
    J0x07:
    // End:0x1ae [While If]
    if(i < Components.Length)
    {
        bDup = false;
        // End:0x40
        if(Components[i].TabOrder == -1)
        {
        }
        // End:0x1a4
        else
        {
            j = 0;
            J0x47:
            // End:0x143 [While If]
            if(j < TabOrders.Length)
            {
                // End:0x139
                if(Components[i].TabOrder == TabOrders[j].X2)
                {
                    Log(GetMenuPath() @ "Dulicate tab order (" $ string(Components[i].TabOrder) $ ") - components " $ string(TabOrders[j].X1) $ " (" $ Components[TabOrders[j].X1].GetMenuPath() $ ") & " $ string(i) $ " (" $ Components[i].GetMenuPath() $ ")");
                    bDup = true;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x47;
            }
            // End:0x1a4
            if(!bDup)
            {
                j = TabOrders.Length;
                TabOrders.Length = j + 1;
                TabOrders[j].X1 = j;
                TabOrders[j].X2 = Components[i].TabOrder;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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
}

function TraversalApplyAWinPos()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < Components.Length)
    {
        Components[i].TraversalApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x3d:
    // End:0x6c [While If]
    if(i < Controls.Length)
    {
        Controls[i].TraversalApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
    ApplyAWinPos();
}

function bool RecursiveActiveOwner(GUIComponent checkComponent)
{
    local bool bActive;

    // End:0x1f
    if(Controller.ActivePage == none)
    {
        bActive = false;
    }
    // End:0x3b
    else
    {
        bActive = Controller.ActivePage == checkComponent;
    }
    // End:0x78
    if(bActive == false && checkComponent.MenuOwner != none)
    {
        bActive = RecursiveActiveOwner(checkComponent.MenuOwner);
    }
    return bActive;
}

defaultproperties
{
    bDrawFocusedLast=true
    bTabStop=true
}