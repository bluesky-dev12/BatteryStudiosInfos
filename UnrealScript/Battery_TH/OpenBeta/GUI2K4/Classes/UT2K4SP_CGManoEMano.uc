class UT2K4SP_CGManoEMano extends LargeWindow
    editinlinenew
    instanced;

struct ChallengeSettingRecord
{
    var string Acronym;
    var int GoalScore;
    var string GameType;
};

var() automated GUIImage imgMap1;
var() automated GUIImage imgMap2;
var() automated GUIImage imgMapBg1;
var() automated GUIImage imgMapBg2;
var() automated GUIButton btnOk;
var() automated GUIButton btnCancel;
var() automated GUILabel lblTitle;
var() automated GUILabel lblNoPreview1;
var() automated GUILabel lblNoPreview2;
var() automated GUILabel lblMinMaxBet;
var() automated GUILabel lblBalance;
var() automated GUIGFXButton cbMap1;
var() automated GUIGFXButton cbMap2;
var() automated moComboBox cbEnemyTeam;
var() automated moFormatNumEdit neBet;
var() automated GUIScrollTextBox sbDetails;
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
    local Class<UT2K4TeamRoster> ET;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    i = 0;
    J0x40:

    // End:0x88 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].bScaleToParent = true;
        Controls[i].bBoundToParent = true;
        i++;
        // [Loop Continue]
        goto J0x40;
    }
    cbEnemyTeam.MyComboBox.List.Clear();
    i = 0;
    J0xB0:

    // End:0x1AF [Loop If]
    if(i < GP.TeamStats.Length)
    {
        // End:0x1A5
        if(GP.TeamStats[i].Matches > 0)
        {
            // End:0x10B
            if(GP.TeamStats[i].Level >= 3)
            {
                // [Explicit Continue]
                goto J0x1A5;
            }
            ET = Class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[i].Name, Class'Core.Class'));
            // End:0x1A5
            if(ET != none)
            {
                cbEnemyTeam.AddItem(((ET.default.TeamName @ "(") $ Class'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies'.default.StrengthLabels[ET.default.TeamLevel]) $ ")",, GP.TeamStats[i].Name);
            }
        }
        J0x1A5:

        i++;
        // [Loop Continue]
        goto J0xB0;
    }
    cbEnemyTeam.MyComboBox.List.Sort();
    cbEnemyTeam.SetIndex(0);
    SetupNoPreview(lblNoPreview1, imgMap1);
    SetupNoPreview(lblNoPreview2, imgMap2);
    sbDetails.SetContent(SelectAMap);
    lblBalance.Caption = Class'GUI2K4_Decompressed.UT2K4SPTab_LadderBase'.default.BalanceLabel @ GP.MoneyToString(GP.Balance);
    //return;    
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
    J0x37:

    // End:0x5B [Loop If]
    if(MapOptions[1].MapName == "")
    {
        m2 = Rand(ChalMaps.Length);
        goto J0x5E;
    }
    goto J0x6D;
    J0x5E:

    // End:0x37
    if(!(m1 != m2))
        goto J0x37;
    J0x6D:

    // End:0x9B
    if(m1 > -1)
    {
        MapOptions[0] = Class'Engine.CacheManager'.static.GetMapRecord(ChalMaps[m1]);
    }
    // End:0xC9
    if(m2 > -1)
    {
        MapOptions[1] = Class'Engine.CacheManager'.static.GetMapRecord(ChalMaps[m2]);
    }
    // End:0x107
    if(MapOptions[0].ScreenshotRef != "")
    {
        imgMap1.Image = Material(DynamicLoadObject(MapOptions[0].ScreenshotRef, Class'Engine.Material'));
    }
    lblNoPreview1.bVisible = MapOptions[0].ScreenshotRef == "";
    cbMap1.Caption = MapOptions[0].MapName;
    // End:0x180
    if(MapOptions[1].ScreenshotRef != "")
    {
        imgMap2.Image = Material(DynamicLoadObject(MapOptions[1].ScreenshotRef, Class'Engine.Material'));
    }
    lblNoPreview2.bVisible = MapOptions[1].ScreenshotRef == "";
    cbMap2.Caption = MapOptions[1].MapName;
    //return;    
}

