class listitem extends Object;

var listitem Next;
var listitem Prev;
var string Tag;
var string Data;
var bool bJustMoved;

function AddElement(listitem NewElement)
{
    local listitem TempItem;

    TempItem = self;
    J0x07:

    // End:0x32 [Loop If]
    if(TempItem.Next != none)
    {
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x07;
    }
    TempItem.Next = NewElement;
    NewElement.Prev = TempItem;
    NewElement.Next = none;
    //return;    
}

function AddSortedElement(out listitem FirstElement, listitem NewElement)
{
    local listitem TempItem;

    TempItem = FirstElement;
    J0x0B:

    // End:0x152 [Loop If]
    if(TempItem != none)
    {
        // End:0x8F
        if((Caps(TempItem.Tag) <= Caps(NewElement.Tag)) && TempItem.Next == none)
        {
            TempItem.Next = NewElement;
            NewElement.Prev = TempItem;
            NewElement.Next = none;
            // [Explicit Break]
            goto J0x152;            
        }
        else
        {
            // End:0x13B
            if(Caps(TempItem.Tag) > Caps(NewElement.Tag))
            {
                // End:0xD6
                if(TempItem.Prev == none)
                {
                    FirstElement = NewElement;                    
                }
                else
                {
                    TempItem.Prev.Next = NewElement;
                }
                NewElement.Prev = TempItem.Prev;
                NewElement.Next = TempItem;
                TempItem.Prev = NewElement;
                // [Explicit Break]
                goto J0x152;
            }
        }
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x152:

    //return;    
}

function listitem FindItem(string SearchData)
{
    local listitem TempItem;

    TempItem = self;
    J0x07:

    // End:0x47 [Loop If]
    if(TempItem != none)
    {
        // End:0x30
        if(TempItem.Data ~= SearchData)
        {
            return TempItem;
        }
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function listitem DeleteElement(out listitem first, optional string SearchData)
{
    local listitem TempItem;

    TempItem = self;
    J0x07:

    // End:0x13D [Loop If]
    if(TempItem != none)
    {
        // End:0x126
        if((TempItem.Data ~= SearchData) || SearchData == "")
        {
            // End:0x8F
            if((TempItem == first) || TempItem.Prev == none)
            {
                first = TempItem.Next;
                // End:0x8C
                if(first != none)
                {
                    first.Prev = none;
                }                
            }
            else
            {
                // End:0xC9
                if(TempItem.Prev != none)
                {
                    TempItem.Prev.Next = TempItem.Next;
                }
                // End:0x103
                if(TempItem.Next != none)
                {
                    TempItem.Next.Prev = TempItem.Prev;
                }
            }
            TempItem.Prev = none;
            TempItem.Next = none;
            // [Explicit Break]
            goto J0x13D;
        }
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x07;
    }
    J0x13D:

    return TempItem;
    //return;    
}

function MoveElementUp(out listitem first, listitem MoveItem, out int Count)
{
    local listitem TempItem;
    local int tempCount;

    // End:0x145
    if(MoveItem != none)
    {
        tempCount = Count;
        J0x16:

        // End:0x133 [Loop If]
        if((tempCount > 0) && MoveItem.Prev != none)
        {
            TempItem = MoveItem.Prev;
            MoveItem.Prev = TempItem.Prev;
            // End:0x99
            if(MoveItem.Prev != none)
            {
                MoveItem.Prev.Next = MoveItem;
            }
            TempItem.Next = MoveItem.Next;
            // End:0xE7
            if(TempItem.Next != none)
            {
                TempItem.Next.Prev = TempItem;
            }
            MoveItem.Next = TempItem;
            TempItem.Prev = MoveItem;
            // End:0x129
            if(TempItem == first)
            {
                first = MoveItem;
            }
            tempCount--;
            // [Loop Continue]
            goto J0x16;
        }
        Count = Count - tempCount;
    }
    //return;    
}

function MoveElementDown(out listitem first, listitem MoveItem, out int Count)
{
    local listitem TempItem;
    local int tempCount;

    // End:0x145
    if(MoveItem != none)
    {
        tempCount = Count;
        J0x16:

        // End:0x133 [Loop If]
        if((tempCount > 0) && MoveItem.Next != none)
        {
            TempItem = MoveItem.Next;
            MoveItem.Next = TempItem.Next;
            // End:0x99
            if(MoveItem.Next != none)
            {
                MoveItem.Next.Prev = MoveItem;
            }
            TempItem.Prev = MoveItem.Prev;
            // End:0xE7
            if(TempItem.Prev != none)
            {
                TempItem.Prev.Next = TempItem;
            }
            MoveItem.Prev = TempItem;
            TempItem.Next = MoveItem;
            // End:0x129
            if(MoveItem == first)
            {
                first = TempItem;
            }
            tempCount--;
            // [Loop Continue]
            goto J0x16;
        }
        Count = Count - tempCount;
    }
    //return;    
}

function RunTest()
{
    local listitem Test, TempItem;

    Log("Test: Init 'B'");
    Test = new (none) Class'XWebAdmin_Decompressed.listitem';
    Test.Tag = "B";
    Test.Data = "B";
    Log("  => Test=" $ string(Test));
    TempItem = new (none) Class'XWebAdmin_Decompressed.listitem';
    TempItem.Tag = "A";
    TempItem.Data = "A";
    Log("Test: AddSort 'A'");
    Test.AddSortedElement(Test, TempItem);
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0xDF:

    // End:0x156 [Loop If]
    if(TempItem != none)
    {
        Log((((("  => Tag=" $ TempItem.Tag) $ " Prev=") $ string(TempItem.Prev)) $ " Next=") $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0xDF;
    }
    TempItem = new (none) Class'XWebAdmin_Decompressed.listitem';
    TempItem.Tag = "D";
    TempItem.Data = "D";
    Log("Test: AddSort 'D'");
    Test.AddSortedElement(Test, TempItem);
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x1D9:

    // End:0x250 [Loop If]
    if(TempItem != none)
    {
        Log((((("  => Tag=" $ TempItem.Tag) $ " Prev=") $ string(TempItem.Prev)) $ " Next=") $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x1D9;
    }
    TempItem = new (none) Class'XWebAdmin_Decompressed.listitem';
    TempItem.Tag = "C";
    TempItem.Data = "C";
    Log("Test: AddSort 'C'");
    Test.AddSortedElement(Test, TempItem);
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x2D3:

    // End:0x34A [Loop If]
    if(TempItem != none)
    {
        Log((((("  => Tag=" $ TempItem.Tag) $ " Prev=") $ string(TempItem.Prev)) $ " Next=") $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x2D3;
    }
    Log("");
    Log("Test: Delete 'C'");
    Test.DeleteElement(Test, "C");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x39B:

    // End:0x412 [Loop If]
    if(TempItem != none)
    {
        Log((((("  => Tag=" $ TempItem.Tag) $ " Prev=") $ string(TempItem.Prev)) $ " Next=") $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x39B;
    }
    Log("Test: Delete 'D'");
    Test.DeleteElement(Test, "D");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x45F:

    // End:0x4D6 [Loop If]
    if(TempItem != none)
    {
        Log((((("  => Tag=" $ TempItem.Tag) $ " Prev=") $ string(TempItem.Prev)) $ " Next=") $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x45F;
    }
    Log("Test: Delete 'A'");
    Test.DeleteElement(Test, "A");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x523:

    // End:0x59A [Loop If]
    if(TempItem != none)
    {
        Log((((("  => Tag=" $ TempItem.Tag) $ " Prev=") $ string(TempItem.Prev)) $ " Next=") $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x523;
    }
    Log("Test: Delete 'B'");
    Test.DeleteElement(Test, "B");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x5E7:

    // End:0x65E [Loop If]
    if(TempItem != none)
    {
        Log((((("  => Tag=" $ TempItem.Tag) $ " Prev=") $ string(TempItem.Prev)) $ " Next=") $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // [Loop Continue]
        goto J0x5E7;
    }
    //return;    
}
