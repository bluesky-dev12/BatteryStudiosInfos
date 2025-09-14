class KickVoteMultiColumnList extends GUIMultiColumnList
    editinlinenew
    instanced;

var VotingReplicationInfo VRI;
var array<KickVoteScore> KickVoteData;
var array<string> PlayerName;
var int PrevSortColumn;

function LoadPlayerList(VotingReplicationInfo LoadVRI)
{
    local GameReplicationInfo GRI;
    local int i, X;

    // End:0x10
    if(LoadVRI == none)
    {
        return;        
    }
    else
    {
        VRI = LoadVRI;
    }
    GRI = PlayerOwner().GameReplicationInfo;
    KickVoteData.Remove(0, KickVoteData.Length);
    i = 0;
    J0x41:

    // End:0x318 [Loop If]
    if(i < GRI.PRIArray.Length)
    {
        // End:0x30E
        if((!((((GRI.PRIArray[i].PlayerName ~= "WebAdmin") || GRI.PRIArray[i].PlayerName ~= "DemoRecSpectator") && GRI.PRIArray[i].bIsSpectator) && GRI.PRIArray[i].bOnlySpectator) && GRI.PRIArray[i].bOutOfLives && !GRI.PRIArray[i].bBot) && !GRI.PRIArray[i].bAdmin)
        {
            KickVoteData.Insert(KickVoteData.Length, 1);
            PlayerName.Insert(KickVoteData.Length - 1, 1);
            PlayerName[KickVoteData.Length - 1] = GRI.PRIArray[i].PlayerName;
            KickVoteData[KickVoteData.Length - 1].PlayerID = GRI.PRIArray[i].PlayerID;
            // End:0x24E
            if(GRI.PRIArray[i].Team != none)
            {
                KickVoteData[KickVoteData.Length - 1].Team = GRI.PRIArray[i].Team.TeamIndex;                
            }
            else
            {
                KickVoteData[KickVoteData.Length - 1].Team = 255;
            }
            KickVoteData[KickVoteData.Length - 1].KickVoteCount = 0;
            X = 0;
            J0x282:

            // End:0x308 [Loop If]
            if(X < VRI.KickVoteCount.Length)
            {
                // End:0x2FE
                if(KickVoteData[KickVoteData.Length - 1].PlayerID == VRI.KickVoteCount[X].PlayerID)
                {
                    KickVoteData[KickVoteData.Length - 1].KickVoteCount = VRI.KickVoteCount[X].KickVoteCount;
                    // [Explicit Break]
                    goto J0x308;
                }
                X++;
                // [Loop Continue]
                goto J0x282;
            }
            J0x308:

            AddedItem();
        }
        i++;
        // [Loop Continue]
        goto J0x41;
    }
    SetTimer(4.0000000, true);
    __OnDrawItem__Delegate = DrawItem;
    //return;    
}

