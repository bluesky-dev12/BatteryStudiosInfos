/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIMultiOptionList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:37
 *
 *******************************************************************************/
class GUIMultiOptionList extends GUIVertList
    dependson(GUIVertList)
    native
    editinlinenew
    instanced;

var() editconstarray editconst array<editconst export editinline GUIMenuOption> Elements;
var() float ItemScaling;
var() float ItemPadding;
var() float ColumnWidth;
var() int NumColumns;
var() editconst int ItemsPerColumn;
var() bool bVerticalLayout;
var delegate<OnCreateComponent> __OnCreateComponent__Delegate;

delegate OnCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender);
function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIListBase).InitComponent(InController, inOwner);
    MyScrollBar.__AlignThumb__Delegate = ScrollAlignThumb;
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int NewIndex, i;
    local float X, Y;

    NewIndex = -1;
    // End:0x1cb
    if(IsInClientBounds())
    {
        X = ClientBounds[0];
        Y = ClientBounds[1];
        NewIndex = Top;
        // End:0x49
        if(bVerticalLayout)
        {
            i = 1;
        }
        J0x49:
        // End:0x1cb [While If]
        if(NewIndex < ItemCount)
        {
            // End:0x72
            if(!ElementVisible(NewIndex))
            {
                ++ NewIndex;
            }
            // End:0x1c8
            else
            {
                // End:0xe9
                if(Controller.MouseX >= X && Controller.MouseX <= X + ItemWidth && Controller.MouseY >= Y && Controller.MouseY <= Y + ItemHeight)
                {
                }
                // End:0x1cb
                else
                {
                    // End:0x184
                    if(bVerticalLayout)
                    {
                        NewIndex += ItemsPerColumn;
                        X += ItemWidth;
                        // End:0x181
                        if(NewIndex >= ItemCount)
                        {
                            X = ClientBounds[0];
                            Y += ItemHeight;
                            NewIndex = Top + ++ i;
                            // End:0x181
                            if(NewIndex >= Top + Min(ItemsPerPage, ItemCount) / NumColumns)
                            {
                                // End:0x17e
                                if(bRequireValidIndex)
                                {
                                    NewIndex = -1;
                                }
                            }
                            // End:0x1cb
                            else
                            {
                            }
                            // This is an implied JumpToken;
                            goto J0x1c1;
                        }
                        X += ItemWidth;
                        // End:0x1c1
                        if(++ i >= NumColumns)
                        {
                            i = 0;
                            X = ClientBounds[0];
                            Y += ItemHeight;
                        }
                        J0x1c1:
                        ++ NewIndex;
                    }
                    // This is an implied JumpToken; Continue!
                    goto J0x49;
                }
            }
        }
    }
    // End:0x1f0
    if(NewIndex >= ItemCount && bRequireValidIndex)
    {
        NewIndex = -1;
    }
    return Min(NewIndex, ItemCount - 1);
}

