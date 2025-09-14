/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteCountMultiColumnList.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:10
 *
 *******************************************************************************/
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
    // End:0x3b [While If]
    if(i < VRI.MapVoteCount.Length)
    {
        AddedItem();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    __OnDrawItem__Delegate = DrawItem;
}

function UpdatedVoteCount(int UpdatedIndex, bool bRemoved)
{
    // End:0x17
    if(bRemoved)
    {
        RemovedItem(UpdatedIndex);
    }
    // End:0x3a
    else
    {
        // End:0x2f
        if(UpdatedIndex >= ItemCount)
        {
            AddedItem();
        }
        // End:0x3a
        else
        {
            UpdatedItem(UpdatedIndex);
        }
    }
    OnSortChanged();
}

function int GetSelectedMapIndex()
{
    return VRI.MapVoteCount[SortData[Index].SortItem].MapIndex;
}

function int GetSelectedGameConfigIndex()
{
    return VRI.MapVoteCount[SortData[Index].SortItem].GameConfigIndex;
}

function string GetSelectedMapName()
{
    // End:0x4b
    if(Index > -1)
    {
        return VRI.MapList[VRI.MapVoteCount[SortData[Index].SortItem].MapIndex].MapName;
    }
    // End:0x4e
    else
    {
        return "";
    }
}

function DrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DrawStyle;

    // End:0x0d
    if(VRI == none)
    {
        return;
    }
    // End:0x5d
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, MenuState, X, Y - float(2), W, H + float(2));
        DrawStyle = SelectedStyle;
    }
    // End:0x68
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
}

function string GetSortString(int i)
{
    local string ColumnData[5];

    ColumnData[0] = Left(Caps(VRI.GameConfig[VRI.MapVoteCount[i].GameConfigIndex].GameName), 15);
    ColumnData[1] = Left(Caps(VRI.MapList[VRI.MapVoteCount[i].MapIndex].MapName), 20);
    ColumnData[2] = Right("0000" $ string(VRI.MapVoteCount[i].VoteCount), 4);
    return ColumnData[SortColumn] $ ColumnData[PrevSortColumn];
}

event OnSortChanged()
{
    super.OnSortChanged();
    PrevSortColumn = SortColumn;
}

function free()
{
    VRI = none;
    super(GUIComponent).free();
}

function bool InternalOnDragDrop(GUIComponent Sender)
{
    return true;
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    ColumnHeadingHints=// Object reference not set to an instance of an object.
    
    SortColumn=2
    SortDescending=true
    SelectedStyleName="BrowserListSelection"
    StyleName="ServerBrowserGrid"
}