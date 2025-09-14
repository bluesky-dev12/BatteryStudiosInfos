class xWebQueryCurrent extends xWebQueryHandler within UTServerAdmin
    config;

var config string CurrentIndexPage;
var config string CurrentPlayersPage;
var config string CurrentGamePage;
var config string CurrentConsolePage;
var config string CurrentConsoleLogPage;
var config string CurrentConsoleSendPage;
var config string CurrentMutatorsPage;
var config string CurrentBotsPage;
var config string CurrentRestartPage;
var config string DefaultSendText;
var config string StatTable;
var config string StatTableRow;
var config string PlayerListHeader;
var config string PlayerListLinkedHeader;
var config string PlayerListMinPlayers;
var config string ConsoleRefreshTag;
var config string MutatorTablePage;
var config string MutatorGroupTitle;
var config string MutatorGroupMember;
var localized string BadGameType;
var localized string CurrentLinks[6];
var localized string NoBotsTitle;
var localized string KickButtonText[3];
var localized string NoPlayersConnected;
var localized string SelectedMutators;
var localized string PickMutators;
var localized string GameTypeUnsupported;
var localized string NoBots;
var localized string added;
var localized string Removed;
var localized string BotStatus;
var localized string SingleBotStatus;
var localized string ConsoleUserlist;
var localized string NoteGamePage;
var localized string NotePlayersPage;
var localized string NoteConsolePage;
var localized string NoteMutatorsPage;
var localized string NoteBotsPage;
var StringArray SpeciesNames;
var array<StringArray> BotList;