event bool ElementVisible(int idx)
{
    local int i;

    // End:0x62
    if(bVerticalLayout)
    {
        i = idx - ItemsPerColumn * idx / ItemsPerColumn;
        return i >= Top && i < Min(Top + ItemsPerPage / NumColumns, ItemCount - 1);
    }
    // End:0x87
    else
    {
        return idx >= Top && idx < Top + ItemsPerPage;
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x0d
    if(ItemsPerPage == 0)
    {
        return false;
    }
    NewIndex = CalculateIndex();
    // End:0x2b
    if(!IsValidIndex(NewIndex))
    {
        return false;
    }
    SilentSetIndex(NewIndex);
    // End:0x68
    if(GUIMenuOption(Sender) != none && !GUIMenuOption(Sender).MenuOptionClicked(Sender))
    {
        return true;
    }
    // End:0x7e
    if(Sender != self)
    {
        OnClick(self);
    }
    return true;
}

protected function GenerateMenuOption(out string NewOptionClass, out GUIMenuOption NewComp, out string Caption)
{
    local class<GUIMenuOption> MOClass;

    // End:0x57
    if(NewOptionClass == "" && NewComp == none)
    {
        Warn("Must specify a menu option class to add item to list!");
        return;
    }
    // End:0xeb
    else
    {
        // End:0xd5
        if(NewComp == none)
        {
            MOClass = class<GUIMenuOption>(Controller.AddComponentClass(NewOptionClass));
            // End:0xc3
            if(MOClass == none)
            {
                Warn("Could not create new menu option for list:" @ NewOptionClass);
                return;
            }
            NewComp = new (none) MOClass;
        }
        // End:0xeb
        else
        {
            NewOptionClass = string(NewComp.Class);
        }
    }
    // End:0x10e
    if(Caption != "")
    {
        NewComp.Caption = Caption;
    }
    // End:0x122
    else
    {
        Caption = NewComp.Caption;
    }
    NewComp.ComponentJustification = 0;
    NewComp.LabelJustification = 1;
    NewComp.bAutoSizeCaption = true;
    // End:0x17e
    if(NewComp.LabelStyleName == "")
    {
        NewComp.LabelStyleName = StyleName;
    }
    NewComp.__OnChange__Delegate = InternalOnChange;
    NewComp.bHeightFromComponent = false;
    OnCreateComponent(NewComp, self);
    NewComp.InitComponent(Controller, self);
    NewComp.__OnClick__Delegate = InternalOnClick;
}

function GUIMenuOption AddItem(string NewOptionClass, optional GUIMenuOption NewComp, optional string Caption, optional bool bUnique)
{
    local int i;

    // End:0x58
    if(Caption != "" && bUnique)
    {
        i = 0;
        J0x1e:
        // End:0x58 [While If]
        if(i < Elements.Length)
        {
            // End:0x4e
            if(Elements[i].Caption == Caption)
            {
                return none;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
    }
    GenerateMenuOption(NewOptionClass, NewComp, Caption);
    // End:0xb8
    if(NewComp != none)
    {
        Elements[Elements.Length] = NewComp;
        NewComp.Opened(self);
        // End:0xb8
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    ItemCount = Elements.Length;
    CheckLinkedObjects(self);
    return NewComp;
}

function GUIMenuOption ReplaceItem(int idx, string NewOptionClass, optional GUIMenuOption NewComp, optional string Caption, optional bool bUnique)
{
    local int i;

    // End:0x2c
    if(!ValidIndex(idx))
    {
        return AddItem(NewOptionClass, NewComp, Caption, bUnique);
    }
    // End:0x84
    if(Caption != "" && bUnique)
    {
        i = 0;
        J0x4a:
        // End:0x84 [While If]
        if(i < Elements.Length)
        {
            // End:0x7a
            if(Caption == Elements[i].Caption)
            {
                return none;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4a;
        }
    }
    GenerateMenuOption(NewOptionClass, NewComp, Caption);
    // End:0x12f
    if(NewComp != none)
    {
        // End:0x12f
        if(NewComp != Elements[Index])
        {
            NewComp.TabOrder = Elements[Index].TabOrder;
            Elements[Index].free();
            Elements[Index] = NewComp;
            NewComp.Opened(self);
            // End:0x12f
            if(Controller.bCurMenuInitialized)
            {
                OnChange(self);
            }
        }
    }
    return NewComp;
}

function GUIMenuOption InsertItem(int idx, string NewOptionClass, optional GUIMenuOption NewComp, optional string Caption, optional bool bUnique)
{
    local int i;

    // End:0x2c
    if(!ValidIndex(idx))
    {
        return AddItem(NewOptionClass, NewComp, Caption, bUnique);
    }
    // End:0x84
    if(Caption != "" && bUnique)
    {
        i = 0;
        J0x4a:
        // End:0x84 [While If]
        if(i < Elements.Length)
        {
            // End:0x7a
            if(Caption == Elements[i].Caption)
            {
                return none;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4a;
        }
    }
    GenerateMenuOption(NewOptionClass, NewComp, Caption);
    // End:0x14f
    if(NewComp != none)
    {
        NewComp.TabOrder = idx;
        Elements.Insert(idx, 1);
        Elements[idx] = NewComp;
        NewComp.Opened(self);
        J0xe5:
        // End:0x114 [While If]
        if(++ idx < Elements.Length)
        {
            Elements[idx].TabOrder = idx;
            // This is an implied JumpToken; Continue!
            goto J0xe5;
        }
        // End:0x132
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
        // End:0x14f
        if(Controller.bCurMenuInitialized)
        {
            OnChange(self);
        }
    }
    ItemCount = Elements.Length;
    return NewComp;
}

function RemoveItem(int idx)
{
    // End:0x87
    if(ValidIndex(idx))
    {
        Elements[idx].free();
        Elements.Remove(idx, 1);
        J0x2f:
        // End:0x5e [While If]
        if(idx < Elements.Length)
        {
            Elements[idx].TabOrder = ++ idx;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
        SetIndex(-1);
        // End:0x87
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    ItemCount = Elements.Length;
}

function Clear()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < Elements.Length)
    {
        Elements[i].free();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Elements.Remove(0, Elements.Length);
    super(GUIListBase).Clear();
}

event bool ValidIndex(int idx)
{
    // End:0x1f
    if(idx < 0 || idx >= Elements.Length)
    {
        return false;
    }
    return true;
}

function GUIMenuOption Get()
{
    // End:0x1a
    if(ValidIndex(Index))
    {
        return Elements[Index];
    }
    return none;
}

function GUIMenuOption GetItem(int idx)
{
    // End:0x1a
    if(ValidIndex(idx))
    {
        return Elements[idx];
    }
    return none;
}

function int Find(string Caption)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < Elements.Length)
    {
        // End:0x3b
        if(Elements[i].Caption ~= Caption)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindComp(GUIMenuOption Comp)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3c [While If]
    if(i < Elements.Length)
    {
        // End:0x32
        if(Elements[i] == Comp)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x43
    if(Controller.bCurMenuInitialized)
    {
        // End:0x38
        if(GUIMenuOption(Sender) != none)
        {
            SilentSetIndex(FindComp(GUIMenuOption(Sender)));
        }
        OnChange(self);
    }
}

function ShowList()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < Elements.Length)
    {
        Elements[i].Show();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function HideList()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < Elements.Length)
    {
        Elements[i].Hide();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int SetIndex(int NewIndex)
{
    // End:0x4f
    if(NewIndex == Index)
    {
        // End:0x49
        if(ValidIndex(NewIndex) && CanFocusElement(Elements[NewIndex]))
        {
            Elements[NewIndex].SetFocus(none);
        }
        return NewIndex;
    }
    // End:0x79
    if(NewIndex < 0 || NewIndex >= ItemCount)
    {
        Index = -1;
    }
    // End:0x84
    else
    {
        Index = NewIndex;
    }
    // End:0xb9
    if(Index >= 0 && ItemsPerPage > 0 && !ElementVisible(Index))
    {
        SetTopItem(Index);
    }
    IndexChanged(self);
    bNotify = true;
    // End:0x113
    if(ElementVisible(Index) && Index < ItemCount && CanFocusElement(Elements[NewIndex]))
    {
        Elements[Index].SetFocus(none);
    }
    return Index;
}

event SetFocus(GUIComponent Who)
{
    // End:0x14
    if(Who == none)
    {
        super(GUIComponent).SetFocus(none);
        return;
    }
    MenuStateChange(2);
    FocusInstead = Who;
    Index = FindComp(GUIMenuOption(Who));
    // End:0x58
    if(MenuOwner != none)
    {
        MenuOwner.SetFocus(self);
    }
}

event LoseFocus(GUIComponent Sender)
{
    // End:0x10
    if(bHotTrack)
    {
        FocusInstead = none;
    }
    super(GUIComponent).LoseFocus(Sender);
}

function ScrollAlignThumb()
{
    local float NewPos;

    // End:0x19
    if(ItemCount == 0)
    {
        NewPos = 0.0;
    }
    // End:0x68
    else
    {
        // End:0x4b
        if(bVerticalLayout)
        {
            NewPos = float(Top) / float(ItemsPerColumn) - float(ItemsPerPage / NumColumns);
        }
        // End:0x68
        else
        {
            NewPos = float(Top) / float(ItemCount - ItemsPerPage);
        }
    }
    MyScrollBar.GripPos = FClamp(NewPos, 0.0, 1.0);
}

function MakeVisible(float perc)
{
    local float MaxTop, ModResult;
    local int NewTop, Change;

    // End:0xaf
    if(!bVerticalLayout)
    {
        MaxTop = float(ItemCount - ItemsPerPage);
        ModResult = MaxTop % float(NumColumns);
        // End:0x5b
        if(ModResult > float(0))
        {
            MaxTop = MaxTop - ModResult + float(NumColumns);
        }
        NewTop = int(Round(MaxTop * perc));
        Change = int(Abs(float(Top - NewTop)));
        // End:0xac
        if(Change < NumColumns && perc < 1.0)
        {
            return;
        }
    }
    // End:0xe1
    else
    {
        MaxTop = float(ItemsPerColumn - ItemsPerPage / NumColumns);
        NewTop = int(Round(MaxTop * perc));
    }
    SetTopItem(NewTop);
}

function SetTopItem(int Item)
{
    local int ModResult;

    // End:0x4b
    if(bVerticalLayout)
    {
        J0x09:
        // End:0x27 [While If]
        if(Item > ItemsPerColumn)
        {
            Item -= ItemsPerColumn;
            // This is an implied JumpToken; Continue!
            goto J0x09;
        }
        Item = Clamp(Item, 0, ItemsPerColumn - ItemsPerPage / NumColumns);
    }
    // End:0xe4
    else
    {
        Item = Clamp(Item, 0, ItemCount - 1);
        ModResult = int(float(Item) % float(NumColumns));
        // End:0xab
        if(ModResult > 0)
        {
            // End:0x9f
            if(Item > Top)
            {
                Item += NumColumns;
            }
            Item -= ModResult;
        }
        J0xab:
        // End:0xe4 [While If]
        if(Item + ItemsPerPage > ItemCount + NumColumns && Item >= 0)
        {
            Item -= NumColumns;
            // This is an implied JumpToken; Continue!
            goto J0xab;
        }
    }
    Top = Max(0, Item);
    OnAdjustTop(self);
}

function InternalOnAdjustTop(GUIComponent Sender)
{
    // End:0x27
    if(!bHotTrack && !ElementVisible(Index))
    {
        FocusInstead = none;
    }
    // End:0x79
    else
    {
        // End:0x79
        if(bHotTrack && ElementVisible(Index) && Index < Elements.Length && CanFocusElement(Elements[Index]))
        {
            FocusInstead = Elements[Index];
        }
    }
}

function WheelDown()
{
    // End:0x53
    if(MyScrollBar != none)
    {
        // End:0x38
        if(Controller.CtrlPressed)
        {
            MyScrollBar.MoveGripBy(ItemsPerPage);
        }
        // End:0x50
        else
        {
            MyScrollBar.MoveGripBy(NumColumns);
        }
    }
    // End:0x76
    else
    {
        // End:0x70
        if(!Controller.CtrlPressed)
        {
            Down();
        }
        // End:0x76
        else
        {
            PgDn();
        }
    }
}

function PgUp()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    // End:0x36
    if(bVerticalLayout)
    {
        SetIndex(Max(0, Index - ItemsPerPage / NumColumns));
    }
    // End:0x3c
    else
    {
        super.PgUp();
    }
}

function PgDn()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    // End:0x3d
    if(bVerticalLayout)
    {
        SetIndex(Min(Index + ItemsPerPage / NumColumns, ItemCount - 1));
    }
    // End:0x43
    else
    {
        super.PgDn();
    }
}

function bool Up()
{
    local int NewIndex;

    // End:0xd0
    if(bVerticalLayout)
    {
        // End:0xb0
        if(Index > 0 && float(Index) % float(ItemsPerColumn) > float(0))
        {
            NewIndex = Index - 1;
            J0x3c:
            // End:0x83 [While If]
            if(NewIndex > 0 && !CanFocusElement(Elements[NewIndex]) && float(NewIndex) % float(ItemsPerColumn) > float(0))
            {
                -- NewIndex;
                // This is an implied JumpToken; Continue!
                goto J0x3c;
            }
            NewIndex = Max(0, NewIndex);
            // End:0xb0
            if(CanFocusElement(Elements[NewIndex]))
            {
                SetIndex(NewIndex);
            }
        }
        // End:0xce
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
        return true;
    }
    // End:0x15a
    if(Index - NumColumns >= 0)
    {
        NewIndex = Index - NumColumns;
        J0xf4:
        // End:0x12d [While If]
        if(NewIndex - NumColumns >= 0 && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex -= NumColumns;
            // This is an implied JumpToken; Continue!
            goto J0xf4;
        }
        NewIndex = Max(0, NewIndex);
        // End:0x15a
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
    }
    // End:0x178
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function bool Down()
{
    local int NewIndex;

    // End:0xdf
    if(bVerticalLayout)
    {
        NewIndex = Index + 1;
        // End:0xbf
        if(float(NewIndex) % float(ItemsPerColumn) > float(0) && NewIndex < ItemCount)
        {
            J0x40:
            // End:0x8b [While If]
            if(NewIndex < ItemCount && float(NewIndex) % float(ItemsPerColumn) > float(0) && !CanFocusElement(Elements[NewIndex]))
            {
                ++ NewIndex;
                // This is an implied JumpToken; Continue!
                goto J0x40;
            }
            NewIndex = Min(NewIndex, ItemCount - 1);
            // End:0xbf
            if(CanFocusElement(Elements[NewIndex]))
            {
                SetIndex(NewIndex);
            }
        }
        // End:0xdd
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
        return true;
    }
    // End:0x178
    if(Index + NumColumns < ItemCount)
    {
        NewIndex = Index + NumColumns;
        J0x107:
        // End:0x144 [While If]
        if(NewIndex + NumColumns < ItemCount && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex += NumColumns;
            // This is an implied JumpToken; Continue!
            goto J0x107;
        }
        NewIndex = Min(NewIndex, ItemCount - 1);
        // End:0x178
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
    }
    // End:0x196
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function bool MoveRight()
{
    local int NewIndex, Avail;

    // End:0xa6
    if(bVerticalLayout)
    {
        NewIndex = Index + ItemsPerColumn;
        // End:0x33
        if(Index + ItemsPerColumn >= ItemCount)
        {
            return true;
        }
        J0x33:
        // End:0x70 [While If]
        if(NewIndex + ItemsPerColumn < ItemCount && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex += ItemsPerColumn;
            // This is an implied JumpToken; Continue!
            goto J0x33;
        }
        NewIndex = Min(NewIndex, ItemCount - 1);
        // End:0xa4
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
        return true;
    }
    Avail = int(float(NumColumns) - float(Index) % float(NumColumns) - float(1));
    NewIndex = Index + 1;
    // End:0x182
    if(Avail > 0 && NewIndex < ItemCount && ItemCount > 0)
    {
        J0x103:
        // End:0x14c [While If]
        if(NewIndex - Index <= Avail && NewIndex < ItemCount && !CanFocusElement(Elements[NewIndex]))
        {
            ++ NewIndex;
            // This is an implied JumpToken; Continue!
            goto J0x103;
        }
        NewIndex = Min(NewIndex, ItemCount - 1);
        // End:0x180
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
        return true;
    }
    return true;
}

function bool MoveLeft()
{
    local int NewIndex, Avail;

    // End:0x90
    if(bVerticalLayout)
    {
        NewIndex = Index - ItemsPerColumn;
        // End:0x28
        if(NewIndex < 0)
        {
            return true;
        }
        J0x28:
        // End:0x61 [While If]
        if(NewIndex - ItemsPerColumn >= 0 && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex -= ItemsPerColumn;
            // This is an implied JumpToken; Continue!
            goto J0x28;
        }
        NewIndex = Max(0, NewIndex);
        // End:0x8e
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
        return true;
    }
    Avail = int(float(Index) % float(NumColumns));
    // End:0x14f
    if(Avail > 0 && Index > 0 && ItemCount > 0)
    {
        NewIndex = Index - 1;
        J0xdb:
        // End:0x120 [While If]
        if(Index - NewIndex <= Avail && NewIndex > 0 && !CanFocusElement(Elements[NewIndex]))
        {
            -- NewIndex;
            // This is an implied JumpToken; Continue!
            goto J0xdb;
        }
        NewIndex = Max(0, NewIndex);
        // End:0x14d
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
        return true;
    }
    return true;
}

event bool NextControl(GUIComponent Sender)
{
    // End:0x77
    if(Controller.CtrlPressed || Controller.AltPressed || Controller.ShiftPressed || ItemCount > 1 && Index == ItemCount - 1)
    {
        // End:0x77
        if(MenuOwner != none)
        {
            return MenuOwner.NextControl(self);
        }
    }
    // End:0x87
    if(bVerticalLayout)
    {
        return Down();
    }
    return MoveRight();
}

event bool PrevControl(GUIComponent Sender)
{
    // End:0x70
    if(Controller.CtrlPressed || Controller.AltPressed || Controller.ShiftPressed || ItemCount > 1 && Index <= 0)
    {
        // End:0x70
        if(MenuOwner != none)
        {
            return MenuOwner.PrevControl(self);
        }
    }
    // End:0x83
    if(bVerticalLayout)
    {
        return Up();
    }
    // End:0x8a
    else
    {
        return MoveLeft();
    }
}

protected event bool CanFocusElement(GUIMenuOption elem)
{
    return elem != none && elem.MenuState != 4 && GUIListSpacer(elem) == none;
}

function CenterMouse()
{
    local export editinline GUIMenuOption Mo;

    Mo = Get();
    // End:0x2b
    if(CanFocusElement(Mo))
    {
        Mo.CenterMouse();
        return;
    }
    super.CenterMouse();
}

defaultproperties
{
    ItemScaling=0.0450
    ItemPadding=0.10
    ColumnWidth=1.0
    NumColumns=1
    OnAdjustTop=InternalOnAdjustTop
}