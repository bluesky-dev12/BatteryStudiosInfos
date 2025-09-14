class SortedObjectArray extends ObjectArray;

var const bool Debug;

function Add(Object Item, string Tag)
{
    local int pos;

    // End:0x50
    if(Debug)
    {
        pos = 0;
        J0x10:

        // End:0x50 [Loop If]
        if(pos < AllItems.Length)
        {
            Log((" Member" @ string(pos)) @ AllItems[pos].Tag);
            pos++;
            // [Loop Continue]
            goto J0x10;
        }
    }
    pos = FindTagId(Tag);
    // End:0x89
    if(pos < 0)
    {
        InsertAt(-pos - 1, Item, Tag);        
    }
    else
    {
        InsertAt(pos, Item, Tag);
    }
    // End:0x11D
    if(Debug)
    {
        Log(("~~Inserting new member at" @ string(pos)) @ Tag);
        pos = 0;
        J0xDB:

        // End:0x11D [Loop If]
        if(pos < AllItems.Length)
        {
            Log(("   Member" @ string(pos)) @ AllItems[pos].Tag);
            pos++;
            // [Loop Continue]
            goto J0xDB;
        }
    }
    //return;    
}

function int FindTagId(string Tag)
{
    local int sz, Min, Max, pos;

    sz = AllItems.Length - 1;
    // End:0x78
    if((sz < 0) || IsBefore(Tag, AllItems[0].Tag))
    {
        // End:0x72
        if(Debug)
        {
            Log(Tag @ "was before first member, so returning -1");
        }
        return -1;
    }
    // End:0x90
    if(Tag ~= AllItems[0].Tag)
    {
        return 0;
    }
    // End:0xB0
    if(Tag ~= AllItems[sz].Tag)
    {
        return sz;
    }
    // End:0xC1
    if(sz == 1)
    {
        return -3;
    }
    // End:0x137
    if(!IsBefore(Tag, AllItems[sz].Tag))
    {
        // End:0x129
        if(Debug)
        {
            Log((Tag @ "was after last member, so returning") @ string(-sz + 1 - 1));
        }
        return -sz + 1 - 1;
    }
    Max = sz;
    pos = sz;
    J0x14D:

    // End:0x16D [Loop If]
    if(Tag ~= AllItems[pos].Tag)
    {
        return pos;
    }
    // End:0x199
    if(IsBefore(Tag, AllItems[pos].Tag))
    {
        Max = pos;        
    }
    else
    {
        Min = pos;
    }
    // End:0x1EB
    if(Debug)
    {
        Log((((("Min:" $ string(Min)) @ "Max:") $ string(Max)) @ "Pos:") $ string((Min + Max) / 2));
    }
    pos = (Min + Max) / 2;
    // End:0x14D
    if(!((Max - Min) < 2))
        goto J0x14D;
    // End:0x264
    if(pos == 0)
    {
        // End:0x262
        if(Debug)
        {
            Log(Tag @ "wanted to be added at 0, so adding at 1 instead");
        }
        return 1;
    }
    // End:0x2A3
    if(Debug)
    {
        Log((Tag @ "will be inserted at position") @ string(-pos - 2));
    }
    return -pos - 2;
    //return;    
}

function bool IsBefore(string test, string Tag)
{
    local bool B;

    // End:0xD7
    if(Debug)
    {
        B = (!ReverseSort && test < Tag) || ReverseSort && test > Tag;
        Log("IsBefore");
        Log("  ReverseSort:" $ string(ReverseSort));
        Log((((("  " $ test) @ "is before") @ Tag) $ ":") @ string(B));
        Log("");
        return (!ReverseSort && test < Tag) || ReverseSort && test > Tag;
    }
    return super.IsBefore(test, Tag);
    //return;    
}
