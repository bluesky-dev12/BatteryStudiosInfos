/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\xScoreBoardTeamGame.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:179
 *	Functions:36
 *
 *******************************************************************************/
class xScoreBoardTeamGame extends xScoreBoard
    dependson(xScoreBoard)
    dependson(wScoreboardPart_Minimap)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum SBGT
{
    GT_TD,
    GT_DOMI,
    GT_SD
};

enum GOAL_SCORE
{
    GOAL_100
};

var() SpriteWidget SpBG;
var() SpriteWidget Sp2TeamNameSection;
var() SpriteWidget Sp3TeamNameSection;
var() SpriteWidget SpTeamNameEmphasis;
var() SpriteWidget SpTeamList;
var() SpriteWidget SpSelectLine;
var() SpriteWidget MapImage;
var() SpriteWidget wGM_Playlist_BG;
var() SpriteWidget wGM_Players_HP;
var() SpriteWidget wGM_TeamMark_AF;
var() SpriteWidget wGM_TeamMark_RSA;
var() SpriteWidget wGM_ViewTarget;
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
var localized string MissionNameDF;
var localized string MissionNameDOA;
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
var localized string MissionCommentDF1;
var localized string MissionCommentDOA;
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
var SpriteWidget WPingBack;
var SpriteWidget WPing;
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
var() SpriteWidget WDFBG;
var() array<NumericWidget> DigitsAFScore;
var() array<NumericWidget> DigitsRSAScore;
var() array<NumericWidget> DigitsGoalScore;
var() array<NumericWidget> DigitsFFAGoalScore;
var() array<NumericWidget> DigitsTime;
var() SpriteWidget WCompareSign;
var wScoreboardPart_Minimap PartMinimap;
var() SpriteWidget ScoreBoardTitleBG;
var() SpriteWidget WDEFTITLE;

function HudBase GetHudBaseOwner()
{
    return HudBase(HudOwner);
}

function PostBeginPlay()
{
    super(ScoreBoard).PostBeginPlay();
    PartMinimap = Spawn(class'wScoreboardPart_Minimap', self);
    PartMinimap.__OnPreDrawMyself__Delegate = DrawMinimap_GameMode;
    MapName = Level.GetMatchMaker().szMapName;
    Log(string(self) $ " / mapInfo szMapName:" $ Level.GetMatchMaker().szMapName);
    mapInfo = Level.GetMatchMaker().MapSettings.GetMapInfo(Level.GetMatchMaker().szMapName);
}

function DrawMinimap_GameMode(Canvas C)
{
    GetHudBaseOwner().DrawMiniMap(PartMinimap, C);
}

function SetAttackingTeam(int Index)
{
    AttackingTeam = Index;
}

