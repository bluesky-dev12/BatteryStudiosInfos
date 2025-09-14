class UT2K4SP_Main extends UT2k4MainPage
    config(User)
    editinlinenew
    instanced;

const SPDEBUGMODE = false;

var() automated GUIButton btnBack;
var() automated GUIButton btnPlay;
var() automated GUIButton btnDetails;
var() automated GUIButton btnDebugExec;
var() automated GUIEditBox edDebugExec;
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
    //return;    
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
    //return;    
}

function HandleGameProfile()
{
    local bool bDonation;

    bDonation = false;
    // End:0x186
    if(GP != none)
    {
        // End:0x7A
        if(GP.Balance < GP.MinBalance)
        {
            GP.Balance = GP.MinBalance;
            // End:0x7A
            if(InStr(GP.SpecialEvent, ";DONATION") < 0)
            {
                bDonation = true;
            }
        }
        // End:0xC8
        if((GP.bInLadderGame && GP.bShowDetails) && GP.lmdFreshInfo)
        {
            Controller.OpenMenu(DetailsPage);
        }
        // End:0x105
        if((GP.SpecialEvent != "") && GP.bInLadderGame)
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
    //return;    
}

function bool InternalOnPreDraw(Canvas Canvas)
{
    local float XL, YL;

    // End:0x66
    if(btnDetails.bVisible)
    {
        btnDetails.Style.TextSize(Canvas, btnDetails.MenuState, btnDetails.Caption, XL, YL, btnDetails.FontScale);        
    }
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
    //return;    
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
    // End:0x7F
    if(OnCanClose(true))
    {
        Controller.CloseMenu(true);
    }
    return true;
    //return;    
}

function bool btnPlayOnClick(GUIComponent Sender)
{
    // End:0x16
    if(c_Tabs.ActiveTab == none)
    {
        return false;
    }
    // End:0x5F
    if(UT2K4SPTab_Base(c_Tabs.ActiveTab.MyPanel) != none)
    {
        return UT2K4SPTab_Base(c_Tabs.ActiveTab.MyPanel).onPlayClick();
    }
    return false;
    //return;    
}

function bool btnDetailsOnClick(GUIComponent Sender)
{
    return Controller.OpenMenu(DetailsPage);
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    // End:0x4E
    if(GP == none)
    {
        t_Header.SetCaption((PageCaption @ "|") @ GUITabButton(Sender).Caption);        
    }
    else
    {
        t_Header.SetCaption(((GP.PlayerName $ LoadedPageCaption) @ "|") @ GUITabButton(Sender).Caption);
    }
    //return;    
}

function UpdateTabs(optional bool bPurge, optional bool bSetActive)
{
    local export editinline GUITabPanel tmp;

    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x7C
    if((GP == none) || bPurge)
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
        // End:0xD3
        if(tmp != none)
        {
            tpQualification = UT2K4SPTab_Qualification(tmp);
        }
        // End:0x14D
        if(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_TDM] != -1)
        {
            tmp = AddTab(4, GP.Balance > GP.MinBalance);
            // End:0x14A
            if(tmp != none)
            {
                tpTeamQualification = UT2K4SPTab_TeamQualification(tmp);
            }            
        }
        else
        {
            RemoveTab(tpTeamQualification);
        }
        // End:0x1CB
        if(GP.completedLadder(GP.UT2K4GameLadder.default.LID_TDM))
        {
            tmp = AddTab(5, GP.Balance > GP.MinBalance);
            // End:0x1C8
            if(tmp != none)
            {
                tpLadder = UT2K4SPTab_Ladder(tmp);
            }            
        }
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
        else
        {
            // End:0x2A5
            if(tpTeamManagement != none)
            {
                // End:0x2A2
                if(!tpTeamManagement.bInitialDraft)
                {
                    RemoveTab(tpTeamManagement);
                }                
            }
            else
            {
                RemoveTab(tpTeamManagement);
            }
        }
        // End:0x2EC
        if(GP.bCompleted)
        {
            // End:0x2E9
            if(GP.UT2K4GameLadder.default.AdditionalLadders.Length > 0)
            {
                AddTab(7, false);
            }            
        }
        else
        {
            c_Tabs.RemoveTab(PanelCaption[7]);
        }
    }
    // End:0x337
    if((SetActiveTab != none) && bSetActive)
    {
        c_Tabs.ActivateTab(SetActiveTab.MyButton, true);
    }
    //return;    
}

