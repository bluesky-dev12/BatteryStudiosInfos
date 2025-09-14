/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUICircularImageList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:23
 *
 *******************************************************************************/
class GUICircularImageList extends GUICircularList
    native
    editinlinenew
    instanced;

var() editconstarray editconst array<editconst GUIListElem> Elements;

function Add(Material img, optional string str)
{
    local int NewIndex;

    // End:0x28
    if(!bAllowEmptyItems && img == none || str == "")
    {
        return;
    }
    // End:0x78
    if(bSorted && Elements.Length > 0)
    {
        J0x3f:
        // End:0x75 [While If]
        if(NewIndex < Elements.Length && Elements[NewIndex].Item < str)
        {
            ++ NewIndex;
            // This is an implied JumpToken; Continue!
            goto J0x3f;
        }
    }
    // End:0x84
    else
    {
        NewIndex = Elements.Length;
    }
    Elements.Insert(NewIndex, 1);
    Elements[NewIndex].Item = str;
    Elements[NewIndex].ExtraData = img;
    ItemCount = Elements.Length;
    // End:0xe9
    if(Elements.Length == 1 && bInitializeList)
    {
        SetIndex(0);
    }
    // End:0xf4
    else
    {
        CheckLinkedObjects(self);
    }
}

function Replace(int i, Material img, optional string str)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(img, str);
    }
    // End:0x8b
    else
    {
        // End:0x4b
        if(!bAllowEmptyItems && img == none && str == "")
        {
            return;
        }
        Elements[i].Item = str;
        Elements[i].ExtraData = img;
        // End:0x8b
        if(bNotify)
        {
            OnChange(self);
        }
    }
}

function Insert(int i, Material img, optional string str)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(img, str);
    }
    // End:0xa3
    else
    {
        // End:0x4b
        if(!bAllowEmptyItems && img == none && str == "")
        {
            return;
        }
        Elements.Insert(i, 1);
        Elements[i].Item = str;
        Elements[i].ExtraData = img;
        ItemCount = Elements.Length;
        // End:0xa3
        if(bNotify)
        {
            OnChange(self);
        }
    }
}

event Swap(int IndexA, int IndexB)
{
    local GUIListElem elem;

    // End:0x57
    if(IsValidIndex(IndexA) && IsValidIndex(IndexB))
    {
        elem = Elements[IndexA];
        Elements[IndexA] = Elements[IndexB];
        Elements[IndexB] = elem;
    }
}

function LoadFrom(GUICircularImageList Source, optional bool bClearFirst)
{
    local string t1, t2;
    local Object obj;
    local int i;

    // End:0x0f
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:
    // End:0x71 [While If]
    if(i < Source.Elements.Length)
    {
        Source.GetAtIndex(i, t1, obj, t2);
        Add(Material(obj), t1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
}

function int RemoveSilent(int i, optional int Count)
{
    bNotify = false;
    i = Remove(i, Count);
    bNotify = true;
    return i;
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
    return Index;
}

function int RemoveElement(GUIListElem elem, optional int Count)
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
    return Index;
}

function Clear()
{
    // End:0x0e
    if(Elements.Length == 0)
    {
        return;
    }
    Elements.Remove(0, Elements.Length);
    ItemCount = 0;
    super(GUIListBase).Clear();
}

function string Get(optional bool bGuarantee)
{
    // End:0x32
    if(!IsValid())
    {
        // End:0x2f
        if(bGuarantee && Elements.Length > 0)
        {
            return Elements[0].Item;
        }
        return "";
    }
    return Elements[Index].Item;
}

function Material GetImage(optional bool bGuarantee)
{
    // End:0x36
    if(!IsValid())
    {
        // End:0x34
        if(bGuarantee && Elements.Length > 0)
        {
            return Material(Elements[0].ExtraData);
        }
        return none;
    }
    return Material(Elements[Index].ExtraData);
}

function string GetItemAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Item;
}

function Material GetImageAtIndex(int i)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return none;
    }
    return Material(Elements[i].ExtraData);
}

function GetAtIndex(int i, out string ItemStr, out Object img, out string ExtraStr)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    ItemStr = Elements[i].Item;
    img = Elements[i].ExtraData;
    ExtraStr = Elements[i].ExtraStrData;
}

