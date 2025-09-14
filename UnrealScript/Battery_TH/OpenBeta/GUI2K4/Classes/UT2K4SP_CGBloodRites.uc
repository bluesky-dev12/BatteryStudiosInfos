class UT2K4SP_CGBloodRites extends LargeWindow
    editinlinenew
    instanced;

var() automated GUIImage imgMap1;
var() automated GUIImage imgMap2;
var() automated GUIImage imgMapBg1;
var() automated GUIImage imgMapBg2;
var() automated GUIButton btnOk;
var() automated GUIButton btnCancel;
var() automated GUIButton btnNextChar;
var() automated GUIButton btnPrevChar;
var() automated GUILabel lblTitle;
var() automated GUILabel lblNoPreview1;
var() automated GUILabel lblNoPreview2;
var() automated GUILabel lblSelChar;
var() automated GUILabel lblSelCharName;
var() automated GUILabel lblBalance;
var() automated GUIGFXButton cbMap1;
var() automated GUIGFXButton cbMap2;
var() automated moComboBox cbEnemyTeam;
var() automated GUIScrollTextBox sbDetails;
var() automated GUICharacterListTeam clSelChar;
var() automated moCheckBox cbInstaGib;
var UT2K4GameProfile GP;
var int CancelPenalty;
var array<MapRecord> mapData;
var MapRecord MapOptions[2];
var string ChallengedBy;
var bool bChallenged;
var localized string PenaltyWarning;
var localized string YouveBeenChallenged;
var localized string SelectAMap;
var localized string msgChallenge;
var localized string msgChallenged;
var localized string msgInstaGib;
var localized string CantAffordCancel;
var string DefaultUrl;
var string ChalGameType;
var string MutInstaGib;
var float ChalledFeeMultiply;
var int NormalGoalScore;
var int InstaGoalScore;
var string MapPrefix;
var int minimalEntryFee;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

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
    Class'Engine.CacheManager'.static.GetMapList(mapData, MapPrefix);
    i = mapData.Length - 1;
    J0xAD:

    // End:0x15A [Loop If]
    if(i >= 0)
    {
        // End:0xDE
        if(mapData[i].PlayerCountMax < 7)
        {
            mapData.Remove(i, 1);
            // [Explicit Continue]
            goto J0x150;
        }
        // End:0x100
        if(Class'Engine.CacheManager'.static.Is2004Content(mapData[i].MapName))
        {
            // [Explicit Continue]
            goto J0x150;
        }
        // End:0x122
        if(Class'Engine.CacheManager'.static.Is2003Content(mapData[i].MapName))
        {
            // [Explicit Continue]
            goto J0x150;
        }
        // End:0x144
        if(Class'Engine.CacheManager'.static.IsBPContent(mapData[i].MapName))
        {
            // [Explicit Continue]
            goto J0x150;
        }
        mapData.Remove(i, 1);
        J0x150:

        i--;
        // [Loop Continue]
        goto J0xAD;
    }
    SetupNoPreview(lblNoPreview1, imgMap1);
    SetupNoPreview(lblNoPreview2, imgMap2);
    sbDetails.SetContent(SelectAMap);
    GetRandomMaps();
    lblBalance.Caption = Class'GUI2K4_Decompressed.UT2K4SPTab_LadderBase'.default.BalanceLabel @ GP.MoneyToString(GP.Balance);
    //return;    
}

