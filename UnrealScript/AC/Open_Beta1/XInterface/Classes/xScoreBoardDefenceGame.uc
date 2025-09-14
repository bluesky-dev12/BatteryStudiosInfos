class xScoreBoardDefenceGame extends xScoreBoardTeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamBG(C);
    DrawContentDescription(C, 0.0000000, 0.0000000);
    DrawTeamListSectionStripe(C, 414.0000000, 8);
    DrawTeamListSection(C);
    //return;    
}

function DrawTeamBG(Canvas C)
{
    local CalCoordsW calW;
    local string GameName;

    ScoreBoardTitleBG.OffsetX = 465;
    ScoreBoardTitleBG.OffsetY = 195;
    CalculateCoordinate(C, ScoreBoardTitleBG, 671.0000000, 77.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(ScoreBoardTitleBG.WidgetTexture, calW.XL, calW.YL);
    SetMissionInfo();
    C.SetDrawColor(byte(255), 192, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, C.ClipX * 0.2918750, C.ClipY * 0.1750000, C.ClipX * 0.7087500, C.ClipY * 0.1941600, int(0.0158300 * C.ClipY), DefaultFontShadowColor);
    GameName = ((((((Level.GetMatchMaker().szSeverName $ " / ") $ Level.GetMatchMaker().szChannelName) $ " / ") $ "[") $ string(Level.GetMatchMaker().My_iRoom)) $ "] ") $ Level.GetMatchMaker().szRoomName;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * 0.2918750, C.ClipY * 0.2008300, C.ClipX * 0.7087500, C.ClipY * 0.2166600, int(0.0125000 * C.ClipY), DefaultFontShadowColor);
    WSBBG3.OffsetX = 465;
    WSBBG3.OffsetY = 278;
    CalculateCoordinate(C, WSBBG3, 671.0000000, 526.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WDEFTITLE.OffsetX = 467;
    WDEFTITLE.OffsetY = 280;
    CalculateCoordinate(C, WDEFTITLE, 667.0000000, 47.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDEFTITLE.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DrawTeamListSection(Canvas C)
{
    local int lpPRI, memberCount;
    local PlayerReplicationInfo currPRI;
    local array<PlayerReplicationInfo> pris;
    local wMatchMaker kMM;
    local string HostName;

    PRI_1st = none;
    PRI_2nd = none;
    kMM = Level.GetMatchMaker();
    // End:0xA9
    if(kMM.UserInfos.Length > 0)
    {
        memberCount = 0;
        J0x3F:

        // End:0xA9 [Loop If]
        if(memberCount < kMM.UserInfos.Length)
        {
            // End:0x9F
            if(kMM.UserInfos[memberCount].IsHost)
            {
                HostName = kMM.UserInfos[memberCount].UserName;
                // [Explicit Break]
                goto J0xA9;
            }
            ++memberCount;
            // [Loop Continue]
            goto J0x3F;
        }
    }
    J0xA9:

    Level.GRI.GetPRIArray(pris);
    memberCount = 0;
    lpPRI = 0;
    J0xD4:

    // End:0x1FE [Loop If]
    if(lpPRI < pris.Length)
    {
        currPRI = pris[lpPRI];
        // End:0x103
        if(currPRI == none)
        {
            // [Explicit Continue]
            goto J0x1F4;
        }
        // End:0x11A
        if(!currPRI.IsConnected)
        {
            // [Explicit Continue]
            goto J0x1F4;
        }
        // End:0x12F
        if(currPRI.bAdminSpecator)
        {
            // [Explicit Continue]
            goto J0x1F4;
        }
        // End:0x147
        if(currPRI.bBot == true)
        {
            // [Explicit Continue]
            goto J0x1F4;
        }
        DrawPersonListSection_C(C, 0, currPRI, memberCount, HostName, 367.0000000 * ScreenRatioYEx, 258.0000000, 268.0000000);
        // End:0x1B2
        if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
        {
            PRI_Self = currPRI;
            Ranking_Self = memberCount + 1;
        }
        // End:0x1D1
        if(PRI_1st == none)
        {
            PRI_1st = pris[lpPRI];            
        }
        else
        {
            // End:0x1ED
            if(PRI_2nd == none)
            {
                PRI_2nd = pris[lpPRI];
            }
        }
        ++memberCount;
        J0x1F4:

        ++lpPRI;
        // [Loop Continue]
        goto J0xD4;
    }
    //return;    
}

function DrawFFAScore(Canvas C, float _iPosX, float _iPosY)
{
    local CalCoordsW calW;
    local PlayerReplicationInfo currPRI1, currPRI2;

    CalculateCoordinate(C, WFFAScoreBG, 486.0000000, 71.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WFFAScoreBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0xBF
    if(PRI_Self != PRI_1st)
    {
        currPRI1 = PRI_1st;
        currPRI2 = PRI_Self;        
    }
    else
    {
        currPRI1 = PRI_Self;
        currPRI2 = PRI_2nd;
    }
    DrawRankingInfo(C, currPRI1, _iPosX, _iPosY);
    DrawRankingInfo(C, currPRI2, _iPosX, _iPosY + float(32));
    //return;    
}

function DrawTextTeamScore(Canvas C, float _OffSetX, float _OffSetY)
{
    //return;    
}