function array<string> GetPendingItems(optional bool bGuarantee)
{
    local int i;
    local array<string> items;

    // End:0xae
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        i = 0;
        J0x38:
        // End:0x89 [While If]
        if(i < SelectedItems.Length)
        {
            // End:0x7f
            if(IsValidIndex(SelectedItems[i]))
            {
                items[items.Length] = Elements[SelectedItems[i]].Item;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x38;
        }
        // End:0xae
        if(items.Length == 0 && IsValid())
        {
            items[0] = Get();
        }
    }
    return items;
}

function array<GUIListElem> GetPendingElements(optional bool bGuarantee)
{
    local int i;
    local array<GUIListElem> PendingItem;

    // End:0xda
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        i = 0;
        J0x38:
        // End:0x84 [While If]
        if(i < SelectedItems.Length)
        {
            // End:0x7a
            if(IsValidIndex(SelectedItems[i]))
            {
                PendingItem[PendingItem.Length] = Elements[SelectedItems[i]];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x38;
        }
        // End:0xda
        if(PendingItem.Length == 0 && IsValid())
        {
            PendingItem.Length = PendingItem.Length + 1;
            GetAtIndex(Index, PendingItem[0].Item, PendingItem[0].ExtraData, PendingItem[0].ExtraStrData);
        }
    }
    return PendingItem;
}

function SetItemAtIndex(int i, string NewItem)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Item = NewItem;
}

function SetImageAtIndex(int i, Material img)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].ExtraData = img;
}

function RemoveItem(string Item)
{
    local int i;

    // End:0x43 [While If]
    if(i < Elements.Length)
    {
        J0x00:
        // End:0x39
        if(Item ~= Elements[i].Item)
        {
            Elements.Remove(i, 1);
        }
        // End:0x40
        else
        {
            ++ i;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
}

function RemoveImage(Material img)
{
    local int i;

    // End:0x43 [While If]
    if(i < Elements.Length)
    {
        J0x00:
        // End:0x39
        if(img == Elements[i].ExtraData)
        {
            Elements.Remove(i, 1);
        }
        // End:0x40
        else
        {
            ++ i;
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
}

function int FindIndex(Material img, optional string Test)
{
    local int i;

    // End:0x4f
    if(img != none)
    {
        i = 0;
        J0x12:
        // End:0x4c [While If]
        if(i < Elements.Length)
        {
            // End:0x42
            if(img == Elements[i].ExtraData)
            {
                return i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    // End:0x9c
    else
    {
        // End:0x9c
        if(Test != "")
        {
            i = 0;
            J0x62:
            // End:0x9c [While If]
            if(i < Elements.Length)
            {
                // End:0x92
                if(Elements[i].Item ~= Test)
                {
                    return i;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x62;
            }
        }
    }
    return -1;
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    local int i;
    local array<GUIListElem> TempElem;

    // End:0x8f
    if(bAccepted && Accepting != none)
    {
        i = 0;
        J0x1d:
        // End:0x55 [While If]
        if(i < SelectedItems.Length)
        {
            TempElem[TempElem.Length] = Elements[SelectedItems[i]];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1d;
        }
        i = 0;
        J0x5c:
        // End:0x87 [While If]
        if(i < TempElem.Length)
        {
            RemoveElement(TempElem[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5c;
        }
        bRepeatClick = false;
    }
    // End:0xa2
    if(Accepting == none)
    {
        bRepeatClick = true;
    }
    SetOutlineAlpha(255);
    // End:0xbe
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    local array<GUIListElem> NewItem;
    local int i;

    // End:0x13d
    if(Controller.DropTarget == self)
    {
        // End:0x13d
        if(Controller.DropSource != none && GUIList(Controller.DropSource) != none)
        {
            NewItem = GUIList(Controller.DropSource).GetPendingElements();
            // End:0xd9
            if(DropIndex >= 0 && DropIndex < ItemCount)
            {
                i = NewItem.Length - 1;
                J0x91:
                // End:0xd6 [While If]
                if(i >= 0)
                {
                    Insert(DropIndex, Material(NewItem[i].ExtraData), NewItem[i].Item);
                    -- i;
                    // This is an implied JumpToken; Continue!
                    goto J0x91;
                }
            }
            // End:0x130
            else
            {
                DropIndex = ItemCount;
                i = 0;
                J0xeb:
                // End:0x130 [While If]
                if(i < NewItem.Length)
                {
                    Add(Material(NewItem[i].ExtraData), NewItem[i].Item);
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xeb;
                }
            }
            SetIndex(DropIndex);
            return true;
        }
    }
    return false;
}
