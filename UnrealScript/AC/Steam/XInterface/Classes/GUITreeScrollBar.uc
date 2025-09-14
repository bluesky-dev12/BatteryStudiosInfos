/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUITreeScrollBar.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:4
 *
 *******************************************************************************/
class GUITreeScrollBar extends GUIVertScrollBar
    editinlinenew
    instanced;

var() editconst noexport editinline GUITreeList List;
var delegate<MoveGripBy> __MoveGripBy__Delegate;
var delegate<AlignThumb> __AlignThumb__Delegate;

function SetList(GUIListBase InList)
{
    super(GUIScrollBarBase).SetList(InList);
    List = GUITreeList(InList);
    // End:0x3a
    if(List != none)
    {
        ItemCount = List.VisibleCount;
    }
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
    // End:0x9f
    if(CurPos > ItemCount - ItemsPerPage)
    {
        CurPos = ItemCount - ItemsPerPage;
    }
    // End:0xc1
    if(List == none && ItemCount > 0)
    {
        AlignThumb();
    }
    PositionChanged(CurPos);
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
            NewPos = 0.0;
        }
        // End:0x80
        else
        {
            NewPos = float(List.Top) / float(List.VisibleCount - List.ItemsPerPage);
        }
    }
    // End:0xb9
    else
    {
        // End:0x9c
        if(ItemCount == 0)
        {
            NewPos = 0.0;
        }
        // End:0xb9
        else
        {
            NewPos = float(CurPos) / float(ItemCount - ItemsPerPage);
        }
    }
    GripPos = FClamp(NewPos, 0.0, 1.0);
}
