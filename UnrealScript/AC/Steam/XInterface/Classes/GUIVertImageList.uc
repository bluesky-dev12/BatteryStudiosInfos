/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIVertImageList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:44
 *
 *******************************************************************************/
class GUIVertImageList extends GUIVertList
    dependson(GUIVertList)
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
var delegate<OnItemDblClick> __OnItemDblClick__Delegate;
var delegate<OnIsSelectibleIndex> __OnIsSelectibleIndex__Delegate;

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, HitCol, HitRow;

    HitCol = int(float(int(Controller.MouseX - ClientBounds[0])) / ItemWidth);
    HitRow = int(float(int(Controller.MouseY - ClientBounds[1])) / ItemHeight);
    i = Top + HitCol + HitRow * NoVisibleCols;
    // End:0xa1
    if(i < 0 || i >= ItemCount && bRequireValidIndex)
    {
        return -1;
    }
    return i;
}

delegate bool OnItemDblClick(GUIComponent Sender);
delegate bool OnIsSelectibleIndex(GUIComponent Sender, int Index)
{
    return true;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x1a
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
    // End:0x4f
    if(!OnIsSelectibleIndex(self, NewIndex))
    {
        return false;
    }
    SetIndex(NewIndex);
    // End:0xbf
    if(Index == NewIndex && LastValidClickTime != float(0) && Controller.ViewportOwner.Actor.Level.TimeSeconds - LastValidClickTime < 0.010)
    {
        OnItemDblClick(self);
    }
    LastValidClickTime = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    return true;
}

function int SetIndex(int NewIndex)
{
    // End:0x29
    if(NewIndex >= 0 && Elements[NewIndex].Locked == 1)
    {
        return Index;
    }
    return super(GUIListBase).SetIndex(NewIndex);
}