function setChallengeInfo(int selectedMap)
{
    local string Desc;
    local Class<UT2K4TeamRoster> ETI;
    local GameRecord GR;
    local int chalset;

    chalset = 0;
    J0x07:

    // End:0x49 [Loop If]
    if(chalset < ChallengeSettings.Length)
    {
        // End:0x3F
        if(ChallengeSettings[chalset].Acronym ~= MapOptions[selectedMap].Acronym)
        {
            // [Explicit Break]
            goto J0x49;
        }
        chalset++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x49:

    GR = Class'Engine.CacheManager'.static.GetGameRecord(ChallengeSettings[chalset].GameType);
    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), Class'Core.Class'));
    GP.ChallengeInfo.LevelName = MapOptions[selectedMap].MapName;
    GP.ChallengeInfo.NumBots = 1;
    GP.ChallengeInfo.DifficultyModifier = float(ETI.default.TeamLevel) / 1.2000000;
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
    else
    {
        Desc = msgChallenge;
    }
    Desc = Repl(Desc, "%map%", MapOptions[selectedMap].MapName);
    Desc = Repl(Desc, "%teamname%", cbEnemyTeam.GetText());
    // End:0x2B9
    if(ETI.default.TeamLeader != "")
    {
        Desc = Repl(Desc, "%teamleader%", ETI.default.TeamLeader);        
    }
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
    if((GP.ChallengeInfo.LevelName != "") && GP.Balance > (GP.getMinimalEntryFeeFor(GP.ChallengeInfo) + GP.MinBalance))
    {
        btnOk.EnableMe();        
    }
    else
    {
        btnOk.DisableMe();
    }
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    local GUIController MyController;

    ChallengedBy = Param1;
    // End:0x3A
    if(ChallengedBy != "")
    {
        cbEnemyTeam.SetIndex(cbEnemyTeam.FindExtra(ChallengedBy));
    }
    bChallenged = Param2 != "";
    // End:0xEC
    if(bChallenged)
    {
        MinimalBet = MinimalBet + Rand(MinimalBet);
        CancelPenalty = int(float(MinimalBet) * 1.5000000);
        cbEnemyTeam.DisableMe();
        // End:0xE9
        if(GP.CurrentLadder == GP.UT2K4GameLadder.default.LID_CTF)
        {
            // End:0xE9
            if(FRand() > 0.5000000)
            {
                MapOptions[Rand(2)] = Class'Engine.CacheManager'.static.GetMapRecord("CTF-1on1-Joust");
            }
        }        
    }
    else
    {
        ChalMaps.Length = ChalMaps.Length + 1;
        ChalMaps[ChalMaps.Length - 1] = "CTF-1on1-Joust";
    }
    neBet.Setup(MinimalBet, GP.Balance, (GP.Balance - MinimalBet) / 20);
    UpdateTeamDetails(cbEnemyTeam);
    // End:0x1F7
    if(((GP.Balance - GP.MinBalance) < MinimalBet) || (GP.Balance - GP.MinBalance) < CancelPenalty)
    {
        CancelPenalty = 0;
        MyController = Controller;
        Controller.CloseMenu(true);
        // End:0x1E1
        if(bChallenged)
        {
            return;
        }
        MyController.ShowQuestionDialog(NotEnoughCash);
        return;
    }
    GetRandomMaps();
    //return;    
}

function bool onOkClick(GUIComponent Sender)
{
    GP.EnemyTeam = cbEnemyTeam.GetExtra();
    GP.ChallengeInfo.EnemyTeamName = GP.EnemyTeam;
    GP.bGotChallenged = bChallenged;
    GP.ChallengeVariable = GP.MoneyToString(neBet.GetValue());
    Class'WGame.ManoEMano'.static.StartChallenge(GP, PlayerOwner().Level);
    Controller.CloseAll(false, true);
    return true;
    //return;    
}

function bool onCancelClick(GUIComponent Sender)
{
    // End:0x1E
    if(OnCanWindowClose(true))
    {
        return Controller.CloseMenu(true);        
    }
    else
    {
        return false;
    }
    //return;    
}

function OnConfirmCancel(byte bButton)
{
    // End:0x3A
    if(int(bButton) == 16)
    {
        GP.Balance -= CancelPenalty;
        CancelPenalty = 0;
        Controller.CloseMenu(true);
    }
    //return;    
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
    else
    {
        GP.ActiveMap = MapOptions[1];
        cbMap1.bChecked = false;
        cbMap2.bChecked = true;
        setChallengeInfo(1);
    }
    return;
    //return;    
}

function OnWindowClose(optional bool bCancelled)
{
    GP.bIsChallenge = !bCancelled;
    //return;    
}

