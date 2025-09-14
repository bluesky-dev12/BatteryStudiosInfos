class MultiSelectList extends GUIList
    native
    editinlinenew
    instanced;

var array<MultiSelectListElem> MElements;

function Add(string NewItem, optional Object obj, optional string str, optional bool bSection)
{
    local int NewIndex;

    // End:0x36
    if(((!bAllowEmptyItems && NewItem == "") && obj == none) && str == "")
    {
        return;
    }
    // End:0x86
    if(bSorted && MElements.Length > 0)
    {
        J0x4D:

        // End:0x83 [Loop If]
        if((NewIndex < MElements.Length) && MElements[NewIndex].Item < NewItem)
        {
            NewIndex++;
            // [Loop Continue]
            goto J0x4D;
        }        
    }
    else
    {
        NewIndex = MElements.Length;
    }
    MElements.Insert(NewIndex, 1);
    MElements[NewIndex].Item = NewItem;
    MElements[NewIndex].ExtraData = obj;
    MElements[NewIndex].ExtraStrData = str;
    MElements[NewIndex].bSelected = false;
    MElements[NewIndex].bSection = bSection;
    ItemCount = MElements.Length;
    // End:0x135
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function Replace(int Index, string NewItem, optional Object obj, optional string str, optional bool bNoSort)
{
    // End:0x28
    if(!IsValidIndex(Index))
    {
        Add(NewItem, obj, str);        
    }
    else
    {
        // End:0x5E
        if(((!bAllowEmptyItems && NewItem == "") && obj == none) && str == "")
        {
            return;
        }
        MElements[Index].Item = NewItem;
        MElements[Index].ExtraData = obj;
        MElements[Index].ExtraStrData = str;
        MElements[Index].bSelected = false;
        // End:0xC2
        if(bSorted)
        {
            Sort();
        }
        OnChange(self);
    }
    //return;    
}

function Insert(int Index, string NewItem, optional Object obj, optional string str, optional bool bNoSort, optional bool bSection)
{
    // End:0x28
    if(!IsValidIndex(Index))
    {
        Add(NewItem, obj, str);        
    }
    else
    {
        // End:0x5E
        if(((!bAllowEmptyItems && NewItem == "") && obj == none) && str == "")
        {
            return;
        }
        MElements.Insert(Index, 1);
        MElements[Index].Item = NewItem;
        MElements[Index].ExtraData = obj;
        MElements[Index].ExtraStrData = str;
        MElements[Index].bSection = bSection;
        MElements[Index].bSelected = false;
        ItemCount = MElements.Length;
        // End:0xF2
        if(bSorted)
        {
            Sort();
        }
        OnChange(self);
        // End:0x11B
        if(MyScrollBar != none)
        {
            MyScrollBar.AlignThumb();
        }
    }
    //return;    
}

event Swap(int IndexA, int IndexB)
{
    local MultiSelectListElem elem;

    // End:0x66
    if((IsValidIndex(IndexA)) && IsValidIndex(IndexB))
    {
        elem = MElements[IndexA];
        MElements[IndexA] = MElements[IndexB];
        MElements[IndexB] = elem;
        // End:0x66
        if(bSorted)
        {
            Sort();
        }
    }
    //return;    
}

function LoadFrom(GUIList Source, optional bool bClearFirst)
{
    local string t1, t2;
    local Object t;
    local int i;

    // End:0x12
    if(MultiSelectList(Source) == none)
    {
        return;
    }
    // End:0x21
    if(bClearFirst)
    {
        Clear();
    }
    i = 0;
    J0x28:

    // End:0x8D [Loop If]
    if(i < MultiSelectList(Source).MElements.Length)
    {
        MultiSelectList(Source).GetAtIndex(i, t1, t, t2);
        Add(t1, t, t2);
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

function int Remove(int i, int Count, bool bNoSort)
{
    // End:0x12
    if(Count == 0)
    {
        Count = 1;
    }
    // End:0x28
    if(!IsValidIndex(i))
    {
        return Index;
    }
    MElements.Remove(i, Count);
    ItemCount = MElements.Length;
    // End:0x53
    if(bSorted)
    {
        Sort();
    }
    SetIndex(-1);
    // End:0x7C
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return Index;
    //return;    
}

function Clear()
{
    // End:0x0E
    if(MElements.Length == 0)
    {
        return;
    }
    MElements.Remove(0, MElements.Length);
    ItemCount = 0;
    super.Clear();
    //return;    
}

function string Get(optional bool bGuarantee)
{
    local string CSVString;
    local int i;

    i = 0;
    J0x07:

    // End:0x7C [Loop If]
    if(i < MElements.Length)
    {
        // End:0x72
        if(MElements[i].bSelected)
        {
            // End:0x50
            if(CSVString == "")
            {
                CSVString = MElements[i].Item;
                // [Explicit Continue]
                goto J0x72;
            }
            CSVString = (CSVString $ ",") $ MElements[i].Item;
        }
        J0x72:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return CSVString;
    //return;    
}

function Object GetObject()
{
    // End:0x10
    if(!IsValid())
    {
        return none;        
    }
    else
    {
        return MElements[Index].ExtraData;
    }
    //return;    
}

function bool IsSection()
{
    // End:0x10
    if(!IsValid())
    {
        return false;        
    }
    else
    {
        return MElements[Index].bSection;
    }
    //return;    
}

function string GetExtra()
{
    local string CSVString;
    local int i;

    i = 0;
    J0x07:

    // End:0x7C [Loop If]
    if(i < MElements.Length)
    {
        // End:0x72
        if(MElements[i].bSelected)
        {
            // End:0x50
            if(CSVString == "")
            {
                CSVString = MElements[i].ExtraStrData;
                // [Explicit Continue]
                goto J0x72;
            }
            CSVString = (CSVString $ ",") $ MElements[i].ExtraStrData;
        }
        J0x72:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return CSVString;
    //return;    
}

function string GetItemAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return MElements[i].Item;
    //return;    
}

function Object GetObjectAtIndex(int i)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return none;
    }
    return MElements[i].ExtraData;
    //return;    
}

function string GetExtraAtIndex(int i)
{
    // End:0x13
    if(!IsValidIndex(i))
    {
        return "";
    }
    return MElements[i].ExtraStrData;
    //return;    
}

function GetAtIndex(int i, out string ItemStr, out Object ExtraObj, out string ExtraStr)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    ItemStr = MElements[i].Item;
    ExtraObj = MElements[i].ExtraData;
    ExtraStr = MElements[i].ExtraStrData;
    //return;    
}

function array<string> GetPendingItems(optional bool bGuarantee)
{
    local array<string> items;

    return items;
    //return;    
}

function array<GUIListElem> GetPendingElements(optional bool bGuarantee)
{
    local array<GUIListElem> PendingItem;

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
    MElements[i].Item = NewItem;
    //return;    
}

function SetObjectAtIndex(int i, Object NewObject)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    MElements[i].ExtraData = NewObject;
    //return;    
}