function DrawBGS(Canvas C);
function DrawContentDescription(Canvas C, float _OffSetX, float _OffSetY)
{
    local CalCoordsW calW;
    local float fOffSetX, fOffSetY;

    // End:0x88
    if(Level.GRI.GameClass == "WGame.wDeathMatch" || Level.GRI.GameClass == "WMission.wDefenceGameInfo")
    {
        WContentBG.OffsetX = 467;
        WContentBG.OffsetY = 327;
    }
    CalculateCoordinate(C, WContentBG, 667.0, 37.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WContentBG.WidgetTexture, calW.XL, calW.YL);
    // End:0x13b
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        DrawTextTeamScore(C, fOffSetX, fOffSetY);
    }
    fOffSetX = _OffSetX * ScreenRatioXEx * C.ClipX;
    fOffSetY = _OffSetY * ScreenRatioYEx * C.ClipY;
    C.DrawColor = DefaultFontColor;
    fClanX1 = 0.2931250;
    // End:0x214
    if(Level.GRI.GameClass == "WGame.wDeathMatch" || Level.GRI.GameClass == "WMission.wDefenceGameInfo")
    {
        fContentBeginY = 0.280;
    }
    // End:0x21f
    else
    {
        fContentBeginY = 0.146250;
    }
    C.BtrDrawTextJustifiedWithVolumeLine(Clan, 1, C.ClipX * fClanX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fClanX1 + C.ClipX * 0.030, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fRankX1 = 0.3231250;
    C.BtrDrawTextJustifiedWithVolumeLine(Rank, 1, C.ClipX * fRankX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fRankX1 + C.ClipX * 0.030, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fNickNameX1 = 0.3531250;
    C.BtrDrawTextJustifiedWithVolumeLine(NickName, 1, C.ClipX * fNickNameX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fNickNameX1 + C.ClipX * 0.166250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fScoreX1 = 0.5193750;
    C.BtrDrawTextJustifiedWithVolumeLine(Score, 1, C.ClipX * fScoreX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fScoreX1 + C.ClipX * 0.03250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fKillX1 = 0.5518750;
    C.BtrDrawTextJustifiedWithVolumeLine(Kill, 1, C.ClipX * fKillX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fKillX1 + C.ClipX * 0.03250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fAssistX1 = 0.5843750;
    C.BtrDrawTextJustifiedWithVolumeLine(Assist, 1, C.ClipX * fAssistX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fAssistX1 + C.ClipX * 0.0593750, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fDeathX1 = 0.643750;
    C.BtrDrawTextJustifiedWithVolumeLine(Death, 1, C.ClipX * fDeathX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fDeathX1 + C.ClipX * 0.03250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fPingX1 = 0.6850;
    fPingX2 = 0.7006250;
    fContentEndY = 0.2108330;
    C.BtrDrawTextJustifiedWithVolumeLine(Ping, 1, C.ClipX * fPingX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fPingX2, C.ClipY * fContentEndY + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
}

function DrawContentDescriptionTeam(Canvas C, float _OffSetX, float _OffSetY)
{
    local CalCoordsW calW;
    local float fOffSetX, fOffSetY;

    WContentBG.OffsetY = int(float(default.WContentBG.OffsetY) + _OffSetY);
    CalculateCoordinate(C, WContentBG, 669.0, 37.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WContentBG.WidgetTexture, calW.XL, calW.YL);
    // End:0xd3
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        DrawTextTeamScore(C, fOffSetX, fOffSetY);
    }
    fOffSetX = _OffSetX * ScreenRatioXEx * C.ClipX;
    fOffSetY = _OffSetY * ScreenRatioYEx * C.ClipY;
    C.DrawColor = DefaultFontColor;
    fClanX1 = 0.2931250;
    fContentBeginY = 0.1950;
    C.BtrDrawTextJustifiedWithVolumeLine(Clan, 1, C.ClipX * fClanX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fClanX1 + C.ClipX * 0.030, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fRankX1 = 0.3231250;
    C.BtrDrawTextJustifiedWithVolumeLine(Rank, 1, C.ClipX * fRankX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fRankX1 + C.ClipX * 0.030, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fNickNameX1 = 0.3531250;
    C.BtrDrawTextJustifiedWithVolumeLine(NickName, 1, C.ClipX * fNickNameX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fNickNameX1 + C.ClipX * 0.166250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fScoreX1 = 0.5193750;
    C.BtrDrawTextJustifiedWithVolumeLine(Score, 1, C.ClipX * fScoreX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fScoreX1 + C.ClipX * 0.03250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fKillX1 = 0.5518750;
    C.BtrDrawTextJustifiedWithVolumeLine(Kill, 1, C.ClipX * fKillX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fKillX1 + C.ClipX * 0.03250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fAssistX1 = 0.5843750;
    C.BtrDrawTextJustifiedWithVolumeLine(Assist, 1, C.ClipX * fAssistX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fAssistX1 + C.ClipX * 0.0593750, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fDeathX1 = 0.643750;
    C.BtrDrawTextJustifiedWithVolumeLine(Death, 1, C.ClipX * fDeathX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fDeathX1 + C.ClipX * 0.03250, C.ClipY * fContentBeginY + C.ClipY * 0.0118750 + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    fPingX1 = 0.6850;
    fPingX2 = 0.7006250;
    fContentEndY = 0.2108330;
    C.BtrDrawTextJustifiedWithVolumeLine(Ping, 1, C.ClipX * fPingX1, C.ClipY * fContentBeginY + fOffSetY, C.ClipX * fPingX2, C.ClipY * fContentEndY + fOffSetY, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
}

function DrawTextTeamScore(Canvas C, float _OffSetX, float _OffSetY)
{
    local int iScoreAF, iScoreRSA, X1, X2, Y1, Y2;

    local float fOffSetX, fOffSetY;

    fOffSetX = _OffSetX * ScreenRatioXEx * C.ClipY;
    fOffSetY = _OffSetY * ScreenRatioYEx * C.ClipY;
    C.DrawColor = DefaultFontColor;
    fOffSetY = 525.0;
    iScoreAF = int(Level.GRI.Teams[0].Score);
    iScoreRSA = int(Level.GRI.Teams[1].Score);
    X1 = int(float(1040) * C.ClipX * ScreenRatioXEx);
    Y1 = int(float(190) * C.ClipY * ScreenRatioYEx);
    X2 = int(float(1127) * C.ClipX * ScreenRatioXEx);
    Y2 = int(float(212) * C.ClipY * ScreenRatioYEx);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x192
    if(iScoreAF > iScoreRSA)
    {
        C.SetDrawColor(byte(255), 192, 0, byte(255));
    }
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScoreAF), 1, float(X1), float(Y1), float(X2), float(Y2), int(float(23) * C.ClipY * ScreenRatioYEx), DefaultFontShadowColor);
    X1 = int(float(1040) * C.ClipX * ScreenRatioXEx);
    Y1 = int(float(678) * C.ClipY * ScreenRatioYEx);
    X2 = int(float(1127) * C.ClipX * ScreenRatioXEx);
    Y2 = int(float(700) * C.ClipY * ScreenRatioYEx);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x2cd
    if(iScoreAF < iScoreRSA)
    {
        C.SetDrawColor(byte(255), 192, 0, byte(255));
    }
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScoreRSA), 1, float(X1), float(Y1), float(X2), float(Y2), int(float(23) * C.ClipY * ScreenRatioYEx), DefaultFontShadowColor);
}

function DrawTime(Canvas C)
{
    local string Time;

    Time = "" $ string(GetHudBaseOwner().TimeMinutes) $ " : " $ string(GetHudBaseOwner().TimeSeconds);
    C.DrawColor = TimeColor;
    C.BtrDrawTextJustifiedWithVolumeLine(Time, 1, C.ClipX * TimeX1, C.ClipY * TimeY1, C.ClipX * TimeX2, C.ClipY * TimeY2, int(TimeFontSize * C.ClipY), DefaultFontShadowColor);
}

function DrawTeamListSectionStripe(Canvas C, float OffsetY, int iTeamUserMax)
{
    local CalCoordsW calW;
    local int iMemberCount, Y1, Y2;

    iMemberCount = 0;
    J0x07:
    // End:0x107 [While If]
    if(iMemberCount < iTeamUserMax)
    {
        Y1 = int(OffsetY + float(iMemberCount * 49));
        Y2 = int(float(Y1) + TeamListMemberHeight);
        WListDivedBar.OffsetX = 467;
        WListDivedBar.OffsetY = Y1;
        CalculateCoordinate(C, WListDivedBar, 667.0, 3.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WListDivedBar.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iMemberCount;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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

    markWidth = 24.0;
    markHeight = 24.0;
    Y1 = 0.231660 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
    Y2 = Y1 + 0.01750 * C.ClipY;
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    // End:0x233
    if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
    {
        TeamListBeginX = 0.293750;
        X1 = 0.2918750 * C.ClipX;
        X2 = 0.708750 * C.ClipX;
        y3 = 0.2191660 * C.ClipY + float(memberCount) * 0.040830 * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
        y4 = y3 + float(48) * ScreenRatioYEx * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
        C.SetPos(X1, y3);
        C.DrawTile(SpSelectLine.WidgetTexture, 667.0 * ScreenRatioXEx * C.ClipX, 48.0 * ScreenRatioYEx * C.ClipY, 0.0, 0.0, 667.0, 48.0);
    }
    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x337
    if(UserInfo != none && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x337
        if(markClan[2] == none)
        {
            markClan[0] = texture'ex_clanmark';
        }
    }
    i = 0;
    J0x33e:
    // End:0x4ac [While If]
    if(i < 3)
    {
        // End:0x4a2
        if(markClan[i] != none)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            markX1 = 0.293750 * C.ClipX;
            markY1 = 0.220 * C.ClipY + float(memberCount) * 0.040830 * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], 46.0 * ScreenRatioXEx * C.ClipX, 46.0 * ScreenRatioYEx * C.ClipY, 0.0, 0.0, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x33e;
    }
    // End:0x4cf
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x643
    if(Mark != none)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        markX1 = 0.3243750 * C.ClipX;
        markY1 = 0.220 * C.ClipY + float(memberCount) * 0.040830 * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, 46.0 * ScreenRatioXEx * C.ClipX, 46.0 * ScreenRatioYEx * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    Dead = currPRI.IsDead && Level.GRI.GameClass != "WMission.wSDGameInfo" || Level.GRI.RoundState == 2;
    // End:0x7e0
    if(HostName == currPRI.PlayerName)
    {
        IconPosY = markBeginY + float(4);
        markX1 = 0.4906250 * C.ClipX;
        markY1 = 0.220 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
        CalculateCoordinate(C, WIconMaster, 46.0, 46.0, calW);
        C.SetPos(markX1, markY1);
        C.DrawTile(WIconMaster.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x9f9
    else
    {
        // End:0x8dc
        if(currPRI.bPrecached == false)
        {
            IconPosY = markBeginY + float(4);
            markX1 = 0.4906250 * C.ClipX;
            markY1 = 0.220 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
            C.BtrDrawTextJustified(StrLoading, 0, markX1, markY1, markX1 + 0.028750 * C.ClipX, markY1 + 0.03830 * C.ClipY, FontSize);
        }
        // End:0x9f9
        else
        {
            // End:0x9f9
            if(Dead)
            {
                IconPosY = markBeginY + float(4);
                markX1 = 0.4906250 * C.ClipX;
                markY1 = 0.220 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY + float(lpTeam) * 0.406660 * C.ClipY;
                CalculateCoordinate(C, WIconDeath, 46.0, 46.0, calW);
                C.SetPos(markX1, markY1);
                C.DrawTile(WIconDeath.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
    }
    X1 = 0.3531250 * C.ClipX;
    X2 = X1 + 0.166250 * C.ClipX;
    // End:0xa56
    if(Dead)
    {
        C.DrawColor = DeadFontColor;
    }
    // End:0xb11
    else
    {
        // End:0xaa1
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.PlayerName == currPRI.PlayerName)
        {
            C.DrawColor = MyselfColor;
        }
        // End:0xb11
        else
        {
            // End:0xafd
            if(UserInfo != none && Level.GetMatchMaker().IsFriendlyUser(UserInfo.UserName, UserInfo.ClanName))
            {
                C.DrawColor = FriendlyColor;
            }
            // End:0xb11
            else
            {
                C.DrawColor = DefaultFontColor;
            }
        }
    }
    strTemp = GetEllipsString(C, currPRI.PlayerName, 1111.0 - float(934) / 1600.0 * C.ClipX, float(FontSize));
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    // End:0xbb0
    if(Dead)
    {
        C.DrawColor = DeadFontColor;
    }
    // End:0xbc4
    else
    {
        C.DrawColor = DefaultFontColor;
    }
    X1 = X2;
    X2 = X1 + 0.03250 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Score)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = X2;
    X2 = X1 + 0.03250 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Kills), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = X2;
    X2 = X1 + 0.0593750 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Assists), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = X2;
    X2 = X1 + 0.03250 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Deaths)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    WPingBack.OffsetX = 1096;
    WPingBack.OffsetY = 275 + lpTeam * 488 + memberCount * 49;
    CalculateCoordinate(C, WPingBack, 25.0, 25.0, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPingBack.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iPing = currPRI.Ping * 4;
    // End:0xea4
    if(iPing < 0)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255));
    }
    // End:0xf07
    else
    {
        // End:0xeca
        if(iPing < 120)
        {
            C.SetDrawColor(120, byte(255), 0);
        }
        // End:0xf07
        else
        {
            // End:0xef0
            if(iPing < 250)
            {
                C.SetDrawColor(byte(255), 204, 0);
            }
            // End:0xf07
            else
            {
                C.SetDrawColor(byte(255), 0, 0);
            }
        }
    }
    WPing.OffsetX = 1100;
    WPing.OffsetY = 279 + lpTeam * 488 + memberCount * 49;
    CalculateCoordinate(C, WPing, 17.0, 17.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPing.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x100e
    if(Level.GetMatchMaker().IsTestMode)
    {
    }
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

    markWidth = 24.0;
    markHeight = 24.0;
    Y1 = 0.3166660 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY;
    Y2 = Y1 + 0.01750 * C.ClipY;
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    // End:0x1d3
    if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
    {
        TeamListBeginX = 0.293750;
        X1 = 0.2918750 * C.ClipX;
        X2 = 0.708750 * C.ClipX;
        y3 = 0.305830 * C.ClipY + float(memberCount) * 0.040830 * C.ClipY;
        y4 = y3 + float(48) * ScreenRatioYEx * C.ClipY;
        C.SetPos(X1, y3);
        C.DrawTile(SpSelectLine.WidgetTexture, 667.0 * ScreenRatioXEx * C.ClipX, 48.0 * ScreenRatioYEx * C.ClipY, 0.0, 0.0, 667.0, 48.0);
    }
    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x2d7
    if(UserInfo != none && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x2d7
        if(markClan[2] == none)
        {
            markClan[0] = texture'ex_clanmark';
        }
    }
    i = 0;
    J0x2de:
    // End:0x42c [While If]
    if(i < 3)
    {
        // End:0x422
        if(markClan[i] != none)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            markX1 = 0.293750 * C.ClipX;
            markY1 = 0.305830 * C.ClipY + float(memberCount) * 0.040830 * C.ClipY;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], 46.0 * ScreenRatioXEx * C.ClipX, 46.0 * ScreenRatioYEx * C.ClipY, 0.0, 0.0, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2de;
    }
    // End:0x44f
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x5a3
    if(Mark != none)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        markX1 = 0.3243750 * C.ClipX;
        markY1 = 0.305830 * C.ClipY + float(memberCount) * 0.040830 * C.ClipY;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, 46.0 * ScreenRatioXEx * C.ClipX, 46.0 * ScreenRatioYEx * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    Dead = currPRI.IsDead && Level.GRI.GameClass != "WMission.wSDGameInfo" || Level.GRI.RoundState == 2;
    // End:0x720
    if(HostName == currPRI.PlayerName)
    {
        IconPosY = markBeginY + float(4);
        markX1 = 0.4906250 * C.ClipX;
        markY1 = 0.3058330 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY;
        CalculateCoordinate(C, WIconMaster, 46.0, 46.0, calW);
        C.SetPos(markX1, markY1);
        C.DrawTile(WIconMaster.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x917
    else
    {
        // End:0x81a
        if(currPRI.bPrecached == false)
        {
            IconPosY = markBeginY + float(4);
            markX1 = 0.4906250 * C.ClipX;
            markY1 = 0.3058330 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY;
            CalculateCoordinate(C, WIconDeath, 46.0, 46.0, calW);
            C.SetPos(markX1, markY1);
            C.BtrDrawTextJustified(StrLoading, 0, calW.X1, calW.Y1, calW.X2, calW.Y2, FontSize);
        }
        // End:0x917
        else
        {
            // End:0x917
            if(Dead)
            {
                IconPosY = markBeginY + float(4);
                markX1 = 0.4906250 * C.ClipX;
                markY1 = 0.3058330 * C.ClipY + float(memberCount) * 0.0408330 * C.ClipY;
                CalculateCoordinate(C, WIconDeath, 46.0, 46.0, calW);
                C.SetPos(markX1, markY1);
                C.DrawTile(WIconDeath.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
    }
    X1 = 0.3531250 * C.ClipX;
    X2 = X1 + 0.166250 * C.ClipX;
    // End:0x974
    if(Dead)
    {
        C.DrawColor = DeadFontColor;
    }
    // End:0xa2f
    else
    {
        // End:0x9bf
        if(Level.GetLocalPlayerController().PlayerReplicationInfo.PlayerName == currPRI.PlayerName)
        {
            C.DrawColor = MyselfColor;
        }
        // End:0xa2f
        else
        {
            // End:0xa1b
            if(UserInfo != none && Level.GetMatchMaker().IsFriendlyUser(UserInfo.UserName, UserInfo.ClanName))
            {
                C.DrawColor = FriendlyColor;
            }
            // End:0xa2f
            else
            {
                C.DrawColor = DefaultFontColor;
            }
        }
    }
    strTemp = GetEllipsString(C, currPRI.PlayerName, 1111.0 - float(934) / 1600.0 * C.ClipX, float(FontSize));
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    // End:0xace
    if(Dead)
    {
        C.DrawColor = DeadFontColor;
    }
    // End:0xae2
    else
    {
        C.DrawColor = DefaultFontColor;
    }
    X1 = X2;
    X2 = X1 + 0.03250 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Score)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = X2;
    X2 = X1 + 0.03250 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Kills), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = X2;
    X2 = X1 + 0.0593750 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(currPRI.Assists), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    X1 = X2;
    X2 = X1 + 0.03250 * C.ClipX;
    C.BtrDrawTextJustifiedWithVolumeLine(string(int(currPRI.Deaths)), 1, X1, Y1, X2, Y2, FontSize, DefaultFontShadowColor);
    WPingBack.OffsetX = 1096;
    WPingBack.OffsetY = 380 + lpTeam * 488 + memberCount * 49;
    CalculateCoordinate(C, WPingBack, 25.0, 25.0, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPingBack.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iPing = currPRI.Ping;
    // End:0xdbe
    if(iPing < 0)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255));
    }
    // End:0xe21
    else
    {
        // End:0xde4
        if(iPing < 120)
        {
            C.SetDrawColor(120, byte(255), 0);
        }
        // End:0xe21
        else
        {
            // End:0xe0a
            if(iPing < 250)
            {
                C.SetDrawColor(byte(255), 204, 0);
            }
            // End:0xe21
            else
            {
                C.SetDrawColor(byte(255), 0, 0);
            }
        }
    }
    WPing.OffsetX = 1100;
    WPing.OffsetY = 384 + lpTeam * 488 + memberCount * 49;
    CalculateCoordinate(C, WPing, 17.0, 17.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WPing.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0xf28
    if(Level.GetMatchMaker().IsTestMode)
    {
    }
}

function DrawTeamListSection(Canvas C)
{
    local int lpTeam, lpPRI, memberCount, Index;
    local PlayerReplicationInfo currPRI;
    local array<PlayerReplicationInfo> pris, prisReal;
    local wMatchMaker kMM;
    local string HostName;

    kMM = Level.GetMatchMaker();
    // End:0x9b
    if(kMM.UserInfos.Length > 0)
    {
        memberCount = 0;
        J0x31:
        // End:0x9b [While If]
        if(memberCount < kMM.UserInfos.Length)
        {
            // End:0x91
            if(kMM.UserInfos[memberCount].IsHost)
            {
                HostName = kMM.UserInfos[memberCount].UserName;
            }
            // End:0x9b
            else
            {
                ++ memberCount;
                // This is an implied JumpToken; Continue!
                goto J0x31;
            }
        }
    }
    // End:0x1db
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        lpTeam = 0;
        J0xd1:
        // End:0x1d8 [While If]
        if(lpTeam < 2)
        {
            memberCount = 0;
            lpPRI = 0;
            J0xeb:
            // End:0x1ce [While If]
            if(lpPRI < GRI.PRIArray.Length)
            {
                currPRI = GRI.PRIArray[lpPRI];
                // End:0x142
                if(currPRI == none || currPRI.Team == none)
                {
                }
                // End:0x1c4
                else
                {
                    // End:0x157
                    if(currPRI.bAdminSpecator)
                    {
                    }
                    // End:0x1c4
                    else
                    {
                        // End:0x16e
                        if(!currPRI.IsConnected)
                        {
                        }
                        // End:0x1c4
                        else
                        {
                            // End:0x1c4
                            if(currPRI.Team.TeamIndex == lpTeam)
                            {
                                DrawTeamListSection_C(C, lpTeam, currPRI, memberCount, HostName, TeamListMemberBeginY, 205.0, 215.0);
                                ++ memberCount;
                            }
                        }
                    }
                }
                ++ lpPRI;
                // This is an implied JumpToken; Continue!
                goto J0xeb;
            }
            ++ lpTeam;
            // This is an implied JumpToken; Continue!
            goto J0xd1;
        }
    }
    // End:0x339
    else
    {
        Level.GRI.GetPRIArray(pris);
        memberCount = 0;
        lpPRI = 0;
        J0x206:
        // End:0x306 [While If]
        if(lpPRI < pris.Length)
        {
            currPRI = pris[lpPRI];
            // End:0x235
            if(currPRI == none)
            {
            }
            // End:0x2fc
            else
            {
                // End:0x24c
                if(!currPRI.IsConnected)
                {
                }
                // End:0x2fc
                else
                {
                    // End:0x261
                    if(currPRI.bAdminSpecator)
                    {
                    }
                    // End:0x2fc
                    else
                    {
                        DrawPersonListSection_C(C, 0, currPRI, memberCount, HostName, 367.0 * ScreenRatioYEx, 258.0, 268.0);
                        // End:0x2cc
                        if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
                        {
                            PRI_Self = currPRI;
                            Ranking_Self = lpPRI + 1;
                        }
                        ++ memberCount;
                        Index = prisReal.Length;
                        prisReal.Insert(Index, 1);
                        prisReal[Index] = currPRI;
                    }
                }
            }
            ++ lpPRI;
            // This is an implied JumpToken; Continue!
            goto J0x206;
        }
        // End:0x31f
        if(1 <= prisReal.Length)
        {
            PRI_1st = prisReal[0];
        }
        // End:0x339
        if(2 <= prisReal.Length)
        {
            PRI_2nd = prisReal[1];
        }
    }
}

function RankingSorting(out array<PlayerReplicationInfo> pris, int iCurrent, int iNext)
{
    local PlayerReplicationInfo tempPRI;

    tempPRI = pris[iCurrent];
    pris[iCurrent] = pris[iNext];
    pris[iNext] = tempPRI;
}

function DrawGameInfo(Canvas C)
{
    local CalCoordsW calW;
    local float fX1, fX2, fY1, fY2;
    local string GameName;

    WSBIBG1.OffsetX = 0;
    WSBIBG1.OffsetY = 54;
    CalculateCoordinate(C, WSBIBG1, 1600.0, 53.0, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBIBG1.WidgetTexture, calW.XL, calW.YL);
    fX1 = 119.0 * ScreenRatioXEx;
    fX2 = 1480.0 * ScreenRatioXEx;
    fY1 = 67.0 * ScreenRatioYEx;
    fY2 = 94.0 * ScreenRatioYEx;
    C.DrawColor = DefaultFontColor;
    GameName = Level.GetMatchMaker().szSeverName $ " / " $ Level.GetMatchMaker().szChannelName $ " / " $ "[" $ string(Level.GetMatchMaker().My_iRoom) $ "] " $ Level.GetMatchMaker().szRoomName;
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * fX1, C.ClipY * fY1, C.ClipX * fX2, C.ClipY * fY2, int(ContentFontSize * C.ClipY), DefaultFontShadowColor);
    WSBBG3.OffsetX = 119;
    WSBBG3.OffsetY = 116;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinate(C, WSBBG3, 673.0, 300.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    // End:0x348
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        // End:0x336
        if(Level.GRI.GameClass == "WMission.wDefenceGameInfo")
        {
            DrawFFAScore(C, 213.0, 150.0);
        }
        // End:0x345
        else
        {
            DrawTeamScoreAndTimer(C, 213, 166);
        }
    }
    // End:0x35d
    else
    {
        DrawFFAScore(C, 213.0, 150.0);
    }
    DrawMissonComment(C);
}

function DrawFFAScore(Canvas C, float _iPosX, float _iPosY)
{
    local CalCoordsW calW;
    local int iGoalScore, iFourth, iThird, iSecond, iFirst, iWidth,
	    iHeight, iCount;

    local float fX1, fX2, fY1, fY2;
    local PlayerReplicationInfo currPRI1, currPRI2;

    CalculateCoordinate(C, WFFAScoreBG, 486.0, 71.0, calW);
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
    // End:0x2bb [While If]
    if(iCount < 3)
    {
        DigitsFFAGoalScore[iCount].OffsetX = int(float(default.DigitsFFAGoalScore[iCount].OffsetX) + _iPosX);
        DigitsFFAGoalScore[iCount].OffsetY = int(float(default.DigitsFFAGoalScore[iCount].OffsetY) + _iPosY);
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsFFAGoalScore[iCount], float(iWidth), float(iHeight), DigitsFFAGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
        goto J0x197;
    }
    iWidth = 13;
    iHeight = 18;
    iFourth = GetHudBaseOwner().TimeMinutes / 10;
    iThird = int(float(GetHudBaseOwner().TimeMinutes) % float(10));
    iSecond = GetHudBaseOwner().TimeSeconds / 10;
    iFirst = int(float(GetHudBaseOwner().TimeSeconds) % float(10));
    fX1 = 213.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY1 = 72.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    fX2 = 226.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY2 = 90.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iFourth) $ string(iThird) $ ":" $ string(iSecond) $ string(iFirst), 1, fX1, fY1, fX2, fY2, int(float(17) * C.ClipY * ScreenRatioYEx));
    // End:0x493
    if(PRI_Self != PRI_1st)
    {
        currPRI1 = PRI_1st;
        currPRI2 = PRI_Self;
    }
    // End:0x4a9
    else
    {
        currPRI1 = PRI_Self;
        currPRI2 = PRI_2nd;
    }
    DrawRankingInfo(C, currPRI1, _iPosX, _iPosY);
    DrawRankingInfo(C, currPRI2, _iPosX, _iPosY + float(32));
}

function DrawRankingInfo(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local Color TextColor;
    local CalCoordsW calW;

    // End:0x0d
    if(currPRI == none)
    {
        return;
    }
    // End:0xf3
    if(currPRI == PRI_Self)
    {
        WFFAScoreOverLayer.OffsetX = int(float(default.WFFAScoreOverLayer.OffsetX) + _iPosX);
        WFFAScoreOverLayer.OffsetY = int(float(default.WFFAScoreOverLayer.OffsetY) + _iPosY);
        CalculateCoordinate(C, WFFAScoreOverLayer, 375.0, 32.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WFFAScoreOverLayer.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    DrawRankingInfo_Mark(C, currPRI, _iPosX, _iPosY);
    TextColor = C.MakeColor(0, 0, 0, byte(255));
    DrawRankingInfo_Text(C, currPRI, _iPosX + float(1), _iPosY + float(1), TextColor);
    // End:0x18c
    if(currPRI == PRI_Self)
    {
        TextColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x1ab
    else
    {
        TextColor = C.MakeColor(200, 200, 160, byte(255));
    }
    DrawRankingInfo_Text(C, currPRI, _iPosX, _iPosY, TextColor);
}

function DrawRankingInfo_Mark(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local float markX1, markY1;
    local Material Mark, markClan;
    local wMatchUserInfo UserInfo;
    local int i;

    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x104
    if(UserInfo != none && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x104
        if(markClan[2] == none)
        {
            markClan[0] = texture'ex_clanmark';
        }
    }
    i = 0;
    J0x10b:
    // End:0x255 [While If]
    if(i < 3)
    {
        // End:0x24b
        if(markClan[i] != none)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            markX1 = 161.0 + _iPosX * ScreenRatioXEx * C.ClipX;
            markY1 = 4.0 + _iPosY * ScreenRatioYEx * C.ClipY;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], 32.0 * ScreenRatioXEx * C.ClipX, 32.0 * ScreenRatioYEx * C.ClipY, 0.0, 0.0, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x10b;
    }
    // End:0x278
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x3c8
    if(Mark != none)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        markX1 = 195.0 + _iPosX * ScreenRatioXEx * C.ClipX;
        markY1 = 4.0 + _iPosY * ScreenRatioYEx * C.ClipY;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, 32.0 * ScreenRatioXEx * C.ClipX, 32.0 * ScreenRatioYEx * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
}

function DrawRankingInfo_Text(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY, Color FontColor)
{
    local int iRanking, iScore, iFontSize;
    local float fX1, fX2, fY1, fY2;

    C.DrawColor = FontColor;
    iFontSize = int(float(15) * C.ClipY * ScreenRatioYEx);
    // End:0x50
    if(currPRI == PRI_1st)
    {
        iRanking = 1;
    }
    // End:0x75
    else
    {
        // End:0x6a
        if(currPRI == PRI_2nd)
        {
            iRanking = 2;
        }
        // End:0x75
        else
        {
            iRanking = Ranking_Self;
        }
    }
    fX1 = 110.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY1 = 10.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    fX2 = 120.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY2 = 29.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iRanking), 1, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = 126.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY1 = 10.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    fX2 = 145.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY2 = 29.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(Ranking, 1, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = 249.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY1 = 10.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    fX2 = 406.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY2 = 29.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(currPRI.PlayerName, 0, fX1, fY1, fX2, fY2, iFontSize);
    iScore = int(currPRI.Score);
    fX1 = 419.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY1 = 10.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    fX2 = 429.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY2 = 29.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScore), 1, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = 457.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY1 = 10.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    fX2 = 476.0 + _iPosX * C.ClipX * ScreenRatioXEx;
    fY2 = 29.0 + _iPosY * C.ClipY * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(Score_1, 1, fX1, fY1, fX2, fY2, iFontSize);
}

function DrawTeamScoreAndTimer(Canvas C, int _iPosX, int _iPosY)
{
    local CalCoordsW calW;
    local int iScoreAF, iScoreRSA, iGoalScore, iFourth, iThird, iSecond,
	    iFirst, iWidth, iHeight, iCount, iTeamIndex;

    local float fX1, fX2, fY1, fY2;

    // End:0x77
    if(HudOwner.PlayerOwner.PlayerReplicationInfo != none && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none)
    {
        iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0x7e
    else
    {
        iTeamIndex = 0;
    }
    CalculateCoordinate(C, WTeamScoreBG, 486.0, 40.0, calW);
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
    // End:0x36e [While If]
    if(iCount < 4)
    {
        DigitsGoalScore[iCount].OffsetX = default.DigitsGoalScore[iCount].OffsetX + _iPosX;
        DigitsGoalScore[iCount].OffsetY = default.DigitsGoalScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsGoalScore[iCount], float(iWidth), float(iHeight), DigitsGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
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
    // End:0x52e
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x535:
    // End:0x651 [While If]
    if(iCount < 4)
    {
        DigitsAFScore[iCount].OffsetX = default.DigitsAFScore[iCount].OffsetX + _iPosX;
        DigitsAFScore[iCount].OffsetY = default.DigitsAFScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsAFScore[iCount], float(iWidth), float(iHeight), DigitsAFScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
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
    // End:0x7ad
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x7b4:
    // End:0x8d0 [While If]
    if(iCount < 4)
    {
        DigitsRSAScore[iCount].OffsetX = default.DigitsRSAScore[iCount].OffsetX + _iPosX;
        DigitsRSAScore[iCount].OffsetY = default.DigitsRSAScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigit(C, WDigitsNumberMid, DigitsRSAScore[iCount], float(iWidth), float(iHeight), DigitsRSAScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
        goto J0x7b4;
    }
    iWidth = 13;
    iHeight = 18;
    iFourth = GetHudBaseOwner().TimeMinutes / 10;
    iThird = int(float(GetHudBaseOwner().TimeMinutes) % float(10));
    iSecond = GetHudBaseOwner().TimeSeconds / 10;
    iFirst = int(float(GetHudBaseOwner().TimeSeconds) % float(10));
    fX1 = 213.0 + float(_iPosX) * C.ClipX * ScreenRatioXEx;
    fY1 = 42.0 + float(_iPosY) * C.ClipY * ScreenRatioYEx;
    fX2 = 226.0 + float(_iPosX) * C.ClipX * ScreenRatioXEx;
    fY2 = 60.0 + float(_iPosY) * C.ClipY * ScreenRatioYEx;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iFourth) $ string(iThird) $ ":" $ string(iSecond) $ string(iFirst), 1, fX1, fY1, fX2, fY2, int(float(17) * C.ClipY * ScreenRatioYEx));
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
            // End:0x10b
            break;
        // End:0x6d
        case kMM.2:
            limitWeapon = WeaponLimitPistolOnly;
            bLimitWeapon = true;
            // End:0x10b
            break;
        // End:0x91
        case kMM.3:
            limitWeapon = WeaponLimitGrenadeOnly;
            bLimitWeapon = true;
            // End:0x10b
            break;
        // End:0xb5
        case kMM.4:
            limitWeapon = WeaponLimitRPGOnly;
            bLimitWeapon = true;
            // End:0x10b
            break;
        // End:0xd9
        case kMM.5:
            limitWeapon = WeaponLimitSROnly;
            bLimitWeapon = true;
            // End:0x10b
            break;
        // End:0xfd
        case kMM.6:
            limitWeapon = WeaponLimitSRBan;
            bLimitWeapon = true;
            // End:0x10b
            break;
        // End:0xffff
        default:
            bLimitWeapon = false;
            // End:0x10b Break;
            break;
    }
    // End:0x136
    if(bLimitWeapon)
    {
        MissionInfo = GetStringPlayMode() $ "( " $ limitWeapon $ " )";
    }
    // End:0x142
    else
    {
        MissionInfo = GetStringPlayMode();
    }
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
            // End:0x90
            else
            {
                // End:0x85
                if(kMM.BotTutorial)
                {
                    PlayMode = MissionNameTM;
                }
                // End:0x90
                else
                {
                    PlayMode = MissionNameTD;
                }
            }
            // End:0x185
            break;
        // End:0xbb
        case "WMission.wDOMGameInfo":
            PlayMode = MissionNameDOMI;
            // End:0x185
            break;
        // End:0xe2
        case "WMission.wSDGameInfo":
            PlayMode = MissionNameSD;
            // End:0x185
            break;
        // End:0x10a
        case "WMission.wSBTGameInfo":
            PlayMode = MissionNameSBT;
            // End:0x185
            break;
        // End:0x12e
        case "WGame.wDeathMatch":
            PlayMode = MissionNameDM;
            // End:0x185
            break;
        // End:0x15a
        case "WMission.wDefenceGameInfo":
            PlayMode = MissionNameDF;
            // End:0x185
            break;
        // End:0x182
        case "WMission.wDOAGameInfo":
            PlayMode = MissionNameDOA;
            // End:0x185
            break;
        // End:0xffff
        default:
            return PlayMode;
    }
}

function DrawMissonComment(Canvas C)
{
    local CalCoordsW calW;
    local float fX1, fX2, fY1, fY2, fFontSize;

    local wMatchMaker kMM;

    kMM = Level.GetMatchMaker();
    WSBBGPanel.OffsetX = 129;
    WSBBGPanel.OffsetY = 255;
    CalculateCoordinate(C, WSBBGPanel, 653.0, 151.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBGPanel.WidgetTexture, calW.XL, calW.YL);
    fX1 = 170.0 * C.ClipX * ScreenRatioXEx;
    fY1 = 274.0 * C.ClipY * ScreenRatioYEx;
    fX2 = 740.0 * C.ClipX * ScreenRatioXEx;
    fY2 = 302.0 * C.ClipY * ScreenRatioYEx;
    fFontSize = 21.0 * ScreenRatioYEx;
    SetMissionInfo();
    switch(Level.GRI.GameClass)
    {
        // End:0x2d4
        case "WGame.wTeamGame":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            // End:0x22c
            if(11 == kMM.kGame_GameMode)
            {
                MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentFM1);
                MissonComment(C, 170.0, 360.0, 740.0, 381.0, MissionCommentFM2);
            }
            // End:0x2d1
            else
            {
                // End:0x289
                if(kMM.BotTutorial)
                {
                    MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentTM1);
                    MissonComment(C, 170.0, 360.0, 740.0, 381.0, MissionCommentTM2);
                }
                // End:0x2d1
                else
                {
                    MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentTD1);
                    MissonComment(C, 170.0, 360.0, 740.0, 381.0, MissionCommentTD2);
                }
            }
            // End:0x6ea
            break;
        // End:0x39a
        case "WMission.wDOMGameInfo":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentDOMI1);
            MissonComment(C, 170.0, 360.0, 740.0, 381.0, MissionCommentDOMI2);
            // End:0x6ea
            break;
        // End:0x4dd
        case "WMission.wSDGameInfo":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            // End:0x492
            if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == AttackingTeam)
            {
                MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentSDA1);
                MissonComment(C, 170.0, 360.0, 740.0, 381.0, MissionCommentSDA2);
            }
            // End:0x4da
            else
            {
                MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentSDD1);
                MissonComment(C, 170.0, 360.0, 740.0, 381.0, MissionCommentSDD2);
            }
            // End:0x6ea
            break;
        // End:0x5a3
        case "WMission.wSBTGameInfo":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentSBT1);
            MissonComment(C, 170.0, 360.0, 740.0, 381.0, MissionCommentSBT2);
            // End:0x6ea
            break;
        // End:0x641
        case "WGame.wDeathMatch":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentDM1);
            // End:0x6ea
            break;
        // End:0x6e7
        case "WMission.wDefenceGameInfo":
            C.SetDrawColor(byte(255), 150, 0, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
            MissonComment(C, 170.0, 320.0, 740.0, 341.0, MissionCommentDF1);
            // End:0x6ea
            break;
        // End:0xffff
        default:
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
    return "" $ string(iFourth) $ string(iThird) $ string(iSecond) $ string(iFirst);
}

function MissonComment(Canvas C, float X1, float Y1, float X2, float Y2, string MN)
{
    local float fX1, fX2, fY1, fY2, fFontSize;

    fFontSize = 16.0 * ScreenRatioYEx;
    C.DrawColor = DefaultFontColor;
    fX1 = X1 * C.ClipX * ScreenRatioXEx;
    fY1 = Y1 * C.ClipY * ScreenRatioYEx;
    fX2 = X2 * C.ClipX * ScreenRatioXEx;
    fY2 = Y2 * C.ClipY * ScreenRatioYEx;
    C.BtrDrawTextJustifiedWithVolumeLine(MN, 1, fX1, fY1, fX2, fY2, int(fFontSize * C.ClipY), DefaultFontShadowColor);
}

function DrawMapName(Canvas C)
{
    local CalCoordsW calW;
    local float FontSize;

    WSBBG3.OffsetX = 119;
    WSBBG3.OffsetY = 424;
    CalculateCoordinate(C, WSBBG3, 673.0, 52.0, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    FontSize = fMapNameFontsize * C.ClipY;
    C.SetDrawColor(byte(255), 150, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(mapInfo.FriendlyName, 1, C.ClipX * fMapNameX1, C.ClipY * fMapNameY1, C.ClipX * fMapNameX2, C.ClipY * fMapNameY2, int(FontSize), DefaultFontShadowColor);
}

function DrawMap(Canvas C)
{
    local CalCoordsW calW;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WSBBG3.OffsetX = 461;
    WSBBG3.OffsetY = 230;
    CalculateCoordinate(C, WSBBG3, 678.0, 678.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    // End:0xe3
    if(PartMinimap.HudOwner == none)
    {
        PartMinimap.Initialize(GetHudBaseOwner(), GetHudBaseOwner().Level);
    }
    PartMinimap.Draw(C);
    PartMinimap.DrawMinimap_CombatSituation(C);
}

function DrawTeamBG(Canvas C)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x5c
    if(Level.GRI.GameClass == "WGame.wDeathMatch")
    {
        DrawTeamListBG_FFA(C);
    }
    // End:0x67
    else
    {
        DrawTeamListBG_Mission(C);
    }
}

function DrawTeamListBG_FFA(Canvas C)
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
    WFFABG.OffsetX = 467;
    WFFABG.OffsetY = 280;
    CalculateCoordinate(C, WFFABG, 667.0, 47.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WFFABG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawTeamListBG_Tut(Canvas C)
{
    local CalCoordsW calW;
    local string GameName;

    CalculateCoordinate(C, ScoreBoardTitleBG, 671.0, 77.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(ScoreBoardTitleBG.WidgetTexture, calW.XL, calW.YL);
    SetMissionInfo();
    C.SetDrawColor(byte(255), 192, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, C.ClipX * 0.2918750, C.ClipY * 0.090, C.ClipX * 0.708750, C.ClipY * 0.109160, int(0.015830 * C.ClipY), DefaultFontShadowColor);
    GameName = Level.GetMatchMaker().szSeverName $ " / " $ Level.GetMatchMaker().szChannelName $ " / " $ "[" $ string(Level.GetMatchMaker().My_iRoom) $ "] " $ Level.GetMatchMaker().szRoomName;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * 0.2918750, C.ClipY * 0.115830, C.ClipX * 0.708750, C.ClipY * 0.131660, int(0.01250 * C.ClipY), DefaultFontShadowColor);
    WSBBG3.OffsetX = 465;
    WSBBG3.OffsetY = 176;
    CalculateCoordinate(C, WSBBG3, 671.0, 960.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WFFABG.OffsetX = 467;
    WFFABG.OffsetY = 178;
    CalculateCoordinate(C, WFFABG, 667.0, 47.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WFFABG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawTeamListBG_Mission(Canvas C)
{
    local CalCoordsW calW;
    local string GameName;

    ScoreBoardTitleBG.OffsetX = 465;
    ScoreBoardTitleBG.OffsetY = 93;
    CalculateCoordinate(C, ScoreBoardTitleBG, 671.0, 77.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(ScoreBoardTitleBG.WidgetTexture, calW.XL, calW.YL);
    SetMissionInfo();
    C.SetDrawColor(byte(255), 192, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MissionInfo, 1, C.ClipX * 0.2918750, C.ClipY * 0.090, C.ClipX * 0.708750, C.ClipY * 0.109160, int(0.015830 * C.ClipY), DefaultFontShadowColor);
    GameName = Level.GetMatchMaker().szSeverName $ " / " $ Level.GetMatchMaker().szChannelName $ " / " $ "[" $ string(Level.GetMatchMaker().My_iRoom) $ "] " $ Level.GetMatchMaker().szRoomName;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(GameName, 1, C.ClipX * 0.2918750, C.ClipY * 0.115830, C.ClipX * 0.708750, C.ClipY * 0.131660, int(0.01250 * C.ClipY), DefaultFontShadowColor);
    WSBBG3.OffsetX = 465;
    WSBBG3.OffsetY = 176;
    CalculateCoordinate(C, WSBBG3, 671.0, 482.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WTeamAF.OffsetX = default.WTeamAF.OffsetX;
    WTeamAF.OffsetY = default.WTeamAF.OffsetY;
    CalculateCoordinate(C, WTeamAF, 669.0, 48.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamAF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WSBBG3.OffsetX = 465;
    WSBBG3.OffsetY = 664;
    CalculateCoordinate(C, WSBBG3, 671.0, 482.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTilePartialStretched(WSBBG3.WidgetTexture, calW.XL, calW.YL);
    WTeamRSA.OffsetX = default.WTeamRSA.OffsetX;
    WTeamRSA.OffsetY = default.WTeamRSA.OffsetY;
    CalculateCoordinate(C, WTeamRSA, 669.0, 48.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamRSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

simulated event DrawGMUserBoard(Canvas C)
{
    local int lpPRI, memberCount;
    local PlayerReplicationInfo currPRI;
    local float beginX;

    super(ScoreBoard).DrawGMUserBoard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x27c
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        memberCount = 0;
        beginX = 0.031250;
        lpPRI = 0;
        J0x81:
        // End:0x172 [While If]
        if(lpPRI < GRI.PRIArray.Length)
        {
            currPRI = GRI.PRIArray[lpPRI];
            // End:0xd8
            if(currPRI == none || currPRI.Team == none)
            {
            }
            // End:0x168
            else
            {
                // End:0xed
                if(currPRI.bAdminSpecator)
                {
                }
                // End:0x168
                else
                {
                    // End:0x104
                    if(!currPRI.IsConnected)
                    {
                    }
                    // End:0x168
                    else
                    {
                        // End:0x168
                        if(currPRI.Team.TeamIndex == 0)
                        {
                            DrawGMTeamListSection(C, 0, currPRI, memberCount, beginX * C.ClipX, 0.3208330 * C.ClipY);
                            ++ memberCount;
                        }
                    }
                }
            }
            ++ lpPRI;
            // This is an implied JumpToken; Continue!
            goto J0x81;
        }
        memberCount = 0;
        beginX = 0.808750;
        lpPRI = 0;
        J0x18b:
        // End:0x27c [While If]
        if(lpPRI < GRI.PRIArray.Length)
        {
            currPRI = GRI.PRIArray[lpPRI];
            // End:0x1e2
            if(currPRI == none || currPRI.Team == none)
            {
            }
            // End:0x272
            else
            {
                // End:0x1f7
                if(currPRI.bAdminSpecator)
                {
                }
                // End:0x272
                else
                {
                    // End:0x20e
                    if(!currPRI.IsConnected)
                    {
                    }
                    // End:0x272
                    else
                    {
                        // End:0x272
                        if(currPRI.Team.TeamIndex == 1)
                        {
                            DrawGMTeamListSection(C, 1, currPRI, memberCount, beginX * C.ClipX, 0.3208330 * C.ClipY);
                            ++ memberCount;
                        }
                    }
                }
            }
            ++ lpPRI;
            // This is an implied JumpToken; Continue!
            goto J0x18b;
        }
    }
}

function DrawGMTeamListSection(Canvas C, int lpTeam, PlayerReplicationInfo currPRI, int memberCount, float beginX, float beginY)
{
    local int FontSize;
    local float NickX, EndX, Y1, Y2;
    local CalCoordsW calW;
    local Material Mark;
    local float classMarkWidth, BarHeight, HPSize;
    local string strTemp;
    local bool Dead;

    classMarkWidth = 0.028750 * C.ClipX;
    BarHeight = 0.040 * C.ClipY;
    FontSize = int(TeamListMemberFontSize * C.ClipY);
    Y1 = beginY + float(memberCount) * BarHeight;
    Y2 = beginY + float(memberCount) * BarHeight + BarHeight;
    NickX = beginX + classMarkWidth;
    EndX = beginX + 0.160 * C.ClipX;
    CalculateCoordinate(C, wGM_TeamMark_AF, 256.0, 51.0, calW);
    C.SetPos(0.031250 * C.ClipX, 0.2766670 * C.ClipY);
    C.DrawTile(wGM_TeamMark_AF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinate(C, wGM_TeamMark_RSA, 256.0, 51.0, calW);
    C.SetPos(0.808750 * C.ClipX, 0.2766670 * C.ClipY);
    C.DrawTile(wGM_TeamMark_RSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinate(C, wGM_Playlist_BG, 256.0, 48.0, calW);
    C.SetPos(beginX, Y1);
    C.DrawTile(wGM_Playlist_BG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x3a0
    if(HudOwner.SpecPlayerName == currPRI.PlayerName)
    {
        CalculateCoordinate(C, wGM_ViewTarget, 310.0, 48.0, calW);
        // End:0x322
        if(lpTeam == 0)
        {
            C.SetPos(0.0031250 * C.ClipX, Y1);
        }
        // End:0x34b
        else
        {
            C.SetPos(0.7806250 * C.ClipX, Y1);
        }
        C.DrawTile(wGM_ViewTarget.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x3c3
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x493
    if(Mark != none)
    {
        C.SetPos(beginX + 0.0006250 * C.ClipX, Y1 + 0.0016660 * C.ClipY);
        C.DrawTile(Mark, classMarkWidth, BarHeight, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    Dead = currPRI.IsDead && Level.GRI.GameClass != "WMission.wSDGameInfo" || Level.GRI.RoundState == 2;
    // End:0x52c
    if(Dead)
    {
        C.DrawColor = DeadFontColor;
        HPSize = 0.10;
    }
    // End:0x55e
    else
    {
        C.DrawColor = DefaultFontColor;
        HPSize = float(currPRI.PlayerHealth * 207 / 100);
    }
    CalculateCoordinate(C, wGM_Players_HP, HPSize, 46.0, calW);
    C.SetPos(NickX + 0.0006250 * C.ClipX, Y1 + 0.0016660 * C.ClipY);
    C.DrawTile(wGM_Players_HP.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    strTemp = GetEllipsString(C, currPRI.PlayerName, 1111.0 - float(934) / 1600.0 * C.ClipX, float(FontSize));
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, NickX + 0.00250 * C.ClipX, Y1, EndX, Y2, FontSize, DefaultFontShadowColor);
}

simulated event DrawScoreboard(Canvas C)
{
    super(ScoreBoard).DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawTeamBG(C);
    // End:0x9d
    if(Level.GRI.GameClass == "WGame.wDeathMatch")
    {
        DrawContentDescription(C, 0.0, 0.0);
        DrawTeamListSectionStripe(C, 414.0, 8);
    }
    // End:0xeb
    else
    {
        DrawContentDescriptionTeam(C, 0.0, 0.0);
        DrawContentDescriptionTeam(C, 0.0, 488.0);
        DrawTeamListSectionStripe(C, 311.0, 8);
        DrawTeamListSectionStripe(C, 799.0, 8);
    }
    DrawTeamListSection(C);
}

simulated event DrawMiniMap(Canvas C)
{
    DrawScoreboard(C);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    DrawMap(C);
}

simulated function UpdateScoreBoard(Canvas Canvas)
{
    super(ScoreBoard).UpdateScoreBoard(Canvas);
    GetHudBaseOwner().DoUpdateTime();
}

defaultproperties
{
    SpBG=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.score_board_1_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=821,Y2=694),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=98,OffsetY=33,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Sp2TeamNameSection=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_b_2team',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=161,Y2=24),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Sp3TeamNameSection=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_b_3team',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=107,Y2=24),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpTeamNameEmphasis=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.sc_bo_oran',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=179,Y2=27),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpTeamList=(WidgetTexture=Texture'Warfare_UI.HUD_Scoreboard.score_board_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=465,Y2=272),TextureScale=0.63630,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=443,OffsetY=43,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpSelectLine=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_myinfo_bar',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=667,Y2=48),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    MapImage=(WidgetTexture=Texture'Warfare_UI.HUD_MinimapBG.repair',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=511,Y2=511),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=5,OffsetY=23,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    wGM_Playlist_BG=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmmode_playerlist_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=48),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wGM_Players_HP=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmmode_players_hp',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=207,Y2=46),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wGM_TeamMark_AF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmmode_teammark_all',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=256,Y2=51),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wGM_TeamMark_RSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmmode_teammark_all',RenderStyle=5,TextureCoords=(X1=256,Y1=0,X2=512,Y2=51),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wGM_ViewTarget=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmmode_mark_observeredplayer',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=310,Y2=48),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    IndicateDeads=true
    DefaultFontColor=(R=255,G=255,B=255,A=220)
    DeadFontColor=(R=128,G=128,B=128,A=255)
    DefaultFontShadowColor=(R=0,G=0,B=0,A=220)
    FriendlyColor=(R=124,G=241,B=126,A=255)
    MyselfColor=(R=255,G=153,B=0,A=255)
    BGBeginX=0.0957030
    BGBeginY=0.0429690
    BGWidth=0.8017580
    BGHeight=0.9036460
    TeamListBeginX=0.5050
    TeamListBeginY=0.1770830
    TeamListOffsetY=0.43750
    TeamListWidth=0.4181250
    TeamListHeight=0.3528650
    TeamListTeamNameBeginX=0.4521480
    TeamListTeamNameBeginY=0.0416670
    TeamListTeamNameWidth=0.1269530
    TeamListTeamNameHeight=0.0191670
    TeamListTeamNameFontSize=0.010
    TeamListMemberNicknameBeginX=0.583750
    TeamListMemberNicknameWidth=0.10
    TeamListMemberScoreBeginX=0.7268750
    TeamListMemberScoreWidth=0.0331250
    TeamListMemberKillBeginX=0.768750
    TeamListMemberKillWidth=0.018750
    TeamListMemberAssistBeginX=0.796250
    TeamListMemberAssistWidth=0.0456250
    TeamListMemberDeathBeginX=0.8506250
    TeamListMemberDeathWidth=0.0306250
    TeamListMemberPingBeginX=0.8808590
    TeamListMemberPingWidth=0.0361330
    TeamListMemberBeginY=0.1816670
    TeamListMemberHeight=0.0191670
    TeamListMemberHeightOffset=0.0441670
    TeamListMemberFontSize=0.0150
    TeamNameEmphasisBeginX=0.43750
    TeamNameEmphasisBeginY=0.0585940
    TeamNameEmphasisOffsetY=0.3671880
    TeamNameEmphasisWidth=0.1748050
    TeamNameEmphasisHeight=0.0351560
    TeamNameSectionBeginX=0.1064450
    TeamNameSectionBeginY=0.0650
    TeamNameSectionEndY=0.0883330
    TeamNameSectionTeam2OffsetX=0.1582030
    TeamNameSectionTeam2Width=0.1572270
    TeamNameSectionTeam2Height=0.031250
    TeamNameSectionTeam3OffsetX=0.1054690
    TeamNameSectionTeam3Width=0.1044920
    TeamNameSectionTeam3Height=0.031250
    TeamNameFontSize=0.0116670
    TeamScoreSectionBeginY=0.1380210
    TeamScoreSectionEndY=0.1718750
    TeamScoreFontSize=0.01830
    GameClassBeginX=0.1025390
    GameClassBeginY=0.3229170
    GameClassEndX=0.4160160
    GameClassEndY=0.3541670
    GameClassFontSize=0.018230
    GameDescriptionBeginX=0.1025390
    GameDescriptionBeginY=0.3619790
    GameDescriptionEndX=0.4160160
    GameDescriptionEndY=0.3854170
    GameDescriptionFontSize=0.0143230
    MapNameBeginX=0.1103520
    MapNameBeginY=0.4010420
    MapNameEndX=0.4179690
    MapNameEndY=0.4257810
    MapNameFontSize=0.0150
    MapNameFontColor=(R=128,G=128,B=128,A=220)
    MapImageBeginX=0.1074220
    MapImageBeginY=0.4335940
    MapImageEndX=0.4189450
    MapImageEndY=0.8489580
    TimeX1=0.1074220
    TimeY1=0.1354170
    TimeX2=0.4218750
    TimeY2=0.093750
    TimeColor=(R=255,G=255,B=255,A=255)
    TimeFontSize=0.018230
    fMapNameX1=0.106250
    fMapNameX2=0.46250
    fMapNameY1=0.36250
    fMapNameY2=0.3866670
    fMapNameFontsize=0.01750
    MissionNameTD="Team Deathmatch"
    MissionNameSD="Search & Destroy"
    MissionNameDOMI="Domination"
    MissionNameSBT="Demolition"
    MissionNameDM="Free-For-All"
    MissionNameFM="Rookie Mission"
    MissionNameTM="Tutorial"
    MissionCommentTD1="The team that defeats all enemies or"
    MissionCommentTD2="reaches the Goal Score first wins the battle."
    MissionCommentSDA1="Plant a bomb at the target (A or B) and destroy it to win the round."
    MissionCommentSDA2="The team which wins the round and reaches the Goal Score first wins the battle."
    MissionCommentSDD1="Stop the target (A or B) from being destroyed by an enemy bomb to win the round."
    MissionCommentSDD2="The team which wins the round and reaches the Goal Score first wins the battle."
    MissionCommentDOMI1="The team which captures the flag to"
    MissionCommentDOMI2="reaches the Goal Score first wins the battle."
    MissionCommentSBT1="Search for a bomb to plant on the target and destroy it to win the round."
    MissionCommentSBT2="The team which wins the round and reaches the Goal Score first wins the battle."
    MissionCommentDM1="The player who defeats enough enemies to"
    MissionCommentDM2="reach the Goal Score first wins the battle."
    MissionCommentFM1="The team which defeats enough enemies"
    MissionCommentFM2="to reach the Goal Score first wins the battle."
    MissionCommentTM1="Follow the tutorial to complete the mission."
    StrLoading="Loading"
    WeaponLimitKnifeOnly="Knife Battle"
    WeaponLimitRPGOnly="Rocket Launcher Battle"
    WeaponLimitSROnly="Sniper Battle"
    WeaponLimitSRBan="No Sniper"
    WSBIBG1=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=54,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBIBG2=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=8),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBG2=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=8),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBG3=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_black_listmenu_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=465,OffsetY=176,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSBBGPanel=(WidgetTexture=Texture'Warfare_GP_UI_UI.Common.panel_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=16,Y2=16),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=129,OffsetY=255,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_teammark_all',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=667,Y2=47),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=467,OffsetY=178,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_teammark_all',RenderStyle=5,TextureCoords=(X1=0,Y1=47,X2=667,Y2=94),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=467,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDivid=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_list_divid_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=3,Y2=19),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=864,OffsetY=176,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WContentBG=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_black_listmenu_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=467,OffsetY=225,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WListDivedBar=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.list_scoreboard_boardline',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=667,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WIconMaster=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.icon_mstr_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=46,Y2=46),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WIconDeath=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.icon_death',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=46,Y2=46),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WPingBack=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_ping_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=25,Y2=25),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WPing=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_ping_status',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=17,Y2=17),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDigitsNumberMid=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number3',TextureCoords=(X1=315,Y1=0,X2=349,Y2=28),TextureCoords[1]=(X1=0,Y1=0,X2=34,Y2=28),TextureCoords[2]=(X1=35,Y1=0,X2=69,Y2=28),TextureCoords[3]=(X1=70,Y1=0,X2=104,Y2=28),TextureCoords[4]=(X1=105,Y1=0,X2=139,Y2=28),TextureCoords[5]=(X1=140,Y1=0,X2=174,Y2=28),TextureCoords[6]=(X1=175,Y1=0,X2=209,Y2=28),TextureCoords[7]=(X1=210,Y1=0,X2=244,Y2=28),TextureCoords[8]=(X1=245,Y1=0,X2=279,Y2=28),TextureCoords[9]=(X1=280,Y1=0,X2=314,Y2=28),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WTeamScoreBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_score',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=486,Y2=40),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=213,OffsetY=166,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFABG=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_teammark_all',RenderStyle=5,TextureCoords=(X1=0,Y1=94,X2=667,Y2=141),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=467,OffsetY=280,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_score_0',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=486,Y2=71),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=213,OffsetY=150,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreOverLayer=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_score_0_sel',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=375,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=107,OffsetY=4,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsAFScore=// Object reference not set to an instance of an object.
    
    DigitsRSAScore=// Object reference not set to an instance of an object.
    
    DigitsGoalScore=// Object reference not set to an instance of an object.
    
    DigitsFFAGoalScore=// Object reference not set to an instance of an object.
    
    DigitsTime=// Object reference not set to an instance of an object.
    
    WCompareSign=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',RenderStyle=5,TextureCoords=(X1=297,Y1=0,X2=344,Y2=31),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=346,OffsetY=38,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ScoreBoardTitleBG=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_blackstroke_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=465,OffsetY=93,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDEFTITLE=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_scoreboard_teammark_all',RenderStyle=5,TextureCoords=(X1=0,Y1=188,X2=667,Y2=235),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=467,OffsetY=280,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    fContentBeginY=0.1450
    fContentEndY=0.1633330
    fClanX1=0.5093750
    fClanX2=0.536250
    fRankX1=0.5450
    fRankX2=0.5693750
    fNickNameX1=0.5781250
    fNickNameX2=0.7181250
    fScoreX1=0.7268750
    fScoreX2=0.760
    fKillX1=0.768750
    fKillX2=0.78750
    fDeathX1=0.8506250
    fDeathX2=0.881250
    fAssistX1=0.796250
    fAssistX2=0.8418750
    fPingX1=0.883750
    fPingX2=0.9206250
    fTeamScoreX1=0.80750
    fTeamScoreX2=0.851250
    ContentFontSize=0.01250
    ContentFontColor=(R=255,G=255,B=255,A=255)
}