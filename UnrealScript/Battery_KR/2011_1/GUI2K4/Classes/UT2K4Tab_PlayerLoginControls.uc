class UT2K4Tab_PlayerLoginControls extends MidGamePanel
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_Red;
var() automated GUISectionBackground sb_Blue;
var() automated GUISectionBackground sb_FFA;
var() automated GUIImage i_JoinRed;
var() automated GUIImage i_JoinBlue;
var() automated GUIListBox lb_Red;
var() automated GUIListBox lb_Blue;
var() automated GUIListBox lb_FFA;
var() automated GUIButton b_Team;
var() automated GUIButton b_Settings;
var() automated GUIButton b_Browser;
var() automated GUIButton b_Quit;
var() automated GUIButton b_Favs;
var() automated GUIButton b_Leave;
var() automated GUIButton b_MapVote;
var() automated GUIButton b_KickVote;
var() automated GUIButton b_MatchSetup;
var() automated GUIButton b_Spec;
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
    local GUI.eFontScale fs;

    super(GUIPanel).InitComponent(MyController, myOwner);
    li_Red = lb_Red.List;
    li_Blue = lb_Blue.List;
    li_FFA = lb_FFA.List;
    S = GetSizingCaption();
    i = 0;
    J0x5F:

    // End:0x129 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x11F
        if((GUIButton(Controls[i]) != none) && Controls[i] != b_Team)
        {
            GUIButton(Controls[i]).bAutoSize = true;
            GUIButton(Controls[i]).SizingCaption = S;
            GUIButton(Controls[i]).AutoSizePadding.HorzPerc = 0.0400000;
            GUIButton(Controls[i]).AutoSizePadding.VertPerc = 0.5000000;
        }
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    PlayerStyle = MyController.GetStyle(PlayerStyleName, fs);
    sb_Red.ManageComponent(lb_Red);
    sb_Blue.ManageComponent(lb_Blue);
    sb_FFA.ManageComponent(lb_FFA);
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x1B
    if(bShow)
    {
        InitGRI();
    }
    //return;    
}

