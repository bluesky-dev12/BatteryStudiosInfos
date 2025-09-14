class xScoreBoardDefenceGame extends xScoreBoardTeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string lsScore;
var localized string lsScoreOver;
var localized string lsRewardScore;
var localized string lsRewardClear;
var localized string lsRewardTitle;
var localized string lsGainReward;
var Image BackgroundImage;
var Image ItemRewardBG;
var Image ItemReward_Score[3];
var Image ItemReward_Clear;
var wItemBoxHK ItemRewardInfo_Score[3];
var wItemBoxHK ItemRewardInfo_Clear;
var wGameManager GameMgr;
var wDefenceRewardParam RewardParam[3];
var wDefenceRewardParam RewardParamClear;
var byte BotDifficulty;
var string strBotDifficulty;

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetDefenceRewardInfo();
    BackgroundImage = Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.WaitRoom_Defence_Reward2;
    ItemRewardBG = Class'Engine.BTCustomDrawHK'.static.MakeImage(169, 86, 0, Texture'Warfare_GP_UI_UI.Store.list_remodeling_remodelingitem');
    //return;    
}

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamBG(C);
    DrawContentDescription(C, 0.0000000, 0.0000000);
    DrawTeamListSectionStripe(C, 414.0000000, 8);
    DrawTeamListSection(C);
    DrawRewardInfo(C);
    //return;    
}

