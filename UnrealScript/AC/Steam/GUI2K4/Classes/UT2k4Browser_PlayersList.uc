/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_PlayersList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class UT2k4Browser_PlayersList extends ServerBrowserMCList
    dependson(ServerBrowserMCList)
    editinlinenew
    instanced;

var array<PlayerResponseLine> Players;

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DrawStyle;
    local Color TempColor;
    local int Team, PlayerStat;

    // End:0x4d
    if(bSelected)
    {
        DrawStyle = SelectedStyle;
        DrawStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
    }
    // End:0x58
    else
    {
        DrawStyle = Style;
    }
    TempColor = DrawStyle.FontColors[MenuState];
    PlayerStat = Players[SortData[i].SortItem].StatsID;
    Team = PlayerStat >> 29 - 1;
    PlayerStat = PlayerStat & 268435456;
    // End:0xf3
    if(Team == 0 || Team == 1)
    {
        DrawStyle.FontColors[MenuState] = SetColor(Team);
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Players[SortData[i].SortItem].PlayerName, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(Players[SortData[i].SortItem].Score), FontScale);
    // End:0x223
    if(Players[SortData[i].SortItem].StatsID != 0)
    {
        GetCellLeftWidth(2, CellLeft, CellWidth);
        DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(PlayerStat), FontScale);
    }
    GetCellLeftWidth(3, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(Players[SortData[i].SortItem].Ping), FontScale);
    DrawStyle.FontColors[MenuState] = TempColor;
}

function Color SetColor(int TeamNum)
{
    local Color Col;

    // End:0x46
    if(TeamNum == 0)
    {
        Col.R = byte(255);
        Col.B = 0;
        Col.G = 0;
        Col.A = byte(255);
    }
    // End:0x7e
    else
    {
        Col.R = 128;
        Col.B = byte(255);
        Col.G = 192;
        Col.A = byte(255);
    }
    return Col;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1a
    if(super(GUIListBase).InternalOnKeyEvent(key, State, Delta))
    {
        return true;
    }
    // End:0x68
    if(State == 3)
    {
        switch(key)
        {
            // End:0x4f
            case 13:
                tp_MyPage.li_Server.Connect(false);
                return true;
            // End:0x65
            case 116:
                tp_MyPage.RefreshList();
                return true;
            // End:0xffff
            default:
            }
            return false;
}

function AddNewPlayer(PlayerResponseLine NewPlayer)
{
    Players[Players.Length] = NewPlayer;
    AddedItem();
}

function Clear()
{
    ItemCount = 0;
    Players.Remove(0, Players.Length);
    super(GUIMultiColumnList).Clear();
}

function string GetSortString(int i)
{
    local string S;

    switch(SortColumn)
    {
        // End:0x2a
        case 0:
            S = Left(Caps(Players[i].PlayerName), 8);
            // End:0xbe
            break;
        // End:0x5a
        case 1:
            S = string(Players[i].Score);
            PadLeft(S, 4, "0");
            // End:0xbe
            break;
        // End:0x92
        case 2:
            S = string(Players[i].StatsID & 268435456);
            PadLeft(S, 9, "0");
            // End:0xbe
            break;
        // End:0xffff
        default:
            S = string(Players[i].Ping);
            PadLeft(S, 5, "0");
            return S;
    }
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    ExpandLastColumn=true
}