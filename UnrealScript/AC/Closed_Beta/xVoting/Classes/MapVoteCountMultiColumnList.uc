class MapVoteCountMultiColumnList extends GUIMultiColumnList
    editinlinenew
    instanced;

var VotingReplicationInfo VRI;
var int PrevSortColumn;

function LoadList(VotingReplicationInfo LoadVRI)
{
    local int i;

    VRI = LoadVRI;
    i = 0;
    J0x12:

    // End:0x3B [Loop If]
    if(i < VRI.MapVoteCount.Length)
    {
        AddedItem();
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    __OnDrawItem__Delegate = DrawItem;
    //return;    
}

function UpdatedVoteCount(int UpdatedIndex, bool bRemoved)
{
    // End:0x17
    if(bRemoved)
    {
        RemovedItem(UpdatedIndex);        
    }
    else
    {
        // End:0x2F
        if(UpdatedIndex >= ItemCount)
        {
            AddedItem();            
        }
        else
        {
            UpdatedItem(UpdatedIndex);
        }
    }
    OnSortChanged();
    //return;    
}

function int GetSelectedMapIndex()
{
    return VRI.MapVoteCount[SortData[Index].SortItem].MapIndex;
    //return;    
}

function int GetSelectedGameConfigIndex()
{
    return VRI.MapVoteCount[SortData[Index].SortItem].GameConfigIndex;
    //return;    
}

function string GetSelectedMapName()
{
    // End:0x4B
    if(Index > -1)
    {
        return VRI.MapList[VRI.MapVoteCount[SortData[Index].SortItem].MapIndex].MapName;        
    }
    else
    {
        return "";
    }
    //return;    
}

function DrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DrawStyle;

    // End:0x0D
    if(VRI == none)
    {
        return;
    }
    // End:0x5D
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, MenuState, X, Y - float(2), W, H + float(2));
        DrawStyle = SelectedStyle;        
    }
    else
    {
        DrawStyle = Style;
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, VRI.GameConfig[VRI.MapVoteCount[SortData[i].SortItem].GameConfigIndex].GameName, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, VRI.MapList[VRI.MapVoteCount[SortData[i].SortItem].MapIndex].MapName, FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(VRI.MapVoteCount[SortData[i].SortItem].VoteCount), FontScale);
    //return;    
}

function string GetSortString(int i)
{
    local string ColumnData[5];

    ColumnData[0] = Left(Caps(VRI.GameConfig[VRI.MapVoteCount[i].GameConfigIndex].GameName), 15);
    ColumnData[1] = Left(Caps(VRI.MapList[VRI.MapVoteCount[i].MapIndex].MapName), 20);
    ColumnData[2] = Right("0000" $ string(VRI.MapVoteCount[i].VoteCount), 4);
    return ColumnData[SortColumn] $ ColumnData[PrevSortColumn];
    //return;    
}

event OnSortChanged()
{
    super.OnSortChanged();
    PrevSortColumn = SortColumn;
    //return;    
}

function free()
{
    VRI = none;
    super(GUIComponent).free();
    //return;    
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    return true;
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    ColumnHeadingHints=/* Array type was not detected. */
    SortColumn=2
    SortDescending=true
    SelectedStyleName="BrowserListSelection"
    StyleName="ServerBrowserGrid"
}