/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\PlayerInfoMultiColumnList.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class PlayerInfoMultiColumnList extends GUIMultiColumnList
    editinlinenew
    instanced;

struct PlayerInfoData
{
    var string Label;
    var string Value;
};

var array<PlayerInfoData> ListData;

function Add(string Label, string Value)
{
    ListData.Insert(ListData.Length, 1);
    ListData[ListData.Length - 1].Label = Label;
    ListData[ListData.Length - 1].Value = Value;
    AddedItem();
}

function DrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    // End:0x2f
    if(i >= SortData.Length || SortData[i].SortItem >= ListData.Length)
    {
        return;
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, ListData[SortData[i].SortItem].Label, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, ListData[SortData[i].SortItem].Value, FontScale);
}

function string GetSortString(int i)
{
    return ListData[0].Label;
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    ColumnHeadingHints=// Object reference not set to an instance of an object.
    
    SortDescending=true
    SelectedStyleName="BrowserListSelection"
    OnDrawItem=DrawItem
    StyleName="ServerBrowserGrid"
}