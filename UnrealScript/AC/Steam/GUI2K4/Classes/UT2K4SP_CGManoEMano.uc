/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_CGManoEMano.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:32
 *	Functions:16
 *
 *******************************************************************************/
class UT2K4SP_CGManoEMano extends LargeWindow
    dependson(UT2K4SPTab_DetailEnemies)
    editinlinenew
    instanced;

struct ChallengeSettingRecord
{
    var string Acronym;
    var int GoalScore;
    var string GameType;
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMap1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMap2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMapBg1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMapBg2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoPreview1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoPreview2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblMinMaxBet;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblBalance;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton cbMap1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton cbMap2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cbEnemyTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moFormatNumEdit neBet;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbDetails;
var UT2K4GameProfile GP;
var int CancelPenalty;
var MapRecord MapOptions[2];
var int MinimalBet;
var string ChallengedBy;
var bool bChallenged;
var localized string PenaltyWarning;
var localized string YouveBeenChallenged;
var localized string SelectAMap;
var localized string msgChallenge;
var localized string msgChallenged;
var localized string NotEnoughCash;
var localized string msgMinMaxBet;
var string DefaultUrl;
var array<string> ChalMaps;
var array<ChallengeSettingRecord> ChallengeSettings;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local class<UT2K4TeamRoster> ET;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    i = 0;
    J0x40:
    // End:0x88 [While If]
    if(i < Controls.Length)
    {
        Controls[i].bScaleToParent = true;
        Controls[i].bBoundToParent = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    cbEnemyTeam.MyComboBox.List.Clear();
    i = 0;
    J0xb0:
    // End:0x1af [While If]
    if(i < GP.TeamStats.Length)
    {
        // End:0x1a5
        if(GP.TeamStats[i].Matches > 0)
        {
            // End:0x10b
            if(GP.TeamStats[i].Level >= 3)
            {
            }
            // End:0x1a5
            else
            {
                ET = class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[i].Name, class'Class'));
                // End:0x1a5
                if(ET != none)
                {
                    cbEnemyTeam.AddItem(ET.default.TeamName @ "(" $ class'UT2K4SPTab_DetailEnemies'.default.StrengthLabels[ET.default.TeamLevel] $ ")",, GP.TeamStats[i].Name);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb0;
    }
    cbEnemyTeam.MyComboBox.List.Sort();
    cbEnemyTeam.SetIndex(0);
    SetupNoPreview(lblNoPreview1, imgMap1);
    SetupNoPreview(lblNoPreview2, imgMap2);
    sbDetails.SetContent(SelectAMap);
    lblBalance.Caption = class'UT2K4SPTab_LadderBase'.default.BalanceLabel @ GP.MoneyToString(GP.Balance);
}

function GetRandomMaps()
{
    local int m1, m2;

    m1 = -1;
    m2 = -1;
    // End:0x37
    if(MapOptions[0].MapName == "")
    {
        m1 = Rand(ChalMaps.Length);
    }
    // End:0x5b [While If]
    if(MapOptions[1].MapName == "")
    {
        m2 = Rand(ChalMaps.Length);
        JumpToken-JumpToken(System.InvalidCastException: Unable to cast object of type 'EndFunctionParmsToken' to type 'JumpToken'.
   at UELib.Core.UStruct.UByteCodeDecompiler.JumpToken.Decompile()
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile())
    }
    // This is an implied JumpToken;
    goto J0x6d;
    J0x5e:
    // End:0x37
    if(m1 != m2)
    	goto J0x37;
    J0x6d:
    // End:0x9b
    if(m1 > -1)
    {
        MapOptions[0] = class'CacheManager'.static.GetMapRecord(ChalMaps[m1]);
    }
    // End:0xc9
    if(m2 > -1)
    {
        MapOptions[1] = class'CacheManager'.static.GetMapRecord(ChalMaps[m2]);
    }
    // End:0x107
    if(MapOptions[0].ScreenshotRef != "")
    {
        imgMap1.Image = Material(DynamicLoadObject(MapOptions[0].ScreenshotRef, class'Material'));
    }
    lblNoPreview1.bVisible = MapOptions[0].ScreenshotRef == "";
    cbMap1.Caption = MapOptions[0].MapName;
    // End:0x180
    if(MapOptions[1].ScreenshotRef != "")
    {
        imgMap2.Image = Material(DynamicLoadObject(MapOptions[1].ScreenshotRef, class'Material'));
    }
    lblNoPreview2.bVisible = MapOptions[1].ScreenshotRef == "";
    cbMap2.Caption = MapOptions[1].MapName;
}

function setChallengeInfo(int selectedMap)
{
    local string Desc;
    local class<UT2K4TeamRoster> ETI;
    local GameRecord GR;
    local int chalset;

    chalset = 0;
    J0x07:
    // End:0x49 [While If]
    if(chalset < ChallengeSettings.Length)
    {
        // End:0x3f
        if(ChallengeSettings[chalset].Acronym ~= MapOptions[selectedMap].Acronym)
        {
        }
        // End:0x49
        else
        {
            ++ chalset;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    GR = class'CacheManager'.static.GetGameRecord(ChallengeSettings[chalset].GameType);
    ETI = class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), class'Class'));
    GP.ChallengeInfo.LevelName = MapOptions[selectedMap].MapName;
    GP.ChallengeInfo.NumBots = 1;
    GP.ChallengeInfo.DifficultyModifier = float(ETI.default.TeamLevel) / 1.20;
    // End:0x149
    if(GP.ChallengeInfo.LevelName ~= "CTF-1on1-Joust")
    {
        GP.ChallengeInfo.DifficultyModifier += float(2);
    }
    GP.ChallengeInfo.PrizeMoney = neBet.GetValue() * 2;
    GP.ChallengeInfo.GameType = ChallengeSettings[chalset].GameType;
    GP.ChallengeInfo.GoalScore = float(ChallengeSettings[chalset].GoalScore);
    GP.ChallengeInfo.EntryFee = neBet.GetValue();
    GP.ChallengeInfo.URLString = DefaultUrl;
    // End:0x221
    if(bChallenged)
    {
        Desc = msgChallenged;
    }
    // End:0x22c
    else
    {
        Desc = msgChallenge;
    }
    Desc = Repl(Desc, "%map%", MapOptions[selectedMap].MapName);
    Desc = Repl(Desc, "%teamname%", cbEnemyTeam.GetText());
    // End:0x2b9
    if(ETI.default.TeamLeader != "")
    {
        Desc = Repl(Desc, "%teamleader%", ETI.default.TeamLeader);
    }
    // End:0x2e4
    else
    {
        Desc = Repl(Desc, "%teamleader%", ETI.default.RosterNames[0]);
    }
    Desc = Repl(Desc, "%prizemoney%", GP.MoneyToString(GP.ChallengeInfo.PrizeMoney));
    Desc = Repl(Desc, "%entryfee%", GP.MoneyToString(GP.ChallengeInfo.EntryFee));
    Desc = Repl(Desc, "%gametype%", GR.GameName);
    Desc = Repl(Desc, "%penalty%", GP.MoneyToString(CancelPenalty));
    sbDetails.SetContent(Desc);
    // End:0x439
    if(GP.ChallengeInfo.LevelName != "" && GP.Balance > GP.getMinimalEntryFeeFor(GP.ChallengeInfo) + GP.MinBalance)
    {
        btnOk.EnableMe();
    }
    // End:0x448
    else
    {
        btnOk.DisableMe();
    }
}

event HandleParameters(string Param1, string Param2)
{
    local GUIController MyController;

    ChallengedBy = Param1;
    // End:0x3a
    if(ChallengedBy != "")
    {
        cbEnemyTeam.SetIndex(cbEnemyTeam.FindExtra(ChallengedBy));
    }
    bChallenged = Param2 != "";
    // End:0xec
    if(bChallenged)
    {
        MinimalBet = MinimalBet + Rand(MinimalBet);
        CancelPenalty = int(float(MinimalBet) * 1.50);
        cbEnemyTeam.DisableMe();
        // End:0xe9
        if(GP.CurrentLadder == GP.UT2K4GameLadder.default.LID_CTF)
        {
            // End:0xe9
            if(FRand() > 0.50)
            {
                MapOptions[Rand(2)] = class'CacheManager'.static.GetMapRecord("CTF-1on1-Joust");
            }
        }
    }
    // End:0x11c
    else
    {
        ChalMaps.Length = ChalMaps.Length + 1;
        ChalMaps[ChalMaps.Length - 1] = "CTF-1on1-Joust";
    }
    neBet.Setup(MinimalBet, GP.Balance, GP.Balance - MinimalBet / 20);
    UpdateTeamDetails(cbEnemyTeam);
    // End:0x1f7
    if(GP.Balance - GP.MinBalance < MinimalBet || GP.Balance - GP.MinBalance < CancelPenalty)
    {
        CancelPenalty = 0;
        MyController = Controller;
        Controller.CloseMenu(true);
        // End:0x1e1
        if(bChallenged)
        {
            return;
        }
        MyController.ShowQuestionDialog(NotEnoughCash);
        return;
    }
    GetRandomMaps();
}

function bool onOkClick(GUIComponent Sender)
{
    GP.EnemyTeam = cbEnemyTeam.GetExtra();
    GP.ChallengeInfo.EnemyTeamName = GP.EnemyTeam;
    GP.bGotChallenged = bChallenged;
    GP.ChallengeVariable = GP.MoneyToString(neBet.GetValue());
    class'ManoEMano'.static.StartChallenge(GP, PlayerOwner().Level);
    Controller.CloseAll(false, true);
    return true;
}

function bool onCancelClick(GUIComponent Sender)
{
    // End:0x1e
    if(OnCanWindowClose(true))
    {
        return Controller.CloseMenu(true);
    }
    // End:0x20
    else
    {
        return false;
    }
}

function OnConfirmCancel(byte bButton)
{
    // End:0x3a
    if(bButton == 16)
    {
        GP.Balance -= CancelPenalty;
        CancelPenalty = 0;
        Controller.CloseMenu(true);
    }
}

function OnMapSelect(GUIComponent Sender)
{
    // End:0x51
    if(Sender == cbMap1)
    {
        GP.ActiveMap = MapOptions[0];
        cbMap1.bChecked = true;
        cbMap2.bChecked = false;
        setChallengeInfo(0);
    }
    // End:0x90
    else
    {
        GP.ActiveMap = MapOptions[1];
        cbMap1.bChecked = false;
        cbMap2.bChecked = true;
        setChallengeInfo(1);
    }
    return;
}

function OnWindowClose(optional bool bCancelled)
{
    GP.bIsChallenge = !bCancelled;
}

function bool OnCanWindowClose(optional bool bCancelled)
{
    local export editinline GUIQuestionPage QPage;

    // End:0x0d
    if(!bCancelled)
    {
        return true;
    }
    // End:0xb4
    if(CancelPenalty > 0)
    {
        // End:0xb2
        if(Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
        {
            QPage = GUIQuestionPage(Controller.TopPage());
            QPage.SetupQuestion(Repl(PenaltyWarning, "%cancelpenalty%", GP.MoneyToString(CancelPenalty)), 48, 32);
            QPage.__OnButtonClick__Delegate = OnConfirmCancel;
        }
        return false;
    }
    return true;
}

function UpdateDetails(GUIComponent Sender)
{
    // End:0x1c
    if(cbMap1.bChecked)
    {
        setChallengeInfo(0);
    }
    // End:0x35
    else
    {
        // End:0x35
        if(cbMap2.bChecked)
        {
            setChallengeInfo(1);
        }
    }
}

function UpdateTeamDetails(GUIComponent Sender)
{
    local class<UT2K4TeamRoster> ETI;

    ETI = class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), class'Class'));
    neBet.MyNumericEdit.MaxValue = Min(GP.Balance, MinimalBet * ETI.default.TeamLevel + 1 * 2);
    neBet.MyNumericEdit.Step = neBet.MyNumericEdit.MaxValue - neBet.MyNumericEdit.MinValue / 20;
    neBet.SetValue(neBet.GetValue());
    lblMinMaxBet.Caption = Repl(Repl(msgMinMaxBet, "%min%", GP.MoneyToString(MinimalBet)), "%max%", GP.MoneyToString(neBet.MyNumericEdit.MaxValue));
}

