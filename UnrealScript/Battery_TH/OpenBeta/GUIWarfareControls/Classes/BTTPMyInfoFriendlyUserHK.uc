class BTTPMyInfoFriendlyUserHK extends BTTPOptionBaseHK
    editinlinenew
    instanced;

var FloatBox fbComboBox;
var() automated BTOwnerDrawImageHK LabelMyName;
var() automated BTComboBoxHK ComboFriendlyUser;
var localized string strLabel[20];
//var delegate<OnChangeFriendlyUser> __OnChangeFriendlyUser__Delegate;
//var delegate<OnHideFriendlyUserList> __OnHideFriendlyUserList__Delegate;

delegate OnChangeFriendlyUser()
{
    //return;    
}

delegate OnHideFriendlyUserList()
{
    //return;    
}

function SetData(bool bMyInfo, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, ClanInfo stClanInfo, int ClanLevel)
{
    local int idx, startExp, maxExp, levelExp, Day, Hour;

    local string strPerc;
    local wGameManager GameMgr;
    local wMatchMaker MM;

    // End:0x7B
    if(bMyInfo)
    {
        idx = 0;
        BTTPLabelNComboBoxHK(Content[0]).Label.Caption = CharName;
        BTOwnerDrawTwoLevelImgNClanMarkHK(Content[1]).SetData(bMyInfo, stCharInfo.Level, stCharInfo.LevelMarkID, CM_Pattern, CM_BG, CM_BL, ClanLevel);        
    }
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
    else
    {
        startExp = 0;
    }
    maxExp = GameMgr.LevelInfoParams[stCharInfo.Level].nAccumExp;
    levelExp = maxExp - startExp;
    // End:0x1BC
    if(levelExp <= 0)
    {
        strPerc = "0";        
    }
    else
    {
        strPerc = string(int((float(stCharInfo.Exp - startExp) / float(levelExp)) * 100.0000000));
    }
    BTTPTwoExpBarHK(Content[2]).expbar[idx].SetData(stCharInfo.Exp - startExp, levelExp, (string(stCharInfo.Exp) $ "/") $ string(maxExp), ("(" $ strPerc) $ "%)");
    BTTPTwoColumnLabelHK(Content[3]).Label[idx].SetData(((((((string(stCharInfo.Win + stCharInfo.Lose) $ strRound) $ " ") $ string(stCharInfo.Win)) $ strWin) $ " / ") $ string(stCharInfo.Lose)) $ strLose);
    BTTPTwoColumnLabelHK(Content[4]).Label[idx].SetData(string(stCharInfo.HeadShot2) @ strHeadShot);
    BTTPTwoColumnLabelHK(Content[5]).Label[idx].SetRankData(string(stCharInfo.Ranking) @ strRank, stCharInfo.Ranking - stCharInfo.PrevRanking);
    BTTPTwoColumnLabelHK(Content[6]).Label[idx].SetRankData(string(stCharInfo.MonthlyRanking) @ strRank, stCharInfo.MonthlyRanking - stCharInfo.MonthlyPrevRanking);
    BTTPTwoColumnLabelHK(Content[7]).Label[idx].SetRankData(string(stCharInfo.WomanRanking) @ strRank, stCharInfo.WomanRanking - stCharInfo.PrevWomanRanking);
    BTTPTwoColumnLabelHK(Content[8]).Label[idx].SetRankData(string(stCharInfo.MonthlyWomanRanking) @ strRank, stCharInfo.MonthlyWomanRanking - stCharInfo.MonthlyPrevWomanRanking);
    BTTPTwoColumnLabelHK(Content[9]).Label[idx].SetRankData(string(stCharInfo.HeadShotRanking) @ strRank, stCharInfo.HeadShotRanking - stCharInfo.PrevHeadShotRanking);
    BTTPTwoColumnLabelHK(Content[10]).Label[idx].SetRankData(string(stCharInfo.MonthlyHeadShotRanking) @ strRank, stCharInfo.MonthlyHeadShotRanking - stCharInfo.MonthlyPrevHeadShotRanking);
    BTTPTwoColumnLabelHK(Content[11]).Label[idx].SetData(string(stCharInfo.ClanContribue));
    BTTPTwoColumnLabelHK(Content[12]).Label[idx].SetData(((((((string(stCharInfo.ClanWin + stCharInfo.ClanLose) $ strRound) $ " ") $ string(stCharInfo.ClanWin)) $ strWin) $ " / ") $ string(stCharInfo.ClanLose)) $ strLose);
    BTTPTwoColumnLabelHK(Content[13]).Label[idx].SetData(((((((string(stCharInfo.ClanKill) $ strKill) $ " / ") $ string(stCharInfo.ClanAssist)) $ strAssist) $ " / ") $ string(stCharInfo.ClanDeath)) $ strDeath);
    BTTPTwoColumnLabelHK(Content[14]).Label[idx].SetData(string(stCharInfo.ClanHeadshot) $ strHeadShot);
    BTTPTwoColumnLabelHK(Content[15]).Label[idx].SetData((string(0) $ " ") $ strDiscon);
    BTTPTwoColumnLabelHK(Content[16]).Label[idx].SetRankData(string(stCharInfo.ClanRanking) @ strRank, stCharInfo.ClanRanking - stCharInfo.ClanRankingPrev);
    BTTPTwoColumnLabelHK(Content[17]).Label[idx].SetRankData(string(stCharInfo.ClanRankingMonthly) @ strRank, stCharInfo.ClanRankingMonthly - stCharInfo.ClanRankingMonthlyPrev);
    BTTPTwoColumnLabelHK(Content[18]).Label[idx].SetData(string(stCharInfo.DisCon));
    Day = stCharInfo.TotPlayTime / 86400;
    Hour = int(float(stCharInfo.TotPlayTime) % float(86400)) / 3600;
    // End:0x7C6
    if(Day > 0)
    {
        BTTPTwoColumnLabelHK(Content[19]).Label[idx].SetData(((string(Day) @ strDay) @ string(Hour)) @ strHour);        
    }
    else
    {
        BTTPTwoColumnLabelHK(Content[19]).Label[idx].SetData(string(Hour) @ strHour);
    }
    //return;    
}

