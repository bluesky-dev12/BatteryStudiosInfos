/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIHorzList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:13
 *
 *******************************************************************************/
class GUIHorzList extends GUIListBase
    native
    editinlinenew
    instanced;

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, NewIndex;

    i = int(float(Top) + Controller.MouseX - ClientBounds[0] / ItemWidth);
    // End:0x54
    if(i >= ItemCount && bRequireValidIndex)
    {
        i = -1;
    }
    NewIndex = Min(i, ItemCount - 1);
    return NewIndex;
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
        GUIHorzScrollBar(MyScrollBar).WheelUp();
    }
    // End:0x45
    else
    {
        // End:0x3f
        if(!Controller.CtrlPressed)
        {
            ScrollLeft();
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
        GUIHorzScrollBar(MyScrollBar).WheelDown();
    }
    // End:0x45
    else
    {
        // End:0x3f
        if(!Controller.CtrlPressed)
        {
            ScrollRight();
        }
        // End:0x45
        else
        {
            PgDn();
        }
    }
}

function bool MoveLeft()
{
    // End:0x1b
    if(ItemCount < 2 || Index == 0)
    {
        return true;
    }
    Index = Max(0, Index - 1);
    // End:0x71
    if(Index < Top || Index > Top + ItemsPerPage)
    {
        Top = Index;
        MyScrollBar.AlignThumb();
    }
    return true;
}

function bool MoveRight()
{
    // End:0x22
    if(ItemCount < 2 || Index == ItemCount - 1)
    {
        return true;
    }
    Index = Min(Index + 1, ItemCount - 1);
    // End:0x6a
    if(Index < Top)
    {
        Top = Index;
        MyScrollBar.AlignThumb();
    }
    // End:0xa8
    else
    {
        // End:0xa8
        if(Index >= Top + ItemsPerPage)
        {
            Top = Index - ItemsPerPage + 1;
            MyScrollBar.AlignThumb();
        }
    }
    return true;
}

function ScrollLeft()
{
    MoveLeft();
}

function ScrollRight()
{
    MoveRight();
}

function home()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(0);
    Top = 0;
    MyScrollBar.AlignThumb();
}

function End()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    Top = ItemCount - ItemsPerPage;
    // End:0x32
    if(Top < 0)
    {
        Top = 0;
    }
    SetIndex(ItemCount - 1);
    MyScrollBar.AlignThumb();
}

function PgUp()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    Index -= ItemsPerPage;
    // End:0x2c
    if(Index < 0)
    {
        Index = 0;
    }
    // End:0x50
    if(Top + ItemsPerPage <= Index)
    {
        Top = Index;
    }
    // End:0x95
    else
    {
        // End:0x74
        if(Index + ItemsPerPage < Top)
        {
            Top = Index;
        }
        // End:0x95
        else
        {
            // End:0x95
            if(Index < Top)
            {
                SetTopItem(Top - ItemsPerPage);
            }
        }
    }
    SetIndex(Index);
    MyScrollBar.AlignThumb();
}

function PgDn()
{
    // End:0x0e
    if(ItemCount < 2)
    {
        return;
    }
    Index += ItemsPerPage;
    // End:0x37
    if(Index >= ItemCount)
    {
        Index = ItemCount - 1;
    }
    // End:0x54
    if(Index < Top)
    {
        Top = Index;
    }
    // End:0xa7
    else
    {
        // End:0x7f
        if(Index - Top - ItemsPerPage >= ItemsPerPage)
        {
            SetTopItem(Index);
        }
        // End:0xa7
        else
        {
            // End:0xa7
            if(Index - Top >= ItemsPerPage)
            {
                SetTopItem(Top + ItemsPerPage);
            }
        }
    }
    SetIndex(Index);
    MyScrollBar.AlignThumb();
}

defaultproperties
{
    bRequiresStyle=true
    OnClick=InternalOnClick
}