class xScoreBoardAlienGame extends xScoreBoardTeamGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() SpriteWidget WAlienModeTitle;
var() SpriteWidget WSpSelectAlienLine;
var() SpriteWidget WSpSelectHeroLine;
var localized string strAlienText;
var localized string strHeroText;
var Color AlienColor;
var Color HeroColor;
var Color InfectedColor;
var Color HeroSelColor;

function DrawTeamBG(Canvas C)
{
    local CalCoordsW calW;
    local string GameName;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    ScoreBoardTitleBG.OffsetX = 465;
    ScoreBoardTitleBG.OffsetY = 125;
    CalculateCoordinate(C, ScoreBoardTitleBG, 671.0000000, 77.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(ScoreBoardTitleBG.WidgetTexture, calW.XL, calW.YL);
    SetMissionInfo();
    C.SetDrawColor(byte(255), 192, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, C.ClipX * 0.2918750, C.ClipY * 0.1166667, C.ClipX * 0.7087500, C.ClipY * 0.1358333, int(0.0158300 * C.ClipY), DefaultFontShadowColor);
    GameName = ((((((Level.GetMatchMaker().szSeverName $ " / ") $ Level.GetMatchMaker().szChannelName) $ " / ") $ "[") $ string(Level.GetMatchMaker().My_iRoom)) $ "] ") $ Level.GetMatchMaker().szRoomName;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * 0.2918750, C.ClipY * 0.1425000, C.ClipX * 0.7087500, C.ClipY * 0.1583333, int(0.0125000 * C.ClipY), DefaultFontShadowColor);
    WAlienModeTitle.OffsetX = 467;
    WAlienModeTitle.OffsetY = 210;
    CalculateCoordinate(C, WAlienModeTitle, 667.0000000, 47.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WAlienModeTitle.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WSBBG3.OffsetX = 467;
    WSBBG3.OffsetY = 295;
    CalculateCoordinate(C, WSBBG3, 669.0000000, 787.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    //return;    
}

function DrawContentDescriptionTeam(Canvas C, float _OffSetX, float _OffSetY)
{
    local CalCoordsW calW;
    local float fOffSetX, fOffSetY;

    WContentBG.OffsetX = 467;
    WContentBG.OffsetY = 257;
    CalculateCoordinate(C, WContentBG, 667.0000000, 37.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WContentBG.WidgetTexture, calW.XL, calW.YL);
    C.DrawColor = DefaultFontColor;
    C.BtrDrawTextJustifiedWithVolumeLine(Clan, 1, C.ClipX * fClanX1, C.ClipY * fContentBeginY, C.ClipX * fClanX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Rank, 1, C.ClipX * fRankX1, C.ClipY * fContentBeginY, C.ClipX * fRankX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(NickName, 1, C.ClipX * fNickNameX1, C.ClipY * fContentBeginY, C.ClipX * fNickNameX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Kill, 1, C.ClipX * fKillX1, C.ClipY * fContentBeginY, C.ClipX * fKillX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Death, 1, C.ClipX * fDeathX1, C.ClipY * fContentBeginY, C.ClipX * fDeathX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Ping, 1, C.ClipX * fPingX1, C.ClipY * fContentBeginY, C.ClipX * fPingX2, C.ClipY * fContentEndY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    DrawTextTeamScore(C, fOffSetX, fOffSetY);
    //return;    
}

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamBG(C);
    DrawContentDescriptionTeam(C, 0.0000000, 0.0000000);
    DrawTeamListSectionStripe(C, 295.0000000, 16);
    DrawTeamListSection(C);
    //return;    
}

function DrawTextTeamScore(Canvas C, float _OffSetX, float _OffSetY)
{
    local int iScoreHuman, iScoreAlien, X1, X2, Y1, Y2;

    local float fOffSetX, fOffSetY;

    C.SetDrawColor(byte(255), 192, 0, byte(255));
    iScoreHuman = int(Level.GRI.Teams[0].Score);
    iScoreAlien = int(Level.GRI.Teams[1].Score);
    X1 = int((float(474) * C.ClipX) * ScreenRatioXEx);
    Y1 = int((float(222) * C.ClipY) * ScreenRatioYEx);
    X2 = int((float(535) * C.ClipX) * ScreenRatioXEx);
    Y2 = int((float(244) * C.ClipY) * ScreenRatioYEx);
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScoreHuman), 1, float(X1), float(Y1), float(X2), float(Y2), int((float(23) * C.ClipY) * ScreenRatioYEx), DefaultFontShadowColor);
    X1 = int((float(1066) * C.ClipX) * ScreenRatioXEx);
    Y1 = int((float(222) * C.ClipY) * ScreenRatioYEx);
    X2 = int((float(1127) * C.ClipX) * ScreenRatioXEx);
    Y2 = int((float(244) * C.ClipY) * ScreenRatioYEx);
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScoreAlien), 1, float(X1), float(Y1), float(X2), float(Y2), int((float(23) * C.ClipY) * ScreenRatioYEx), DefaultFontShadowColor);
    //return;    
}