function int CheapestBot(array<string> List)
{
    local int curmin, i, bp;

    curmin = 2147483647;
    i = 0;
    J0x12:

    // End:0x69 [Loop If]
    if(i < List.Length)
    {
        bp = GP.GetBotPrice(List[i],,, true);
        // End:0x5F
        if(bp < curmin)
        {
            curmin = bp;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return curmin;
    //return;    
}

function GetRandomMaps()
{
    MapOptions[0] = mapData[Rand(mapData.Length)];
    J0x16:

    // End:0x3C [Loop If]
    if(mapData.Length <= 1)
    {
        Warn("MapData.length <= 1");
        goto J0x68;
    }
    MapOptions[1] = mapData[Rand(mapData.Length)];
    // End:0x16
    if(!(MapOptions[0] != MapOptions[1]))
        goto J0x16;
    J0x68:

    // End:0xA6
    if(MapOptions[0].ScreenshotRef != "")
    {
        imgMap1.Image = Material(DynamicLoadObject(MapOptions[0].ScreenshotRef, Class'Engine.Material'));
    }
    lblNoPreview1.bVisible = MapOptions[0].ScreenshotRef == "";
    cbMap1.Caption = MapOptions[0].MapName;
    // End:0x11F
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
    local string Desc, tmp;
    local Class<UT2K4TeamRoster> ETI;
    local GameRecord GR;

    GR = Class'Engine.CacheManager'.static.GetGameRecord(ChalGameType);
    ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), Class'Core.Class'));
    GP.ChallengeInfo.LevelName = MapOptions[selectedMap].MapName;
    GP.ChallengeInfo.DifficultyModifier = float(ETI.default.TeamLevel) / 1.2000000;
    GP.ChallengeInfo.PrizeMoney = 0;
    GP.ChallengeInfo.GameType = ChalGameType;
    // End:0xFD
    if(cbInstaGib.IsChecked())
    {
        GP.ChallengeInfo.GoalScore = float(InstaGoalScore);        
    }
    else
    {
        GP.ChallengeInfo.GoalScore = float(NormalGoalScore);
    }
    // End:0x141
    if(bChallenged)
    {
        GP.ChallengeInfo.EntryFee = 0;        
    }
    else
    {
        GP.ChallengeInfo.EntryFee = int(float(GP.GetBotPrice(clSelChar.GetName(),,, true)) * Class'WGame.BloodRites'.default.ChalFeeMultiply);
    }
    GP.ChallengeInfo.URLString = DefaultUrl;
    // End:0x1DD
    if(cbInstaGib.IsChecked())
    {
        GP.ChallengeInfo.URLString $= MutInstaGib;
    }
    // End:0x1F4
    if(bChallenged)
    {
        Desc = msgChallenged;        
    }
    else
    {
        Desc = msgChallenge;
    }
    Desc = Repl(Desc, "%map%", MapOptions[selectedMap].MapName);
    Desc = Repl(Desc, "%enemyteam%", cbEnemyTeam.GetText());
    Desc = Repl(Desc, "%selectedchar%", clSelChar.GetName());
    Desc = Repl(Desc, "%entryfee%", GP.MoneyToString(GP.ChallengeInfo.EntryFee));
    // End:0x2E3
    if(cbInstaGib.IsChecked())
    {
        tmp = msgInstaGib @ GR.GameName;        
    }
    else
    {
        tmp = GR.GameName;
    }
    Desc = Repl(Desc, "%gametype%", tmp);
    Desc = Repl(Desc, "%penalty%", GP.MoneyToString(CancelPenalty));
    // End:0x399
    if(GP.Balance < (GP.getMinimalEntryFeeFor(GP.ChallengeInfo) + GP.MinBalance))
    {
        Desc $= ("|" $ Class'GUI2K4_Decompressed.UT2K4SP_CGManoEMano'.default.NotEnoughCash);
    }
    sbDetails.SetContent(Desc);
    // End:0x3F8
    if(bChallenged)
    {
        // End:0x3E6
        if(GP.ChallengeInfo.LevelName != "")
        {
            btnOk.EnableMe();            
        }
        else
        {
            btnOk.DisableMe();
        }        
    }
    else
    {
        // End:0x46A
        if((GP.ChallengeInfo.LevelName != "") && GP.Balance > (GP.getMinimalEntryFeeFor(GP.ChallengeInfo) + GP.MinBalance))
        {
            btnOk.EnableMe();            
        }
        else
        {
            btnOk.DisableMe();
        }
    }
    //return;    
}

