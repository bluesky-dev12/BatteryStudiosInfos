/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_Main.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:27
 *	Functions:21
 *
 *******************************************************************************/
class UT2K4SP_Main extends UT2k4MainPage
    dependson(UT2k4MainPage)
    dependson(UT2K4SPTab_LadderBase)
    dependson(UT2K4SPTab_Base)
    dependson(SPHighScore)
    dependson(UT2K4SPTab_TeamManagement)
    dependson(UT2K4SPTab_Tutorials)
    config(User)
    editinlinenew
    instanced;

const SPDEBUGMODE = false;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnBack;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnPlay;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnDetails;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnDebugExec;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIEditBox edDebugExec;
var localized string PageCaption;
var localized string LoadedPageCaption;
var localized string LadderCompleteMsg;
var localized string msgFullTeamRequired;
var localized array<localized string> DonationMsg;
var string ProfilePrefix;
var export editinline UT2K4SPTab_Profile tpProfile;
var export editinline UT2K4SPTab_Tutorials tpTutorials;
var export editinline UT2K4SPTab_Qualification tpQualification;
var export editinline UT2K4SPTab_TeamQualification tpTeamQualification;
var export editinline UT2K4SPTab_Ladder tpLadder;
var export editinline UT2K4SPTab_TeamManagement tpTeamManagement;
var UT2K4GameProfile GP;
var string DetailsPage;
var string InjuryPage;
var string MessagePage;
var string PictureMessagePage;
var string HighScorePage;
var string EndGameMap;
var export editinline GUITabPanel SetActiveTab;
var export editinline UT2K4SPTab_LadderBase LastLadderPage;
var config bool bEnableTC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    t_Header.SetCaption(PageCaption);
    tpProfile = UT2K4SPTab_Profile(AddTab(0, true));
    tpTutorials = UT2K4SPTab_Tutorials(AddTab(2, false));
}

event HandleParameters(string Param1, string Param2)
{
    UpdateTabs();
    HandleGameProfile();
    // End:0x35
    if(SetActiveTab != none)
    {
        c_Tabs.ActivateTab(SetActiveTab.MyButton, true);
    }
}

function HandleGameProfile()
{
    local bool bDonation;

    bDonation = false;
    // End:0x186
    if(GP != none)
    {
        // End:0x7a
        if(GP.Balance < GP.MinBalance)
        {
            GP.Balance = GP.MinBalance;
            // End:0x7a
            if(InStr(GP.SpecialEvent, ";DONATION") < 0)
            {
                bDonation = true;
            }
        }
        // End:0xc8
        if(GP.bInLadderGame && GP.bShowDetails && GP.lmdFreshInfo)
        {
            Controller.OpenMenu(DetailsPage);
        }
        // End:0x105
        if(GP.SpecialEvent != "" && GP.bInLadderGame)
        {
            HandleSpecialEvent(GP.SpecialEvent);
        }
        // End:0x155
        if(GP.LastInjured != -1)
        {
            Controller.OpenMenu(InjuryPage, string(GP.LastInjured));
            GP.LastInjured = -1;
        }
        GP.bInLadderGame = false;
        GP.bIsChallenge = false;
        // End:0x186
        if(bDonation)
        {
            reportDonation();
        }
    }
}

function bool InternalOnPreDraw(Canvas Canvas)
{
    local float XL, YL;

    // End:0x66
    if(btnDetails.bVisible)
    {
        btnDetails.Style.TextSize(Canvas, btnDetails.MenuState, btnDetails.Caption, XL, YL, btnDetails.FontScale);
    }
    // End:0xb7
    else
    {
        btnPlay.Style.TextSize(Canvas, btnPlay.MenuState, btnPlay.Caption, XL, YL, btnPlay.FontScale);
    }
    btnBack.WinWidth = XL + float(32);
    btnBack.WinLeft = Canvas.ClipX - btnBack.WinWidth;
    btnPlay.WinWidth = XL + float(32);
    btnPlay.WinLeft = btnBack.WinLeft - btnPlay.WinWidth;
    btnDetails.WinWidth = XL + float(32);
    btnDetails.WinLeft = btnPlay.WinLeft - btnDetails.WinWidth;
    return false;
}

function bool btnBackOnClick(GUIComponent Sender)
{
    // End:0x61
    if(c_Tabs.ActiveTab != none)
    {
        // End:0x61
        if(UT2K4SPTab_Base(c_Tabs.ActiveTab.MyPanel) != none)
        {
            // End:0x61
            if(UT2K4SPTab_Base(c_Tabs.ActiveTab.MyPanel).onBackClick())
            {
                return true;
            }
        }
    }
    // End:0x7f
    if(OnCanClose(true))
    {
        Controller.CloseMenu(true);
    }
    return true;
}

