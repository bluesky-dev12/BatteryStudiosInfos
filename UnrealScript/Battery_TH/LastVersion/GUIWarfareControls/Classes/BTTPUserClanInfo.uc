class BTTPUserClanInfo extends BTTabPanelHK
    editinlinenew
    instanced;

const LABEL_COUNT = 11;

enum E_CLANEDIT
{
    ECE_NAME,                       // 0
    ECE_LEVEL,                      // 1
    ECE_PERSON_GRADE,               // 2
    ECE_PERSON_ACTIVITY,            // 3
    ECE_PERSON_MONTH_CONNECT_COUNT, // 4
    ECE_PERSON_SCORE,               // 5
    ECE_CLAN_SCORE,                 // 6
    ECE_CLAN_RANK,                  // 7
    ECE_CLAN_MONTH_RANK,            // 8
    ECE_CLAN_MONTH_CONNECT_RANK,    // 9
    ECE_CLAN_INTRODUCTION           // 10
};

var string UserClanName;
var localized string strPersonalInfo;
var localized string strClanCommonInfo;
var() automated FloatBox fbLabelPersonalInfo;
var() automated FloatBox fbLabelClanCommonInfo;
var export editinline BTOwnerDrawImageHK PersonalInfo;
var export editinline BTOwnerDrawImageHK ClanCommonInfo;
var localized string strLabel[11];
var() automated FloatBox fbLabel[11];
var export editinline BTOwnerDrawImageHK Label[11];
var localized string strEdit[11];
var() automated FloatBox fbEdit[11];
var export editinline BTOwnerDrawTextArrayHK Edit[11];
var() automated FloatBox fbLabelClanMark;
var export editinline BTLabelClanMarkHK LabelClanMark;
var() automated FloatBox fbExpBar;
var export editinline BTExpBarHK expbar;
var FloatBox fbSelfIntroduction;
var export editinline BTAutoScrollListHK SelfIntroduction;
var localized string strDefaultSelfIntro;
var localized string strNoRankState;
var localized string strClanGrade[5];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0xEC [Loop If]
    if(i < 11)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 5;
        Label[i].Caption = strLabel[i];
        Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', fbEdit[i]));
        Edit[i].CaptionDrawType = 3;
        Edit[i].BackgroundImage.Image = none;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Label[int(0)].CaptionDrawType = 3;
    Label[int(1)].CaptionDrawType = 3;
    Edit[int(1)].SetFontColorAll(Class'Engine.Canvas'.static.MakeColor(178, 233, 31, byte(255)));
    PersonalInfo = NewLabelComponent(fbLabelPersonalInfo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    PersonalInfo.Caption = strPersonalInfo;
    PersonalInfo.CaptionDrawType = 3;
    PersonalInfo.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    ClanCommonInfo = NewLabelComponent(fbLabelClanCommonInfo, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    ClanCommonInfo.Caption = strClanCommonInfo;
    ClanCommonInfo.CaptionDrawType = 3;
    ClanCommonInfo.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon());
    LabelClanMark = BTLabelClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelClanMarkHK', fbLabelClanMark));
    expbar = BTExpBarHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTExpBarHK', fbExpBar));
    expbar.Ro.back = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_myinfopopup_exp_back;
    expbar.Ro.Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_myinfopopup_exp_gauge;
    expbar.Ro.GaugePadding[0] = 7.0000000;
    expbar.Ro.GaugePadding[1] = 5.0000000;
    expbar.Ro.GaugePadding[2] = 7.0000000;
    expbar.Ro.GaugePadding[3] = 9.0000000;
    SelfIntroduction = BTAutoScrollListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK', fbSelfIntroduction));
    SelfIntroduction.bAutoShowScrollBar = true;
    SelfIntroduction.bFixScroll = true;
    SelfIntroduction.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    //return;    
}

