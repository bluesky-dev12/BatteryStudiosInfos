class xScoreBoardTeamGame extends xScoreBoard
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum SBGT
{
    GT_TD,                          // 0
    GT_DOMI,                        // 1
    GT_SD                           // 2
};

enum GOAL_SCORE
{
    GOAL_100                        // 0
};

var() SpriteWidget SpBG;
var() SpriteWidget Sp2TeamNameSection;
var() SpriteWidget Sp3TeamNameSection;
var() SpriteWidget SpTeamNameEmphasis;
var() SpriteWidget SpTeamList;
var() SpriteWidget SpSelectLine;
var() SpriteWidget MapImage;
var bool IndicateDeads;
var Color DefaultFontColor;
var Color DeadFontColor;
var Color DefaultFontShadowColor;
var Color FriendlyColor;
var Color MyselfColor;
var float BGBeginX;
var float BGBeginY;
var float BGWidth;
var float BGHeight;
var float TeamListBeginX;
var float TeamListBeginY;
var float TeamListOffsetY;
var float TeamListWidth;
var float TeamListHeight;
var float TeamListTeamNameBeginX;
var float TeamListTeamNameBeginY;
var float TeamListTeamNameWidth;
var float TeamListTeamNameHeight;
var float TeamListTeamNameFontSize;
var float TeamListMemberNicknameBeginX;
var float TeamListMemberNicknameWidth;
var float TeamListMemberScoreBeginX;
var float TeamListMemberScoreWidth;
var float TeamListMemberKillBeginX;
var float TeamListMemberKillWidth;
var float TeamListMemberAssistBeginX;
var float TeamListMemberAssistWidth;
var float TeamListMemberDeathBeginX;
var float TeamListMemberDeathWidth;
var float TeamListMemberPingBeginX;
var float TeamListMemberPingWidth;
var float TeamListMemberBeginY;
var float TeamListMemberHeight;
var float TeamListMemberHeightOffset;
var float TeamListMemberFontSize;
var float TeamNameEmphasisBeginX;
var float TeamNameEmphasisBeginY;
var float TeamNameEmphasisOffsetY;
var float TeamNameEmphasisWidth;
var float TeamNameEmphasisHeight;
var float TeamNameSectionBeginX;
var float TeamNameSectionBeginY;
var float TeamNameSectionEndY;
var float TeamNameSectionTeam2OffsetX;
var float TeamNameSectionTeam2Width;
var float TeamNameSectionTeam2Height;
var float TeamNameSectionTeam3OffsetX;
var float TeamNameSectionTeam3Width;
var float TeamNameSectionTeam3Height;
var float TeamNameFontSize;
var float TeamScoreSectionBeginY;
var float TeamScoreSectionEndY;
var float TeamScoreFontSize;
var float GameClassBeginX;
var float GameClassBeginY;
var float GameClassEndX;
var float GameClassEndY;
var float GameClassFontSize;
var string GameDescriptionText;
var float GameDescriptionBeginX;
var float GameDescriptionBeginY;
var float GameDescriptionEndX;
var float GameDescriptionEndY;
var float GameDescriptionFontSize;
var float MapNameBeginX;
var float MapNameBeginY;
var float MapNameEndX;
var float MapNameEndY;
var float MapNameFontSize;
var Color MapNameFontColor;
var float MapImageBeginX;
var float MapImageBeginY;
var float MapImageEndX;
var float MapImageEndY;
var float TimeX1;
var float TimeY1;
var float TimeX2;
var float TimeY2;
var Color TimeColor;
var float TimeFontSize;
var float fMapNameX1;
var float fMapNameX2;
var float fMapNameY1;
var float fMapNameY2;
var float fMapNameFontsize;
var wMapInfo mapInfo;
var localized string MissionNameTD;
var localized string MissionNameSD;
var localized string MissionNameDOMI;
var localized string MissionNameSBT;
var localized string MissionNameDM;
var localized string MissionNameFM;
var localized string MissionNameTM;
var localized string MissionCommentTD1;
var localized string MissionCommentTD2;
var localized string MissionCommentSDA1;
var localized string MissionCommentSDA2;
var localized string MissionCommentSDD1;
var localized string MissionCommentSDD2;
var localized string MissionCommentDOMI1;
var localized string MissionCommentDOMI2;
var localized string MissionCommentSBT1;
var localized string MissionCommentSBT2;
var localized string MissionCommentDM1;
var localized string MissionCommentDM2;
var localized string MissionCommentFM1;
var localized string MissionCommentFM2;
var localized string MissionCommentTM1;
var localized string MissionCommentTM2;
var localized string StrLoading;
var localized string WeaponLimitKnifeOnly;
var localized string WeaponLimitPistolOnly;
var localized string WeaponLimitGrenadeOnly;
var localized string WeaponLimitRPGOnly;
var localized string WeaponLimitSROnly;
var localized string WeaponLimitSRBan;
var string MapName;
var string MissionInfo;
var() SpriteWidget WSBIBG1;
var() SpriteWidget WSBIBG2;
var() SpriteWidget WSBBG2;
var() SpriteWidget WSBBG3;
var() SpriteWidget WSBBGPanel;
var() SpriteWidget WSBOutLine;
var() SpriteWidget WTeamAF;
var() SpriteWidget WTeamRSA;
var() SpriteWidget WDivid;
var() SpriteWidget WContentBG;
var() SpriteWidget WListDivedBar;
var() SpriteWidget WBarSellectOver;
var() SpriteWidget WBarSellectClick;
var() SpriteWidget WTxtScorBord;
var() SpriteWidget WTxtMap;
var() array<SpriteWidget> WStripeBar;
var() SpriteWidget WIconMaster;
var() SpriteWidget WIconDeath;
var() array<SpriteWidget> WPing;
var() array<SpriteWidget> WTxtGameType;
var() DigitSet WDigitsNumberMid;
var() SpriteWidget WTimeBG;
var() SpriteWidget WTeamScoreBG;
var() SpriteWidget WTeamScoreAF;
var() SpriteWidget WTeamScoreRSA;
var() SpriteWidget WFFABG;
var() SpriteWidget WFFAScoreBG;
var() SpriteWidget WFFAScoreOverLayer;
var int AttackingTeam;
var int Ranking_Self;
var PlayerReplicationInfo PRI_1st;
var PlayerReplicationInfo PRI_2nd;
var PlayerReplicationInfo PRI_Self;
var() array<NumericWidget> DigitsAFScore;
var() array<NumericWidget> DigitsRSAScore;
var() array<NumericWidget> DigitsGoalScore;
var() array<NumericWidget> DigitsFFAGoalScore;
var() array<NumericWidget> DigitsTime;
var() SpriteWidget WCompareSign;
var wScoreboardPart_Minimap PartMinimap;

function HudBase GetHudBaseOwner()
{
    return HudBase(HudOwner);
    //return;    
}