function bool btnPlayOnClick(GUIComponent Sender)
{
    // End:0x16
    if(c_Tabs.ActiveTab == none)
    {
        return false;
    }
    // End:0x5f
    if(UT2K4SPTab_Base(c_Tabs.ActiveTab.MyPanel) != none)
    {
        return UT2K4SPTab_Base(c_Tabs.ActiveTab.MyPanel).onPlayClick();
    }
    return false;
}

function bool btnDetailsOnClick(GUIComponent Sender)
{
    return Controller.OpenMenu(DetailsPage);
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    // End:0x4e
    if(GP == none)
    {
        t_Header.SetCaption(PageCaption @ "|" @ GUITabButton(Sender).Caption);
    }
    // End:0x8c
    else
    {
        t_Header.SetCaption(GP.PlayerName $ LoadedPageCaption @ "|" @ GUITabButton(Sender).Caption);
    }
}

function UpdateTabs(optional bool bPurge, optional bool bSetActive)
{
    local export editinline GUITabPanel tmp;

    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x7c
    if(GP == none || bPurge)
    {
        RemoveTab(tpQualification);
        RemoveTab(tpTeamQualification);
        RemoveTab(tpLadder);
        RemoveTab(tpTeamManagement);
        btnDetails.bVisible = false;
    }
    // End:0x303
    if(GP != none)
    {
        btnDetails.bVisible = GP.lmdGameType != "";
        tmp = AddTab(3, true);
        // End:0xd3
        if(tmp != none)
        {
            tpQualification = UT2K4SPTab_Qualification(tmp);
        }
        // End:0x14d
        if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_TDM] != -1)
        {
            tmp = AddTab(4, GP.Balance > GP.MinBalance);
            // End:0x14a
            if(tmp != none)
            {
                tpTeamQualification = UT2K4SPTab_TeamQualification(tmp);
            }
        }
        // End:0x158
        else
        {
            RemoveTab(tpTeamQualification);
        }
        // End:0x1cb
        if(GP.completedLadder(GP.UT2K4GameLadder.default.LID_TDM))
        {
            tmp = AddTab(5, GP.Balance > GP.MinBalance);
            // End:0x1c8
            if(tmp != none)
            {
                tpLadder = UT2K4SPTab_Ladder(tmp);
            }
        }
        // End:0x1d6
        else
        {
            RemoveTab(tpLadder);
        }
        // End:0x278
        if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_TDM] != -1)
        {
            tmp = AddTab(6, false);
            // End:0x230
            if(tmp != none)
            {
                tpTeamManagement = UT2K4SPTab_TeamManagement(tmp);
            }
            // End:0x275
            if(!GP.completedLadder(GP.UT2K4GameLadder.default.LID_TDM))
            {
                // End:0x275
                if(tpTeamManagement != none)
                {
                    tpTeamManagement.LockManagementTools();
                }
            }
        }
        // End:0x2b0
        else
        {
            // End:0x2a5
            if(tpTeamManagement != none)
            {
                // End:0x2a2
                if(!tpTeamManagement.bInitialDraft)
                {
                    RemoveTab(tpTeamManagement);
                }
            }
            // End:0x2b0
            else
            {
                RemoveTab(tpTeamManagement);
            }
        }
        // End:0x2ec
        if(GP.bCompleted)
        {
            // End:0x2e9
            if(GP.UT2K4GameLadder.default.AdditionalLadders.Length > 0)
            {
                AddTab(7, false);
            }
        }
        // End:0x303
        else
        {
            c_Tabs.RemoveTab(PanelCaption[7]);
        }
    }
    // End:0x337
    if(SetActiveTab != none && bSetActive)
    {
        c_Tabs.ActivateTab(SetActiveTab.MyButton, true);
    }
}

function GUITabPanel AddTab(int Index, optional bool bActive)
{
    local export editinline GUITabPanel res;
    local int X;

    X = c_Tabs.TabIndex(PanelCaption[Index]);
    // End:0x5d
    if(X > -1)
    {
        // End:0x5b
        if(bActive)
        {
            SetActiveTab = c_Tabs.TabStack[X].MyPanel;
        }
        return none;
    }
    res = c_Tabs.AddTab(PanelCaption[Index], PanelClass[Index],, PanelHint[Index], false);
    // End:0xa9
    if(bActive)
    {
        SetActiveTab = res;
    }
    // End:0xce
    if(UT2K4SPTab_Base(res) != none)
    {
        UT2K4SPTab_Base(res).MainWindow = self;
    }
    return res;
}

function GUITabPanel ReplaceTab(int Index, GUITabPanel previousPage, optional bool bActive)
{
    local export editinline GUITabPanel res;

    res = c_Tabs.ReplaceTab(previousPage.MyButton, PanelCaption[Index], PanelClass[Index],, PanelHint[Index], false);
    // End:0x5a
    if(bActive)
    {
        SetActiveTab = res;
    }
    // End:0x7f
    if(UT2K4SPTab_Base(res) != none)
    {
        UT2K4SPTab_Base(res).MainWindow = self;
    }
    return res;
}

