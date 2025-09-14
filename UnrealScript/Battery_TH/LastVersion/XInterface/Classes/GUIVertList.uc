class GUIVertList extends GUIListBase
    native
    editinlinenew
    instanced;

var bool CallDrawItemForPlaceHoldingItems;
//var delegate<GetItemHeight> __GetItemHeight__Delegate;

delegate float GetItemHeight(Canvas C)
{
    //return;    
}

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
            X = ActualLeft() + (ActualWidth() / float(2));
            Y = float(Index - Top) * ItemHeight;
            PC.ConsoleCommand(("SETMOUSE" @ string(X)) @ string(Y));
        }
        return;
    }
    super(GUIComponent).CenterMouse();
    //return;    
}

event int CalculateIndex(optional bool bRequireValidIndex)
{
    local int i, NewIndex;

    i = int(float(Top) + ((Controller.MouseY - ClientBounds[1]) / ItemHeight));
    // End:0x54
    if((i >= ItemCount) && bRequireValidIndex)
    {
        i = -1;
    }
    NewIndex = Min(i, ItemCount - 1);
    return NewIndex;
    //return;    
}

event int MultiCalculateIndex(optional bool bRequireValidIndex)
{
    local int i, j;

    j = int(float(int(Controller.MouseX - ClientBounds[0])) / ItemWidth);
    // End:0x4F
    if((j >= ItemCount) && bRequireValidIndex)
    {
        j = -1;
    }
    i = int(float(Top) + ((Controller.MouseY - ClientBounds[1]) / ItemHeight));
    // End:0xA3
    if((i >= ItemCount) && bRequireValidIndex)
    {
        i = -1;
    }
    i = (j + (i * 2)) - Top;
    // End:0xD5
    if(i >= ItemCount)
    {
        return -1;
    }
    return i;
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
        GUIVertScrollBar(MyScrollBar).WheelUp();        
    }
    else
    {
        // End:0x3F
        if(!Controller.CtrlPressed)
        {
            Up();            
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
        GUIVertScrollBar(MyScrollBar).WheelDown();        
    }
    else
    {
        // End:0x3F
        if(!Controller.CtrlPressed)
        {
            Down();            
        }
        else
        {
            PgDn();
        }
    }
    //return;    
}

function bool Up()
{
    // End:0x1B
    if((ItemCount < 2) || Index == 0)
    {
        return true;
    }
    SetIndex(Max(0, Index - 1));
    // End:0x4A
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    return true;
    //return;    
}

function bool Down()
{
    // End:0x22
    if((ItemCount < 2) || Index == (ItemCount - 1))
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
    // End:0x33
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function End()
{
    // End:0x0E
    if(ItemCount < 2)
    {
        return;
    }
    SetIndex(ItemCount - 1);
    // End:0x3A
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

function PgUp()
{
    // End:0x0E
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
    //return;    
}

function PgDn()
{
    // End:0x0E
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
    //return;    
}

defaultproperties
{
    bRequiresStyle=true
    OnClick=GUIVertList.InternalOnClick
}