function SetExtraAtIndex(int i, string NewExtra)
{
    // End:0x12
    if(!IsValidIndex(i))
    {
        return;
    }
    MElements[i].ExtraStrData = NewExtra;
    //return;    
}

function RemoveItem(string Item)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < MElements.Length)
    {
        // End:0x39
        if(Item ~= MElements[i].Item)
        {
            MElements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = MElements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function RemoveObject(Object obj)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < MElements.Length)
    {
        // End:0x39
        if(obj == MElements[i].ExtraData)
        {
            MElements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = MElements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function RemoveExtra(string str)
{
    local int i;

    J0x00:
    // End:0x43 [Loop If]
    if(i < MElements.Length)
    {
        // End:0x39
        if(str ~= MElements[i].ExtraStrData)
        {
            MElements.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x00;
    }
    ItemCount = MElements.Length;
    SetIndex(-1);
    // End:0x78
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function string Find(string Text, optional bool bExact, optional bool bExtra)
{
    local int i;

    i = FindIndex(Text, bExact, bExtra);
    // End:0x48
    if(i != -1)
    {
        SetIndex(i);
        return MElements[i].Item;
    }
    return "";
    //return;    
}

function int FindIndex(string Test, optional bool bExact, optional bool bExtra, optional Object TestObject)
{
    local int i;

    // End:0x4F
    if(TestObject != none)
    {
        i = 0;
        J0x12:

        // End:0x4C [Loop If]
        if(i < MElements.Length)
        {
            // End:0x42
            if(TestObject == MElements[i].ExtraData)
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
        // End:0x151
        if(Test != "")
        {
            // End:0xDC
            if(bExtra)
            {
                i = 0;
                J0x6B:

                // End:0xD9 [Loop If]
                if(i < MElements.Length)
                {
                    // End:0xCF
                    if((bExact && MElements[i].ExtraStrData == Test) || !bExact && MElements[i].ExtraStrData ~= Test)
                    {
                        return i;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x6B;
                }                
            }
            else
            {
                i = 0;
                J0xE3:

                // End:0x151 [Loop If]
                if(i < MElements.Length)
                {
                    // End:0x147
                    if((bExact && MElements[i].Item == Test) || !bExact && MElements[i].Item ~= Test)
                    {
                        return i;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0xE3;
                }
            }
        }
    }
    return -1;
    //return;    
}

function int SetIndex(int NewIndex)
{
    // End:0x2A
    if((NewIndex < 0) || NewIndex >= ItemCount)
    {
        Index = -1;        
    }
    else
    {
        Index = NewIndex;
        MElements[Index].bSelected = !MElements[Index].bSelected;
    }
    // End:0xC4
    if((Index >= 0) && ItemsPerPage > 0)
    {
        // End:0x8C
        if(Index < Top)
        {
            SetTopItem(Index);
        }
        // End:0xC4
        if((ItemsPerPage != 0) && Index == (Top + ItemsPerPage))
        {
            SetTopItem((Index - ItemsPerPage) + 1);
        }
    }
    OnChange(self);
    return Index;
    //return;    
}