function bool Up()
{
    local int TargetIndex;

    // End:0x14
    if(Index - NoVisibleCols < 0)
    {
        return true;
    }
    TargetIndex = Index - NoVisibleCols;
    // End:0x73
    if(Elements[TargetIndex].Locked == 1)
    {
        TargetIndex = TargetIndex - NoVisibleCols;
        // End:0x73
        if(TargetIndex < 0 || Elements[TargetIndex].Locked == 1)
        {
            return true;
        }
    }
    SetIndex(TargetIndex);
    // End:0x9c
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function bool Down()
{
    local int TargetIndex;

    // End:0x18
    if(Index + NoVisibleCols >= ItemCount)
    {
        return true;
    }
    TargetIndex = Index + NoVisibleCols;
    // End:0x7b
    if(Elements[TargetIndex].Locked == 1)
    {
        TargetIndex = TargetIndex + NoVisibleCols;
        // End:0x7b
        if(TargetIndex >= ItemCount || Elements[TargetIndex].Locked == 1)
        {
            return true;
        }
    }
    SetIndex(TargetIndex);
    // End:0xa4
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function bool MoveRight()
{
    local int TargetIndex;

    TargetIndex = Index + 1;
    // End:0x28
    if(float(TargetIndex) % float(NoVisibleCols) == float(0))
    {
        return true;
    }
    // End:0x77
    if(Elements[TargetIndex].Locked == 1)
    {
        ++ TargetIndex;
        // End:0x77
        if(float(TargetIndex) % float(NoVisibleCols) == float(0) || Elements[TargetIndex].Locked == 1)
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
}

function bool MoveLeft()
{
    local int TargetIndex;

    // End:0x1a
    if(float(Index) % float(NoVisibleCols) == float(0))
    {
        return true;
    }
    TargetIndex = Index - 1;
    // End:0x8b
    if(Elements[TargetIndex].Locked == 1)
    {
        -- TargetIndex;
        // End:0x8b
        if(TargetIndex < 0 || float(TargetIndex) % float(NoVisibleCols) == float(NoVisibleCols - 1) || Elements[TargetIndex].Locked == 1)
        {
            return true;
        }
    }
    // End:0xa1
    if(Index > 0)
    {
        SetIndex(TargetIndex);
    }
    return true;
}

function home()
{
    local int i;

    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    i = 0;
    J0x15:
    // End:0x6f [While If]
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
}

function End()
{
    local int i;

    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    i = ItemCount - 1;
    J0x1c:
    // End:0x72 [While If]
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
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
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
}

function PgDn()
{
    local int NewTop;

    // End:0x5b
    if(Top < ItemCount / NoVisibleCols - NoVisibleRows)
    {
        NewTop = Max(0, Top + NoVisibleRows);
        SetTopItem(NewTop);
        // End:0x5b
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    return;
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
        MaxTop = MaxTop - ModResult + float(NoVisibleCols);
    }
    NewTop = int(Round(MaxTop * perc));
    Change = int(Abs(float(Top - NewTop)));
    // End:0xa1
    if(Change < NoVisibleCols && perc < 1.0)
    {
        return;
    }
    SetTopItem(NewTop);
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
    // End:0x99 [While If]
    if(Item + ItemsPerPage > ItemCount + NoVisibleCols && Item >= 0)
    {
        Item -= NoVisibleCols;
        // This is an implied JumpToken; Continue!
        goto J0x60;
    }
    Top = Max(0, Item);
    // End:0xc5
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    OnAdjustTop(self);
}

function Add(Material Image, optional int Item, optional int Locked)
{
    local int i;

    // End:0x1a
    if(Image == none && !bAllowEmptyItems)
    {
        return;
    }
    i = Elements.Length;
    Elements.Length = i + 1;
    Elements[i].Image = Image;
    Elements[i].Item = Item;
    Elements[i].Locked = Locked;
    ItemCount = Elements.Length;
    // End:0xa3
    if(ItemCount == 1 && bInitializeList)
    {
        SetIndex(0);
    }
    // End:0xae
    else
    {
        CheckLinkedObjects(self);
    }
    // End:0xcc
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function AddImage(ImageListElem NewElem, optional int Locked)
{
    Add(NewElem.Image, NewElem.Item, Locked);
}

function Replace(int i, Material NewImage, optional int NewItem, optional int Locked)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(NewImage, NewItem);
    }
    // End:0xa8
    else
    {
        // End:0x3d
        if(!bAllowEmptyItems && NewImage == none)
        {
            return;
        }
        Elements[i].Item = NewItem;
        Elements[i].Image = NewImage;
        Elements[i].Locked = Locked;
        SetIndex(Index);
        // End:0xa8
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
}

function Insert(int i, Material NewImage, optional int NewItem, optional int Locked)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(NewImage, NewItem);
    }
    // End:0xc0
    else
    {
        // End:0x3d
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
        // End:0xc0
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
}

function InsertElement(int i, ImageListElem NewElem, optional int Locked)
{
    Insert(i, NewElem.Image, NewElem.Item, Locked);
}

event Swap(int IndexA, int IndexB)
{
    local ImageListElem elem;

    // End:0x57
    if(IsValidIndex(IndexA) && IsValidIndex(IndexB))
    {
        elem = Elements[IndexA];
        Elements[IndexA] = Elements[IndexB];
        Elements[IndexB] = elem;
    }
}

function LoadFrom(GUIVertImageList Source, optional bool bClearFirst)
{
    local int i, Item;
    local Material mat;
    local int L;

    // End:0x0f
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:
    // End:0x70 [While If]
    if(i < Source.ItemCount)
    {
        Source.GetAtIndex(i, mat, Item, L);
        Add(mat, Item, L);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
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
}

function int RemoveSilent(int i, optional int Count)
{
    bNotify = false;
    i = Remove(i, Count);
    bNotify = true;
    return i;
}

function int RemoveElement(ImageListElem elem, optional int Count)
{
    local int i;

    Count = Max(Count, 1);
    i = 0;
    J0x15:
    // End:0x69 [While If]
    if(i < Elements.Length)
    {
        // End:0x5f
        if(Elements[i] == elem)
        {
            Elements.Remove(i, Min(Count, Elements.Length - i));
        }
        // End:0x69
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x15;
        }
    }
    ItemCount = Elements.Length;
    SetIndex(Index);
    // End:0x9e
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return Index;
}

function Clear()
{
    // End:0x0d
    if(ItemCount == 0)
    {
        return;
    }
    Elements.Remove(0, Elements.Length);
    super(GUIListBase).Clear();
}

function Material Get(optional bool bGuarantee)
{
    // End:0x30
    if(!IsValid())
    {
        // End:0x2e
        if(bGuarantee && ItemCount > 0)
        {
            return Elements[0].Image;
        }
        return none;
    }
    return Elements[Index].Image;
}

function int GetItem()
{
    // End:0x11
    if(!IsValid())
    {
        return -1;
    }
    return Elements[Index].Item;
}

function Material GetImageAtIndex(int i)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return none;
    }
    return Elements[i].Image;
}

