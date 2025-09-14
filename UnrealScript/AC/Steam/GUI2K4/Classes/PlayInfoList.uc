/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\PlayInfoList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class PlayInfoList extends GUIMultiColumnList
    editinlinenew
    instanced;

var PlayInfo GamePI;

function Refresh()
{
    local int i;

    Clear();
    i = 0;
    J0x0d:
    // End:0x36 [While If]
    if(i < GamePI.Settings.Length)
    {
        AddedItem();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function InternalOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GamePI.Settings[SortData[i].SortItem].DisplayName, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, GamePI.Settings[SortData[i].SortItem].Value, FontScale);
}

event string GetSortString(int ItemIndex)
{
    // End:0x30
    if(SortColumn == 0)
    {
        return GamePI.Settings[SortData[ItemIndex].SortItem].DisplayName;
    }
    return GamePI.Settings[SortData[ItemIndex].SortItem].Value;
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    ExpandLastColumn=true
    OnDrawItem=InternalOnDrawItem
    IniOption="@Internal"
}