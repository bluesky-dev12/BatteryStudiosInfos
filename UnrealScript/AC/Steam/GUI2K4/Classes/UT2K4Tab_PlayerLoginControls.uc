/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_PlayerLoginControls.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:37
 *	Functions:27
 *
 *******************************************************************************/
class UT2K4Tab_PlayerLoginControls extends MidGamePanel
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Red;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Blue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_FFA;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_JoinRed;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_JoinBlue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Red;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_Blue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIListBox lb_FFA;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Team;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Settings;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Browser;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Quit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Favs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Leave;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MapVote;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_KickVote;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_MatchSetup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Spec;
var export editinline GUIList li_Red;
var export editinline GUIList li_Blue;
var export editinline GUIList li_FFA;
var() noexport bool bTeamGame;
var() noexport bool bFFAGame;
var() noexport bool bNetGame;
var localized string LeaveMPButtonText;
var localized string LeaveSPButtonText;
var localized string SpectateButtonText;
var localized string JoinGameButtonText;
var localized array<localized string> ContextItems;
var localized array<localized string> DefaultItems;
var localized string KickPlayer;
var localized string BanPlayer;
var localized string BuddyText;
var localized string RedTeam;
var localized string BlueTeam;
var string PlayerStyleName;
var export editinline GUIStyles PlayerStyle;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local string S;
    local int i;
    local XInterface.GUI.eFontScale fs;

    super(GUIPanel).InitComponent(MyController, myOwner);
    li_Red = lb_Red.List;
    li_Blue = lb_Blue.List;
    li_FFA = lb_FFA.List;
    S = GetSizingCaption();
    i = 0;
    J0x5f:
    // End:0x129 [While If]
    if(i < Controls.Length)
    {
        // End:0x11f
        if(GUIButton(Controls[i]) != none && Controls[i] != b_Team)
        {
            GUIButton(Controls[i]).bAutoSize = true;
            GUIButton(Controls[i]).SizingCaption = S;
            GUIButton(Controls[i]).AutoSizePadding.HorzPerc = 0.040;
            GUIButton(Controls[i]).AutoSizePadding.VertPerc = 0.50;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    PlayerStyle = MyController.GetStyle(PlayerStyleName, fs);
    sb_Red.ManageComponent(lb_Red);
    sb_Blue.ManageComponent(lb_Blue);
    sb_FFA.ManageComponent(lb_FFA);
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x1b
    if(bShow)
    {
        InitGRI();
    }
}

function string GetSizingCaption()
{
    local int i;
    local string S;

    i = 0;
    J0x07:
    // End:0xa2 [While If]
    if(i < Controls.Length)
    {
        // End:0x98
        if(GUIButton(Controls[i]) != none && Controls[i] != b_Team)
        {
            // End:0x98
            if(S == "" || Len(GUIButton(Controls[i]).Caption) > Len(S))
            {
                S = GUIButton(Controls[i]).Caption;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return S;
}

function GameReplicationInfo GetGRI()
{
    return PlayerOwner().GameReplicationInfo;
}

function InitGRI()
{
    local PlayerController PC;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    PC = PlayerOwner();
    // End:0x45
    if(PC.PlayerReplicationInfo == none || GRI == none)
    {
        return;
    }
    bInit = false;
    // End:0xb0
    if(!bTeamGame && !bFFAGame)
    {
        // End:0x82
        if(GRI.bTeamGame)
        {
            bTeamGame = true;
        }
        // End:0xb0
        else
        {
            // End:0xb0
            if(!GRI.GameClass ~= "Engine.GameInfo")
            {
                bFFAGame = true;
            }
        }
    }
    bNetGame = PC.Level.NetMode != 0;
    // End:0xf6
    if(bNetGame)
    {
        b_Leave.Caption = LeaveMPButtonText;
    }
    // End:0x10a
    else
    {
        b_Leave.Caption = LeaveSPButtonText;
    }
    // End:0x13c
    if(PC.PlayerReplicationInfo.bOnlySpectator)
    {
        b_Spec.Caption = JoinGameButtonText;
    }
    // End:0x150
    else
    {
        b_Spec.Caption = SpectateButtonText;
    }
    InitLists();
}

function float ItemHeight(Canvas C)
{
    local float XL, YL, H;
    local XInterface.GUI.eFontScale f;

    // End:0x14
    if(bTeamGame)
    {
        f = 1;
    }
    // End:0x1c
    else
    {
        f = 2;
    }
    PlayerStyle.TextSize(C, 0, "Wqz,", XL, H, f);
    // End:0x94
    if(C.ClipX > float(640) && bNetGame)
    {
        PlayerStyle.TextSize(C, 0, "Wqz,", XL, YL, 0);
    }
    H += YL;
    H += H * 0.20;
    return H;
}

function InitLists()
{
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    // End:0x9d
    if(bTeamGame)
    {
        li_Red.__OnDrawItem__Delegate = OnDrawRedPlayer;
        li_Red.__OnChange__Delegate = ListChange;
        li_Red.__GetItemHeight__Delegate = ItemHeight;
        li_Blue.__OnDrawItem__Delegate = OnDrawBluePlayer;
        li_Blue.__OnChange__Delegate = ListChange;
        li_Blue.__GetItemHeight__Delegate = ItemHeight;
    }
    // End:0xe2
    else
    {
        // End:0xe2
        if(bFFAGame)
        {
            li_FFA.__OnDrawItem__Delegate = OnDrawFFAPlayer;
            li_FFA.__OnChange__Delegate = ListChange;
            li_FFA.__GetItemHeight__Delegate = ItemHeight;
        }
    }
    SetupGroups();
    InitializePlayerLists();
}

function InitializePlayerLists()
{
    local int i;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    // End:0x259
    if(bTeamGame)
    {
        li_Red.bNotify = false;
        li_Blue.bNotify = false;
        li_Red.Clear();
        li_Blue.Clear();
        li_Red.bNotify = true;
        li_Blue.bNotify = true;
        i = 0;
        J0x8b:
        // End:0x256 [While If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0x151
            if(GRI.PRIArray[i] == none || GRI.PRIArray[i].Team == none || GRI.PRIArray[i].bOnlySpectator || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
            {
            }
            // End:0x24c
            else
            {
                // End:0x1d0
                if(GRI.PRIArray[i].Team.TeamIndex == 0)
                {
                    li_Red.Add(GRI.PRIArray[i].PlayerName, none, "" $ string(GRI.PRIArray[i].PlayerID));
                }
                // End:0x24c
                else
                {
                    // End:0x24c
                    if(GRI.PRIArray[i].Team.TeamIndex == 1)
                    {
                        li_Blue.Add(GRI.PRIArray[i].PlayerName, none, "" $ string(GRI.PRIArray[i].PlayerID));
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8b;
        }
    }
    // End:0x395
    else
    {
        // End:0x395
        if(bFFAGame)
        {
            li_FFA.bNotify = false;
            li_FFA.Clear();
            li_FFA.bNotify = true;
            i = 0;
            J0x29a:
            // End:0x395 [While If]
            if(i < GRI.PRIArray.Length)
            {
                // End:0x33b
                if(GRI.PRIArray[i] == none || GRI.PRIArray[i].bOnlySpectator || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
                {
                }
                // End:0x38b
                else
                {
                    li_FFA.Add(GRI.PRIArray[i].PlayerName, none, "" $ string(GRI.PRIArray[i].PlayerID));
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x29a;
            }
        }
    }
}

function SetupGroups()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x71
    if(bTeamGame)
    {
        RemoveComponent(lb_FFA, true);
        RemoveComponent(sb_FFA, true);
        // End:0x67
        if(PC.GameReplicationInfo != none && PC.GameReplicationInfo.bNoTeamChanges)
        {
            RemoveComponent(b_Team, true);
        }
        lb_FFA = none;
    }
    // End:0x104
    else
    {
        // End:0xd1
        if(bFFAGame)
        {
            RemoveComponent(i_JoinRed, true);
            RemoveComponent(i_JoinBlue, true);
            RemoveComponent(lb_Red, true);
            RemoveComponent(lb_Blue, true);
            RemoveComponent(sb_Red, true);
            RemoveComponent(sb_Blue, true);
            RemoveComponent(b_Team, true);
        }
        // End:0x104
        else
        {
            i = 0;
            J0xd8:
            // End:0x104 [While If]
            if(i < Controls.Length)
            {
                RemoveComponent(Controls[i], true);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xd8;
            }
        }
    }
    // End:0x13f
    if(PC.Level.NetMode != 3)
    {
        RemoveComponent(b_Favs);
        RemoveComponent(b_Browser);
    }
    // End:0x153
    else
    {
        // End:0x153
        if(CurrentServerIsInFavorites())
        {
            DisableComponent(b_Favs);
        }
    }
    // End:0x19c
    if(PC.Level.NetMode == 0)
    {
        RemoveComponent(b_MapVote, true);
        RemoveComponent(b_MatchSetup, true);
        RemoveComponent(b_KickVote, true);
    }
    // End:0x24d
    else
    {
        // End:0x22c
        if(PC.VoteReplicationInfo != none)
        {
            // End:0x1d9
            if(!PC.VoteReplicationInfo.MapVoteEnabled())
            {
                RemoveComponent(b_MapVote, true);
            }
            // End:0x201
            if(!PC.VoteReplicationInfo.KickVoteEnabled())
            {
                RemoveComponent(b_KickVote);
            }
            // End:0x229
            if(!PC.VoteReplicationInfo.MatchSetupEnabled())
            {
                RemoveComponent(b_MatchSetup);
            }
        }
        // End:0x24d
        else
        {
            RemoveComponent(b_MapVote);
            RemoveComponent(b_KickVote);
            RemoveComponent(b_MatchSetup);
        }
    }
    RemapComponents();
}

function bool InternalOnPreDraw(Canvas C)
{
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0xdc
    if(GRI != none)
    {
        // End:0x26
        if(bInit)
        {
            InitGRI();
        }
        SetButtonPositions(C);
        UpdatePlayerLists();
        // End:0xd1
        if(PlayerOwner().myHUD == none || !PlayerOwner().myHUD.IsInCinematic() && GRI.bMatchHasBegun && !PlayerOwner().IsInState('GameEnded') && GRI.MaxLives <= 0 || !PlayerOwner().PlayerReplicationInfo.bOnlySpectator)
        {
            EnableComponent(b_Spec);
        }
        // End:0xdc
        else
        {
            DisableComponent(b_Spec);
        }
    }
    return false;
}

function ValidatePlayer(string PlayerID, GUIList List, int Index)
{
    local int i;
    local GameReplicationInfo G;

    G = GetGRI();
    i = 0;
    J0x13:
    // End:0x81 [While If]
    if(i < G.PRIArray.Length)
    {
        // End:0x77
        if(G.PRIArray[i] != none && float(G.PRIArray[i].PlayerID) ~= float(int(PlayerID)))
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
    List.Remove(Index, 1);
}

function AddPlayer(GameReplicationInfo GRI, int Index, GUIList List)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x67 [While If]
    if(i < List.ItemCount)
    {
        // End:0x5d
        if(float(int(List.GetExtraAtIndex(i))) ~= float(GRI.PRIArray[Index].PlayerID))
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    List.Add(GRI.PRIArray[Index].PlayerName, none, "" $ string(GRI.PRIArray[Index].PlayerID));
}

protected function UpdatePlayerLists()
{
    local int i;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    // End:0x1ef
    if(bTeamGame)
    {
        i = 0;
        J0x29:
        // End:0x6f [While If]
        if(i < li_Red.ItemCount)
        {
            ValidatePlayer(li_Red.GetExtraAtIndex(i), li_Red, i);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x29;
        }
        i = 0;
        J0x76:
        // End:0xbc [While If]
        if(i < li_Blue.ItemCount)
        {
            ValidatePlayer(li_Blue.GetExtraAtIndex(i), li_Blue, i);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x76;
        }
        i = 0;
        J0xc3:
        // End:0x1ec [While If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0x189
            if(GRI.PRIArray[i] == none || GRI.PRIArray[i].Team == none || GRI.PRIArray[i].bOnlySpectator || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
            {
            }
            // End:0x1e2
            else
            {
                // End:0x1cd
                if(GRI.PRIArray[i].Team.TeamIndex == 0)
                {
                    AddPlayer(GRI, i, li_Red);
                }
                // End:0x1e2
                else
                {
                    AddPlayer(GRI, i, li_Blue);
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xc3;
        }
    }
    // End:0x30c
    else
    {
        // End:0x30c
        if(bFFAGame)
        {
            i = 0;
            J0x1ff:
            // End:0x245 [While If]
            if(i < li_FFA.ItemCount)
            {
                ValidatePlayer(li_FFA.GetExtraAtIndex(i), li_FFA, i);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1ff;
            }
            i = 0;
            J0x24c:
            // End:0x30c [While If]
            if(i < GRI.PRIArray.Length)
            {
                // End:0x2ed
                if(GRI.PRIArray[i] == none || GRI.PRIArray[i].bOnlySpectator || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
                {
                }
                // End:0x302
                else
                {
                    AddPlayer(GRI, i, li_FFA);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x24c;
            }
        }
    }
}

function SetButtonPositions(Canvas C)
{
    local int i, j, ButtonsPerRow, ButtonsLeftInRow;
    local float width, center, X, Y, XL, YL;

    bInit = false;
    width = b_Settings.ActualWidth();
    center = ActualLeft() + ActualWidth() / float(2);
    XL = width * 1.050;
    YL = b_Settings.ActualHeight() * 1.20;
    Y = b_Settings.ActualTop();
    ButtonsPerRow = int(ActualWidth() / XL);
    ButtonsLeftInRow = ButtonsPerRow;
    // End:0xc2
    if(ButtonsPerRow > 1)
    {
        X = center - 0.50 * XL * float(ButtonsPerRow - 1) + width;
    }
    // End:0xda
    else
    {
        X = center - width / float(2);
    }
    i = 0;
    J0xe1:
    // End:0x25f [While If]
    if(i < Components.Length)
    {
        // End:0x13d
        if(!Components[i].bVisible || GUIButton(Components[i]) == none || Components[i] == b_Team)
        {
        }
        // End:0x255
        else
        {
            Components[i].SetPosition(X, Y, Components[i].WinWidth, Components[i].WinHeight, true);
            // End:0x1a1
            if(-- ButtonsLeftInRow > 0)
            {
                X += XL;
            }
            // End:0x255
            else
            {
                Y += YL;
                j = i + 1;
                J0x1bb:
                // End:0x203 [While If]
                if(j < Components.Length && ButtonsLeftInRow < ButtonsPerRow)
                {
                    // End:0x1f9
                    if(GUIButton(Components[j]) != none)
                    {
                        ++ ButtonsLeftInRow;
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x1bb;
                }
                // End:0x23d
                if(ButtonsLeftInRow > 1)
                {
                    X = center - 0.50 * XL * float(ButtonsLeftInRow - 1) + width;
                }
                // End:0x255
                else
                {
                    X = center - width / float(2);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe1;
    }
}

function ListChange(GUIComponent Sender)
{
    local export editinline GUIList List;

    List = GUIList(Sender);
    // End:0x1d
    if(List == none)
    {
        return;
    }
    // End:0x40
    if(List != li_Red)
    {
        li_Red.SilentSetIndex(-1);
    }
    // End:0x63
    if(List != li_FFA)
    {
        li_FFA.SilentSetIndex(-1);
    }
    // End:0x93
    if(List != li_Blue && li_Blue != none)
    {
        li_Blue.SilentSetIndex(-1);
    }
}

function bool CurrentServerIsInFavorites()
{
    local ServerFavorite Fav;
    local string Address, portString;

    // End:0x0b
    if(PlayerOwner() == none)
    {
        return true;
    }
    Address = PlayerOwner().GetServerNetworkAddress();
    // End:0x2c
    if(Address == "")
    {
        return true;
    }
    // End:0x5d
    if(Divide(Address, ":", Fav.IP, portString))
    {
        Fav.Port = int(portString);
    }
    // End:0x6d
    else
    {
        Fav.IP = Address;
    }
    return class'ExtendedConsole'.static.InFavorites(Fav);
}

function bool ButtonClicked(GUIComponent Sender)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x96
    if(Sender == i_JoinRed)
    {
        // End:0x83
        if(PC.PlayerReplicationInfo == none || PC.PlayerReplicationInfo.Team == none || PC.PlayerReplicationInfo.Team.TeamIndex != 0)
        {
            PC.ChangeTeam(0);
        }
        Controller.CloseMenu(false);
    }
    // End:0x37f
    else
    {
        // End:0x123
        if(Sender == i_JoinBlue)
        {
            // End:0x110
            if(PC.PlayerReplicationInfo == none || PC.PlayerReplicationInfo.Team == none || PC.PlayerReplicationInfo.Team.TeamIndex != 1)
            {
                PC.ChangeTeam(1);
            }
            Controller.CloseMenu(false);
        }
        // End:0x37f
        else
        {
            // End:0x153
            if(Sender == b_Settings)
            {
                Controller.OpenMenu(Controller.GetSettingsPage());
            }
            // End:0x37f
            else
            {
                // End:0x183
                if(Sender == b_Browser)
                {
                    Controller.OpenMenu(Controller.GetServerBrowserPage());
                }
                // End:0x37f
                else
                {
                    // End:0x21e
                    if(Sender == b_Leave)
                    {
                        Controller.CloseMenu();
                        // End:0x203
                        if(PC.Level.Game.CurrentGameProfile != none)
                        {
                            PC.Level.Game.CurrentGameProfile.ContinueSinglePlayerGame(PC.Level, true);
                        }
                        // End:0x21b
                        else
                        {
                            Controller.TcpHandler.sfReqDisconnectGame();
                        }
                    }
                    // End:0x37f
                    else
                    {
                        // End:0x268
                        if(Sender == b_Favs)
                        {
                            PC.ConsoleCommand("ADDCURRENTTOFAVORITES");
                            b_Favs.MenuStateChange(4);
                        }
                        // End:0x37f
                        else
                        {
                            // End:0x298
                            if(Sender == b_Quit)
                            {
                                Controller.OpenMenu(Controller.GetQuitPage());
                            }
                            // End:0x37f
                            else
                            {
                                // End:0x2c7
                                if(Sender == b_MapVote)
                                {
                                    Controller.OpenMenu(Controller.MapVotingMenu);
                                }
                                // End:0x37f
                                else
                                {
                                    // End:0x2f6
                                    if(Sender == b_KickVote)
                                    {
                                        Controller.OpenMenu(Controller.KickVotingMenu);
                                    }
                                    // End:0x37f
                                    else
                                    {
                                        // End:0x325
                                        if(Sender == b_MatchSetup)
                                        {
                                            Controller.OpenMenu(Controller.MatchSetupMenu);
                                        }
                                        // End:0x37f
                                        else
                                        {
                                            // End:0x37f
                                            if(Sender == b_Spec)
                                            {
                                                Controller.CloseMenu();
                                                // End:0x370
                                                if(PC.PlayerReplicationInfo.bOnlySpectator)
                                                {
                                                    PC.BecomeActivePlayer();
                                                }
                                                // End:0x37f
                                                else
                                                {
                                                    PC.BecomeSpectator();
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
    return true;
}

function DrawPlayerItem(PlayerReplicationInfo PRI, Canvas Canvas, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local XInterface.GUI.eMenuState M;
    local string S;
    local float XL, YL;
    local XInterface.GUI.eFontScale f;

    // End:0x14
    if(bTeamGame)
    {
        f = 1;
    }
    // End:0x1c
    else
    {
        f = 2;
    }
    // End:0x2a9
    if(PRI != none)
    {
        Y += H * 0.10;
        H -= H * 0.20;
        // End:0xd0
        if(bSelected)
        {
            Canvas.SetPos(X, Y);
            Canvas.SetDrawColor(32, 32, 128, byte(255));
            Canvas.DrawTile(Controller.DefaultPens[0], W, H, 0.0, 0.0, 2.0, 2.0);
            M = 2;
        }
        // End:0xd8
        else
        {
            M = 0;
        }
        PlayerStyle.TextSize(Canvas, M, PRI.PlayerName, XL, YL, 1);
        PlayerStyle.DrawText(Canvas, M, X, Y, W, YL, 0, PRI.PlayerName, 1);
        PlayerStyle.TextSize(Canvas, M, "" $ string(int(PRI.Score)), XL, YL, 1);
        PlayerStyle.DrawText(Canvas, M, X + W - XL, Y, XL, YL, 2, "" $ string(int(PRI.Score)), 1);
        // End:0x2a9
        if(Canvas.ClipX > float(640) && bNetGame)
        {
            Y += YL;
            S = "Ping:" $ string(4 * PRI.Ping) $ " P/L:" $ string(PRI.PacketLoss);
            PlayerStyle.TextSize(Canvas, M, S, XL, YL, 1);
            PlayerStyle.DrawText(Canvas, M, X, Y, W, YL, 0, S, 0);
        }
    }
}

function OnDrawRedPlayer(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local PlayerReplicationInfo PRI;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    PRI = GRI.FindPlayerByID(int(li_Red.GetExtraAtIndex(i)));
    // End:0x7f
    if(PRI != none)
    {
        DrawPlayerItem(PRI, Canvas, X, Y, W, H, bSelected, bPending);
    }
}

function OnDrawBluePlayer(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local PlayerReplicationInfo PRI;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    PRI = GRI.FindPlayerByID(int(li_Blue.GetExtraAtIndex(i)));
    // End:0x7f
    if(PRI != none)
    {
        DrawPlayerItem(PRI, Canvas, X, Y, W, H, bSelected, bPending);
    }
}

function OnDrawFFAPlayer(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local PlayerReplicationInfo PRI;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    PRI = GRI.FindPlayerByID(int(li_FFA.GetExtraAtIndex(i)));
    // End:0x7f
    if(PRI != none)
    {
        DrawPlayerItem(PRI, Canvas, X, Y, W, H, bSelected, bPending);
    }
}

function bool RightClick(GUIComponent Sender)
{
    // End:0x1b
    if(GUIListBase(Controller.ActiveControl) == none)
    {
        return false;
    }
    return true;
}

function bool ContextMenuOpened(GUIContextMenu Menu)
{
    local export editinline GUIList List;
    local PlayerReplicationInfo PRI;
    local byte Restriction;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return false;
    }
    List = GUIList(Controller.ActiveControl);
    // End:0xa0
    if(List == none)
    {
        Log(string(Name) @ "ContextMenuOpened active control was not a list - active:" $ string(Controller.ActiveControl.Name));
        return false;
    }
    // End:0xb6
    if(!List.IsValid())
    {
        return false;
    }
    PRI = GRI.FindPlayerByID(int(List.GetExtra()));
    // End:0x116
    if(PRI == none || PRI.bBot || PlayerIDIsMine(PRI.PlayerID))
    {
        return false;
    }
    Restriction = PlayerOwner().ChatManager.GetPlayerRestriction(PRI.PlayerID);
    // End:0x16a
    if(bool(Restriction & 1))
    {
        Menu.ContextItems[0] = ContextItems[0];
    }
    // End:0x182
    else
    {
        Menu.ContextItems[0] = DefaultItems[0];
    }
    // End:0x1ad
    if(bool(Restriction & 2))
    {
        Menu.ContextItems[1] = ContextItems[1];
    }
    // End:0x1c5
    else
    {
        Menu.ContextItems[1] = DefaultItems[1];
    }
    // End:0x1f2
    if(bool(Restriction & 4))
    {
        Menu.ContextItems[2] = ContextItems[2];
    }
    // End:0x20c
    else
    {
        Menu.ContextItems[2] = DefaultItems[2];
    }
    // End:0x239
    if(bool(Restriction & 8))
    {
        Menu.ContextItems[3] = ContextItems[3];
    }
    // End:0x253
    else
    {
        Menu.ContextItems[3] = DefaultItems[3];
    }
    Menu.ContextItems[4] = "-";
    Menu.ContextItems[5] = BuddyText;
    // End:0x314
    if(PlayerOwner().PlayerReplicationInfo.bAdmin)
    {
        Menu.ContextItems[6] = "-";
        Menu.ContextItems[7] = KickPlayer $ "[" $ List.Get() $ "]";
        Menu.ContextItems[8] = BanPlayer $ "[" $ List.Get() $ "]";
    }
    // End:0x34e
    else
    {
        // End:0x34e
        if(Menu.ContextItems.Length > 6)
        {
            Menu.ContextItems.Remove(6, Menu.ContextItems.Length - 6);
        }
    }
    return true;
}

function ContextClick(GUIContextMenu Menu, int ClickIndex)
{
    local bool bUndo;
    local byte Type;
    local export editinline GUIList List;
    local PlayerController PC;
    local PlayerReplicationInfo PRI;
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0x19
    if(GRI == none)
    {
        return;
    }
    PC = PlayerOwner();
    bUndo = Menu.ContextItems[ClickIndex] == ContextItems[ClickIndex];
    List = GUIList(Controller.ActiveControl);
    // End:0x70
    if(List == none)
    {
        return;
    }
    PRI = GRI.FindPlayerByID(int(List.GetExtra()));
    // End:0xa3
    if(PRI == none)
    {
        return;
    }
    // End:0x12b
    if(ClickIndex > 5)
    {
        switch(ClickIndex)
        {
            // End:0xbb
            case 6:
            // End:0xef
            case 7:
                PC.AdminCommand("admin kick" @ List.GetExtra());
                // End:0x129
                break;
            // End:0x126
            case 8:
                PC.AdminCommand("admin kickban" @ List.GetExtra());
                // End:0x129
                break;
            // End:0xffff
            default:
                return;
            }
    }
    // End:0x15b
    if(ClickIndex > 3)
    {
        Controller.AddBuddy(List.Get());
        return;
    }
    Type = byte(1 << ClickIndex);
    // End:0x204
    if(bUndo)
    {
        // End:0x201
        if(PC.ChatManager.ClearRestrictionID(PRI.PlayerID, Type))
        {
            PC.ServerChatRestriction(PRI.PlayerID, PC.ChatManager.GetPlayerRestriction(PRI.PlayerID));
            ModifiedChatRestriction(self, PRI.PlayerID);
        }
    }
    // End:0x28e
    else
    {
        // End:0x28e
        if(PC.ChatManager.AddRestrictionID(PRI.PlayerID, Type))
        {
            PC.ServerChatRestriction(PRI.PlayerID, PC.ChatManager.GetPlayerRestriction(PRI.PlayerID));
            ModifiedChatRestriction(self, PRI.PlayerID);
        }
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIMultiComponent).Closed(Sender, bCancelled);
    li_Red.SilentSetIndex(-1);
    li_Blue.SilentSetIndex(-1);
    li_FFA.SilentSetIndex(-1);
}

function bool TeamChange(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("switchteam");
    Controller.CloseMenu(false);
    return true;
}

function bool RedDraw(Canvas C)
{
    i_JoinRed.WinHeight = i_JoinRed.WinWidth;
    i_JoinBlue.WinHeight = i_JoinBlue.WinWidth;
    return false;
}

defaultproperties
{
    begin object name=SBRed class=AltSectionBackground
        bFillClient=true
        Caption="??"
        LeftPadding=0.010
        RightPadding=0.010
        WinTop=0.0830660
        WinLeft=0.01660
        WinWidth=0.4701350
        WinHeight=0.6440780
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_PlayerLoginControls.SBRed'
    sb_Red=SBRed
    begin object name=SBBlue class=AltSectionBackground
        bFillClient=true
        Caption="??"
        LeftPadding=0.010
        RightPadding=0.010
        WinTop=0.0830660
        WinLeft=0.5124640
        WinWidth=0.468850
        WinHeight=0.6440780
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_PlayerLoginControls.SBBlue'
    sb_Blue=SBBlue
    begin object name=SBFFA class=AltSectionBackground
        bFillClient=true
        Caption="????"
        LeftPadding=0.010
        RightPadding=0.010
        WinTop=0.0246390
        WinLeft=0.0371540
        WinWidth=0.9197530
        WinHeight=0.7018860
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_PlayerLoginControls.SBFFA'
    sb_FFA=SBFFA
    begin object name=JoinRedButton class=GUIImage
        ImageColor=(R=255,G=100,B=100,A=90)
        ImageStyle=2
        Hint="??? ??"
        WinTop=0.150160
        WinLeft=0.0307760
        WinWidth=0.439040
        WinHeight=0.464040
        TabOrder=9
        bBoundToParent=true
        bScaleToParent=true
        OnDraw=RedDraw
    object end
    // Reference: GUIImage'UT2K4Tab_PlayerLoginControls.JoinRedButton'
    i_JoinRed=JoinRedButton
    begin object name=JoinBlueButton class=GUIImage
        ImageColor=(R=0,G=128,B=255,A=90)
        ImageStyle=2
        Hint="??? ??"
        WinTop=0.1418140
        WinLeft=0.5317790
        WinWidth=0.439040
        WinHeight=0.464040
        TabOrder=10
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'UT2K4Tab_PlayerLoginControls.JoinBlueButton'
    i_JoinBlue=JoinBlueButton
    begin object name=RedTeamListBox class=GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.250
        WinLeft=0.050
        WinWidth=0.418750
        WinHeight=0.40
        TabOrder=11
    object end
    // Reference: GUIListBox'UT2K4Tab_PlayerLoginControls.RedTeamListBox'
    lb_Red=RedTeamListBox
    begin object name=BlueTeamListBox class=GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.250
        WinLeft=0.521250
        WinWidth=0.418750
        WinHeight=0.40
        TabOrder=12
    object end
    // Reference: GUIListBox'UT2K4Tab_PlayerLoginControls.BlueTeamListBox'
    lb_Blue=BlueTeamListBox
    begin object name=FFAPlayerListBox class=GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.150
        WinLeft=0.3250
        WinWidth=0.350
        WinHeight=0.50
        TabOrder=13
    object end
    // Reference: GUIListBox'UT2K4Tab_PlayerLoginControls.FFAPlayerListBox'
    lb_FFA=FFAPlayerListBox
    begin object name=TeamButton class=GUIButton
        Caption="? ??"
        WinTop=0.0166130
        WinLeft=0.3720390
        WinWidth=0.25010
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=true
        OnClick=TeamChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.TeamButton'
    b_Team=TeamButton
    begin object name=SettingsButton class=GUIButton
        Caption="??"
        WinTop=0.7667520
        WinLeft=0.1123450
        WinWidth=0.25010
        WinHeight=0.0533660
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.SettingsButton'
    b_Settings=SettingsButton
    begin object name=BrowserButton class=GUIButton
        Caption="?? ????"
        bAutoSize=true
        WinTop=0.6750
        WinLeft=0.3750
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.BrowserButton'
    b_Browser=BrowserButton
    begin object name=QuitGameButton class=GUIButton
        Caption="?? ???"
        bAutoSize=true
        WinTop=0.750
        WinLeft=0.7250
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=4
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.QuitGameButton'
    b_Quit=QuitGameButton
    begin object name=FavoritesButton class=GUIButton
        Caption="????? ??"
        bAutoSize=true
        Hint="? ??? ????? ?????"
        WinTop=0.750
        WinLeft=0.0250
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.FavoritesButton'
    b_Favs=FavoritesButton
    begin object name=LeaveMatchButton class=GUIButton
        bAutoSize=true
        WinTop=0.6750
        WinLeft=0.7250
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.LeaveMatchButton'
    b_Leave=LeaveMatchButton
    begin object name=MapVotingButton class=GUIButton
        Caption="? ??"
        bAutoSize=true
        WinTop=0.8250
        WinLeft=0.0250
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=5
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.MapVotingButton'
    b_MapVote=MapVotingButton
    begin object name=KickVotingButton class=GUIButton
        Caption="?? ??"
        bAutoSize=true
        WinTop=0.8250
        WinLeft=0.3750
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=6
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.KickVotingButton'
    b_KickVote=KickVotingButton
    begin object name=MatchSetupButton class=GUIButton
        Caption="?? ??"
        bAutoSize=true
        WinTop=0.8250
        WinLeft=0.7250
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=7
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.MatchSetupButton'
    b_MatchSetup=MatchSetupButton
    begin object name=SpectateButton class=GUIButton
        Caption="??"
        bAutoSize=true
        WinTop=0.8250
        WinLeft=0.7250
        WinWidth=0.20
        WinHeight=0.050
        TabOrder=8
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_PlayerLoginControls.SpectateButton'
    b_Spec=SpectateButton
    LeaveMPButtonText="?????"
    LeaveSPButtonText="?? ??"
    SpectateButtonText="??"
    JoinGameButtonText="??"
    ContextItems=// Object reference not set to an instance of an object.
    
    DefaultItems=// Object reference not set to an instance of an object.
    
    KickPlayer="?? "
    BanPlayer="?? "
    BuddyText="?? ???? ??"
    RedTeam="??:"
    BlueTeam="??:"
    PlayerStyleName="TextLabel"
    PropagateVisibility=true
    begin object name=PlayerListContextMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        OnOpen=ContextMenuOpened
        OnSelect=ContextClick
    object end
    // Reference: GUIContextMenu'UT2K4Tab_PlayerLoginControls.PlayerListContextMenu'
    ContextMenu=PlayerListContextMenu
    OnPreDraw=InternalOnPreDraw
    OnRightClick=RightClick
}