function RemoveTab(GUITabPanel Tab)
{
    // End:0x46
    if(Tab != none)
    {
        // End:0x21
        if(SetActiveTab == Tab)
        {
            SetActiveTab = none;
        }
        c_Tabs.RemoveTab(, Tab.MyButton);
        Tab = none;
    }
}

function HandleSpecialEvent(string SpecialEvent)
{
    local array<string> Events, CurEvent;
    local int i, j;
    local array<TriString> ChalPages;

    // End:0x0d
    if(GP == none)
    {
        return;
    }
    Split(SpecialEvent, ";", Events);
    i = 0;
    J0x23:
    // End:0xdef [While If]
    if(i < Events.Length)
    {
        // End:0x48
        if(Events[i] == "")
        {
        }
        // End:0xde5
        else
        {
            Split(Events[i], " ", CurEvent);
            // End:0x6c
            if(CurEvent.Length == 0)
            {
            }
            // End:0xde5
            else
            {
                // End:0xa7
                if(false)
                {
                    Log("HandleSpecialEvent(" @ Events[i] @ ")", GP.LogPrefix);
                }
                // End:0xd6
                if(CurEvent[0] == "WELCOME")
                {
                    Controller.OpenMenu(MessagePage, "0");
                }
                // End:0xde5
                else
                {
                    // End:0x18e
                    if(CurEvent[0] == "DRAFT")
                    {
                        j = 0;
                        J0xf0:
                        // End:0x131 [While If]
                        if(j < GP.GetMaxTeamSize())
                        {
                            // End:0x127
                            if(GP.PlayerTeam[j] == "")
                            {
                            }
                            // End:0x131
                            else
                            {
                                ++ j;
                                // This is an implied JumpToken; Continue!
                                goto J0xf0;
                            }
                        }
                        // End:0x18b
                        if(j != GP.GetMaxTeamSize())
                        {
                            tpTeamManagement = UT2K4SPTab_TeamManagement(ReplaceTab(6, tpQualification, true));
                            tpTeamManagement.bInitialDraft = true;
                            Controller.OpenMenu(MessagePage, "1");
                        }
                    }
                    // End:0xde5
                    else
                    {
                        // End:0x257
                        if(CurEvent[0] == "QUALIFIED")
                        {
                            // End:0x1d3
                            if(CurEvent[1] == "SINGLE")
                            {
                                Controller.OpenMenu(MessagePage, "2");
                            }
                            // End:0x254
                            else
                            {
                                // End:0x254
                                if(CurEvent[1] == "TEAM")
                                {
                                    Controller.OpenMenu(MessagePage, "3");
                                    class'UT2K4SPTab_Tutorials'.static.unlockButton("TDM");
                                    // End:0x254
                                    if(GP.Matches == GP.Wins)
                                    {
                                        GP.GetTeamPosition("wGame.PhantomEpic", true);
                                    }
                                }
                            }
                        }
                        // End:0xde5
                        else
                        {
                            // End:0x50b
                            if(CurEvent[0] == "OPEN")
                            {
                                j = -1;
                                // End:0x2ae
                                if(CurEvent[1] == "TDM")
                                {
                                    GP.enableLadder(GP.UT2K4GameLadder.default.LID_TDM);
                                }
                                // End:0x4d6
                                else
                                {
                                    // End:0x2f0
                                    if(CurEvent[1] == "CTF")
                                    {
                                        GP.enableLadder(GP.UT2K4GameLadder.default.LID_CTF);
                                        j = 4;
                                    }
                                    // End:0x4d6
                                    else
                                    {
                                        // End:0x331
                                        if(CurEvent[1] == "BR")
                                        {
                                            GP.enableLadder(GP.UT2K4GameLadder.default.LID_BR);
                                            j = 5;
                                        }
                                        // End:0x4d6
                                        else
                                        {
                                            // End:0x36b
                                            if(CurEvent[1] == "DOM")
                                            {
                                                GP.enableLadder(GP.UT2K4GameLadder.default.LID_DOM);
                                            }
                                            // End:0x4d6
                                            else
                                            {
                                                // End:0x3ac
                                                if(CurEvent[1] == "AS")
                                                {
                                                    GP.enableLadder(GP.UT2K4GameLadder.default.LID_AS);
                                                    j = 6;
                                                }
                                                // End:0x4d6
                                                else
                                                {
                                                    // End:0x4b1
                                                    if(CurEvent[1] == "CHAMP")
                                                    {
                                                        GP.enableLadder(GP.UT2K4GameLadder.default.LID_CHAMP);
                                                        CurEvent[1] = GP.GetEnemyTeamName(GP.GetMatchInfo(GP.UT2K4GameLadder.default.LID_CHAMP, 0).EnemyTeamName);
                                                        // End:0x45b
                                                        if(CurEvent[1] ~= "wGame.TeamThundercrash")
                                                        {
                                                            j = 8;
                                                        }
                                                        // End:0x4ae
                                                        else
                                                        {
                                                            // End:0x487
                                                            if(CurEvent[1] ~= "wGame.TeamIronSkull")
                                                            {
                                                                j = 7;
                                                            }
                                                            // End:0x4ae
                                                            else
                                                            {
                                                                // End:0x4ae
                                                                if(CurEvent[1] ~= "wGame.TeamCorrupt")
                                                                {
                                                                    j = 9;
                                                                }
                                                            }
                                                        }
                                                    }
                                                    // End:0x4d6
                                                    else
                                                    {
                                                        // End:0x4d6
                                                        if(CurEvent[1] == "ALL")
                                                        {
                                                            GP.enableLadder(-1);
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                UpdateTabs(true, true);
                                // End:0x508
                                if(j > -1)
                                {
                                    Controller.OpenMenu(MessagePage, string(j));
                                }
                            }
                            // End:0xde5
                            else
                            {
                                // End:0x72e
                                if(CurEvent[0] == "COMPLETED")
                                {
                                    class'UT2K4SPTab_Tutorials'.static.unlockButton(CurEvent[1]);
                                    // End:0x6da
                                    if(CurEvent[1] == "CHAMP")
                                    {
                                        // End:0x572
                                        if(GP.PlayerCharacter ~= "Mr.Crow")
                                        {
                                            bEnableTC = true;
                                            SaveConfig();
                                        }
                                        GP.bInLadderGame = true;
                                        // End:0x5bb
                                        if(!GP.bCompleted)
                                        {
                                            GP.SpecialEvent = "SHOWSCORE" @ string(DoHighScore());
                                        }
                                        GP.bCompleted = true;
                                        PlayerOwner().Level.Game.SavePackage(GP.PackageName);
                                        // End:0x6bf
                                        if(EndGameMap != "")
                                        {
                                            Log("Starting endgame movie", GP.LogPrefix);
                                            bAllowedAsLast = true;
                                            Console(Controller.Master.Console).DelayedConsoleCommand("START " $ EndGameMap $ "?quickstart=true?TeamScreen=false?savegame=" $ GP.PackageName);
                                            Controller.CloseAll(false, true);
                                            return;
                                        }
                                        // End:0x6d7
                                        else
                                        {
                                            Controller.OpenMenu(MessagePage, "10");
                                        }
                                    }
                                    // End:0x72b
                                    else
                                    {
                                        // End:0x72b
                                        if(GP.openChampionshipLadder())
                                        {
                                            Log("Opening championship ladder", GP.LogPrefix);
                                            HandleSpecialEvent("OPEN CHAMP");
                                        }
                                    }
                                }
                                // End:0xde5
                                else
                                {
                                    // End:0x75f
                                    if(CurEvent[0] == "BALANCE")
                                    {
                                        GP.Balance += int(CurEvent[1]);
                                    }
                                    // End:0xde5
                                    else
                                    {
                                        // End:0x781
                                        if(CurEvent[0] == "UPDATETEAMS")
                                        {
                                            UpdateFreeAgentTeams();
                                        }
                                        // End:0xde5
                                        else
                                        {
                                            // End:0x7b6
                                            if(CurEvent[0] == "SHOWSCORE")
                                            {
                                                Controller.OpenMenu(HighScorePage, CurEvent[1]);
                                            }
                                            // End:0xde5
                                            else
                                            {
                                                // End:0x80c
                                                if(CurEvent[0] == "CHALLENGE")
                                                {
                                                    Controller.OpenMenu(GP.static.GetChallengeGame(CurEvent[2]).default.ChallengeMenu, CurEvent[1], "true");
                                                }
                                                // End:0xde5
                                                else
                                                {
                                                    // End:0x82b
                                                    if(CurEvent[0] == "DONATION")
                                                    {
                                                        reportDonation();
                                                    }
                                                    // End:0xde5
                                                    else
                                                    {
                                                        // End:0xc49
                                                        if(CurEvent[0] == "DEBUG" && false)
                                                        {
                                                            // End:0x866
                                                            if(CurEvent[1] == "UPDATETABS")
                                                            {
                                                                UpdateTabs(true);
                                                            }
                                                            // End:0xc46
                                                            else
                                                            {
                                                                // End:0x8a4
                                                                if(CurEvent[1] == "SETLADDER")
                                                                {
                                                                    GP.LadderProgress[int(CurEvent[2])] = int(CurEvent[3]);
                                                                }
                                                                // End:0xc46
                                                                else
                                                                {
                                                                    // End:0x8d2
                                                                    if(CurEvent[1] == "INLADDERGAME")
                                                                    {
                                                                        GP.bInLadderGame = true;
                                                                    }
                                                                    // End:0xc46
                                                                    else
                                                                    {
                                                                        // End:0x917
                                                                        if(CurEvent[1] == "INJURY")
                                                                        {
                                                                            Controller.OpenMenu("GUI2K4.UT2K4SP_Injury", CurEvent[2]);
                                                                        }
                                                                        // End:0xc46
                                                                        else
                                                                        {
                                                                            // End:0x957
                                                                            if(CurEvent[1] == "HEALTH")
                                                                            {
                                                                                GP.BotStats[int(CurEvent[2])].Health = byte(CurEvent[3]);
                                                                            }
                                                                            // End:0xc46
                                                                            else
                                                                            {
                                                                                // End:0x9ae
                                                                                if(CurEvent[1] == "ALTPATH")
                                                                                {
                                                                                    // End:0x992
                                                                                    if(CurEvent.Length <= 2)
                                                                                    {
                                                                                        GP.AltPath = Rand(2147483647);
                                                                                    }
                                                                                    // End:0x9ab
                                                                                    else
                                                                                    {
                                                                                        GP.AltPath = int(CurEvent[2]);
                                                                                    }
                                                                                }
                                                                                // End:0xc46
                                                                                else
                                                                                {
                                                                                    // End:0xb94
                                                                                    if(CurEvent[1] == "DUMP")
                                                                                    {
                                                                                        // End:0xab1
                                                                                        if(CurEvent[2] == "BOTSTATS")
                                                                                        {
                                                                                            j = 0;
                                                                                            J0x9de:
                                                                                            // End:0xaae [While If]
                                                                                            if(j < GP.BotStats.Length)
                                                                                            {
                                                                                                Log("::" @ string(j) @ GP.BotStats[j].Name @ string(GP.BotStats[j].Price) @ string(GP.BotStats[j].Health) @ string(GP.BotStats[j].FreeAgent) @ string(GP.BotStats[j].TeamID), GP.LogPrefix);
                                                                                                ++ j;
                                                                                                // This is an implied JumpToken; Continue!
                                                                                                goto J0x9de;
                                                                                            }
                                                                                        }
                                                                                        // End:0xb91
                                                                                        else
                                                                                        {
                                                                                            // End:0xb91
                                                                                            if(CurEvent[2] == "TEAMSTATS")
                                                                                            {
                                                                                                j = 0;
                                                                                                J0xad0:
                                                                                                // End:0xb91 [While If]
                                                                                                if(j < GP.TeamStats.Length)
                                                                                                {
                                                                                                    Log("::" @ string(j) @ GP.TeamStats[j].Name @ string(GP.TeamStats[j].Level) @ string(GP.TeamStats[j].Matches) @ string(GP.TeamStats[j].Won) @ string(GP.TeamStats[j].rating));
                                                                                                    ++ j;
                                                                                                    // This is an implied JumpToken; Continue!
                                                                                                    goto J0xad0;
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                    // End:0xc46
                                                                                    else
                                                                                    {
                                                                                        // End:0xbc5
                                                                                        if(CurEvent[1] == "MESG")
                                                                                        {
                                                                                            Controller.OpenMenu(MessagePage, CurEvent[2]);
                                                                                        }
                                                                                        // End:0xc46
                                                                                        else
                                                                                        {
                                                                                            // End:0xc00
                                                                                            if(CurEvent[1] == "NCOMPL")
                                                                                            {
                                                                                                GP.bCompleted = false;
                                                                                                GP.LadderProgress[6] = 1;
                                                                                            }
                                                                                            // End:0xc46
                                                                                            else
                                                                                            {
                                                                                                // End:0xc24
                                                                                                if(CurEvent[1] == "ON")
                                                                                                {
                                                                                                    GP.bDebug = true;
                                                                                                }
                                                                                                // End:0xc46
                                                                                                else
                                                                                                {
                                                                                                    // End:0xc46
                                                                                                    if(CurEvent[1] == "OFF")
                                                                                                    {
                                                                                                        GP.bDebug = false;
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        // End:0xde5
                                                        else
                                                        {
                                                            // End:0xd03
                                                            if(GP.lmdbChallengeGame && GP.ChallengeGameClass != none)
                                                            {
                                                                ChalPages.Length = 0;
                                                                GP.ChallengeGameClass.static.HandleSpecialEvent(GP, CurEvent, ChalPages);
                                                                j = 0;
                                                                J0xca7:
                                                                // End:0xd00 [While If]
                                                                if(j < ChalPages.Length)
                                                                {
                                                                    Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                                                                    ++ j;
                                                                    // This is an implied JumpToken; Continue!
                                                                    goto J0xca7;
                                                                }
                                                            }
                                                            // End:0xde5
                                                            else
                                                            {
                                                                // End:0xda9
                                                                if(GP.LastCustomCladder != none)
                                                                {
                                                                    ChalPages.Length = 0;
                                                                    GP.LastCustomCladder.static.HandleSpecialEvent(GP, CurEvent, ChalPages);
                                                                    j = 0;
                                                                    J0xd4d:
                                                                    // End:0xda6 [While If]
                                                                    if(j < ChalPages.Length)
                                                                    {
                                                                        Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                                                                        ++ j;
                                                                        // This is an implied JumpToken; Continue!
                                                                        goto J0xd4d;
                                                                    }
                                                                }
                                                                // End:0xde5
                                                                else
                                                                {
                                                                    Log("Unknown special event: '" $ Events[i] $ "'", GP.LogPrefix);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23;
    }
}

function bool HandleRequirements(string reqstring)
{
    local array<string> reqs, curreq;
    local int i, j;
    local array<TriString> ChalPages;
    local bool tempres;

    // End:0x0d
    if(GP == none)
    {
        return false;
    }
    // End:0x1b
    if(reqstring == "")
    {
        return true;
    }
    Split(reqstring, ";", reqs);
    i = 0;
    J0x31:
    // End:0x3b3 [While If]
    if(i < reqs.Length)
    {
        // End:0x5f
        if(Split(reqs[i], " ", curreq) == 0)
        {
        }
        // End:0x3a9
        else
        {
            // End:0x1a4
            if(curreq[0] == "FULLTEAM")
            {
                // End:0x1a1
                if(!GP.HasFullTeam())
                {
                    Log("Failed requirement: FULLTEAM", GP.LogPrefix);
                    // End:0x122
                    if(GP.completedLadder(GP.UT2K4GameLadder.default.LID_DM))
                    {
                        // End:0x11f
                        if(c_Tabs.ActiveTab != tpTeamManagement.MyButton)
                        {
                            c_Tabs.ActivateTab(tpTeamManagement.MyButton, true);
                        }
                    }
                    // End:0x18b
                    else
                    {
                        // End:0x18b
                        if(c_Tabs.ActiveTab.MyPanel != tpTeamManagement)
                        {
                            tpTeamManagement = UT2K4SPTab_TeamManagement(ReplaceTab(6, tpQualification, true));
                            tpTeamManagement.bInitialDraft = true;
                            c_Tabs.ActivateTab(tpTeamManagement.MyButton, true);
                        }
                    }
                    Controller.ShowQuestionDialog(msgFullTeamRequired);
                    return false;
                }
            }
            // End:0x3a9
            else
            {
                // End:0x28c
                if(GP.ChallengeGameClass != none)
                {
                    ChalPages.Length = 0;
                    tempres = GP.ChallengeGameClass.static.HandleRequirements(GP, curreq, ChalPages);
                    j = 0;
                    J0x1f5:
                    // End:0x24e [While If]
                    if(j < ChalPages.Length)
                    {
                        Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x1f5;
                    }
                    // End:0x289
                    if(!tempres)
                    {
                        Log("Failed requirement:" @ curreq[0], GP.LogPrefix);
                        return false;
                    }
                }
                // End:0x3a9
                else
                {
                    // End:0x374
                    if(GP.LastCustomCladder != none)
                    {
                        ChalPages.Length = 0;
                        tempres = GP.LastCustomCladder.static.HandleRequirements(GP, curreq, ChalPages);
                        j = 0;
                        J0x2dd:
                        // End:0x336 [While If]
                        if(j < ChalPages.Length)
                        {
                            Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x2dd;
                        }
                        // End:0x371
                        if(!tempres)
                        {
                            Log("Failed requirement:" @ curreq[0], GP.LogPrefix);
                            return false;
                        }
                    }
                    // End:0x3a9
                    else
                    {
                        Log("Unknown special event:" @ reqs[i], GP.LogPrefix);
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    return true;
}

function bool btnDebugExecOnClick(GUIComponent Sender)
{
    // End:0x08
    if(!false)
    {
        return false;
    }
    HandleSpecialEvent(Caps(edDebugExec.GetText()));
    edDebugExec.SetText("");
    return true;
}

function UpdateFreeAgentTeams()
{
    local array<string> Groups, Teams, tmp;
    local array<int> freegroups, freeteams;
    local class<UT2K4RosterGroup> rgp;
    local int i, j, k, TeamID;

    i = GP.UT2K4GameLadder.default.LID_TDM;
    J0x1d:
    // End:0x21a [While If]
    if(i < GP.UT2K4GameLadder.default.LID_CHAMP)
    {
        j = 0;
        J0x45:
        // End:0x210 [While If]
        if(j < GP.LengthOfLadder(i))
        {
            Split(GP.GetMatchInfo(i, j).EnemyTeamName, ";", tmp);
            // End:0x152
            if(tmp.Length > 1)
            {
                k = 0;
                J0xa2:
                // End:0xd6 [While If]
                if(k < Groups.Length)
                {
                    // End:0xcc
                    if(Groups[k] ~= tmp[1])
                    {
                    }
                    // End:0xd6
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0xa2;
                    }
                }
                // End:0x124
                if(k == Groups.Length)
                {
                    Groups.Length = k + 1;
                    Groups[k] = tmp[1];
                    freegroups.Length = k + 1;
                    freegroups[k] = 1;
                }
                // End:0x14f
                if(GP.LadderProgress[i] <= j)
                {
                    freegroups[k] = 0;
                }
            }
            // End:0x206
            else
            {
                k = 0;
                J0x159:
                // End:0x18d [While If]
                if(k < Teams.Length)
                {
                    // End:0x183
                    if(Teams[k] ~= tmp[0])
                    {
                    }
                    // End:0x18d
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0x159;
                    }
                }
                // End:0x1db
                if(k == Teams.Length)
                {
                    Teams.Length = k + 1;
                    Teams[k] = tmp[0];
                    freeteams.Length = k + 1;
                    freeteams[k] = 1;
                }
                // End:0x206
                if(GP.LadderProgress[i] <= j)
                {
                    freeteams[k] = 0;
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    i = 0;
    J0x221:
    // End:0x348 [While If]
    if(i < Groups.Length)
    {
        // End:0x33e
        if(freegroups[i] > 0)
        {
            rgp = class<UT2K4RosterGroup>(DynamicLoadObject(Groups[i], class'Class'));
            // End:0x271
            if(rgp == none)
            {
            }
            // End:0x33e
            else
            {
                j = 0;
                J0x278:
                // End:0x33e [While If]
                if(j < rgp.default.Rosters.Length)
                {
                    k = 0;
                    J0x298:
                    // End:0x2d9 [While If]
                    if(k < Teams.Length)
                    {
                        // End:0x2cf
                        if(Teams[k] ~= rgp.default.Rosters[j])
                        {
                        }
                        // End:0x2d9
                        else
                        {
                            ++ k;
                            // This is an implied JumpToken; Continue!
                            goto J0x298;
                        }
                    }
                    // End:0x334
                    if(k == Teams.Length)
                    {
                        Teams.Length = k + 1;
                        Teams[k] = rgp.default.Rosters[j];
                        freeteams.Length = k + 1;
                        freeteams[k] = 1;
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x278;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x221;
    }
    i = 0;
    J0x34f:
    // End:0x43d [While If]
    if(i < Teams.Length)
    {
        TeamID = GP.GetTeamPosition(Teams[i]);
        // End:0x433
        if(TeamID != -1)
        {
            j = 0;
            J0x395:
            // End:0x433 [While If]
            if(j < GP.BotStats.Length)
            {
                // End:0x429
                if(GP.BotStats[j].TeamID == TeamID)
                {
                    GP.BotStats[j].FreeAgent = freeteams[i] > 0 && !GP.IsTeammate(GP.BotStats[j].Name);
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x395;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x34f;
    }
}

function int DoHighScore()
{
    local SPHighScore HS;
    local int res;

    // End:0x1f
    if(GP == none)
    {
        Warn("GP == none");
        return -1;
    }
    HS = PlayerOwner().Level.Game.LoadDataObject(class'SPHighScore', "SPHighScore", HighScoreFile);
    // End:0xef
    if(HS == none)
    {
        Log("UT2K4SP_Main - BatteryHighScores doesn't exist, creating...", GP.LogPrefix);
        HS = PlayerOwner().Level.Game.CreateDataObject(class'SPHighScore', "SPHighScore", HighScoreFile);
    }
    res = HS.AddHighScore(GP);
    HS.__CharUnlocked__Delegate = ProfileUnlockChar;
    // End:0x281
    if(res > -1 && !GP.IsCheater() && !GP.IsLocked() || false)
    {
        // End:0x1b1
        if(GP.FinalEnemyTeam ~= "wGame.TeamThundercrash")
        {
            HS.UnlockChar("MALCOLM", PlayerOwner().GetPlayerIDHash());
        }
        // End:0x281
        else
        {
            // End:0x202
            if(GP.FinalEnemyTeam ~= "wGame.TeamIronSkull")
            {
                HS.UnlockChar("CLANLORD", PlayerOwner().GetPlayerIDHash());
            }
            // End:0x281
            else
            {
                // End:0x24c
                if(GP.FinalEnemyTeam ~= "wGame.TeamCorrupt")
                {
                    HS.UnlockChar("XAN", PlayerOwner().GetPlayerIDHash());
                }
                // End:0x281
                else
                {
                    Log("Unknown final team:" @ GP.FinalEnemyTeam, GP.LogPrefix);
                }
            }
        }
    }
    HS.__CharUnlocked__Delegate = None;
    PlayerOwner().Level.Game.SavePackage(HighScoreFile);
    return res;
}

function bool InternalOnCanClose(optional bool bCancelled)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8b [While If]
    if(i < c_Tabs.TabStack.Length)
    {
        // End:0x81
        if(UT2K4SPTab_Base(c_Tabs.TabStack[i].MyPanel) != none)
        {
            // End:0x81
            if(!UT2K4SPTab_Base(c_Tabs.TabStack[i].MyPanel).CanClose(bCancelled))
            {
                return false;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function ProfileUnlockChar(string char)
{
    // End:0x0e
    if(char == "")
    {
        return;
    }
    UnlockCharacter(char);
}

function thisOnReOpen()
{
    // End:0x77
    if(LastLadderPage != none)
    {
        // End:0x2e
        if(c_Tabs.ActiveTab.MyPanel != LastLadderPage)
        {
            return;
        }
        LastLadderPage.UpdateBalance();
        // End:0x77
        if(LastLadderPage.SelectedMatch != none)
        {
            LastLadderPage.showMatchDetails(LastLadderPage.SelectedMatch.MatchInfo);
        }
    }
}

function reportDonation()
{
    Controller.ShowQuestionDialog(DonationMsg[Rand(DonationMsg.Length)]);
}

defaultproperties
{
    begin object name=SPbtnBack class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ??? ?????"
        WinTop=0.9594790
        WinWidth=0.120
        WinHeight=0.0407030
        RenderWeight=1.0
        TabOrder=2
        bBoundToParent=true
        OnClick=btnBackOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Main.SPbtnBack'
    btnBack=SPbtnBack
    begin object name=SPbtnPlay class=GUIButton
        Caption="???"
        StyleName="FooterButton"
        Hint="????? ?? ?????"
        WinTop=0.9594790
        WinLeft=0.880
        WinWidth=0.120
        WinHeight=0.0407030
        RenderWeight=1.0
        TabOrder=1
        bBoundToParent=true
        OnClick=btnPlayOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Main.SPbtnPlay'
    btnPlay=SPbtnPlay
    begin object name=SPbtnDetails class=GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="???? ?? ??? ???"
        WinTop=0.9594790
        WinLeft=0.760
        WinWidth=0.120
        WinHeight=0.0407030
        RenderWeight=1.0
        TabOrder=0
        bBoundToParent=true
        bVisible=true
        OnClick=btnDetailsOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Main.SPbtnDetails'
    btnDetails=SPbtnDetails
    begin object name=SPbtnDebugExec class=GUIButton
        Caption="EXEC"
        Hint="?? ???? ?????"
        WinTop=0.9594790
        WinLeft=0.30
        WinWidth=0.120
        WinHeight=0.0332030
        RenderWeight=1.0
        TabOrder=4
        bVisible=true
        OnClick=btnDebugExecOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_Main.SPbtnDebugExec'
    btnDebugExec=SPbtnDebugExec
    begin object name=SPedDebugExec class=GUIEditBox
        WinTop=0.9661460
        WinWidth=0.30
        WinHeight=0.0332030
        RenderWeight=1.0
        TabOrder=3
        bVisible=true
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIEditBox'UT2K4SP_Main.SPedDebugExec'
    edDebugExec=SPedDebugExec
    PageCaption="????"
    LoadedPageCaption=" ? ????"
    LadderCompleteMsg="??"
    msgFullTeamRequired="? ??? ???? ??? ?? ??? ?????."
    DonationMsg=// Object reference not set to an instance of an object.
    
    ProfilePrefix="SP_"
    DetailsPage="GUI2K4.UT2K4SP_Details"
    InjuryPage="GUI2K4.UT2K4SP_Injury"
    MessagePage="GUI2K4.UT2K4SP_Message"
    PictureMessagePage="GUI2K4.UT2K4SP_PictureMessage"
    HighScorePage="GUI2K4.UT2K4SP_HighScores"
    EndGameMap="endgame"
    begin object name=SPhdrHeader class=GUIHeader
        RenderWeight=0.10
    object end
    // Reference: GUIHeader'UT2K4SP_Main.SPhdrHeader'
    t_Header=SPhdrHeader
    begin object name=SPftrFooter class=ButtonFooter
        RenderWeight=0.10
        OnPreDraw=InternalOnPreDraw
    object end
    // Reference: ButtonFooter'UT2K4SP_Main.SPftrFooter'
    t_Footer=SPftrFooter
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    bPersistent=true
    OnReOpen=thisOnReOpen
    OnCanClose=InternalOnCanClose
    bDrawFocusedLast=true
    OnPreDraw=InternalOnPreDraw
}