event SetVisibility(bool bIsVisible)
{
    super(GUIMultiComponent).SetVisibility(bIsVisible);
    // End:0x62
    if(imgMap1 != none)
    {
        imgMap1.SetVisibility(imgMap1.Image != none);
        // End:0x62
        if(lblNoPreview1 != none)
        {
            lblNoPreview1.SetVisibility(imgMap1.Image == none);
        }
    }
    // End:0xb8
    if(imgMap2 != none)
    {
        imgMap2.SetVisibility(imgMap2.Image != none);
        // End:0xb8
        if(lblNoPreview2 != none)
        {
            lblNoPreview2.SetVisibility(imgMap2.Image == none);
        }
    }
}

protected function SetupNoPreview(GUILabel lbl, GUIImage img)
{
    // End:0x1a
    if(lbl == none || img == none)
    {
        return;
    }
    lbl.WinLeft = img.WinLeft;
    lbl.WinTop = img.WinTop;
    lbl.WinWidth = img.WinWidth;
    lbl.WinHeight = img.WinHeight;
}

function bool XButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function string FormatMoney(int NewValue)
{
    return GP.MoneyToString(NewValue);
}

defaultproperties
{
    begin object name=SPCimgMap1 class=GUIImage
        ImageStyle=2
        WinTop=0.1225310
        WinLeft=0.0222220
        WinWidth=0.4416670
        WinHeight=0.31250
        RenderWeight=0.150
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGManoEMano.SPCimgMap1'
    imgMap1=SPCimgMap1
    begin object name=SPCimgMap2 class=GUIImage
        ImageStyle=2
        WinTop=0.1225310
        WinLeft=0.5361110
        WinWidth=0.4416670
        WinHeight=0.31250
        RenderWeight=0.150
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGManoEMano.SPCimgMap2'
    imgMap2=SPCimgMap2
    begin object name=SPCimgMapBg1 class=GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGManoEMano.SPCimgMapBg1'
    imgMapBg1=SPCimgMapBg1
    begin object name=SPCimgMapBg2 class=GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGManoEMano.SPCimgMapBg2'
    imgMapBg2=SPCimgMapBg2
    begin object name=SPMbtnOk class=GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        WinTop=0.9043980
        WinLeft=0.7100710
        WinWidth=0.2222220
        WinHeight=0.0569440
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
        OnClick=onOkClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGManoEMano.SPMbtnOk'
    btnOk=SPMbtnOk
    begin object name=SPCbtnCancel class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9043980
        WinLeft=0.0503480
        WinWidth=0.2222220
        WinHeight=0.0569440
        RenderWeight=0.20
        TabOrder=2
        bBoundToParent=true
        OnClick=onCancelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGManoEMano.SPCbtnCancel'
    btnCancel=SPCbtnCancel
    begin object name=SPClblTitle class=GUILabel
        Caption="? ? ?"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.026180
        WinLeft=0.0678130
        WinWidth=0.8625010
        WinHeight=0.07750
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGManoEMano.SPClblTitle'
    lblTitle=SPClblTitle
    begin object name=NoPreview class=GUILabel
        Caption="???? ??"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=true
        bMultiLine=true
        VertAlign=1
        WinTop=0.1975310
        WinLeft=0.0222220
        WinWidth=0.4416670
        WinHeight=0.31250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGManoEMano.NoPreview'
    lblNoPreview1=NoPreview
    begin object name=NoPreview class=GUILabel
        Caption="???? ??"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=true
        bMultiLine=true
        VertAlign=1
        WinTop=0.1975310
        WinLeft=0.0222220
        WinWidth=0.4416670
        WinHeight=0.31250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGManoEMano.NoPreview'
    lblNoPreview2=NoPreview
    begin object name=SPClblMinMax class=GUILabel
        FontScale=0
        StyleName="TextLabel"
        WinTop=0.619930
        WinLeft=0.0261460
        WinWidth=0.9527780
        WinHeight=0.0427780
        RenderWeight=0.20
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGManoEMano.SPClblMinMax'
    lblMinMaxBet=SPClblMinMax
    begin object name=SPLlblBalance class=GUILabel
        TextAlign=2
        StyleName="TextLabel"
        WinTop=0.0466670
        WinLeft=0.532360
        WinWidth=0.450
        WinHeight=0.041250
        RenderWeight=0.250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGManoEMano.SPLlblBalance'
    lblBalance=SPLlblBalance
    begin object name=SPCcbMap1 class=GUIGFXButton
        bCheckBox=true
        WinTop=0.4529740
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.06250
        bBoundToParent=true
        OnChange=OnMapSelect
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'UT2K4SP_CGManoEMano.SPCcbMap1'
    cbMap1=SPCcbMap1
    begin object name=SPCcbMap2 class=GUIGFXButton
        bCheckBox=true
        WinTop=0.4529740
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.06250
        bBoundToParent=true
        OnChange=OnMapSelect
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'UT2K4SP_CGManoEMano.SPCcbMap2'
    cbMap2=SPCcbMap2
    begin object name=SPCcbEnemyTeam class=moComboBox
        bReadOnly=true
        Caption="?? ?:"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ?????."
        WinTop=0.5364470
        WinLeft=0.0243060
        WinWidth=0.9527790
        WinHeight=0.0597220
        TabOrder=3
        bBoundToParent=true
        OnChange=UpdateTeamDetails
    object end
    // Reference: moComboBox'UT2K4SP_CGManoEMano.SPCcbEnemyTeam'
    cbEnemyTeam=SPCcbEnemyTeam
    begin object name=SPCneBet class=moFormatNumEdit
        FormatValue=FormatMoney
        Caption="?? ??:"
        OnCreateComponent=InternalOnCreateComponent
        Hint="?? ??? ?????."
        WinTop=0.5906140
        WinLeft=0.0243060
        WinWidth=0.9527790
        WinHeight=0.03750
        TabOrder=4
        bBoundToParent=true
        OnChange=UpdateDetails
    object end
    // Reference: moFormatNumEdit'UT2K4SP_CGManoEMano.SPCneBet'
    neBet=SPCneBet
    begin object name=SPCsbDetails class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6746430
        WinLeft=0.0197920
        WinWidth=0.9583340
        WinHeight=0.2173610
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SP_CGManoEMano.SPCsbDetails'
    sbDetails=SPCsbDetails
    MinimalBet=150
    PenaltyWarning="???? ?? %cancelpenalty%? ???? ???.||?????????"
    YouveBeenChallenged="??? ?????!"
    SelectAMap="????? ??? ???? ??????."
    msgChallenge="??? %gametype% ??? %map%?? ????? ??????. ??? %teamname% ? ??? %teamleader%? ??? ??? ???.|??? ??? ??? %entryfee% ???. ??? ?? %prizemoney%?? ?? ???."
    msgChallenged="??? ? ? ? ?? ??? ?????.|? ???? ??? ?? %prizemoney%?? ?????. ??? ????? ??? %entryfee%? ???? ???.|%gametype% ??? %map%?? ??? ? ????.|??? ???? ??? %penalty%? ?? ??? ???."
    NotEnoughCash="??? ?? ??? ??? ???? ????? ?? ?? ????."
    msgMinMaxBet="??: %min%, ??: %max%"
    DefaultUrl="?TeamScreen=true"
    ChalMaps=// Object reference not set to an instance of an object.
    
    ChallengeSettings=// Object reference not set to an instance of an object.
    
    DefaultLeft=0.050
    DefaultTop=0.10
    DefaultWidth=0.90
    DefaultHeight=0.80
    OnClose=OnWindowClose
    OnCanClose=OnCanWindowClose
    WinTop=0.10
    WinLeft=0.050
    WinWidth=0.90
    WinHeight=0.80
}