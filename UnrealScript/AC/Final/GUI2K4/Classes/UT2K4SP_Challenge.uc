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

var() automated GUIImage imgMap1;
var() automated GUIImage imgMap2;
var() automated GUIImage imgMapBg1;
var() automated GUIImage imgMapBg2;
var() automated GUIButton btnOk;
var() automated GUIButton btnCancel;
var() automated GUILabel lblTitle;
var() automated GUILabel lblGameDescription;
var() automated GUILabel lblNoPreview1;
var() automated GUILabel lblNoPreview2;
var() automated GUIComboBox cbGameType;
var() automated GUIGFXButton cbMap1;
var() automated GUIGFXButton cbMap2;
var() automated moComboBox cbEnemyTeam;
var() automated GUIScrollTextBox sbDetails;
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

    // End:0x74 [Loop If]
    if(i < ChallengeGames.Length)
    {
        cbGameType.AddItem(ChallengeGameNames[i]);
        i++;
        // [Loop Continue]
        goto J0x40;
    }
    i = 0;
    J0x7B:

    // End:0xC3 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].bScaleToParent = true;
        Controls[i].bBoundToParent = true;
        i++;
        // [Loop Continue]
        goto J0x7B;
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
    //return;    
}

function GetGame(int Index, optional bool noRecreateEnemies)
{
    local int j, N;
    local string tmp;
    local Class<UT2K4TeamRoster> ET;

    GP.bIsChallenge = true;
    lblGameDescription.Caption = ChallengeGameNames[Index];
    mapData.Length = 0;
    Class'Engine.CacheManager'.static.GetMapList(mapData, ChallengeGames[Index].MapAcronym);
    // End:0xD7
    if(ChallengeGames[Index].MapPrefix != "")
    {
        N = mapData.Length - 1;
        J0x7A:

        // End:0xD7 [Loop If]
        if(N >= 0)
        {
            // End:0xC1
            if(Left(mapData[N].MapName, Len(ChallengeGames[Index].MapPrefix)) ~= ChallengeGames[Index].MapPrefix)
            {
                // [Explicit Continue]
                goto J0xCD;
            }
            mapData.Remove(N, 1);
            J0xCD:

            N--;
            // [Loop Continue]
            goto J0x7A;
        }
    }
    N = 0;
    J0xDE:

    // End:0x186 [Loop If]
    if(N < 2)
    {
        J0xEA:

        // End:0xF9 [Loop If]
        if(mapData.Length == 0)
        {
            goto J0x17C;
        }
        j = Rand(mapData.Length);
        MapOptions[N] = mapData[j];
        mapData.Remove(j, 1);
        // End:0xEA
        if(!(((ChallengeGames[Index].maxbots + 1) >= MapOptions[N].PlayerCountMin) && (ChallengeGames[Index].maxbots + 1) <= MapOptions[N].PlayerCountMax))
            goto J0xEA;
        J0x17C:

        N++;
        // [Loop Continue]
        goto J0xDE;
    }
    // End:0x1C7
    if(MapOptions[0].ScreenshotRef != "")
    {
        imgMap1.Image = Material(DynamicLoadObject(MapOptions[0].ScreenshotRef, Class'Engine.Material'));        
    }
    else
    {
        imgMap1.Image = none;
    }
    imgMap1.SetVisibility(imgMap1.Image != none);
    lblNoPreview1.SetVisibility(imgMap1.Image == none);
    // End:0x258
    if(MapOptions[1].ScreenshotRef != "")
    {
        imgMap2.Image = Material(DynamicLoadObject(MapOptions[1].ScreenshotRef, Class'Engine.Material'));        
    }
    else
    {
        imgMap2.Image = none;
    }
    imgMap2.SetVisibility(imgMap2.Image != none);
    lblNoPreview2.SetVisibility(imgMap2.Image == none);
    cbMap1.Caption = PlayTitle @ MapOptions[0].MapName;
    cbMap2.Caption = PlayTitle @ MapOptions[1].MapName;
    GP.ChallengeInfo = new (GP) Class'WGame.UT2K4MatchInfo';
    GP.ChallengeInfo.NumBots = ChallengeGames[Index].maxbots;
    GP.ChallengeInfo.URLString = DefaultUrl $ ChallengeGames[Index].ExtraUrl;
    GP.ChallengeInfo.GameType = ChallengeGames[Index].GameType;
    BasePrizeMoney += int(float(VarPrizeMoney) * FRand());
    GP.ChallengeInfo.PrizeMoney = int(float(GP.GetNumTeammatesForMatch()) + 1.5000000) * BasePrizeMoney;
    GP.ChallengeInfo.EntryFee = int(0.5000000 * float(BasePrizeMoney));
    GP.ChallengeInfo.GoalScore = float(ChallengeGames[Index].BaseGoalScore) + (float(ChallengeGames[Index].VarGoalScore) * FRand());
    tmp = Repl(ChallengeDescription, "%entryfee%", GP.MoneyToString(GP.ChallengeInfo.EntryFee));
    tmp = Repl(tmp, "%PrizeMoney%", GP.MoneyToString(GP.ChallengeInfo.PrizeMoney));
    tmp = Repl(tmp, "%balance%", GP.MoneyToString(GP.Balance));
    sbDetails.SetContent(tmp);
    // End:0x624
    if(!noRecreateEnemies)
    {
        cbEnemyTeam.MyComboBox.List.Clear();
        j = 0;
        J0x53A:

        // End:0x624 [Loop If]
        if(j < GP.TeamStats.Length)
        {
            // End:0x61A
            if(GP.TeamStats[j].Matches > 0)
            {
                // End:0x5B4
                if((GP.TeamStats[j].Level >= 3) && GP.ChallengeInfo.NumBots == 1)
                {
                    // [Explicit Continue]
                    goto J0x61A;
                }
                ET = Class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[j].Name, Class'Core.Class'));
                cbEnemyTeam.AddItem(ET.default.TeamName,, GP.TeamStats[j].Name);
            }
            J0x61A:

            j++;
            // [Loop Continue]
            goto J0x53A;
        }
    }
    // End:0x644
    if(cbMap1.bChecked)
    {
        OnMapSelect(cbMap1);        
    }
    else
    {
        // End:0x661
        if(cbMap2.bChecked)
        {
            OnMapSelect(cbMap2);
        }
    }
    GP.bIsChallenge = false;
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    local string tmp;
    local int i, teampos;
    local export editinline GUIQuestionPage QPage;
    local GUIController MyController;

    // End:0xA6
    if(GP.ChallengeInfo.EntryFee > GP.Balance)
    {
        MyController = Controller;
        Controller.CloseMenu(true);
        // End:0xA4
        if(MyController.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
        {
            QPage = GUIQuestionPage(MyController.TopPage());
            QPage.SetupQuestion(NotEnoughCash, 1, 1);
        }
        return;
    }
    // End:0x2F3
    if(Param1 != "")
    {
        i = cbEnemyTeam.FindExtra(Param1);
        // End:0x2F3
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

                    // End:0x153 [Loop If]
                    if(GP.ChallengeInfo.NumBots == 1)
                    {
                        GetGame(Rand(ChallengeGames.Length), true);
                        // [Loop Continue]
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
    //return;    
}

function bool onOkClick(GUIComponent Sender)
{
    // End:0x17F
    if(GP != none)
    {
        GP.bIsChallenge = true;
        GP.ChallengeInfo.EnemyTeamName = cbEnemyTeam.GetExtra();
        GP.EnemyTeam = GP.ChallengeInfo.EnemyTeamName;
        GP.ChallengeInfo.DifficultyModifier = float(GP.TeamStats[GP.GetTeamPosition(GP.ChallengeInfo.EnemyTeamName)].Level) / 1.2000000;
        // End:0xFF
        if(GP.ChallengeInfo.NumBots == 1)
        {
            GP.ChallengeInfo.DifficultyModifier *= 1.3300000;
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
        else
        {
            StartMatch();
        }        
    }
    else
    {
        Warn("GP != none");
    }
    return true;
    //return;    
}

function StartMatch()
{
    local LevelInfo myLevel;

    GP.Balance -= GP.ChallengeInfo.EntryFee;
    myLevel = PlayerOwner().Level;
    GP.StartNewMatch(-1, myLevel);
    Controller.CloseAll(false, true);
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
    // End:0x4A
    if(Sender == cbMap1)
    {
        GP.ActiveMap = MapOptions[0];
        cbMap1.bChecked = true;
        cbMap2.bChecked = false;        
    }
    else
    {
        GP.ActiveMap = MapOptions[1];
        cbMap1.bChecked = false;
        cbMap2.bChecked = true;
    }
    GP.ChallengeInfo.LevelName = GP.ActiveMap.MapName;
    // End:0x10B
    if((GP.ChallengeInfo.LevelName != "") && GP.Balance > GP.ChallengeInfo.EntryFee)
    {
        btnOk.MenuStateChange(0);        
    }
    else
    {
        btnOk.MenuStateChange(4);
    }
    return;
    //return;    
}

function OnGameSelect(GUIComponent Sender)
{
    GetGame(cbGameType.GetIndex());
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

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCimgMap1'
    begin object name="SPCimgMap1" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1975310
        WinLeft=0.0222220
        WinWidth=0.4416670
        WinHeight=0.3125000
        RenderWeight=0.1500000
    end object
    imgMap1=SPCimgMap1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCimgMap2'
    begin object name="SPCimgMap2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1975310
        WinLeft=0.5361110
        WinWidth=0.4416670
        WinHeight=0.3125000
        RenderWeight=0.1500000
    end object
    imgMap2=SPCimgMap2
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCimgMapBg1'
    begin object name="SPCimgMapBg1" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1863080
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.3333330
    end object
    imgMapBg1=SPCimgMapBg1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCimgMapBg2'
    begin object name="SPCimgMapBg2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1863080
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.3333330
    end object
    imgMapBg2=SPCimgMapBg2
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Challenge.SPMbtnOk'
    begin object name="SPMbtnOk" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        WinTop=0.8877310
        WinLeft=0.7100710
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.2000000
        TabOrder=1
        OnClick=UT2K4SP_Challenge.onOkClick
        OnKeyEvent=SPMbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPMbtnOk
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCbtnCancel'
    begin object name="SPCbtnCancel" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.8877310
        WinLeft=0.0503480
        WinWidth=0.2222220
        WinHeight=0.0444440
        RenderWeight=0.2000000
        TabOrder=2
        OnClick=UT2K4SP_Challenge.onCancelClick
        OnKeyEvent=SPCbtnCancel.InternalOnKeyEvent
    end object
    btnCancel=SPCbtnCancel
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_Challenge.SPClblTitle'
    begin object name="SPClblTitle" class=XInterface.GUILabel
        Caption="??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.0178470
        WinLeft=0.0678130
        WinWidth=0.8625010
        WinHeight=0.0775000
        RenderWeight=0.2000000
    end object
    lblTitle=SPClblTitle
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_Challenge.SPClblGameDescription'
    begin object name="SPClblGameDescription" class=XInterface.GUILabel
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.1011800
        WinLeft=0.0678130
        WinWidth=0.8625010
        WinHeight=0.0775000
        RenderWeight=0.2000000
    end object
    lblGameDescription=SPClblGameDescription
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_Challenge.NoPreview'
    begin object name="NoPreview" class=XInterface.GUILabel
        Caption="????? ????"
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
    end object
    lblNoPreview1=NoPreview
    lblNoPreview2=NoPreview
    // Reference: GUIComboBox'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCcbGameType'
    begin object name="SPCcbGameType" class=XInterface.GUIComboBox
        bReadOnly=true
        FontScale=2
        Hint="??? ?????"
        WinTop=0.0978300
        WinLeft=0.0197920
        WinWidth=0.9583340
        WinHeight=0.0791670
        RenderWeight=0.2100000
        TabOrder=0
        OnChange=UT2K4SP_Challenge.OnGameSelect
        OnKeyEvent=SPCcbGameType.InternalOnKeyEvent
    end object
    cbGameType=SPCcbGameType
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCcbMap1'
    begin object name="SPCcbMap1" class=XInterface.GUIGFXButton
        bCheckBox=true
        WinTop=0.5196410
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.0625000
        OnChange=UT2K4SP_Challenge.OnMapSelect
        OnKeyEvent=SPCcbMap1.InternalOnKeyEvent
    end object
    cbMap1=SPCcbMap1
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCcbMap2'
    begin object name="SPCcbMap2" class=XInterface.GUIGFXButton
        bCheckBox=true
        WinTop=0.5196410
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.0625000
        OnChange=UT2K4SP_Challenge.OnMapSelect
        OnKeyEvent=SPCcbMap2.InternalOnKeyEvent
    end object
    cbMap2=SPCcbMap2
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCcbEnemyTeam'
    begin object name="SPCcbEnemyTeam" class=XInterface.moComboBox
        bReadOnly=true
        Caption="??? ?:"
        OnCreateComponent=SPCcbEnemyTeam.InternalOnCreateComponent
        Hint="? ??? ??? ?????"
        WinTop=0.5947800
        WinLeft=0.0243060
        WinWidth=0.9527790
        WinHeight=0.0597220
        TabOrder=3
    end object
    cbEnemyTeam=SPCcbEnemyTeam
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SP_Challenge.SPCsbDetails'
    begin object name="SPCsbDetails" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SPCsbDetails.InternalOnCreateComponent
        WinTop=0.6679770
        WinLeft=0.0197920
        WinWidth=0.9583340
        WinHeight=0.2111110
        RenderWeight=0.2000000
        TabOrder=1
    end object
    sbDetails=SPCsbDetails
    TeamRoleWindow="GUI2K4.UT2K4SP_TeamRoles"
    BasePrizeMoney=400
    VarPrizeMoney=100
    ChallengeGames[0]=(GameType="xGame.xTeamGame",ExtraUrl="",maxbots=5,MapAcronym="DM",MapPrefix="",BaseGoalScore=20,VarGoalScore=5)
    ChallengeGames[1]=(GameType="xGame.xDeathmatch",ExtraUrl="",maxbots=1,MapAcronym="DM",MapPrefix="DM-1on1",BaseGoalScore=10,VarGoalScore=5)
    ChallengeGames[2]=(GameType="BonusPack.xMutantGame",ExtraUrl="",maxbots=4,MapAcronym="DM",MapPrefix="",BaseGoalScore=15,VarGoalScore=5)
    ChallengeGames[3]=(GameType="xGame.xTeamGame",ExtraUrl="?mutator=XGame.MutInstaGib",maxbots=7,MapAcronym="DM",MapPrefix="",BaseGoalScore=30,VarGoalScore=10)
    ChallengeGameNames[0]="? ????"
    ChallengeGameNames[1]="1 vs 1 ????"
    ChallengeGameNames[2]="???"
    ChallengeGameNames[3]="??? ?(Instagib) ? ????"
    PenaltyWarning="???? ??? %cancelpenalty%?? ???? ???.||?????????"
    ChallengeDescription="? ??? ???? ??? %entryfee%??? ??? ???? ???.|? ???? ??? ?? %PrizeMoney%(?)? ???? ???.|?? ???? %balance%???."
    ChallengedDescription="%enemyteam% ?? ??? ????.|??? ?? %PrizeMoney%?(?) ???? ???.|? ??? ????? ????? %cancelfee%(?)? ???? ???.|?? ???? %balance%???."
    NotEnoughCash="?? ??? ???? ?? ??? ???? ????."
    YouveBeenChallenged="??? ?????!"
    PlayTitle="???"
    DefaultUrl="?TeamScreen=true"
    OnClose=UT2K4SP_Challenge.OnWindowClose
    OnCanClose=UT2K4SP_Challenge.OnCanWindowClose
    WinTop=0.0500000
    WinLeft=0.0500000
    WinWidth=0.9000000
    WinHeight=0.9000000
}