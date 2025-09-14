/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMyInfoHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:7
 *
 *******************************************************************************/
class BTTPMyInfoHKCN extends BTTPMyInfoHK
    editinlinenew
    instanced;

var BTROExpBarHKCN expbar;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    roClanMark = new class'BTROClanMarkHK';
    roClanMark.Init();
    expbar = new class'BTROExpBarHKCN';
    expbar.Init();
    expbar.bRenderText = false;
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
    expbar.SetData(curExp - startExp, nMaxExp - startExp);
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
    expbar.SetData(curExp - startExp, maxExp - startExp);
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
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, ClientBounds[0], ClientBounds[1], ClientBounds[0] + float(32), ClientBounds[1] + float(32));
    class'BTCustomDrawHK'.static.DrawString(C, myName, 4, float(fntSize + 4), 811.0, 533.0, 966.0, 550.0);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strExp, 3, float(fntSize), 774.0, 585.0, 841.0, 598.0, 0, 0, 0, 0);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strPoint, 3, float(fntSize), 774.0, 622.0, 841.0, 635.0, 0, 0, 0, 0);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strRanking[0], 3, float(fntSize), 774.0, 645.0, 841.0, 658.0, 0, 0, 0, 0);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strRecord, 3, float(fntSize), 774.0, 668.0, 841.0, 681.0, 0, 0, 0, 0);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strClan, 3, float(fntSize), 774.0, 691.0, 841.0, 704.0, 0, 0, 0, 0);
    i = 0;
    C.DrawColor = DescColor;
    // End:0x2f5
    if(ClanName != "")
    {
        roClanMark.AWinPos.X1 = 843.0;
        roClanMark.AWinPos.Y1 = 692.0;
        roClanMark.AWinPos.X2 = 875.0;
        roClanMark.AWinPos.Y2 = 724.0;
        roClanMark.Render(C);
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, ClanName, 3, float(fntSize), 881.0, 691.0, 1005.0, 704.0, 0, 0, 0, 0);
    }
    i = 1;
    C.DrawColor = DescColor;
    class'BTCustomDrawHK'.static.DrawTextArray(C, taRanking, 3, 0, 843.0, 645.0, 1005.0, 658.0);
    i = 2;
    C.DrawColor = DescColor;
    expbar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(839.0, 578.0, 993.0, 606.0);
    expbar.Render(C);
    class'BTCustomDrawHK'.static.DrawTextArray(C, taExpbar, 4, 0, 850.0, 584.0, 980.0, 597.0);
    i = 3;
    C.DrawColor = DescColor;
    class'BTCustomDrawHK'.static.DrawImagePaddingOffset(C, class'BTUIResourcePoolHK'.default.newimg_point_LC, 843.0, 621.0, 858.0, 636.0, 0, 0, 0, 0);
    class'BTCustomDrawHK'.static.DrawTextPaddingOffset(C, tPoint, 863.0, 622.0, 1005.0, 635.0, 0, 0, 0, 0);
    i = 4;
    C.DrawColor = DescColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, strWinLose, 3, float(fntSize), 843.0, 668.0, 1005.0, 681.0, 0, 0, 0, 0);
}

defaultproperties
{
    OnRendered=OnRendered
}