function GUITabPanel AddTab(int Index, optional bool bActive)
{
    local export editinline GUITabPanel res;
    local int X;

    X = c_Tabs.TabIndex(PanelCaption[Index]);
    // End:0x5D
    if(X > -1)
    {
        // End:0x5B
        if(bActive)
        {
            SetActiveTab = c_Tabs.TabStack[X].MyPanel;
        }
        return none;
    }
    res = c_Tabs.AddTab(PanelCaption[Index], PanelClass[Index],, PanelHint[Index], false);
    // End:0xA9
    if(bActive)
    {
        SetActiveTab = res;
    }
    // End:0xCE
    if(UT2K4SPTab_Base(res) != none)
    {
        UT2K4SPTab_Base(res).MainWindow = self;
    }
    return res;
    //return;    
}

function GUITabPanel ReplaceTab(int Index, GUITabPanel previousPage, optional bool bActive)
{
    local export editinline GUITabPanel res;

    res = c_Tabs.ReplaceTab(previousPage.MyButton, PanelCaption[Index], PanelClass[Index],, PanelHint[Index], false);
    // End:0x5A
    if(bActive)
    {
        SetActiveTab = res;
    }
    // End:0x7F
    if(UT2K4SPTab_Base(res) != none)
    {
        UT2K4SPTab_Base(res).MainWindow = self;
    }
    return res;
    //return;    
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
    //return;    
}

