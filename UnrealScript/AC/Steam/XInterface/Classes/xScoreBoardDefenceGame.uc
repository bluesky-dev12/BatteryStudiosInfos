/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\xScoreBoardDefenceGame.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class xScoreBoardDefenceGame extends xScoreBoardTeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamBG(C);
    DrawContentDescription(C, 0.0, 0.0);
    DrawTeamListSectionStripe(C, 414.0, 8);
    DrawTeamListSection(C);
}

function DrawTeamBG(Canvas C)
{
    local CalCoordsW calW;
    local string GameName;

    ScoreBoardTitleBG.OffsetX = 465;
    ScoreBoardTitleBG.OffsetY = 195;
    CalculateCoordinate(C, ScoreBoardTitleBG, 671.0, 77.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(ScoreBoardTitleBG.WidgetTexture, calW.XL, calW.YL);
    SetMissionInfo();
    C.SetDrawColor(byte(255), 192, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, C.ClipX * 0.2918750, C.ClipY * 0.1750, C.ClipX * 0.708750, C.ClipY * 0.194160, int(0.015830 * C.ClipY), DefaultFontShadowColor);
    GameName = Level.GetMatchMaker().szSeverName $ " / " $ Level.GetMatchMaker().szChannelName $ " / " $ "[" $ string(Level.GetMatchMaker().My_iRoom) $ "] " $ Level.GetMatchMaker().szRoomName;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * 0.2918750, C.ClipY * 0.200830, C.ClipX * 0.708750, C.ClipY * 0.216660, int(0.01250 * C.ClipY), DefaultFontShadowColor);
    WSBBG3.OffsetX = 465;
    WSBBG3.OffsetY = 278;
    CalculateCoordinate(C, WSBBG3, 671.0, 526.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WDEFTITLE.OffsetX = 467;
    WDEFTITLE.OffsetY = 280;
    CalculateCoordinate(C, WDEFTITLE, 667.0, 47.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDEFTITLE.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
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
    // End:0xa9
    if(kMM.UserInfos.Length > 0)
    {
        memberCount = 0;
        J0x3f:
        // End:0xa9 [While If]
        if(memberCount < kMM.UserInfos.Length)
        {
            // End:0x9f
            if(kMM.UserInfos[memberCount].IsHost)
            {
                HostName = kMM.UserInfos[memberCount].UserName;
            }
            // End:0xa9
            else
            {
                ++ memberCount;
                // This is an implied JumpToken; Continue!
                goto J0x3f;
            }
        }
    }
    Level.GRI.GetPRIArray(pris);
    memberCount = 0;
    lpPRI = 0;
    J0xd4:
    // End:0x1fe [While If]
    if(lpPRI < pris.Length)
    {
        currPRI = pris[lpPRI];
        // End:0x103
        if(currPRI == none)
        {
        }
        // End:0x1f4
        else
        {
            // End:0x11a
            if(!currPRI.IsConnected)
            {
            }
            // End:0x1f4
            else
            {
                // End:0x12f
                if(currPRI.bAdminSpecator)
                {
                }
                // End:0x1f4
                else
                {
                    // End:0x147
                    if(currPRI.bBot == true)
                    {
                    }
                    // End:0x1f4
                    else
                    {
                        DrawPersonListSection_C(C, 0, currPRI, memberCount, HostName, 367.0 * ScreenRatioYEx, 258.0, 268.0);
                        // End:0x1b2
                        if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
                        {
                            PRI_Self = currPRI;
                            Ranking_Self = memberCount + 1;
                        }
                        // End:0x1d1
                        if(PRI_1st == none)
                        {
                            PRI_1st = pris[lpPRI];
                        }
                        // End:0x1ed
                        else
                        {
                            // End:0x1ed
                            if(PRI_2nd == none)
                            {
                                PRI_2nd = pris[lpPRI];
                            }
                        }
                        ++ memberCount;
                    }
                }
            }
        }
        ++ lpPRI;
        // This is an implied JumpToken; Continue!
        goto J0xd4;
    }
}

function DrawFFAScore(Canvas C, float _iPosX, float _iPosY)
{
    local CalCoordsW calW;
    local PlayerReplicationInfo currPRI1, currPRI2;

    CalculateCoordinate(C, WFFAScoreBG, 486.0, 71.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WFFAScoreBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0xbf
    if(PRI_Self != PRI_1st)
    {
        currPRI1 = PRI_1st;
        currPRI2 = PRI_Self;
    }
    // End:0xd5
    else
    {
        currPRI1 = PRI_Self;
        currPRI2 = PRI_2nd;
    }
    DrawRankingInfo(C, currPRI1, _iPosX, _iPosY);
    DrawRankingInfo(C, currPRI2, _iPosX, _iPosY + float(32));
}

function DrawTextTeamScore(Canvas C, float _OffSetX, float _OffSetY);
