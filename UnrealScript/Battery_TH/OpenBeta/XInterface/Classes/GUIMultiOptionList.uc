class GUIMultiOptionList extends GUIVertList
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
//var delegate<OnCreateComponent> __OnCreateComponent__Delegate;

delegate OnCreateComponent(GUIMenuOption NewComp, GUIMultiOptionList Sender)
{
    //return;    
}

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIListBase).InitComponent(InController, inOwner);
    MyScrollBar.__AlignThumb__Delegate = ScrollAlignThumb;
    //return;    
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int NewIndex, i;
    local float X, Y;

    NewIndex = -1;
    // End:0x1CB
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

        // End:0x1CB [Loop If]
        if(NewIndex < ItemCount)
        {
            // End:0x72
            if(!ElementVisible(NewIndex))
            {
                NewIndex++;                
            }
            else
            {
                // End:0xE9
                if((((Controller.MouseX >= X) && Controller.MouseX <= (X + ItemWidth)) && Controller.MouseY >= Y) && Controller.MouseY <= (Y + ItemHeight))
                {
                    // [Explicit Break]
                    goto J0x1CB;
                }
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
                        NewIndex = Top + i++;
                        // End:0x181
                        if(NewIndex >= (Top + (Min(ItemsPerPage, ItemCount) / NumColumns)))
                        {
                            // End:0x17E
                            if(bRequireValidIndex)
                            {
                                NewIndex = -1;
                            }
                            // [Explicit Break]
                            goto J0x1CB;
                        }
                    }
                    // [Explicit Continue]
                    goto J0x1C1;
                }
                X += ItemWidth;
                // End:0x1C1
                if(++i >= NumColumns)
                {
                    i = 0;
                    X = ClientBounds[0];
                    Y += ItemHeight;
                }
                J0x1C1:

                NewIndex++;
            }
            // [Loop Continue]
            goto J0x49;
        }
    }
    J0x1CB:

    // End:0x1F0
    if((NewIndex >= ItemCount) && bRequireValidIndex)
    {
        NewIndex = -1;
    }
    return Min(NewIndex, ItemCount - 1);
    //return;    
}

