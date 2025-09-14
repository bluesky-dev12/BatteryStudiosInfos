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
    //return;    
}

function DrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    // End:0x2F
    if((i >= SortData.Length) || SortData[i].SortItem >= ListData.Length)
    {
        return;
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, ListData[SortData[i].SortItem].Label, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, ListData[SortData[i].SortItem].Value, FontScale);
    //return;    
}

function string GetSortString(int i)
{
    return ListData[0].Label;
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    ColumnHeadingHints=/* Array type was not detected. */
    SortDescending=true
    SelectedStyleName="BrowserListSelection"
    OnDrawItem=PlayerInfoMultiColumnList.DrawItem
    StyleName="ServerBrowserGrid"
}