class GUIVertImageList extends GUIVertList
    native
    editinlinenew
    instanced;

var() GUI.eCellStyle CellStyle;
var() float ImageScale;
var() int NoVisibleRows;
var() int NoVisibleCols;
var() int HorzBorder;
var() int VertBorder;
var() editconstarray editconst array<editconst ImageListElem> Elements;
var() editconstarray editconst array<editconst ImageListElem> SelectedElements;
var() Material LockedMat;
var bool CallDrawItemForPlaceHoldingItemsInFixedCountCellStyle;
var float LastValidClickTime;
//var delegate<OnItemDblClick> __OnItemDblClick__Delegate;
//var delegate<OnIsSelectibleIndex> __OnIsSelectibleIndex__Delegate;

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, HitCol, HitRow;

    HitCol = int(float(int(Controller.MouseX - ClientBounds[0])) / ItemWidth);
    HitRow = int(float(int(Controller.MouseY - ClientBounds[1])) / ItemHeight);
    i = (Top + HitCol) + (HitRow * NoVisibleCols);
    // End:0xA1
    if(((i < 0) || i >= ItemCount) && bRequireValidIndex)
    {
        return -1;
    }
    return i;
    //return;    
}

delegate bool OnItemDblClick(GUIComponent Sender)
{
    //return;    
}

delegate bool OnIsSelectibleIndex(GUIComponent Sender, int Index)
{
    return true;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x1A
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return false;
    }
    NewIndex = CalculateIndex();
    // End:0x38
    if(!IsValidIndex(NewIndex))
    {
        return false;
    }
    // End:0x4F
    if(!OnIsSelectibleIndex(self, NewIndex))
    {
        return false;
    }
    SetIndex(NewIndex);
    // End:0xBF
    if(((Index == NewIndex) && LastValidClickTime != float(0)) && (Controller.ViewportOwner.Actor.Level.TimeSeconds - LastValidClickTime) < 0.0100000)
    {
        OnItemDblClick(self);
    }
    LastValidClickTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    return true;
    //return;    
}

function int SetIndex(int NewIndex)
{
    // End:0x29
    if((NewIndex >= 0) && Elements[NewIndex].Locked == 1)
    {
        return Index;
    }
    return super(GUIListBase).SetIndex(NewIndex);
    //return;    
}

function bool Up()
{
    local int TargetIndex;

    // End:0x14
    if((Index - NoVisibleCols) < 0)
    {
        return true;
    }
    TargetIndex = Index - NoVisibleCols;
    // End:0x73
    if(Elements[TargetIndex].Locked == 1)
    {
        TargetIndex = TargetIndex - NoVisibleCols;
        // End:0x73
        if((TargetIndex < 0) || Elements[TargetIndex].Locked == 1)
        {
            return true;
        }
    }
    SetIndex(TargetIndex);
    // End:0x9C
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
    //return;    
}

function bool Down()
{
    local int TargetIndex;

    // End:0x18
    if((Index + NoVisibleCols) >= ItemCount)
    {
        return true;
    }
    TargetIndex = Index + NoVisibleCols;
    // End:0x7B
    if(Elements[TargetIndex].Locked == 1)
    {
        TargetIndex = TargetIndex + NoVisibleCols;
        // End:0x7B
        if((TargetIndex >= ItemCount) || Elements[TargetIndex].Locked == 1)
        {
            return true;
        }
    }
    SetIndex(TargetIndex);
    // End:0xA4
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
    //return;    
}

function bool MoveRight()
{
    local int TargetIndex;

    TargetIndex = Index + 1;
    // End:0x28
    if((float(TargetIndex) % float(NoVisibleCols)) == float(0))
    {
        return true;
    }
    // End:0x77
    if(Elements[TargetIndex].Locked == 1)
    {
        TargetIndex++;
        // End:0x77
        if(((float(TargetIndex) % float(NoVisibleCols)) == float(0)) || Elements[TargetIndex].Locked == 1)
        {
            return true;
        }
    }
    // End:0x91
    if(TargetIndex < ItemCount)
    {
        SetIndex(TargetIndex);
    }
    return true;
    //return;    
}

