/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_BuddyList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class UT2k4Browser_BuddyList extends ServerBrowserMCList
    editinlinenew
    instanced;

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    // End:0x3f
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, UT2k4Browser_ServerListPageBuddy(tp_MyPage).Buddies[i], FontScale);
}

function string GetSortString(int i)
{
    // End:0x3a
    if(i < UT2k4Browser_ServerListPageBuddy(tp_MyPage).Buddies.Length)
    {
        return Caps(UT2k4Browser_ServerListPageBuddy(tp_MyPage).Buddies[i]);
    }
    return "";
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    ExpandLastColumn=true
}