function bool OnCanWindowClose(optional bool bCancelled)
{
    local export editinline GUIQuestionPage QPage;

    // End:0x0D
    if(!bCancelled)
    {
        return true;
    }
    // End:0xB4
    if(CancelPenalty > 0)
    {
        // End:0xB2
        if(Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
        {
            QPage = GUIQuestionPage(Controller.TopPage());
            QPage.SetupQuestion(Repl(PenaltyWarning, "%cancelpenalty%", GP.MoneyToString(CancelPenalty)), 48, 32);
            QPage.__OnButtonClick__Delegate = OnConfirmCancel;
        }
        return false;
    }
    return true;
    //return;    
}

function UpdateDetails(GUIComponent Sender)
{
    // End:0x1C
    if(cbMap1.bChecked)
    {
        setChallengeInfo(0);        
    }
    else
    {
        // End:0x35
        if(cbMap2.bChecked)
        {
            setChallengeInfo(1);
        }
    }
    //return;    
}

function UpdateTeamDetails(GUIComponent Sender)
{
    local Class<UT2K4TeamRoster> ETI;

    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), Class'Core.Class'));
    neBet.MyNumericEdit.MaxValue = Min(GP.Balance, (MinimalBet * (ETI.default.TeamLevel + 1)) * 2);
    neBet.MyNumericEdit.Step = (neBet.MyNumericEdit.MaxValue - neBet.MyNumericEdit.MinValue) / 20;
    neBet.SetValue(neBet.GetValue());
    lblMinMaxBet.Caption = Repl(Repl(msgMinMaxBet, "%min%", GP.MoneyToString(MinimalBet)), "%max%", GP.MoneyToString(neBet.MyNumericEdit.MaxValue));
    //return;    
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
    // End:0xB8
    if(imgMap2 != none)
    {
        imgMap2.SetVisibility(imgMap2.Image != none);
        // End:0xB8
        if(lblNoPreview2 != none)
        {
            lblNoPreview2.SetVisibility(imgMap2.Image == none);
        }
    }
    //return;    
}

protected function SetupNoPreview(GUILabel lbl, GUIImage img)
{
    // End:0x1A
    if((lbl == none) || img == none)
    {
        return;
    }
    lbl.WinLeft = img.WinLeft;
    lbl.WinTop = img.WinTop;
    lbl.WinWidth = img.WinWidth;
    lbl.WinHeight = img.WinHeight;
    //return;    
}