event HandleParameters(string Param1, string Param2)
{
    local int i, cnt, minTeamFee, cbot;
    local Class<UT2K4TeamRoster> ET;
    local array<string> ETR;
    local GUIController MyController;

    bChallenged = Param2 != "";
    cnt = 0;
    i = 0;
    J0x1E:

    // End:0xA3 [Loop If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0x99
        if(GP.PlayerTeam[i] != "")
        {
            // End:0x99
            if(int(GP.BotStats[GP.GetBotPosition(GP.PlayerTeam[i])].Health) >= 100)
            {
                cnt++;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1E;
    }
    GP.ChallengeInfo.NumBots = Min((cnt * 2) + 1, 7);
    cbEnemyTeam.MyComboBox.List.Clear();
    minimalEntryFee = 2147483647;
    minTeamFee = int(GP.getMinimalTeamFee(GP.ChallengeInfo.NumBots / 2));
    i = 0;
    J0x130:

    // End:0x36C [Loop If]
    if(i < GP.TeamStats.Length)
    {
        // End:0x362
        if(GP.TeamStats[i].Matches > 0)
        {
            // End:0x18B
            if(GP.TeamStats[i].Name == "")
            {
                // [Explicit Continue]
                goto J0x362;
            }
            ET = Class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[i].Name, Class'Core.Class'));
            // End:0x362
            if(ET != none)
            {
                // End:0x20B
                if(!GP.GetAltTeamRoster(GP.TeamStats[i].Name, ETR))
                {
                    ETR = ET.default.RosterNames;
                }
                // End:0x277
                if(bChallenged)
                {
                    cbEnemyTeam.AddItem(((ET.default.TeamName @ "(") $ Class'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies'.default.StrengthLabels[ET.default.TeamLevel]) $ ")",, GP.TeamStats[i].Name);
                    // [Explicit Continue]
                    goto J0x362;
                }
                // End:0x362
                if(ETR.Length > 5)
                {
                    cbot = int(float(CheapestBot(ETR)) * Class'WGame.BloodRites'.default.ChalFeeMultiply);
                    // End:0x2C0
                    if(!bChallenged)
                    {
                        cbot += minTeamFee;
                    }
                    // End:0x2DA
                    if(cbot < minimalEntryFee)
                    {
                        minimalEntryFee = cbot;
                    }
                    // End:0x362
                    if(cbot < (GP.Balance - GP.MinBalance))
                    {
                        cbEnemyTeam.AddItem(((ET.default.TeamName @ "(") $ Class'GUI2K4_Decompressed.UT2K4SPTab_DetailEnemies'.default.StrengthLabels[ET.default.TeamLevel]) $ ")",, GP.TeamStats[i].Name);
                    }
                }
            }
        }
        J0x362:

        i++;
        // [Loop Continue]
        goto J0x130;
    }
    Log(("Min. entry fee is" @ string(minimalEntryFee)) @ string(minimalEntryFee + GP.MinBalance), GP.LogPrefix);
    cbEnemyTeam.MyComboBox.List.Sort();
    // End:0x402
    if(cbEnemyTeam.ItemCount() > 0)
    {
        cbEnemyTeam.SetIndex(0);
        UpdateEnemyTeam(cbEnemyTeam);
    }
    ChallengedBy = Param1;
    // End:0x453
    if((ChallengedBy != "") && cbEnemyTeam.ItemCount() > 0)
    {
        cbEnemyTeam.SetIndex(cbEnemyTeam.FindExtra(ChallengedBy));
    }
    // End:0x599
    if(bChallenged)
    {
        // End:0x557
        if(cbEnemyTeam.ItemCount() > 0)
        {
            cbEnemyTeam.DisableMe();
            clSelChar.PopulateList(GP.PlayerTeam);
            clSelChar.Find(clSelChar.PlayerList[Rand(clSelChar.ItemCount)].DefaultName);
            CancelPenalty = int(float(GP.GetBotPrice(clSelChar.GetName())) * ChalledFeeMultiply);
            clSelChar.DisableMe();
            btnNextChar.DisableMe();
            btnPrevChar.DisableMe();
            cbInstaGib.Checked(bool(Rand(2)));
            cbInstaGib.DisableMe();
            UpdateDetails(none);
        }
        // End:0x596
        if((GP.Balance - GP.MinBalance) <= CancelPenalty)
        {
            CancelPenalty = 0;
            Controller.CloseMenu(true);
        }        
    }
    else
    {
        // End:0x5FB
        if((GP.Balance - GP.MinBalance) <= minimalEntryFee)
        {
            MyController = Controller;
            Controller.CloseMenu(true);
            MyController.ShowQuestionDialog(Class'GUI2K4_Decompressed.UT2K4SP_CGManoEMano'.default.NotEnoughCash);
            return;
        }
    }
    //return;    
}