function bool MoveLeft()
{
    local int TargetIndex;

    // End:0x1A
    if((float(Index) % float(NoVisibleCols)) == float(0))
    {
        return true;
    }
    TargetIndex = Index - 1;
    // End:0x8B
    if(Elements[TargetIndex].Locked == 1)
    {
        TargetIndex--;
        // End:0x8B
        if(((TargetIndex < 0) || (float(TargetIndex) % float(NoVisibleCols)) == float(NoVisibleCols - 1)) || Elements[TargetIndex].Locked == 1)
        {
            return true;
        }
    }
    // End:0xA1
    if(Index > 0)
    {
        SetIndex(TargetIndex);
    }
    return true;
    //return;    
}

function home()
{
    local int i;

    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    i = 0;
    J0x15:

    // End:0x6F [Loop If]
    if(i < Index)
    {
        // End:0x65
        if(Elements[i].Locked != 1)
        {
            SetIndex(i);
            // End:0x63
            if(MyScrollBar != none)
            {
                MyScrollBar.AlignThumb();
            }
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    //return;    
}

function End()
{
    local int i;

    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    i = ItemCount - 1;
    J0x1C:

    // End:0x72 [Loop If]
    if(i > 0)
    {
        // End:0x68
        if(Elements[i].Locked != 1)
        {
            SetIndex(i);
            // End:0x66
            if(MyScrollBar != none)
            {
                MyScrollBar.AlignThumb();
            }
            return;
        }
        i--;
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function PgUp()
{
    local int NewTop;

    // End:0x49
    if(Top > 0)
    {
        NewTop = Max(0, Top - NoVisibleRows);
        SetTopItem(NewTop);
        // End:0x49
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    return;
    //return;    
}

function PgDn()
{
    local int NewTop;

    // End:0x5B
    if(Top < ((ItemCount / NoVisibleCols) - NoVisibleRows))
    {
        NewTop = Max(0, Top + NoVisibleRows);
        SetTopItem(NewTop);
        // End:0x5B
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    return;
    //return;    
}

function MakeVisible(float perc)
{
    local float MaxTop, ModResult;
    local int NewTop, Change;

    MaxTop = float(ItemCount - ItemsPerPage);
    ModResult = MaxTop % float(NoVisibleCols);
    // End:0x50
    if(ModResult > float(0))
    {
        MaxTop = (MaxTop - ModResult) + float(NoVisibleCols);
    }
    NewTop = int(Round(MaxTop * perc));
    Change = int(Abs(float(Top - NewTop)));
    // End:0xA1
    if((Change < NoVisibleCols) && perc < 1.0000000)
    {
        return;
    }
    SetTopItem(NewTop);
    //return;    
}

function SetTopItem(int Item)
{
    local int ModResult;

    Item = Clamp(Item, 0, ItemCount - 1);
    ModResult = int(float(Item) % float(NoVisibleCols));
    // End:0x60
    if(ModResult > 0)
    {
        // End:0x54
        if(Item > Top)
        {
            Item += NoVisibleCols;
        }
        Item -= ModResult;
    }
    J0x60:

    // End:0x99 [Loop If]
    if(((Item + ItemsPerPage) > (ItemCount + NoVisibleCols)) && Item >= 0)
    {
        Item -= NoVisibleCols;
        // [Loop Continue]
        goto J0x60;
    }
    Top = Max(0, Item);
    // End:0xC5
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    OnAdjustTop(self);
    //return;    
}

function Add(Material Image, optional int Item, optional int Locked)
{
    local int i;

    // End:0x1A
    if((Image == none) && !bAllowEmptyItems)
    {
        return;
    }
    i = Elements.Length;
    Elements.Length = i + 1;
    Elements[i].Image = Image;
    Elements[i].Item = Item;
    Elements[i].Locked = Locked;
    ItemCount = Elements.Length;
    // End:0xA3
    if((ItemCount == 1) && bInitializeList)
    {
        SetIndex(0);        
    }
    else
    {
        CheckLinkedObjects(self);
    }
    // End:0xCC
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function AddImage(ImageListElem NewElem, optional int Locked)
{
    Add(NewElem.Image, NewElem.Item, Locked);
    //return;    
}

function Replace(int i, Material NewImage, optional int NewItem, optional int Locked)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(NewImage, NewItem);        
    }
    else
    {
        // End:0x3D
        if(!bAllowEmptyItems && NewImage == none)
        {
            return;
        }
        Elements[i].Item = NewItem;
        Elements[i].Image = NewImage;
        Elements[i].Locked = Locked;
        SetIndex(Index);
        // End:0xA8
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    //return;    
}

function Insert(int i, Material NewImage, optional int NewItem, optional int Locked)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(NewImage, NewItem);        
    }
    else
    {
        // End:0x3D
        if(!bAllowEmptyItems && NewImage == none)
        {
            return;
        }
        Elements.Insert(i, 1);
        Elements[i].Item = NewItem;
        Elements[i].Image = NewImage;
        Elements[i].Locked = Locked;
        ItemCount = Elements.Length;
        SetIndex(Index);
        // End:0xC0
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    //return;    
}

function InsertElement(int i, ImageListElem NewElem, optional int Locked)
{
    Insert(i, NewElem.Image, NewElem.Item, Locked);
    //return;    
}

event Swap(int IndexA, int IndexB)
{
    local ImageListElem elem;

    // End:0x57
    if((IsValidIndex(IndexA)) && IsValidIndex(IndexB))
    {
        elem = Elements[IndexA];
        Elements[IndexA] = Elements[IndexB];
        Elements[IndexB] = elem;
    }
    //return;    
}

function LoadFrom(GUIVertImageList Source, optional bool bClearFirst)
{
    local int i, Item;
    local Material mat;
    local int L;

    // End:0x0F
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:

    // End:0x70 [Loop If]
    if(i < Source.ItemCount)
    {
        Source.GetAtIndex(i, mat, Item, L);
        Add(mat, Item, L);
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    //return;    
}

function int Remove(int i, optional int Count)
{
    Count = Max(Count, 1);
    // End:0x24
    if(!IsValidIndex(i))
    {
        return Index;
    }
    Elements.Remove(i, Min(Count, Elements.Length - i));
    ItemCount = Elements.Length;
    SetIndex(Index);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return Index;
    //return;    
}

function int RemoveSilent(int i, optional int Count)
{
    bNotify = false;
    i = Remove(i, Count);
    bNotify = true;
    return i;
    //return;    
}

function int RemoveElement(ImageListElem elem, optional int Count)
{
    local int i;

    Count = Max(Count, 1);
    i = 0;
    J0x15:

    // End:0x69 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x5F
        if(Elements[i] == elem)
        {
            Elements.Remove(i, Min(Count, Elements.Length - i));
            // [Explicit Break]
            goto J0x69;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    J0x69:

    ItemCount = Elements.Length;
    SetIndex(Index);
    // End:0x9E
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return Index;
    //return;    
}

function Clear()
{
    // End:0x0D
    if(ItemCount == 0)
    {
        return;
    }
    Elements.Remove(0, Elements.Length);
    super(GUIListBase).Clear();
    //return;    
}

function Material Get(optional bool bGuarantee)
{
    // End:0x30
    if(!IsValid())
    {
        // End:0x2E
        if(bGuarantee && ItemCount > 0)
        {
            return Elements[0].Image;
        }
        return none;
    }
    return Elements[Index].Image;
    //return;    
}

function int GetItem()
{
    // End:0x11
    if(!IsValid())
    {
        return -1;
    }
    return Elements[Index].Item;
    //return;    
}

function Material GetImageAtIndex(int i)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return none;
    }
    return Elements[i].Image;
    //return;    
}

function string GetItemAtIndex(int i)
{
    return string(GetItemIntAtIndex(i));
    //return;    
}

function int GetItemIntAtIndex(int i)
{
    // End:0x16
    if(!IsValidIndex(i))
    {
        return -1;
    }
    return Elements[i].Item;
    //return;    
}

function GetAtIndex(int i, out Material Image, out int Item, out int Locked)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Image = Elements[i].Image;
    Item = Elements[i].Item;
    Locked = Elements[i].Locked;
    //return;    
}

function bool IndexLocked(int i)
{
    return Elements[i].Locked == 1;
    //return;    
}

function bool IsLocked()
{
    return Elements[Index].Locked == 1;
    //return;    
}

function ClearPendingElements()
{
    super(GUIListBase).ClearPendingElements();
    SelectedElements.Remove(0, SelectedElements.Length);
    //return;    
}

function array<ImageListElem> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xEC
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        // End:0xE6
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:

            // End:0x90 [Loop If]
            if(i < SelectedItems.Length)
            {
                // End:0x86
                if(IsValidIndex(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = Elements[SelectedItems[i]];
                }
                i++;
                // [Loop Continue]
                goto J0x44;
            }
            // End:0xE6
            if((SelectedElements.Length == 0) && IsValid())
            {
                SelectedElements.Length = SelectedElements.Length + 1;
                GetAtIndex(Index, SelectedElements[0].Image, SelectedElements[0].Item, SelectedElements[0].Locked);
            }
        }
        return SelectedElements;
    }
    //return;    
}

function SetImageAtIndex(int i, Material NewImage)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Image = NewImage;
    //return;    
}

function SetItemAtIndex(int i, int NewItem)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Item = NewItem;
    //return;    
}

