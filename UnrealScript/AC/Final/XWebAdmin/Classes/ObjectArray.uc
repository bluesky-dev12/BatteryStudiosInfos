class ObjectArray extends Object;

struct ArrayItem
{
    var Object Item;
    var string Tag;
};

var protected array<ArrayItem> AllItems;
var protected bool ReverseSort;

function Add(Object Item, string Tag)
{
    InsertAt(AllItems.Length, Item, Tag);
    //return;    
}

protected function SetAt(int pos, Object Item, string Tag)
{
    // End:0x1F
    if(AllItems.Length <= pos)
    {
        AllItems.Length = pos + 1;
    }
    AllItems[pos].Item = Item;
    AllItems[pos].Tag = Tag;
    //return;    
}

protected function InsertAt(int pos, Object Item, string Tag)
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

function int FindItemId(Object Item)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < i)
    {
        // End:0x36
        if(AllItems[i].Item == Item)
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

function int FindTagId(string Tag)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < i)
    {
        // End:0x36
        if(AllItems[i].Tag == Tag)
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

function Object GetItem(int Index)
{
    return AllItems[Index].Item;
    //return;    
}

function string GetTag(int Index)
{
    return AllItems[Index].Tag;
    //return;    
}

function int CopyTo(ObjectArray Arr, string Tag)
{
    local int i;

    i = FindTagId(Tag);
    // End:0x4B
    if(i >= 0)
    {
        Arr.Add(AllItems[i].Item, AllItems[i].Tag);
    }
    return i;
    //return;    
}

function int CopyItemTo(ObjectArray Arr, Object Item)
{
    local int i;

    i = FindItemId(Item);
    // End:0x4B
    if(i >= 0)
    {
        Arr.Add(AllItems[i].Item, AllItems[i].Tag);
    }
    return i;
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

function bool IsBefore(string test, string Tag)
{
    return (!ReverseSort && Caps(test) < Caps(Tag)) || ReverseSort && Caps(test) > Caps(Tag);
    //return;    
}
