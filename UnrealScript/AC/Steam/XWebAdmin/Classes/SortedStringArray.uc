/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\SortedStringArray.uc
 * Package Imports:
 *	XWebAdmin
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class SortedStringArray extends StringArray;

function int Add(coerce string Item, coerce string Tag, optional bool bUnique)
{
    local int pos;

    pos = FindTagId(Tag);
    // End:0x3a
    if(pos < 0)
    {
        return InsertAt(-pos - 1, Item, Tag);
    }
    // End:0x49
    else
    {
        // End:0x49
        if(bUnique)
        {
            return pos;
        }
    }
    return InsertAt(pos, Item, Tag);
}

function int FindTagId(coerce string Tag)
{
    local int Last, Min, Max, pos;

    Last = AllItems.Length - 1;
    // End:0x3c
    if(Last < 0 || IsBefore(Tag, AllItems[0].Tag))
    {
        return -1;
    }
    // End:0x54
    if(Tag ~= AllItems[0].Tag)
    {
        return 0;
    }
    // End:0x74
    if(Tag ~= AllItems[Last].Tag)
    {
        return Last;
    }
    // End:0xa2
    if(!IsBefore(Tag, AllItems[Last].Tag))
    {
        return -Last + 1 - 1;
    }
    Max = Last;
    pos = Last;
    // End:0xd8 [While If]
    if(Tag ~= AllItems[pos].Tag)
    {
        return pos;
    }
    // End:0x104
    if(IsBefore(Tag, AllItems[pos].Tag))
    {
        Max = pos;
    }
    // End:0x10f
    else
    {
        Min = pos;
    }
    pos = Min + Max / 2;
    // End:0xb8
    if(Max - Min < 2)
    	goto J0xb8;
    // End:0x149
    if(pos == 0)
    {
        return -2;
    }
    return -pos - 2;
}
