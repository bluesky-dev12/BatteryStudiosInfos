class PlayInfoList extends GUIMultiColumnList
    editinlinenew
    instanced;

var PlayInfo GamePI;

function Refresh()
{
    local int i;

    Clear();
    i = 0;
    J0x0D:

    // End:0x36 [Loop If]
    if(i < GamePI.Settings.Length)
    {
        AddedItem();
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function InternalOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GamePI.Settings[SortData[i].SortItem].DisplayName, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GamePI.Settings[SortData[i].SortItem].Value, FontScale);
    //return;    
}

event string GetSortString(int ItemIndex)
{
    // End:0x30
    if(SortColumn == 0)
    {
        return GamePI.Settings[SortData[ItemIndex].SortItem].DisplayName;
    }
    return GamePI.Settings[SortData[ItemIndex].SortItem].Value;
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    ExpandLastColumn=true
    OnDrawItem=PlayInfoList.InternalOnDrawItem
    IniOption="@Internal"
}