event bool ElementVisible(int idx)
{
    local int i;

    // End:0x62
    if(bVerticalLayout)
    {
        i = idx - (ItemsPerColumn * (idx / ItemsPerColumn));
        return (i >= Top) && i < Min(Top + (ItemsPerPage / NumColumns), ItemCount - 1);        
    }
    else
    {
        return (idx >= Top) && idx < (Top + ItemsPerPage);
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x0D
    if(ItemsPerPage == 0)
    {
        return false;
    }
    NewIndex = CalculateIndex();
    // End:0x2B
    if(!IsValidIndex(NewIndex))
    {
        return false;
    }
    SilentSetIndex(NewIndex);
    // End:0x68
    if((GUIMenuOption(Sender) != none) && !GUIMenuOption(Sender).MenuOptionClicked(Sender))
    {
        return true;
    }
    // End:0x7E
    if(Sender != self)
    {
        OnClick(self);
    }
    return true;
    //return;    
}

protected function GenerateMenuOption(out string NewOptionClass, out GUIMenuOption NewComp, out string Caption)
{
    local Class<GUIMenuOption> MOClass;

    // End:0x57
    if((NewOptionClass == "") && NewComp == none)
    {
        Warn("Must specify a menu option class to add item to list!");
        return;        
    }
    else
    {
        // End:0xD5
        if(NewComp == none)
        {
            MOClass = Class<GUIMenuOption>(Controller.AddComponentClass(NewOptionClass));
            // End:0xC3
            if(MOClass == none)
            {
                Warn("Could not create new menu option for list:" @ NewOptionClass);
                return;
            }
            NewComp = new (none) MOClass;            
        }
        else
        {
            NewOptionClass = string(NewComp.Class);
        }
    }
    // End:0x10E
    if(Caption != "")
    {
        NewComp.Caption = Caption;        
    }
    else
    {
        Caption = NewComp.Caption;
    }
    NewComp.ComponentJustification = 0;
    NewComp.LabelJustification = 1;
    NewComp.bAutoSizeCaption = true;
    // End:0x17E
    if(NewComp.LabelStyleName == "")
    {
        NewComp.LabelStyleName = StyleName;
    }
    NewComp.__OnChange__Delegate = InternalOnChange;
    NewComp.bHeightFromComponent = false;
    OnCreateComponent(NewComp, self);
    NewComp.InitComponent(Controller, self);
    NewComp.__OnClick__Delegate = InternalOnClick;
    //return;    
}

function GUIMenuOption AddItem(string NewOptionClass, optional GUIMenuOption NewComp, optional string Caption, optional bool bUnique)
{
    local int i;

    // End:0x58
    if((Caption != "") && bUnique)
    {
        i = 0;
        J0x1E:

        // End:0x58 [Loop If]
        if(i < Elements.Length)
        {
            // End:0x4E
            if(Elements[i].Caption == Caption)
            {
                return none;
            }
            i++;
            // [Loop Continue]
            goto J0x1E;
        }
    }
    GenerateMenuOption(NewOptionClass, NewComp, Caption);
    // End:0xB8
    if(NewComp != none)
    {
        Elements[Elements.Length] = NewComp;
        NewComp.Opened(self);
        // End:0xB8
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    ItemCount = Elements.Length;
    CheckLinkedObjects(self);
    return NewComp;
    //return;    
}

function GUIMenuOption ReplaceItem(int idx, string NewOptionClass, optional GUIMenuOption NewComp, optional string Caption, optional bool bUnique)
{
    local int i;

    // End:0x2C
    if(!ValidIndex(idx))
    {
        return AddItem(NewOptionClass, NewComp, Caption, bUnique);
    }
    // End:0x84
    if((Caption != "") && bUnique)
    {
        i = 0;
        J0x4A:

        // End:0x84 [Loop If]
        if(i < Elements.Length)
        {
            // End:0x7A
            if(Caption == Elements[i].Caption)
            {
                return none;
            }
            i++;
            // [Loop Continue]
            goto J0x4A;
        }
    }
    GenerateMenuOption(NewOptionClass, NewComp, Caption);
    // End:0x12F
    if(NewComp != none)
    {
        // End:0x12F
        if(NewComp != Elements[Index])
        {
            NewComp.TabOrder = Elements[Index].TabOrder;
            Elements[Index].free();
            Elements[Index] = NewComp;
            NewComp.Opened(self);
            // End:0x12F
            if(Controller.bCurMenuInitialized)
            {
                OnChange(self);
            }
        }
    }
    return NewComp;
    //return;    
}

function GUIMenuOption InsertItem(int idx, string NewOptionClass, optional GUIMenuOption NewComp, optional string Caption, optional bool bUnique)
{
    local int i;

    // End:0x2C
    if(!ValidIndex(idx))
    {
        return AddItem(NewOptionClass, NewComp, Caption, bUnique);
    }
    // End:0x84
    if((Caption != "") && bUnique)
    {
        i = 0;
        J0x4A:

        // End:0x84 [Loop If]
        if(i < Elements.Length)
        {
            // End:0x7A
            if(Caption == Elements[i].Caption)
            {
                return none;
            }
            i++;
            // [Loop Continue]
            goto J0x4A;
        }
    }
    GenerateMenuOption(NewOptionClass, NewComp, Caption);
    // End:0x14F
    if(NewComp != none)
    {
        NewComp.TabOrder = idx;
        Elements.Insert(idx, 1);
        Elements[idx] = NewComp;
        NewComp.Opened(self);
        J0xE5:

        // End:0x114 [Loop If]
        if(++idx < Elements.Length)
        {
            Elements[idx].TabOrder = idx;
            // [Loop Continue]
            goto J0xE5;
        }
        // End:0x132
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
        // End:0x14F
        if(Controller.bCurMenuInitialized)
        {
            OnChange(self);
        }
    }
    ItemCount = Elements.Length;
    return NewComp;
    //return;    
}

function RemoveItem(int idx)
{
    // End:0x87
    if(ValidIndex(idx))
    {
        Elements[idx].free();
        Elements.Remove(idx, 1);
        J0x2F:

        // End:0x5E [Loop If]
        if(idx < Elements.Length)
        {
            Elements[idx].TabOrder = idx++;
            // [Loop Continue]
            goto J0x2F;
        }
        SetIndex(-1);
        // End:0x87
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    ItemCount = Elements.Length;
    //return;    
}

function Clear()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < Elements.Length)
    {
        Elements[i].free();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Elements.Remove(0, Elements.Length);
    super(GUIListBase).Clear();
    //return;    
}

event bool ValidIndex(int idx)
{
    // End:0x1F
    if((idx < 0) || idx >= Elements.Length)
    {
        return false;
    }
    return true;
    //return;    
}

function GUIMenuOption Get()
{
    // End:0x1A
    if(ValidIndex(Index))
    {
        return Elements[Index];
    }
    return none;
    //return;    
}

function GUIMenuOption GetItem(int idx)
{
    // End:0x1A
    if(ValidIndex(idx))
    {
        return Elements[idx];
    }
    return none;
    //return;    
}

function int Find(string Caption)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x3B
        if(Elements[i].Caption ~= Caption)
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

function int FindComp(GUIMenuOption Comp)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(i < Elements.Length)
    {
        // End:0x32
        if(Elements[i] == Comp)
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
    //return;    
}

function ShowList()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < Elements.Length)
    {
        Elements[i].Show();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function HideList()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < Elements.Length)
    {
        Elements[i].Hide();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function int SetIndex(int NewIndex)
{
    // End:0x4F
    if(NewIndex == Index)
    {
        // End:0x49
        if((ValidIndex(NewIndex)) && CanFocusElement(Elements[NewIndex]))
        {
            Elements[NewIndex].SetFocus(none);
        }
        return NewIndex;
    }
    // End:0x79
    if((NewIndex < 0) || NewIndex >= ItemCount)
    {
        Index = -1;        
    }
    else
    {
        Index = NewIndex;
    }
    // End:0xB9
    if(((Index >= 0) && ItemsPerPage > 0) && !ElementVisible(Index))
    {
        SetTopItem(Index);
    }
    IndexChanged(self);
    bNotify = true;
    // End:0x113
    if(((ElementVisible(Index)) && Index < ItemCount) && CanFocusElement(Elements[NewIndex]))
    {
        Elements[Index].SetFocus(none);
    }
    return Index;
    //return;    
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
    //return;    
}

event LoseFocus(GUIComponent Sender)
{
    // End:0x10
    if(bHotTrack)
    {
        FocusInstead = none;
    }
    super(GUIComponent).LoseFocus(Sender);
    //return;    
}

function ScrollAlignThumb()
{
    local float NewPos;

    // End:0x19
    if(ItemCount == 0)
    {
        NewPos = 0.0000000;        
    }
    else
    {
        // End:0x4B
        if(bVerticalLayout)
        {
            NewPos = float(Top) / (float(ItemsPerColumn) - float(ItemsPerPage / NumColumns));            
        }
        else
        {
            NewPos = float(Top) / float(ItemCount - ItemsPerPage);
        }
    }
    MyScrollBar.GripPos = FClamp(NewPos, 0.0000000, 1.0000000);
    //return;    
}

function MakeVisible(float perc)
{
    local float MaxTop, ModResult;
    local int NewTop, Change;

    // End:0xAF
    if(!bVerticalLayout)
    {
        MaxTop = float(ItemCount - ItemsPerPage);
        ModResult = MaxTop % float(NumColumns);
        // End:0x5B
        if(ModResult > float(0))
        {
            MaxTop = (MaxTop - ModResult) + float(NumColumns);
        }
        NewTop = int(Round(MaxTop * perc));
        Change = int(Abs(float(Top - NewTop)));
        // End:0xAC
        if((Change < NumColumns) && perc < 1.0000000)
        {
            return;
        }        
    }
    else
    {
        MaxTop = float(ItemsPerColumn - (ItemsPerPage / NumColumns));
        NewTop = int(Round(MaxTop * perc));
    }
    SetTopItem(NewTop);
    //return;    
}

function SetTopItem(int Item)
{
    local int ModResult;

    // End:0x4B
    if(bVerticalLayout)
    {
        J0x09:

        // End:0x27 [Loop If]
        if(Item > ItemsPerColumn)
        {
            Item -= ItemsPerColumn;
            // [Loop Continue]
            goto J0x09;
        }
        Item = Clamp(Item, 0, ItemsPerColumn - (ItemsPerPage / NumColumns));        
    }
    else
    {
        Item = Clamp(Item, 0, ItemCount - 1);
        ModResult = int(float(Item) % float(NumColumns));
        // End:0xAB
        if(ModResult > 0)
        {
            // End:0x9F
            if(Item > Top)
            {
                Item += NumColumns;
            }
            Item -= ModResult;
        }
        J0xAB:

        // End:0xE4 [Loop If]
        if(((Item + ItemsPerPage) > (ItemCount + NumColumns)) && Item >= 0)
        {
            Item -= NumColumns;
            // [Loop Continue]
            goto J0xAB;
        }
    }
    Top = Max(0, Item);
    OnAdjustTop(self);
    //return;    
}

function InternalOnAdjustTop(GUIComponent Sender)
{
    // End:0x27
    if(!bHotTrack && !ElementVisible(Index))
    {
        FocusInstead = none;        
    }
    else
    {
        // End:0x79
        if(((bHotTrack && ElementVisible(Index)) && Index < Elements.Length) && CanFocusElement(Elements[Index]))
        {
            FocusInstead = Elements[Index];
        }
    }
    //return;    
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
        else
        {
            MyScrollBar.MoveGripBy(NumColumns);
        }        
    }
    else
    {
        // End:0x70
        if(!Controller.CtrlPressed)
        {
            Down();            
        }
        else
        {
            PgDn();
        }
    }
    //return;    
}

function PgUp()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    // End:0x36
    if(bVerticalLayout)
    {
        SetIndex(Max(0, Index - (ItemsPerPage / NumColumns)));        
    }
    else
    {
        super.PgUp();
    }
    //return;    
}

