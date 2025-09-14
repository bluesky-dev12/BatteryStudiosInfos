/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\listitem.uc
 * Package Imports:
 *	XWebAdmin
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:7
 *
 *******************************************************************************/
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
    // End:0x32 [While If]
    if(TempItem.Next != none)
    {
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    TempItem.Next = NewElement;
    NewElement.Prev = TempItem;
    NewElement.Next = none;
}

function AddSortedElement(out listitem FirstElement, listitem NewElement)
{
    local listitem TempItem;

    TempItem = FirstElement;
    J0x0b:
    // End:0x152 [While If]
    if(TempItem != none)
    {
        // End:0x8f
        if(Caps(TempItem.Tag) <= Caps(NewElement.Tag) && TempItem.Next == none)
        {
            TempItem.Next = NewElement;
            NewElement.Prev = TempItem;
            NewElement.Next = none;
            // This is an implied JumpToken;
            goto J0x152;
        }
        // End:0x13b
        else
        {
            // End:0x13b
            if(Caps(TempItem.Tag) > Caps(NewElement.Tag))
            {
                // End:0xd6
                if(TempItem.Prev == none)
                {
                    FirstElement = NewElement;
                }
                // End:0xf3
                else
                {
                    TempItem.Prev.Next = NewElement;
                }
                NewElement.Prev = TempItem.Prev;
                NewElement.Next = TempItem;
                TempItem.Prev = NewElement;
            }
            // End:0x152
            else
            {
            }
            TempItem = TempItem.Next;
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
    }
}

function listitem FindItem(string SearchData)
{
    local listitem TempItem;

    TempItem = self;
    J0x07:
    // End:0x47 [While If]
    if(TempItem != none)
    {
        // End:0x30
        if(TempItem.Data ~= SearchData)
        {
            return TempItem;
        }
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function listitem DeleteElement(out listitem first, optional string SearchData)
{
    local listitem TempItem;

    TempItem = self;
    J0x07:
    // End:0x13d [While If]
    if(TempItem != none)
    {
        // End:0x126
        if(TempItem.Data ~= SearchData || SearchData == "")
        {
            // End:0x8f
            if(TempItem == first || TempItem.Prev == none)
            {
                first = TempItem.Next;
                // End:0x8c
                if(first != none)
                {
                    first.Prev = none;
                }
            }
            // End:0x103
            else
            {
                // End:0xc9
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
        }
        // End:0x13d
        else
        {
            TempItem = TempItem.Next;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    return TempItem;
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
        // End:0x133 [While If]
        if(tempCount > 0 && MoveItem.Prev != none)
        {
            TempItem = MoveItem.Prev;
            MoveItem.Prev = TempItem.Prev;
            // End:0x99
            if(MoveItem.Prev != none)
            {
                MoveItem.Prev.Next = MoveItem;
            }
            TempItem.Next = MoveItem.Next;
            // End:0xe7
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
            -- tempCount;
            // This is an implied JumpToken; Continue!
            goto J0x16;
        }
        Count = Count - tempCount;
    }
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
        // End:0x133 [While If]
        if(tempCount > 0 && MoveItem.Next != none)
        {
            TempItem = MoveItem.Next;
            MoveItem.Next = TempItem.Next;
            // End:0x99
            if(MoveItem.Next != none)
            {
                MoveItem.Next.Prev = MoveItem;
            }
            TempItem.Prev = MoveItem.Prev;
            // End:0xe7
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
            -- tempCount;
            // This is an implied JumpToken; Continue!
            goto J0x16;
        }
        Count = Count - tempCount;
    }
}

function RunTest()
{
    local listitem Test, TempItem;

    Log("Test: Init 'B'");
    Test = new (none) class'listitem';
    Test.Tag = "B";
    Test.Data = "B";
    Log("  => Test=" $ string(Test));
    TempItem = new (none) class'listitem';
    TempItem.Tag = "A";
    TempItem.Data = "A";
    Log("Test: AddSort 'A'");
    Test.AddSortedElement(Test, TempItem);
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0xdf:
    // End:0x156 [While If]
    if(TempItem != none)
    {
        Log("  => Tag=" $ TempItem.Tag $ " Prev=" $ string(TempItem.Prev) $ " Next=" $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0xdf;
    }
    TempItem = new (none) class'listitem';
    TempItem.Tag = "D";
    TempItem.Data = "D";
    Log("Test: AddSort 'D'");
    Test.AddSortedElement(Test, TempItem);
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x1d9:
    // End:0x250 [While If]
    if(TempItem != none)
    {
        Log("  => Tag=" $ TempItem.Tag $ " Prev=" $ string(TempItem.Prev) $ " Next=" $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x1d9;
    }
    TempItem = new (none) class'listitem';
    TempItem.Tag = "C";
    TempItem.Data = "C";
    Log("Test: AddSort 'C'");
    Test.AddSortedElement(Test, TempItem);
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x2d3:
    // End:0x34a [While If]
    if(TempItem != none)
    {
        Log("  => Tag=" $ TempItem.Tag $ " Prev=" $ string(TempItem.Prev) $ " Next=" $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x2d3;
    }
    Log("");
    Log("Test: Delete 'C'");
    Test.DeleteElement(Test, "C");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x39b:
    // End:0x412 [While If]
    if(TempItem != none)
    {
        Log("  => Tag=" $ TempItem.Tag $ " Prev=" $ string(TempItem.Prev) $ " Next=" $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x39b;
    }
    Log("Test: Delete 'D'");
    Test.DeleteElement(Test, "D");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x45f:
    // End:0x4d6 [While If]
    if(TempItem != none)
    {
        Log("  => Tag=" $ TempItem.Tag $ " Prev=" $ string(TempItem.Prev) $ " Next=" $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x45f;
    }
    Log("Test: Delete 'A'");
    Test.DeleteElement(Test, "A");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x523:
    // End:0x59a [While If]
    if(TempItem != none)
    {
        Log("  => Tag=" $ TempItem.Tag $ " Prev=" $ string(TempItem.Prev) $ " Next=" $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x523;
    }
    Log("Test: Delete 'B'");
    Test.DeleteElement(Test, "B");
    Log("  => Test=" $ string(Test));
    TempItem = Test;
    J0x5e7:
    // End:0x65e [While If]
    if(TempItem != none)
    {
        Log("  => Tag=" $ TempItem.Tag $ " Prev=" $ string(TempItem.Prev) $ " Next=" $ string(TempItem.Next));
        TempItem = TempItem.Next;
        // This is an implied JumpToken; Continue!
        goto J0x5e7;
    }
}