function bool Query(WebRequest Request, WebResponse Response)
{
    // End:0x1B
    if(!Outer.CanPerform(NeededPrivs))
    {
        return false;
    }
    switch(Mid(Request.URI, 1))
    {
        // End:0x48
        case DefaultPage:
            QueryCurrentFrame(Request, Response);
            return true;
        // End:0x62
        case CurrentIndexPage:
            QueryCurrentMenu(Request, Response);
            return true;
        // End:0x90
        case CurrentPlayersPage:
            // End:0x8E
            if(!Outer.MapIsChanging())
            {
                QueryCurrentPlayers(Request, Response);
            }
            return true;
        // End:0xBE
        case CurrentGamePage:
            // End:0xBC
            if(!Outer.MapIsChanging())
            {
                QueryCurrentGame(Request, Response);
            }
            return true;
        // End:0xEC
        case CurrentConsolePage:
            // End:0xEA
            if(!Outer.MapIsChanging())
            {
                QueryCurrentConsole(Request, Response);
            }
            return true;
        // End:0x11A
        case CurrentConsoleLogPage:
            // End:0x118
            if(!Outer.MapIsChanging())
            {
                QueryCurrentConsoleLog(Request, Response);
            }
            return true;
        // End:0x134
        case CurrentConsoleSendPage:
            QueryCurrentConsoleSend(Request, Response);
            return true;
        // End:0x162
        case CurrentMutatorsPage:
            // End:0x160
            if(!Outer.MapIsChanging())
            {
                QueryCurrentMutators(Request, Response);
            }
            return true;
        // End:0x190
        case CurrentBotsPage:
            // End:0x18E
            if(!Outer.MapIsChanging())
            {
                QueryCurrentBots(Request, Response);
            }
            return true;
        // End:0x1C7
        case CurrentRestartPage:
            // End:0x1C5
            if(!Outer.MapIsChanging())
            {
                Outer.QueryRestartPage(Request, Response);
            }
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function QueryCurrentFrame(WebRequest Request, WebResponse Response)
{
    local string Page;

    Page = Request.GetVariable("Page", CurrentGamePage);
    Response.Subst("IndexURI", (CurrentIndexPage $ "?Page=") $ Page);
    Response.Subst("MainURI", Page);
    Outer.ShowFrame(Response, DefaultPage);
    //return;    
}

function QueryCurrentMenu(WebRequest Request, WebResponse Response)
{
    local string Page;

    Page = Request.GetVariable("Page", CurrentGamePage);
    Response.Subst("DefaultBG", Outer.DefaultBG);
    Response.Subst("PlayersBG", Outer.DefaultBG);
    Response.Subst("GameBG", Outer.DefaultBG);
    Response.Subst("ConsoleBG", Outer.DefaultBG);
    Response.Subst("MutatorsBG", Outer.DefaultBG);
    Response.Subst("RestartBG", Outer.DefaultBG);
    switch(Page)
    {
        // End:0x148
        case CurrentPlayersPage:
            Response.Subst("PlayersBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0x178
        case CurrentGamePage:
            Response.Subst("GameBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0x1AB
        case CurrentConsolePage:
            Response.Subst("ConsoleBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0x1DF
        case CurrentMutatorsPage:
            Response.Subst("MutatorsBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0x212
        case CurrentRestartPage:
            Response.Subst("RestartBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0xFFFF
        default:
            break;
    }
    Response.Subst("PlayersURI", (DefaultPage $ "?Page=") $ CurrentPlayersPage);
    Response.Subst("GameURI", (DefaultPage $ "?Page=") $ CurrentGamePage);
    Response.Subst("ConsoleURI", (DefaultPage $ "?Page=") $ CurrentConsolePage);
    Response.Subst("MutatorsURI", (DefaultPage $ "?Page=") $ CurrentMutatorsPage);
    Response.Subst("BotsURI", (DefaultPage $ "?Page=") $ CurrentBotsPage);
    Response.Subst("RestartURI", (DefaultPage $ "?Page=") $ CurrentRestartPage);
    Response.Subst("GameLink", CurrentLinks[0]);
    Response.Subst("PlayerLink", CurrentLinks[1]);
    Response.Subst("ConsoleLink", CurrentLinks[2]);
    Response.Subst("MutatorLink", CurrentLinks[3]);
    Response.Subst("BotsLink", CurrentLinks[4]);
    Response.Subst("RestartLink", CurrentLinks[5]);
    Outer.ShowPage(Response, CurrentIndexPage);
    //return;    
}

function QueryCurrentPlayers(WebRequest Request, WebResponse Response)
{
    local string Sort, PlayerListSubst, TempStr, TempTag, TempData, TableHeaders,
	    GameType, Reverse, ColorNames, Last;

    local StringArray PlayerList;
    local Controller P, NextP;
    local int i, Cols, mlength;
    local string IP, id;
    local bool bCanKick, bCanBan, bCanKickBots;

    Response.Subst("Section", CurrentLinks[1]);
    Response.Subst("PostAction", CurrentPlayersPage);
    ColorNames[0] = Class'Engine.TeamInfo'.default.ColorNames[0];
    ColorNames[1] = Class'Engine.TeamInfo'.default.ColorNames[1];
    mlength = int(Eval(Len(ColorNames[0]) > Len(ColorNames[1]), string(Len(ColorNames[0])), string(Len(ColorNames[1]))));
    // End:0x1521
    if(Outer.CanPerform("Xp|Kp|Kb|Ko"))
    {
        PlayerList = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
        Sort = Request.GetVariable("Sort", "Name");
        Last = Request.GetVariable("Last");
        Response.Subst("Sort", Sort);
        Cols = 0;
        bCanKick = Outer.CanPerform("Kp");
        bCanBan = Outer.CanPerform("Kb");
        bCanKickBots = Outer.CanPerform("Ko|Mb");
        // End:0x1DE
        if((Last == Sort) && Request.GetVariable("ReverseSort") == "")
        {
            PlayerList.ToggleSort();
            Reverse = "?ReverseSort=True";            
        }
        else
        {
            Reverse = "";
        }
        // End:0x845
        if((bCanKick || bCanBan) || bCanKickBots)
        {
            P = Outer.Level.ControllerList;
            // End:0x404
            if(P != none)
            {
                J0x22D:

                NextP = P.nextController;
                // End:0x378
                if(((PlayerController(P) != none) && P.PlayerReplicationInfo != none) && NetConnection(PlayerController(P).Player) != none)
                {
                    // End:0x2FF
                    if(bCanBan && Request.GetVariable("Ban" $ string(P.PlayerReplicationInfo.PlayerID)) != "")
                    {
                        Outer.Level.Game.AccessControl.KickBanPlayer(PlayerController(P));                        
                    }
                    else
                    {
                        // End:0x375
                        if(bCanKick && Request.GetVariable("Kick" $ string(P.PlayerReplicationInfo.PlayerID)) != "")
                        {
                            Outer.Level.Game.AccessControl.KickPlayer(PlayerController(P));
                        }
                    }                    
                }
                else
                {
                    // End:0x3EE
                    if((((PlayerController(P) == none) && bCanKickBots) && P.PlayerReplicationInfo != none) && Request.GetVariable("Kick" $ string(P.PlayerReplicationInfo.PlayerID)) != "")
                    {
                        P.Destroy();
                    }
                }
                P = NextP;
                // End:0x22D
                if(!(P == none))
                    goto J0x22D;
            }
            // End:0x420
            if(bCanKick || bCanKickBots)
            {
                Cols += 1;
            }
            // End:0x432
            if(bCanBan)
            {
                Cols += 2;
            }
            Response.Subst("KickButton", Outer.SubmitButton("Kick", KickButtonText[Cols - 1]));
            TableHeaders = "";
            // End:0x4C9
            if(bCanKick || bCanKickBots)
            {
                Response.Subst("HeadTitle", "Kick");
                TableHeaders $= Outer.WebInclude(PlayerListHeader);
            }
            // End:0x50E
            if(bCanBan)
            {
                Response.Subst("HeadTitle", "Ban");
                TableHeaders $= Outer.WebInclude(PlayerListHeader);
            }
            // End:0x542
            if(Sort ~= "Name")
            {
                Response.Subst("ReverseSort", Reverse);                
            }
            else
            {
                Response.Subst("ReverseSort", "");
            }
            Response.Subst("HeadTitle", "Name");
            TableHeaders $= Outer.WebInclude(PlayerListLinkedHeader);
            // End:0x659
            if(Outer.Level.Game.GameReplicationInfo.bTeamGame)
            {
                // End:0x5FE
                if(Sort ~= "Team")
                {
                    Response.Subst("ReverseSort", Reverse);                    
                }
                else
                {
                    Response.Subst("ReverseSort", "");
                }
                Response.Subst("HeadTitle", "Team");
                TableHeaders $= Outer.WebInclude(PlayerListLinkedHeader);
            }
            // End:0x68D
            if(Sort ~= "Ping")
            {
                Response.Subst("ReverseSort", Reverse);                
            }
            else
            {
                Response.Subst("ReverseSort", "");
            }
            Response.Subst("HeadTitle", "Ping");
            TableHeaders $= Outer.WebInclude(PlayerListLinkedHeader);
            // End:0x71D
            if(Sort ~= "Score")
            {
                Response.Subst("ReverseSort", Reverse);                
            }
            else
            {
                Response.Subst("ReverseSort", "");
            }
            Response.Subst("HeadTitle", "Score");
            TableHeaders $= Outer.WebInclude(PlayerListLinkedHeader);
            Response.Subst("HeadTitle", "IP");
            TableHeaders $= Outer.WebInclude(PlayerListHeader);
            // End:0x823
            if(Outer.Level.Game.AccessControl.bBanByID)
            {
                Response.Subst("HeadTitle", "Global ID");
                TableHeaders $= Outer.WebInclude(PlayerListHeader);
            }
            Response.Subst("TableHeaders", TableHeaders);
        }
        // End:0xA73
        if(Outer.CanPerform("Ms"))
        {
            GameType = Outer.Level.GetItemName(Outer.SetGamePI(GameType));
            // End:0xA35
            if((Outer.GamePI != none) && int(Outer.GamePI.Settings[Outer.GamePI.FindIndex(GameType $ ".MinPlayers")].SecLevel) <= Outer.CurAdmin.MaxSecLevel())
            {
                // End:0x9BE
                if((Request.GetVariable("SetMinPlayers", "") != "") && UnrealMPGameInfo(Outer.Level.Game) != none)
                {
                    UnrealMPGameInfo(Outer.Level.Game).MinPlayers = Min(Max(int(Request.GetVariable("MinPlayers", string(0))), 0), 32);
                    Outer.Level.Game.SaveConfig();
                }
                Response.Subst("MinPlayers", string(UnrealMPGameInfo(Outer.Level.Game).MinPlayers));
                Response.Subst("MinPlayerPart", Outer.WebInclude(PlayerListMinPlayers));                
            }
            else
            {
                Response.Subst("MinPlayers", "");
                Response.Subst("MinPlayersPart", "");
            }
        }
        P = Outer.Level.ControllerList;
        J0xA90:

        // End:0x133B [Loop If]
        if(P != none)
        {
            TempData = "";
            // End:0x1324
            if((!P.bDeleteMe && P.bIsPlayer) && P.PlayerReplicationInfo != none)
            {
                Response.Subst("Content", Outer.Checkbox("Kick" $ string(P.PlayerReplicationInfo.PlayerID), false));
                // End:0xB66
                if(Outer.CanPerform("Kp"))
                {
                    TempData $= Outer.WebInclude(Outer.CellCenter);
                }
                // End:0xC17
                if(Outer.CanPerform("Kb"))
                {
                    // End:0xBD7
                    if(PlayerController(P) != none)
                    {
                        Response.Subst("Content", Outer.Checkbox("Ban" $ string(P.PlayerReplicationInfo.PlayerID), false));                        
                    }
                    else
                    {
                        Response.Subst("Content", "");
                    }
                    TempData $= Outer.WebInclude(Outer.CellCenter);
                }
                TempStr = "";
                // End:0xC9D
                if(((DeathMatch(Outer.Level.Game) != none) && DeathMatch(Outer.Level.Game).bTournament) && P.PlayerReplicationInfo.bReadyToPlay)
                {
                    TempStr = " (Ready) ";                    
                }
                else
                {
                    // End:0xCD0
                    if(P.PlayerReplicationInfo.bIsSpectator)
                    {
                        TempStr = " (Spectator) ";                        
                    }
                    else
                    {
                        // End:0xCEF
                        if(PlayerController(P) == none)
                        {
                            TempStr = " (Bot) ";
                        }
                    }
                }
                // End:0xDA4
                if(PlayerController(P) != none)
                {
                    IP = PlayerController(P).GetPlayerNetworkAddress();
                    IP = Outer.HtmlEncode(" " $ Left(IP, InStr(IP, ":")));
                    id = Outer.HtmlEncode(" " $ Eval(Outer.Level.Game.AccessControl.bBanByID, PlayerController(P).GetPlayerIDHash(), " "));                    
                }
                else
                {
                    IP = Outer.HtmlEncode("  ");
                    id = Outer.HtmlEncode("  ");
                }
                Response.Subst("Content", Outer.HtmlEncode(P.PlayerReplicationInfo.PlayerName $ TempStr));
                TempData $= Outer.WebInclude(Outer.NowrapLeft);
                // End:0xFDC
                if(Outer.Level.Game.bTeamGame)
                {
                    // End:0xF70
                    if((P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex < 4)
                    {
                        Response.Subst("Content", (((("<span style='background-color: " $ Class'Engine.TeamInfo'.default.ColorNames[P.PlayerReplicationInfo.Team.TeamIndex]) $ "'>") $ Outer.HtmlEncode("  ")) $ "</span>") $ Outer.HtmlEncode(P.PlayerReplicationInfo.Team.GetHumanReadableName()));                        
                    }
                    else
                    {
                        // End:0xFB6
                        if(P.PlayerReplicationInfo.bIsSpectator)
                        {
                            Response.Subst("Content", Outer.HtmlEncode("  "));
                        }
                    }
                    TempData $= Outer.WebInclude(Outer.NowrapCenter);
                }
                Response.Subst("Content", string(P.PlayerReplicationInfo.Ping * 4));
                TempData $= Outer.WebInclude(Outer.CellCenter);
                Response.Subst("Content", string(int(P.PlayerReplicationInfo.Score)));
                TempData $= Outer.WebInclude(Outer.CellCenter);
                Response.Subst("Content", IP);
                TempData $= Outer.WebInclude(Outer.CellCenter);
                // End:0x1143
                if(Outer.Level.Game.AccessControl.bBanByID)
                {
                    Response.Subst("Content", id);
                    TempData $= Outer.WebInclude(Outer.CellCenter);
                }
                switch(Sort)
                {
                    // End:0x1173
                    case "Name":
                        TempTag = P.PlayerReplicationInfo.PlayerName;
                        // End:0x12D3
                        break;
                    // End:0x1267
                    case "Team":
                        TempTag = PadRight(Class'Engine.TeamInfo'.default.ColorNames[P.PlayerReplicationInfo.Team.TeamIndex], mlength, "0");
                        switch(Last)
                        {
                            // End:0x11F2
                            case "Name":
                                TempTag $= P.PlayerReplicationInfo.PlayerName;
                                // End:0x1264
                                break;
                            // End:0x122F
                            case "Ping":
                                TempTag $= (PadLeft(string(P.PlayerReplicationInfo.Ping * 4), 5, "0"));
                                // End:0x1264
                                break;
                            // End:0xFFFF
                            default:
                                TempTag $= (PadLeft(string(int(P.PlayerReplicationInfo.Score)), 4, "0"));
                                // End:0x1264
                                break;
                                break;
                        }
                        // End:0x12D3
                        break;
                    // End:0x12A1
                    case "Ping":
                        TempTag = PadLeft(string(P.PlayerReplicationInfo.Ping * 4), 5, "0");
                        // End:0x12D3
                        break;
                    // End:0xFFFF
                    default:
                        TempTag = PadLeft(string(int(P.PlayerReplicationInfo.Score)), 4, "0");
                        // End:0x12D3
                        break;
                        break;
                }
                Response.Subst("RowContent", TempData);
                PlayerList.Add(Outer.WebInclude(Outer.RowLeft), TempTag);
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0xA90;
        }
        PlayerListSubst = "";
        // End:0x13D7
        if(PlayerList.Count() > 0)
        {
            i = 0;
            J0x135F:

            // End:0x13D4 [Loop If]
            if(i < PlayerList.Count())
            {
                // End:0x13AD
                if(Sort ~= "Score")
                {
                    PlayerListSubst = PlayerList.GetItem(i) $ PlayerListSubst;
                    // [Explicit Continue]
                    goto J0x13CA;
                }
                PlayerListSubst $= PlayerList.GetItem(i);
                J0x13CA:

                i++;
                // [Loop Continue]
                goto J0x135F;
            }            
        }
        else
        {
            Response.Subst("SpanContent", NoPlayersConnected);
            Response.Subst("SpanLength", "6");
            Response.Subst("RowContent", Outer.WebInclude(Outer.CellColSpan));
            PlayerListSubst = Outer.WebInclude(Outer.RowCenter);
        }
        Response.Subst("PlayerList", PlayerListSubst);
        Response.Subst("MinPlayers", string(UnrealMPGameInfo(Outer.Level.Game).MinPlayers));
        Response.Subst("PageHelp", NotePlayersPage);
        Outer.MapTitle(Response);
        Outer.ShowPage(Response, CurrentPlayersPage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryCurrentGame(WebRequest Request, WebResponse Response)
{
    local StringArray ExcludeMaps, IncludeMaps, MovedMaps;
    local Class<GameInfo> GameClass;
    local string NewGameType, SwitchButtonName, GameState, NewMap;
    local bool bMakeChanges;
    local Controller C;
    local wPlayer xp;
    local TeamPlayerReplicationInfo PRI;
    local int i, MultiKills, Sprees, GameIndex;

    // End:0x9BD
    if(Outer.CanPerform("Mt|Mm"))
    {
        // End:0xCB
        if(Request.GetVariable("SwitchGameTypeAndMap", "") != "")
        {
            // End:0xB2
            if(Outer.CanPerform("Mt"))
            {
                Outer.ServerChangeMap(Request, Response, Request.GetVariable("MapSelect"), Request.GetVariable("GameTypeSelect"));                
            }
            else
            {
                Outer.AccessDenied(Response);
            }
            return;            
        }
        else
        {
            // End:0x1EC
            if(Request.GetVariable("SwitchMap", "") != "")
            {
                // End:0x1D6
                if(Outer.CanPerform("Mm|Mt"))
                {
                    NewMap = Request.GetVariable("MapSelect");
                    Outer.Level.ServerTravel((((NewMap $ "?game=") $ string(Outer.Level.Game.Class)) $ "?mutator=") $ Outer.UsedMutators(), false);
                    Outer.ShowMessage(Response, Outer.WaitTitle, Repl(Outer.MapChangingTo, "%MapName%", NewMap));                    
                }
                else
                {
                    Outer.AccessDenied(Response);
                }
                return;
            }
        }
        bMakeChanges = Request.GetVariable("ApplySettings", "") != "";
        // End:0x2A5
        if(Outer.CanPerform("Mt") && bMakeChanges || Request.GetVariable("SwitchGameType", "") != "")
        {
            NewGameType = Request.GetVariable("GameTypeSelect");
            GameClass = Class<GameInfo>(DynamicLoadObject(NewGameType, Class'Core.Class'));            
        }
        else
        {
            GameClass = none;
        }
        // End:0x2EA
        if(GameClass == none)
        {
            GameClass = Outer.Level.Game.Class;
            NewGameType = string(GameClass);
        }
        GameIndex = Outer.Level.Game.MaplistHandler.GetGameIndex(NewGameType);
        ExcludeMaps = Outer.ReloadExcludeMaps(NewGameType);
        IncludeMaps = Outer.ReloadIncludeMaps(ExcludeMaps, GameIndex, Outer.Level.Game.MaplistHandler.GetActiveList(GameIndex));
        GameState = "";
        // End:0x69B
        if(Outer.CanPerform("Ma"))
        {
            // End:0x60F
            if(Outer.Level.Game.NumPlayers > 0)
            {
                C = Outer.Level.ControllerList;
                J0x3E8:

                // End:0x60C [Loop If]
                if(C != none)
                {
                    MultiKills = 0;
                    Sprees = 0;
                    PRI = none;
                    xp = wPlayer(C);
                    // End:0x5F5
                    if((xp != none) && !xp.bDeleteMe)
                    {
                        // End:0x46B
                        if(TeamPlayerReplicationInfo(xp.PlayerReplicationInfo) != none)
                        {
                            PRI = TeamPlayerReplicationInfo(xp.PlayerReplicationInfo);
                        }
                        // End:0x5F5
                        if(PRI != none)
                        {
                            Response.Subst("PlayerName", Outer.HtmlEncode(PRI.PlayerName));
                            Response.Subst("Kills", string(PRI.Kills));
                            Response.Subst("Deaths", string(PRI.Deaths));
                            Response.Subst("Suicides", string(PRI.Suicides));
                            i = 0;
                            J0x52B:

                            // End:0x55E [Loop If]
                            if(i < 7)
                            {
                                MultiKills += int(PRI.MultiKills[i]);
                                i++;
                                // [Loop Continue]
                                goto J0x52B;
                            }
                            Response.Subst("MultiKills", string(MultiKills));
                            i = 0;
                            J0x587:

                            // End:0x5BA [Loop If]
                            if(i < 6)
                            {
                                Sprees += int(PRI.Spree[i]);
                                i++;
                                // [Loop Continue]
                                goto J0x587;
                            }
                            Response.Subst("Sprees", string(Sprees));
                            GameState $= Outer.WebInclude(StatTableRow);
                        }
                    }
                    C = C.nextController;
                    // [Loop Continue]
                    goto J0x3E8;
                }                
            }
            else
            {
                GameState = ("<tr><td colspan=\"6\" align=\"center\">" @ NoPlayersConnected) @ "</td></tr>";
            }
            Response.Subst("StatRows", GameState);
            Response.Subst("GameState", Outer.WebInclude(StatTable));
        }
        // End:0x732
        if(GameClass == Outer.Level.Game.Class)
        {
            SwitchButtonName = "SwitchMap";
            MovedMaps = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
            MovedMaps.CopyFromId(IncludeMaps, IncludeMaps.FindTagId(Left(string(Outer.Level), InStr(string(Outer.Level), "."))));            
        }
        else
        {
            SwitchButtonName = "SwitchGameTypeAndMap";
        }
        // End:0x7FE
        if(Outer.CanPerform("Mt"))
        {
            Response.Subst("Content", Outer.Select("GameTypeSelect", Outer.GenerateGameTypeOptions(NewGameType)));
            Response.Subst("GameTypeButton", Outer.SubmitButton("SwitchGameType", Outer.SwitchText));            
        }
        else
        {
            Response.Subst("Content", Outer.Level.Game.default.GameName);
        }
        Response.Subst("GameTypeSelect", Outer.WebInclude(Outer.CellLeft));
        Response.Subst("Content", Outer.Select("MapSelect", Outer.GenerateMapListSelect(IncludeMaps, MovedMaps)));
        Response.Subst("MapSelect", Outer.WebInclude(Outer.CellLeft));
        Response.Subst("MapButton", Outer.SubmitButton(SwitchButtonName, Outer.SwitchText));
        Response.Subst("PostAction", CurrentGamePage);
        Response.Subst("Section", CurrentLinks[0]);
        Response.Subst("PageHelp", NoteGamePage);
        Outer.MapTitle(Response);
        Outer.ShowPage(Response, CurrentGamePage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryCurrentConsole(WebRequest Request, WebResponse Response)
{
    local string SendStr, OutStr;

    // End:0x392
    if(Outer.CanPerform("Xc"))
    {
        SendStr = Request.GetVariable("SendText", "");
        // End:0x33E
        if((SendStr != "") && !(Left(SendStr, 6) ~= "debug ") || SendStr ~= "debug")
        {
            // End:0xC4
            if(Left(SendStr, 4) ~= "say ")
            {
                Outer.Level.Game.Broadcast(Outer.Spectator, Mid(SendStr, 4), 'Say');                
            }
            else
            {
                // End:0x140
                if(SendStr ~= "pause")
                {
                    // End:0x124
                    if(Outer.Level.Pauser == none)
                    {
                        Outer.Level.Pauser = Outer.Spectator.PlayerReplicationInfo;                        
                    }
                    else
                    {
                        Outer.Level.Pauser = none;
                    }                    
                }
                else
                {
                    // End:0x16B
                    if(SendStr ~= "dump")
                    {
                        Outer.Spectator.Dump();                        
                    }
                    else
                    {
                        // End:0x2EC
                        if(((Left(SendStr, 4) ~= "get ") || Left(SendStr, 4) ~= "set ") && (InStr(Caps(SendStr), "XADMINCONFIG") != -1) || !Outer.CanPerform("Ms"))
                        {
                            // End:0x2BD
                            if(InStr(Caps(SendStr), "XADMINCONFIG") != -1)
                            {
                                Outer.StatusError(Response, ConsoleUserlist);
                                Outer.ShowMessage(Response, Outer.Error, "");
                                Log(("User attempted to modify or enumerate admin account information illegally using the webadmin console.  User:" $ Request.UserName) $ ".", 'WebAdmin');                                
                            }
                            else
                            {
                                // End:0x2E9
                                if(!Outer.CanPerform("Ms"))
                                {
                                    Outer.AccessDenied(Response);
                                }
                            }                            
                        }
                        else
                        {
                            OutStr = Outer.Level.ConsoleCommand(SendStr);
                            // End:0x33E
                            if(OutStr != "")
                            {
                                Outer.Spectator.AddMessage(none, OutStr, 'Console');
                            }
                        }
                    }
                }
            }
        }
        Response.Subst("LogURI", CurrentConsoleLogPage);
        Response.Subst("SayURI", CurrentConsoleSendPage);
        Outer.ShowPage(Response, CurrentConsolePage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryCurrentConsoleLog(WebRequest Request, WebResponse Response)
{
    local string LogSubst, LogStr;
    local int i;

    // End:0x1EA
    if(Outer.CanPerform("Xc"))
    {
        Response.Subst("Section", CurrentLinks[2]);
        Response.Subst("SubTitle", (Outer.Level.Game.GameReplicationInfo.GameName $ " in ") $ Outer.Level.Title);
        i = Outer.Spectator.LastMessage();
        LogStr = Outer.HtmlEncode(Outer.Spectator.NextMessage(i));
        J0xE9:

        // End:0x14D [Loop If]
        if(LogStr != "")
        {
            LogSubst = ((LogSubst $ "&gt; ") $ LogStr) $ "<br>";
            LogStr = Outer.HtmlEncode(Outer.Spectator.NextMessage(i));
            // [Loop Continue]
            goto J0xE9;
        }
        Response.Subst("RefreshMeta", (ConsoleRefreshTag $ CurrentConsoleLogPage) $ "#END\">");
        Response.Subst("LogText", LogSubst);
        Response.Subst("PageHelp", NoteConsolePage);
        Outer.MapTitle(Response);
        Outer.ShowPage(Response, CurrentConsoleLogPage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryCurrentConsoleSend(WebRequest Request, WebResponse Response)
{
    // End:0x77
    if(Outer.CanPerform("Xc"))
    {
        Response.Subst("DefaultSendText", DefaultSendText);
        Response.Subst("PostAction", CurrentConsolePage);
        Outer.ShowPage(Response, CurrentConsoleSendPage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryCurrentMutators(WebRequest Request, WebResponse Response)
{
    local int i, j, k, Z;
    local string selectedmutes, lastgroup, nextgroup, thisgroup, Checked, tmp;

    local StringArray GroupedMutators, SoloMutators;

    // End:0x9E0
    if(Outer.CanPerform("Mu"))
    {
        SoloMutators = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
        GroupedMutators = new (none) Class'XWebAdmin_Decompressed.StringArray';
        // End:0x1B2
        if(Request.GetVariable("SetMutes", "") != "")
        {
            Outer.AIncMutators.Reset();
            lastgroup = "";
            i = 0;
            J0x7D:

            // End:0x1B2 [Loop If]
            if(i < Outer.AExcMutators.Count())
            {
                j = int(Outer.AExcMutators.GetItem(i));
                // End:0xD2
                if(j < 0)
                {
                    // [Explicit Continue]
                    goto J0x1A8;
                }
                thisgroup = Outer.AllMutators[j].GroupName;
                // End:0x1A8
                if((Request.GetVariable(Outer.AExcMutators.GetTag(i), "") != "") || Request.GetVariable(thisgroup) == Outer.AllMutators[j].ClassName)
                {
                    Outer.AIncMutators.Add(Outer.AExcMutators.GetItem(i), Outer.AllMutators[j].FriendlyName);
                }
                J0x1A8:

                i++;
                // [Loop Continue]
                goto J0x7D;
            }
        }
        i = 0;
        J0x1B9:

        // End:0x247 [Loop If]
        if(i < Outer.AExcMutators.Count())
        {
            j = int(Outer.AExcMutators.GetItem(i));
            // End:0x20E
            if(j < 0)
            {
                // [Explicit Continue]
                goto J0x23D;
            }
            SoloMutators.Add(string(j), Outer.AllMutators[j].FriendlyName);
            J0x23D:

            i++;
            // [Loop Continue]
            goto J0x1B9;
        }
        selectedmutes = "";
        i = 0;
        J0x256:

        // End:0x3C5 [Loop If]
        if(i < Outer.AIncMutators.Count())
        {
            tmp = "";
            j = int(Outer.AIncMutators.GetItem(i));
            // End:0x2B3
            if(j < 0)
            {
                // [Explicit Continue]
                goto J0x3BB;
            }
            Response.Subst("Content", Outer.HtmlEncode(Outer.AllMutators[j].FriendlyName));
            tmp = Outer.WebInclude(Outer.CellLeft);
            Response.Subst("Content", Outer.HtmlEncode(Outer.AllMutators[j].Description));
            Response.Subst("RowContent", tmp $ Outer.WebInclude(Outer.CellLeft));
            selectedmutes $= Outer.WebInclude(Outer.RowLeft);
            J0x3BB:

            i++;
            // [Loop Continue]
            goto J0x256;
        }
        // End:0x442
        if(selectedmutes != "")
        {
            Response.Subst("TableTitle", SelectedMutators);
            Response.Subst("TableRows", selectedmutes);
            Response.Subst("SelectedTable", Outer.WebInclude(MutatorTablePage));
        }
        Outer.CreateFullMutatorList(SoloMutators, GroupedMutators);
        lastgroup = "";
        selectedmutes = "";
        i = 0;
        J0x472:

        // End:0x755 [Loop If]
        if(i < GroupedMutators.Count())
        {
            j = int(GroupedMutators.GetItem(i));
            // End:0x4B5
            if(j < 0)
            {
                // [Explicit Continue]
                goto J0x74B;
            }
            // End:0x4EC
            if(Outer.AllMutators[j].GroupName == "")
            {
                thisgroup = "Z" $ string(Z++);                
            }
            else
            {
                thisgroup = Outer.AllMutators[j].GroupName;
            }
            // End:0x532
            if((i + 1) == GroupedMutators.Count())
            {
                nextgroup = "";                
            }
            else
            {
                k = int(GroupedMutators.GetItem(i + 1));
                // End:0x55F
                if(k < 0)
                {
                    // [Explicit Continue]
                    goto J0x74B;
                }
                // End:0x594
                if(Outer.AllMutators[k].GroupName == "")
                {
                    nextgroup = "Z" $ string(Z);                    
                }
                else
                {
                    nextgroup = Outer.AllMutators[k].GroupName;
                }
            }
            Response.Subst("GroupName", thisgroup);
            Response.Subst("MutatorClass", Outer.AllMutators[j].ClassName);
            Response.Subst("MutatorName", Outer.AllMutators[j].FriendlyName);
            Response.Subst("MutatorDesc", Outer.AllMutators[j].Description);
            // End:0x6D0
            if((lastgroup != thisgroup) && thisgroup == nextgroup)
            {
                Response.Subst("Checked", "checked");
                selectedmutes $= Outer.WebInclude(MutatorGroupTitle);
            }
            Checked = Eval(Outer.AIncMutators.FindItemId(string(j)) >= 0, " checked", "");
            Response.Subst("Checked", Checked);
            selectedmutes $= Outer.WebInclude(MutatorGroupMember);
            lastgroup = thisgroup;
            J0x74B:

            i++;
            // [Loop Continue]
            goto J0x472;
        }
        i = 0;
        J0x75C:

        // End:0x8E3 [Loop If]
        if(i < SoloMutators.Count())
        {
            tmp = "";
            j = int(SoloMutators.GetItem(i));
            Response.Subst("Content", (Outer.Checkbox(Outer.AllMutators[j].ClassName, Outer.AIncMutators.FindItemId(string(j)) >= 0) $ "&nbsp;") $ Outer.AllMutators[j].FriendlyName);
            tmp = Outer.WebInclude(Outer.NowrapLeft);
            Response.Subst("Content", Outer.AllMutators[j].Description);
            Response.Subst("RowContent", tmp $ Outer.WebInclude(Outer.CellLeft));
            selectedmutes $= Outer.WebInclude(Outer.RowLeft);
            i++;
            // [Loop Continue]
            goto J0x75C;
        }
        Response.Subst("TableTitle", PickMutators);
        Response.Subst("TableRows", selectedmutes);
        Response.Subst("ChooseTable", Outer.WebInclude(MutatorTablePage));
        Outer.MapTitle(Response);
        Response.Subst("Section", CurrentLinks[3]);
        Response.Subst("PageHelp", NoteMutatorsPage);
        Response.Subst("PostAction", CurrentMutatorsPage);
        Outer.ShowPage(Response, CurrentMutatorsPage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryCurrentBots(WebRequest Request, WebResponse Response)
{
    local array<PlayerRecord> PlayerRecords;
    local string OutStr, botname, LeftTable, RightTable;
    local int i, j, BotCount, maxbots, cnt, Col1Count;

    local wBot B;
    local bool oldstate, NewState, bInMatch;
    local DeathMatch DM;

    // End:0x2E
    if(!Outer.CanPerform("Mb"))
    {
        Outer.AccessDenied(Response);
        return;
    }
    DM = DeathMatch(Outer.Level.Game);
    // End:0xAB
    if(DM == none)
    {
        Outer.ShowMessage(Response, BadGameType, Repl(GameTypeUnsupported, "%GameType%", string(Outer.Level.Game.Class)));
        return;
    }
    // End:0xF3
    if(DM.bEnableStatLogging && DM.NumBots == 0)
    {
        Outer.ShowMessage(Response, NoBotsTitle, NoBots);
        return;
    }
    // End:0x24E
    if(SpeciesNames == none)
    {
        Class'WGame.wUtil'.static.GetPlayerList(PlayerRecords);
        SpeciesNames = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
        i = 0;
        J0x125:

        // End:0x181 [Loop If]
        if(i < PlayerRecords.Length)
        {
            SpeciesNames.Add(PlayerRecords[i].Species.default.SpeciesName, PlayerRecords[i].Species.default.SpeciesName, true);
            i++;
            // [Loop Continue]
            goto J0x125;
        }
        BotList.Length = SpeciesNames.Count();
        i = 0;
        J0x19E:

        // End:0x24E [Loop If]
        if(i < PlayerRecords.Length)
        {
            j = SpeciesNames.FindTagId(PlayerRecords[i].Species.default.SpeciesName);
            // End:0x20F
            if((j >= 0) && BotList[j] == none)
            {
                BotList[j] = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
            }
            BotList[j].Add(PlayerRecords[i].DefaultName, PlayerRecords[i].DefaultName);
            i++;
            // [Loop Continue]
            goto J0x19E;
        }
    }
    bInMatch = Outer.Level.Game.IsInState('MatchInProgress');
    // End:0x526
    if(Request.GetVariable("addbotnum", "") != "")
    {
        BotCount = int(Request.GetVariable("addnum", "0"));
        // End:0x3FD
        if(Request.GetVariable("BotAction", "") ~= "Add")
        {
            maxbots = 32 - (DM.NumPlayers + DM.NumBots);
            BotCount = Clamp(BotCount, 0, maxbots);
            i = 0;
            J0x325:

            // End:0x34D [Loop If]
            if(i < BotCount)
            {
                DM.ForceAddBot();
                i++;
                // [Loop Continue]
                goto J0x325;
            }
            // End:0x38A
            if(BotCount == 0)
            {
                Outer.StatusError(Response, "0" @ Repl(BotStatus, "%Action%", added));                
            }
            else
            {
                // End:0x3C7
                if(BotCount == 1)
                {
                    Outer.StatusOk(Response, "1" @ Repl(SingleBotStatus, "%Action%", added));                    
                }
                else
                {
                    Outer.StatusOk(Response, string(BotCount) @ Repl(BotStatus, "%Action%", added));
                }
            }            
        }
        else
        {
            // End:0x523
            if(Request.GetVariable("BotAction", "") ~= "Remove")
            {
                BotCount = Clamp(BotCount, 0, DM.NumBots);
                DM.MinPlayers = (DM.NumPlayers + DM.NumBots) - BotCount;
                // End:0x4B3
                if(BotCount == 0)
                {
                    Outer.StatusError(Response, "0" @ Repl(BotStatus, "%Action%", Removed));                    
                }
                else
                {
                    // End:0x4F0
                    if(BotCount == 1)
                    {
                        Outer.StatusOk(Response, "1" @ Repl(SingleBotStatus, "%Action%", Removed));                        
                    }
                    else
                    {
                        Outer.StatusOk(Response, string(BotCount) @ Repl(BotStatus, "%Action%", Removed));
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x6F6
        if((Request.GetVariable("selectbots", "") != "") && bInMatch)
        {
            i = 0;
            J0x55C:

            // End:0x6F6 [Loop If]
            if(i < SpeciesNames.Count())
            {
                j = 0;
                J0x57C:

                // End:0x6EC [Loop If]
                if(j < BotList[i].Count())
                {
                    oldstate = Request.GetVariable((("BotX" $ string(i)) $ ".") $ string(j), "") != "";
                    NewState = Request.GetVariable((("Bot" $ string(i)) $ ".") $ string(j), "") != "";
                    botname = BotList[i].GetItem(j);
                    // End:0x6E2
                    if(oldstate != NewState)
                    {
                        // End:0x6A1
                        if(oldstate)
                        {
                            B = FindPlayingBot(botname);
                            // End:0x69E
                            if(B != none)
                            {
                                DM.MinPlayers = (DM.NumPlayers + DM.NumBots) - 1;
                                B.Destroy();
                            }
                            // [Explicit Continue]
                            goto J0x6E2;
                        }
                        DM.MinPlayers = DM.NumPlayers + DM.NumBots;
                        DM.AddNamedBot(botname);
                    }
                    J0x6E2:

                    j++;
                    // [Loop Continue]
                    goto J0x57C;
                }
                i++;
                // [Loop Continue]
                goto J0x55C;
            }
        }
    }
    // End:0xB10
    if(SpeciesNames != none)
    {
        BotCount = 0;
        i = 0;
        J0x70F:

        // End:0x74E [Loop If]
        if(i < SpeciesNames.Count())
        {
            BotCount += BotList[i].Count();
            i++;
            // [Loop Continue]
            goto J0x70F;
        }
        i = 0;
        J0x755:

        // End:0xB10 [Loop If]
        if(i < SpeciesNames.Count())
        {
            OutStr = "";
            Response.Subst("SpeciesName", SpeciesNames.GetItem(i));
            OutStr = Outer.WebInclude(CurrentBotsPage $ "_species");
            j = 0;
            J0x7D3:

            // End:0x9BC [Loop If]
            if(j < BotList[i].Count())
            {
                Response.Subst("BotChecked", "");
                Response.Subst("BotIndex", (string(i) $ ".") $ string(j));
                Response.Subst("BotName", BotList[i].GetItem(j));
                B = FindPlayingBot(BotList[i].GetItem(j));
                Response.Subst("DisabledBots", "");
                // End:0x8E7
                if(!bInMatch)
                {
                    Response.Subst("DisabledBots", " DISABLED");
                }
                // End:0x98D
                if(B != none)
                {
                    Response.Subst("BotColor", GetTeamColor(B.PlayerReplicationInfo.Team));
                    Response.Subst("BotTeamName", GetTeamName(B.PlayerReplicationInfo.Team));
                    OutStr $= Outer.WebInclude(CurrentBotsPage $ "_row_sel");
                    // [Explicit Continue]
                    goto J0x9B2;
                }
                OutStr $= Outer.WebInclude(CurrentBotsPage $ "_row");
                J0x9B2:

                j++;
                // [Loop Continue]
                goto J0x7D3;
            }
            Response.Subst("BotList", OutStr);
            // End:0xA57
            if((cnt + BotList[i].Count()) < (BotCount / 2))
            {
                Col1Count = cnt + BotList[i].Count();
                LeftTable $= Outer.WebInclude(CurrentBotsPage $ "_species_group");                
            }
            else
            {
                // End:0xABB
                if((cnt - Col1Count) > Col1Count)
                {
                    Col1Count += BotList[i].Count();
                    LeftTable $= Outer.WebInclude(CurrentBotsPage $ "_species_group");                    
                }
                else
                {
                    RightTable $= Outer.WebInclude(CurrentBotsPage $ "_species_group");
                }
            }
            cnt += BotList[i].Count();
            i++;
            // [Loop Continue]
            goto J0x755;
        }
    }
    Response.Subst("LeftBotTable", LeftTable);
    Response.Subst("RightBotTable", RightTable);
    Response.Subst("DisabledBots", "");
    // End:0xBA7
    if(!bInMatch)
    {
        Response.Subst("DisabledBots", " DISABLED");
    }
    Outer.MapTitle(Response);
    Response.Subst("PageHelp", NoteBotsPage);
    Response.Subst("Section", CurrentLinks[4]);
    Outer.ShowPage(Response, CurrentBotsPage);
    //return;    
}

function wBot FindPlayingBot(string botname)
{
    local Controller C;
    local wBot B;

    C = Outer.Level.ControllerList;
    J0x1D:

    // End:0x81 [Loop If]
    if(C != none)
    {
        B = wBot(C);
        // End:0x6A
        if(B != none)
        {
            // End:0x6A
            if(B.PlayerReplicationInfo.PlayerName == botname)
            {
                return B;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1D;
    }
    return none;
    //return;    
}

function string GetTeamColor(TeamInfo Team)
{
    // End:0x0E
    if(Team == none)
    {
        return "";
    }
    // End:0x41
    if(Team.TeamIndex < 4)
    {
        return Team.ColorNames[Team.TeamIndex];
    }
    return "#CCCCCC";
    //return;    
}

function string GetTeamName(TeamInfo Team)
{
    // End:0x0E
    if(Team == none)
    {
        return "";
    }
    return Team.GetHumanReadableName();
    //return;    
}

defaultproperties
{
    CurrentIndexPage="current_menu"
    CurrentPlayersPage="current_players"
    CurrentGamePage="current_game"
    CurrentConsolePage="current_console"
    CurrentConsoleLogPage="current_console_log"
    CurrentConsoleSendPage="current_console_send"
    CurrentMutatorsPage="current_mutators"
    CurrentBotsPage="current_bots"
    CurrentRestartPage="current_restart"
    DefaultSendText="say "
    StatTable="current_game_stat_table"
    StatTableRow="current_game_stat_table_row"
    PlayerListHeader="current_players_list_head"
    PlayerListLinkedHeader="current_players_list_head_link"
    PlayerListMinPlayers="current_players_minp"
    ConsoleRefreshTag="<meta http-equiv=\"refresh\" CONTENT=\"5; URL="
    MutatorTablePage="current_mutators_table"
    MutatorGroupTitle="current_mutators_group"
    MutatorGroupMember="current_mutators_group_row"
    BadGameType="???? ?? ?? ??"
    CurrentLinks[0]="? ??"
    CurrentLinks[1]="???? ???"
    CurrentLinks[2]="?? ??"
    CurrentLinks[3]="????"
    CurrentLinks[4]="??"
    CurrentLinks[5]="? ????"
    NoBotsTitle="?? ??"
    KickButtonText[0]="????"
    KickButtonText[1]="??"
    KickButtonText[2]="????/??"
    NoPlayersConnected="** ?????? ????? ????. **"
    SelectedMutators="??? ????"
    PickMutators="??? ????? ??????"
    GameTypeUnsupported="%GameType%? ?? ???? ????."
    NoBots="??? ?? ???? ????? ?? ???? ????."
    added="???."
    Removed="???."
    BotStatus="?? %Action%"
    SingleBotStatus="?? %Action%"
    ConsoleUserlist="???? ???? ??????? ???????? ???? ???? ????."
    NoteGamePage="?? ??? ?? ??? ?? ?? ?? ??? ??????."
    NotePlayersPage="??? ??? ???? ID? ???. ?? ????? ??? ????? ??? ? ????. ???? ?? ?? ??? ??? ? ????."
    NoteConsolePage="??? ??? ?????? ??? ?? ? ????. ?? ?? ???? ??? ?? ????."
    NoteMutatorsPage="?? ??? ??? ???? ??? ????? ??????"
    NoteBotsPage="?? ????? ??? ? ????."
    DefaultPage="currentframe"
    Title="Current"
    NeededPrivs="X|K|M|Xs|Xc|Xp|Xi|Kp|Kb|Ko|Mb|Mt|Mm|Mu|Ma"
}