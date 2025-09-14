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
    local Class<UnrealTeamInfo> ETIclass;

    GP = UT2K4GameProfile(Level.Game.CurrentGameProfile);
    // End:0x63
    if(GP != none)
    {
        MI = UT2K4MatchInfo(GP.GetMatchInfo(GP.CurrentLadder, GP.CurrentMenuRung));
    }
    // End:0xA3
    if((GP == none) || MI == none)
    {
        Warn((("GP ==" @ string(GP)) @ ", MI ==") @ string(MI));
        return;
    }
    MapScreenshot = Material(DynamicLoadObject(GP.ActiveMap.ScreenshotRef, Class'Engine.Material', true));
    // End:0xFD
    if(MaterialSequence(MapScreenshot) != none)
    {
        MapScreenshot = MaterialSequence(MapScreenshot).SequenceItems[0].Material;
    }
    AddBackground();
    AddMatchInfo();
    ETIclass = Class<UnrealTeamInfo>(DynamicLoadObject(GP.EnemyTeam, Class'Core.Class'));
    ETI = Spawn(ETIclass);
    // End:0x174
    if(ETI == none)
    {
        Warn((("ETI ==" @ string(ETI)) @ string(ETIclass)) @ GP.EnemyTeam);
        return;
    }
    NumTeamMates = GP.GetNumTeammatesForMatch();
    // End:0x1C5
    if(UT2K4DMRoster(ETI) != none)
    {
        UT2K4DMRoster(ETI).PreInitialize(MI.NumBots - NumTeamMates);        
    }
    else
    {
        ETI.Initialize(MI.NumBots - NumTeamMates);
    }
    Class'WGame.wUtil'.static.GetPlayerList(PlayerList);
    // End:0x20E
    if(NumTeamMates == 0)
    {
        AddPlayerCircle();        
    }
    else
    {
        AddTeamInfo();
        AddEnemyInfo();
        AddTeamCompare();
    }
    //return;    
}

simulated function AddBackground()
{
    local Material BG;

    BG = MapScreenshot;
    //return;    
}

simulated function AddMatchInfo()
{
    local string Title;
    local DrawOpText tmp;

    AddImage(ImageFrame, 0.3400000, 0.2990000, 0.3200000, 0.4020000);
    AddImage(MapScreenshot, 0.3500000, 0.3000000, 0.3000000, 0.4000000);
    // End:0x6A
    if(MI.MenuName != "")
    {
        Title = MI.MenuName;        
    }
    else
    {
        // End:0xA0
        if(GP.ActiveMap.FriendlyName != "")
        {
            Title = GP.ActiveMap.FriendlyName;            
        }
        else
        {
            Title = GP.ActiveMap.MapName;
        }
    }
    tmp = AddJustifiedText(Title, 1, 0.5720000, 0.3020000, 0.1000000, 0.4000000, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 196);
    tmp.bWrapText = false;
    tmp = AddJustifiedText(Title, 1, 0.5700000, 0.3000000, 0.1000000, 0.4000000, 1);
    tmp.bWrapText = false;
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp = AddJustifiedText(GP.GetMatchDescription(), 1, 0.3320000, 0.3020000, 0.1000000, 0.4000000, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 196);
    tmp.bWrapText = false;
    tmp = AddJustifiedText(GP.GetMatchDescription(), 1, 0.3300000, 0.3000000, 0.1000000, 0.4000000, 1);
    tmp.bWrapText = false;
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp = AddJustifiedText(LoadingMessage, 1, 0.4520000, 0.3020000, 0.1000000, 0.4000000, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 64);
    tmp.bWrapText = false;
    tmp = AddJustifiedText(LoadingMessage, 1, 0.4520000, 0.3000000, 0.1000000, 0.4000000, 1);
    tmp.FontName = "GUI2K4.fntUT2k4Header";
    tmp.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), 196);
    tmp.bWrapText = false;
    //return;    
}