function UpdatedVoteCount(int PlayerID, int VoteCount)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5F [Loop If]
    if(i < KickVoteData.Length)
    {
        // End:0x55
        if(KickVoteData[i].PlayerID == PlayerID)
        {
            KickVoteData[i].KickVoteCount = VoteCount;
            UpdatedItem(i);
            // [Explicit Break]
            goto J0x5F;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x5F:

    OnSortChanged();
    //return;    
}

function Clear()
{
    KickVoteData.Remove(0, KickVoteData.Length);
    ItemCount = 0;
    super.Clear();
    //return;    
}

function int GetSelectedPlayerID()
{
    // End:0x2E
    if(Index > -1)
    {
        return KickVoteData[SortData[Index].SortItem].PlayerID;        
    }
    else
    {
        return -1;
    }
    //return;    
}

function string GetSelectedPlayerName()
{
    // End:0x1E
    if(Index > -1)
    {
        return PlayerName[Index];        
    }
    else
    {
        return "";
    }
    //return;    
}

function int GetSelectedTeam()
{
    return KickVoteData[SortData[Index].SortItem].Team;
    //return;    
}

function Timer()
{
    local GameReplicationInfo GRI;
    local int i, X, TeamIndex, PlayerID;
    local bool bFound;

    super(GUIComponent).Timer();
    GRI = PlayerOwner().GameReplicationInfo;
    i = 0;
    J0x1F:

    // End:0x3AC [Loop If]
    if(i < GRI.PRIArray.Length)
    {
        PlayerID = GRI.PRIArray[i].PlayerID;
        // End:0xAD
        if(GRI.PRIArray[i].Team != none)
        {
            TeamIndex = GRI.PRIArray[i].Team.TeamIndex;            
        }
        else
        {
            TeamIndex = 255;
        }
        // End:0x3A2
        if((!((((GRI.PRIArray[i].PlayerName ~= "WebAdmin") || GRI.PRIArray[i].PlayerName ~= "DemoRecSpectator") && GRI.PRIArray[i].bIsSpectator) && GRI.PRIArray[i].bOnlySpectator) && GRI.PRIArray[i].bOutOfLives && !GRI.PRIArray[i].bBot) && !GRI.PRIArray[i].bAdmin)
        {
            bFound = false;
            X = 0;
            J0x1DB:

            // End:0x270 [Loop If]
            if(X < KickVoteData.Length)
            {
                // End:0x266
                if(KickVoteData[X].PlayerID == PlayerID)
                {
                    bFound = true;
                    // End:0x263
                    if(PlayerName[X] != GRI.PRIArray[i].PlayerName)
                    {
                        PlayerName[X] = GRI.PRIArray[i].PlayerName;
                    }
                    // [Explicit Break]
                    goto J0x270;
                }
                X++;
                // [Loop Continue]
                goto J0x1DB;
            }
            J0x270:

            // End:0x3A2
            if(!bFound)
            {
                KickVoteData.Insert(KickVoteData.Length, 1);
                PlayerName.Insert(KickVoteData.Length - 1, 1);
                PlayerName[KickVoteData.Length - 1] = GRI.PRIArray[i].PlayerName;
                KickVoteData[KickVoteData.Length - 1].PlayerID = PlayerID;
                KickVoteData[KickVoteData.Length - 1].Team = TeamIndex;
                KickVoteData[KickVoteData.Length - 1].KickVoteCount = 0;
                X = 0;
                J0x316:

                // End:0x39C [Loop If]
                if(X < VRI.KickVoteCount.Length)
                {
                    // End:0x392
                    if(KickVoteData[KickVoteData.Length - 1].PlayerID == VRI.KickVoteCount[X].PlayerID)
                    {
                        KickVoteData[KickVoteData.Length - 1].KickVoteCount = VRI.KickVoteCount[X].KickVoteCount;
                        // [Explicit Break]
                        goto J0x39C;
                    }
                    X++;
                    // [Loop Continue]
                    goto J0x316;
                }
                J0x39C:

                AddedItem();
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    i = 0;
    J0x3B3:

    // End:0x4CD [Loop If]
    if(i < KickVoteData.Length)
    {
        PlayerID = KickVoteData[i].PlayerID;
        bFound = false;
        X = 0;
        J0x3E8:

        // End:0x43D [Loop If]
        if(X < GRI.PRIArray.Length)
        {
            // End:0x433
            if(PlayerID == GRI.PRIArray[X].PlayerID)
            {
                bFound = true;
                // [Explicit Break]
                goto J0x43D;
            }
            X++;
            // [Loop Continue]
            goto J0x3E8;
        }
        J0x43D:

        // End:0x4C3
        if(!bFound)
        {
            PlayerName.Remove(i, 1);
            KickVoteData.Remove(i, 1);
            X = 0;
            J0x467:

            // End:0x4B6 [Loop If]
            if(X < SortData.Length)
            {
                // End:0x4AC
                if(SortData[X].SortItem == i)
                {
                    SortData.Remove(X, 1);
                    InvSortData.Remove(X, 1);
                    // [Explicit Break]
                    goto J0x4B6;
                }
                X++;
                // [Loop Continue]
                goto J0x467;
            }
            J0x4B6:

            ItemCount--;
            OnSortChanged();
        }
        i++;
        // [Loop Continue]
        goto J0x3B3;
    }
    //return;    
}

function DrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local string TeamName;
    local export editinline GUIStyles DrawStyle;

    // End:0x2F
    if((i >= SortData.Length) || SortData[i].SortItem >= KickVoteData.Length)
    {
        return;
    }
    // End:0x7F
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
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, PlayerName[SortData[i].SortItem], FontScale);
    // End:0x155
    if(PlayerOwner().GameReplicationInfo.bTeamGame && KickVoteData[SortData[i].SortItem].Team < 4)
    {
        TeamName = Class'Engine.TeamInfo'.default.ColorNames[KickVoteData[SortData[i].SortItem].Team];        
    }
    else
    {
        TeamName = "";
    }
    GetCellLeftWidth(1, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, TeamName, FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(KickVoteData[SortData[i].SortItem].PlayerID), FontScale);
    GetCellLeftWidth(3, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(KickVoteData[SortData[i].SortItem].KickVoteCount), FontScale);
    //return;    
}

function string GetSortString(int i)
{
    local string ColumnData[4];

    ColumnData[0] = Left(Caps(PlayerName[i]), 20);
    ColumnData[1] = Left(Caps(string(KickVoteData[i].Team)), 5);
    ColumnData[2] = Right("0000" $ string(KickVoteData[i].PlayerID), 4);
    ColumnData[3] = Right("0000" $ string(KickVoteData[i].KickVoteCount), 4);
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