function string GetItemAtIndex(int i)
{
    return string(GetItemIntAtIndex(i));
}

function int GetItemIntAtIndex(int i)
{
    // End:0x16
    if(!IsValidIndex(i))
    {
        return -1;
    }
    return Elements[i].Item;
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
}

function bool IndexLocked(int i)
{
    return Elements[i].Locked == 1;
}

function bool IsLocked()
{
    return Elements[Index].Locked == 1;
}

function ClearPendingElements()
{
    super(GUIListBase).ClearPendingElements();
    SelectedElements.Remove(0, SelectedElements.Length);
}

function array<ImageListElem> GetPendingElements(optional bool bGuarantee)
{
    local int i;

    // End:0xec
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        // End:0xe6
        if(SelectedElements.Length == 0)
        {
            i = 0;
            J0x44:
            // End:0x90 [While If]
            if(i < SelectedItems.Length)
            {
                // End:0x86
                if(IsValidIndex(SelectedItems[i]))
                {
                    SelectedElements[SelectedElements.Length] = Elements[SelectedItems[i]];
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x44;
            }
            // End:0xe6
            if(SelectedElements.Length == 0 && IsValid())
            {
                SelectedElements.Length = SelectedElements.Length + 1;
                GetAtIndex(Index, SelectedElements[0].Image, SelectedElements[0].Item, SelectedElements[0].Locked);
            }
        }
        return SelectedElements;
    }
}

function SetImageAtIndex(int i, Material NewImage)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Image = NewImage;
}

function SetItemAtIndex(int i, int NewItem)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Item = NewItem;
}

function RemoveImage(Material Image)
{
    local int i;

    i = FindImage(Image);
    // End:0x2a
    if(IsValidIndex(i))
    {
        Remove(i);
    }
}

function RemoveItem(int Item)
{
    local int i;

    i = Elements.Length - 1;
    J0x0f:
    // End:0x49 [While If]
    if(i >= 0)
    {
        // End:0x3f
        if(Elements[i].Item == Item)
        {
            Remove(i);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    ItemCount = Elements.Length;
    SetIndex(Index);
    // End:0x7e
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function int FindImage(Material Image)
{
    local int i;

    // End:0x1e
    if(Image == none && !bAllowEmptyItems)
    {
        return -1;
    }
    i = 0;
    J0x25:
    // End:0x5f [While If]
    if(i < Elements.Length)
    {
        // End:0x55
        if(Elements[i].Image == Image)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    return -1;
}

function int FindItem(int Item)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < Elements.Length)
    {
        // End:0x37
        if(Elements[i].Item == Item)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
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
            J0x2e:
            // End:0x59 [While If]
            if(i < SelectedElements.Length)
            {
                RemoveElement(SelectedElements[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2e;
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
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    local array<ImageListElem> NewItem;
    local int i;

    // End:0x126
    if(Controller.DropTarget == self)
    {
        // End:0x126
        if(Controller.DropSource != none && GUIVertImageList(Controller.DropSource) != none)
        {
            NewItem = GUIVertImageList(Controller.DropSource).GetPendingElements();
            // End:0xaf
            if(Controller.DropSource == self)
            {
                i = NewItem.Length - 1;
                J0x89:
                // End:0xaf [While If]
                if(i >= 0)
                {
                    RemoveElement(NewItem[i]);
                    -- i;
                    // This is an implied JumpToken; Continue!
                    goto J0x89;
                }
            }
            // End:0xca
            if(!IsValidIndex(DropIndex))
            {
                DropIndex = ItemCount;
            }
            i = NewItem.Length - 1;
            J0xd9:
            // End:0x119 [While If]
            if(i >= 0)
            {
                Insert(DropIndex, NewItem[i].Image, NewItem[i].Item);
                -- i;
                // This is an implied JumpToken; Continue!
                goto J0xd9;
            }
            SetIndex(DropIndex);
            return true;
        }
    }
    return false;
}

defaultproperties
{
    ImageScale=1.0
    NoVisibleRows=4
    NoVisibleCols=3
    HorzBorder=5
    VertBorder=5
    StyleName=""
    OnClick=InternalOnClick
}