simulated function AddPlayerCircle()
{
    local int i;
    local float dist, cX, cY, cR, imgW, imgH,
	    bX, bY, ox, oy;

    local Material Portrait;

    dist = (2.0000000 * 3.1415927) / float(MI.NumBots + 1);
    cX = 0.5000000;
    cY = 0.5000000;
    cR = 0.0300000;
    imgW = 0.1100000;
    imgH = 0.3000000;
    bX = (imgH / float(2)) + cR;
    bY = (imgW / float(2)) + (cR * float(4 / 3));
    Portrait = getPlayerPortrait(GP.PlayerCharacter);
    AddImage(Portrait, cR, cY - (imgW / float(2)), imgH, imgW);
    AddImage(CharFrame, cR, cY - (imgW / float(2)), imgH, imgW);
    i = 0;
    J0x111:

    // End:0x2A7 [Loop If]
    if(i < MI.NumBots)
    {
        // End:0x150
        if(i > ETI.Roster.Length)
        {
            Portrait = MysteryPlayer;            
        }
        else
        {
            Portrait = getPlayerPortrait(ETI.Roster[i].PlayerName);
        }
        ox = Sin(((-1.0000000 * float(i + 1)) * dist) + (3.1415927 / float(2)));
        ox = FClamp(cX - ox, 0.0000000 + bX, 1.0000000 - bX);
        oy = Cos(((-1.0000000 * float(i + 1)) * dist) + (3.1415927 / float(2)));
        oy = FClamp(cY - oy, 0.0000000 + bY, 1.0000000 - bY);
        AddImage(Portrait, ox - (imgH / float(2)), oy - (imgW / float(2)), imgH, imgW);
        AddImage(CharFrame, ox - (imgH / float(2)), oy - (imgW / float(2)), imgH, imgW);
        i++;
        // [Loop Continue]
        goto J0x111;
    }
    //return;    
}

simulated function AddTeamInfo()
{
    local int i, NumPlayers;

    TeamPlayers[0] = GP.PlayerCharacter;
    NumPlayers = MI.NumBots / 2;
    i = 0;
    J0x35:

    // End:0x80 [Loop If]
    if(i < NumPlayers)
    {
        TeamPlayers[i + 1] = GP.PlayerTeam[GP.PlayerLineup[i]];
        i++;
        // [Loop Continue]
        goto J0x35;
    }
    AddTeamBar(0, GP.TeamSymbolName, TeamPlayers, 0.0300000, Class'Engine.Canvas'.static.MakeColor(64, 64, byte(255)));
    //return;    
}

simulated function AddEnemyInfo()
{
    local int i, NumPlayers;

    NumPlayers = MI.NumBots / 2;
    // End:0x3D
    if((float(MI.NumBots) % float(2)) == float(1))
    {
        NumPlayers++;
    }
    ETI.Initialize(NumPlayers);
    i = 0;
    J0x58:

    // End:0x9A [Loop If]
    if(i < NumPlayers)
    {
        EnemyPlayers[i] = ETI.Roster[i].PlayerName;
        i++;
        // [Loop Continue]
        goto J0x58;
    }
    AddTeamBar(1, ETI.TeamSymbolName, EnemyPlayers, 0.7000000, Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0), true);
    //return;    
}

simulated function AddTeamBar(int TeamID, string TeamIconName, out array<string> Crew, float Top, Color TeamColor, optional bool bNameUp)
{
    local Material TSym, Portrait;
    local float ILeft, ISpace, imgW, imgH, IconBoxW, IconBoxH;

    local int i;
    local DrawOpImage dop;

    TSym = DLOTexture(TeamIconName);
    imgW = 0.1000000;
    imgH = 0.2750000;
    ISpace = 0.0300000 + (float(7 - Crew.Length) * 0.0100000);
    IconBoxW = 0.3000000;
    IconBoxH = 0.4000000;
    ILeft = (1.0000000 - ((float(Crew.Length) * (imgW + ISpace)) - ISpace)) / 2.0000000;
    TeamColor.A = 70;
    // End:0xCE
    if(TeamID == 0)
    {
        dop = AddImage(TSym, 0.0100000, 0.0100000, IconBoxH, IconBoxW);        
    }
    else
    {
        dop = AddImage(TSym, 0.9900000 - IconBoxH, 0.9900000 - IconBoxW, IconBoxH, IconBoxW);
    }
    dop.DrawColor = TeamColor;
    dop.RenderStyle = 5;
    TeamColor.A = byte(255);
    i = 0;
    J0x13C:

    // End:0x1F1 [Loop If]
    if(i < Crew.Length)
    {
        Portrait = getPlayerPortrait(Crew[i]);
        AddImage(Portrait, Top, ILeft, imgH, imgW);
        // End:0x1AF
        if(i == 0)
        {
            AddImage(LeaderFrame, Top, ILeft, imgH, imgW);            
        }
        else
        {
            AddImage(CharFrame, Top, ILeft, imgH, imgW);
        }
        ILeft = (ILeft + imgW) + ISpace;
        i++;
        // [Loop Continue]
        goto J0x13C;
    }
    //return;    
}

