class UT2k4Browser_BuddyList extends ServerBrowserMCList
    editinlinenew
    instanced;

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    // End:0x3F
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, UT2k4Browser_ServerListPageBuddy(tp_MyPage).Buddies[i], FontScale);
    //return;    
}

function string GetSortString(int i)
{
    // End:0x3A
    if(i < UT2k4Browser_ServerListPageBuddy(tp_MyPage).Buddies.Length)
    {
        return Caps(UT2k4Browser_ServerListPageBuddy(tp_MyPage).Buddies[i]);
    }
    return "";
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    ExpandLastColumn=true
}