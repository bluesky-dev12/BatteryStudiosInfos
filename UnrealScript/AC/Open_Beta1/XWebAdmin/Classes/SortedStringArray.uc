class SortedStringArray extends StringArray;

function int Add(coerce string Item, coerce string Tag, optional bool bUnique)
{
    local int pos;

    pos = FindTagId(Tag);
    // End:0x3A
    if(pos < 0)
    {
        return InsertAt(-pos - 1, Item, Tag);        
    }
    else
    {
        // End:0x49
        if(bUnique)
        {
            return pos;
        }
    }
    return InsertAt(pos, Item, Tag);
    //return;    
}

function int FindTagId(coerce string Tag)
{
    local int Last, Min, Max, pos;

    Last = AllItems.Length - 1;
    // End:0x3C
    if((Last < 0) || IsBefore(Tag, AllItems[0].Tag))
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
    // End:0xA2
    if(!IsBefore(Tag, AllItems[Last].Tag))
    {
        return -Last + 1 - 1;
    }
    Max = Last;
    pos = Last;
    J0xB8:

    // End:0xD8 [Loop If]
    if(Tag ~= AllItems[pos].Tag)
    {
        return pos;
    }
    // End:0x104
    if(IsBefore(Tag, AllItems[pos].Tag))
    {
        Max = pos;        
    }
    else
    {
        Min = pos;
    }
    pos = (Min + Max) / 2;
    // End:0xB8
    if(!((Max - Min) < 2))
        goto J0xB8;
    // End:0x149
    if(pos == 0)
    {
        return -2;
    }
    return -pos - 2;
    //return;    
}
