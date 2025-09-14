/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_LadderLoading.uc
 * Package Imports:
 *	GUI2K4
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:9
 *
 *******************************************************************************/
class UT2K4SP_LadderLoading extends UT2K4LoadingPageBase
    transient;

var UT2K4GameProfile GP;
var UT2K4MatchInfo MI;
var UnrealTeamInfo ETI;
var array<PlayerRecord> PlayerList;
var Material MapScreenshot;
var Material ImageFrame;
var int NumTeamMates;
var Material LeaderFrame;
var Material CharFrame;
var Material MysteryPlayer;
var Color White;
var Color Yellow;
var Color Blue;
var Color Red;
var localized string LoadingMessage;
var localized string StatNames[5];
var array<string> TeamPlayers;
var array<string> EnemyPlayers;

simulated event Init()
{
    local class<UnrealTeamInfo> ETIclass;

    GP = UT2K4GameProfile(Level.Game.CurrentGameProfile);
    // End:0x63
    if(GP != none)
    {
        MI = UT2K4MatchInfo(GP.GetMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung));
    }
    // End:0xa3
    if(GP == none || MI == none)
    {
        Warn("GP ==" @ string(GP) @ ", MI ==" @ string(MI));
        return;
    }
    MapScreenshot = Material(DynamicLoadObject(GP.ActiveMap.ScreenshotRef, class'Material', true));
    // End:0xfd
    if(MaterialSequence(MapScreenshot) != none)
    {
        MapScreenshot = MaterialSequence(MapScreenshot).SequenceItems[0].Material;
    }
    AddBackground();
    AddMatchInfo();
    ETIclass = class<UnrealTeamInfo>(DynamicLoadObject(GP.EnemyTeam, class'Class'));
    ETI = Spawn(ETIclass);
    // End:0x174
    if(ETI == none)
    {
        Warn("ETI ==" @ string(ETI) @ string(ETIclass) @ GP.EnemyTeam);
        return;
    }
    NumTeamMates = GP.GetNumTeammatesForMatch();
    // End:0x1c5
    if(UT2K4DMRoster(ETI) != none)
    {
        UT2K4DMRoster(ETI).PreInitialize(MI.NumBots - NumTeamMates);
    }
    // End:0x1e9
    else
    {
        ETI.Initialize(MI.NumBots - NumTeamMates);
    }
    class'wUtil'.static.GetPlayerList(PlayerList);
    // End:0x20e
    if(NumTeamMates == 0)
    {
        AddPlayerCircle();
    }
    // End:0x220
    else
    {
        AddTeamInfo();
        AddEnemyInfo();
        AddTeamCompare();
    }
}

simulated function AddBackground()
{
    local Material BG;

    BG = MapScreenshot;
}

