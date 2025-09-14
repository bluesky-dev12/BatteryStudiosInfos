/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMyInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:28
 *	Functions:7
 *
 *******************************************************************************/
class BTTPMyInfoHK extends GUITabPanel
    editinlinenew
    instanced;

var int titleFontSize;
var int defaultFontSize;
var BTROClanMarkHK roClanMark;
var Image LevelImg;
var string myName;
var string ClanName;
var int Ranking;
var int curExp;
var int maxExp;
var string expPerc;
var int Point;
var int Cash;
var int recordWin;
var int recordLose;
var Color MenuColor;
var Color DescColor;
var localized string strClan;
var localized string strRanking[2];
var localized string strExp;
var localized string strPoint;
var localized string strRecord;
var localized string strWin;
var localized string strLose;
var string strWinLose;
var Text tPoint;
var array<Text> taRanking;
var array<Text> taExpbar;
var BTROExpBarHK roExpBar;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    roClanMark = new class'BTROClanMarkHK';
    roClanMark.Init();
    roExpBar = new class'BTROExpBarHK';
    roExpBar.Init();
    roExpBar.bRenderText = false;
    MenuColor = class'Canvas'.static.MakeColor(215, 220, 200, byte(255));
    DescColor = class'Canvas'.static.MakeColor(180, 190, 170, byte(255));
}

function SetMyInfo(string CharName, string ClanName, CharInfo cInfo)
{
    local int startExp, nMaxExp, nPerc;
    local wGameManager GameMgr;

    Log("[BTTPMyInfoHK::SetMyInfo]" $ " name=" $ CharName $ " clan=" $ ClanName);
    LevelImg = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
    GameMgr.GetLevelImage(cInfo.Level, cInfo.LevelMarkID, LevelImg);
    myName = CharName;
    self.ClanName = ClanName;
    Ranking = cInfo.Ranking;
    taRanking.Length = 2;
    taRanking[0] = class'BTCustomDrawHK'.static.MakeText(10, 3, string(Ranking) $ strRanking[1]);
    taRanking[1] = class'BTCustomDrawHK'.static.MakeText(8, 3, "");
    taRanking[1].DrawColor = class'Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    curExp = cInfo.Exp;
    // End:0x1a5
    if(cInfo.Level >= 2)
    {
        startExp = GameMgr.LevelInfoParams[cInfo.Level - 1].nAccumExp;
    }
    // End:0x1ac
    else
    {
        startExp = 0;
    }
    nMaxExp = GameMgr.LevelInfoParams[cInfo.Level].nAccumExp;
    expPerc = string(int(float(curExp - startExp) / float(nMaxExp - startExp) * 100.0));
    roExpBar.SetData(curExp - startExp, nMaxExp - startExp);
    taExpbar.Length = 2;
    taExpbar[0] = class'BTCustomDrawHK'.static.MakeText(10, 3, string(curExp) $ "/" $ string(nMaxExp));
    taExpbar[1] = class'BTCustomDrawHK'.static.MakeText(8, 3, "(" $ expPerc $ "%)");
    taExpbar[1].DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255));
    Point = cInfo.Point;
    tPoint = class'BTCustomDrawHK'.static.MakeText(10, 3, class'BTCustomDrawHK'.static.ToWonString(string(Point)));
    tPoint.DrawColor = class'Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    recordWin = cInfo.Win;
    recordLose = cInfo.Lose;
    // End:0x35f
    if(recordWin == 0 && recordLose == 0)
    {
        nPerc = 0;
    }
    // End:0x385
    else
    {
        nPerc = int(float(recordWin) / float(recordWin + recordLose) * 100.0);
    }
    strWinLose = string(recordWin) $ strWin $ "/" $ string(recordLose) $ strLose $ " (" $ string(nPerc) $ "%)";
}

function SetMoneyInfo(int P, int C)
{
    Point = P;
    tPoint = class'BTCustomDrawHK'.static.MakeText(10, 3, class'BTCustomDrawHK'.static.ToWonString(string(Point)));
    tPoint.DrawColor = class'Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    Cash = C;
}

function SetRankingInfo(int Ranking, int Win, int Lose)
{
    local int nPerc;

    self.Ranking = Ranking;
    taRanking.Length = 2;
    taRanking[0] = class'BTCustomDrawHK'.static.MakeText(10, 3, string(Ranking) $ strRanking[1]);
    taRanking[1] = class'BTCustomDrawHK'.static.MakeText(8, 3, "");
    taRanking[1].DrawColor = class'Canvas'.static.MakeColor(byte(255), 49, 52, byte(255));
    recordWin = Win;
    recordLose = Lose;
    // End:0xc1
    if(recordWin == 0 && recordLose == 0)
    {
        nPerc = 0;
    }
    // End:0xe7
    else
    {
        nPerc = int(float(recordWin) / float(recordWin + recordLose) * 100.0);
    }
    strWinLose = string(recordWin) $ strWin $ "/" $ string(recordLose) $ strLose $ " (" $ string(nPerc) $ "%)";
}

function SetClanInfo(string ClanName, int ClanPattern, int ClanBG, int ClanBL, optional int ClanLevel)
{
    self.ClanName = ClanName;
    roClanMark.SetData(PlayerOwner().Level.GameMgr, ClanPattern, ClanBG, ClanBL, false, ClanLevel);
}

