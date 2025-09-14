/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIVertList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:14
 *
 *******************************************************************************/
class GUIVertList extends GUIListBase
    native
    editinlinenew
    instanced;

var bool CallDrawItemForPlaceHoldingItems;
var delegate<GetItemHeight> __GetItemHeight__Delegate;

delegate float GetItemHeight(Canvas C);
function CenterMouse()
{
    local PlayerController PC;
    local float X, Y;

    // End:0x85
    if(IsValid())
    {
        PC = PlayerOwner();
        // End:0x83
        if(PC != none)
        {
            SetTopItem(Index);
            X = ActualLeft() + ActualWidth() / float(2);
            Y = float(Index - Top) * ItemHeight;
            PC.ConsoleCommand("SETMOUSE" @ string(X) @ string(Y));
        }
        return;
    }
    super(GUIComponent).CenterMouse();
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, NewIndex;

    i = int(float(Top) + Controller.MouseY - ClientBounds[1] / ItemHeight);
    // End:0x54
    if(i >= ItemCount && bRequireValidIndex)
    {
        i = -1;
    }
    NewIndex = Min(i, ItemCount - 1);
    return NewIndex;
}

event int MultiCalculateIndex(optional bool bRequireValidIndex)
{
    local int i, j;

    j = int(float(int(Controller.MouseX - ClientBounds[0])) / ItemWidth);
    // End:0x4f
    if(j >= ItemCount && bRequireValidIndex)
    {
        j = -1;
    }
    i = int(float(Top) + Controller.MouseY - ClientBounds[1] / ItemHeight);
    // End:0xa3
    if(i >= ItemCount && bRequireValidIndex)
    {
        i = -1;
    }
    i = j + i * 2 - Top;
    // End:0xd5
    if(i >= ItemCount)
    {
        return -1;
    }
    return i;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x1a
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return false;
    }
    NewIndex = CalculateIndex();
    SetIndex(NewIndex);
    return true;
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    return false;
}

function WheelUp()
{
    // End:0x22
    if(MyScrollBar != none)
    {
        GUIVertScrollBar(MyScrollBar).WheelUp();
    }
    // End:0x45
    else
    {
        // End:0x3f
        if(!Controller.CtrlPressed)
        {
            Up();
        }
        // End:0x45
        else
        {
            PgUp();
        }
    }
}

function WheelDown()
{
    // End:0x22
    if(MyScrollBar != none)
    {
        GUIVertScrollBar(MyScrollBar).WheelDown();
    }
    // End:0x45
    else
    {
        // End:0x3f
        if(!Controller.CtrlPressed)
        {
            Down();
        }
        // End:0x45
        else
        {
            PgDn();
        }
    }
}

function bool Up()
{
    // End:0x1b
    if(ItemCount < 2 || Index == 0)
    {
        return true;
    }
    SetIndex(Max(0, Index - 1));
    // End:0x4a
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function bool Down()
{
    // End:0x22
    if(ItemCount < 2 || Index == ItemCount - 1)
    {
        return true;
    }
    SetIndex(Min(Index + 1, ItemCount - 1));
    // End:0x58
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
}

function home()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(0);
    // End:0x33
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function End()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(ItemCount - 1);
    // End:0x3a
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function PgUp()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(Max(0, Index - ItemsPerPage));
    // End:0x41
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

function PgDn()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(Min(Index + ItemsPerPage, ItemCount - 1));
    // End:0x48
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

defaultproperties
{
    bRequiresStyle=true
    OnClick=InternalOnClick
}