function PgDn()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    // End:0x3D
    if(bVerticalLayout)
    {
        SetIndex(Min(Index + (ItemsPerPage / NumColumns), ItemCount - 1));        
    }
    else
    {
        super.PgDn();
    }
    //return;    
}

function bool Up()
{
    local int NewIndex;

    // End:0xD0
    if(bVerticalLayout)
    {
        // End:0xB0
        if((Index > 0) && (float(Index) % float(ItemsPerColumn)) > float(0))
        {
            NewIndex = Index - 1;
            J0x3C:

            // End:0x83 [Loop If]
            if(((NewIndex > 0) && !CanFocusElement(Elements[NewIndex])) && (float(NewIndex) % float(ItemsPerColumn)) > float(0))
            {
                NewIndex--;
                // [Loop Continue]
                goto J0x3C;
            }
            NewIndex = Max(0, NewIndex);
            // End:0xB0
            if(CanFocusElement(Elements[NewIndex]))
            {
                SetIndex(NewIndex);
            }
        }
        // End:0xCE
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
        return true;
    }
    // End:0x15A
    if((Index - NumColumns) >= 0)
    {
        NewIndex = Index - NumColumns;
        J0xF4:

        // End:0x12D [Loop If]
        if(((NewIndex - NumColumns) >= 0) && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex -= NumColumns;
            // [Loop Continue]
            goto J0xF4;
        }
        NewIndex = Max(0, NewIndex);
        // End:0x15A
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
    //return;    
}

function bool Down()
{
    local int NewIndex;

    // End:0xDF
    if(bVerticalLayout)
    {
        NewIndex = Index + 1;
        // End:0xBF
        if(((float(NewIndex) % float(ItemsPerColumn)) > float(0)) && NewIndex < ItemCount)
        {
            J0x40:

            // End:0x8B [Loop If]
            if(((NewIndex < ItemCount) && (float(NewIndex) % float(ItemsPerColumn)) > float(0)) && !CanFocusElement(Elements[NewIndex]))
            {
                NewIndex++;
                // [Loop Continue]
                goto J0x40;
            }
            NewIndex = Min(NewIndex, ItemCount - 1);
            // End:0xBF
            if(CanFocusElement(Elements[NewIndex]))
            {
                SetIndex(NewIndex);
            }
        }
        // End:0xDD
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
        return true;
    }
    // End:0x178
    if((Index + NumColumns) < ItemCount)
    {
        NewIndex = Index + NumColumns;
        J0x107:

        // End:0x144 [Loop If]
        if(((NewIndex + NumColumns) < ItemCount) && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex += NumColumns;
            // [Loop Continue]
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
    //return;    
}

function bool MoveRight()
{
    local int NewIndex, Avail;

    // End:0xA6
    if(bVerticalLayout)
    {
        NewIndex = Index + ItemsPerColumn;
        // End:0x33
        if((Index + ItemsPerColumn) >= ItemCount)
        {
            return true;
        }
        J0x33:

        // End:0x70 [Loop If]
        if(((NewIndex + ItemsPerColumn) < ItemCount) && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex += ItemsPerColumn;
            // [Loop Continue]
            goto J0x33;
        }
        NewIndex = Min(NewIndex, ItemCount - 1);
        // End:0xA4
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
        return true;
    }
    Avail = int((float(NumColumns) - (float(Index) % float(NumColumns))) - float(1));
    NewIndex = Index + 1;
    // End:0x182
    if(((Avail > 0) && NewIndex < ItemCount) && ItemCount > 0)
    {
        J0x103:

        // End:0x14C [Loop If]
        if((((NewIndex - Index) <= Avail) && NewIndex < ItemCount) && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex++;
            // [Loop Continue]
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
    //return;    
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

        // End:0x61 [Loop If]
        if(((NewIndex - ItemsPerColumn) >= 0) && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex -= ItemsPerColumn;
            // [Loop Continue]
            goto J0x28;
        }
        NewIndex = Max(0, NewIndex);
        // End:0x8E
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
        return true;
    }
    Avail = int(float(Index) % float(NumColumns));
    // End:0x14F
    if(((Avail > 0) && Index > 0) && ItemCount > 0)
    {
        NewIndex = Index - 1;
        J0xDB:

        // End:0x120 [Loop If]
        if((((Index - NewIndex) <= Avail) && NewIndex > 0) && !CanFocusElement(Elements[NewIndex]))
        {
            NewIndex--;
            // [Loop Continue]
            goto J0xDB;
        }
        NewIndex = Max(0, NewIndex);
        // End:0x14D
        if(CanFocusElement(Elements[NewIndex]))
        {
            SetIndex(NewIndex);
        }
        return true;
    }
    return true;
    //return;    
}

event bool NextControl(GUIComponent Sender)
{
    // End:0x77
    if(((Controller.CtrlPressed || Controller.AltPressed) || Controller.ShiftPressed) || (ItemCount > 1) && Index == (ItemCount - 1))
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
    //return;    
}

event bool PrevControl(GUIComponent Sender)
{
    // End:0x70
    if(((Controller.CtrlPressed || Controller.AltPressed) || Controller.ShiftPressed) || (ItemCount > 1) && Index <= 0)
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
    else
    {
        return MoveLeft();
    }
    //return;    
}

protected event bool CanFocusElement(GUIMenuOption elem)
{
    return ((elem != none) && int(elem.MenuState) != int(4)) && GUIListSpacer(elem) == none;
    //return;    
}

function CenterMouse()
{
    local export editinline GUIMenuOption Mo;

    Mo = Get();
    // End:0x2B
    if(CanFocusElement(Mo))
    {
        Mo.CenterMouse();
        return;
    }
    super.CenterMouse();
    //return;    
}

defaultproperties
{
    ItemScaling=0.0450000
    ItemPadding=0.1000000
    ColumnWidth=1.0000000
    NumColumns=1
    OnAdjustTop=GUIMultiOptionList.InternalOnAdjustTop
}