function DrawTeamListSectionStripe(Canvas C, float OffsetY, int iTeamUserMax)
{
    local CalCoordsW calW;
    local int iMemberCount, Y1;

    iMemberCount = 0;
    J0x07:

    // End:0xF1 [Loop If]
    if(iMemberCount < iTeamUserMax)
    {
        Y1 = int(OffsetY + float(iMemberCount * 48));
        WListDivedBar.OffsetX = 467;
        WListDivedBar.OffsetY = Y1;
        CalculateCoordinate(C, WListDivedBar, 667.0000000, 3.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WListDivedBar.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iMemberCount++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DrawTeamListSection(Canvas C)
{
    local int lpTeam, lpPRI, memberCount, Index;
    local PlayerReplicationInfo currPRI;
    local array<PlayerReplicationInfo> pris, prisReal;
    local wMatchMaker kMM;
    local string HostName;
    local float beginY;

    kMM = Level.GetMatchMaker();
    // End:0x9B
    if(kMM.UserInfos.Length > 0)
    {
        memberCount = 0;
        J0x31:

        // End:0x9B [Loop If]
        if(memberCount < kMM.UserInfos.Length)
        {
            // End:0x91
            if(kMM.UserInfos[memberCount].IsHost)
            {
                HostName = kMM.UserInfos[memberCount].UserName;
                // [Explicit Break]
                goto J0x9B;
            }
            memberCount++;
            // [Loop Continue]
            goto J0x31;
        }
    }
    J0x9B:

    memberCount = 0;
    lpTeam = 0;
    J0xA9:

    // End:0x214 [Loop If]
    if(lpTeam < 2)
    {
        lpPRI = 0;
        J0xBC:

        // End:0x20A [Loop If]
        if(lpPRI < GRI.PRIArray.Length)
        {
            currPRI = GRI.PRIArray[lpPRI];
            // End:0x113
            if((currPRI == none) || currPRI.Team == none)
            {
                // [Explicit Continue]
                goto J0x200;
            }
            // End:0x128
            if(currPRI.bAdminSpecator)
            {
                // [Explicit Continue]
                goto J0x200;
            }
            // End:0x13F
            if(!currPRI.IsConnected)
            {
                // [Explicit Continue]
                goto J0x200;
            }
            // End:0x157
            if(200 == currPRI.NPCID)
            {
                // [Explicit Continue]
                goto J0x200;
            }
            // End:0x16F
            if(201 == currPRI.NPCID)
            {
                // [Explicit Continue]
                goto J0x200;
            }
            // End:0x200
            if(currPRI.Team.TeamIndex == lpTeam)
            {
                beginY = (C.ClipY * 0.1708333) + ((float(memberCount) * 0.0400000) * C.ClipY);
                DrawTeamListSection_C(C, lpTeam, currPRI, memberCount, HostName, TeamListMemberBeginY, 205.0000000, 215.0000000);
                memberCount++;
            }
            J0x200:

            lpPRI++;
            // [Loop Continue]
            goto J0xBC;
        }
        lpTeam++;
        // [Loop Continue]
        goto J0xA9;
    }
    //return;    
}

function DrawTeamListSection_C(Canvas C, int lpTeam, PlayerReplicationInfo currPRI, int memberCount, string HostName, float beginY, float markBeginY, float markPingY)
{
    local int FontSize, iPing, i;
    local float X1, Y1, X2, Y2, y3, y4;

    local CalCoordsW calW;
    local Material Mark, markClan;
    local float markX1, markY1;
    local string strTemp;
    local bool Dead;
    local wMatchUserInfo UserInfo;
    local wAlienPlayerReplicationInfo curAlienPRI;

    curAlienPRI = wAlienPlayerReplicationInfo(currPRI);
    X1 = 0.2918750 * C.ClipX;
    Y1 = (C.ClipY * beginY) + ((float(memberCount) * 0.0400000) * C.ClipY);
    Y2 = Y1 + (0.0400000 * C.ClipY);
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    // End:0x15C
    if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
    {
        C.SetPos(X1, Y1);
        C.DrawTile(SpSelectLine.WidgetTexture, (667.0000000 * ScreenRatioXEx) * C.ClipX, (48.0000000 * ScreenRatioYEx) * C.ClipY, float(SpSelectLine.TextureCoords.X1), float(SpSelectLine.TextureCoords.Y1), 667.0000000, 48.0000000);
    }
    // End:0x215
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(curAlienPRI.eObjType))
    {
        C.SetPos(X1, Y1);
        C.DrawTile(WSpSelectAlienLine.WidgetTexture, (667.0000000 * ScreenRatioXEx) * C.ClipX, (48.0000000 * ScreenRatioYEx) * C.ClipY, float(WSpSelectAlienLine.TextureCoords.X1), float(WSpSelectAlienLine.TextureCoords.Y1), 667.0000000, 48.0000000);        
    }
    else
    {
        // End:0x2CB
        if(Class'Engine.wGameManager'.static.IsHeroType(curAlienPRI.eObjType))
        {
            C.SetPos(X1, Y1);
            C.DrawTile(WSpSelectHeroLine.WidgetTexture, (667.0000000 * ScreenRatioXEx) * C.ClipX, (48.0000000 * ScreenRatioYEx) * C.ClipY, float(WSpSelectHeroLine.TextureCoords.X1), float(WSpSelectHeroLine.TextureCoords.Y1), 667.0000000, 48.0000000);
        }
    }
    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x3CF
    if((UserInfo != none) && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x3CF
        if(markClan[2] == none)
        {
            markClan[0] = Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark';
        }
    }
    i = 0;
    J0x3D6:

    // End:0x4F4 [Loop If]
    if(i < 3)
    {
        // End:0x4EA
        if(markClan[i] != none)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            markX1 = 0.3518750 * C.ClipX;
            markY1 = Y1;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], (46.0000000 * ScreenRatioXEx) * C.ClipX, (46.0000000 * ScreenRatioYEx) * C.ClipY, 0.0000000, 0.0000000, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        i++;
        // [Loop Continue]
        goto J0x3D6;
    }
    // End:0x517
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x63B
    if(Mark != none)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        markX1 = 0.3825000 * C.ClipX;
        markY1 = Y1;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, (46.0000000 * ScreenRatioXEx) * C.ClipX, (46.0000000 * ScreenRatioYEx) * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    Dead = currPRI.IsDead && int(Level.GRI.RoundState) == int(2);
    // End:0x738
    if(HostName == currPRI.PlayerName)
    {
        markX1 = 0.5500000 * C.ClipX;
        CalculateCoordinate(C, WIconMaster, 46.0000000, 46.0000000, calW);
        C.SetPos(markX1, markY1);
        C.DrawTile(WIconMaster.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        // End:0x7C8
        if(currPRI.bPrecached == false)
        {
            markX1 = 0.5500000 * C.ClipX;
            C.BtrDrawTextJustified(StrLoading, 0, markX1, markY1, markX1 + (0.0287500 * C.ClipX), markY1 + (0.0383000 * C.ClipY), FontSize);            
        }
        else
        {
            // End:0x879
            if(Dead)
            {
                markX1 = 0.5500000 * C.ClipX;
                CalculateCoordinate(C, WIconDeath, 46.0000000, 46.0000000, calW);
                C.SetPos(markX1, markY1);
                C.DrawTile(WIconDeath.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
    }
    X1 = 0.2931250 * C.ClipX;
    X2 = 0.3518750 * C.ClipX;
    // End:0x91A
    if(Class'Engine.wGameManager'.static.IsAlienTeamType(curAlienPRI.eObjType))
    {
        C.DrawColor = InfectedColor;
        C.BtrDrawTextJustifiedWithVolumeLine(strAlienText, 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);        
    }
    else
    {
        // End:0x982
        if(Class'Engine.wGameManager'.static.IsHeroType(curAlienPRI.eObjType))
        {
            C.DrawColor = HeroSelColor;
            C.BtrDrawTextJustifiedWithVolumeLine(strHeroText, 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
        }
    }
    // End:0x9A2
    if(Dead)
    {
        C.DrawColor = DeadFontColor;        
    }
    else
    {
        // End:0x9ED
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.PlayerName == currPRI.PlayerName)
        {
            C.DrawColor = MyselfColor;            
        }
        else
        {
            // End:0xA49
            if((UserInfo != none) && Level.GetMatchMaker().IsFriendlyUser(UserInfo.UserName, UserInfo.ClanName))
            {
                C.DrawColor = FriendlyColor;                
            }
            else
            {
                // End:0xA80
                if(Class'Engine.wGameManager'.static.IsAlienTeamType(curAlienPRI.eObjType))
                {
                    C.DrawColor = AlienColor;                    
                }
                else
                {
                    // End:0xAB7
                    if(Class'Engine.wGameManager'.static.IsHeroType(curAlienPRI.eObjType))
                    {
                        C.DrawColor = HeroColor;                        
                    }
                    else
                    {
                        C.DrawColor = DefaultFontColor;
                    }
                }
            }
        }
    }
    X1 = TeamListMemberNicknameBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberNicknameWidth * C.ClipX);
    strTemp = GetEllipsString(C, currPRI.PlayerName, ((1111.0000000 - float(934)) / 1600.0000000) * C.ClipX, float(FontSize));
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    // End:0xBA7
    if(Dead)
    {
        C.DrawColor = DeadFontColor;        
    }
    else
    {
        C.DrawColor = DefaultFontColor;
    }
    X1 = TeamListMemberKillBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberKillWidth * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Kills), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = TeamListMemberDeathBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberDeathWidth * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Deaths)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    WPingBack.OffsetX = 1096;
    WPingBack.OffsetY = 307 + (memberCount * 48);
    CalculateCoordinate(C, WPingBack, 25.0000000, 25.0000000, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPingBack.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iPing = currPRI.Ping * 4;
    // End:0xDD3
    if(iPing < 0)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255));        
    }
    else
    {
        // End:0xDF9
        if(iPing < 120)
        {
            C.SetDrawColor(120, byte(255), 0);            
        }
        else
        {
            // End:0xE1F
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
    WPing.OffsetY = 311 + (memberCount * 48);
    CalculateCoordinate(C, WPing, 17.0000000, 17.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPing.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    //return;    
}

defaultproperties
{
    WAlienModeTitle=(WidgetTexture=Texture'Warfare_TH_UI_UI.HUD_ETC.img_scoreboard_teammark_all',RenderStyle=5,TextureCoords=(X1=0,Y1=235,X2=667,Y2=282),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=467,OffsetY=210,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSpSelectAlienLine=(WidgetTexture=Texture'Warfare_TH_UI_UI.HUD_ETC.img_scoreboard_myinfo_bar',RenderStyle=5,TextureCoords=(X1=0,Y1=96,X2=667,Y2=144),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    WSpSelectHeroLine=(WidgetTexture=Texture'Warfare_TH_UI_UI.HUD_ETC.img_scoreboard_myinfo_bar',RenderStyle=5,TextureCoords=(X1=0,Y1=48,X2=667,Y2=96),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    strAlienText="???????????"
    strHeroText="HERO"
    AlienColor=(R=255,G=80,B=45,A=255)
    HeroColor=(R=120,G=255,B=0,A=255)
    InfectedColor=(R=255,G=220,B=213,A=255)
    HeroSelColor=(R=255,G=255,B=255,A=255)
    TeamListMemberNicknameBeginX=0.4125000
    TeamListMemberNicknameWidth=0.1662500
    TeamListMemberScoreBeginX=0.5787500
    TeamListMemberScoreWidth=0.0325000
    TeamListMemberKillBeginX=0.6112500
    TeamListMemberKillWidth=0.0325000
    TeamListMemberDeathBeginX=0.6437500
    TeamListMemberDeathWidth=0.0325000
    TeamListMemberBeginY=0.2458333
    PartMinimapClass=Class'WMission_Decompressed.wScoreboardPart_MinimapAlienGame'
    fContentBeginY=0.2141667
    fContentEndY=0.2450000
    fClanX1=0.3525000
    fClanX2=0.3825000
    fRankX1=0.3825000
    fRankX2=0.4125000
    fNickNameX1=0.4125000
    fNickNameX2=0.5787500
    fScoreX1=0.5787500
    fScoreX2=0.6112500
    fKillX1=0.6112500
    fKillX2=0.6437500
    fDeathX1=0.6437500
    fDeathX2=0.6762500
    fPingX1=0.6762500
    fPingX2=0.7087500
}