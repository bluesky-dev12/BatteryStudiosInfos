class GUICircularImageList extends GUICircularList
    native
    editinlinenew
    instanced;

var() protected editconstarray editconst array<editconst GUIListElem> Elements;

function Add(Material img, optional string str)
{
    local int NewIndex;

    // End:0x28
    if(!bAllowEmptyItems && (img == none) || str == "")
    {
        return;
    }
    // End:0x78
    if(bSorted && Elements.Length > 0)
    {
        J0x3F:

        // End:0x75 [Loop If]
        if((NewIndex < Elements.Length) && Elements[NewIndex].Item < str)
        {
            NewIndex++;
            // [Loop Continue]
            goto J0x3F;
        }        
    }
    else
    {
        NewIndex = Elements.Length;
    }
    Elements.Insert(NewIndex, 1);
    Elements[NewIndex].Item = str;
    Elements[NewIndex].ExtraData = img;
    ItemCount = Elements.Length;
    // End:0xE9
    if((Elements.Length == 1) && bInitializeList)
    {
        SetIndex(0);        
    }
    else
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function Replace(int i, Material img, optional string str)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(img, str);        
    }
    else
    {
        // End:0x4B
        if((!bAllowEmptyItems && img == none) && str == "")
        {
            return;
        }
        Elements[i].Item = str;
        Elements[i].ExtraData = img;
        // End:0x8B
        if(bNotify)
        {
            OnChange(self);
        }
    }
    //return;    
}

function Insert(int i, Material img, optional string str)
{
    // End:0x23
    if(!IsValidIndex(i))
    {
        Add(img, str);        
    }
    else
    {
        // End:0x4B
        if((!bAllowEmptyItems && img == none) && str == "")
        {
            return;
        }
        Elements.Insert(i, 1);
        Elements[i].Item = str;
        Elements[i].ExtraData = img;
        ItemCount = Elements.Length;
        // End:0xA3
        if(bNotify)
        {
            OnChange(self);
        }
    }
    //return;    
}

event Swap(int IndexA, int IndexB)
{
    local GUIListElem elem;

    // End:0x57
    if((IsValidIndex(IndexA)) && IsValidIndex(IndexB))
    {
        elem = Elements[IndexA];
        Elements[IndexA] = Elements[IndexB];
        Elements[IndexB] = elem;
    }
    //return;    
}

function LoadFrom(GUICircularImageList Source, optional bool bClearFirst)
{
    local string t1, t2;
    local Object obj;
    local int i;

    // End:0x0F
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x16:

    // End:0x71 [Loop If]
    if(i < Source.Elements.Length)
    {
        Source.GetAtIndex(i, t1, obj, t2);
        Add(Material(obj), t1);
        i++;
        // [Loop Continue]
        goto J0x16;
    }
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
    //return;    
}

function int RemoveElement(GUIListElem elem, optional int Count)
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
    return Index;
    //return;    
}

function Clear()
{
    // End:0x0E
    if(Elements.Length == 0)
    {
        return;
    }
    Elements.Remove(0, Elements.Length);
    ItemCount = 0;
    super(GUIListBase).Clear();
    //return;    
}

function string Get(optional bool bGuarantee)
{
    // End:0x32
    if(!IsValid())
    {
        // End:0x2F
        if(bGuarantee && Elements.Length > 0)
        {
            return Elements[0].Item;
        }
        return "";
    }
    return Elements[Index].Item;
    //return;    
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
    //return;    
}

function string GetItemAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return Elements[i].Item;
    //return;    
}

function Material GetImageAtIndex(int i)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return none;
    }
    return Material(Elements[i].ExtraData);
    //return;    
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
    //return;    
}

function array<string> GetPendingItems(optional bool bGuarantee)
{
    local int i;
    local array<string> items;

    // End:0xAE
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        i = 0;
        J0x38:

        // End:0x89 [Loop If]
        if(i < SelectedItems.Length)
        {
            // End:0x7F
            if(IsValidIndex(SelectedItems[i]))
            {
                items[items.Length] = Elements[SelectedItems[i]].Item;
            }
            i++;
            // [Loop Continue]
            goto J0x38;
        }
        // End:0xAE
        if((items.Length == 0) && IsValid())
        {
            items[0] = Get();
        }
    }
    return items;
    //return;    
}