simulated function AddTeamCompare()
{
    local array<int> Team1Stat, Team2Stat;
    local string TxtFont, SmallTxtFont, tmp;
    local float TopLine, LineSpc;
    local int i;
    local DrawOpText Op;

    Team1Stat[0] = Class'WGame.wUtil'.static.TeamArrayAccuracyRating(TeamPlayers);
    Team1Stat[1] = Class'WGame.wUtil'.static.TeamArrayAggressivenessRating(TeamPlayers);
    Team1Stat[2] = Class'WGame.wUtil'.static.TeamArrayAgilityRating(TeamPlayers);
    Team1Stat[3] = Class'WGame.wUtil'.static.TeamArrayTacticsRating(TeamPlayers);
    Team2Stat[0] = Class'WGame.wUtil'.static.TeamArrayAccuracyRating(EnemyPlayers);
    Team2Stat[1] = Class'WGame.wUtil'.static.TeamArrayAggressivenessRating(EnemyPlayers);
    Team2Stat[2] = Class'WGame.wUtil'.static.TeamArrayAgilityRating(EnemyPlayers);
    Team2Stat[3] = Class'WGame.wUtil'.static.TeamArrayTacticsRating(EnemyPlayers);
    TopLine = 0.3200000;
    LineSpc = 0.4250000 / float(6);
    TxtFont = "XInterface.UT2HeaderFont";
    SmallTxtFont = "GUI2K4.fntUT2K4Medium";
    Op = AddJustifiedText(GP.TeamName, 2, TopLine, 0.0500000, LineSpc, 0.2300000, 1);
    Op.FontName = TxtFont;
    Op.DrawColor = Blue;
    Op = AddJustifiedText(ETI.TeamName, 0, TopLine, 0.7200000, LineSpc, 0.2300000, 1);
    Op.FontName = TxtFont;
    Op.DrawColor = Red;
    i = 1;
    J0x1F8:

    // End:0x3B2 [Loop If]
    if(i < 5)
    {
        TopLine += LineSpc;
        AddJustifiedText(StatNames[i], 1, TopLine, 0.0000000, LineSpc, 0.2000000, 1).FontName = SmallTxtFont;
        AddJustifiedText(StatNames[i], 1, TopLine, 0.8000000, LineSpc, 0.2000000, 1).FontName = SmallTxtFont;
        tmp = string(Team1Stat[i - 1]);
        tmp $= "%";
        Op = AddJustifiedText(tmp, 2, TopLine, 0.0500000, LineSpc, 0.2300000, 1);
        Op.FontName = TxtFont;
        // End:0x314
        if(Team1Stat[i - 1] >= Team2Stat[i - 1])
        {
            Op.DrawColor = Yellow;
        }
        tmp = string(Team2Stat[i - 1]);
        tmp $= "%";
        Op = AddJustifiedText(tmp, 0, TopLine, 0.7200000, LineSpc, 0.2300000, 1);
        Op.FontName = TxtFont;
        // End:0x3A8
        if(Team2Stat[i - 1] >= Team1Stat[i - 1])
        {
            Op.DrawColor = Yellow;
        }
        i++;
        // [Loop Continue]
        goto J0x1F8;
    }
    //return;    
}

simulated function Material getPlayerPortrait(string PlayerName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < PlayerList.Length)
    {
        // End:0x42
        if(PlayerList[i].DefaultName == PlayerName)
        {
            return PlayerList[i].Portrait;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
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