function DrawTeamBG(Canvas C)
{
    local CalCoordsW calW;
    local string GameName;

    ScoreBoardTitleBG.OffsetX = 465;
    ScoreBoardTitleBG.OffsetY = 132;
    CalculateCoordinate(C, ScoreBoardTitleBG, 671.0000000, 77.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(ScoreBoardTitleBG.WidgetTexture, calW.XL, calW.YL);
    SetMissionInfo();
    C.SetDrawColor(byte(255), 192, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, C.ClipX * 0.2918750, C.ClipY * 0.1225000, C.ClipX * 0.7087500, C.ClipY * 0.1416700, int(0.0158300 * C.ClipY), DefaultFontShadowColor);
    GameName = ((((((Level.GetMatchMaker().szSeverName $ " / ") $ Level.GetMatchMaker().szChannelName) $ " / ") $ "[") $ string(Level.GetMatchMaker().My_iRoom)) $ "] ") $ Level.GetMatchMaker().szRoomName;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * 0.2918750, C.ClipY * 0.1483000, C.ClipX * 0.7087500, C.ClipY * 0.1642000, int(0.0125000 * C.ClipY), DefaultFontShadowColor);
    WSBBG3.OffsetX = 465;
    WSBBG3.OffsetY = 215;
    CalculateCoordinate(C, WSBBG3, 671.0000000, 799.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WDEFTITLE.OffsetX = 467;
    WDEFTITLE.OffsetY = 217;
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
        DrawPersonListSection_C(C, 0, currPRI, memberCount, HostName, 303.0000000 * ScreenRatioYEx, 303.0000000, 313.0000000);
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

function DrawContentDescription(Canvas C, float _OffSetX, float _OffSetY)
{
    local CalCoordsW calW;
    local float fOffSetX, fOffSetY;

    // End:0x86
    if((Level.GRI.GameClass == "WGame.wDeathMatch") || Level.GRI.GameClass == Level.GetMatchMaker().GetDefenceGameInfo())
    {
        WContentBG.OffsetX = 467;
        WContentBG.OffsetY = 264;
    }
    CalculateCoordinate(C, WContentBG, 667.0000000, 37.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WContentBG.WidgetTexture, calW.XL, calW.YL);
    fOffSetX = (_OffSetX * ScreenRatioXEx) * C.ClipX;
    fOffSetY = (_OffSetY * ScreenRatioYEx) * C.ClipY;
    C.DrawColor = DefaultFontColor;
    fClanX1 = 0.2931250;
    // End:0x19B
    if(Level.GRI.GameClass == Level.GetMatchMaker().GetDefenceGameInfo())
    {
        fContentBeginY = 0.2275000;        
    }
    else
    {
        fContentBeginY = 0.1462500;
    }
    C.BtrDrawTextJustifiedWithVolumeLine(Clan, 1, C.ClipX * fClanX1, (C.ClipY * fContentBeginY) + fOffSetY, (C.ClipX * fClanX1) + (C.ClipX * 0.0300000), ((C.ClipY * fContentBeginY) + (C.ClipY * 0.0118750)) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fRankX1 = 0.3231250;
    C.BtrDrawTextJustifiedWithVolumeLine(Rank, 1, C.ClipX * fRankX1, (C.ClipY * fContentBeginY) + fOffSetY, (C.ClipX * fRankX1) + (C.ClipX * 0.0300000), ((C.ClipY * fContentBeginY) + (C.ClipY * 0.0118750)) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fNickNameX1 = 0.3531250;
    C.BtrDrawTextJustifiedWithVolumeLine(NickName, 1, C.ClipX * fNickNameX1, (C.ClipY * fContentBeginY) + fOffSetY, (C.ClipX * fNickNameX1) + (C.ClipX * 0.1662500), ((C.ClipY * fContentBeginY) + (C.ClipY * 0.0118750)) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fScoreX1 = 0.5193750;
    C.BtrDrawTextJustifiedWithVolumeLine(Score, 1, C.ClipX * fScoreX1, (C.ClipY * fContentBeginY) + fOffSetY, (C.ClipX * fScoreX1) + (C.ClipX * 0.0781250), ((C.ClipY * fContentBeginY) + (C.ClipY * 0.0118750)) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fKillX1 = 0.5981250;
    C.BtrDrawTextJustifiedWithVolumeLine(Kill, 1, C.ClipX * fKillX1, (C.ClipY * fContentBeginY) + fOffSetY, (C.ClipX * fKillX1) + (C.ClipX * 0.0787500), ((C.ClipY * fContentBeginY) + (C.ClipY * 0.0118750)) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fPingX1 = 0.6850000;
    fPingX2 = 0.7006250;
    C.BtrDrawTextJustifiedWithVolumeLine(Ping, 1, C.ClipX * fPingX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fPingX2, ((C.ClipY * fContentBeginY) + (C.ClipY * 0.0118750)) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    //return;    
}

function DrawPersonListSection_C(Canvas C, int lpTeam, PlayerReplicationInfo currPRI, int memberCount, string HostName, float beginY, float markBeginY, float markPingY)
{
    local int FontSize, iPing, i;
    local float X1, Y1, X2, Y2, y3, y4;

    local CalCoordsW calW;
    local Material Mark, markClan;
    local float markWidth, markHeight, markX1, markY1, IconPosY;

    local string strTemp;
    local bool Dead;
    local wMatchUserInfo UserInfo;

    markWidth = 24.0000000;
    markHeight = 24.0000000;
    Y1 = (0.2641700 * C.ClipY) + (float(memberCount) * (0.0408330 * C.ClipY));
    Y2 = Y1 + (0.0175000 * C.ClipY);
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    // End:0x1D3
    if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
    {
        TeamListBeginX = 0.2937500;
        X1 = 0.2918750 * C.ClipX;
        X2 = 0.7087500 * C.ClipX;
        y3 = (0.2525000 * C.ClipY) + (float(memberCount) * (0.0408300 * C.ClipY));
        y4 = y3 + ((float(48) * ScreenRatioYEx) * C.ClipY);
        C.SetPos(X1, y3);
        C.DrawTile(SpSelectLine.WidgetTexture, (667.0000000 * ScreenRatioXEx) * C.ClipX, (48.0000000 * ScreenRatioYEx) * C.ClipY, 0.0000000, 0.0000000, 667.0000000, 48.0000000);
    }
    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x2D7
    if((UserInfo != none) && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x2D7
        if(markClan[2] == none)
        {
            markClan[0] = Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark';
        }
    }
    i = 0;
    J0x2DE:

    // End:0x42C [Loop If]
    if(i < 3)
    {
        // End:0x422
        if(markClan[i] != none)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            markX1 = 0.2937500 * C.ClipX;
            markY1 = (0.2525000 * C.ClipY) + (float(memberCount) * (0.0408300 * C.ClipY));
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], (46.0000000 * ScreenRatioXEx) * C.ClipX, (46.0000000 * ScreenRatioYEx) * C.ClipY, 0.0000000, 0.0000000, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        i++;
        // [Loop Continue]
        goto J0x2DE;
    }
    // End:0x44F
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x5A3
    if(Mark != none)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        markX1 = 0.3243750 * C.ClipX;
        markY1 = (0.2525000 * C.ClipY) + (float(memberCount) * (0.0408300 * C.ClipY));
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, (46.0000000 * ScreenRatioXEx) * C.ClipX, (46.0000000 * ScreenRatioYEx) * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    Dead = currPRI.IsDead && (Level.GRI.GameClass != "WMission.wSDGameInfo") || int(Level.GRI.RoundState) == int(2);
    // End:0x720
    if(HostName == currPRI.PlayerName)
    {
        IconPosY = markBeginY + float(4);
        markX1 = 0.4906250 * C.ClipX;
        markY1 = (0.2525000 * C.ClipY) + (float(memberCount) * (0.0408330 * C.ClipY));
        CalculateCoordinate(C, WIconMaster, 46.0000000, 46.0000000, calW);
        C.SetPos(markX1, markY1);
        C.DrawTile(WIconMaster.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        // End:0x81A
        if(currPRI.bPrecached == false)
        {
            IconPosY = markBeginY + float(4);
            markX1 = 0.4906250 * C.ClipX;
            markY1 = (0.2525000 * C.ClipY) + (float(memberCount) * (0.0408330 * C.ClipY));
            CalculateCoordinate(C, WIconDeath, 46.0000000, 46.0000000, calW);
            C.SetPos(markX1, markY1);
            C.BtrDrawTextJustified(StrLoading, 0, calW.X1, calW.Y1, calW.X2, calW.Y2, FontSize);            
        }
        else
        {
            // End:0x917
            if(Dead)
            {
                IconPosY = markBeginY + float(4);
                markX1 = 0.4906250 * C.ClipX;
                markY1 = (0.2525000 * C.ClipY) + (float(memberCount) * (0.0408330 * C.ClipY));
                CalculateCoordinate(C, WIconDeath, 46.0000000, 46.0000000, calW);
                C.SetPos(markX1, markY1);
                C.DrawTile(WIconDeath.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
    }
    X1 = 0.3531250 * C.ClipX;
    X2 = X1 + (0.1662500 * C.ClipX);
    // End:0x974
    if(Dead)
    {
        C.DrawColor = DeadFontColor;        
    }
    else
    {
        // End:0x9BF
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.PlayerName == currPRI.PlayerName)
        {
            C.DrawColor = MyselfColor;            
        }
        else
        {
            // End:0xA1B
            if((UserInfo != none) && Level.GetMatchMaker().IsFriendlyUser(UserInfo.UserName, UserInfo.ClanName))
            {
                C.DrawColor = FriendlyColor;                
            }
            else
            {
                C.DrawColor = DefaultFontColor;
            }
        }
    }
    strTemp = GetEllipsString(C, currPRI.PlayerName, ((1111.0000000 - float(934)) / 1600.0000000) * C.ClipX, float(FontSize));
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    // End:0xACE
    if(Dead)
    {
        C.DrawColor = DeadFontColor;        
    }
    else
    {
        C.DrawColor = DefaultFontColor;
    }
    X1 = X2;
    X2 = X1 + (0.0787500 * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Score)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = X2;
    X2 = X1 + (0.0781250 * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Kills), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    WPingBack.OffsetX = 1096;
    WPingBack.OffsetY = (314 + (lpTeam * 488)) + (memberCount * 49);
    CalculateCoordinate(C, WPingBack, 25.0000000, 25.0000000, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPingBack.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iPing = currPRI.Ping;
    // End:0xCE4
    if(iPing < 0)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255));        
    }
    else
    {
        // End:0xD0A
        if(iPing < 120)
        {
            C.SetDrawColor(120, byte(255), 0);            
        }
        else
        {
            // End:0xD30
            if(iPing < 250)
            {
                C.SetDrawColor(byte(255), 204, 0);                
            }
            else
            {
                C.SetDrawColor(byte(255), 0, 0);
            }
        }
    }
    WPing.OffsetX = 1100;
    WPing.OffsetY = (318 + (lpTeam * 488)) + (memberCount * 49);
    CalculateCoordinate(C, WPing, 17.0000000, 17.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPing.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    //return;    
}

function DrawRewardInfo(Canvas C)
{
    local int lp1, lp2, sLen;
    local string strScore;
    local float fPanelX1, fPanelX2, fPanelY1, fPanelY2, fontSize1, fontSize2,
	    fPosX1, fPosX2, fPosY1, fPosY2, ratioX,
	    ratioY, XL, YL, fPosScoreX1, fPosScoreX2,
	    fPosScoreY1, fPosScoreY2;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    fPanelX1 = 467.0000000 * ratioX;
    fPanelY1 = 511.0000000 * ratioY;
    fPanelX2 = 1134.0000000 * ratioX;
    fPanelY2 = 1014.0000000 * ratioY;
    fPosX1 = 873.0000000 * ratioX;
    fPosY1 = 551.0000000 * ratioY;
    fPosX2 = 1042.0000000 * ratioX;
    fPosY2 = 637.0000000 * ratioY;
    fPosScoreX1 = 568.0000000 * ratioX;
    fPosScoreY1 = 558.0000000 * ratioY;
    fPosScoreX2 = 865.0000000 * ratioX;
    fPosScoreY2 = 579.0000000 * ratioY;
    fontSize1 = 17.0000000 * ratioY;
    fontSize2 = 12.0000000 * ratioY;
    // End:0x173
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, fPanelX1, fPanelY1, fPanelX2, fPanelY2);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsRewardTitle, 4, fontSize2, 502.0000000 * ratioX, 522.0000000 * ratioY, 1099.0000000 * ratioX, 539.0000000 * ratioY, DefaultFontShadowColor);
    lp1 = 0;
    J0x1CF:

    // End:0x27C [Loop If]
    if(lp1 < 4)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, ItemRewardBG, fPosX1, fPosY1 + (float(lp1 * 98) * ratioY), fPosX2, fPosY2 + (float(lp1 * 98) * ratioY), 0.0000000, 0.0000000, 169.0000000, 86.0000000);
        lp1++;
        // [Loop Continue]
        goto J0x1CF;
    }
    lp1 = 0;
    J0x283:

    // End:0x7BD [Loop If]
    if(lp1 < 3)
    {
        // End:0x427
        if(lp1 < 2)
        {
            C.DrawColor = C.MakeColor(byte(255), 192, 0, byte(255));
            strScore = (string(RewardParam[lp1].nGainRewardMinScore) $ " ~ ") $ string(RewardParam[lp1].nGainRewardMaxScore);
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, strScore, 0, fontSize1, fPosScoreX1, fPosScoreY1 + (float(lp1 * 98) * ratioY), fPosScoreX2, fPosScoreY2 + (float(lp1 * 98) * ratioY), DefaultFontShadowColor);
            C.BtrTextSize(strScore, 10, XL, YL);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsScore, 0, fontSize1, (fPosScoreX1 + XL) + (float(10) * ratioX), fPosScoreY1 + (float(lp1 * 98) * ratioY), fPosScoreX2, fPosScoreY2 + (float(lp1 * 98) * ratioY), DefaultFontShadowColor);            
        }
        else
        {
            // End:0x59D
            if(lp1 == 2)
            {
                C.DrawColor = C.MakeColor(byte(255), 192, 0, byte(255));
                strScore = string(RewardParam[lp1].nGainRewardMinScore);
                Class'Engine.BTCustomDrawHK'.static.DrawString(C, strScore, 0, fontSize1, fPosScoreX1, fPosScoreY1 + (float(lp1 * 98) * ratioY), fPosScoreX2, fPosScoreY2 + (float(lp1 * 98) * ratioY), DefaultFontShadowColor);
                C.BtrTextSize(strScore, 10, XL, YL);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsScoreOver, 0, fontSize1, (fPosScoreX1 + XL) + (float(10) * ratioX), fPosScoreY1 + (float(lp1 * 98) * ratioY), fPosScoreX2, fPosScoreY2 + (float(lp1 * 98) * ratioY), DefaultFontShadowColor);
            }
        }
        // End:0x626
        if(ItemReward_Score[lp1].Image != none)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, ItemReward_Score[lp1], fPosX1, fPosY1 + (float((lp1 * 98) + 20) * ratioY), fPosX2, fPosY2 + (float(lp1 * 98) * ratioY), 0.0000000, 0.0000000, 152.0000000, 64.0000000);
        }
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsRewardScore, 0, fontSize1, fPosScoreX1, fPosScoreY1 + (float((lp1 * 98) + 26) * ratioY), fPosScoreX2, fPosScoreY2 + (float((lp1 * 98) + 26) * ratioY), DefaultFontShadowColor);
        C.DrawColor = C.MakeColor(byte(255), 192, 0, byte(255));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, ItemRewardInfo_Score[lp1].ItemName, 0, fontSize2, fPosX1, fPosY1 + (float(lp1 * 98) * ratioY), fPosX2, fPosY1 + (float(15 + (lp1 * 98)) * ratioY), DefaultFontShadowColor);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, "x " $ string(RewardParam[lp1].nRewardItemCount), 0, fontSize2, 1020.0000000 * ratioX, (600.0000000 + float(lp1 * 98)) * ratioY, 1042.0000000 * ratioX, (637.0000000 + float(lp1 * 98)) * ratioY, DefaultFontShadowColor);
        lp1++;
        // [Loop Continue]
        goto J0x283;
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, ((lsRewardClear $ " (  ") $ strBotDifficulty) $ " )", 0, fontSize1, fPosScoreX1, fPosScoreY1 + (float(3 * 98) * ratioY), fPosScoreX2, fPosScoreY2 + (float(3 * 98) * ratioY), DefaultFontShadowColor);
    // End:0x8D2
    if(ItemReward_Clear.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, ItemReward_Clear, fPosX1, fPosY1 + (float((3 * 98) + 20) * ratioY), fPosX2, fPosY2 + (float(3 * 98) * ratioY), 0.0000000, 0.0000000, 152.0000000, 64.0000000);
    }
    C.DrawColor = C.MakeColor(byte(255), 192, 0, byte(255));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, ItemRewardInfo_Clear.ItemName, 0, fontSize2, fPosX1, fPosY1 + (float(3 * 98) * ratioY), fPosX2, fPosY1 + (float(15 + (3 * 98)) * ratioY), DefaultFontShadowColor);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, "x " $ string(RewardParamClear.nRewardItemCount), 0, fontSize2, 1020.0000000 * ratioX, (600.0000000 + float(3 * 98)) * ratioY, 1042.0000000 * ratioX, (637.0000000 + float(3 * 98)) * ratioY, DefaultFontShadowColor);
    //return;    
}

