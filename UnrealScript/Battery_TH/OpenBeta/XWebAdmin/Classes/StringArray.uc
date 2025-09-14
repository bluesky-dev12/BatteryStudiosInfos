class StringArray extends Object;

struct ArrayItem
{
    var string Item;
    var string Tag;
};

var protected array<ArrayItem> AllItems;
var protected bool ReverseSort;

function int Add(coerce string Item, coerce string Tag, optional bool bUnique)
{
    local int pos;

    // End:0x2B
    if(bUnique)
    {
        pos = FindTagId(Tag);
        // End:0x2B
        if(pos >= 0)
        {
            return pos;
        }
    }
    return InsertAt(AllItems.Length, Item, Tag);
    //return;    
}

protected function int SetAt(int pos, coerce string Item, coerce string Tag)
{
    // End:0x1F
    if(AllItems.Length <= pos)
    {
        AllItems.Length = pos + 1;
    }
    AllItems[pos].Item = Item;
    AllItems[pos].Tag = Tag;
    return pos;
    //return;    
}

protected function int InsertAt(int pos, coerce string Item, coerce string Tag)
{
    // End:0x1F
    if(pos < AllItems.Length)
    {
        AllItems.Insert(pos, 1);        
    }
    else
    {
        AllItems.Length = pos + 1;
    }
    AllItems[pos].Item = Item;
    AllItems[pos].Tag = Tag;
    return pos;
    //return;    
}

function SetSize(int NewSize)
{
    AllItems.Length = NewSize;
    AllItems.Length = 0;
    //return;    
}

function Reset()
{
    AllItems.Length = 0;
    //return;    
}

function int Count()
{
    return AllItems.Length;
    //return;    
}

function int FindItemId(coerce string Item, optional bool blog)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < AllItems.Length)
    {
        // End:0x37
        if(AllItems[i].Item ~= Item)
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

function int FindTagId(coerce string Tag)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < AllItems.Length)
    {
        // End:0x37
        if(AllItems[i].Tag ~= Tag)
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

function bool Remove(int Index)
{
    // End:0x1F
    if((Index < 0) || Index >= AllItems.Length)
    {
        return false;
    }
    AllItems.Remove(Index, 1);
    return true;
    //return;    
}

function string GetItem(int Index)
{
    return AllItems[Index].Item;
    //return;    
}

function string GetTag(int Index)
{
    return AllItems[Index].Tag;
    //return;    
}

function int CopyFrom(StringArray Arr, coerce string Tag)
{
    local int id;

    id = Arr.FindTagId(Tag);
    // End:0x74
    if((id >= 0) && id < Arr.Count())
    {
        id = Add(Arr.GetItem(id), Arr.GetTag(id));
    }
    return id;
    //return;    
}

function int MoveFrom(StringArray Arr, coerce string Tag)
{
    return MoveFromId(Arr, Arr.FindTagId(Tag));
    //return;    
}

function int MoveFromId(StringArray Arr, int id)
{
    local int newid;

    // End:0x74
    if((id >= 0) && id < Arr.Count())
    {
        newid = Add(Arr.GetItem(id), Arr.GetTag(id));
        Arr.Remove(id);
        return newid;
    }
    return -1;
    //return;    
}

function int CopyFromId(StringArray Arr, int id)
{
    // End:0x55
    if((id >= 0) && id < Arr.Count())
    {
        return Add(Arr.GetItem(id), Arr.GetTag(id));
    }
    return -1;
    //return;    
}

function ShiftStrict(int id, out int Count)
{
    // End:0x2C
    if(((Count == 0) || id < 0) || id >= AllItems.Length)
    {
        return;
    }
    // End:0x99
    if(Count < 0)
    {
        // End:0x56
        if((id + Count) < 0)
        {
            Count = -id;
        }
        InsertAt(id + Count, AllItems[id].Item, AllItems[id].Tag);
        Remove(id + 1);        
    }
    else
    {
        // End:0xC9
        if(((id + Count) + 1) >= AllItems.Length)
        {
            Count = (AllItems.Length - id) - 1;
        }
        InsertAt((id + Count) + 1, AllItems[id].Item, AllItems[id].Tag);
        Remove(id);
    }
    //return;    
}

singular function SetSortOrder(bool Order)
{
    ReverseSort = Order;
    //return;    
}

singular function ToggleSort()
{
    ReverseSort = !ReverseSort;
    //return;    
}

function bool IsBefore(string Test, string Tag)
{
    local bool bResult;

    bResult = StrCmp(Test, Tag,, true) < 0;
    // End:0x2D
    if(ReverseSort)
    {
        return !bResult;        
    }
    else
    {
        return bResult;
    }
    //return;    
}
