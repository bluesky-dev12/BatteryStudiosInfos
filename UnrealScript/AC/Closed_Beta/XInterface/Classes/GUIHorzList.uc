class GUIHorzList extends GUIListBase
    native
    editinlinenew
    instanced;

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, NewIndex;

    i = int(float(Top) + ((Controller.MouseX - ClientBounds[0]) / ItemWidth));
    // End:0x54
    if((i >= ItemCount) && bRequireValidIndex)
    {
        i = -1;
    }
    NewIndex = Min(i, ItemCount - 1);
    return NewIndex;
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int NewIndex;

    // End:0x1A
    if(!IsInClientBounds() || ItemsPerPage == 0)
    {
        return false;
    }
    NewIndex = CalculateIndex();
    SetIndex(NewIndex);
    return true;
    //return;    
}

function bool InternalOnKeyType(out byte key, optional string Unicode)
{
    return false;
    //return;    
}

function WheelUp()
{
    // End:0x22
    if(MyScrollBar != none)
    {
        GUIHorzScrollBar(MyScrollBar).WheelUp();        
    }
    else
    {
        // End:0x3F
        if(!Controller.CtrlPressed)
        {
            ScrollLeft();            
        }
        else
        {
            PgUp();
        }
    }
    //return;    
}

function WheelDown()
{
    // End:0x22
    if(MyScrollBar != none)
    {
        GUIHorzScrollBar(MyScrollBar).WheelDown();        
    }
    else
    {
        // End:0x3F
        if(!Controller.CtrlPressed)
        {
            ScrollRight();            
        }
        else
        {
            PgDn();
        }
    }
    //return;    
}

function bool MoveLeft()
{
    // End:0x1B
    if((ItemCount < 2) || Index == 0)
    {
        return true;
    }
    Index = Max(0, Index - 1);
    // End:0x71
    if((Index < Top) || Index > (Top + ItemsPerPage))
    {
        Top = Index;
        MyScrollBar.AlignThumb();
    }
    return true;
    //return;    
}

function bool MoveRight()
{
    // End:0x22
    if((ItemCount < 2) || Index == (ItemCount - 1))
    {
        return true;
    }
    Index = Min(Index + 1, ItemCount - 1);
    // End:0x6A
    if(Index < Top)
    {
        Top = Index;
        MyScrollBar.AlignThumb();        
    }
    else
    {
        // End:0xA8
        if(Index >= (Top + ItemsPerPage))
        {
            Top = (Index - ItemsPerPage) + 1;
            MyScrollBar.AlignThumb();
        }
    }
    return true;
    //return;    
}

function ScrollLeft()
{
    MoveLeft();
    //return;    
}

function ScrollRight()
{
    MoveRight();
    //return;    
}

function home()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(0);
    Top = 0;
    MyScrollBar.AlignThumb();
    //return;    
}

function End()
{
    // End:0x0E
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
    //return;    
}

function PgUp()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    Index -= ItemsPerPage;
    // End:0x2C
    if(Index < 0)
    {
        Index = 0;
    }
    // End:0x50
    if((Top + ItemsPerPage) <= Index)
    {
        Top = Index;        
    }
    else
    {
        // End:0x74
        if((Index + ItemsPerPage) < Top)
        {
            Top = Index;            
        }
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
    //return;    
}

function PgDn()
{
    // End:0x0E
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
    else
    {
        // End:0x7F
        if(((Index - Top) - ItemsPerPage) >= ItemsPerPage)
        {
            SetTopItem(Index);            
        }
        else
        {
            // End:0xA7
            if((Index - Top) >= ItemsPerPage)
            {
                SetTopItem(Top + ItemsPerPage);
            }
        }
    }
    SetIndex(Index);
    MyScrollBar.AlignThumb();
    //return;    
}

defaultproperties
{
    bRequiresStyle=true
    OnClick=GUIHorzList.InternalOnClick
}