simulated function AddMatchInfo()
{
    local string Title;
    local DrawOpText tmp;

    AddImage(ImageFrame, 0.340, 0.2990, 0.320, 0.4020);
    AddImage(MapScreenshot, 0.350, 0.30, 0.30, 0.40);
    // End:0x6a
    if(MI.MenuName != "")
    {
        Title = MI.MenuName;
    }
    // End:0xb9
    else
    {
        // End:0xa0
        if(GP.ActiveMap.FriendlyName != "")
        {
            Title = GP.ActiveMap.FriendlyName;
        }
        // End:0xb9
        else
        {
            Title = GP.ActiveMap.MapName;
        }
    }
    tmp = AddJustifiedText(Title, 1, 0.5720, 0.3020, 0.10, 0.40, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = class'Canvas'.static.MakeColor(0, 0, 0, 196);
    tmp.bWrapText = false;
    tmp = AddJustifiedText(Title, 1, 0.570, 0.30, 0.10, 0.40, 1);
    tmp.bWrapText = false;
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp = AddJustifiedText(GP.GetMatchDescription(), 1, 0.3320, 0.3020, 0.10, 0.40, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = class'Canvas'.static.MakeColor(0, 0, 0, 196);
    tmp.bWrapText = false;
    tmp = AddJustifiedText(GP.GetMatchDescription(), 1, 0.330, 0.30, 0.10, 0.40, 1);
    tmp.bWrapText = false;
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp = AddJustifiedText(LoadingMessage, 1, 0.4520, 0.3020, 0.10, 0.40, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = class'Canvas'.static.MakeColor(0, 0, 0, 64);
    tmp.bWrapText = false;
    tmp = AddJustifiedText(LoadingMessage, 1, 0.4520, 0.30, 0.10, 0.40, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 196);
    tmp.bWrapText = false;
}

simulated function AddPlayerCircle()
{
    local int i;
    local float dist, cX, cY, cR, imgW, imgH,
	    bX, bY, ox, oy;

    local Material Portrait;

    dist = 2.0 * 3.1415930 / float(MI.NumBots + 1);
    cX = 0.50;
    cY = 0.50;
    cR = 0.030;
    imgW = 0.110;
    imgH = 0.30;
    bX = imgH / float(2) + cR;
    bY = imgW / float(2) + cR * float(4 / 3);
    Portrait = getPlayerPortrait(GP.PlayerCharacter);
    AddImage(Portrait, cR, cY - imgW / float(2), imgH, imgW);
    AddImage(CharFrame, cR, cY - imgW / float(2), imgH, imgW);
    i = 0;
    J0x111:
    // End:0x2a7 [While If]
    if(i < MI.NumBots)
    {
        // End:0x150
        if(i > ETI.Roster.Length)
        {
            Portrait = MysteryPlayer;
        }
        // End:0x179
        else
        {
            Portrait = getPlayerPortrait(ETI.Roster[i].PlayerName);
        }
        ox = Sin(-1.0 * float(i + 1) * dist + 3.1415930 / float(2));
        ox = FClamp(cX - ox, 0.0 + bX, 1.0 - bX);
        oy = Cos(-1.0 * float(i + 1) * dist + 3.1415930 / float(2));
        oy = FClamp(cY - oy, 0.0 + bY, 1.0 - bY);
        AddImage(Portrait, ox - imgH / float(2), oy - imgW / float(2), imgH, imgW);
        AddImage(CharFrame, ox - imgH / float(2), oy - imgW / float(2), imgH, imgW);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x111;
    }
}

simulated function AddTeamInfo()
{
    local int i, NumPlayers;

    TeamPlayers[0] = GP.PlayerCharacter;
    NumPlayers = MI.NumBots / 2;
    i = 0;
    J0x35:
    // End:0x80 [While If]
    if(i < NumPlayers)
    {
        TeamPlayers[i + 1] = GP.PlayerTeam[GP.PlayerLineup[i]];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    AddTeamBar(0, GP.TeamSymbolName, TeamPlayers, 0.030, class'Canvas'.static.MakeColor(64, 64, byte(255)));
}

simulated function AddEnemyInfo()
{
    local int i, NumPlayers;

    NumPlayers = MI.NumBots / 2;
    // End:0x3d
    if(float(MI.NumBots) % float(2) == float(1))
    {
        ++ NumPlayers;
    }
    ETI.Initialize(NumPlayers);
    i = 0;
    J0x58:
    // End:0x9a [While If]
    if(i < NumPlayers)
    {
        EnemyPlayers[i] = ETI.Roster[i].PlayerName;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    AddTeamBar(1, ETI.TeamSymbolName, EnemyPlayers, 0.70, class'Canvas'.static.MakeColor(byte(255), 0, 0), true);
}

simulated function AddTeamBar(int TeamID, string TeamIconName, out array<string> Crew, float Top, Color TeamColor, optional bool bNameUp)
{
    local Material TSym, Portrait;
    local float ILeft, ISpace, imgW, imgH, IconBoxW, IconBoxH;

    local int i;
    local DrawOpImage dop;

    TSym = DLOTexture(TeamIconName);
    imgW = 0.10;
    imgH = 0.2750;
    ISpace = 0.030 + float(7 - Crew.Length) * 0.010;
    IconBoxW = 0.30;
    IconBoxH = 0.40;
    ILeft = 1.0 - float(Crew.Length) * imgW + ISpace - ISpace / 2.0;
    TeamColor.A = 70;
    // End:0xce
    if(TeamID == 0)
    {
        dop = AddImage(TSym, 0.010, 0.010, IconBoxH, IconBoxW);
    }
    // End:0x101
    else
    {
        dop = AddImage(TSym, 0.990 - IconBoxH, 0.990 - IconBoxW, IconBoxH, IconBoxW);
    }
    dop.DrawColor = TeamColor;
    dop.RenderStyle = 5;
    TeamColor.A = byte(255);
    i = 0;
    J0x13c:
    // End:0x1f1 [While If]
    if(i < Crew.Length)
    {
        Portrait = getPlayerPortrait(Crew[i]);
        AddImage(Portrait, Top, ILeft, imgH, imgW);
        // End:0x1af
        if(i == 0)
        {
            AddImage(LeaderFrame, Top, ILeft, imgH, imgW);
        }
        // End:0x1ce
        else
        {
            AddImage(CharFrame, Top, ILeft, imgH, imgW);
        }
        ILeft = ILeft + imgW + ISpace;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13c;
    }
}

simulated function AddTeamCompare()
{
    local array<int> Team1Stat, Team2Stat;
    local string TxtFont, SmallTxtFont, tmp;
    local float TopLine, LineSpc;
    local int i;
    local DrawOpText Op;

    Team1Stat[0] = class'wUtil'.static.TeamArrayAccuracyRating(TeamPlayers);
    Team1Stat[1] = class'wUtil'.static.TeamArrayAggressivenessRating(TeamPlayers);
    Team1Stat[2] = class'wUtil'.static.TeamArrayAgilityRating(TeamPlayers);
    Team1Stat[3] = class'wUtil'.static.TeamArrayTacticsRating(TeamPlayers);
    Team2Stat[0] = class'wUtil'.static.TeamArrayAccuracyRating(EnemyPlayers);
    Team2Stat[1] = class'wUtil'.static.TeamArrayAggressivenessRating(EnemyPlayers);
    Team2Stat[2] = class'wUtil'.static.TeamArrayAgilityRating(EnemyPlayers);
    Team2Stat[3] = class'wUtil'.static.TeamArrayTacticsRating(EnemyPlayers);
    TopLine = 0.320;
    LineSpc = 0.4250 / float(6);
    TxtFont = "XInterface.UT2HeaderFont";
    SmallTxtFont = "GUI2K4.fntUT2K4Medium";
    Op = AddJustifiedText(GP.TeamName, 2, TopLine, 0.050, LineSpc, 0.230, 1);
    Op.FontName = TxtFont;
    Op.DrawColor = Blue;
    Op = AddJustifiedText(ETI.TeamName, 0, TopLine, 0.720, LineSpc, 0.230, 1);
    Op.FontName = TxtFont;
    Op.DrawColor = Red;
    i = 1;
    J0x1f8:
    // End:0x3b2 [While If]
    if(i < 5)
    {
        TopLine += LineSpc;
        AddJustifiedText(StatNames[i], 1, TopLine, 0.0, LineSpc, 0.20, 1).FontName = SmallTxtFont;
        AddJustifiedText(StatNames[i], 1, TopLine, 0.80, LineSpc, 0.20, 1).FontName = SmallTxtFont;
        tmp = string(Team1Stat[i - 1]);
        tmp $= "%";
        Op = AddJustifiedText(tmp, 2, TopLine, 0.050, LineSpc, 0.230, 1);
        Op.FontName = TxtFont;
        // End:0x314
        if(Team1Stat[i - 1] >= Team2Stat[i - 1])
        {
            Op.DrawColor = Yellow;
        }
        tmp = string(Team2Stat[i - 1]);
        tmp $= "%";
        Op = AddJustifiedText(tmp, 0, TopLine, 0.720, LineSpc, 0.230, 1);
        Op.FontName = TxtFont;
        // End:0x3a8
        if(Team2Stat[i - 1] >= Team1Stat[i - 1])
        {
            Op.DrawColor = Yellow;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f8;
    }
}

simulated function Material getPlayerPortrait(string PlayerName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < PlayerList.Length)
    {
        // End:0x42
        if(PlayerList[i].DefaultName == PlayerName)
        {
            return PlayerList[i].Portrait;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

defaultproperties
{
    White=(R=255,G=255,B=255,A=255)
    Yellow=(R=255,G=255,B=0,A=255)
    Blue=(R=64,G=64,B=255,A=255)
    Red=(R=255,G=0,B=0,A=255)
    LoadingMessage="??"
    StatNames[0]="VS"
    StatNames[1]="???"
    StatNames[2]="???"
    StatNames[3]="???"
    StatNames[4]="??"
}