function bool XButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function string FormatMoney(int NewValue)
{
    return GP.MoneyToString(NewValue);
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCimgMap1'
    begin object name="SPCimgMap1" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1225310
        WinLeft=0.0222220
        WinWidth=0.4416670
        WinHeight=0.3125000
        RenderWeight=0.1500000
        bBoundToParent=true
    end object
    imgMap1=SPCimgMap1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCimgMap2'
    begin object name="SPCimgMap2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1225310
        WinLeft=0.5361110
        WinWidth=0.4416670
        WinHeight=0.3125000
        RenderWeight=0.1500000
        bBoundToParent=true
    end object
    imgMap2=SPCimgMap2
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCimgMapBg1'
    begin object name="SPCimgMapBg1" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    end object
    imgMapBg1=SPCimgMapBg1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCimgMapBg2'
    begin object name="SPCimgMapBg2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    end object
    imgMapBg2=SPCimgMapBg2
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPMbtnOk'
    begin object name="SPMbtnOk" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        WinTop=0.9043980
        WinLeft=0.7100710
        WinWidth=0.2222220
        WinHeight=0.0569440
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SP_CGManoEMano.onOkClick
        OnKeyEvent=SPMbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPMbtnOk
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCbtnCancel'
    begin object name="SPCbtnCancel" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9043980
        WinLeft=0.0503480
        WinWidth=0.2222220
        WinHeight=0.0569440
        RenderWeight=0.2000000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4SP_CGManoEMano.onCancelClick
        OnKeyEvent=SPCbtnCancel.InternalOnKeyEvent
    end object
    btnCancel=SPCbtnCancel
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPClblTitle'
    begin object name="SPClblTitle" class=XInterface.GUILabel
        Caption="? ? ?"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0261800
        WinLeft=0.0678130
        WinWidth=0.8625010
        WinHeight=0.0775000
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblTitle=SPClblTitle
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.NoPreview'
    begin object name="NoPreview" class=XInterface.GUILabel
        Caption="???? ??"
        TextAlign=1
        TextColor=(R=247,G=255,B=0,A=255)
        TextFont="UT2HeaderFont"
        bTransparent=false
        bMultiLine=true
        VertAlign=1
        WinTop=0.1975310
        WinLeft=0.0222220
        WinWidth=0.4416670
        WinHeight=0.3125000
        bBoundToParent=true
    end object
    lblNoPreview1=NoPreview
    lblNoPreview2=NoPreview
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPClblMinMax'
    begin object name="SPClblMinMax" class=XInterface.GUILabel
        FontScale=0
        StyleName="TextLabel"
        WinTop=0.6199300
        WinLeft=0.0261460
        WinWidth=0.9527780
        WinHeight=0.0427780
        RenderWeight=0.2000000
        bBoundToParent=true
    end object
    lblMinMaxBet=SPClblMinMax
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPLlblBalance'
    begin object name="SPLlblBalance" class=XInterface.GUILabel
        TextAlign=2
        StyleName="TextLabel"
        WinTop=0.0466670
        WinLeft=0.5323600
        WinWidth=0.4500000
        WinHeight=0.0412500
        RenderWeight=0.2500000
        bBoundToParent=true
    end object
    lblBalance=SPLlblBalance
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCcbMap1'
    begin object name="SPCcbMap1" class=XInterface.GUIGFXButton
        bCheckBox=true
        WinTop=0.4529740
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.0625000
        bBoundToParent=true
        OnChange=UT2K4SP_CGManoEMano.OnMapSelect
        OnKeyEvent=SPCcbMap1.InternalOnKeyEvent
    end object
    cbMap1=SPCcbMap1
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCcbMap2'
    begin object name="SPCcbMap2" class=XInterface.GUIGFXButton
        bCheckBox=true
        WinTop=0.4529740
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.0625000
        bBoundToParent=true
        OnChange=UT2K4SP_CGManoEMano.OnMapSelect
        OnKeyEvent=SPCcbMap2.InternalOnKeyEvent
    end object
    cbMap2=SPCcbMap2
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCcbEnemyTeam'
    begin object name="SPCcbEnemyTeam" class=XInterface.moComboBox
        bReadOnly=true
        Caption="?? ?:"
        OnCreateComponent=SPCcbEnemyTeam.InternalOnCreateComponent
        Hint="??? ??? ?????."
        WinTop=0.5364470
        WinLeft=0.0243060
        WinWidth=0.9527790
        WinHeight=0.0597220
        TabOrder=3
        bBoundToParent=true
        OnChange=UT2K4SP_CGManoEMano.UpdateTeamDetails
    end object
    cbEnemyTeam=SPCcbEnemyTeam
    // Reference: moFormatNumEdit'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCneBet'
    begin object name="SPCneBet" class=XInterface.moFormatNumEdit
        FormatValue=UT2K4SP_CGManoEMano.FormatMoney
        Caption="?? ??:"
        OnCreateComponent=SPCneBet.InternalOnCreateComponent
        Hint="?? ??? ?????."
        WinTop=0.5906140
        WinLeft=0.0243060
        WinWidth=0.9527790
        WinHeight=0.0375000
        TabOrder=4
        bBoundToParent=true
        OnChange=UT2K4SP_CGManoEMano.UpdateDetails
    end object
    neBet=SPCneBet
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SP_CGManoEMano.SPCsbDetails'
    begin object name="SPCsbDetails" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SPCsbDetails.InternalOnCreateComponent
        WinTop=0.6746430
        WinLeft=0.0197920
        WinWidth=0.9583340
        WinHeight=0.2173610
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
    end object
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
    ChalMaps[0]="DM-1on1-Albatross"
    ChalMaps[1]="DM-1on1-Crash"
    ChalMaps[2]="DM-1on1-Idoma"
    ChalMaps[3]="DM-1on1-Irondust"
    ChalMaps[4]="DM-1on1-Mixer"
    ChalMaps[5]="DM-1on1-Roughinery"
    ChalMaps[6]="DM-1on1-Serpentine"
    ChalMaps[7]="DM-1on1-Spirit"
    ChalMaps[8]="DM-1on1-Squader"
    ChalMaps[9]="DM-1on1-Trite"
    ChallengeSettings[0]=(Acronym="DM",GoalScore=15,GameType="wGame.wTeamGame")
    ChallengeSettings[1]=(Acronym="CTF",GoalScore=3,GameType="wGame.wCTFGame")
    DefaultLeft=0.0500000
    DefaultTop=0.1000000
    DefaultWidth=0.9000000
    DefaultHeight=0.8000000
    OnClose=UT2K4SP_CGManoEMano.OnWindowClose
    OnCanClose=UT2K4SP_CGManoEMano.OnCanWindowClose
    WinTop=0.1000000
    WinLeft=0.0500000
    WinWidth=0.9000000
    WinHeight=0.8000000
}