/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_Challenge.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:33
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4SP_Challenge extends LargeWindow
    editinlinenew
    instanced;

struct ChallengeGameType
{
    var string GameType;
    var string ExtraUrl;
    var int maxbots;
    var string MapAcronym;
    var string MapPrefix;
    var int BaseGoalScore;
    var int VarGoalScore;
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMap1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMap2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMapBg1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMapBg2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblGameDescription;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoPreview1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoPreview2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox cbGameType;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton cbMap1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton cbMap2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cbEnemyTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbDetails;
var UT2K4GameProfile GP;
var string TeamRoleWindow;
var export editinline UT2K4SP_TeamRoles RoleWindow;
var string ChallengedBy;
var int CancelPenalty;
var array<MapRecord> mapData;
var MapRecord MapOptions[2];
var int BasePrizeMoney;
var int VarPrizeMoney;
var array<ChallengeGameType> ChallengeGames;
var localized array<localized string> ChallengeGameNames;
var localized string PenaltyWarning;
var localized string ChallengeDescription;
var localized string ChallengedDescription;
var localized string NotEnoughCash;
var localized string YouveBeenChallenged;
var localized string PlayTitle;
var string DefaultUrl;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    i = 0;
    J0x40:
    // End:0x74 [While If]
    if(i < ChallengeGames.Length)
    {
        cbGameType.AddItem(ChallengeGameNames[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    i = 0;
    J0x7b:
    // End:0xc3 [While If]
    if(i < Controls.Length)
    {
        Controls[i].bScaleToParent = true;
        Controls[i].bBoundToParent = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7b;
    }
    cbGameType.SetIndex(Rand(ChallengeGames.Length));
    cbEnemyTeam.MyComboBox.List.Sort();
    cbEnemyTeam.SetIndex(0);
    cbGameType.Edit.FontScale = cbGameType.FontScale;
    cbGameType.Edit.CaptionAlign = 1;
    cbGameType.List.FontScale = cbGameType.FontScale;
    cbGameType.List.TextAlign = 1;
    SetupNoPreview(lblNoPreview1, imgMap1);
    SetupNoPreview(lblNoPreview2, imgMap2);
}

function GetGame(int Index, optional bool noRecreateEnemies)
{
    local int j, N;
    local string tmp;
    local class<UT2K4TeamRoster> ET;

    GP.bIsChallenge = true;
    lblGameDescription.Caption = ChallengeGameNames[Index];
    mapData.Length = 0;
    class'CacheManager'.static.GetMapList(mapData, ChallengeGames[Index].MapAcronym);
    // End:0xd7
    if(ChallengeGames[Index].MapPrefix != "")
    {
        N = mapData.Length - 1;
        J0x7a:
        // End:0xd7 [While If]
        if(N >= 0)
        {
            // End:0xc1
            if(Left(mapData[N].MapName, Len(ChallengeGames[Index].MapPrefix)) ~= ChallengeGames[Index].MapPrefix)
            {
            }
            // End:0xcd
            else
            {
                mapData.Remove(N, 1);
            }
            -- N;
            // This is an implied JumpToken; Continue!
            goto J0x7a;
        }
    }
    N = 0;
    J0xde:
    // End:0x186 [While If]
    if(N < 2)
    {
        // End:0xf9 [While If]
        if(mapData.Length == 0)
        {
            JumpToken-JumpToken(System.InvalidCastException: Unable to cast object of type 'EndFunctionParmsToken' to type 'JumpToken'.
   at UELib.Core.UStruct.UByteCodeDecompiler.JumpToken.Decompile()
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile())
        }
        j = Rand(mapData.Length);
        MapOptions[N] = mapData[j];
        mapData.Remove(j, 1);
        // End:0xea
        if(ChallengeGames[Index].maxbots + 1 >= MapOptions[N].PlayerCountMin && ChallengeGames[Index].maxbots + 1 <= MapOptions[N].PlayerCountMax)
        	goto J0xea;
        J0x17c:
        ++ N;
        // This is an implied JumpToken; Continue!
        goto J0xde;
    }
    // End:0x1c7
    if(MapOptions[0].ScreenshotRef != "")
    {
        imgMap1.Image = Material(DynamicLoadObject(MapOptions[0].ScreenshotRef, class'Material'));
    }
    // End:0x1d7
    else
    {
        imgMap1.Image = none;
    }
    imgMap1.SetVisibility(imgMap1.Image != none);
    lblNoPreview1.SetVisibility(imgMap1.Image == none);
    // End:0x258
    if(MapOptions[1].ScreenshotRef != "")
    {
        imgMap2.Image = Material(DynamicLoadObject(MapOptions[1].ScreenshotRef, class'Material'));
    }
    // End:0x268
    else
    {
        imgMap2.Image = none;
    }
    imgMap2.SetVisibility(imgMap2.Image != none);
    lblNoPreview2.SetVisibility(imgMap2.Image == none);
    cbMap1.Caption = PlayTitle @ MapOptions[0].MapName;
    cbMap2.Caption = PlayTitle @ MapOptions[1].MapName;
    GP.ChallengeInfo = new (GP) class'UT2K4MatchInfo';
    GP.ChallengeInfo.NumBots = ChallengeGames[Index].maxbots;
    GP.ChallengeInfo.URLString = DefaultUrl $ ChallengeGames[Index].ExtraUrl;
    GP.ChallengeInfo.GameType = ChallengeGames[Index].GameType;
    BasePrizeMoney += int(float(VarPrizeMoney) * FRand());
    GP.ChallengeInfo.PrizeMoney = int(float(GP.GetNumTeammatesForMatch()) + 1.50) * BasePrizeMoney;
    GP.ChallengeInfo.EntryFee = int(0.50 * float(BasePrizeMoney));
    GP.ChallengeInfo.GoalScore = float(ChallengeGames[Index].BaseGoalScore) + float(ChallengeGames[Index].VarGoalScore) * FRand();
    tmp = Repl(ChallengeDescription, "%entryfee%", GP.MoneyToString(GP.ChallengeInfo.EntryFee));
    tmp = Repl(tmp, "%PrizeMoney%", GP.MoneyToString(GP.ChallengeInfo.PrizeMoney));
    tmp = Repl(tmp, "%balance%", GP.MoneyToString(GP.Balance));
    sbDetails.SetContent(tmp);
    // End:0x624
    if(!noRecreateEnemies)
    {
        cbEnemyTeam.MyComboBox.List.Clear();
        j = 0;
        J0x53a:
        // End:0x624 [While If]
        if(j < GP.TeamStats.Length)
        {
            // End:0x61a
            if(GP.TeamStats[j].Matches > 0)
            {
                // End:0x5b4
                if(GP.TeamStats[j].Level >= 3 && GP.ChallengeInfo.NumBots == 1)
                {
                }
                // End:0x61a
                else
                {
                    ET = class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[j].Name, class'Class'));
                    cbEnemyTeam.AddItem(ET.default.TeamName,, GP.TeamStats[j].Name);
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x53a;
        }
    }
    // End:0x644
    if(cbMap1.bChecked)
    {
        OnMapSelect(cbMap1);
    }
    // End:0x661
    else
    {
        // End:0x661
        if(cbMap2.bChecked)
        {
            OnMapSelect(cbMap2);
        }
    }
    GP.bIsChallenge = false;
}

event HandleParameters(string Param1, string Param2)
{
    local string tmp;
    local int i, teampos;
    local export editinline GUIQuestionPage QPage;
    local GUIController MyController;

    // End:0xa6
    if(GP.ChallengeInfo.EntryFee > GP.Balance)
    {
        MyController = Controller;
        Controller.CloseMenu(true);
        // End:0xa4
        if(MyController.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
        {
            QPage = GUIQuestionPage(MyController.TopPage());
            QPage.SetupQuestion(NotEnoughCash, 1, 1);
        }
        return;
    }
    // End:0x2f3
    if(Param1 != "")
    {
        i = cbEnemyTeam.FindExtra(Param1);
        // End:0x2f3
        if(i > -1)
        {
            teampos = GP.GetTeamPosition(Param1);
            // End:0x153
            if(teampos > -1)
            {
                // End:0x153
                if(GP.TeamStats[teampos].Level >= 3)
                {
                    J0x124:
                    // End:0x153 [While If]
                    if(GP.ChallengeInfo.NumBots == 1)
                    {
                        GetGame(Rand(ChallengeGames.Length), true);
                        // This is an implied JumpToken; Continue!
                        goto J0x124;
                    }
                }
            }
            cbGameType.bVisible = false;
            cbEnemyTeam.SetIndex(i);
            lblTitle.Caption = YouveBeenChallenged;
            cbEnemyTeam.MenuStateChange(4);
            CancelPenalty = GP.ChallengeInfo.EntryFee;
            GP.ChallengeInfo.EntryFee = 0;
            tmp = Repl(ChallengedDescription, "%entryfee%", GP.MoneyToString(GP.ChallengeInfo.EntryFee));
            tmp = Repl(tmp, "%PrizeMoney%", GP.MoneyToString(GP.ChallengeInfo.PrizeMoney));
            tmp = Repl(tmp, "%enemyteam%", cbEnemyTeam.GetText());
            tmp = Repl(tmp, "%cancelfee%", GP.MoneyToString(CancelPenalty));
            tmp = Repl(tmp, "%balance%", GP.MoneyToString(GP.Balance));
            sbDetails.SetContent(tmp);
        }
    }
}

function bool onOkClick(GUIComponent Sender)
{
    // End:0x17f
    if(GP != none)
    {
        GP.bIsChallenge = true;
        GP.ChallengeInfo.EnemyTeamName = cbEnemyTeam.GetExtra();
        GP.EnemyTeam = GP.ChallengeInfo.EnemyTeamName;
        GP.ChallengeInfo.DifficultyModifier = float(GP.TeamStats[GP.GetTeamPosition(GP.ChallengeInfo.EnemyTeamName)].Level) / 1.20;
        // End:0xff
        if(GP.ChallengeInfo.NumBots == 1)
        {
            GP.ChallengeInfo.DifficultyModifier *= 1.330;
        }
        GP.ChallengeInfo.SpecialEvent = "";
        // End:0x176
        if(GP.GetNumTeammatesForMatch() > 0)
        {
            // End:0x173
            if(Controller.OpenMenu(TeamRoleWindow))
            {
                RoleWindow = UT2K4SP_TeamRoles(Controller.TopPage());
                RoleWindow.__onOkClick__Delegate = StartMatch;
            }
        }
        // End:0x17c
        else
        {
            StartMatch();
        }
    }
    // End:0x18d
    else
    {
        Warn("GP != none");
    }
    return true;
}

function StartMatch()
{
    local LevelInfo myLevel;

    GP.Balance -= GP.ChallengeInfo.EntryFee;
    myLevel = PlayerOwner().Level;
    GP.StartNewMatch(-1, myLevel);
    Controller.CloseAll(false, true);
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
    // End:0x4a
    if(Sender == cbMap1)
    {
        GP.ActiveMap = MapOptions[0];
        cbMap1.bChecked = true;
        cbMap2.bChecked = false;
    }
    // End:0x82
    else
    {
        GP.ActiveMap = MapOptions[1];
        cbMap1.bChecked = false;
        cbMap2.bChecked = true;
    }
    GP.ChallengeInfo.LevelName = GP.ActiveMap.MapName;
    // End:0x10b
    if(GP.ChallengeInfo.LevelName != "" && GP.Balance > GP.ChallengeInfo.EntryFee)
    {
        btnOk.MenuStateChange(0);
    }
    // End:0x11c
    else
    {
        btnOk.MenuStateChange(4);
    }
    return;
}

function OnGameSelect(GUIComponent Sender)
{
    GetGame(cbGameType.GetIndex());
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

defaultproperties
{
    begin object name=SPCimgMap1 class=GUIImage
        ImageStyle=2
        WinTop=0.1975310
        WinLeft=0.0222220
        WinWidth=0.4416670
        WinHeight=0.31250
        RenderWeight=0.150
    object end
    // Reference: GUIImage'UT2K4SP_Challenge.SPCimgMap1'
    imgMap1=SPCimgMap1
    begin object name=SPCimgMap2 class=GUIImage
        ImageStyle=2
        WinTop=0.1975310
        WinLeft=0.5361110
        WinWidth=0.4416670
        WinHeight=0.31250
        RenderWeight=0.150
    object end
    // Reference: GUIImage'UT2K4SP_Challenge.SPCimgMap2'
    imgMap2=SPCimgMap2
    begin object name=SPCimgMapBg1 class=GUIImage
        ImageStyle=2
        WinTop=0.1863080
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.3333330
    object end
    // Reference: GUIImage'UT2K4SP_Challenge.SPCimgMapBg1'
    imgMapBg1=SPCimgMapBg1
    begin object name=SPCimgMapBg2 class=GUIImage
        ImageStyle=2
        WinTop=0.1863080
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.3333330
    object end
    // Reference: GUIImage'UT2K4SP_Challenge.SPCimgMapBg2'
    imgMapBg2=SPCimgMapBg2
    begin object name=SPMbtnOk class=GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        WinTop=0.8877310
        WinLeft=0.7100710
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.20
        TabOrder=1
        OnClick=onOkClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Challenge.SPMbtnOk'
    btnOk=SPMbtnOk
    begin object name=SPCbtnCancel class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8877310
        WinLeft=0.0503480
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.20
        TabOrder=2
        OnClick=onCancelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Challenge.SPCbtnCancel'
    btnCancel=SPCbtnCancel
    begin object name=SPClblTitle class=GUILabel
        Caption="??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0178470
        WinLeft=0.0678130
        WinWidth=0.8625010
        WinHeight=0.07750
        RenderWeight=0.20
    object end
    // Reference: GUILabel'UT2K4SP_Challenge.SPClblTitle'
    lblTitle=SPClblTitle
    begin object name=SPClblGameDescription class=GUILabel
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.101180
        WinLeft=0.0678130
        WinWidth=0.8625010
        WinHeight=0.07750
        RenderWeight=0.20
    object end
    // Reference: GUILabel'UT2K4SP_Challenge.SPClblGameDescription'
    lblGameDescription=SPClblGameDescription
    begin object name=NoPreview class=GUILabel
        Caption="????? ????"
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
    object end
    // Reference: GUILabel'UT2K4SP_Challenge.NoPreview'
    lblNoPreview1=NoPreview
    begin object name=NoPreview class=GUILabel
        Caption="????? ????"
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
    object end
    // Reference: GUILabel'UT2K4SP_Challenge.NoPreview'
    lblNoPreview2=NoPreview
    begin object name=SPCcbGameType class=GUIComboBox
        bReadOnly=true
        FontScale=2
        Hint="??? ?????"
        WinTop=0.097830
        WinLeft=0.0197920
        WinWidth=0.9583340
        WinHeight=0.0791670
        RenderWeight=0.210
        TabOrder=0
        OnChange=OnGameSelect
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'UT2K4SP_Challenge.SPCcbGameType'
    cbGameType=SPCcbGameType
    begin object name=SPCcbMap1 class=GUIGFXButton
        bCheckBox=true
        WinTop=0.5196410
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.06250
        OnChange=OnMapSelect
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'UT2K4SP_Challenge.SPCcbMap1'
    cbMap1=SPCcbMap1
    begin object name=SPCcbMap2 class=GUIGFXButton
        bCheckBox=true
        WinTop=0.5196410
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.06250
        OnChange=OnMapSelect
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIGFXButton'UT2K4SP_Challenge.SPCcbMap2'
    cbMap2=SPCcbMap2
    begin object name=SPCcbEnemyTeam class=moComboBox
        bReadOnly=true
        Caption="??? ?:"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ??? ??? ?????"
        WinTop=0.594780
        WinLeft=0.0243060
        WinWidth=0.9527790
        WinHeight=0.0597220
        TabOrder=3
    object end
    // Reference: moComboBox'UT2K4SP_Challenge.SPCcbEnemyTeam'
    cbEnemyTeam=SPCcbEnemyTeam
    begin object name=SPCsbDetails class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6679770
        WinLeft=0.0197920
        WinWidth=0.9583340
        WinHeight=0.2111110
        RenderWeight=0.20
        TabOrder=1
    object end
    // Reference: GUIScrollTextBox'UT2K4SP_Challenge.SPCsbDetails'
    sbDetails=SPCsbDetails
    TeamRoleWindow="GUI2K4.UT2K4SP_TeamRoles"
    BasePrizeMoney=400
    VarPrizeMoney=100
    ChallengeGames=// Object reference not set to an instance of an object.
    
    ChallengeGameNames=// Object reference not set to an instance of an object.
    
    PenaltyWarning="???? ??? %cancelpenalty%?? ???? ???.||?????????"
    ChallengeDescription="? ??? ???? ??? %entryfee%??? ??? ???? ???.|? ???? ??? ?? %PrizeMoney%(?)? ???? ???.|?? ???? %balance%???."
    ChallengedDescription="%enemyteam% ?? ??? ????.|??? ?? %PrizeMoney%?(?) ???? ???.|? ??? ????? ????? %cancelfee%(?)? ???? ???.|?? ???? %balance%???."
    NotEnoughCash="?? ??? ???? ?? ??? ???? ????."
    YouveBeenChallenged="??? ?????!"
    PlayTitle="???"
    DefaultUrl="?TeamScreen=true"
    OnClose=OnWindowClose
    OnCanClose=OnCanWindowClose
    WinTop=0.050
    WinLeft=0.050
    WinWidth=0.90
    WinHeight=0.90
}