function string GetSizingCaption()
{
    local int i;
    local string S;

    i = 0;
    J0x07:

    // End:0xA2 [Loop If]
    if(i < Controls.Length)
    {
        // End:0x98
        if((GUIButton(Controls[i]) != none) && Controls[i] != b_Team)
        {
            // End:0x98
            if((S == "") || Len(GUIButton(Controls[i]).Caption) > Len(S))
            {
                S = GUIButton(Controls[i]).Caption;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return S;
    //return;    
}

function GameReplicationInfo GetGRI()
{
    return PlayerOwner().GameReplicationInfo;
    //return;    
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
    if((PC.PlayerReplicationInfo == none) || GRI == none)
    {
        return;
    }
    bInit = false;
    // End:0xB0
    if(!bTeamGame && !bFFAGame)
    {
        // End:0x82
        if(GRI.bTeamGame)
        {
            bTeamGame = true;            
        }
        else
        {
            // End:0xB0
            if(!GRI.GameClass ~= "Engine.GameInfo")
            {
                bFFAGame = true;
            }
        }
    }
    bNetGame = int(PC.Level.NetMode) != int(NM_Standalone);
    // End:0xF6
    if(bNetGame)
    {
        b_Leave.Caption = LeaveMPButtonText;        
    }
    else
    {
        b_Leave.Caption = LeaveSPButtonText;
    }
    // End:0x13C
    if(PC.PlayerReplicationInfo.bOnlySpectator)
    {
        b_Spec.Caption = JoinGameButtonText;        
    }
    else
    {
        b_Spec.Caption = SpectateButtonText;
    }
    InitLists();
    //return;    
}

function float ItemHeight(Canvas C)
{
    local float XL, YL, H;
    local GUI.eFontScale F;

    // End:0x14
    if(bTeamGame)
    {
        F = 1;        
    }
    else
    {
        F = 2;
    }
    PlayerStyle.TextSize(C, 0, "Wqz,", XL, H, F);
    // End:0x94
    if((C.ClipX > float(640)) && bNetGame)
    {
        PlayerStyle.TextSize(C, 0, "Wqz,", XL, YL, 0);
    }
    H += YL;
    H += (H * 0.2000000);
    return H;
    //return;    
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
    // End:0x9D
    if(bTeamGame)
    {
        li_Red.__OnDrawItem__Delegate = OnDrawRedPlayer;
        li_Red.__OnChange__Delegate = ListChange;
        li_Red.__GetItemHeight__Delegate = ItemHeight;
        li_Blue.__OnDrawItem__Delegate = OnDrawBluePlayer;
        li_Blue.__OnChange__Delegate = ListChange;
        li_Blue.__GetItemHeight__Delegate = ItemHeight;        
    }
    else
    {
        // End:0xE2
        if(bFFAGame)
        {
            li_FFA.__OnDrawItem__Delegate = OnDrawFFAPlayer;
            li_FFA.__OnChange__Delegate = ListChange;
            li_FFA.__GetItemHeight__Delegate = ItemHeight;
        }
    }
    SetupGroups();
    InitializePlayerLists();
    //return;    
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
        J0x8B:

        // End:0x256 [Loop If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0x151
            if((((GRI.PRIArray[i] == none) || GRI.PRIArray[i].Team == none) || GRI.PRIArray[i].bOnlySpectator) || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
            {
                // [Explicit Continue]
                goto J0x24C;
            }
            // End:0x1D0
            if(GRI.PRIArray[i].Team.TeamIndex == 0)
            {
                li_Red.Add(GRI.PRIArray[i].PlayerName, none, "" $ string(GRI.PRIArray[i].PlayerID));
                // [Explicit Continue]
                goto J0x24C;
            }
            // End:0x24C
            if(GRI.PRIArray[i].Team.TeamIndex == 1)
            {
                li_Blue.Add(GRI.PRIArray[i].PlayerName, none, "" $ string(GRI.PRIArray[i].PlayerID));
            }
            J0x24C:

            i++;
            // [Loop Continue]
            goto J0x8B;
        }        
    }
    else
    {
        // End:0x395
        if(bFFAGame)
        {
            li_FFA.bNotify = false;
            li_FFA.Clear();
            li_FFA.bNotify = true;
            i = 0;
            J0x29A:

            // End:0x395 [Loop If]
            if(i < GRI.PRIArray.Length)
            {
                // End:0x33B
                if(((GRI.PRIArray[i] == none) || GRI.PRIArray[i].bOnlySpectator) || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
                {
                    // [Explicit Continue]
                    goto J0x38B;
                }
                li_FFA.Add(GRI.PRIArray[i].PlayerName, none, "" $ string(GRI.PRIArray[i].PlayerID));
                J0x38B:

                i++;
                // [Loop Continue]
                goto J0x29A;
            }
        }
    }
    //return;    
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
        if((PC.GameReplicationInfo != none) && PC.GameReplicationInfo.bNoTeamChanges)
        {
            RemoveComponent(b_Team, true);
        }
        lb_FFA = none;        
    }
    else
    {
        // End:0xD1
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
        else
        {
            i = 0;
            J0xD8:

            // End:0x104 [Loop If]
            if(i < Controls.Length)
            {
                RemoveComponent(Controls[i], true);
                i++;
                // [Loop Continue]
                goto J0xD8;
            }
        }
    }
    // End:0x13F
    if(int(PC.Level.NetMode) != int(NM_Client))
    {
        RemoveComponent(b_Favs);
        RemoveComponent(b_Browser);        
    }
    else
    {
        // End:0x153
        if(CurrentServerIsInFavorites())
        {
            DisableComponent(b_Favs);
        }
    }
    // End:0x19C
    if(int(PC.Level.NetMode) == int(NM_Standalone))
    {
        RemoveComponent(b_MapVote, true);
        RemoveComponent(b_MatchSetup, true);
        RemoveComponent(b_KickVote, true);        
    }
    else
    {
        // End:0x22C
        if(PC.VoteReplicationInfo != none)
        {
            // End:0x1D9
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
        else
        {
            RemoveComponent(b_MapVote);
            RemoveComponent(b_KickVote);
            RemoveComponent(b_MatchSetup);
        }
    }
    RemapComponents();
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local GameReplicationInfo GRI;

    GRI = GetGRI();
    // End:0xDC
    if(GRI != none)
    {
        // End:0x26
        if(bInit)
        {
            InitGRI();
        }
        SetButtonPositions(C);
        UpdatePlayerLists();
        // End:0xD1
        if(((((PlayerOwner().myHUD == none) || !PlayerOwner().myHUD.IsInCinematic()) && GRI.bMatchHasBegun) && !PlayerOwner().IsInState('GameEnded')) && (GRI.MaxLives <= 0) || !PlayerOwner().PlayerReplicationInfo.bOnlySpectator)
        {
            EnableComponent(b_Spec);            
        }
        else
        {
            DisableComponent(b_Spec);
        }
    }
    return false;
    //return;    
}

function ValidatePlayer(string PlayerID, GUIList List, int Index)
{
    local int i;
    local GameReplicationInfo G;

    G = GetGRI();
    i = 0;
    J0x13:

    // End:0x81 [Loop If]
    if(i < G.PRIArray.Length)
    {
        // End:0x77
        if((G.PRIArray[i] != none) && float(G.PRIArray[i].PlayerID) ~= float(int(PlayerID)))
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    List.Remove(Index, 1);
    //return;    
}

function AddPlayer(GameReplicationInfo GRI, int Index, GUIList List)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(i < List.ItemCount)
    {
        // End:0x5D
        if(float(int(List.GetExtraAtIndex(i))) ~= float(GRI.PRIArray[Index].PlayerID))
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    List.Add(GRI.PRIArray[Index].PlayerName, none, "" $ string(GRI.PRIArray[Index].PlayerID));
    //return;    
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
    // End:0x1EF
    if(bTeamGame)
    {
        i = 0;
        J0x29:

        // End:0x6F [Loop If]
        if(i < li_Red.ItemCount)
        {
            ValidatePlayer(li_Red.GetExtraAtIndex(i), li_Red, i);
            i++;
            // [Loop Continue]
            goto J0x29;
        }
        i = 0;
        J0x76:

        // End:0xBC [Loop If]
        if(i < li_Blue.ItemCount)
        {
            ValidatePlayer(li_Blue.GetExtraAtIndex(i), li_Blue, i);
            i++;
            // [Loop Continue]
            goto J0x76;
        }
        i = 0;
        J0xC3:

        // End:0x1EC [Loop If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0x189
            if((((GRI.PRIArray[i] == none) || GRI.PRIArray[i].Team == none) || GRI.PRIArray[i].bOnlySpectator) || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
            {
                // [Explicit Continue]
                goto J0x1E2;
            }
            // End:0x1CD
            if(GRI.PRIArray[i].Team.TeamIndex == 0)
            {
                AddPlayer(GRI, i, li_Red);
                // [Explicit Continue]
                goto J0x1E2;
            }
            AddPlayer(GRI, i, li_Blue);
            J0x1E2:

            i++;
            // [Loop Continue]
            goto J0xC3;
        }        
    }
    else
    {
        // End:0x30C
        if(bFFAGame)
        {
            i = 0;
            J0x1FF:

            // End:0x245 [Loop If]
            if(i < li_FFA.ItemCount)
            {
                ValidatePlayer(li_FFA.GetExtraAtIndex(i), li_FFA, i);
                i++;
                // [Loop Continue]
                goto J0x1FF;
            }
            i = 0;
            J0x24C:

            // End:0x30C [Loop If]
            if(i < GRI.PRIArray.Length)
            {
                // End:0x2ED
                if(((GRI.PRIArray[i] == none) || GRI.PRIArray[i].bOnlySpectator) || GRI.PRIArray[i].bIsSpectator && !GRI.PRIArray[i].bWaitingPlayer)
                {
                    // [Explicit Continue]
                    goto J0x302;
                }
                AddPlayer(GRI, i, li_FFA);
                J0x302:

                i++;
                // [Loop Continue]
                goto J0x24C;
            }
        }
    }
    //return;    
}

function SetButtonPositions(Canvas C)
{
    local int i, j, ButtonsPerRow, ButtonsLeftInRow;
    local float Width, center, X, Y, XL, YL;

    bInit = false;
    Width = b_Settings.ActualWidth();
    center = ActualLeft() + (ActualWidth() / float(2));
    XL = Width * 1.0500000;
    YL = b_Settings.ActualHeight() * 1.2000000;
    Y = b_Settings.ActualTop();
    ButtonsPerRow = int(ActualWidth() / XL);
    ButtonsLeftInRow = ButtonsPerRow;
    // End:0xC2
    if(ButtonsPerRow > 1)
    {
        X = center - (0.5000000 * ((XL * float(ButtonsPerRow - 1)) + Width));        
    }
    else
    {
        X = center - (Width / float(2));
    }
    i = 0;
    J0xE1:

    // End:0x25F [Loop If]
    if(i < Components.Length)
    {
        // End:0x13D
        if((!Components[i].bVisible || GUIButton(Components[i]) == none) || Components[i] == b_Team)
        {
            // [Explicit Continue]
            goto J0x255;
        }
        Components[i].SetPosition(X, Y, Components[i].WinWidth, Components[i].WinHeight, true);
        // End:0x1A1
        if(--ButtonsLeftInRow > 0)
        {
            X += XL;
            // [Explicit Continue]
            goto J0x255;
        }
        Y += YL;
        j = i + 1;
        J0x1BB:

        // End:0x203 [Loop If]
        if((j < Components.Length) && ButtonsLeftInRow < ButtonsPerRow)
        {
            // End:0x1F9
            if(GUIButton(Components[j]) != none)
            {
                ButtonsLeftInRow++;
            }
            j++;
            // [Loop Continue]
            goto J0x1BB;
        }
        // End:0x23D
        if(ButtonsLeftInRow > 1)
        {
            X = center - (0.5000000 * ((XL * float(ButtonsLeftInRow - 1)) + Width));
            // [Explicit Continue]
            goto J0x255;
        }
        X = center - (Width / float(2));
        J0x255:

        i++;
        // [Loop Continue]
        goto J0xE1;
    }
    //return;    
}

function ListChange(GUIComponent Sender)
{
    local export editinline GUIList List;

    List = GUIList(Sender);
    // End:0x1D
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
    if((List != li_Blue) && li_Blue != none)
    {
        li_Blue.SilentSetIndex(-1);
    }
    //return;    
}

function bool CurrentServerIsInFavorites()
{
    local ServerFavorite Fav;
    local string Address, portString;

    // End:0x0B
    if(PlayerOwner() == none)
    {
        return true;
    }
    Address = PlayerOwner().GetServerNetworkAddress();
    // End:0x2C
    if(Address == "")
    {
        return true;
    }
    // End:0x5D
    if(Divide(Address, ":", Fav.IP, portString))
    {
        Fav.Port = int(portString);        
    }
    else
    {
        Fav.IP = Address;
    }
    return Class'XInterface.ExtendedConsole'.static.InFavorites(Fav);
    //return;    
}

function bool ButtonClicked(GUIComponent Sender)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x96
    if(Sender == i_JoinRed)
    {
        // End:0x83
        if(((PC.PlayerReplicationInfo == none) || PC.PlayerReplicationInfo.Team == none) || PC.PlayerReplicationInfo.Team.TeamIndex != 0)
        {
            PC.ChangeTeam(0);
        }
        Controller.CloseMenu(false);        
    }
    else
    {
        // End:0x123
        if(Sender == i_JoinBlue)
        {
            // End:0x110
            if(((PC.PlayerReplicationInfo == none) || PC.PlayerReplicationInfo.Team == none) || PC.PlayerReplicationInfo.Team.TeamIndex != 1)
            {
                PC.ChangeTeam(1);
            }
            Controller.CloseMenu(false);            
        }
        else
        {
            // End:0x153
            if(Sender == b_Settings)
            {
                Controller.OpenMenu(Controller.GetSettingsPage());                
            }
            else
            {
                // End:0x183
                if(Sender == b_Browser)
                {
                    Controller.OpenMenu(Controller.GetServerBrowserPage());                    
                }
                else
                {
                    // End:0x21E
                    if(Sender == b_Leave)
                    {
                        Controller.CloseMenu();
                        // End:0x203
                        if(PC.Level.Game.CurrentGameProfile != none)
                        {
                            PC.Level.Game.CurrentGameProfile.ContinueSinglePlayerGame(PC.Level, true);                            
                        }
                        else
                        {
                            Controller.TcpHandler.sfReqDisconnectGame();
                        }                        
                    }
                    else
                    {
                        // End:0x268
                        if(Sender == b_Favs)
                        {
                            PC.ConsoleCommand("ADDCURRENTTOFAVORITES");
                            b_Favs.MenuStateChange(4);                            
                        }
                        else
                        {
                            // End:0x298
                            if(Sender == b_Quit)
                            {
                                Controller.OpenMenu(Controller.GetQuitPage());                                
                            }
                            else
                            {
                                // End:0x2C7
                                if(Sender == b_MapVote)
                                {
                                    Controller.OpenMenu(Controller.MapVotingMenu);                                    
                                }
                                else
                                {
                                    // End:0x2F6
                                    if(Sender == b_KickVote)
                                    {
                                        Controller.OpenMenu(Controller.KickVotingMenu);                                        
                                    }
                                    else
                                    {
                                        // End:0x325
                                        if(Sender == b_MatchSetup)
                                        {
                                            Controller.OpenMenu(Controller.MatchSetupMenu);                                            
                                        }
                                        else
                                        {
                                            // End:0x37F
                                            if(Sender == b_Spec)
                                            {
                                                Controller.CloseMenu();
                                                // End:0x370
                                                if(PC.PlayerReplicationInfo.bOnlySpectator)
                                                {
                                                    PC.BecomeActivePlayer();                                                    
                                                }
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
    //return;    
}

function DrawPlayerItem(PlayerReplicationInfo PRI, Canvas Canvas, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local GUI.eMenuState M;
    local string S;
    local float XL, YL;
    local GUI.eFontScale F;

    // End:0x14
    if(bTeamGame)
    {
        F = 1;        
    }
    else
    {
        F = 2;
    }
    // End:0x2A9
    if(PRI != none)
    {
        Y += (H * 0.1000000);
        H -= (H * 0.2000000);
        // End:0xD0
        if(bSelected)
        {
            Canvas.SetPos(X, Y);
            Canvas.SetDrawColor(32, 32, 128, byte(255));
            Canvas.DrawTile(Controller.DefaultPens[0], W, H, 0.0000000, 0.0000000, 2.0000000, 2.0000000);
            M = 2;            
        }
        else
        {
            M = 0;
        }
        PlayerStyle.TextSize(Canvas, M, PRI.PlayerName, XL, YL, 1);
        PlayerStyle.DrawText(Canvas, M, X, Y, W, YL, 0, PRI.PlayerName, 1);
        PlayerStyle.TextSize(Canvas, M, "" $ string(int(PRI.Score)), XL, YL, 1);
        PlayerStyle.DrawText(Canvas, M, (X + W) - XL, Y, XL, YL, 2, "" $ string(int(PRI.Score)), 1);
        // End:0x2A9
        if((Canvas.ClipX > float(640)) && bNetGame)
        {
            Y += YL;
            S = (("Ping:" $ string(4 * PRI.Ping)) $ " P/L:") $ string(PRI.PacketLoss);
            PlayerStyle.TextSize(Canvas, M, S, XL, YL, 1);
            PlayerStyle.DrawText(Canvas, M, X, Y, W, YL, 0, S, 0);
        }
    }
    //return;    
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
    // End:0x7F
    if(PRI != none)
    {
        DrawPlayerItem(PRI, Canvas, X, Y, W, H, bSelected, bPending);
    }
    //return;    
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
    // End:0x7F
    if(PRI != none)
    {
        DrawPlayerItem(PRI, Canvas, X, Y, W, H, bSelected, bPending);
    }
    //return;    
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
    // End:0x7F
    if(PRI != none)
    {
        DrawPlayerItem(PRI, Canvas, X, Y, W, H, bSelected, bPending);
    }
    //return;    
}

function bool RightClick(GUIComponent Sender)
{
    // End:0x1B
    if(GUIListBase(Controller.ActiveControl) == none)
    {
        return false;
    }
    return true;
    //return;    
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
    // End:0xA0
    if(List == none)
    {
        Log((string(Name) @ "ContextMenuOpened active control was not a list - active:") $ string(Controller.ActiveControl.Name));
        return false;
    }
    // End:0xB6
    if(!List.IsValid())
    {
        return false;
    }
    PRI = GRI.FindPlayerByID(int(List.GetExtra()));
    // End:0x116
    if(((PRI == none) || PRI.bBot) || PlayerIDIsMine(PRI.PlayerID))
    {
        return false;
    }
    Restriction = PlayerOwner().ChatManager.GetPlayerRestriction(PRI.PlayerID);
    // End:0x16A
    if(bool(int(Restriction) & 1))
    {
        Menu.ContextItems[0] = ContextItems[0];        
    }
    else
    {
        Menu.ContextItems[0] = DefaultItems[0];
    }
    // End:0x1AD
    if(bool(int(Restriction) & 2))
    {
        Menu.ContextItems[1] = ContextItems[1];        
    }
    else
    {
        Menu.ContextItems[1] = DefaultItems[1];
    }
    // End:0x1F2
    if(bool(int(Restriction) & 4))
    {
        Menu.ContextItems[2] = ContextItems[2];        
    }
    else
    {
        Menu.ContextItems[2] = DefaultItems[2];
    }
    // End:0x239
    if(bool(int(Restriction) & 8))
    {
        Menu.ContextItems[3] = ContextItems[3];        
    }
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
        Menu.ContextItems[7] = ((KickPlayer $ "[") $ List.Get()) $ "]";
        Menu.ContextItems[8] = ((BanPlayer $ "[") $ List.Get()) $ "]";        
    }
    else
    {
        // End:0x34E
        if(Menu.ContextItems.Length > 6)
        {
            Menu.ContextItems.Remove(6, Menu.ContextItems.Length - 6);
        }
    }
    return true;
    //return;    
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
    // End:0xA3
    if(PRI == none)
    {
        return;
    }
    // End:0x12B
    if(ClickIndex > 5)
    {
        switch(ClickIndex)
        {
            // End:0xBB
            case 6:
            // End:0xEF
            case 7:
                PC.AdminCommand("admin kick" @ List.GetExtra());
                // End:0x129
                break;
            // End:0x126
            case 8:
                PC.AdminCommand("admin kickban" @ List.GetExtra());
                // End:0x129
                break;
            // End:0xFFFF
            default:
                break;
        }
        return;
    }
    // End:0x15B
    if(ClickIndex > 3)
    {
        Controller.AddBuddy(List.Get());
        return;
    }
    Type = byte(int(1) << ClickIndex);
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
    else
    {
        // End:0x28E
        if(PC.ChatManager.AddRestrictionID(PRI.PlayerID, Type))
        {
            PC.ServerChatRestriction(PRI.PlayerID, PC.ChatManager.GetPlayerRestriction(PRI.PlayerID));
            ModifiedChatRestriction(self, PRI.PlayerID);
        }
    }
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIMultiComponent).Closed(Sender, bCancelled);
    li_Red.SilentSetIndex(-1);
    li_Blue.SilentSetIndex(-1);
    li_FFA.SilentSetIndex(-1);
    //return;    
}

function bool TeamChange(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("switchteam");
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool RedDraw(Canvas C)
{
    i_JoinRed.WinHeight = i_JoinRed.WinWidth;
    i_JoinBlue.WinHeight = i_JoinBlue.WinWidth;
    return false;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.SBRed'
    begin object name="SBRed" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="??"
        LeftPadding=0.0100000
        RightPadding=0.0100000
        WinTop=0.0830660
        WinLeft=0.0166000
        WinWidth=0.4701350
        WinHeight=0.6440780
        OnPreDraw=SBRed.InternalPreDraw
    end object
    sb_Red=SBRed
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.SBBlue'
    begin object name="SBBlue" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="??"
        LeftPadding=0.0100000
        RightPadding=0.0100000
        WinTop=0.0830660
        WinLeft=0.5124640
        WinWidth=0.4688500
        WinHeight=0.6440780
        OnPreDraw=SBBlue.InternalPreDraw
    end object
    sb_Blue=SBBlue
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.SBFFA'
    begin object name="SBFFA" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="????"
        LeftPadding=0.0100000
        RightPadding=0.0100000
        WinTop=0.0246390
        WinLeft=0.0371540
        WinWidth=0.9197530
        WinHeight=0.7018860
        OnPreDraw=SBFFA.InternalPreDraw
    end object
    sb_FFA=SBFFA
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.JoinRedButton'
    begin object name="JoinRedButton" class=XInterface.GUIImage
        ImageColor=(R=255,G=100,B=100,A=90)
        ImageStyle=2
        Hint="??? ??"
        WinTop=0.1501600
        WinLeft=0.0307760
        WinWidth=0.4390400
        WinHeight=0.4640400
        TabOrder=9
        bBoundToParent=true
        bScaleToParent=true
        OnDraw=UT2K4Tab_PlayerLoginControls.RedDraw
    end object
    i_JoinRed=JoinRedButton
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.JoinBlueButton'
    begin object name="JoinBlueButton" class=XInterface.GUIImage
        ImageColor=(R=0,G=128,B=255,A=90)
        ImageStyle=2
        Hint="??? ??"
        WinTop=0.1418140
        WinLeft=0.5317790
        WinWidth=0.4390400
        WinHeight=0.4640400
        TabOrder=10
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_JoinBlue=JoinBlueButton
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.RedTeamListBox'
    begin object name="RedTeamListBox" class=XInterface.GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=RedTeamListBox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.2500000
        WinLeft=0.0500000
        WinWidth=0.4187500
        WinHeight=0.4000000
        TabOrder=11
    end object
    lb_Red=RedTeamListBox
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.BlueTeamListBox'
    begin object name="BlueTeamListBox" class=XInterface.GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=BlueTeamListBox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.2500000
        WinLeft=0.5212500
        WinWidth=0.4187500
        WinHeight=0.4000000
        TabOrder=12
    end object
    lb_Blue=BlueTeamListBox
    // Reference: GUIListBox'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.FFAPlayerListBox'
    begin object name="FFAPlayerListBox" class=XInterface.GUIListBox
        SelectedStyleName="BrowserListSelection"
        bVisibleWhenEmpty=true
        OnCreateComponent=FFAPlayerListBox.InternalOnCreateComponent
        StyleName="ServerBrowserGrid"
        WinTop=0.1500000
        WinLeft=0.3250000
        WinWidth=0.3500000
        WinHeight=0.5000000
        TabOrder=13
    end object
    lb_FFA=FFAPlayerListBox
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.TeamButton'
    begin object name="TeamButton" class=XInterface.GUIButton
        Caption="? ??"
        WinTop=0.0166130
        WinLeft=0.3720390
        WinWidth=0.2501000
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=true
        OnClick=UT2K4Tab_PlayerLoginControls.TeamChange
        OnKeyEvent=TeamButton.InternalOnKeyEvent
    end object
    b_Team=TeamButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.SettingsButton'
    begin object name="SettingsButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.7667520
        WinLeft=0.1123450
        WinWidth=0.2501000
        WinHeight=0.0533660
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=SettingsButton.InternalOnKeyEvent
    end object
    b_Settings=SettingsButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.BrowserButton'
    begin object name="BrowserButton" class=XInterface.GUIButton
        Caption="?? ????"
        bAutoSize=true
        WinTop=0.6750000
        WinLeft=0.3750000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=BrowserButton.InternalOnKeyEvent
    end object
    b_Browser=BrowserButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.QuitGameButton'
    begin object name="QuitGameButton" class=XInterface.GUIButton
        Caption="?? ???"
        bAutoSize=true
        WinTop=0.7500000
        WinLeft=0.7250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=4
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=QuitGameButton.InternalOnKeyEvent
    end object
    b_Quit=QuitGameButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.FavoritesButton'
    begin object name="FavoritesButton" class=XInterface.GUIButton
        Caption="????? ??"
        bAutoSize=true
        Hint="? ??? ????? ?????"
        WinTop=0.7500000
        WinLeft=0.0250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=FavoritesButton.InternalOnKeyEvent
    end object
    b_Favs=FavoritesButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.LeaveMatchButton'
    begin object name="LeaveMatchButton" class=XInterface.GUIButton
        bAutoSize=true
        WinTop=0.6750000
        WinLeft=0.7250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=LeaveMatchButton.InternalOnKeyEvent
    end object
    b_Leave=LeaveMatchButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.MapVotingButton'
    begin object name="MapVotingButton" class=XInterface.GUIButton
        Caption="? ??"
        bAutoSize=true
        WinTop=0.8250000
        WinLeft=0.0250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=5
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=MapVotingButton.InternalOnKeyEvent
    end object
    b_MapVote=MapVotingButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.KickVotingButton'
    begin object name="KickVotingButton" class=XInterface.GUIButton
        Caption="?? ??"
        bAutoSize=true
        WinTop=0.8250000
        WinLeft=0.3750000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=6
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=KickVotingButton.InternalOnKeyEvent
    end object
    b_KickVote=KickVotingButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.MatchSetupButton'
    begin object name="MatchSetupButton" class=XInterface.GUIButton
        Caption="?? ??"
        bAutoSize=true
        WinTop=0.8250000
        WinLeft=0.7250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=7
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=MatchSetupButton.InternalOnKeyEvent
    end object
    b_MatchSetup=MatchSetupButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.SpectateButton'
    begin object name="SpectateButton" class=XInterface.GUIButton
        Caption="??"
        bAutoSize=true
        WinTop=0.8250000
        WinLeft=0.7250000
        WinWidth=0.2000000
        WinHeight=0.0500000
        TabOrder=8
        OnClick=UT2K4Tab_PlayerLoginControls.ButtonClicked
        OnKeyEvent=SpectateButton.InternalOnKeyEvent
    end object
    b_Spec=SpectateButton
    LeaveMPButtonText="?????"
    LeaveSPButtonText="?? ??"
    SpectateButtonText="??"
    JoinGameButtonText="??"
    ContextItems[0]="??? ?? ??"
    ContextItems[1]="??? ?? ??"
    ContextItems[2]="???? ?? ??"
    ContextItems[3]="?????? ?? ??"
    DefaultItems[0]="??? ??"
    DefaultItems[1]="??? ??"
    DefaultItems[2]="???? ??"
    DefaultItems[3]="?????? ??"
    KickPlayer="?? "
    BanPlayer="?? "
    BuddyText="?? ???? ??"
    RedTeam="??:"
    BlueTeam="??:"
    PlayerStyleName="TextLabel"
    PropagateVisibility=false
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2K4Tab_PlayerLoginControls.PlayerListContextMenu'
    begin object name="PlayerListContextMenu" class=XInterface.GUIContextMenu
        ContextItems[0]="??? ??"
        ContextItems[1]="??? ??"
        ContextItems[2]="???? ??"
        ContextItems[3]="?????? ??"
        OnOpen=UT2K4Tab_PlayerLoginControls.ContextMenuOpened
        OnSelect=UT2K4Tab_PlayerLoginControls.ContextClick
    end object
    ContextMenu=PlayerListContextMenu
    OnPreDraw=UT2K4Tab_PlayerLoginControls.InternalOnPreDraw
    OnRightClick=UT2K4Tab_PlayerLoginControls.RightClick
}