function RemoveImage(Material Image)
{
    local int i;

    i = FindImage(Image);
    // End:0x2A
    if(IsValidIndex(i))
    {
        Remove(i);
    }
    //return;    
}

function RemoveItem(int Item)
{
    local int i;

    i = Elements.Length - 1;
    J0x0F:

    // End:0x49 [Loop If]
    if(i >= 0)
    {
        // End:0x3F
        if(Elements[i].Item == Item)
        {
            Remove(i);
        }
        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    ItemCount = Elements.Length;
    SetIndex(Index);
    // End:0x7E
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function int FindImage(Material Image)
{
    local int i;

    // End:0x1E
    if((Image == none) && !bAllowEmptyItems)
    {
        return -1;
    }
    i = 0;
    J0x25:

    // End:0x5F [Loop If]
    if(i < Elements.Length)
    {
        // End:0x55
        if(Elements[i].Image == Image)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    return -1;
    //return;    
}

function int FindItem(int Item)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x37
        if(Elements[i].Item == Item)
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

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    local int i;

    // End:0x61
    if(bAccepted && Accepting != none)
    {
        GetPendingElements();
        // End:0x59
        if(Accepting != self)
        {
            i = 0;
            J0x2E:

            // End:0x59 [Loop If]
            if(i < SelectedElements.Length)
            {
                RemoveElement(SelectedElements[i]);
                i++;
                // [Loop Continue]
                goto J0x2E;
            }
        }
        bRepeatClick = false;
    }
    // End:0x74
    if(Accepting == none)
    {
        bRepeatClick = true;
    }
    SetOutlineAlpha(255);
    // End:0x90
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    local array<ImageListElem> NewItem;
    local int i;

    // End:0x126
    if(Controller.DropTarget == self)
    {
        // End:0x126
        if((Controller.DropSource != none) && GUIVertImageList(Controller.DropSource) != none)
        {
            NewItem = GUIVertImageList(Controller.DropSource).GetPendingElements();
            // End:0xAF
            if(Controller.DropSource == self)
            {
                i = NewItem.Length - 1;
                J0x89:

                // End:0xAF [Loop If]
                if(i >= 0)
                {
                    RemoveElement(NewItem[i]);
                    i--;
                    // [Loop Continue]
                    goto J0x89;
                }
            }
            // End:0xCA
            if(!IsValidIndex(DropIndex))
            {
                DropIndex = ItemCount;
            }
            i = NewItem.Length - 1;
            J0xD9:

            // End:0x119 [Loop If]
            if(i >= 0)
            {
                Insert(DropIndex, NewItem[i].Image, NewItem[i].Item);
                i--;
                // [Loop Continue]
                goto J0xD9;
            }
            SetIndex(DropIndex);
            return true;
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    ImageScale=1.0000000
    NoVisibleRows=4
    NoVisibleCols=3
    HorzBorder=5
    VertBorder=5
    StyleName=""
    OnClick=GUIVertImageList.InternalOnClick
}