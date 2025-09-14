class UT2k4Browser_PlayersList extends ServerBrowserMCList
    editinlinenew
    instanced;

var array<PlayerResponseLine> Players;

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local export editinline GUIStyles DrawStyle;
    local Color TempColor;
    local int Team, PlayerStat;

    // End:0x4D
    if(bSelected)
    {
        DrawStyle = SelectedStyle;
        DrawStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));        
    }
    else
    {
        DrawStyle = Style;
    }
    TempColor = DrawStyle.FontColors[int(MenuState)];
    PlayerStat = Players[SortData[i].SortItem].StatsID;
    Team = (PlayerStat >> 29) - 1;
    PlayerStat = PlayerStat & 268435456;
    // End:0xF3
    if((Team == 0) || Team == 1)
    {
        DrawStyle.FontColors[int(MenuState)] = SetColor(Team);
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
    DrawStyle.FontColors[int(MenuState)] = TempColor;
    //return;    
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
    else
    {
        Col.R = 128;
        Col.B = byte(255);
        Col.G = 192;
        Col.A = byte(255);
    }
    return Col;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1A
    if(super(GUIListBase).InternalOnKeyEvent(key, State, Delta))
    {
        return true;
    }
    // End:0x68
    if(int(State) == 3)
    {
        switch(key)
        {
            // End:0x4F
            case 13:
                tp_MyPage.li_Server.Connect(false);
                return true;
            // End:0x65
            case 116:
                tp_MyPage.RefreshList();
                return true;
            // End:0xFFFF
            default:
                break;
            }
    }
    else
    {
        return false;
        //return;        
    }
}

function AddNewPlayer(PlayerResponseLine NewPlayer)
{
    Players[Players.Length] = NewPlayer;
    AddedItem();
    //return;    
}

function Clear()
{
    ItemCount = 0;
    Players.Remove(0, Players.Length);
    super(GUIMultiColumnList).Clear();
    //return;    
}

function string GetSortString(int i)
{
    local string S;

    switch(SortColumn)
    {
        // End:0x2A
        case 0:
            S = Left(Caps(Players[i].PlayerName), 8);
            // End:0xBE
            break;
        // End:0x5A
        case 1:
            S = string(Players[i].Score);
            PadLeft(S, 4, "0");
            // End:0xBE
            break;
        // End:0x92
        case 2:
            S = string(Players[i].StatsID & 268435456);
            PadLeft(S, 9, "0");
            // End:0xBE
            break;
        // End:0xFFFF
        default:
            S = string(Players[i].Ping);
            PadLeft(S, 5, "0");
            break;
    }
    return S;
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    ExpandLastColumn=true
}