function bool onOkClick(GUIComponent Sender)
{
    local int nummates, healthymates, i, j;
    local export editinline GUIQuestionPage QPage;
    local export editinline UT2K4SP_TeamRoles RoleWindow;
    local string tmp;

    // End:0x2C
    if(GP.ChallengeInfo.EntryFee > GP.Balance)
    {
        return false;
    }
    nummates = GP.GetNumTeammatesForMatchInfo(GP.ChallengeInfo);
    // End:0x1FC
    if(nummates > 0)
    {
        healthymates = 0;
        i = 0;
        J0x68:

        // End:0xEC [Loop If]
        if(i < GP.GetMaxTeamSize())
        {
            j = GP.GetBotPosition(GP.PlayerTeam[i]);
            // End:0xE2
            if(j > -1)
            {
                // End:0xE2
                if(int(GP.BotStats[j].Health) >= 100)
                {
                    healthymates++;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x68;
        }
        // End:0x180
        if(healthymates < nummates)
        {
            // End:0x17E
            if(Controller.OpenMenu(Controller.QuestionMenuClass))
            {
                QPage = GUIQuestionPage(Controller.TopPage());
                QPage.SetupQuestion(Repl(Repl(Class'GUI2K4_Decompressed.UT2K4SPTab_LadderBase'.default.NotEnoughPlayers, "%healthy%", string(healthymates)), "%teammates%", string(nummates)), 1);
            }
            return true;
        }
        GP.bIsChallenge = true;
        // End:0x1A6
        if(bChallenged)
        {
            tmp = "true";
        }
        // End:0x1F9
        if(Controller.OpenMenu(Class'GUI2K4_Decompressed.UT2K4SPTab_LadderBase'.default.TeamRoleWindow, tmp))
        {
            RoleWindow = UT2K4SP_TeamRoles(Controller.TopPage());
            RoleWindow.__onOkClick__Delegate = StartMatch;
        }        
    }
    else
    {
        StartMatch();
    }
    return true;
    //return;    
}

function StartMatch()
{
    GP.EnemyTeam = cbEnemyTeam.GetExtra();
    GP.ChallengeInfo.EnemyTeamName = GP.EnemyTeam;
    GP.bGotChallenged = bChallenged;
    // End:0xB1
    if(bChallenged)
    {
        GP.ChallengeInfo.SpecialEvent = ("UNTRADE" @ GP.ChallengeInfo.EnemyTeamName) @ clSelChar.GetName();        
    }
    else
    {
        GP.ChallengeInfo.SpecialEvent = ("TRADE" @ GP.ChallengeInfo.EnemyTeamName) @ clSelChar.GetName();
    }
    GP.ChallengeVariable = clSelChar.GetName();
    Log("Special event set to:" @ GP.ChallengeInfo.SpecialEvent);
    Class'WGame.BloodRites'.static.StartChallenge(GP, PlayerOwner().Level);
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
    // End:0x17F
    if(CancelPenalty > 0)
    {
        // End:0xE3
        if(CancelPenalty > GP.Balance)
        {
            // End:0xE0
            if(Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
            {
                QPage = GUIQuestionPage(Controller.TopPage());
                QPage.SetupQuestion(Repl(Repl(CantAffordCancel, "%cancelpenalty%", GP.MoneyToString(CancelPenalty)), "%balance%", GP.MoneyToString(GP.Balance)), 1, 1);
            }            
        }
        else
        {
            // End:0x17D
            if(Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
            {
                QPage = GUIQuestionPage(Controller.TopPage());
                QPage.SetupQuestion(Repl(PenaltyWarning, "%cancelpenalty%", GP.MoneyToString(CancelPenalty)), 48, 32);
                QPage.__OnButtonClick__Delegate = OnConfirmCancel;
            }
        }
        return false;
    }
    return true;
    //return;    
}

function UpdateDetails(GUIComponent Sender)
{
    lblSelCharName.Caption = clSelChar.GetName();
    // End:0x3A
    if(cbMap1.bChecked)
    {
        setChallengeInfo(0);        
    }
    else
    {
        // End:0x53
        if(cbMap2.bChecked)
        {
            setChallengeInfo(1);
        }
    }
    //return;    
}

function UpdateEnemyTeam(GUIComponent Sender)
{
    local array<string> Roster;
    local Class<UT2K4TeamRoster> ETI;

    // End:0x61
    if(!GP.GetAltTeamRoster(cbEnemyTeam.GetExtra(), Roster))
    {
        ETI = Class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), Class'Core.Class'));
        Roster = ETI.default.RosterNames;
    }
    // End:0xA8
    if(!bChallenged)
    {
        Roster.Remove(0, 1);
        clSelChar.PopulateList(Roster);
        clSelChar.SetIndex(Max(clSelChar.Index, 0));
    }
    UpdateDetails(Sender);
    //return;    
}

function bool onSelectChar(GUIComponent Sender)
{
    // End:0x21
    if(Sender == btnPrevChar)
    {
        clSelChar.ScrollLeft();        
    }
    else
    {
        // End:0x3F
        if(Sender == btnNextChar)
        {
            clSelChar.ScrollRight();
        }
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

function bool XButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCimgMap1'
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
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCimgMap2'
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
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCimgMapBg1'
    begin object name="SPCimgMapBg1" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    end object
    imgMapBg1=SPCimgMapBg1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCimgMapBg2'
    begin object name="SPCimgMapBg2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    end object
    imgMapBg2=SPCimgMapBg2
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPMbtnOk'
    begin object name="SPMbtnOk" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        WinTop=0.9127310
        WinLeft=0.7413210
        WinWidth=0.2222220
        WinHeight=0.0506940
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SP_CGBloodRites.onOkClick
        OnKeyEvent=SPMbtnOk.InternalOnKeyEvent
    end object
    btnOk=SPMbtnOk
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCbtnCancel'
    begin object name="SPCbtnCancel" class=XInterface.GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9127310
        WinLeft=0.0378480
        WinWidth=0.2222220
        WinHeight=0.0506940
        RenderWeight=0.2000000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4SP_CGBloodRites.onCancelClick
        OnKeyEvent=SPCbtnCancel.InternalOnKeyEvent
    end object
    btnCancel=SPCbtnCancel
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.CGBbtnNextChar'
    begin object name="CGBbtnNextChar" class=XInterface.GUIButton
        StyleName="ArrowRight"
        Hint="??? ???? ? ??? ??????."
        WinTop=0.6733330
        WinLeft=0.2034370
        WinWidth=0.0487500
        WinHeight=0.0737500
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=UT2K4SP_CGBloodRites.onSelectChar
        OnKeyEvent=CGBbtnNextChar.InternalOnKeyEvent
    end object
    btnNextChar=CGBbtnNextChar
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.CGBbtnPrevChar'
    begin object name="CGBbtnPrevChar" class=XInterface.GUIButton
        StyleName="ArrowLeft"
        Hint="??? ???? ? ??? ??????."
        WinTop=0.6733330
        WinLeft=0.0425000
        WinWidth=0.0487500
        WinHeight=0.0737500
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=UT2K4SP_CGBloodRites.onSelectChar
        OnKeyEvent=CGBbtnPrevChar.InternalOnKeyEvent
    end object
    btnPrevChar=CGBbtnPrevChar
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPClblTitle'
    begin object name="SPClblTitle" class=XInterface.GUILabel
        Caption="??????"
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
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.NoPreview'
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
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.CGBlblSelChar'
    begin object name="CGBlblSelChar" class=XInterface.GUILabel
        Caption="? ??"
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.5308640
        WinLeft=0.0472220
        WinWidth=0.1979170
        WinHeight=0.0437500
        bBoundToParent=true
    end object
    lblSelChar=CGBlblSelChar
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.CGBlblSelCharName'
    begin object name="CGBlblSelCharName" class=XInterface.GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.8475300
        WinLeft=0.0372220
        WinWidth=0.2229170
        WinHeight=0.0437500
        bBoundToParent=true
    end object
    lblSelCharName=CGBlblSelCharName
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPLlblBalance'
    begin object name="SPLlblBalance" class=XInterface.GUILabel
        TextAlign=2
        StyleName="TextLabel"
        WinTop=0.0420370
        WinLeft=0.5323600
        WinWidth=0.4500000
        WinHeight=0.0412500
        RenderWeight=0.2500000
        bBoundToParent=true
    end object
    lblBalance=SPLlblBalance
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCcbMap1'
    begin object name="SPCcbMap1" class=XInterface.GUIGFXButton
        bCheckBox=true
        WinTop=0.4529740
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.0625000
        bBoundToParent=true
        OnChange=UT2K4SP_CGBloodRites.OnMapSelect
        OnKeyEvent=SPCcbMap1.InternalOnKeyEvent
    end object
    cbMap1=SPCcbMap1
    // Reference: GUIGFXButton'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCcbMap2'
    begin object name="SPCcbMap2" class=XInterface.GUIGFXButton
        bCheckBox=true
        WinTop=0.4529740
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.0625000
        bBoundToParent=true
        OnChange=UT2K4SP_CGBloodRites.OnMapSelect
        OnKeyEvent=SPCcbMap2.InternalOnKeyEvent
    end object
    cbMap2=SPCcbMap2
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCcbEnemyTeam'
    begin object name="SPCcbEnemyTeam" class=XInterface.moComboBox
        bReadOnly=true
        Caption="???:"
        OnCreateComponent=SPCcbEnemyTeam.InternalOnCreateComponent
        Hint="? ??? ?????."
        WinTop=0.5281140
        WinLeft=0.2805560
        WinWidth=0.6965280
        WinHeight=0.0534720
        TabOrder=3
        bBoundToParent=true
        OnChange=UT2K4SP_CGBloodRites.UpdateEnemyTeam
    end object
    cbEnemyTeam=SPCcbEnemyTeam
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCsbDetails'
    begin object name="SPCsbDetails" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=SPCsbDetails.InternalOnCreateComponent
        WinTop=0.6579760
        WinLeft=0.2822920
        WinWidth=0.6895830
        WinHeight=0.2436110
        RenderWeight=0.2000000
        TabOrder=1
        bBoundToParent=true
    end object
    sbDetails=SPCsbDetails
    // Reference: GUICharacterListTeam'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.CGBclSelChar'
    begin object name="CGBclSelChar" class=XInterface.GUICharacterListTeam
        FixedItemsPerPage=1
        StyleName="CharButton"
        Hint="??? ???? ?????."
        WinTop=0.5762500
        WinLeft=0.0884620
        WinWidth=0.1184440
        WinHeight=0.2687500
        TabOrder=0
        bBoundToParent=true
        OnClick=CGBclSelChar.InternalOnClick
        OnRightClick=CGBclSelChar.InternalOnRightClick
        OnMousePressed=CGBclSelChar.InternalOnMousePressed
        OnMouseRelease=CGBclSelChar.InternalOnMouseRelease
        OnChange=UT2K4SP_CGBloodRites.UpdateDetails
        OnKeyEvent=CGBclSelChar.InternalOnKeyEvent
        OnBeginDrag=CGBclSelChar.InternalOnBeginDrag
        OnEndDrag=CGBclSelChar.InternalOnEndDrag
        OnDragDrop=CGBclSelChar.InternalOnDragDrop
        OnDragEnter=CGBclSelChar.InternalOnDragEnter
        OnDragLeave=CGBclSelChar.InternalOnDragLeave
        OnDragOver=CGBclSelChar.InternalOnDragOver
    end object
    clSelChar=CGBclSelChar
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4SP_CGBloodRites.SPCcbInstaGib'
    begin object name="SPCcbInstaGib" class=XInterface.moCheckBox
        Caption="??? ? ??"
        OnCreateComponent=SPCcbInstaGib.InternalOnCreateComponent
        Hint="??? ? ?? ???."
        WinTop=0.5864470
        WinLeft=0.2805560
        WinWidth=0.6965280
        WinHeight=0.0534720
        TabOrder=4
        bBoundToParent=true
        OnChange=UT2K4SP_CGBloodRites.UpdateEnemyTeam
    end object
    cbInstaGib=SPCcbInstaGib
    PenaltyWarning="???? ?? %cancelpenalty%(?)? ???? ???.||?????????"
    SelectAMap="????? ??? ???? ??????."
    msgChallenge="??? %enemyteam%??? ??? ?? %selectedchar%(?)? ? ??? ??? ???. %enemyteam% ??? ???? ???, %entryfee%? ???? ???? ???. %gametype% ??? %map%?? ??? ????."
    msgChallenged="%enemyteam%??? ??? ?????. ???? ??? ??? %selectedchar%(?)? ?? ???? ????. %gametype% ??? %map%?? ??? ????.|??? ??? ?? %penalty% ??? ????? ???? ???."
    msgInstaGib="??? ?"
    CantAffordCancel="??? ?? ??? ???? ? ????.|??? ??? %cancelpenalty%? ???? ???, ??? ???? %balance% ?? ?? ?????."
    DefaultUrl="?TeamScreen=true"
    ChalGameType="wGame.wTeamGame"
    MutInstaGib="?mutator=wGame.MutInstaGib"
    ChalledFeeMultiply=2.0000000
    NormalGoalScore=25
    InstaGoalScore=35
    MapPrefix="DM"
    DefaultLeft=0.0500000
    DefaultTop=0.0500000
    DefaultWidth=0.9000000
    DefaultHeight=0.9000000
    OnClose=UT2K4SP_CGBloodRites.OnWindowClose
    OnCanClose=UT2K4SP_CGBloodRites.OnCanWindowClose
    WinTop=0.0500000
    WinLeft=0.0500000
    WinWidth=0.9000000
    WinHeight=0.9000000
}