function PostBeginPlay()
{
    super(ScoreBoard).PostBeginPlay();
    PartMinimap = Spawn(Class'XInterface_Decompressed.wScoreboardPart_Minimap', self);
    PartMinimap.__OnPreDrawMyself__Delegate = DrawMinimap_GameMode;
    MapName = Level.GetMatchMaker().szMapName;
    Log((string(self) $ " / mapInfo szMapName:") $ Level.GetMatchMaker().szMapName);
    mapInfo = Level.GetMatchMaker().MapSettings.GetMapInfo(Level.GetMatchMaker().szMapName);
    //return;    
}

function DrawMinimap_GameMode(Canvas C)
{
    GetHudBaseOwner().DrawMinimap(PartMinimap, C);
    //return;    
}

function SetAttackingTeam(int Index)
{
    AttackingTeam = Index;
    //return;    
}

function DrawBGs(Canvas C)
{
    //return;    
}

function DrawContentDescription(Canvas C, float _OffSetX, float _OffSetY)
{
    local CalCoordsW calW;
    local float fOffSetX, fOffSetY;
    local int i, aPosX;

    WContentBG.OffsetY = int(float(default.WContentBG.OffsetY) + _OffSetY);
    CalculateCoordinate(C, WContentBG, 669.0000000, 37.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WContentBG.WidgetTexture, calW.XL, calW.YL);
    // End:0xD3
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        DrawTextTeamScore(C, fOffSetX, fOffSetY);
    }
    fOffSetX = (_OffSetX * ScreenRatioXEx) * C.ClipX;
    fOffSetY = (_OffSetY * ScreenRatioYEx) * C.ClipY;
    C.DrawColor = DefaultFontColor;
    C.BtrDrawTextJustifiedWithVolumeLine(Clan, 1, C.ClipX * fClanX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fClanX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    aPosX[0] = 864;
    aPosX[1] = 917;
    aPosX[2] = 1155;
    aPosX[3] = 1222;
    aPosX[4] = 1266;
    aPosX[5] = 1353;
    aPosX[6] = 1416;
    i = 0;
    J0x226:

    // End:0x309 [Loop If]
    if(i < 7)
    {
        WDivid.OffsetX = aPosX[i];
        WDivid.OffsetY = int(float(default.WDivid.OffsetY) + _OffSetY);
        CalculateCoordinate(C, WDivid, 3.0000000, 19.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDivid.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        i++;
        // [Loop Continue]
        goto J0x226;
    }
    C.BtrDrawTextJustifiedWithVolumeLine(Rank, 1, C.ClipX * fRankX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fRankX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(NickName, 1, C.ClipX * fNickNameX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fNickNameX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Score, 1, C.ClipX * fScoreX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fScoreX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Kill, 1, C.ClipX * fKillX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fKillX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Assist, 1, C.ClipX * fAssistX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fAssistX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Death, 1, C.ClipX * fDeathX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fDeathX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    C.BtrDrawTextJustifiedWithVolumeLine(Ping, 1, C.ClipX * fPingX1, (C.ClipY * fContentBeginY) + fOffSetY, C.ClipX * fPingX2, (C.ClipY * fContentEndY) + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    //return;    
}

function DrawTextTeamScore(Canvas C, float _OffSetX, float _OffSetY)
{
    local int iScoreAF, iScoreRSA, X1, X2, Y1, Y2;

    local float fOffSetX, fOffSetY;

    fOffSetX = (_OffSetX * ScreenRatioXEx) * C.ClipY;
    fOffSetY = (_OffSetY * ScreenRatioYEx) * C.ClipY;
    C.DrawColor = DefaultFontColor;
    C.BtrDrawTextJustifiedWithVolumeLine(TeamScore, 1, C.ClipX * fTeamScoreX1, ((C.ClipY * float(128)) * ScreenRatioYEx) + fOffSetY, C.ClipX * fTeamScoreX2, ((C.ClipY * float(153)) * ScreenRatioYEx) + fOffSetY, int((float(17) * ScreenRatioYEx) * C.ClipY), DefaultFontShadowColor);
    fOffSetY = 525.0000000;
    iScoreAF = int(Level.GRI.Teams[0].Score);
    iScoreRSA = int(Level.GRI.Teams[1].Score);
    X1 = int((float(1373) * C.ClipX) * ScreenRatioXEx);
    Y1 = int((float(121) * C.ClipY) * ScreenRatioYEx);
    X2 = int((float(1475) * C.ClipX) * ScreenRatioXEx);
    Y2 = int((float(166) * C.ClipY) * ScreenRatioYEx);
    C.SetDrawColor(byte(255), 150, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScoreAF), 1, float(X1), float(Y1), float(X2), float(Y2), int((float(18) * C.ClipY) * ScreenRatioYEx), DefaultFontShadowColor);
    X1 = int((float(1373) * C.ClipX) * ScreenRatioXEx);
    Y1 = int((float(int(float(121) + fOffSetY)) * C.ClipY) * ScreenRatioYEx);
    X2 = int((float(1475) * C.ClipX) * ScreenRatioXEx);
    Y2 = int((float(int(float(166) + fOffSetY)) * C.ClipY) * ScreenRatioYEx);
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScoreRSA), 1, float(X1), float(Y1), float(X2), float(Y2), int((float(18) * C.ClipY) * ScreenRatioYEx), DefaultFontShadowColor);
    //return;    
}

function DrawTime(Canvas C)
{
    local string Time;

    Time = (("" $ string(GetHudBaseOwner().TimeMinutes)) $ " : ") $ string(GetHudBaseOwner().TimeSeconds);
    C.DrawColor = TimeColor;
    C.BtrDrawTextJustifiedWithVolumeLine(Time, 1, C.ClipX * TimeX1, C.ClipY * TimeY1, C.ClipX * TimeX2, C.ClipY * TimeY2, int(TimeFontSize * C.ClipY), DefaultFontShadowColor);
    //return;    
}

function DrawTeamListSectionStripe(Canvas C, float OffsetY, int iTeamUserMax)
{
    local CalCoordsW calW;
    local int iMemberCount, Y1, Y2;

    iMemberCount = 0;
    J0x07:

    // End:0x107 [Loop If]
    if(iMemberCount < iTeamUserMax)
    {
        Y1 = int(OffsetY + float(iMemberCount * 53));
        Y2 = int(float(Y1) + TeamListMemberHeight);
        WListDivedBar.OffsetX = 810;
        WListDivedBar.OffsetY = Y1;
        CalculateCoordinate(C, WListDivedBar, 669.0000000, 4.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WListDivedBar.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iMemberCount++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DrawTeamListSection_C(Canvas C, int lpTeam, PlayerReplicationInfo currPRI, int memberCount, string HostName, float beginY, float markBeginY, float markPingY)
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
    Y1 = ((beginY + (float(lpTeam) * TeamListOffsetY)) + (float(memberCount) * TeamListMemberHeightOffset)) * C.ClipY;
    Y2 = Y1 + (TeamListMemberHeight * C.ClipY);
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    // End:0x1A6
    if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
    {
        X1 = (TeamListBeginX + 0.0019531) * C.ClipX;
        X2 = X1 + (TeamListWidth * C.ClipX);
        y3 = (((markBeginY + float(lpTeam * 525)) + float(memberCount * 53)) * ScreenRatioYEx) * C.ClipY;
        y4 = y3 + ((float(51) * ScreenRatioYEx) * C.ClipY);
        C.SetPos(X1, y3);
        C.DrawTilePartialStretched(SpSelectLine.WidgetTexture, X2 - X1, y4 - y3);
    }
    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x2AA
    if((UserInfo != none) && UserInfo.Clanname != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x2AA
        if(markClan[2] == none)
        {
            markClan[0] = Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark';
        }
    }
    i = 0;
    J0x2B1:

    // End:0x40A [Loop If]
    if(i < 3)
    {
        // End:0x400
        if(markClan[i] != none)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            markX1 = (814.0000000 * ScreenRatioXEx) * C.ClipX;
            markY1 = (((markBeginY + float(lpTeam * 525)) + float(memberCount * 53)) * ScreenRatioYEx) * C.ClipY;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], (51.0000000 * ScreenRatioXEx) * C.ClipX, (51.0000000 * ScreenRatioYEx) * C.ClipY, 0.0000000, 0.0000000, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        i++;
        // [Loop Continue]
        goto J0x2B1;
    }
    // End:0x42D
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x58C
    if(Mark != none)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        markX1 = (867.0000000 * ScreenRatioXEx) * C.ClipX;
        markY1 = (((markBeginY + float(lpTeam * 525)) + float(memberCount * 53)) * ScreenRatioYEx) * C.ClipY;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, (51.0000000 * ScreenRatioXEx) * C.ClipX, (51.0000000 * ScreenRatioYEx) * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    Dead = currPRI.IsDead && (Level.GRI.GameClass != "WMission.wSDGameInfo") || int(Level.GRI.RoundState) == int(2);
    // End:0x6FA
    if(HostName == currPRI.PlayerName)
    {
        IconPosY = markBeginY + float(4);
        WIconMaster.OffsetX = 1111;
        WIconMaster.OffsetY = int(IconPosY + float(lpTeam * 525)) + (memberCount * 53);
        CalculateCoordinate(C, WIconMaster, 46.0000000, 46.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WIconMaster.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        // End:0x7E5
        if(currPRI.bPrecached == false)
        {
            IconPosY = markBeginY + float(4);
            WIconDeath.OffsetX = 1111;
            WIconDeath.OffsetY = int(IconPosY + float(lpTeam * 525)) + (memberCount * 53);
            CalculateCoordinate(C, WIconDeath, 46.0000000, 46.0000000, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.BtrDrawTextJustified(StrLoading, 0, calW.X1, calW.Y1, calW.X2, calW.Y2, FontSize);            
        }
        else
        {
            // End:0x8D3
            if(Dead)
            {
                IconPosY = markBeginY + float(4);
                WIconDeath.OffsetX = 1111;
                WIconDeath.OffsetY = int(IconPosY + float(lpTeam * 525)) + (memberCount * 53);
                CalculateCoordinate(C, WIconDeath, 46.0000000, 46.0000000, calW);
                C.SetPos(calW.X1, calW.Y1);
                C.DrawTile(WIconDeath.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
    }
    X1 = TeamListMemberNicknameBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberNicknameWidth * C.ClipX);
    // End:0x930
    if(Dead)
    {
        C.DrawColor = DeadFontColor;        
    }
    else
    {
        // End:0x97B
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.PlayerName == currPRI.PlayerName)
        {
            C.DrawColor = MyselfColor;            
        }
        else
        {
            // End:0x9D7
            if((UserInfo != none) && Level.GetMatchMaker().IsFriendlyUser(UserInfo.UserName, UserInfo.Clanname))
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
    // End:0xA8A
    if(Dead)
    {
        C.DrawColor = DeadFontColor;        
    }
    else
    {
        C.DrawColor = DefaultFontColor;
    }
    X1 = TeamListMemberScoreBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberScoreWidth * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Score)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = TeamListMemberKillBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberKillWidth * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Kills), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = TeamListMemberAssistBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberAssistWidth * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Assists), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = TeamListMemberDeathBeginX * C.ClipX;
    X2 = X1 + (TeamListMemberDeathWidth * C.ClipX);
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Deaths)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    iPing = currPRI.Ping;
    // End:0xCBB
    if(iPing < 0)
    {
        iPing = 0;        
    }
    else
    {
        // End:0xCD2
        if(iPing < 50)
        {
            iPing = 4;            
        }
        else
        {
            // End:0xCE9
            if(iPing < 80)
            {
                iPing = 3;                
            }
            else
            {
                // End:0xD00
                if(iPing < 150)
                {
                    iPing = 2;                    
                }
                else
                {
                    iPing = 1;
                }
            }
        }
    }
    WPing[iPing].OffsetX = 1434;
    WPing[iPing].OffsetY = int(markPingY + float(lpTeam * 525)) + (memberCount * 53);
    CalculateCoordinate(C, WPing[iPing], 29.0000000, 29.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPing[iPing].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0xE0F
    if(Level.GetMatchMaker().IsTestMode)
    {
    }
    //return;    
}

function DrawTeamListSection(Canvas C)
{
    local int lpTeam, lpPRI, memberCount;
    local PlayerReplicationInfo currPRI;
    local array<PlayerReplicationInfo> pris;
    local wMatchMaker kMM;
    local string HostName;

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

    // End:0x1DB
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        lpTeam = 0;
        J0xD1:

        // End:0x1D8 [Loop If]
        if(lpTeam < 2)
        {
            memberCount = 0;
            lpPRI = 0;
            J0xEB:

            // End:0x1CE [Loop If]
            if(lpPRI < GRI.PRIArray.Length)
            {
                currPRI = GRI.PRIArray[lpPRI];
                // End:0x142
                if((currPRI == none) || currPRI.Team == none)
                {
                    // [Explicit Continue]
                    goto J0x1C4;
                }
                // End:0x157
                if(currPRI.bAdminSpecator)
                {
                    // [Explicit Continue]
                    goto J0x1C4;
                }
                // End:0x16E
                if(!currPRI.IsConnected)
                {
                    // [Explicit Continue]
                    goto J0x1C4;
                }
                // End:0x1C4
                if(currPRI.Team.TeamIndex == lpTeam)
                {
                    DrawTeamListSection_C(C, lpTeam, currPRI, memberCount, HostName, TeamListMemberBeginY, 205.0000000, 215.0000000);
                    memberCount++;
                }
                J0x1C4:

                lpPRI++;
                // [Loop Continue]
                goto J0xEB;
            }
            lpTeam++;
            // [Loop Continue]
            goto J0xD1;
        }        
    }
    else
    {
        Level.GRI.GetPRIArray(pris);
        memberCount = 0;
        lpPRI = 0;
        J0x206:

        // End:0x2DD [Loop If]
        if(lpPRI < pris.Length)
        {
            currPRI = pris[lpPRI];
            // End:0x235
            if(currPRI == none)
            {
                // [Explicit Continue]
                goto J0x2D3;
            }
            // End:0x24C
            if(!currPRI.IsConnected)
            {
                // [Explicit Continue]
                goto J0x2D3;
            }
            // End:0x261
            if(currPRI.bAdminSpecator)
            {
                // [Explicit Continue]
                goto J0x2D3;
            }
            DrawTeamListSection_C(C, 0, currPRI, memberCount, HostName, 271.0000000 * ScreenRatioYEx, 258.0000000, 268.0000000);
            // End:0x2CC
            if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
            {
                PRI_Self = currPRI;
                Ranking_Self = lpPRI + 1;
            }
            memberCount++;
            J0x2D3:

            lpPRI++;
            // [Loop Continue]
            goto J0x206;
        }
        // End:0x2F6
        if(1 <= pris.Length)
        {
            PRI_1st = pris[0];
        }
        // End:0x310
        if(2 <= pris.Length)
        {
            PRI_2nd = pris[1];
        }
    }
    //return;    
}

function RankingSorting(out array<PlayerReplicationInfo> pris, int iCurrent, int iNext)
{
    local PlayerReplicationInfo tempPRI;

    tempPRI = pris[iCurrent];
    pris[iCurrent] = pris[iNext];
    pris[iNext] = tempPRI;
    //return;    
}

function DrawGameInfo(Canvas C)
{
    local CalCoordsW calW;
    local float fX1, fX2, fY1, fY2;
    local string GameName;

    WSBIBG1.OffsetX = 0;
    WSBIBG1.OffsetY = 54;
    CalculateCoordinate(C, WSBIBG1, 1600.0000000, 53.0000000, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBIBG1.WidgetTexture, calW.XL, calW.YL);
    fX1 = 119.0000000 * ScreenRatioXEx;
    fX2 = 1480.0000000 * ScreenRatioXEx;
    fY1 = 67.0000000 * ScreenRatioYEx;
    fY2 = 94.0000000 * ScreenRatioYEx;
    C.DrawColor = DefaultFontColor;
    GameName = ((((((Level.GetMatchMaker().szSeverName $ " / ") $ Level.GetMatchMaker().szChannelName) $ " / ") $ "[") $ string(Level.GetMatchMaker().My_iRoom)) $ "] ") $ Level.GetMatchMaker().szRoomName;
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * fX1, C.ClipY * fY1, C.ClipX * fX2, C.ClipY * fY2, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    WSBBG3.OffsetX = 119;
    WSBBG3.OffsetY = 116;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinate(C, WSBBG3, 673.0000000, 300.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    // End:0x2F9
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        DrawTeamScoreAndTimer(C, 213, 166);        
    }
    else
    {
        DrawFFAScore(C, 213.0000000, 150.0000000);
    }
    DrawMissonComment(C);
    //return;    
}

function DrawFFAScore(Canvas C, float _iPosX, float _iPosY)
{
    local CalCoordsW calW;
    local int iGoalScore, iFourth, iThird, iSecond, iFirst, iWidth,
	    iHeight, iCount;

    local float fX1, fX2, fY1, fY2;
    local PlayerReplicationInfo currPRI1, currPRI2;

    CalculateCoordinate(C, WFFAScoreBG, 486.0000000, 71.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WFFAScoreBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iGoalScore = Level.GRI.GoalScore;
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    iWidth = 24;
    iHeight = 22;
    iGoalScore = Level.GRI.GoalScore;
    iThird = iGoalScore / 100;
    DigitsFFAGoalScore[2].Value = iThird;
    iSecond = int(float(iGoalScore) % float(100));
    iSecond = iSecond / 10;
    DigitsFFAGoalScore[1].Value = iSecond;
    iSecond = int(float(iGoalScore) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsFFAGoalScore[0].Value = iFirst;
    iCount = 0;
    J0x197:

    // End:0x2BB [Loop If]
    if(iCount < 3)
    {
        DigitsFFAGoalScore[iCount].OffsetX = int(float(default.DigitsFFAGoalScore[iCount].OffsetX) + _iPosX);
        DigitsFFAGoalScore[iCount].OffsetY = int(float(default.DigitsFFAGoalScore[iCount].OffsetY) + _iPosY);
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsFFAGoalScore[iCount], float(iWidth), float(iHeight), DigitsFFAGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x197;
    }
    iWidth = 13;
    iHeight = 18;
    iFourth = GetHudBaseOwner().TimeMinutes / 10;
    iThird = int(float(GetHudBaseOwner().TimeMinutes) % float(10));
    iSecond = GetHudBaseOwner().TimeSeconds / 10;
    iFirst = int(float(GetHudBaseOwner().TimeSeconds) % float(10));
    fX1 = ((213.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY1 = ((72.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    fX2 = ((226.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY2 = ((90.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine((((("" $ string(iFourth)) $ string(iThird)) $ ":") $ string(iSecond)) $ string(iFirst), 1, fX1, fY1, fX2, fY2, int((float(17) * C.ClipY) * ScreenRatioYEx));
    // End:0x493
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

function DrawRankingInfo(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local Color TextColor;
    local CalCoordsW calW;

    // End:0x0D
    if(currPRI == none)
    {
        return;
    }
    // End:0xF3
    if(currPRI == PRI_Self)
    {
        WFFAScoreOverLayer.OffsetX = int(float(default.WFFAScoreOverLayer.OffsetX) + _iPosX);
        WFFAScoreOverLayer.OffsetY = int(float(default.WFFAScoreOverLayer.OffsetY) + _iPosY);
        CalculateCoordinate(C, WFFAScoreOverLayer, 375.0000000, 32.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WFFAScoreOverLayer.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    DrawRankingInfo_Mark(C, currPRI, _iPosX, _iPosY);
    TextColor = C.MakeColor(0, 0, 0, byte(255));
    DrawRankingInfo_Text(C, currPRI, _iPosX + float(1), _iPosY + float(1), TextColor);
    // End:0x18C
    if(currPRI == PRI_Self)
    {
        TextColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));        
    }
    else
    {
        TextColor = C.MakeColor(200, 200, 160, byte(255));
    }
    DrawRankingInfo_Text(C, currPRI, _iPosX, _iPosY, TextColor);
    //return;    
}

function DrawRankingInfo_Mark(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local float markX1, markY1;
    local Material Mark, markClan;
    local wMatchUserInfo UserInfo;
    local int i;

    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x104
    if((UserInfo != none) && UserInfo.Clanname != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x104
        if(markClan[2] == none)
        {
            markClan[0] = Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark';
        }
    }
    i = 0;
    J0x10B:

    // End:0x255 [Loop If]
    if(i < 3)
    {
        // End:0x24B
        if(markClan[i] != none)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            markX1 = ((161.0000000 + _iPosX) * ScreenRatioXEx) * C.ClipX;
            markY1 = ((4.0000000 + _iPosY) * ScreenRatioYEx) * C.ClipY;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], (32.0000000 * ScreenRatioXEx) * C.ClipX, (32.0000000 * ScreenRatioYEx) * C.ClipY, 0.0000000, 0.0000000, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        i++;
        // [Loop Continue]
        goto J0x10B;
    }
    // End:0x278
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x3C8
    if(Mark != none)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        markX1 = ((195.0000000 + _iPosX) * ScreenRatioXEx) * C.ClipX;
        markY1 = ((4.0000000 + _iPosY) * ScreenRatioYEx) * C.ClipY;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, (32.0000000 * ScreenRatioXEx) * C.ClipX, (32.0000000 * ScreenRatioYEx) * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    //return;    
}

function DrawRankingInfo_Text(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY, Color FontColor)
{
    local int iRanking, iScore, iFontSize;
    local float fX1, fX2, fY1, fY2;

    C.DrawColor = FontColor;
    iFontSize = int((float(15) * C.ClipY) * ScreenRatioYEx);
    // End:0x50
    if(currPRI == PRI_1st)
    {
        iRanking = 1;        
    }
    else
    {
        // End:0x6A
        if(currPRI == PRI_2nd)
        {
            iRanking = 2;            
        }
        else
        {
            iRanking = Ranking_Self;
        }
    }
    fX1 = ((110.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY1 = ((10.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    fX2 = ((120.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY2 = ((29.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iRanking), 1, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = ((126.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY1 = ((10.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    fX2 = ((145.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY2 = ((29.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(Ranking, 1, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = ((249.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY1 = ((10.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    fX2 = ((406.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY2 = ((29.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(currPRI.PlayerName, 0, fX1, fY1, fX2, fY2, iFontSize);
    iScore = int(currPRI.Score);
    fX1 = ((419.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY1 = ((10.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    fX2 = ((429.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY2 = ((29.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScore), 1, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = ((457.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY1 = ((10.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    fX2 = ((476.0000000 + _iPosX) * C.ClipX) * ScreenRatioXEx;
    fY2 = ((29.0000000 + _iPosY) * C.ClipY) * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(Score_1, 1, fX1, fY1, fX2, fY2, iFontSize);
    //return;    
}

function DrawTeamScoreAndTimer(Canvas C, int _iPosX, int _iPosY)
{
    local CalCoordsW calW;
    local int iScoreAF, iScoreRSA, iGoalScore, iFourth, iThird, iSecond,
	    iFirst, iWidth, iHeight, iCount, iTeamIndex;

    local float fX1, fX2, fY1, fY2;
    local SpriteWidget WMyTeamScore;

    // End:0x77
    if((HudOwner.PlayerOwner.PlayerReplicationInfo != none) && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none)
    {
        iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamIndex = 0;
    }
    CalculateCoordinate(C, WTeamScoreBG, 486.0000000, 40.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamScoreBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iGoalScore = Level.GRI.GoalScore;
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    iWidth = 24;
    iHeight = 22;
    iGoalScore = Level.GRI.GoalScore;
    iFourth = iGoalScore / 1000;
    DigitsGoalScore[3].Value = iFourth;
    iGoalScore = int(float(iGoalScore) % float(1000));
    iThird = iGoalScore / 100;
    DigitsGoalScore[2].Value = iThird;
    iSecond = int(float(iGoalScore) % float(100));
    iSecond = iSecond / 10;
    DigitsGoalScore[1].Value = iSecond;
    iSecond = int(float(iGoalScore) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsGoalScore[0].Value = iFirst;
    iCount = 0;
    J0x252:

    // End:0x36E [Loop If]
    if(iCount < 4)
    {
        DigitsGoalScore[iCount].OffsetX = default.DigitsGoalScore[iCount].OffsetX + _iPosX;
        DigitsGoalScore[iCount].OffsetY = default.DigitsGoalScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsGoalScore[iCount], float(iWidth), float(iHeight), DigitsGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x252;
    }
    iScoreAF = int(Level.GRI.Teams[0].Score);
    iScoreRSA = int(Level.GRI.Teams[1].Score);
    iWidth = 34;
    iHeight = 30;
    iFourth = iScoreAF / 1000;
    DigitsAFScore[3].Value = iFourth;
    iScoreAF = int(float(iScoreAF) % float(1000));
    iThird = iScoreAF / 100;
    DigitsAFScore[2].Value = iThird;
    iSecond = int(float(iScoreAF) % float(100));
    iSecond = iSecond / 10;
    DigitsAFScore[1].Value = iSecond;
    iSecond = int(float(iScoreAF) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsAFScore[0].Value = iFirst;
    // End:0x515
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == Level.GRI.Teams[0].TeamIndex)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));        
    }
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x535:

    // End:0x651 [Loop If]
    if(iCount < 4)
    {
        DigitsAFScore[iCount].OffsetX = default.DigitsAFScore[iCount].OffsetX + _iPosX;
        DigitsAFScore[iCount].OffsetY = default.DigitsAFScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsAFScore[iCount], float(iWidth), float(iHeight), DigitsAFScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x535;
    }
    iFourth = iScoreRSA / 1000;
    DigitsRSAScore[3].Value = iFourth;
    iScoreRSA = int(float(iScoreRSA) % float(1000));
    iThird = iScoreRSA / 100;
    DigitsRSAScore[2].Value = iThird;
    iSecond = int(float(iScoreRSA) % float(100));
    iSecond = iSecond / 10;
    DigitsRSAScore[1].Value = iSecond;
    iSecond = int(float(iScoreRSA) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsRSAScore[0].Value = iFirst;
    // End:0x794
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == Level.GRI.Teams[1].TeamIndex)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));        
    }
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x7B4:

    // End:0x8D0 [Loop If]
    if(iCount < 4)
    {
        DigitsRSAScore[iCount].OffsetX = default.DigitsRSAScore[iCount].OffsetX + _iPosX;
        DigitsRSAScore[iCount].OffsetY = default.DigitsRSAScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsRSAScore[iCount], float(iWidth), float(iHeight), DigitsRSAScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x7B4;
    }
    iWidth = 13;
    iHeight = 18;
    iFourth = GetHudBaseOwner().TimeMinutes / 10;
    iThird = int(float(GetHudBaseOwner().TimeMinutes) % float(10));
    iSecond = GetHudBaseOwner().TimeSeconds / 10;
    iFirst = int(float(GetHudBaseOwner().TimeSeconds) % float(10));
    fX1 = ((213.0000000 + float(_iPosX)) * C.ClipX) * ScreenRatioXEx;
    fY1 = ((42.0000000 + float(_iPosY)) * C.ClipY) * ScreenRatioYEx;
    fX2 = ((226.0000000 + float(_iPosX)) * C.ClipX) * ScreenRatioXEx;
    fY2 = ((60.0000000 + float(_iPosY)) * C.ClipY) * ScreenRatioYEx;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine((((("" $ string(iFourth)) $ string(iThird)) $ ":") $ string(iSecond)) $ string(iFirst), 1, fX1, fY1, fX2, fY2, int((float(17) * C.ClipY) * ScreenRatioYEx));
    //return;    
}

function SetMissionInfo()
{
    local wMatchMaker kMM;
    local string limitWeapon;
    local bool bLimitWeapon;

    kMM = Level.GetMatchMaker();
    switch(kMM.eWeaponLimit)
    {
        // End:0x49
        case kMM.1:
            limitWeapon = WeaponLimitKnifeOnly;
            bLimitWeapon = true;
            // End:0x10B
            break;
        // End:0x6D
        case kMM.2:
            limitWeapon = WeaponLimitPistolOnly;
            bLimitWeapon = true;
            // End:0x10B
            break;
        // End:0x91
        case kMM.3:
            limitWeapon = WeaponLimitGrenadeOnly;
            bLimitWeapon = true;
            // End:0x10B
            break;
        // End:0xB5
        case kMM.4:
            limitWeapon = WeaponLimitRPGOnly;
            bLimitWeapon = true;
            // End:0x10B
            break;
        // End:0xD9
        case kMM.5:
            limitWeapon = WeaponLimitSROnly;
            bLimitWeapon = true;
            // End:0x10B
            break;
        // End:0xFD
        case kMM.6:
            limitWeapon = WeaponLimitSRBan;
            bLimitWeapon = true;
            // End:0x10B
            break;
        // End:0xFFFF
        default:
            bLimitWeapon = false;
            // End:0x10B
            break;
            break;
    }
    // End:0x136
    if(bLimitWeapon)
    {
        MissionInfo = (((GetStringPlayMode()) $ "( ") $ limitWeapon) $ " )";        
    }
    else
    {
        MissionInfo = GetStringPlayMode();
    }
    //return;    
}

function string GetStringPlayMode()
{
    local string PlayMode;
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    switch(Level.GRI.GameClass)
    {
        // End:0x93
        case "WGame.wTeamGame":
            // End:0x65
            if(11 == kMM.kGame_GameMode)
            {
                PlayMode = MissionNameFM;                
            }
            else
            {
                // End:0x85
                if(kMM.BotTutorial)
                {
                    PlayMode = MissionNameTM;                    
                }
                else
                {
                    PlayMode = MissionNameTD;
                }
            }
            // End:0x131
            break;
        // End:0xBB
        case "WMission.wDOMGameInfo":
            PlayMode = MissionNameDOMI;
            // End:0x131
            break;
        // End:0xE2
        case "WMission.wSDGameInfo":
            PlayMode = MissionNameSD;
            // End:0x131
            break;
        // End:0x10A
        case "WMission.wSBTGameInfo":
            PlayMode = MissionNameSBT;
            // End:0x131
            break;
        // End:0x12E
        case "WGame.wDeathMatch":
            PlayMode = MissionNameDM;
            // End:0x131
            break;
        // End:0xFFFF
        default:
            break;
    }
    return PlayMode;
    //return;    
}

function DrawMissonComment(Canvas C)
{
    local CalCoordsW calW;
    local float fX1, fX2, fY1, fY2, fFontSize;

    local string limitWeapon;
    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    WSBBGPanel.OffsetX = 129;
    WSBBGPanel.OffsetY = 255;
    CalculateCoordinate(C, WSBBGPanel, 653.0000000, 151.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBGPanel.WidgetTexture, calW.XL, calW.YL);
    fX1 = (170.0000000 * C.ClipX) * ScreenRatioXEx;
    fY1 = (274.0000000 * C.ClipY) * ScreenRatioYEx;
    fX2 = (740.0000000 * C.ClipX) * ScreenRatioXEx;
    fY2 = (302.0000000 * C.ClipY) * ScreenRatioYEx;
    fFontSize = 21.0000000 * ScreenRatioYEx;
    SetMissionInfo();
    switch(Level.GRI.GameClass)
    {
        // End:0x2D4
        case "WGame.wTeamGame":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            // End:0x22C
            if(11 == kMM.kGame_GameMode)
            {
                MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentFM1);
                MissonComment(C, 170.0000000, 360.0000000, 740.0000000, 381.0000000, MissionCommentFM2);                
            }
            else
            {
                // End:0x289
                if(kMM.BotTutorial)
                {
                    MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentTM1);
                    MissonComment(C, 170.0000000, 360.0000000, 740.0000000, 381.0000000, MissionCommentTM2);                    
                }
                else
                {
                    MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentTD1);
                    MissonComment(C, 170.0000000, 360.0000000, 740.0000000, 381.0000000, MissionCommentTD2);
                }
            }
            // End:0x644
            break;
        // End:0x39A
        case "WMission.wDOMGameInfo":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentDOMI1);
            MissonComment(C, 170.0000000, 360.0000000, 740.0000000, 381.0000000, MissionCommentDOMI2);
            // End:0x644
            break;
        // End:0x4DD
        case "WMission.wSDGameInfo":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            // End:0x492
            if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == AttackingTeam)
            {
                MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentSDA1);
                MissonComment(C, 170.0000000, 360.0000000, 740.0000000, 381.0000000, MissionCommentSDA2);                
            }
            else
            {
                MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentSDD1);
                MissonComment(C, 170.0000000, 360.0000000, 740.0000000, 381.0000000, MissionCommentSDD2);
            }
            // End:0x644
            break;
        // End:0x5A3
        case "WMission.wSBTGameInfo":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentSBT1);
            MissonComment(C, 170.0000000, 360.0000000, 740.0000000, 381.0000000, MissionCommentSBT2);
            // End:0x644
            break;
        // End:0x641
        case "WGame.wDeathMatch":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            MissonComment(C, 170.0000000, 320.0000000, 740.0000000, 341.0000000, MissionCommentDM1);
            // End:0x644
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function string GetStringGoalScore()
{
    local int iGoalScore, iFourth, iThird, iSecond, iFirst;

    iGoalScore = Level.GRI.GoalScore;
    iFourth = iGoalScore / 1000;
    iGoalScore = int(float(iGoalScore) % float(1000));
    iThird = iGoalScore / 100;
    iSecond = int(float(iGoalScore) % float(100));
    iSecond = iSecond / 10;
    iFirst = int(float(iGoalScore) % float(100));
    iFirst = int(float(iSecond) % float(10));
    return ((("" $ string(iFourth)) $ string(iThird)) $ string(iSecond)) $ string(iFirst);
    //return;    
}

function MissonComment(Canvas C, float X1, float Y1, float X2, float Y2, string MN)
{
    local float fX1, fX2, fY1, fY2, fFontSize;

    fFontSize = 16.0000000 * ScreenRatioYEx;
    C.DrawColor = DefaultFontColor;
    fX1 = (X1 * C.ClipX) * ScreenRatioXEx;
    fY1 = (Y1 * C.ClipY) * ScreenRatioYEx;
    fX2 = (X2 * C.ClipX) * ScreenRatioXEx;
    fY2 = (Y2 * C.ClipY) * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(MN, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
    //return;    
}

function DrawMapName(Canvas C)
{
    local CalCoordsW calW;
    local float FontSize;

    WSBBG3.OffsetX = 119;
    WSBBG3.OffsetY = 424;
    CalculateCoordinate(C, WSBBG3, 673.0000000, 52.0000000, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    FontSize = fMapNameFontsize * C.ClipY;
    C.SetDrawColor(byte(255), 150, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(mapInfo.FriendlyName, 1, C.ClipX * fMapNameX1, C.ClipY * fMapNameY1, C.ClipX * fMapNameX2, C.ClipY * fMapNameY2, int(FontSize), DefaultFontShadowColor);
    //return;    
}

function DrawMap(Canvas C)
{
    local CalCoordsW calW;

    DrawMapName(C);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WSBBG3.OffsetX = 119;
    WSBBG3.OffsetY = 484;
    CalculateCoordinate(C, WSBBG3, 673.0000000, 674.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WSBBGPanel.OffsetX = 129;
    WSBBGPanel.OffsetY = 494;
    CalculateCoordinate(C, WSBBGPanel, 653.0000000, 654.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBGPanel.WidgetTexture, calW.XL, calW.YL);
    // End:0x17A
    if(PartMinimap.HudOwner == none)
    {
        PartMinimap.Initialize(GetHudBaseOwner(), GetHudBaseOwner().Level);
    }
    PartMinimap.Draw(C);
    //return;    
}

function DrawTeamBG(Canvas C)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x5C
    if(Level.GRI.GameClass == "WGame.wDeathMatch")
    {
        DrawTeamListBG_FFA(C);        
    }
    else
    {
        DrawTeamListBG_Mission(C);
    }
    //return;    
}

function DrawTeamListBG_FFA(Canvas C)
{
    local CalCoordsW calW;

    WSBBG3.OffsetX = 808;
    WSBBG3.OffsetY = 116;
    CalculateCoordinate(C, WSBBG3, 673.0000000, 1042.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    CalculateCoordinate(C, WFFABG, 667.0000000, 100.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WFFABG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WSBBG2.OffsetX = 810;
    WSBBG2.OffsetY = 1107;
    CalculateCoordinate(C, WSBBG2, 669.0000000, 48.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG2.WidgetTexture, calW.XL, calW.YL);
    //return;    
}

function DrawTeamListBG_Mission(Canvas C)
{
    local CalCoordsW calW;

    WSBBG3.OffsetX = 808;
    WSBBG3.OffsetY = 116;
    CalculateCoordinate(C, WSBBG3, 673.0000000, 517.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WTeamAF.OffsetX = default.WTeamAF.OffsetX;
    WTeamAF.OffsetY = default.WTeamAF.OffsetY;
    CalculateCoordinate(C, WTeamAF, 669.0000000, 48.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamAF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WSBBG3.OffsetX = 808;
    WSBBG3.OffsetY = 641;
    CalculateCoordinate(C, WSBBG3, 673.0000000, 517.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WTeamRSA.OffsetX = default.WTeamRSA.OffsetX;
    WTeamRSA.OffsetY = default.WTeamRSA.OffsetY;
    CalculateCoordinate(C, WTeamRSA, 669.0000000, 48.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamRSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamBG(C);
    // End:0x9D
    if(Level.GRI.GameClass == "WGame.wDeathMatch")
    {
        DrawContentDescription(C, 0.0000000, 53.0000000);
        DrawTeamListSectionStripe(C, 309.0000000, 16);        
    }
    else
    {
        DrawContentDescription(C, 0.0000000, 0.0000000);
        DrawContentDescription(C, 0.0000000, 525.0000000);
        DrawTeamListSectionStripe(C, 256.0000000, 8);
        DrawTeamListSectionStripe(C, 781.0000000, 8);
    }
    DrawTeamListSection(C);
    DrawGameInfo(C);
    DrawMap(C);
    //return;    
}

simulated function UpdateScoreBoard(Canvas Canvas)
{
    super(ScoreBoard).UpdateScoreBoard(Canvas);
    GetHudBaseOwner().DoUpdateTime();
    //return;    
}

defaultproperties
{
    SpBG=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.score_board_1_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=821,Y2=694),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=98,OffsetY=33,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Sp2TeamNameSection=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_b_2team',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=161,Y2=24),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Sp3TeamNameSection=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_b_3team',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=107,Y2=24),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpTeamNameEmphasis=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_oran',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=179,Y2=27),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpTeamList=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.score_board_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=465,Y2=272),TextureScale=0.6363000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=443,OffsetY=43,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpSelectLine=(WidgetTexture=Texture'Warfare_UI_UI.Common.img_back_quick_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=16,Y2=16),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    MapImage=(WidgetTexture=Texture'Warfare_UI.HUD_MinimapBG.repair',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=511,Y2=511),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=5,OffsetY=23,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    IndicateDeads=true
    DefaultFontColor=(R=255,G=255,B=255,A=220)
    DeadFontColor=(R=128,G=128,B=128,A=255)
    DefaultFontShadowColor=(R=0,G=0,B=0,A=220)
    FriendlyColor=(R=124,G=241,B=126,A=255)
    MyselfColor=(R=255,G=153,B=0,A=255)
    BGBeginX=0.0957031
    BGBeginY=0.0429688
    BGWidth=0.8017578
    BGHeight=0.9036458
    TeamListBeginX=0.5050000
    TeamListBeginY=0.1770833
    TeamListOffsetY=0.4375000
    TeamListWidth=0.4181250
    TeamListHeight=0.3528646
    TeamListTeamNameBeginX=0.4521484
    TeamListTeamNameBeginY=0.0416667
    TeamListTeamNameWidth=0.1269531
    TeamListTeamNameHeight=0.0191667
    TeamListTeamNameFontSize=0.0100000
    TeamListMemberNicknameBeginX=0.5837500
    TeamListMemberNicknameWidth=0.1000000
    TeamListMemberScoreBeginX=0.7268750
    TeamListMemberScoreWidth=0.0331250
    TeamListMemberKillBeginX=0.7687500
    TeamListMemberKillWidth=0.0187500
    TeamListMemberAssistBeginX=0.7962500
    TeamListMemberAssistWidth=0.0456250
    TeamListMemberDeathBeginX=0.8506250
    TeamListMemberDeathWidth=0.0306250
    TeamListMemberPingBeginX=0.8808594
    TeamListMemberPingWidth=0.0361328
    TeamListMemberBeginY=0.1816667
    TeamListMemberHeight=0.0191667
    TeamListMemberHeightOffset=0.0441667
    TeamListMemberFontSize=0.0150000
    TeamNameEmphasisBeginX=0.4375000
    TeamNameEmphasisBeginY=0.0585938
    TeamNameEmphasisOffsetY=0.3671875
    TeamNameEmphasisWidth=0.1748047
    TeamNameEmphasisHeight=0.0351562
    TeamNameSectionBeginX=0.1064453
    TeamNameSectionBeginY=0.0650000
    TeamNameSectionEndY=0.0883333
    TeamNameSectionTeam2OffsetX=0.1582031
    TeamNameSectionTeam2Width=0.1572266
    TeamNameSectionTeam2Height=0.0312500
    TeamNameSectionTeam3OffsetX=0.1054688
    TeamNameSectionTeam3Width=0.1044922
    TeamNameSectionTeam3Height=0.0312500
    TeamNameFontSize=0.0116667
    TeamScoreSectionBeginY=0.1380208
    TeamScoreSectionEndY=0.1718750
    TeamScoreFontSize=0.0183000
    GameClassBeginX=0.1025391
    GameClassBeginY=0.3229167
    GameClassEndX=0.4160156
    GameClassEndY=0.3541667
    GameClassFontSize=0.0182300
    GameDescriptionBeginX=0.1025391
    GameDescriptionBeginY=0.3619792
    GameDescriptionEndX=0.4160156
    GameDescriptionEndY=0.3854167
    GameDescriptionFontSize=0.0143230
    MapNameBeginX=0.1103516
    MapNameBeginY=0.4010417
    MapNameEndX=0.4179688
    MapNameEndY=0.4257812
    MapNameFontSize=0.0150000
    MapNameFontColor=(R=128,G=128,B=128,A=220)
    MapImageBeginX=0.1074219
    MapImageBeginY=0.4335938
    MapImageEndX=0.4189453
    MapImageEndY=0.8489583
    TimeX1=0.1074219
    TimeY1=0.1354167
    TimeX2=0.4218750
    TimeY2=0.0937500
    TimeColor=(R=255,G=255,B=255,A=255)
    TimeFontSize=0.0182300
    fMapNameX1=0.1062500
    fMapNameX2=0.4625000
    fMapNameY1=0.3625000
    fMapNameY2=0.3866667
    fMapNameFontsize=0.0175000
    MissionNameTD="????"
    MissionNameSD="????"
    MissionNameDOMI="???"
    MissionNameSBT="????"
    MissionNameDM="???"
    MissionNameFM="????"
    MissionNameTM="????"
    MissionCommentTD1="??? ???? ?? ?? ??? ???? ?? ?????."
    MissionCommentSDA1="???(A? B)? ??? ???? ???? ???? ?????."
    MissionCommentSDA2="???? ???? ?? ??? ???? ?? ?????."
    MissionCommentSDD1="???(A? B)? ??? ????? ???? ???? ?????."
    MissionCommentSDD2="???? ???? ?? ??? ???? ?? ?????."
    MissionCommentDOMI1="??? ???? ?? ?? ??? ???? ?? ?????."
    MissionCommentSBT1="??? ?? ???? ???? ???? ???? ?????."
    MissionCommentSBT2="???? ???? ?? ??? ???? ?? ?????."
    MissionCommentDM1="??? ???? ?? ?? ??? ???? ????? ?????."
    MissionCommentFM1="??? ???? ?? ?? ??? ???? ?? ?????."
    MissionCommentTM1="????? ?? ??? ?? ????."
    StrLoading="??"
    WeaponLimitKnifeOnly="??"
    WeaponLimitRPGOnly="???"
    WeaponLimitSROnly="???"
    WeaponLimitSRBan="????"
    WSBIBG1=(WidgetTexture=Texture'Warfare_UI_HUD.Common.img_HUD_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=2),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=54,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBIBG2=(WidgetTexture=Texture'Warfare_UI_HUD.Common.img_HUD_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=8),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBG2=(WidgetTexture=Texture'Warfare_UI_HUD.Common.hud_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=8),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBG3=(WidgetTexture=Texture'Warfare_UI_HUD.Common.hud_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=119,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBGPanel=(WidgetTexture=Texture'Warfare_UI_UI.Common.panel_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=16,Y2=16),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=129,OffsetY=255,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamAF=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.img_scbod_AF_ma',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=671,Y2=50),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=810,OffsetY=118,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamRSA=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.img_scbod_RSA_ma',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=671,Y2=50),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=810,OffsetY=643,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDivid=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.img_list_divid_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=3,Y2=19),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=864,OffsetY=176,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WContentBG=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.butt_list_scbd_n',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=16,Y2=16),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=810,OffsetY=167,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WListDivedBar=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.list_scor_bord',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=669,Y2=2),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WIconMaster=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.icon_mstr_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=46,Y2=46),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WIconDeath=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.icon_death',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=46,Y2=46),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WPing[0]=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.sgau_ping_b_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=30,Y2=30),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WPing[1]=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.sgau_ping_b_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=30,Y2=30),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WPing[2]=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.sgau_ping_b_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=30,Y2=30),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WPing[3]=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.sgau_ping_b_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=30,Y2=30),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WPing[4]=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.sgau_ping_b_4',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=30,Y2=30),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDigitsNumberMid=(DigitTexture=Texture'Warfare_UI_HUD.Common.img_number3',TextureCoords=(X1=315,Y1=0,X2=349,Y2=28),TextureCoords[1]=(X1=0,Y1=0,X2=34,Y2=28),TextureCoords[2]=(X1=35,Y1=0,X2=69,Y2=28),TextureCoords[3]=(X1=70,Y1=0,X2=104,Y2=28),TextureCoords[4]=(X1=105,Y1=0,X2=139,Y2=28),TextureCoords[5]=(X1=140,Y1=0,X2=174,Y2=28),TextureCoords[6]=(X1=175,Y1=0,X2=209,Y2=28),TextureCoords[7]=(X1=210,Y1=0,X2=244,Y2=28),TextureCoords[8]=(X1=245,Y1=0,X2=279,Y2=28),TextureCoords[9]=(X1=280,Y1=0,X2=314,Y2=28),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WTeamScoreBG=(WidgetTexture=Texture'Warfare_UI_HUD.Common.img_score',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=486,Y2=40),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=213,OffsetY=166,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFABG=(WidgetTexture=Texture'Warfare_UI_UI.HUD_ETC.img_scbod_indimat_ma',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=671,Y2=102),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=810,OffsetY=118,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreBG=(WidgetTexture=Texture'Warfare_UI_HUD.Common.img_score_0',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=486,Y2=71),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=213,OffsetY=150,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreOverLayer=(WidgetTexture=Texture'Warfare_UI_HUD.Common.img_score_0_sel',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=375,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=107,OffsetY=4,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsAFScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=111,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=76,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=41,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=6,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=446,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=411,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=376,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=341,OffsetY=5,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=269,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=244,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=219,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=194,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsFFAGoalScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=67,OffsetY=24,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsFFAGoalScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=42,OffsetY=24,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsFFAGoalScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=17,OffsetY=24,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=260,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=246,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=227,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=213,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    WCompareSign=(WidgetTexture=Texture'Warfare_UI_HUD.Common.img_number2',RenderStyle=5,TextureCoords=(X1=297,Y1=0,X2=344,Y2=31),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=346,OffsetY=38,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    fContentBeginY=0.1450000
    fContentEndY=0.1633333
    fClanX1=0.5093750
    fClanX2=0.5362500
    fRankX1=0.5450000
    fRankX2=0.5693750
    fNickNameX1=0.5781250
    fNickNameX2=0.7181250
    fScoreX1=0.7268750
    fScoreX2=0.7600000
    fKillX1=0.7687500
    fKillX2=0.7875000
    fDeathX1=0.8506250
    fDeathX2=0.8812500
    fAssistX1=0.7962500
    fAssistX2=0.8418750
    fPingX1=0.8837500
    fPingX2=0.9206250
    fTeamScoreX1=0.8075000
    fTeamScoreX2=0.8512500
    ContentFontSize=0.0125000
    ContentFontColor=(R=255,G=255,B=255,A=255)
}