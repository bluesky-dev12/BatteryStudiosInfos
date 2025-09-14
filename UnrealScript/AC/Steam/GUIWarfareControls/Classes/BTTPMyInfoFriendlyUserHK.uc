/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMyInfoFriendlyUserHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:10
 *
 *******************************************************************************/
class BTTPMyInfoFriendlyUserHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var FloatBox fbComboBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK LabelMyName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTComboBoxHK ComboFriendlyUser;
var localized string strLabel[20];
var delegate<OnChangeFriendlyUser> __OnChangeFriendlyUser__Delegate;
var delegate<OnHideFriendlyUserList> __OnHideFriendlyUserList__Delegate;

delegate OnChangeFriendlyUser();
delegate OnHideFriendlyUserList();
function SetData(bool bMyInfo, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, ClanInfo stClanInfo, int ClanLevel)
{
    local int idx, startExp, maxExp, levelExp, Day, Hour;

    local string strPerc;
    local wGameManager GameMgr;
    local wMatchMaker MM;

    // End:0x7b
    if(bMyInfo)
    {
        idx = 0;
        BTTPLabelNComboBoxHK(Content[0]).Label.Caption = CharName;
        BTOwnerDrawTwoLevelImgNClanMarkHK(Content[1]).SetData(bMyInfo, stCharInfo.Level, stCharInfo.LevelMarkID, CM_Pattern, CM_BG, CM_BL, ClanLevel);
    }
    // End:0xc6
    else
    {
        idx = 1;
        BTOwnerDrawTwoLevelImgNClanMarkHK(Content[1]).SetData(bMyInfo, stCharInfo.Level, stCharInfo.LevelMarkID, CM_Pattern, CM_BG, CM_BL, ClanLevel);
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x164
    if(stCharInfo.Level >= 2)
    {
        startExp = GameMgr.LevelInfoParams[stCharInfo.Level - 1].nAccumExp;
    }
    // End:0x16b
    else
    {
        startExp = 0;
    }
    maxExp = GameMgr.LevelInfoParams[stCharInfo.Level].nAccumExp;
    levelExp = maxExp - startExp;
    // End:0x1bc
    if(levelExp <= 0)
    {
        strPerc = "0";
    }
    // End:0x1e9
    else
    {
        strPerc = string(int(float(stCharInfo.Exp - startExp) / float(levelExp) * 100.0));
    }
    BTTPTwoExpBarHK(Content[2]).expbar[idx].SetData(stCharInfo.Exp - startExp, levelExp, string(stCharInfo.Exp) $ "/" $ string(maxExp), "(" $ strPerc $ "%)");
    BTTPTwoColumnLabelHK(Content[3]).Label[idx].SetData(string(stCharInfo.Win + stCharInfo.Lose) $ strRound $ " " $ string(stCharInfo.Win) $ strWin $ " / " $ string(stCharInfo.Lose) $ strLose);
    BTTPTwoColumnLabelHK(Content[4]).Label[idx].SetData(string(stCharInfo.HeadShot2) @ strHeadShot);
    BTTPTwoColumnLabelHK(Content[5]).Label[idx].SetRankData(string(stCharInfo.Ranking) @ strRank, stCharInfo.Ranking - stCharInfo.PrevRanking);
    BTTPTwoColumnLabelHK(Content[6]).Label[idx].SetRankData(string(stCharInfo.MonthlyRanking) @ strRank, stCharInfo.MonthlyRanking - stCharInfo.MonthlyPrevRanking);
    BTTPTwoColumnLabelHK(Content[7]).Label[idx].SetRankData(string(stCharInfo.WomanRanking) @ strRank, stCharInfo.WomanRanking - stCharInfo.PrevWomanRanking);
    BTTPTwoColumnLabelHK(Content[8]).Label[idx].SetRankData(string(stCharInfo.MonthlyWomanRanking) @ strRank, stCharInfo.MonthlyWomanRanking - stCharInfo.MonthlyPrevWomanRanking);
    BTTPTwoColumnLabelHK(Content[9]).Label[idx].SetRankData(string(stCharInfo.HeadShotRanking) @ strRank, stCharInfo.HeadShotRanking - stCharInfo.PrevHeadShotRanking);
    BTTPTwoColumnLabelHK(Content[10]).Label[idx].SetRankData(string(stCharInfo.MonthlyHeadShotRanking) @ strRank, stCharInfo.MonthlyHeadShotRanking - stCharInfo.MonthlyPrevHeadShotRanking);
    BTTPTwoColumnLabelHK(Content[11]).Label[idx].SetData(string(stCharInfo.ClanContribue));
    BTTPTwoColumnLabelHK(Content[12]).Label[idx].SetData(string(stCharInfo.ClanWin + stCharInfo.ClanLose) $ strRound $ " " $ string(stCharInfo.ClanWin) $ strWin $ " / " $ string(stCharInfo.ClanLose) $ strLose);
    BTTPTwoColumnLabelHK(Content[13]).Label[idx].SetData(string(stCharInfo.ClanKill) $ strKill $ " / " $ string(stCharInfo.ClanAssist) $ strAssist $ " / " $ string(stCharInfo.ClanDeath) $ strDeath);
    BTTPTwoColumnLabelHK(Content[14]).Label[idx].SetData(string(stCharInfo.ClanHeadshot) $ strHeadShot);
    BTTPTwoColumnLabelHK(Content[15]).Label[idx].SetData(string(0) $ " " $ strDiscon);
    BTTPTwoColumnLabelHK(Content[16]).Label[idx].SetRankData(string(stCharInfo.ClanRanking) @ strRank, stCharInfo.ClanRanking - stCharInfo.ClanRankingPrev);
    BTTPTwoColumnLabelHK(Content[17]).Label[idx].SetRankData(string(stCharInfo.ClanRankingMonthly) @ strRank, stCharInfo.ClanRankingMonthly - stCharInfo.ClanRankingMonthlyPrev);
    BTTPTwoColumnLabelHK(Content[18]).Label[idx].SetData(string(stCharInfo.DisCon));
    Day = stCharInfo.TotPlayTime / 86400;
    Hour = int(float(stCharInfo.TotPlayTime) % float(86400)) / 3600;
    // End:0x7c6
    if(Day > 0)
    {
        BTTPTwoColumnLabelHK(Content[19]).Label[idx].SetData(string(Day) @ strDay @ string(Hour) @ strHour);
    }
    // End:0x7fa
    else
    {
        BTTPTwoColumnLabelHK(Content[19]).Label[idx].SetData(string(Hour) @ strHour);
    }
}

function string GetSelectedFriendlyUserName()
{
    return ComboFriendlyUser.ComboBox.GetItem(ComboFriendlyUser.ComboBox.GetIndex());
}

function InitializeContent()
{
    Content[0] = NewComponent(new class'BTTPLabelNComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.780);
    ComboFriendlyUser = BTTPLabelNComboBoxHK(Content[0]).ComboBox;
    ComboFriendlyUser.ComboBox.Edit.bReadOnly = true;
    ComboFriendlyUser.ComboBox.__OnChange__Delegate = OnChange_ComboFriendlyUser;
    ComboFriendlyUser.ComboBox.__OnHideList__Delegate = OnHide_ComboFriendlyUserList;
    ComboFriendlyUser.ComboBox.MaxVisibleItems = 10;
    Content[1] = NewComponent(new class'BTOwnerDrawTwoLevelImgNClanMarkHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    Content[2] = NewComponent(new class'BTTPTwoExpBarHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.770);
    BTTPTwoExpBarHK(Content[2]).expbar[1].SetData(0, 100, "0/0", "(0%)");
    InternalPadding[2].Y1 = 8.0;
    InternalPadding[2].Y2 = 8.0;
    Content[3] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[4] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[5] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[6] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[7] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[8] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[9] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[10] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[11] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[12] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[13] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[14] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[15] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[16] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[17] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[18] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[19] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[20] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[21] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
    Content[22] = NewComponent(new class'BTTPTwoColumnLabelHK', class'BTCustomDrawHK'.static.MakeEmptyBox(), 0.760);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ACLList.SetItemCountPerPage(17, 1);
    Label.Length = 20;
    Content.Length = 20;
    InternalPadding.Length = 20;
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
    FillComoboFriendlyUser();
}

function OnChange_ComboFriendlyUser(GUIComponent Sender)
{
    OnChangeFriendlyUser();
}

function OnHide_ComboFriendlyUserList()
{
    OnHideFriendlyUserList();
}

function FillComoboFriendlyUser()
{
    local int i;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ComboFriendlyUser.ComboBox.List.Clear();
    i = 0;
    J0x58:
    // End:0xac [While If]
    if(i < MM.kFriendList.Length)
    {
        ComboFriendlyUser.ComboBox.AddItem(MM.kFriendList[i].UserName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    i = 0;
    J0xb3:
    // End:0x170 [While If]
    if(i < MM.kClanList.Length)
    {
        // End:0x166
        if(MM.kClanList[i].UserName != MM.kUserName && ComboFriendlyUser.ComboBox.FindIndex(MM.kClanList[i].UserName) == -1)
        {
            ComboFriendlyUser.ComboBox.AddItem(MM.kClanList[i].UserName);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb3;
    }
    ComboFriendlyUser.ComboBox.SetIndex(0);
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
}

defaultproperties
{
    strLabel[1]="Clan"
    strLabel[2]="EXP"
    strLabel[3]="Records"
    strLabel[4]="Headshots"
    strLabel[5]="Overall Rank"
    strLabel[6]="Overall Rank (M)"
    strLabel[7]="Women's Rank"
    strLabel[8]="Women's Rank (M)"
    strLabel[9]="Headshot Rank"
    strLabel[10]="Headshot Rank (M)"
    strLabel[11]="Clan Contribution"
    strLabel[12]="Clan Battle Record"
    strLabel[13]="Clan Battle Info"
    strLabel[14]="Clan Headshots"
    strLabel[15]="Clan Withdrawals"
    strLabel[16]="Clan Rank"
    strLabel[17]="Clan Rank (M)"
    strLabel[18]="Forced Quits"
    strLabel[19]="Total Play Time"
    ItemWidth=468
    LabelWidth=114
    fbACLList=(X1=201.0,Y1=81.0,X2=826.0,Y2=691.0)
}