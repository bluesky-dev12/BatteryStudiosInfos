/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMyInfoBasicHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class BTTPMyInfoBasicHK extends BTTPOptionBaseHK
    dependson(BTOwnerDrawMyNameMyClanHK)
    editinlinenew
    instanced;

var localized string strLabel[21];
var localized string strPlayNetCash;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ACLList.SetItemCountPerPage(17, 1);
    Label.Length = 21;
    Content.Length = 21;
    InternalPadding.Length = 21;
    i = 0;
    J0x44:
    // End:0x8a [While If]
    if(i < InternalPadding.Length)
    {
        InternalPadding[i].Y1 = 3.0;
        InternalPadding[i].Y2 = 4.0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    InitializeLabel();
    InitializeContent();
    ACLList_PositionChanged(0);
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    J0x37:
    // End:0xfe [While If]
    if(i < Label.Length)
    {
        ro = new class'RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeEmptyBox(), class'BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    // End:0x12b
    if(MM.kChannelingType == 1)
    {
        Label[7].Caption = strPlayNetCash;
    }
}

function SetData(int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, ClanInfo stClanInfo, int ClanLevel)
{
    local int startExp, maxExp, nPerc, Day, Hour;

    local string strPerc;
    local wGameManager GameMgr;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    BTOwnerDrawMyNameMyClanHK(Content[0]).SetData(stCharInfo.Level, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel, stCharInfo.LevelMarkID);
    // End:0xe6
    if(stCharInfo.Level >= 2)
    {
        startExp = GameMgr.LevelInfoParams[stCharInfo.Level - 1].nAccumExp;
    }
    // End:0xed
    else
    {
        startExp = 0;
    }
    maxExp = GameMgr.LevelInfoParams[stCharInfo.Level].nAccumExp;
    strPerc = string(int(float(stCharInfo.Exp - startExp) / float(maxExp - startExp) * 100.0));
    BTExpBarHK(Content[2]).SetData(stCharInfo.Exp - startExp, maxExp - startExp, string(stCharInfo.Exp) $ "/" $ string(maxExp), "(" $ strPerc $ "%)");
    // End:0x1d3
    if(stCharInfo.Win == 0 && stCharInfo.Lose == 0)
    {
        nPerc = 0;
    }
    // End:0x208
    else
    {
        nPerc = int(float(stCharInfo.Win) / float(stCharInfo.Win + stCharInfo.Lose) * 100.0);
    }
    BTOwnerDrawTextArrayHK(Content[3]).SetData(string(stCharInfo.Win + stCharInfo.Lose) $ strRound $ " " $ string(stCharInfo.Win) $ strWin $ " / " $ string(stCharInfo.Lose) $ strLose $ " (" $ string(nPerc) $ "%)");
    // End:0x2b5
    if(stCharInfo.Kill == 0 && stCharInfo.Death == 0)
    {
        nPerc = 0;
    }
    // End:0x2ea
    else
    {
        nPerc = int(float(stCharInfo.Kill) / float(stCharInfo.Kill + stCharInfo.Death) * 100.0);
    }
    BTOwnerDrawTextArrayHK(Content[4]).SetData(string(stCharInfo.Kill) $ strKill $ " / " $ string(stCharInfo.Assist) $ strAssist $ " / " $ string(stCharInfo.Death) $ strDeath $ " (K/D " $ string(nPerc) $ "%)");
    // End:0x37f
    if(stCharInfo.Kill == 0)
    {
        nPerc = 0;
    }
    // End:0x3a8
    else
    {
        nPerc = int(float(stCharInfo.HeadShot2) / float(stCharInfo.Kill) * 100.0);
    }
    BTOwnerDrawTextArrayHK(Content[5]).SetData(string(stCharInfo.HeadShot2) @ strHeadShot $ " (" $ string(nPerc) $ "%)");
    BTOwnerDrawTextArrayHK(Content[6]).SetData(class'BTCustomDrawHK'.static.ToWonString(string(stCharInfo.Point)) @ strPoint);
    BTOwnerDrawTextArrayHK(Content[7]).SetData(class'BTCustomDrawHK'.static.ToWonString(string(MM.kCash)) @ strCash);
    BTOwnerDrawTextArrayHK(Content[8]).SetRankData(string(stCharInfo.Ranking) @ strRank, stCharInfo.Ranking - stCharInfo.PrevRanking);
    BTOwnerDrawTextArrayHK(Content[9]).SetRankData(string(stCharInfo.MonthlyRanking) @ strRank, stCharInfo.MonthlyRanking - stCharInfo.MonthlyPrevRanking);
    BTOwnerDrawTextArrayHK(Content[10]).SetRankData(string(stCharInfo.HeadShotRanking) @ strRank, stCharInfo.HeadShotRanking - stCharInfo.PrevHeadShotRanking);
    BTOwnerDrawTextArrayHK(Content[11]).SetRankData(string(stCharInfo.MonthlyHeadShotRanking) @ strRank, stCharInfo.MonthlyHeadShotRanking - stCharInfo.MonthlyPrevHeadShotRanking);
    BTOwnerDrawTextArrayHK(Content[12]).SetData(string(stCharInfo.ClanContribue));
    // End:0x5ac
    if(stCharInfo.ClanWin == 0 && stCharInfo.ClanLose == 0)
    {
        nPerc = 0;
    }
    // End:0x5e1
    else
    {
        nPerc = int(float(stCharInfo.ClanWin) / float(stCharInfo.ClanWin + stCharInfo.ClanLose) * 100.0);
    }
    BTOwnerDrawTextArrayHK(Content[13]).SetData(string(stCharInfo.ClanWin + stCharInfo.ClanLose) $ strRound $ " " $ string(stCharInfo.ClanWin) $ strWin $ " / " $ string(stCharInfo.ClanLose) $ strLose $ " (" $ string(nPerc) $ "%)");
    // End:0x68e
    if(stCharInfo.ClanKill == 0 && stCharInfo.ClanDeath == 0)
    {
        nPerc = 0;
    }
    // End:0x6b7
    else
    {
        nPerc = int(float(stCharInfo.ClanKill) / float(stCharInfo.ClanDeath) * 100.0);
    }
    BTOwnerDrawTextArrayHK(Content[14]).SetData(string(stCharInfo.ClanKill) $ strKill $ " / " $ string(stCharInfo.ClanAssist) $ strAssist $ " / " $ string(stCharInfo.ClanDeath) $ strDeath $ " (K/D " $ string(nPerc) $ "%)");
    // End:0x74c
    if(stCharInfo.ClanKill == 0)
    {
        nPerc = 0;
    }
    // End:0x775
    else
    {
        nPerc = int(float(stCharInfo.ClanHeadshot) / float(stCharInfo.ClanKill) * 100.0);
    }
    BTOwnerDrawTextArrayHK(Content[15]).SetData(string(stCharInfo.ClanHeadshot) $ strHeadShot $ " (" $ string(nPerc) $ "%)");
    BTOwnerDrawTextArrayHK(Content[16]).SetData(string(0) $ " " $ strDiscon);
    BTOwnerDrawTextArrayHK(Content[17]).SetRankData(string(stCharInfo.ClanRanking) @ strRank, stCharInfo.ClanRanking - stCharInfo.ClanRankingPrev);
    BTOwnerDrawTextArrayHK(Content[18]).SetRankData(string(stCharInfo.ClanRankingMonthly) @ strRank, stCharInfo.ClanRankingMonthly - stCharInfo.ClanRankingMonthlyPrev);
    BTOwnerDrawTextArrayHK(Content[19]).SetData(string(stCharInfo.DisCon));
    Day = stCharInfo.TotPlayTime / 86400;
    Hour = int(float(stCharInfo.TotPlayTime) % float(86400)) / 3600;
    // End:0x8fb
    if(Day > 0)
    {
        BTOwnerDrawTextArrayHK(Content[20]).SetData(string(Day) @ strDay @ string(Hour) @ strHour);
    }
    // End:0x920
    else
    {
        BTOwnerDrawTextArrayHK(Content[20]).SetData(string(Hour) @ strHour);
    }
}

function InitializeContent()
{
    Content[0] = NewComponent(new class'BTOwnerDrawMyNameMyClanHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.780);
    InternalPadding[0].Y1 = 7.0;
    Content[2] = NewComponent(new class'BTExpBarHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    InternalPadding[2].Y1 = 8.0;
    InternalPadding[2].Y2 = 8.0;
    Content[3] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[3]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[4] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[5] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[5]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.ChatSystem();
    Content[6] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[7] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[7]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[8] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[8]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[9] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[9]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[10] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[10]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[11] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[11]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[12] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[12]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[13] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[13]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[14] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[14]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[15] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[15]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[16] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[16]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[17] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[17]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[18] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[18]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[19] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[19]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
    Content[20] = NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    BTOwnerDrawTextArrayHK(Content[20]).tarray[1].DrawColor = class'BTUIColorPoolHK'.static.GradeNormal();
}

defaultproperties
{
    strLabel[2]="EXP"
    strLabel[3]="Records"
    strLabel[4]="Battle Info"
    strLabel[5]="Headshots"
    strLabel[6]="Points"
    strLabel[7]="Cash"
    strLabel[8]="Overall Rank"
    strLabel[9]="Overall Rank (M)"
    strLabel[10]="Headshot Rank"
    strLabel[11]="Headshot Rank (M)"
    strLabel[12]="Clan Contribution"
    strLabel[13]="Clan Battle Record"
    strLabel[14]="Clan Battle Info"
    strLabel[15]="Clan Headshots"
    strLabel[16]="Clan Withdrawals"
    strLabel[17]="Clan Rank"
    strLabel[18]="Clan Rank (M)"
    strLabel[19]="Force Quit"
    strLabel[20]="Total Play Time"
    strPlayNetCash="PlayCoin"
    ItemWidth=468
    LabelWidth=114
    fbACLList=(X1=201.0,Y1=81.0,X2=826.0,Y2=691.0)
}