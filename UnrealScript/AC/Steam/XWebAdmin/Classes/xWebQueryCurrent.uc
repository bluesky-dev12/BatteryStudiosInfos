/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\xWebQueryCurrent.uc
 * Package Imports:
 *	XWebAdmin
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:40
 *	Functions:13
 *
 *******************************************************************************/
class xWebQueryCurrent extends xWebQueryHandler within UTServerAdmin
    config();

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
    // End:0x1b
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
            // End:0x8e
            if(!Outer.MapIsChanging())
            {
                QueryCurrentPlayers(Request, Response);
            }
            return true;
        // End:0xbe
        case CurrentGamePage:
            // End:0xbc
            if(!Outer.MapIsChanging())
            {
                QueryCurrentGame(Request, Response);
            }
            return true;
        // End:0xec
        case CurrentConsolePage:
            // End:0xea
            if(!Outer.MapIsChanging())
            {
                QueryCurrentConsole(Request, Response);
            }
            return true;
        // End:0x11a
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
            // End:0x18e
            if(!Outer.MapIsChanging())
            {
                QueryCurrentBots(Request, Response);
            }
            return true;
        // End:0x1c7
        case CurrentRestartPage:
            // End:0x1c5
            if(!Outer.MapIsChanging())
            {
                Outer.QueryRestartPage(Request, Response);
            }
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function QueryCurrentFrame(WebRequest Request, WebResponse Response)
{
    local string Page;

    Page = Request.GetVariable("Page", CurrentGamePage);
    Response.Subst("IndexURI", CurrentIndexPage $ "?Page=" $ Page);
    Response.Subst("MainURI", Page);
    Outer.ShowFrame(Response, DefaultPage);
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
        // End:0x1ab
        case CurrentConsolePage:
            Response.Subst("ConsoleBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0x1df
        case CurrentMutatorsPage:
            Response.Subst("MutatorsBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0x212
        case CurrentRestartPage:
            Response.Subst("RestartBG", Outer.HighlightedBG);
            // End:0x215
            break;
        // End:0xffff
        default:
            Response.Subst("PlayersURI", DefaultPage $ "?Page=" $ CurrentPlayersPage);
            Response.Subst("GameURI", DefaultPage $ "?Page=" $ CurrentGamePage);
            Response.Subst("ConsoleURI", DefaultPage $ "?Page=" $ CurrentConsolePage);
            Response.Subst("MutatorsURI", DefaultPage $ "?Page=" $ CurrentMutatorsPage);
            Response.Subst("BotsURI", DefaultPage $ "?Page=" $ CurrentBotsPage);
            Response.Subst("RestartURI", DefaultPage $ "?Page=" $ CurrentRestartPage);
            Response.Subst("GameLink", CurrentLinks[0]);
            Response.Subst("PlayerLink", CurrentLinks[1]);
            Response.Subst("ConsoleLink", CurrentLinks[2]);
            Response.Subst("MutatorLink", CurrentLinks[3]);
            Response.Subst("BotsLink", CurrentLinks[4]);
            Response.Subst("RestartLink", CurrentLinks[5]);
            Outer.ShowPage(Response, CurrentIndexPage);
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
    ColorNames[0] = class'TeamInfo'.default.ColorNames[0];
    ColorNames[1] = class'TeamInfo'.default.ColorNames[1];
    mlength = int(Eval(Len(ColorNames[0]) > Len(ColorNames[1]), string(Len(ColorNames[0])), string(Len(ColorNames[1]))));
    // End:0x1521
    if(Outer.CanPerform("Xp|Kp|Kb|Ko"))
    {
        PlayerList = new (none) class'SortedStringArray';
        Sort = Request.GetVariable("Sort", "Name");
        Last = Request.GetVariable("Last");
        Response.Subst("Sort", Sort);
        Cols = 0;
        bCanKick = Outer.CanPerform("Kp");
        bCanBan = Outer.CanPerform("Kb");
        bCanKickBots = Outer.CanPerform("Ko|Mb");
        // End:0x1de
        if(Last == Sort && Request.GetVariable("ReverseSort") == "")
        {
            PlayerList.ToggleSort();
            Reverse = "?ReverseSort=True";
        }
        // End:0x1e6
        else
        {
            Reverse = "";
        }
        // End:0x845
        if(bCanKick || bCanBan || bCanKickBots)
        {
            P = Outer.Level.ControllerList;
            // End:0x404
            if(P != none)
            {
                NextP = P.nextController;
                // End:0x378
                if(PlayerController(P) != none && P.PlayerReplicationInfo != none && NetConnection(PlayerController(P).Player) != none)
                {
                    // End:0x2ff
                    if(bCanBan && Request.GetVariable("Ban" $ string(P.PlayerReplicationInfo.PlayerID)) != "")
                    {
                        Outer.Level.Game.AccessControl.KickBanPlayer(PlayerController(P));
                    }
                    // End:0x375
                    else
                    {
                        // End:0x375
                        if(bCanKick && Request.GetVariable("Kick" $ string(P.PlayerReplicationInfo.PlayerID)) != "")
                        {
                            Outer.Level.Game.AccessControl.KickPlayer(PlayerController(P));
                        }
                    }
                }
                // End:0x3ee
                else
                {
                    // End:0x3ee
                    if(PlayerController(P) == none && bCanKickBots && P.PlayerReplicationInfo != none && Request.GetVariable("Kick" $ string(P.PlayerReplicationInfo.PlayerID)) != "")
                    {
                        P.Destroy();
                    }
                }
                P = NextP;
                // End:0x22d
                if(P == none)
                	goto J0x22d;
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
            // End:0x4c9
            if(bCanKick || bCanKickBots)
            {
                Response.Subst("HeadTitle", "Kick");
                TableHeaders $= Outer.WebInclude(PlayerListHeader);
            }
            // End:0x50e
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
            // End:0x560
            else
            {
                Response.Subst("ReverseSort", "");
            }
            Response.Subst("HeadTitle", "Name");
            TableHeaders $= Outer.WebInclude(PlayerListLinkedHeader);
            // End:0x659
            if(Outer.Level.Game.GameReplicationInfo.bTeamGame)
            {
                // End:0x5fe
                if(Sort ~= "Team")
                {
                    Response.Subst("ReverseSort", Reverse);
                }
                // End:0x61c
                else
                {
                    Response.Subst("ReverseSort", "");
                }
                Response.Subst("HeadTitle", "Team");
                TableHeaders $= Outer.WebInclude(PlayerListLinkedHeader);
            }
            // End:0x68d
            if(Sort ~= "Ping")
            {
                Response.Subst("ReverseSort", Reverse);
            }
            // End:0x6ab
            else
            {
                Response.Subst("ReverseSort", "");
            }
            Response.Subst("HeadTitle", "Ping");
            TableHeaders $= Outer.WebInclude(PlayerListLinkedHeader);
            // End:0x71d
            if(Sort ~= "Score")
            {
                Response.Subst("ReverseSort", Reverse);
            }
            // End:0x73b
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
        // End:0xa73
        if(Outer.CanPerform("Ms"))
        {
            GameType = Outer.Level.GetItemName(Outer.SetGamePI(GameType));
            // End:0xa35
            if(Outer.GamePI != none && Outer.GamePI.Settings[Outer.GamePI.FindIndex(GameType $ ".MinPlayers")].SecLevel <= Outer.CurAdmin.MaxSecLevel())
            {
                // End:0x9be
                if(Request.GetVariable("SetMinPlayers", "") != "" && UnrealMPGameInfo(Outer.Level.Game) != none)
                {
                    UnrealMPGameInfo(Outer.Level.Game).MinPlayers = Min(Max(int(Request.GetVariable("MinPlayers", string(0))), 0), 32);
                    Outer.Level.Game.SaveConfig();
                }
                Response.Subst("MinPlayers", string(UnrealMPGameInfo(Outer.Level.Game).MinPlayers));
                Response.Subst("MinPlayerPart", Outer.WebInclude(PlayerListMinPlayers));
            }
            // End:0xa73
            else
            {
                Response.Subst("MinPlayers", "");
                Response.Subst("MinPlayersPart", "");
            }
        }
        P = Outer.Level.ControllerList;
        J0xa90:
        // End:0x133b [While If]
        if(P != none)
        {
            TempData = "";
            // End:0x1324
            if(!P.bDeleteMe && P.bIsPlayer && P.PlayerReplicationInfo != none)
            {
                Response.Subst("Content", Outer.Checkbox("Kick" $ string(P.PlayerReplicationInfo.PlayerID), false));
                // End:0xb66
                if(Outer.CanPerform("Kp"))
                {
                    TempData $= Outer.WebInclude(Outer.CellCenter);
                }
                // End:0xc17
                if(Outer.CanPerform("Kb"))
                {
                    // End:0xbd7
                    if(PlayerController(P) != none)
                    {
                        Response.Subst("Content", Outer.Checkbox("Ban" $ string(P.PlayerReplicationInfo.PlayerID), false));
                    }
                    // End:0xbf1
                    else
                    {
                        Response.Subst("Content", "");
                    }
                    TempData $= Outer.WebInclude(Outer.CellCenter);
                }
                TempStr = "";
                // End:0xc9d
                if(DeathMatch(Outer.Level.Game) != none && DeathMatch(Outer.Level.Game).bTournament && P.PlayerReplicationInfo.bReadyToPlay)
                {
                    TempStr = " (Ready) ";
                }
                // End:0xcef
                else
                {
                    // End:0xcd0
                    if(P.PlayerReplicationInfo.bIsSpectator)
                    {
                        TempStr = " (Spectator) ";
                    }
                    // End:0xcef
                    else
                    {
                        // End:0xcef
                        if(PlayerController(P) == none)
                        {
                            TempStr = " (Bot) ";
                        }
                    }
                }
                // End:0xda4
                if(PlayerController(P) != none)
                {
                    IP = PlayerController(P).GetPlayerNetworkAddress();
                    IP = Outer.HtmlEncode(" " $ Left(IP, InStr(IP, ":")));
                    id = Outer.HtmlEncode(" " $ Eval(Outer.Level.Game.AccessControl.bBanByID, PlayerController(P).GetPlayerIDHash(), " "));
                }
                // End:0xdd6
                else
                {
                    IP = Outer.HtmlEncode("  ");
                    id = Outer.HtmlEncode("  ");
                }
                Response.Subst("Content", Outer.HtmlEncode(P.PlayerReplicationInfo.PlayerName $ TempStr));
                TempData $= Outer.WebInclude(Outer.NowrapLeft);
                // End:0xfdc
                if(Outer.Level.Game.bTeamGame)
                {
                    // End:0xf70
                    if(P.PlayerReplicationInfo.Team != none && P.PlayerReplicationInfo.Team.TeamIndex < 4)
                    {
                        Response.Subst("Content", "<span style='background-color: " $ class'TeamInfo'.default.ColorNames[P.PlayerReplicationInfo.Team.TeamIndex] $ "'>" $ Outer.HtmlEncode("  ") $ "</span>" $ Outer.HtmlEncode(P.PlayerReplicationInfo.Team.GetHumanReadableName()));
                    }
                    // End:0xfb6
                    else
                    {
                        // End:0xfb6
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
                        // End:0x12d3
                        break;
                    // End:0x1267
                    case "Team":
                        TempTag = PadRight(class'TeamInfo'.default.ColorNames[P.PlayerReplicationInfo.Team.TeamIndex], mlength, "0");
                        switch(Last)
                        {
                            // End:0x11f2
                            case "Name":
                                TempTag $= P.PlayerReplicationInfo.PlayerName;
                                // End:0x1264
                                break;
                            // End:0x122f
                            case "Ping":
                                TempTag $= PadLeft(string(P.PlayerReplicationInfo.Ping * 4), 5, "0");
                                // End:0x1264
                                break;
                            // End:0xffff
                            default:
                                TempTag $= PadLeft(string(int(P.PlayerReplicationInfo.Score)), 4, "0");
                                // End:0x1264 Break;
                                break;
                        }
                        // End:0x12d3
                        break;
                    // End:0x12a1
                    case "Ping":
                        TempTag = PadLeft(string(P.PlayerReplicationInfo.Ping * 4), 5, "0");
                        // End:0x12d3
                        break;
                    // End:0xffff
                    default:
                        TempTag = PadLeft(string(int(P.PlayerReplicationInfo.Score)), 4, "0");
                        // End:0x12d3 Break;
                        break;
                }
                Response.Subst("RowContent", TempData);
                PlayerList.Add(Outer.WebInclude(Outer.RowLeft), TempTag);
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0xa90;
        }
        PlayerListSubst = "";
        // End:0x13d7
        if(PlayerList.Count() > 0)
        {
            i = 0;
            J0x135f:
            // End:0x13d4 [While If]
            if(i < PlayerList.Count())
            {
                // End:0x13ad
                if(Sort ~= "Score")
                {
                    PlayerListSubst = PlayerList.GetItem(i) $ PlayerListSubst;
                }
                // End:0x13ca
                else
                {
                    PlayerListSubst $= PlayerList.GetItem(i);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x135f;
            }
        }
        // End:0x1471
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
    // End:0x1535
    else
    {
        Outer.AccessDenied(Response);
    }
}

function QueryCurrentGame(WebRequest Request, WebResponse Response)
{
    local StringArray ExcludeMaps, IncludeMaps, MovedMaps;
    local class<GameInfo> GameClass;
    local string NewGameType, SwitchButtonName, GameState, NewMap;
    local bool bMakeChanges;
    local Controller C;
    local wPlayer xp;
    local TeamPlayerReplicationInfo PRI;
    local int i, MultiKills, Sprees, GameIndex;

    // End:0x9bd
    if(Outer.CanPerform("Mt|Mm"))
    {
        // End:0xcb
        if(Request.GetVariable("SwitchGameTypeAndMap", "") != "")
        {
            // End:0xb2
            if(Outer.CanPerform("Mt"))
            {
                Outer.ServerChangeMap(Request, Response, Request.GetVariable("MapSelect"), Request.GetVariable("GameTypeSelect"));
            }
            // End:0xc6
            else
            {
                Outer.AccessDenied(Response);
            }
            return;
        }
        // End:0x1ec
        else
        {
            // End:0x1ec
            if(Request.GetVariable("SwitchMap", "") != "")
            {
                // End:0x1d6
                if(Outer.CanPerform("Mm|Mt"))
                {
                    NewMap = Request.GetVariable("MapSelect");
                    Outer.Level.ServerTravel(NewMap $ "?game=" $ string(Outer.Level.Game.Class) $ "?mutator=" $ Outer.UsedMutators(), false);
                    Outer.ShowMessage(Response, Outer.WaitTitle, Repl(Outer.MapChangingTo, "%MapName%", NewMap));
                }
                // End:0x1ea
                else
                {
                    Outer.AccessDenied(Response);
                }
                return;
            }
        }
        bMakeChanges = Request.GetVariable("ApplySettings", "") != "";
        // End:0x2a5
        if(Outer.CanPerform("Mt") && bMakeChanges || Request.GetVariable("SwitchGameType", "") != "")
        {
            NewGameType = Request.GetVariable("GameTypeSelect");
            GameClass = class<GameInfo>(DynamicLoadObject(NewGameType, class'Class'));
        }
        // End:0x2ac
        else
        {
            GameClass = none;
        }
        // End:0x2ea
        if(GameClass == none)
        {
            GameClass = Outer.Level.Game.Class;
            NewGameType = string(GameClass);
        }
        GameIndex = Outer.Level.Game.MaplistHandler.GetGameIndex(NewGameType);
        ExcludeMaps = Outer.ReloadExcludeMaps(NewGameType);
        IncludeMaps = Outer.ReloadIncludeMaps(ExcludeMaps, GameIndex, Outer.Level.Game.MaplistHandler.GetActiveList(GameIndex));
        GameState = "";
        // End:0x69b
        if(Outer.CanPerform("Ma"))
        {
            // End:0x60f
            if(Outer.Level.Game.NumPlayers > 0)
            {
                C = Outer.Level.ControllerList;
                J0x3e8:
                // End:0x60c [While If]
                if(C != none)
                {
                    MultiKills = 0;
                    Sprees = 0;
                    PRI = none;
                    xp = wPlayer(C);
                    // End:0x5f5
                    if(xp != none && !xp.bDeleteMe)
                    {
                        // End:0x46b
                        if(TeamPlayerReplicationInfo(xp.PlayerReplicationInfo) != none)
                        {
                            PRI = TeamPlayerReplicationInfo(xp.PlayerReplicationInfo);
                        }
                        // End:0x5f5
                        if(PRI != none)
                        {
                            Response.Subst("PlayerName", Outer.HtmlEncode(PRI.PlayerName));
                            Response.Subst("Kills", string(PRI.Kills));
                            Response.Subst("Deaths", string(PRI.Deaths));
                            Response.Subst("Suicides", string(PRI.Suicides));
                            i = 0;
                            J0x52b:
                            // End:0x55e [While If]
                            if(i < 7)
                            {
                                MultiKills += PRI.MultiKills[i];
                                ++ i;
                                // This is an implied JumpToken; Continue!
                                goto J0x52b;
                            }
                            Response.Subst("MultiKills", string(MultiKills));
                            i = 0;
                            J0x587:
                            // End:0x5ba [While If]
                            if(i < 6)
                            {
                                Sprees += PRI.Spree[i];
                                ++ i;
                                // This is an implied JumpToken; Continue!
                                goto J0x587;
                            }
                            Response.Subst("Sprees", string(Sprees));
                            GameState $= Outer.WebInclude(StatTableRow);
                        }
                    }
                    C = C.nextController;
                    // This is an implied JumpToken; Continue!
                    goto J0x3e8;
                }
            }
            // End:0x64f
            else
            {
                GameState = "<tr><td colspan=\\"6\\" align=\\"center\\">" @ NoPlayersConnected @ "</td></tr>";
            }
            Response.Subst("StatRows", GameState);
            Response.Subst("GameState", Outer.WebInclude(StatTable));
        }
        // End:0x732
        if(GameClass == Outer.Level.Game.Class)
        {
            SwitchButtonName = "SwitchMap";
            MovedMaps = new (none) class'SortedStringArray';
            MovedMaps.CopyFromId(IncludeMaps, IncludeMaps.FindTagId(Left(string(Outer.Level), InStr(string(Outer.Level), "."))));
        }
        // End:0x74e
        else
        {
            SwitchButtonName = "SwitchGameTypeAndMap";
        }
        // End:0x7fe
        if(Outer.CanPerform("Mt"))
        {
            Response.Subst("Content", Outer.Select("GameTypeSelect", Outer.GenerateGameTypeOptions(NewGameType)));
            Response.Subst("GameTypeButton", Outer.SubmitButton("SwitchGameType", Outer.SwitchText));
        }
        // End:0x836
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
    // End:0x9d1
    else
    {
        Outer.AccessDenied(Response);
    }
}

function QueryCurrentConsole(WebRequest Request, WebResponse Response)
{
    local string SendStr, OutStr;

    // End:0x392
    if(Outer.CanPerform("Xc"))
    {
        SendStr = Request.GetVariable("SendText", "");
        // End:0x33e
        if(SendStr != "" && !Left(SendStr, 6) ~= "debug " || SendStr ~= "debug")
        {
            // End:0xc4
            if(Left(SendStr, 4) ~= "say ")
            {
                Outer.Level.Game.Broadcast(Outer.Spectator, Mid(SendStr, 4), 'Say');
            }
            // End:0x33e
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
                    // End:0x13d
                    else
                    {
                        Outer.Level.Pauser = none;
                    }
                }
                // End:0x33e
                else
                {
                    // End:0x16b
                    if(SendStr ~= "dump")
                    {
                        Outer.Spectator.Dump();
                    }
                    // End:0x33e
                    else
                    {
                        // End:0x2ec
                        if(Left(SendStr, 4) ~= "get " || Left(SendStr, 4) ~= "set " && InStr(Caps(SendStr), "XADMINCONFIG") != -1 || !Outer.CanPerform("Ms"))
                        {
                            // End:0x2bd
                            if(InStr(Caps(SendStr), "XADMINCONFIG") != -1)
                            {
                                Outer.StatusError(Response, ConsoleUserlist);
                                Outer.ShowMessage(Response, Outer.Error, "");
                                Log("User attempted to modify or enumerate admin account information illegally using the webadmin console.  User:" $ Request.UserName $ ".", 'WebAdmin');
                            }
                            // End:0x2e9
                            else
                            {
                                // End:0x2e9
                                if(!Outer.CanPerform("Ms"))
                                {
                                    Outer.AccessDenied(Response);
                                }
                            }
                        }
                        // End:0x33e
                        else
                        {
                            OutStr = Outer.Level.ConsoleCommand(SendStr);
                            // End:0x33e
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
    // End:0x3a6
    else
    {
        Outer.AccessDenied(Response);
    }
}

function QueryCurrentConsoleLog(WebRequest Request, WebResponse Response)
{
    local string LogSubst, LogStr;
    local int i;

    // End:0x1ea
    if(Outer.CanPerform("Xc"))
    {
        Response.Subst("Section", CurrentLinks[2]);
        Response.Subst("SubTitle", Outer.Level.Game.GameReplicationInfo.GameName $ " in " $ Outer.Level.Title);
        i = Outer.Spectator.LastMessage();
        LogStr = Outer.HtmlEncode(Outer.Spectator.NextMessage(i));
        J0xe9:
        // End:0x14d [While If]
        if(LogStr != "")
        {
            LogSubst = LogSubst $ "&gt; " $ LogStr $ "<br>";
            LogStr = Outer.HtmlEncode(Outer.Spectator.NextMessage(i));
            // This is an implied JumpToken; Continue!
            goto J0xe9;
        }
        Response.Subst("RefreshMeta", ConsoleRefreshTag $ CurrentConsoleLogPage $ "#END\\">");
        Response.Subst("LogText", LogSubst);
        Response.Subst("PageHelp", NoteConsolePage);
        Outer.MapTitle(Response);
        Outer.ShowPage(Response, CurrentConsoleLogPage);
    }
    // End:0x1fe
    else
    {
        Outer.AccessDenied(Response);
    }
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
    // End:0x8b
    else
    {
        Outer.AccessDenied(Response);
    }
}

function QueryCurrentMutators(WebRequest Request, WebResponse Response)
{
    local int i, j, k, Z;
    local string selectedmutes, lastgroup, nextgroup, thisgroup, Checked, tmp;

    local StringArray GroupedMutators, SoloMutators;

    // End:0x9e0
    if(Outer.CanPerform("Mu"))
    {
        SoloMutators = new (none) class'SortedStringArray';
        GroupedMutators = new (none) class'StringArray';
        // End:0x1b2
        if(Request.GetVariable("SetMutes", "") != "")
        {
            Outer.AIncMutators.Reset();
            lastgroup = "";
            i = 0;
            J0x7d:
            // End:0x1b2 [While If]
            if(i < Outer.AExcMutators.Count())
            {
                j = int(Outer.AExcMutators.GetItem(i));
                // End:0xd2
                if(j < 0)
                {
                }
                // End:0x1a8
                else
                {
                    thisgroup = Outer.AllMutators[j].GroupName;
                    // End:0x1a8
                    if(Request.GetVariable(Outer.AExcMutators.GetTag(i), "") != "" || Request.GetVariable(thisgroup) == Outer.AllMutators[j].ClassName)
                    {
                        Outer.AIncMutators.Add(Outer.AExcMutators.GetItem(i), Outer.AllMutators[j].FriendlyName);
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x7d;
            }
        }
        i = 0;
        J0x1b9:
        // End:0x247 [While If]
        if(i < Outer.AExcMutators.Count())
        {
            j = int(Outer.AExcMutators.GetItem(i));
            // End:0x20e
            if(j < 0)
            {
            }
            // End:0x23d
            else
            {
                SoloMutators.Add(string(j), Outer.AllMutators[j].FriendlyName);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1b9;
        }
        selectedmutes = "";
        i = 0;
        J0x256:
        // End:0x3c5 [While If]
        if(i < Outer.AIncMutators.Count())
        {
            tmp = "";
            j = int(Outer.AIncMutators.GetItem(i));
            // End:0x2b3
            if(j < 0)
            {
            }
            // End:0x3bb
            else
            {
                Response.Subst("Content", Outer.HtmlEncode(Outer.AllMutators[j].FriendlyName));
                tmp = Outer.WebInclude(Outer.CellLeft);
                Response.Subst("Content", Outer.HtmlEncode(Outer.AllMutators[j].Description));
                Response.Subst("RowContent", tmp $ Outer.WebInclude(Outer.CellLeft));
                selectedmutes $= Outer.WebInclude(Outer.RowLeft);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
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
        // End:0x755 [While If]
        if(i < GroupedMutators.Count())
        {
            j = int(GroupedMutators.GetItem(i));
            // End:0x4b5
            if(j < 0)
            {
            }
            // End:0x74b
            else
            {
                // End:0x4ec
                if(Outer.AllMutators[j].GroupName == "")
                {
                    thisgroup = "Z" $ string(++ Z);
                }
                // End:0x50b
                else
                {
                    thisgroup = Outer.AllMutators[j].GroupName;
                }
                // End:0x532
                if(i + 1 == GroupedMutators.Count())
                {
                    nextgroup = "";
                }
                // End:0x5b3
                else
                {
                    k = int(GroupedMutators.GetItem(i + 1));
                    // End:0x55f
                    if(k < 0)
                    {
                    }
                    // End:0x74b
                    else
                    {
                        // End:0x594
                        if(Outer.AllMutators[k].GroupName == "")
                        {
                            nextgroup = "Z" $ string(Z);
                        }
                        // End:0x5b3
                        else
                        {
                            nextgroup = Outer.AllMutators[k].GroupName;
                        }
                    }
                    Response.Subst("GroupName", thisgroup);
                    Response.Subst("MutatorClass", Outer.AllMutators[j].ClassName);
                    Response.Subst("MutatorName", Outer.AllMutators[j].FriendlyName);
                    Response.Subst("MutatorDesc", Outer.AllMutators[j].Description);
                    // End:0x6d0
                    if(lastgroup != thisgroup && thisgroup == nextgroup)
                    {
                        Response.Subst("Checked", "checked");
                        selectedmutes $= Outer.WebInclude(MutatorGroupTitle);
                    }
                    Checked = Eval(Outer.AIncMutators.FindItemId(string(j)) >= 0, " checked", "");
                    Response.Subst("Checked", Checked);
                    selectedmutes $= Outer.WebInclude(MutatorGroupMember);
                    lastgroup = thisgroup;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x472;
        }
        i = 0;
        J0x75c:
        // End:0x8e3 [While If]
        if(i < SoloMutators.Count())
        {
            tmp = "";
            j = int(SoloMutators.GetItem(i));
            Response.Subst("Content", Outer.Checkbox(Outer.AllMutators[j].ClassName, Outer.AIncMutators.FindItemId(string(j)) >= 0) $ "&nbsp;" $ Outer.AllMutators[j].FriendlyName);
            tmp = Outer.WebInclude(Outer.NowrapLeft);
            Response.Subst("Content", Outer.AllMutators[j].Description);
            Response.Subst("RowContent", tmp $ Outer.WebInclude(Outer.CellLeft));
            selectedmutes $= Outer.WebInclude(Outer.RowLeft);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x75c;
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
    // End:0x9f4
    else
    {
        Outer.AccessDenied(Response);
    }
}

function QueryCurrentBots(WebRequest Request, WebResponse Response)
{
    local array<PlayerRecord> PlayerRecords;
    local string OutStr, botname, LeftTable, RightTable;
    local int i, j, BotCount, maxbots, cnt, Col1Count;

    local wBot B;
    local bool oldstate, NewState, bInMatch;
    local DeathMatch DM;

    // End:0x2e
    if(!Outer.CanPerform("Mb"))
    {
        Outer.AccessDenied(Response);
        return;
    }
    DM = DeathMatch(Outer.Level.Game);
    // End:0xab
    if(DM == none)
    {
        Outer.ShowMessage(Response, BadGameType, Repl(GameTypeUnsupported, "%GameType%", string(Outer.Level.Game.Class)));
        return;
    }
    // End:0xf3
    if(DM.bEnableStatLogging && DM.NumBots == 0)
    {
        Outer.ShowMessage(Response, NoBotsTitle, NoBots);
        return;
    }
    // End:0x24e
    if(SpeciesNames == none)
    {
        class'wUtil'.static.GetPlayerList(PlayerRecords);
        SpeciesNames = new (none) class'SortedStringArray';
        i = 0;
        J0x125:
        // End:0x181 [While If]
        if(i < PlayerRecords.Length)
        {
            SpeciesNames.Add(PlayerRecords[i].Species.default.SpeciesName, PlayerRecords[i].Species.default.SpeciesName, true);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x125;
        }
        BotList.Length = SpeciesNames.Count();
        i = 0;
        J0x19e:
        // End:0x24e [While If]
        if(i < PlayerRecords.Length)
        {
            j = SpeciesNames.FindTagId(PlayerRecords[i].Species.default.SpeciesName);
            // End:0x20f
            if(j >= 0 && BotList[j] == none)
            {
                BotList[j] = new (none) class'SortedStringArray';
            }
            BotList[j].Add(PlayerRecords[i].DefaultName, PlayerRecords[i].DefaultName);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x19e;
        }
    }
    bInMatch = Outer.Level.Game.IsInState('MatchInProgress');
    // End:0x526
    if(Request.GetVariable("addbotnum", "") != "")
    {
        BotCount = int(Request.GetVariable("addnum", "0"));
        // End:0x3fd
        if(Request.GetVariable("BotAction", "") ~= "Add")
        {
            maxbots = 32 - DM.NumPlayers + DM.NumBots;
            BotCount = Clamp(BotCount, 0, maxbots);
            i = 0;
            J0x325:
            // End:0x34d [While If]
            if(i < BotCount)
            {
                DM.ForceAddBot();
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x325;
            }
            // End:0x38a
            if(BotCount == 0)
            {
                Outer.StatusError(Response, "0" @ Repl(BotStatus, "%Action%", added));
            }
            // End:0x3fa
            else
            {
                // End:0x3c7
                if(BotCount == 1)
                {
                    Outer.StatusOk(Response, "1" @ Repl(SingleBotStatus, "%Action%", added));
                }
                // End:0x3fa
                else
                {
                    Outer.StatusOk(Response, string(BotCount) @ Repl(BotStatus, "%Action%", added));
                }
            }
        }
        // End:0x523
        else
        {
            // End:0x523
            if(Request.GetVariable("BotAction", "") ~= "Remove")
            {
                BotCount = Clamp(BotCount, 0, DM.NumBots);
                DM.MinPlayers = DM.NumPlayers + DM.NumBots - BotCount;
                // End:0x4b3
                if(BotCount == 0)
                {
                    Outer.StatusError(Response, "0" @ Repl(BotStatus, "%Action%", Removed));
                }
                // End:0x523
                else
                {
                    // End:0x4f0
                    if(BotCount == 1)
                    {
                        Outer.StatusOk(Response, "1" @ Repl(SingleBotStatus, "%Action%", Removed));
                    }
                    // End:0x523
                    else
                    {
                        Outer.StatusOk(Response, string(BotCount) @ Repl(BotStatus, "%Action%", Removed));
                    }
                }
            }
        }
    }
    // End:0x6f6
    else
    {
        // End:0x6f6
        if(Request.GetVariable("selectbots", "") != "" && bInMatch)
        {
            i = 0;
            J0x55c:
            // End:0x6f6 [While If]
            if(i < SpeciesNames.Count())
            {
                j = 0;
                J0x57c:
                // End:0x6ec [While If]
                if(j < BotList[i].Count())
                {
                    oldstate = Request.GetVariable("BotX" $ string(i) $ "." $ string(j), "") != "";
                    NewState = Request.GetVariable("Bot" $ string(i) $ "." $ string(j), "") != "";
                    botname = BotList[i].GetItem(j);
                    // End:0x6e2
                    if(oldstate != NewState)
                    {
                        // End:0x6a1
                        if(oldstate)
                        {
                            B = FindPlayingBot(botname);
                            // End:0x69e
                            if(B != none)
                            {
                                DM.MinPlayers = DM.NumPlayers + DM.NumBots - 1;
                                B.Destroy();
                            }
                        }
                        // End:0x6e2
                        else
                        {
                            DM.MinPlayers = DM.NumPlayers + DM.NumBots;
                            DM.AddNamedBot(botname);
                        }
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x57c;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x55c;
            }
        }
    }
    // End:0xb10
    if(SpeciesNames != none)
    {
        BotCount = 0;
        i = 0;
        J0x70f:
        // End:0x74e [While If]
        if(i < SpeciesNames.Count())
        {
            BotCount += BotList[i].Count();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x70f;
        }
        i = 0;
        J0x755:
        // End:0xb10 [While If]
        if(i < SpeciesNames.Count())
        {
            OutStr = "";
            Response.Subst("SpeciesName", SpeciesNames.GetItem(i));
            OutStr = Outer.WebInclude(CurrentBotsPage $ "_species");
            j = 0;
            J0x7d3:
            // End:0x9bc [While If]
            if(j < BotList[i].Count())
            {
                Response.Subst("BotChecked", "");
                Response.Subst("BotIndex", string(i) $ "." $ string(j));
                Response.Subst("BotName", BotList[i].GetItem(j));
                B = FindPlayingBot(BotList[i].GetItem(j));
                Response.Subst("DisabledBots", "");
                // End:0x8e7
                if(!bInMatch)
                {
                    Response.Subst("DisabledBots", " DISABLED");
                }
                // End:0x98d
                if(B != none)
                {
                    Response.Subst("BotColor", GetTeamColor(B.PlayerReplicationInfo.Team));
                    Response.Subst("BotTeamName", GetTeamName(B.PlayerReplicationInfo.Team));
                    OutStr $= Outer.WebInclude(CurrentBotsPage $ "_row_sel");
                }
                // End:0x9b2
                else
                {
                    OutStr $= Outer.WebInclude(CurrentBotsPage $ "_row");
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x7d3;
            }
            Response.Subst("BotList", OutStr);
            // End:0xa57
            if(cnt + BotList[i].Count() < BotCount / 2)
            {
                Col1Count = cnt + BotList[i].Count();
                LeftTable $= Outer.WebInclude(CurrentBotsPage $ "_species_group");
            }
            // End:0xaea
            else
            {
                // End:0xabb
                if(cnt - Col1Count > Col1Count)
                {
                    Col1Count += BotList[i].Count();
                    LeftTable $= Outer.WebInclude(CurrentBotsPage $ "_species_group");
                }
                // End:0xaea
                else
                {
                    RightTable $= Outer.WebInclude(CurrentBotsPage $ "_species_group");
                }
            }
            cnt += BotList[i].Count();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x755;
        }
    }
    Response.Subst("LeftBotTable", LeftTable);
    Response.Subst("RightBotTable", RightTable);
    Response.Subst("DisabledBots", "");
    // End:0xba7
    if(!bInMatch)
    {
        Response.Subst("DisabledBots", " DISABLED");
    }
    Outer.MapTitle(Response);
    Response.Subst("PageHelp", NoteBotsPage);
    Response.Subst("Section", CurrentLinks[4]);
    Outer.ShowPage(Response, CurrentBotsPage);
}

function wBot FindPlayingBot(string botname)
{
    local Controller C;
    local wBot B;

    C = Outer.Level.ControllerList;
    J0x1d:
    // End:0x81 [While If]
    if(C != none)
    {
        B = wBot(C);
        // End:0x6a
        if(B != none)
        {
            // End:0x6a
            if(B.PlayerReplicationInfo.PlayerName == botname)
            {
                return B;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    return none;
}

function string GetTeamColor(TeamInfo Team)
{
    // End:0x0e
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
}

function string GetTeamName(TeamInfo Team)
{
    // End:0x0e
    if(Team == none)
    {
        return "";
    }
    return Team.GetHumanReadableName();
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
    ConsoleRefreshTag="<meta http-equiv="refresh" CONTENT="5; URL="
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