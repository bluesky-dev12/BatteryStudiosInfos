/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_CGBloodRites.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:41
 *	Functions:18
 *
 *******************************************************************************/
class UT2K4SP_CGBloodRites extends LargeWindow
    dependson(UT2K4SP_TeamRoles)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMap1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMap2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMapBg1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgMapBg2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnNextChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnPrevChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoPreview1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblNoPreview2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblSelChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblSelCharName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblBalance;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton cbMap1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIGFXButton cbMap2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox cbEnemyTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sbDetails;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUICharacterListTeam clSelChar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox cbInstaGib;
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
    // End:0x88 [While If]
    if(i < Controls.Length)
    {
        Controls[i].bScaleToParent = true;
        Controls[i].bBoundToParent = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    class'CacheManager'.static.GetMapList(mapData, MapPrefix);
    i = mapData.Length - 1;
    J0xad:
    // End:0x15a [While If]
    if(i >= 0)
    {
        // End:0xde
        if(mapData[i].PlayerCountMax < 7)
        {
            mapData.Remove(i, 1);
        }
        // End:0x150
        else
        {
            // End:0x100
            if(class'CacheManager'.static.Is2004Content(mapData[i].MapName))
            {
            }
            // End:0x150
            else
            {
                // End:0x122
                if(class'CacheManager'.static.Is2003Content(mapData[i].MapName))
                {
                }
                // End:0x150
                else
                {
                    // End:0x144
                    if(class'CacheManager'.static.IsBPContent(mapData[i].MapName))
                    {
                    }
                    // End:0x150
                    else
                    {
                        mapData.Remove(i, 1);
                    }
                }
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0xad;
    }
    SetupNoPreview(lblNoPreview1, imgMap1);
    SetupNoPreview(lblNoPreview2, imgMap2);
    sbDetails.SetContent(SelectAMap);
    GetRandomMaps();
    lblBalance.Caption = class'UT2K4SPTab_LadderBase'.default.BalanceLabel @ GP.MoneyToString(GP.Balance);
}

function int CheapestBot(array<string> List)
{
    local int curmin, i, bp;

    curmin = 2147483647;
    i = 0;
    J0x12:
    // End:0x69 [While If]
    if(i < List.Length)
    {
        bp = GP.GetBotPrice(List[i],,, true);
        // End:0x5f
        if(bp < curmin)
        {
            curmin = bp;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return curmin;
}

function GetRandomMaps()
{
    MapOptions[0] = mapData[Rand(mapData.Length)];
    // End:0x3c [While If]
    if(mapData.Length <= 1)
    {
        Warn("MapData.length <= 1");
        JumpToken-JumpToken(System.InvalidCastException: Unable to cast object of type 'EndFunctionParmsToken' to type 'JumpToken'.
   at UELib.Core.UStruct.UByteCodeDecompiler.JumpToken.Decompile()
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile())
    }
    MapOptions[1] = mapData[Rand(mapData.Length)];
    // End:0x16
    if(MapOptions[0] != MapOptions[1])
    	goto J0x16;
    J0x68:
    // End:0xa6
    if(MapOptions[0].ScreenshotRef != "")
    {
        imgMap1.Image = Material(DynamicLoadObject(MapOptions[0].ScreenshotRef, class'Material'));
    }
    lblNoPreview1.bVisible = MapOptions[0].ScreenshotRef == "";
    cbMap1.Caption = MapOptions[0].MapName;
    // End:0x11f
    if(MapOptions[1].ScreenshotRef != "")
    {
        imgMap2.Image = Material(DynamicLoadObject(MapOptions[1].ScreenshotRef, class'Material'));
    }
    lblNoPreview2.bVisible = MapOptions[1].ScreenshotRef == "";
    cbMap2.Caption = MapOptions[1].MapName;
}

function setChallengeInfo(int selectedMap)
{
    local string Desc, tmp;
    local class<UT2K4TeamRoster> ETI;
    local GameRecord GR;

    GR = class'CacheManager'.static.GetGameRecord(ChalGameType);
    ETI = class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), class'Class'));
    GP.ChallengeInfo.LevelName = MapOptions[selectedMap].MapName;
    GP.ChallengeInfo.DifficultyModifier = float(ETI.default.TeamLevel) / 1.20;
    GP.ChallengeInfo.PrizeMoney = 0;
    GP.ChallengeInfo.GameType = ChalGameType;
    // End:0xfd
    if(cbInstaGib.IsChecked())
    {
        GP.ChallengeInfo.GoalScore = float(InstaGoalScore);
    }
    // End:0x11c
    else
    {
        GP.ChallengeInfo.GoalScore = float(NormalGoalScore);
    }
    // End:0x141
    if(bChallenged)
    {
        GP.ChallengeInfo.EntryFee = 0;
    }
    // End:0x18e
    else
    {
        GP.ChallengeInfo.EntryFee = int(float(GP.GetBotPrice(clSelChar.GetName(),,, true)) * class'BloodRites'.default.ChalFeeMultiply);
    }
    GP.ChallengeInfo.URLString = DefaultUrl;
    // End:0x1dd
    if(cbInstaGib.IsChecked())
    {
        GP.ChallengeInfo.URLString $= MutInstaGib;
    }
    // End:0x1f4
    if(bChallenged)
    {
        Desc = msgChallenged;
    }
    // End:0x1ff
    else
    {
        Desc = msgChallenge;
    }
    Desc = Repl(Desc, "%map%", MapOptions[selectedMap].MapName);
    Desc = Repl(Desc, "%enemyteam%", cbEnemyTeam.GetText());
    Desc = Repl(Desc, "%selectedchar%", clSelChar.GetName());
    Desc = Repl(Desc, "%entryfee%", GP.MoneyToString(GP.ChallengeInfo.EntryFee));
    // End:0x2e3
    if(cbInstaGib.IsChecked())
    {
        tmp = msgInstaGib @ GR.GameName;
    }
    // End:0x2f3
    else
    {
        tmp = GR.GameName;
    }
    Desc = Repl(Desc, "%gametype%", tmp);
    Desc = Repl(Desc, "%penalty%", GP.MoneyToString(CancelPenalty));
    // End:0x399
    if(GP.Balance < GP.getMinimalEntryFeeFor(GP.ChallengeInfo) + GP.MinBalance)
    {
        Desc $= "|" $ class'UT2K4SP_CGManoEMano'.default.NotEnoughCash;
    }
    sbDetails.SetContent(Desc);
    // End:0x3f8
    if(bChallenged)
    {
        // End:0x3e6
        if(GP.ChallengeInfo.LevelName != "")
        {
            btnOk.EnableMe();
        }
        // End:0x3f5
        else
        {
            btnOk.DisableMe();
        }
    }
    // End:0x479
    else
    {
        // End:0x46a
        if(GP.ChallengeInfo.LevelName != "" && GP.Balance > GP.getMinimalEntryFeeFor(GP.ChallengeInfo) + GP.MinBalance)
        {
            btnOk.EnableMe();
        }
        // End:0x479
        else
        {
            btnOk.DisableMe();
        }
    }
}

event HandleParameters(string Param1, string Param2)
{
    local int i, cnt, minTeamFee, cbot;
    local class<UT2K4TeamRoster> ET;
    local array<string> ETR;
    local GUIController MyController;

    bChallenged = Param2 != "";
    cnt = 0;
    i = 0;
    J0x1e:
    // End:0xa3 [While If]
    if(i < GP.GetMaxTeamSize())
    {
        // End:0x99
        if(GP.PlayerTeam[i] != "")
        {
            // End:0x99
            if(GP.BotStats[GP.GetBotPosition(GP.PlayerTeam[i])].Health >= 100)
            {
                ++ cnt;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
    GP.ChallengeInfo.NumBots = Min(cnt * 2 + 1, 7);
    cbEnemyTeam.MyComboBox.List.Clear();
    minimalEntryFee = 2147483647;
    minTeamFee = int(GP.getMinimalTeamFee(GP.ChallengeInfo.NumBots / 2));
    i = 0;
    J0x130:
    // End:0x36c [While If]
    if(i < GP.TeamStats.Length)
    {
        // End:0x362
        if(GP.TeamStats[i].Matches > 0)
        {
            // End:0x18b
            if(GP.TeamStats[i].Name == "")
            {
            }
            // End:0x362
            else
            {
                ET = class<UT2K4TeamRoster>(DynamicLoadObject(GP.TeamStats[i].Name, class'Class'));
                // End:0x362
                if(ET != none)
                {
                    // End:0x20b
                    if(!GP.GetAltTeamRoster(GP.TeamStats[i].Name, ETR))
                    {
                        ETR = ET.default.RosterNames;
                    }
                    // End:0x277
                    if(bChallenged)
                    {
                        cbEnemyTeam.AddItem(ET.default.TeamName @ "(" $ class'UT2K4SPTab_DetailEnemies'.default.StrengthLabels[ET.default.TeamLevel] $ ")",, GP.TeamStats[i].Name);
                    }
                    // End:0x362
                    else
                    {
                        // End:0x362
                        if(ETR.Length > 5)
                        {
                            cbot = int(float(CheapestBot(ETR)) * class'BloodRites'.default.ChalFeeMultiply);
                            // End:0x2c0
                            if(!bChallenged)
                            {
                                cbot += minTeamFee;
                            }
                            // End:0x2da
                            if(cbot < minimalEntryFee)
                            {
                                minimalEntryFee = cbot;
                            }
                            // End:0x362
                            if(cbot < GP.Balance - GP.MinBalance)
                            {
                                cbEnemyTeam.AddItem(ET.default.TeamName @ "(" $ class'UT2K4SPTab_DetailEnemies'.default.StrengthLabels[ET.default.TeamLevel] $ ")",, GP.TeamStats[i].Name);
                            }
                        }
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x130;
    }
    Log("Min. entry fee is" @ string(minimalEntryFee) @ string(minimalEntryFee + GP.MinBalance), GP.LogPrefix);
    cbEnemyTeam.MyComboBox.List.Sort();
    // End:0x402
    if(cbEnemyTeam.ItemCount() > 0)
    {
        cbEnemyTeam.SetIndex(0);
        UpdateEnemyTeam(cbEnemyTeam);
    }
    ChallengedBy = Param1;
    // End:0x453
    if(ChallengedBy != "" && cbEnemyTeam.ItemCount() > 0)
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
        if(GP.Balance - GP.MinBalance <= CancelPenalty)
        {
            CancelPenalty = 0;
            Controller.CloseMenu(true);
        }
    }
    // End:0x5fb
    else
    {
        // End:0x5fb
        if(GP.Balance - GP.MinBalance <= minimalEntryFee)
        {
            MyController = Controller;
            Controller.CloseMenu(true);
            MyController.ShowQuestionDialog(class'UT2K4SP_CGManoEMano'.default.NotEnoughCash);
            return;
        }
    }
}

function bool onOkClick(GUIComponent Sender)
{
    local int nummates, healthymates, i, j;
    local export editinline GUIQuestionPage QPage;
    local export editinline UT2K4SP_TeamRoles RoleWindow;
    local string tmp;

    // End:0x2c
    if(GP.ChallengeInfo.EntryFee > GP.Balance)
    {
        return false;
    }
    nummates = GP.GetNumTeammatesForMatchInfo(GP.ChallengeInfo);
    // End:0x1fc
    if(nummates > 0)
    {
        healthymates = 0;
        i = 0;
        J0x68:
        // End:0xec [While If]
        if(i < GP.GetMaxTeamSize())
        {
            j = GP.GetBotPosition(GP.PlayerTeam[i]);
            // End:0xe2
            if(j > -1)
            {
                // End:0xe2
                if(GP.BotStats[j].Health >= 100)
                {
                    ++ healthymates;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x68;
        }
        // End:0x180
        if(healthymates < nummates)
        {
            // End:0x17e
            if(Controller.OpenMenu(Controller.QuestionMenuClass))
            {
                QPage = GUIQuestionPage(Controller.TopPage());
                QPage.SetupQuestion(Repl(Repl(class'UT2K4SPTab_LadderBase'.default.NotEnoughPlayers, "%healthy%", string(healthymates)), "%teammates%", string(nummates)), 1);
            }
            return true;
        }
        GP.bIsChallenge = true;
        // End:0x1a6
        if(bChallenged)
        {
            tmp = "true";
        }
        // End:0x1f9
        if(Controller.OpenMenu(class'UT2K4SPTab_LadderBase'.default.TeamRoleWindow, tmp))
        {
            RoleWindow = UT2K4SP_TeamRoles(Controller.TopPage());
            RoleWindow.__onOkClick__Delegate = StartMatch;
        }
    }
    // End:0x202
    else
    {
        StartMatch();
    }
    return true;
}

function StartMatch()
{
    GP.EnemyTeam = cbEnemyTeam.GetExtra();
    GP.ChallengeInfo.EnemyTeamName = GP.EnemyTeam;
    GP.bGotChallenged = bChallenged;
    // End:0xb1
    if(bChallenged)
    {
        GP.ChallengeInfo.SpecialEvent = "UNTRADE" @ GP.ChallengeInfo.EnemyTeamName @ clSelChar.GetName();
    }
    // End:0xfa
    else
    {
        GP.ChallengeInfo.SpecialEvent = "TRADE" @ GP.ChallengeInfo.EnemyTeamName @ clSelChar.GetName();
    }
    GP.ChallengeVariable = clSelChar.GetName();
    Log("Special event set to:" @ GP.ChallengeInfo.SpecialEvent);
    class'BloodRites'.static.StartChallenge(GP, PlayerOwner().Level);
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
    // End:0x17f
    if(CancelPenalty > 0)
    {
        // End:0xe3
        if(CancelPenalty > GP.Balance)
        {
            // End:0xe0
            if(Controller.OpenMenu("GUI2K4.GUI2K4QuestionPage"))
            {
                QPage = GUIQuestionPage(Controller.TopPage());
                QPage.SetupQuestion(Repl(Repl(CantAffordCancel, "%cancelpenalty%", GP.MoneyToString(CancelPenalty)), "%balance%", GP.MoneyToString(GP.Balance)), 1, 1);
            }
        }
        // End:0x17d
        else
        {
            // End:0x17d
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
}

function UpdateDetails(GUIComponent Sender)
{
    lblSelCharName.Caption = clSelChar.GetName();
    // End:0x3a
    if(cbMap1.bChecked)
    {
        setChallengeInfo(0);
    }
    // End:0x53
    else
    {
        // End:0x53
        if(cbMap2.bChecked)
        {
            setChallengeInfo(1);
        }
    }
}

function UpdateEnemyTeam(GUIComponent Sender)
{
    local array<string> Roster;
    local class<UT2K4TeamRoster> ETI;

    // End:0x61
    if(!GP.GetAltTeamRoster(cbEnemyTeam.GetExtra(), Roster))
    {
        ETI = class<UT2K4TeamRoster>(DynamicLoadObject(cbEnemyTeam.GetExtra(), class'Class'));
        Roster = ETI.default.RosterNames;
    }
    // End:0xa8
    if(!bChallenged)
    {
        Roster.Remove(0, 1);
        clSelChar.PopulateList(Roster);
        clSelChar.SetIndex(Max(clSelChar.Index, 0));
    }
    UpdateDetails(Sender);
}

function bool onSelectChar(GUIComponent Sender)
{
    // End:0x21
    if(Sender == btnPrevChar)
    {
        clSelChar.ScrollLeft();
    }
    // End:0x3f
    else
    {
        // End:0x3f
        if(Sender == btnNextChar)
        {
            clSelChar.ScrollRight();
        }
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

function bool XButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
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
    // Reference: GUIImage'UT2K4SP_CGBloodRites.SPCimgMap1'
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
    // Reference: GUIImage'UT2K4SP_CGBloodRites.SPCimgMap2'
    imgMap2=SPCimgMap2
    begin object name=SPCimgMapBg1 class=GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.0208330
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGBloodRites.SPCimgMapBg1'
    imgMapBg1=SPCimgMapBg1
    begin object name=SPCimgMapBg2 class=GUIImage
        ImageStyle=2
        WinTop=0.1113080
        WinLeft=0.5347220
        WinWidth=0.4444440
        WinHeight=0.3333330
        bBoundToParent=true
    object end
    // Reference: GUIImage'UT2K4SP_CGBloodRites.SPCimgMapBg2'
    imgMapBg2=SPCimgMapBg2
    begin object name=SPMbtnOk class=GUIButton
        Caption="??"
        MenuState=4
        FontScale=0
        WinTop=0.9127310
        WinLeft=0.7413210
        WinWidth=0.2222220
        WinHeight=0.0506940
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
        OnClick=onOkClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGBloodRites.SPMbtnOk'
    btnOk=SPMbtnOk
    begin object name=SPCbtnCancel class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.9127310
        WinLeft=0.0378480
        WinWidth=0.2222220
        WinHeight=0.0506940
        RenderWeight=0.20
        TabOrder=2
        bBoundToParent=true
        OnClick=onCancelClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGBloodRites.SPCbtnCancel'
    btnCancel=SPCbtnCancel
    begin object name=CGBbtnNextChar class=GUIButton
        StyleName="ArrowRight"
        Hint="??? ???? ? ??? ??????."
        WinTop=0.6733330
        WinLeft=0.2034370
        WinWidth=0.048750
        WinHeight=0.073750
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=3
        OnClick=onSelectChar
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGBloodRites.CGBbtnNextChar'
    btnNextChar=CGBbtnNextChar
    begin object name=CGBbtnPrevChar class=GUIButton
        StyleName="ArrowLeft"
        Hint="??? ???? ? ??? ??????."
        WinTop=0.6733330
        WinLeft=0.04250
        WinWidth=0.048750
        WinHeight=0.073750
        bBoundToParent=true
        bNeverFocus=true
        bRepeatClick=true
        OnClickSound=4
        OnClick=onSelectChar
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_CGBloodRites.CGBbtnPrevChar'
    btnPrevChar=CGBbtnPrevChar
    begin object name=SPClblTitle class=GUILabel
        Caption="??????"
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
    // Reference: GUILabel'UT2K4SP_CGBloodRites.SPClblTitle'
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
    // Reference: GUILabel'UT2K4SP_CGBloodRites.NoPreview'
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
    // Reference: GUILabel'UT2K4SP_CGBloodRites.NoPreview'
    lblNoPreview2=NoPreview
    begin object name=CGBlblSelChar class=GUILabel
        Caption="? ??"
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.5308640
        WinLeft=0.0472220
        WinWidth=0.1979170
        WinHeight=0.043750
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGBloodRites.CGBlblSelChar'
    lblSelChar=CGBlblSelChar
    begin object name=CGBlblSelCharName class=GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.847530
        WinLeft=0.0372220
        WinWidth=0.2229170
        WinHeight=0.043750
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGBloodRites.CGBlblSelCharName'
    lblSelCharName=CGBlblSelCharName
    begin object name=SPLlblBalance class=GUILabel
        TextAlign=2
        StyleName="TextLabel"
        WinTop=0.0420370
        WinLeft=0.532360
        WinWidth=0.450
        WinHeight=0.041250
        RenderWeight=0.250
        bBoundToParent=true
    object end
    // Reference: GUILabel'UT2K4SP_CGBloodRites.SPLlblBalance'
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
    // Reference: GUIGFXButton'UT2K4SP_CGBloodRites.SPCcbMap1'
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
    // Reference: GUIGFXButton'UT2K4SP_CGBloodRites.SPCcbMap2'
    cbMap2=SPCcbMap2
    begin object name=SPCcbEnemyTeam class=moComboBox
        bReadOnly=true
        Caption="???:"
        OnCreateComponent=InternalOnCreateComponent
        Hint="? ??? ?????."
        WinTop=0.5281140
        WinLeft=0.2805560
        WinWidth=0.6965280
        WinHeight=0.0534720
        TabOrder=3
        bBoundToParent=true
        OnChange=UpdateEnemyTeam
    object end
    // Reference: moComboBox'UT2K4SP_CGBloodRites.SPCcbEnemyTeam'
    cbEnemyTeam=SPCcbEnemyTeam
    begin object name=SPCsbDetails class=GUIScrollTextBox
        bNoTeletype=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.6579760
        WinLeft=0.2822920
        WinWidth=0.6895830
        WinHeight=0.2436110
        RenderWeight=0.20
        TabOrder=1
        bBoundToParent=true
    object end
    // Reference: GUIScrollTextBox'UT2K4SP_CGBloodRites.SPCsbDetails'
    sbDetails=SPCsbDetails
    begin object name=CGBclSelChar class=GUICharacterListTeam
        FixedItemsPerPage=1
        StyleName="CharButton"
        Hint="??? ???? ?????."
        WinTop=0.576250
        WinLeft=0.0884620
        WinWidth=0.1184440
        WinHeight=0.268750
        TabOrder=0
        bBoundToParent=true
        OnClick=InternalOnClick
        OnRightClick=InternalOnRightClick
        OnMousePressed=InternalOnMousePressed
        OnMouseRelease=InternalOnMouseRelease
        OnChange=UpdateDetails
        OnKeyEvent=InternalOnKeyEvent
        OnBeginDrag=InternalOnBeginDrag
        OnEndDrag=InternalOnEndDrag
        OnDragDrop=InternalOnDragDrop
        OnDragEnter=InternalOnDragEnter
        OnDragLeave=InternalOnDragLeave
        OnDragOver=InternalOnDragOver
    object end
    // Reference: GUICharacterListTeam'UT2K4SP_CGBloodRites.CGBclSelChar'
    clSelChar=CGBclSelChar
    begin object name=SPCcbInstaGib class=moCheckBox
        Caption="??? ? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ? ?? ???."
        WinTop=0.5864470
        WinLeft=0.2805560
        WinWidth=0.6965280
        WinHeight=0.0534720
        TabOrder=4
        bBoundToParent=true
        OnChange=UpdateEnemyTeam
    object end
    // Reference: moCheckBox'UT2K4SP_CGBloodRites.SPCcbInstaGib'
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
    ChalledFeeMultiply=2.0
    NormalGoalScore=25
    InstaGoalScore=35
    MapPrefix="DM"
    DefaultLeft=0.050
    DefaultTop=0.050
    DefaultWidth=0.90
    DefaultHeight=0.90
    OnClose=OnWindowClose
    OnCanClose=OnCanWindowClose
    WinTop=0.050
    WinLeft=0.050
    WinWidth=0.90
    WinHeight=0.90
}