function SetMyInfoA(string CharName, int Level, int curExp, int startExp, int maxExp, int LevelMarkID)
{
    local wGameManager GameMgr;

    Log("[BTTPMyInfoHK::SetMyInfo]" $ " name=" $ CharName $ " clan=" $ ClanName);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    LevelImg = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
    GameMgr.GetLevelImage(Level, 0, LevelImg);
    myName = CharName;
    expPerc = string(int(float(curExp - startExp) / float(maxExp - startExp) * 100.0));
    roExpBar.SetData(curExp - startExp, maxExp - startExp);
    taExpbar.Length = 2;
    taExpbar[0] = class'BTCustomDrawHK'.static.MakeText(10, 3, string(curExp) $ "/" $ string(maxExp));
    taExpbar[1] = class'BTCustomDrawHK'.static.MakeText(8, 3, "(" $ expPerc $ "%)");
    taExpbar[1].DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255));
}

function OnRendered(Canvas C)
{
    local int hStep, i, hHeader, fntSize, width, Height;

    width = int(ClientBounds[2] - ClientBounds[0]);
    Height = int(ClientBounds[3] - ClientBounds[1]);
    fntSize = 10;
    hHeader = 40;
    hStep = Height - hHeader / 5;
    C.Style = 5;
    C.DrawColor = MenuColor;
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.panel_1, ClientBounds[0], ClientBounds[1], ClientBounds[2], ClientBounds[3]);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_input_s, ClientBounds[0] + float(2), ClientBounds[1] + float(2), ClientBounds[2] - float(2), ClientBounds[1] + float(3) + float(33));
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, ClientBounds[0] + float(3), ClientBounds[1] + float(3), ClientBounds[0] + float(3) + float(32), ClientBounds[1] + float(3) + float(32));
    class'BTCustomDrawHK'.static.DrawString(C, myName, 4, float(fntSize + 4), ClientBounds[0] + float(1) + float(32), ClientBounds[1] + float(3), ClientBounds[2] - float(3), ClientBounds[1] + float(32) + float(3));
    i = 0;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strClan, 3, float(fntSize), ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 10, 0, 0, 0);
    i = 1;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strRanking[0], 3, float(fntSize), ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 10, 0, 0, 0);
    i = 2;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strExp, 3, float(fntSize), ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 10, 0, 0, 0);
    C.DrawColor = self.WhiteColor;
    i = 3;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strPoint, 3, float(fntSize), ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 10, 0, 0, 0);
    i = 4;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strRecord, 3, float(fntSize), ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 10, 0, 0, 0);
    i = 0;
    C.DrawColor = DescColor;
    // End:0x5e1
    if(ClanName != "")
    {
        roClanMark.AWinPos.X1 = ClientBounds[0] + float(80);
        roClanMark.AWinPos.Y1 = ClientBounds[1] + float(hStep * i) + float(hHeader);
        roClanMark.AWinPos.X2 = ClientBounds[0] + float(80) + float(32);
        roClanMark.AWinPos.Y2 = ClientBounds[1] + float(hStep * i) + float(hHeader) + float(32);
        roClanMark.Render(C);
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, ClanName, 3, float(fntSize), ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 120, 0, 0, 0);
    }
    i = 1;
    C.DrawColor = DescColor;
    class'BTCustomDrawHK'.static.DrawTextArray(C, taRanking, 3, 0, ClientBounds[0] + float(80), ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader));
    i = 2;
    C.DrawColor = DescColor;
    roExpBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(ClientBounds[0] + float(80), ClientBounds[1] + float(hStep * i) + float(hHeader) + float(10), ClientBounds[2] - float(12), ClientBounds[1] + float(hStep * i + 1) + float(hHeader) - float(10));
    roExpBar.AWinPos.X1 -= float(2);
    roExpBar.AWinPos.Y1 -= float(3);
    roExpBar.AWinPos.Y2 -= float(3);
    roExpBar.Render(C);
    class'BTCustomDrawHK'.static.DrawTextArray(C, taExpbar, 4, 0, roExpBar.AWinPos.X1, roExpBar.AWinPos.Y1, roExpBar.AWinPos.X2, roExpBar.AWinPos.Y2);
    i = 3;
    C.DrawColor = DescColor;
    class'BTCustomDrawHK'.static.DrawImagePaddingOffset(C, class'BTUIResourcePoolHK'.default.img_point_LC, ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 80, 0, 0, 0);
    class'BTCustomDrawHK'.static.DrawTextPaddingOffset(C, tPoint, ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 100, 0, 0, 0);
    i = 4;
    C.DrawColor = DescColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strWinLose, 3, float(fntSize), ClientBounds[0], ClientBounds[1] + float(hStep * i) + float(hHeader), ClientBounds[2], ClientBounds[1] + float(hStep * i + 1) + float(hHeader), 80, 0, 0, 0);
}

defaultproperties
{
    strClan="Clan"
    strRanking[0]="Rank"
    strRanking[1]=" "
    strExp="EXP"
    strPoint="Points"
    strRecord="Records"
    strWin="Wins"
    strLose="Losses"
    OnRendered=OnRendered
}