function array<GUIListElem> GetPendingElements(optional bool bGuarantee)
{
    local int i;
    local array<GUIListElem> PendingItem;

    // End:0xDA
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        i = 0;
        J0x38:

        // End:0x84 [Loop If]
        if(i < SelectedItems.Length)
        {
            // End:0x7A
            if(IsValidIndex(SelectedItems[i]))
            {
                PendingItem[PendingItem.Length] = Elements[SelectedItems[i]];
            }
            i++;
            // [Loop Continue]
            goto J0x38;
        }
        // End:0xDA
        if((PendingItem.Length == 0) && IsValid())
        {
            PendingItem.Length = PendingItem.Length + 1;
            GetAtIndex(Index, PendingItem[0].Item, PendingItem[0].ExtraData, PendingItem[0].ExtraStrData);
        }
    }
    return PendingItem;
    //return;    
}

function SetItemAtIndex(int i, string NewItem)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].Item = NewItem;
    //return;    
}

function SetImageAtIndex(int i, Material img)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    Elements[i].ExtraData = img;
    //return;    
}

function RemoveItem(string Item)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x39
        if(Item ~= Elements[i].Item)
        {
            Elements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    //return;    
}

function RemoveImage(Material img)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < Elements.Length)
    {
        // End:0x39
        if(img == Elements[i].ExtraData)
        {
            Elements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = Elements.Length;
    SetIndex(-1);
    //return;    
}

function int FindIndex(Material img, optional string Test)
{
    local int i;

    // End:0x4F
    if(img != none)
    {
        i = 0;
        J0x12:

        // End:0x4C [Loop If]
        if(i < Elements.Length)
        {
            // End:0x42
            if(img == Elements[i].ExtraData)
            {
                return i;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }        
    }
    else
    {
        // End:0x9C
        if(Test != "")
        {
            i = 0;
            J0x62:

            // End:0x9C [Loop If]
            if(i < Elements.Length)
            {
                // End:0x92
                if(Elements[i].Item ~= Test)
                {
                    return i;
                }
                i++;
                // [Loop Continue]
                goto J0x62;
            }
        }
    }
    return -1;
    //return;    
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    local int i;
    local array<GUIListElem> TempElem;

    // End:0x8F
    if(bAccepted && Accepting != none)
    {
        i = 0;
        J0x1D:

        // End:0x55 [Loop If]
        if(i < SelectedItems.Length)
        {
            TempElem[TempElem.Length] = Elements[SelectedItems[i]];
            i++;
            // [Loop Continue]
            goto J0x1D;
        }
        i = 0;
        J0x5C:

        // End:0x87 [Loop If]
        if(i < TempElem.Length)
        {
            RemoveElement(TempElem[i]);
            i++;
            // [Loop Continue]
            goto J0x5C;
        }
        bRepeatClick = false;
    }
    // End:0xA2
    if(Accepting == none)
    {
        bRepeatClick = true;
    }
    SetOutlineAlpha(255);
    // End:0xBE
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    local array<GUIListElem> NewItem;
    local int i;

    // End:0x13D
    if(Controller.DropTarget == self)
    {
        // End:0x13D
        if((Controller.DropSource != none) && GUIList(Controller.DropSource) != none)
        {
            NewItem = GUIList(Controller.DropSource).GetPendingElements();
            // End:0xD9
            if((DropIndex >= 0) && DropIndex < ItemCount)
            {
                i = NewItem.Length - 1;
                J0x91:

                // End:0xD6 [Loop If]
                if(i >= 0)
                {
                    Insert(DropIndex, Material(NewItem[i].ExtraData), NewItem[i].Item);
                    i--;
                    // [Loop Continue]
                    goto J0x91;
                }                
            }
            else
            {
                DropIndex = ItemCount;
                i = 0;
                J0xEB:

                // End:0x130 [Loop If]
                if(i < NewItem.Length)
                {
                    Add(Material(NewItem[i].ExtraData), NewItem[i].Item);
                    i++;
                    // [Loop Continue]
                    goto J0xEB;
                }
            }
            SetIndex(DropIndex);
            return true;
        }
    }
    return false;
    //return;    
}