function HandleSpecialEvent(string SpecialEvent)
{
    local array<string> Events, CurEvent;
    local int i, j;
    local array<TriString> ChalPages;

    // End:0x0D
    if(GP == none)
    {
        return;
    }
    Split(SpecialEvent, ";", Events);
    i = 0;
    J0x23:

    // End:0xDEF [Loop If]
    if(i < Events.Length)
    {
        // End:0x48
        if(Events[i] == "")
        {
            // [Explicit Continue]
            goto J0xDE5;
        }
        Split(Events[i], " ", CurEvent);
        // End:0x6C
        if(CurEvent.Length == 0)
        {
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0xA7
        if(false)
        {
            Log(("HandleSpecialEvent(" @ Events[i]) @ ")", GP.LogPrefix);
        }
        // End:0xD6
        if(CurEvent[0] == "WELCOME")
        {
            Controller.OpenMenu(MessagePage, "0");
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x18E
        if(CurEvent[0] == "DRAFT")
        {
            j = 0;
            J0xF0:

            // End:0x131 [Loop If]
            if(j < GP.GetMaxTeamSize())
            {
                // End:0x127
                if(GP.PlayerTeam[j] == "")
                {
                    // [Explicit Break]
                    goto J0x131;
                }
                j++;
                // [Loop Continue]
                goto J0xF0;
            }
            J0x131:

            // End:0x18B
            if(j != GP.GetMaxTeamSize())
            {
                tpTeamManagement = UT2K4SPTab_TeamManagement(ReplaceTab(6, tpQualification, true));
                tpTeamManagement.bInitialDraft = true;
                Controller.OpenMenu(MessagePage, "1");
            }
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x257
        if(CurEvent[0] == "QUALIFIED")
        {
            // End:0x1D3
            if(CurEvent[1] == "SINGLE")
            {
                Controller.OpenMenu(MessagePage, "2");                
            }
            else
            {
                // End:0x254
                if(CurEvent[1] == "TEAM")
                {
                    Controller.OpenMenu(MessagePage, "3");
                    Class'GUI2K4_Decompressed.UT2K4SPTab_Tutorials'.static.unlockButton("TDM");
                    // End:0x254
                    if(GP.Matches == GP.Wins)
                    {
                        GP.GetTeamPosition("wGame.PhantomEpic", true);
                    }
                }
            }
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x50B
        if(CurEvent[0] == "OPEN")
        {
            j = -1;
            // End:0x2AE
            if(CurEvent[1] == "TDM")
            {
                GP.enableLadder(GP.UT2K4GameLadder.default.LID_TDM);                
            }
            else
            {
                // End:0x2F0
                if(CurEvent[1] == "CTF")
                {
                    GP.enableLadder(GP.UT2K4GameLadder.default.LID_CTF);
                    j = 4;                    
                }
                else
                {
                    // End:0x331
                    if(CurEvent[1] == "BR")
                    {
                        GP.enableLadder(GP.UT2K4GameLadder.default.LID_BR);
                        j = 5;                        
                    }
                    else
                    {
                        // End:0x36B
                        if(CurEvent[1] == "DOM")
                        {
                            GP.enableLadder(GP.UT2K4GameLadder.default.LID_DOM);                            
                        }
                        else
                        {
                            // End:0x3AC
                            if(CurEvent[1] == "AS")
                            {
                                GP.enableLadder(GP.UT2K4GameLadder.default.LID_AS);
                                j = 6;                                
                            }
                            else
                            {
                                // End:0x4B1
                                if(CurEvent[1] == "CHAMP")
                                {
                                    GP.enableLadder(GP.UT2K4GameLadder.default.LID_CHAMP);
                                    CurEvent[1] = GP.GetEnemyTeamName(GP.GetMatchInfo(GP.UT2K4GameLadder.default.LID_CHAMP, 0).EnemyTeamName);
                                    // End:0x45B
                                    if(CurEvent[1] ~= "wGame.TeamThundercrash")
                                    {
                                        j = 8;                                        
                                    }
                                    else
                                    {
                                        // End:0x487
                                        if(CurEvent[1] ~= "wGame.TeamIronSkull")
                                        {
                                            j = 7;                                            
                                        }
                                        else
                                        {
                                            // End:0x4AE
                                            if(CurEvent[1] ~= "wGame.TeamCorrupt")
                                            {
                                                j = 9;
                                            }
                                        }
                                    }                                    
                                }
                                else
                                {
                                    // End:0x4D6
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
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x72E
        if(CurEvent[0] == "COMPLETED")
        {
            Class'GUI2K4_Decompressed.UT2K4SPTab_Tutorials'.static.unlockButton(CurEvent[1]);
            // End:0x6DA
            if(CurEvent[1] == "CHAMP")
            {
                // End:0x572
                if(GP.PlayerCharacter ~= "Mr.Crow")
                {
                    bEnableTC = true;
                    SaveConfig();
                }
                GP.bInLadderGame = true;
                // End:0x5BB
                if(!GP.bCompleted)
                {
                    GP.SpecialEvent = "SHOWSCORE" @ string(DoHighScore());
                }
                GP.bCompleted = true;
                PlayerOwner().Level.Game.SavePackage(GP.PackageName);
                // End:0x6BF
                if(EndGameMap != "")
                {
                    Log("Starting endgame movie", GP.LogPrefix);
                    bAllowedAsLast = true;
                    Console(Controller.Master.Console).DelayedConsoleCommand((("START " $ EndGameMap) $ "?quickstart=true?TeamScreen=false?savegame=") $ GP.PackageName);
                    Controller.CloseAll(false, true);
                    return;                    
                }
                else
                {
                    Controller.OpenMenu(MessagePage, "10");
                }                
            }
            else
            {
                // End:0x72B
                if(GP.openChampionshipLadder())
                {
                    Log("Opening championship ladder", GP.LogPrefix);
                    HandleSpecialEvent("OPEN CHAMP");
                }
            }
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x75F
        if(CurEvent[0] == "BALANCE")
        {
            GP.Balance += int(CurEvent[1]);
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x781
        if(CurEvent[0] == "UPDATETEAMS")
        {
            UpdateFreeAgentTeams();
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x7B6
        if(CurEvent[0] == "SHOWSCORE")
        {
            Controller.OpenMenu(HighScorePage, CurEvent[1]);
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x80C
        if(CurEvent[0] == "CHALLENGE")
        {
            Controller.OpenMenu(GP.static.GetChallengeGame(CurEvent[2]).default.ChallengeMenu, CurEvent[1], "true");
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0x82B
        if(CurEvent[0] == "DONATION")
        {
            reportDonation();
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0xC49
        if((CurEvent[0] == "DEBUG") && false)
        {
            // End:0x866
            if(CurEvent[1] == "UPDATETABS")
            {
                UpdateTabs(true);                
            }
            else
            {
                // End:0x8A4
                if(CurEvent[1] == "SETLADDER")
                {
                    GP.LadderProgress[int(CurEvent[2])] = int(CurEvent[3]);                    
                }
                else
                {
                    // End:0x8D2
                    if(CurEvent[1] == "INLADDERGAME")
                    {
                        GP.bInLadderGame = true;                        
                    }
                    else
                    {
                        // End:0x917
                        if(CurEvent[1] == "INJURY")
                        {
                            Controller.OpenMenu("GUI2K4.UT2K4SP_Injury", CurEvent[2]);                            
                        }
                        else
                        {
                            // End:0x957
                            if(CurEvent[1] == "HEALTH")
                            {
                                GP.BotStats[int(CurEvent[2])].Health = byte(CurEvent[3]);                                
                            }
                            else
                            {
                                // End:0x9AE
                                if(CurEvent[1] == "ALTPATH")
                                {
                                    // End:0x992
                                    if(CurEvent.Length <= 2)
                                    {
                                        GP.AltPath = Rand(2147483647);                                        
                                    }
                                    else
                                    {
                                        GP.AltPath = int(CurEvent[2]);
                                    }                                    
                                }
                                else
                                {
                                    // End:0xB94
                                    if(CurEvent[1] == "DUMP")
                                    {
                                        // End:0xAB1
                                        if(CurEvent[2] == "BOTSTATS")
                                        {
                                            j = 0;
                                            J0x9DE:

                                            // End:0xAAE [Loop If]
                                            if(j < GP.BotStats.Length)
                                            {
                                                Log(((((("::" @ string(j)) @ GP.BotStats[j].Name) @ string(GP.BotStats[j].Price)) @ string(GP.BotStats[j].Health)) @ string(GP.BotStats[j].FreeAgent)) @ string(GP.BotStats[j].TeamID), GP.LogPrefix);
                                                j++;
                                                // [Loop Continue]
                                                goto J0x9DE;
                                            }                                            
                                        }
                                        else
                                        {
                                            // End:0xB91
                                            if(CurEvent[2] == "TEAMSTATS")
                                            {
                                                j = 0;
                                                J0xAD0:

                                                // End:0xB91 [Loop If]
                                                if(j < GP.TeamStats.Length)
                                                {
                                                    Log(((((("::" @ string(j)) @ GP.TeamStats[j].Name) @ string(GP.TeamStats[j].Level)) @ string(GP.TeamStats[j].Matches)) @ string(GP.TeamStats[j].Won)) @ string(GP.TeamStats[j].rating));
                                                    j++;
                                                    // [Loop Continue]
                                                    goto J0xAD0;
                                                }
                                            }
                                        }                                        
                                    }
                                    else
                                    {
                                        // End:0xBC5
                                        if(CurEvent[1] == "MESG")
                                        {
                                            Controller.OpenMenu(MessagePage, CurEvent[2]);                                            
                                        }
                                        else
                                        {
                                            // End:0xC00
                                            if(CurEvent[1] == "NCOMPL")
                                            {
                                                GP.bCompleted = false;
                                                GP.LadderProgress[6] = 1;                                                
                                            }
                                            else
                                            {
                                                // End:0xC24
                                                if(CurEvent[1] == "ON")
                                                {
                                                    GP.bDebug = true;                                                    
                                                }
                                                else
                                                {
                                                    // End:0xC46
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
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0xD03
        if(GP.lmdbChallengeGame && GP.ChallengeGameClass != none)
        {
            ChalPages.Length = 0;
            GP.ChallengeGameClass.static.HandleSpecialEvent(GP, CurEvent, ChalPages);
            j = 0;
            J0xCA7:

            // End:0xD00 [Loop If]
            if(j < ChalPages.Length)
            {
                Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                j++;
                // [Loop Continue]
                goto J0xCA7;
            }
            // [Explicit Continue]
            goto J0xDE5;
        }
        // End:0xDA9
        if(GP.LastCustomCladder != none)
        {
            ChalPages.Length = 0;
            GP.LastCustomCladder.static.HandleSpecialEvent(GP, CurEvent, ChalPages);
            j = 0;
            J0xD4D:

            // End:0xDA6 [Loop If]
            if(j < ChalPages.Length)
            {
                Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                j++;
                // [Loop Continue]
                goto J0xD4D;
            }
            // [Explicit Continue]
            goto J0xDE5;
        }
        Log(("Unknown special event: '" $ Events[i]) $ "'", GP.LogPrefix);
        J0xDE5:

        i++;
        // [Loop Continue]
        goto J0x23;
    }
    //return;    
}

function bool HandleRequirements(string reqstring)
{
    local array<string> reqs, curreq;
    local int i, j;
    local array<TriString> ChalPages;
    local bool tempres;

    // End:0x0D
    if(GP == none)
    {
        return false;
    }
    // End:0x1B
    if(reqstring == "")
    {
        return true;
    }
    Split(reqstring, ";", reqs);
    i = 0;
    J0x31:

    // End:0x3B3 [Loop If]
    if(i < reqs.Length)
    {
        // End:0x5F
        if(Split(reqs[i], " ", curreq) == 0)
        {
            // [Explicit Continue]
            goto J0x3A9;
        }
        // End:0x1A4
        if(curreq[0] == "FULLTEAM")
        {
            // End:0x1A1
            if(!GP.HasFullTeam())
            {
                Log("Failed requirement: FULLTEAM", GP.LogPrefix);
                // End:0x122
                if(GP.completedLadder(GP.UT2K4GameLadder.default.LID_DM))
                {
                    // End:0x11F
                    if(c_Tabs.ActiveTab != tpTeamManagement.MyButton)
                    {
                        c_Tabs.ActivateTab(tpTeamManagement.MyButton, true);
                    }                    
                }
                else
                {
                    // End:0x18B
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
            // [Explicit Continue]
            goto J0x3A9;
        }
        // End:0x28C
        if(GP.ChallengeGameClass != none)
        {
            ChalPages.Length = 0;
            tempres = GP.ChallengeGameClass.static.HandleRequirements(GP, curreq, ChalPages);
            j = 0;
            J0x1F5:

            // End:0x24E [Loop If]
            if(j < ChalPages.Length)
            {
                Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                j++;
                // [Loop Continue]
                goto J0x1F5;
            }
            // End:0x289
            if(!tempres)
            {
                Log("Failed requirement:" @ curreq[0], GP.LogPrefix);
                return false;
            }
            // [Explicit Continue]
            goto J0x3A9;
        }
        // End:0x374
        if(GP.LastCustomCladder != none)
        {
            ChalPages.Length = 0;
            tempres = GP.LastCustomCladder.static.HandleRequirements(GP, curreq, ChalPages);
            j = 0;
            J0x2DD:

            // End:0x336 [Loop If]
            if(j < ChalPages.Length)
            {
                Controller.OpenMenu(ChalPages[j].GUIPage, ChalPages[j].Param1, ChalPages[j].Param2);
                j++;
                // [Loop Continue]
                goto J0x2DD;
            }
            // End:0x371
            if(!tempres)
            {
                Log("Failed requirement:" @ curreq[0], GP.LogPrefix);
                return false;
            }
            // [Explicit Continue]
            goto J0x3A9;
        }
        Log("Unknown special event:" @ reqs[i], GP.LogPrefix);
        J0x3A9:

        i++;
        // [Loop Continue]
        goto J0x31;
    }
    return true;
    //return;    
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
    //return;    
}

function UpdateFreeAgentTeams()
{
    local array<string> Groups, Teams, tmp;
    local array<int> freegroups, freeteams;
    local Class<UT2K4RosterGroup> rgp;
    local int i, j, k, TeamID;

    i = GP.UT2K4GameLadder.default.LID_TDM;
    J0x1D:

    // End:0x21A [Loop If]
    if(i < GP.UT2K4GameLadder.default.LID_CHAMP)
    {
        j = 0;
        J0x45:

        // End:0x210 [Loop If]
        if(j < GP.LengthOfLadder(i))
        {
            Split(GP.GetMatchInfo(i, j).EnemyTeamName, ";", tmp);
            // End:0x152
            if(tmp.Length > 1)
            {
                k = 0;
                J0xA2:

                // End:0xD6 [Loop If]
                if(k < Groups.Length)
                {
                    // End:0xCC
                    if(Groups[k] ~= tmp[1])
                    {
                        // [Explicit Break]
                        goto J0xD6;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0xA2;
                }
                J0xD6:

                // End:0x124
                if(k == Groups.Length)
                {
                    Groups.Length = k + 1;
                    Groups[k] = tmp[1];
                    freegroups.Length = k + 1;
                    freegroups[k] = 1;
                }
                // End:0x14F
                if(GP.LadderProgress[i] <= j)
                {
                    freegroups[k] = 0;
                }
                // [Explicit Continue]
                goto J0x206;
            }
            k = 0;
            J0x159:

            // End:0x18D [Loop If]
            if(k < Teams.Length)
            {
                // End:0x183
                if(Teams[k] ~= tmp[0])
                {
                    // [Explicit Break]
                    goto J0x18D;
                }
                k++;
                // [Loop Continue]
                goto J0x159;
            }
            J0x18D:

            // End:0x1DB
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
            J0x206:

            j++;
            // [Loop Continue]
            goto J0x45;
        }
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    i = 0;
    J0x221:

    // End:0x348 [Loop If]
    if(i < Groups.Length)
    {
        // End:0x33E
        if(freegroups[i] > 0)
        {
            rgp = Class<UT2K4RosterGroup>(DynamicLoadObject(Groups[i], Class'Core.Class'));
            // End:0x271
            if(rgp == none)
            {
                // [Explicit Continue]
                goto J0x33E;
            }
            j = 0;
            J0x278:

            // End:0x33E [Loop If]
            if(j < rgp.default.Rosters.Length)
            {
                k = 0;
                J0x298:

                // End:0x2D9 [Loop If]
                if(k < Teams.Length)
                {
                    // End:0x2CF
                    if(Teams[k] ~= rgp.default.Rosters[j])
                    {
                        // [Explicit Break]
                        goto J0x2D9;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0x298;
                }
                J0x2D9:

                // End:0x334
                if(k == Teams.Length)
                {
                    Teams.Length = k + 1;
                    Teams[k] = rgp.default.Rosters[j];
                    freeteams.Length = k + 1;
                    freeteams[k] = 1;
                }
                j++;
                // [Loop Continue]
                goto J0x278;
            }
        }
        J0x33E:

        i++;
        // [Loop Continue]
        goto J0x221;
    }
    i = 0;
    J0x34F:

    // End:0x43D [Loop If]
    if(i < Teams.Length)
    {
        TeamID = GP.GetTeamPosition(Teams[i]);
        // End:0x433
        if(TeamID != -1)
        {
            j = 0;
            J0x395:

            // End:0x433 [Loop If]
            if(j < GP.BotStats.Length)
            {
                // End:0x429
                if(GP.BotStats[j].TeamID == TeamID)
                {
                    GP.BotStats[j].FreeAgent = (freeteams[i] > 0) && !GP.IsTeammate(GP.BotStats[j].Name);
                }
                j++;
                // [Loop Continue]
                goto J0x395;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x34F;
    }
    //return;    
}

function int DoHighScore()
{
    local SPHighScore HS;
    local int res;

    // End:0x1F
    if(GP == none)
    {
        Warn("GP == none");
        return -1;
    }
    HS = PlayerOwner().Level.Game.LoadDataObject(Class'GUI2K4_Decompressed.SPHighScore', "SPHighScore", HighScoreFile);
    // End:0xEF
    if(HS == none)
    {
        Log("UT2K4SP_Main - BatteryHighScores doesn't exist, creating...", GP.LogPrefix);
        HS = PlayerOwner().Level.Game.CreateDataObject(Class'GUI2K4_Decompressed.SPHighScore', "SPHighScore", HighScoreFile);
    }
    res = HS.AddHighScore(GP);
    HS.__CharUnlocked__Delegate = ProfileUnlockChar;
    // End:0x281
    if((((res > -1) && !GP.IsCheater()) && !GP.IsLocked()) || false)
    {
        // End:0x1B1
        if(GP.FinalEnemyTeam ~= "wGame.TeamThundercrash")
        {
            HS.UnlockChar("MALCOLM", PlayerOwner().GetPlayerIDHash());            
        }
        else
        {
            // End:0x202
            if(GP.FinalEnemyTeam ~= "wGame.TeamIronSkull")
            {
                HS.UnlockChar("CLANLORD", PlayerOwner().GetPlayerIDHash());                
            }
            else
            {
                // End:0x24C
                if(GP.FinalEnemyTeam ~= "wGame.TeamCorrupt")
                {
                    HS.UnlockChar("XAN", PlayerOwner().GetPlayerIDHash());                    
                }
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
    //return;    
}

function bool InternalOnCanClose(optional bool bCancelled)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8B [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function ProfileUnlockChar(string char)
{
    // End:0x0E
    if(char == "")
    {
        return;
    }
    UnlockCharacter(char);
    //return;    
}

function thisOnReOpen()
{
    // End:0x77
    if(LastLadderPage != none)
    {
        // End:0x2E
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
    //return;    
}

function reportDonation()
{
    Controller.ShowQuestionDialog(DonationMsg[Rand(DonationMsg.Length)]);
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Main.SPbtnBack'
    begin object name="SPbtnBack" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ??? ?????"
        WinTop=0.9594790
        WinWidth=0.1200000
        WinHeight=0.0407030
        RenderWeight=1.0000000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2K4SP_Main.btnBackOnClick
        OnKeyEvent=SPbtnBack.InternalOnKeyEvent
    end object
    btnBack=SPbtnBack
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Main.SPbtnPlay'
    begin object name="SPbtnPlay" class=XInterface.GUIButton
        Caption="???"
        StyleName="FooterButton"
        Hint="????? ?? ?????"
        WinTop=0.9594790
        WinLeft=0.8800000
        WinWidth=0.1200000
        WinHeight=0.0407030
        RenderWeight=1.0000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2K4SP_Main.btnPlayOnClick
        OnKeyEvent=SPbtnPlay.InternalOnKeyEvent
    end object
    btnPlay=SPbtnPlay
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Main.SPbtnDetails'
    begin object name="SPbtnDetails" class=XInterface.GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="???? ?? ??? ???"
        WinTop=0.9594790
        WinLeft=0.7600000
        WinWidth=0.1200000
        WinHeight=0.0407030
        RenderWeight=1.0000000
        TabOrder=0
        bBoundToParent=true
        bVisible=false
        OnClick=UT2K4SP_Main.btnDetailsOnClick
        OnKeyEvent=SPbtnDetails.InternalOnKeyEvent
    end object
    btnDetails=SPbtnDetails
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4SP_Main.SPbtnDebugExec'
    begin object name="SPbtnDebugExec" class=XInterface.GUIButton
        Caption="EXEC"
        Hint="?? ???? ?????"
        WinTop=0.9594790
        WinLeft=0.3000000
        WinWidth=0.1200000
        WinHeight=0.0332030
        RenderWeight=1.0000000
        TabOrder=4
        bVisible=false
        OnClick=UT2K4SP_Main.btnDebugExecOnClick
        OnKeyEvent=SPbtnDebugExec.InternalOnKeyEvent
    end object
    btnDebugExec=SPbtnDebugExec
    // Reference: GUIEditBox'GUI2K4_Decompressed.UT2K4SP_Main.SPedDebugExec'
    begin object name="SPedDebugExec" class=XInterface.GUIEditBox
        WinTop=0.9661460
        WinWidth=0.3000000
        WinHeight=0.0332030
        RenderWeight=1.0000000
        TabOrder=3
        bVisible=false
        OnActivate=SPedDebugExec.InternalActivate
        OnDeActivate=SPedDebugExec.InternalDeactivate
        OnKeyType=SPedDebugExec.InternalOnKeyType
        OnKeyEvent=SPedDebugExec.InternalOnKeyEvent
    end object
    edDebugExec=SPedDebugExec
    PageCaption="????"
    LoadedPageCaption=" ? ????"
    LadderCompleteMsg="??"
    msgFullTeamRequired="? ??? ???? ??? ?? ??? ?????."
    DonationMsg[0]="??? ?? ?? ?????, ?????? ??? ???? ?? ??, ????? ?? ??? ? ?? ?????."
    DonationMsg[1]="??? ?????, ??? ????? ??? ? ?? ?????."
    ProfilePrefix="SP_"
    DetailsPage="GUI2K4.UT2K4SP_Details"
    InjuryPage="GUI2K4.UT2K4SP_Injury"
    MessagePage="GUI2K4.UT2K4SP_Message"
    PictureMessagePage="GUI2K4.UT2K4SP_PictureMessage"
    HighScorePage="GUI2K4.UT2K4SP_HighScores"
    EndGameMap="endgame"
    // Reference: GUIHeader'GUI2K4_Decompressed.UT2K4SP_Main.SPhdrHeader'
    begin object name="SPhdrHeader" class=XInterface.GUIHeader
        RenderWeight=0.1000000
    end object
    t_Header=SPhdrHeader
    // Reference: ButtonFooter'GUI2K4_Decompressed.UT2K4SP_Main.SPftrFooter'
    begin object name="SPftrFooter" class=GUI2K4_Decompressed.ButtonFooter
        RenderWeight=0.1000000
        OnPreDraw=SPftrFooter.InternalOnPreDraw
    end object
    t_Footer=SPftrFooter
    PanelClass[0]="GUI2K4.UT2K4SPTab_Profile"
    PanelClass[1]="GUI2K4.UT2K4SPTab_ProfileNew"
    PanelClass[2]="GUI2K4.UT2K4SPTab_Tutorials"
    PanelClass[3]="GUI2K4.UT2K4SPTab_Qualification"
    PanelClass[4]="GUI2K4.UT2K4SPTab_TeamQualification"
    PanelClass[5]="GUI2K4.UT2K4SPTab_Ladder"
    PanelClass[6]="GUI2K4.UT2K4SPTab_TeamManagement"
    PanelClass[7]="GUI2K4.UT2K4SPTab_ExtraLadder"
    PanelCaption[0]="????"
    PanelCaption[1]="? ????"
    PanelCaption[2]="????"
    PanelCaption[3]="??"
    PanelCaption[4]="? ??"
    PanelCaption[5]="??"
    PanelCaption[6]="? ??"
    PanelCaption[7]="??"
    PanelHint[0]="????? ?????"
    PanelHint[1]="??? ????? ????"
    PanelHint[2]="???? ????"
    PanelHint[3]="???? ?? ??? ???? ??"
    PanelHint[4]="????? ?? ??? ???? ? ??"
    PanelHint[5]="???? ??"
    PanelHint[6]="?? ?????"
    PanelHint[7]="?? ??"
    bPersistent=false
    OnReOpen=UT2K4SP_Main.thisOnReOpen
    OnCanClose=UT2K4SP_Main.InternalOnCanClose
    bDrawFocusedLast=false
    OnPreDraw=UT2K4SP_Main.InternalOnPreDraw
}