function string GetSelectedFriendlyUserName()
{
    return ComboFriendlyUser.ComboBox.GetItem(ComboFriendlyUser.ComboBox.GetIndex());
    //return;    
}

function InitializeContent()
{
    Content[0] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPLabelNComboBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7800000);
    ComboFriendlyUser = BTTPLabelNComboBoxHK(Content[0]).ComboBox;
    ComboFriendlyUser.ComboBox.Edit.bReadOnly = true;
    ComboFriendlyUser.ComboBox.__OnChange__Delegate = OnChange_ComboFriendlyUser;
    ComboFriendlyUser.ComboBox.__OnHideList__Delegate = OnHide_ComboFriendlyUserList;
    ComboFriendlyUser.ComboBox.MaxVisibleItems = 10;
    Content[1] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTwoLevelImgNClanMarkHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    Content[2] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoExpBarHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7700000);
    BTTPTwoExpBarHK(Content[2]).expbar[1].SetData(0, 100, "0/0", "(0%)");
    InternalPadding[2].Y1 = 8.0000000;
    InternalPadding[2].Y2 = 8.0000000;
    Content[3] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[4] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[5] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[6] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[7] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[8] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[9] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[10] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[11] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[12] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[13] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[14] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[15] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[16] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[17] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[18] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[19] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[20] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[21] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    Content[22] = NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPTwoColumnLabelHK', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), 0.7600000);
    //return;    
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

    // End:0x8A [Loop If]
    if(i < InternalPadding.Length)
    {
        InternalPadding[i].Y1 = 3.0000000;
        InternalPadding[i].Y2 = 4.0000000;
        i++;
        // [Loop Continue]
        goto J0x44;
    }
    InitializeLabel();
    InitializeContent();
    ACLList_PositionChanged(0);
    FillComoboFriendlyUser();
    //return;    
}

function OnChange_ComboFriendlyUser(GUIComponent Sender)
{
    OnChangeFriendlyUser();
    //return;    
}

function OnHide_ComboFriendlyUserList()
{
    OnHideFriendlyUserList();
    //return;    
}

function FillComoboFriendlyUser()
{
    local int i;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ComboFriendlyUser.ComboBox.List.Clear();
    i = 0;
    J0x58:

    // End:0xAC [Loop If]
    if(i < MM.kFriendList.Length)
    {
        ComboFriendlyUser.ComboBox.AddItem(MM.kFriendList[i].UserName);
        ++i;
        // [Loop Continue]
        goto J0x58;
    }
    i = 0;
    J0xB3:

    // End:0x170 [Loop If]
    if(i < MM.kClanList.Length)
    {
        // End:0x166
        if((MM.kClanList[i].UserName != MM.kUserName) && ComboFriendlyUser.ComboBox.FindIndex(MM.kClanList[i].UserName) == -1)
        {
            ComboFriendlyUser.ComboBox.AddItem(MM.kClanList[i].UserName);
        }
        ++i;
        // [Loop Continue]
        goto J0xB3;
    }
    ComboFriendlyUser.ComboBox.SetIndex(0);
    //return;    
}

function InitializeLabel()
{
    local int i;
    local RenderObject ro;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    J0x37:

    // End:0xFE [Loop If]
    if(i < Label.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.RenderObject';
        ro.Init();
        ACLList.AddRenderObject(ro);
        Label[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox(), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].SetDefaultFontColor();
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x37;
    }
    //return;    
}

defaultproperties
{
    strLabel[1]="????"
    strLabel[2]="EXP"
    strLabel[3]="Record"
    strLabel[4]="???????"
    strLabel[5]="Ranking ???????"
    strLabel[6]="Rank/Month"
    strLabel[7]="Ranking ???????"
    strLabel[8]="Rank/Month"
    strLabel[9]="Ranking ???????"
    strLabel[10]="H/S Rank/Month"
    strLabel[11]="?????????????"
    strLabel[12]="Ranking ???????"
    strLabel[13]="?????? ClanMode"
    strLabel[14]="H/s Clan"
    strLabel[15]="???"
    strLabel[16]="Clan Rank"
    strLabel[17]="Clan Rank"
    strLabel[18]="?????????"
    strLabel[19]="???????????????"
    ItemWidth=468
    LabelWidth=114
    fbACLList=(X1=523.0000000,Y1=126.0000000,X2=1004.0000000,Y2=736.0000000)
}