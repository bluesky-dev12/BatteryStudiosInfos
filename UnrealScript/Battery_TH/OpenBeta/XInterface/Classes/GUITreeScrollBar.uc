class GUITreeScrollBar extends GUIVertScrollBar
    editinlinenew
    instanced;

var() /*0x00000000-0x00000008*/ editconst noexport editinline GUITreeList List;
//var delegate<MoveGripBy> __MoveGripBy__Delegate;
//var delegate<AlignThumb> __AlignThumb__Delegate;

function SetList(GUIListBase InList)
{
    super(GUIScrollBarBase).SetList(InList);
    List = GUITreeList(InList);
    // End:0x3A
    if(List != none)
    {
        ItemCount = List.VisibleCount;
    }
    //return;    
}

function UpdateGripPosition(float NewPos)
{
    // End:0x33
    if(List != none)
    {
        List.MakeVisible(NewPos);
        ItemCount = List.VisibleCount;
    }
    GripPos = NewPos;
    CurPos = int(float(ItemCount - ItemsPerPage) * GripPos);
    PositionChanged(CurPos);
    //return;    
}

delegate MoveGripBy(int items)
{
    local int NewItem;

    // End:0x59
    if(List != none)
    {
        NewItem = List.Top + items;
        ItemCount = List.VisibleCount;
        // End:0x59
        if(ItemCount > 0)
        {
            List.SetTopItem(NewItem);
        }
    }
    CurPos += items;
    // End:0x77
    if(CurPos < 0)
    {
        CurPos = 0;
    }
    // End:0x9F
    if(CurPos > (ItemCount - ItemsPerPage))
    {
        CurPos = ItemCount - ItemsPerPage;
    }
    // End:0xC1
    if((List == none) && ItemCount > 0)
    {
        AlignThumb();
    }
    PositionChanged(CurPos);
    //return;    
}

delegate AlignThumb()
{
    local float NewPos;

    // End:0x83
    if(List != none)
    {
        BigStep = List.ItemsPerPage * Step;
        // End:0x48
        if(List.ItemCount == 0)
        {
            NewPos = 0.0000000;            
        }
        else
        {
            NewPos = float(List.Top) / float(List.VisibleCount - List.ItemsPerPage);
        }        
    }
    else
    {
        // End:0x9C
        if(ItemCount == 0)
        {
            NewPos = 0.0000000;            
        }
        else
        {
            NewPos = float(CurPos) / float(ItemCount - ItemsPerPage);
        }
    }
    GripPos = FClamp(NewPos, 0.0000000, 1.0000000);
    //return;    
}
