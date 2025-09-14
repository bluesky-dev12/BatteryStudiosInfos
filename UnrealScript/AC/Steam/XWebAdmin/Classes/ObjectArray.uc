/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\ObjectArray.uc
 * Package Imports:
 *	XWebAdmin
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:2
 *	Functions:16
 *
 *******************************************************************************/
class ObjectArray extends Object;

struct ArrayItem
{
    var Object Item;
    var string Tag;
};

var array<ArrayItem> AllItems;
var bool ReverseSort;

function Add(Object Item, string Tag)
{
    InsertAt(AllItems.Length, Item, Tag);
}

protected function SetAt(int pos, Object Item, string Tag)
{
    // End:0x1f
    if(AllItems.Length <= pos)
    {
        AllItems.Length = pos + 1;
    }
    AllItems[pos].Item = Item;
    AllItems[pos].Tag = Tag;
}

protected function InsertAt(int pos, Object Item, string Tag)
{
    // End:0x1f
    if(pos < AllItems.Length)
    {
        AllItems.Insert(pos, 1);
    }
    // End:0x2e
    else
    {
        AllItems.Length = pos + 1;
    }
    AllItems[pos].Item = Item;
    AllItems[pos].Tag = Tag;
}

function SetSize(int NewSize)
{
    AllItems.Length = NewSize;
    AllItems.Length = 0;
}

function Reset()
{
    AllItems.Length = 0;
}

function int Count()
{
    return AllItems.Length;
}

function int FindItemId(Object Item)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < i)
    {
        // End:0x36
        if(AllItems[i].Item == Item)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindTagId(string Tag)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < i)
    {
        // End:0x36
        if(AllItems[i].Tag == Tag)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool Remove(int Index)
{
    // End:0x1f
    if(Index < 0 || Index >= AllItems.Length)
    {
        return false;
    }
    AllItems.Remove(Index, 1);
    return true;
}

function Object GetItem(int Index)
{
    return AllItems[Index].Item;
}

function string GetTag(int Index)
{
    return AllItems[Index].Tag;
}

function int CopyTo(ObjectArray Arr, string Tag)
{
    local int i;

    i = FindTagId(Tag);
    // End:0x4b
    if(i >= 0)
    {
        Arr.Add(AllItems[i].Item, AllItems[i].Tag);
    }
    return i;
}

function int CopyItemTo(ObjectArray Arr, Object Item)
{
    local int i;

    i = FindItemId(Item);
    // End:0x4b
    if(i >= 0)
    {
        Arr.Add(AllItems[i].Item, AllItems[i].Tag);
    }
    return i;
}

singular function SetSortOrder(bool Order)
{
    ReverseSort = Order;
}

singular function ToggleSort()
{
    ReverseSort = !ReverseSort;
}

function bool IsBefore(string Test, string Tag)
{
    return !ReverseSort && Caps(Test) < Caps(Tag) || ReverseSort && Caps(Test) > Caps(Tag);
}