function SetDefenceRewardInfo()
{
    local int lp1, lp2;
    local wDefenceRewardParam tempParam;

    GameMgr = Level.GameMgr;
    ItemRewardInfo_Clear = none;
    BotDifficulty = byte(Level.GetMatchMaker().BotDifficulty);
    lp2 = 0;
    lp1 = 0;
    J0x49:

    // End:0x131 [Loop If]
    if(lp1 < GameMgr.DefenceRewardParams.Length)
    {
        tempParam = GameMgr.DefenceRewardParams[lp1];
        // End:0x127
        if(int(tempParam.nDifficulty) == int(BotDifficulty))
        {
            // End:0xD3
            if(int(tempParam.nRewardGroup) == 1)
            {
                RewardParam[lp2++] = GameMgr.DefenceRewardParams[lp1];
                // [Explicit Continue]
                goto J0x127;
            }
            // End:0x127
            if(int(tempParam.nRewardGroup) == 2)
            {
                RewardParamClear = GameMgr.DefenceRewardParams[lp1];
                ItemRewardInfo_Clear = GameMgr.FindUIItem(tempParam.nRewardItemID);
            }
        }
        J0x127:

        lp1++;
        // [Loop Continue]
        goto J0x49;
    }
    SortItemList();
    lp1 = 0;
    J0x13E:

    // End:0x1D5 [Loop If]
    if(lp1 < 3)
    {
        tempParam = RewardParam[lp1];
        ItemRewardInfo_Score[lp1] = GameMgr.FindUIItem(tempParam.nRewardItemID);
        ItemReward_Score[lp1] = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 0, none);
        ItemReward_Score[lp1].Image = ItemRewardInfo_Score[lp1].ItemImage;
        lp1++;
        // [Loop Continue]
        goto J0x13E;
    }
    ItemReward_Clear = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 0, none);
    ItemReward_Clear.Image = ItemRewardInfo_Clear.ItemImage;
    switch(BotDifficulty)
    {
        // End:0x225
        case 1:
            strBotDifficulty = "Easy";
            // End:0x26B
            break;
        // End:0x23B
        case 2:
            strBotDifficulty = "Normal";
            // End:0x26B
            break;
        // End:0x24F
        case 3:
            strBotDifficulty = "Hard";
            // End:0x26B
            break;
        // End:0x268
        case 4:
            strBotDifficulty = "Very Hard";
            // End:0x26B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool InOrderDefence(int P1, int P2)
{
    // End:0x11
    if(P1 > P2)
    {
        return false;
    }
    return true;
    //return;    
}

function SortItemList()
{
    local int i, j;
    local wDefenceRewardParam ItemInfo;

    i = 0;
    J0x07:

    // End:0xAD [Loop If]
    if(i < 2)
    {
        j = i + 1;
        J0x21:

        // End:0xA3 [Loop If]
        if(j < 3)
        {
            // End:0x99
            if(!InOrderDefence(RewardParam[i].nGainRewardMinScore, RewardParam[j].nGainRewardMinScore))
            {
                ItemInfo = RewardParam[i];
                RewardParam[i] = RewardParam[j];
                RewardParam[j] = ItemInfo;
            }
            j++;
            // [Loop Continue]
            goto J0x21;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    lsScore="points"
    lsScoreOver="points or above"
    lsRewardScore="Rewarded when earned"
    lsRewardClear="Completion reward"
    lsRewardTitle="Point Reward Details"
    lsGainReward="Gain Reward !!!"
    strBotDifficulty="None"
    PartMinimapClass=Class'XInterface_Decompressed.wScoreboardPart_MinimapDefence'
}