function SetClanData(string ClanName, int ClanLevel, int CM_Pattern, int CM_BG, int CM_BL, int ClanExp, byte ClanGrade, int ClanActivity, int MonthlyConnectingCount, int UserClanWin, int UserClanLose, int UserClanDraw, int ClanWin, int ClanLose, int ClanDraw, int PreClanTotalRankCur, int ClanTotalRankCur, int PreClanMonthlyRankCur, int ClanMonthlyRankCur, int PreClanMonthlyConnectingRank, int ClanMonthlyConnectingRank, string ClanIntro)
{
    local int nPerc, startExp, maxExp;
    local string strPerc;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    UserClanName = ClanName;
    Edit[int(0)].SetData(ClanName);
    Edit[int(1)].SetData(GameMgr.GetClanLevelName(ClanLevel));
    LabelClanMark.SetData(CM_Pattern, CM_BG, CM_BL, false, ClanLevel);
    // End:0xD4
    if(ClanLevel >= 2)
    {
        startExp = GameMgr.ClanLevelInfoParams[ClanLevel - 1].nAccumExp;        
    }
    else
    {
        startExp = 0;
    }
    // End:0x138
    if(ClanLevel > 0)
    {
        maxExp = GameMgr.ClanLevelInfoParams[ClanLevel].nAccumExp;
        strPerc = string(int((float(ClanExp - startExp) / float(maxExp - startExp)) * 100.0000000));
    }
    expbar.SetData(ClanExp - startExp, maxExp - startExp, (string(ClanExp) $ "/") $ string(maxExp), ("(" $ strPerc) $ "%)");
    Edit[int(2)].SetData(strClanGrade[int(ClanGrade)]);
    Edit[int(3)].SetData(string(ClanActivity));
    Edit[int(4)].SetData(string(MonthlyConnectingCount));
    // End:0x1F7
    if((UserClanWin + UserClanLose) == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((100.0000000 * float(UserClanWin)) / float(UserClanWin + UserClanLose));
    }
    Edit[int(5)].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(5)], string(UserClanWin + UserClanLose), string(UserClanWin), string(UserClanLose), string(nPerc)));
    // End:0x289
    if((ClanWin + ClanLose) == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((100.0000000 * float(ClanWin)) / float(ClanWin + ClanLose));
    }
    Edit[int(6)].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(6)], string(ClanWin + ClanLose), string(ClanWin), string(ClanLose), string(nPerc)));
    // End:0x326
    if(ClanTotalRankCur == 0)
    {
        Edit[int(7)].SetData(strNoRankState);        
    }
    else
    {
        Edit[int(7)].SetRankData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(7)], string(ClanTotalRankCur)), ClanTotalRankCur - PreClanTotalRankCur);
    }
    // End:0x38D
    if(ClanMonthlyRankCur == 0)
    {
        Edit[int(8)].SetData(strNoRankState);        
    }
    else
    {
        Edit[int(8)].SetRankData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(8)], string(ClanMonthlyRankCur)), ClanMonthlyRankCur - PreClanMonthlyRankCur);
    }
    // End:0x3F4
    if(ClanMonthlyConnectingRank == 0)
    {
        Edit[int(9)].SetData(strNoRankState);        
    }
    else
    {
        Edit[int(9)].SetRankData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(9)], string(ClanMonthlyConnectingRank)), ClanMonthlyConnectingRank - PreClanMonthlyConnectingRank);
    }
    // End:0x458
    if(ClanIntro == "")
    {
        SelfIntroduction.AddLineRow(none, strDefaultSelfIntro);        
    }
    else
    {
        SelfIntroduction.AddLineRow(none, ClanIntro);
    }
    //return;    
}

defaultproperties
{
    fbLabelPersonalInfo=(X1=448.0000000,Y1=278.0000000,X2=581.0000000,Y2=291.0000000)
    fbLabelClanCommonInfo=(X1=448.0000000,Y1=447.0000000,X2=581.0000000,Y2=460.0000000)
    fbLabel[0]=(X1=448.0000000,Y1=183.0000000,X2=581.0000000,Y2=196.0000000)
    fbLabel[1]=(X1=448.0000000,Y1=216.0000000,X2=581.0000000,Y2=229.0000000)
    fbLabel[2]=(X1=439.0000000,Y1=311.0000000,X2=572.0000000,Y2=324.0000000)
    fbLabel[3]=(X1=439.0000000,Y1=344.0000000,X2=572.0000000,Y2=357.0000000)
    fbLabel[4]=(X1=439.0000000,Y1=377.0000000,X2=572.0000000,Y2=390.0000000)
    fbLabel[5]=(X1=439.0000000,Y1=410.0000000,X2=572.0000000,Y2=423.0000000)
    fbLabel[6]=(X1=439.0000000,Y1=480.0000000,X2=572.0000000,Y2=493.0000000)
    fbLabel[7]=(X1=439.0000000,Y1=513.0000000,X2=572.0000000,Y2=526.0000000)
    fbLabel[8]=(X1=439.0000000,Y1=547.0000000,X2=572.0000000,Y2=560.0000000)
    fbLabel[9]=(X1=439.0000000,Y1=580.0000000,X2=572.0000000,Y2=593.0000000)
    fbLabel[10]=(X1=439.0000000,Y1=613.0000000,X2=572.0000000,Y2=626.0000000)
    fbEdit[0]=(X1=647.0000000,Y1=183.0000000,X2=942.0000000,Y2=196.0000000)
    fbEdit[1]=(X1=600.0000000,Y1=216.0000000,X2=639.0000000,Y2=229.0000000)
    fbEdit[2]=(X1=600.0000000,Y1=311.0000000,X2=942.0000000,Y2=324.0000000)
    fbEdit[3]=(X1=600.0000000,Y1=344.0000000,X2=942.0000000,Y2=357.0000000)
    fbEdit[4]=(X1=600.0000000,Y1=377.0000000,X2=942.0000000,Y2=390.0000000)
    fbEdit[5]=(X1=600.0000000,Y1=410.0000000,X2=942.0000000,Y2=423.0000000)
    fbEdit[6]=(X1=600.0000000,Y1=480.0000000,X2=942.0000000,Y2=493.0000000)
    fbEdit[7]=(X1=600.0000000,Y1=513.0000000,X2=942.0000000,Y2=526.0000000)
    fbEdit[8]=(X1=600.0000000,Y1=547.0000000,X2=942.0000000,Y2=560.0000000)
    fbEdit[9]=(X1=600.0000000,Y1=580.0000000,X2=942.0000000,Y2=593.0000000)
    fbEdit[10]=(X1=600.0000000,Y1=613.0000000,X2=942.0000000,Y2=626.0000000)
    fbLabelClanMark=(X1=598.0000000,Y1=171.0000000,X2=632.0000000,Y2=205.0000000)
    fbExpBar=(X1=643.0000000,Y1=210.0000000,X2=895.0000000,Y2=238.0000000)
    fbSelfIntroduction=(X1=600.0000000,Y1=613.0000000,X2=942.0000000,Y2=645.0000000)
}