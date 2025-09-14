/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\xVotingHandler.uc
 * Package Imports:
 *	xVoting
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:3
 *	Properties:54
 *	Functions:43
 *
 *******************************************************************************/
class xVotingHandler extends VotingHandler
    dependson(DefaultMapListLoader)
    dependson(MapVoteHistory)
    dependson(MapListLoader)
    dependson(MatchConfig)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MAPVOTEALLOWED = True;
const KICKVOTEALLOWED = True;
const MATCHSETUPALLOWED = False;

var array<VotingReplicationInfo> MVRI;
var int MapCount;
var bool bLevelSwitchPending;
var bool bMidGameVote;
var int TimeLeft;
var int ScoreBoardTime;
var int ServerTravelTime;
var array<MapVoteScore> MapVoteCount;
var array<KickVoteScore> KickVoteCount;
var class<MapVoteHistory> MapVoteHistoryClass;
var array<MapVoteMapList> MapList;
var MapVoteHistory History;
var string TextMessage;
var string ServerTravelString;
var bool bAutoDetectMode;
var() array<MapVoteGameConfig> GameConfig;
var() int VoteTimeLimit;
var() int ScoreBoardDelay;
var() bool bAutoOpen;
var() int MidGameVotePercent;
var() bool bScoreMode;
var() bool bAccumulationMode;
var() bool bEliminationMode;
var() int MinMapCount;
var() string MapVoteHistoryType;
var() int RepeatLimit;
var() int DefaultGameConfig;
var() bool bDefaultToCurrentGameType;
var() bool bMapVote;
var() bool bKickVote;
var() bool bMatchSetup;
var() int KickPercent;
var() bool bAnonymousKicking;
var() string MapListLoaderType;
var() array<AccumulationData> AccInfo;
var() int ServerNumber;
var() int CurrentGameConfig;
var MatchConfig MatchProfile;
var string GameConfigPage;
var string MapListConfigPage;
var localized string lmsgInvalidPassword;
var localized string lmsgMatchSetupPermission;
var localized string lmsgKickVote;
var localized string lmsgAnonymousKickVote;
var localized string lmsgKickVoteAdmin;
var localized string lmsgMapWon;
var localized string lmsgMidGameVote;
var localized string lmsgSpectatorsCantVote;
var localized string lmsgMapVotedFor;
var localized string lmsgMapVotedForWithCount;
var localized string PropsDisplayText[17];
var localized string PropDescription[17];
var localized string lmsgAdminMapChange;
var localized string lmsgGameConfigColumnTitle[6];

static function bool IsEnabled()
{
    return default.bMapVote || default.bKickVote || default.bMatchSetup;
}

function PostBeginPlay()
{
    local int i;

    super(Actor).PostBeginPlay();
    // End:0x21
    if(Level.NetMode == 0)
    {
        return;
    }
    // End:0x43
    if(Level.IsDemoBuild())
    {
        bMapVote = false;
        bKickVote = false;
    }
    bMatchSetup = bMatchSetup && false;
    // End:0x7e
    if(bKickVote)
    {
        Log("Kick Voting Enabled", 'MapVote');
    }
    // End:0x9b
    else
    {
        Log("Kick Voting Disabled", 'MapVote');
    }
    // End:0x172
    if(bMapVote)
    {
        Log("Map Voting Enabled", 'MapVote');
        // End:0x162
        if(GameConfig.Length > 0)
        {
            // End:0x15f
            if(!string(Level.Game.Class) ~= GameConfig[CurrentGameConfig].GameClass)
            {
                CurrentGameConfig = 0;
                i = 0;
                J0x109:
                // End:0x15f [While If]
                if(i < GameConfig.Length)
                {
                    // End:0x155
                    if(GameConfig[i].GameClass ~= string(Level.Game.Class))
                    {
                        CurrentGameConfig = i;
                    }
                    // End:0x15f
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x109;
                    }
                }
            }
        }
        // End:0x169
        else
        {
            CurrentGameConfig = 0;
        }
        LoadMapList();
    }
    // End:0x18e
    else
    {
        Log("Map Voting Disabled", 'MapVote');
    }
    // End:0x1e4
    if(bMatchSetup)
    {
        Log("MatchSetup Enabled", 'MapVote');
        MatchProfile = CreateMatchProfile();
        MatchProfile.Init(Level);
        MatchProfile.LoadCurrentSettings();
    }
    // End:0x200
    else
    {
        Log("MatchSetup Disabled", 'MapVote');
    }
}

function PlayerJoin(PlayerController Player)
{
    // End:0x1b
    if(Level.NetMode == 0)
    {
        return;
    }
    // End:0x33
    if(!Player.IsA('wPlayer'))
    {
        return;
    }
    // End:0xad
    if(bMapVote || bKickVote || bMatchSetup)
    {
        Log("___New Player Joined - " $ Player.PlayerReplicationInfo.PlayerName $ ", " $ Player.GetPlayerNetworkAddress(), 'MapVote');
        AddMapVoteReplicationInfo(Player);
    }
}

function PlayerExit(Controller Exiting)
{
    local int i, X, ExitingPlayerIndex;

    // End:0x1b
    if(Level.NetMode == 0)
    {
        return;
    }
    ExitingPlayerIndex = -1;
    Log("____PlayerExit", 'MapVoteDebug');
    // End:0x3bf
    if(bMapVote || bKickVote || bMatchSetup)
    {
        i = 0;
        J0x63:
        // End:0x3bf [While If]
        if(i < MVRI.Length)
        {
            // End:0x2a6
            if(MVRI[i] != none && MVRI[i].PlayerOwner == none || MVRI[i].PlayerOwner == Exiting)
            {
                Log("exiting player MVRI found " $ string(i), 'MapVoteDebug');
                ExitingPlayerIndex = i;
                // End:0x214
                if(bMapVote && MVRI[ExitingPlayerIndex].MapVote > -1 && MVRI[ExitingPlayerIndex].GameVote > -1)
                {
                    X = 0;
                    J0x147:
                    // End:0x214 [While If]
                    if(X < MapVoteCount.Length)
                    {
                        // End:0x20a
                        if(MVRI[ExitingPlayerIndex].MapVote == MapVoteCount[X].MapIndex && MVRI[ExitingPlayerIndex].GameVote == MapVoteCount[X].GameConfigIndex)
                        {
                            MapVoteCount[X].VoteCount -= MVRI[ExitingPlayerIndex].VoteCount;
                            UpdateVoteCount(MapVoteCount[X].MapIndex, MapVoteCount[X].GameConfigIndex, MapVoteCount[X].VoteCount);
                        }
                        // End:0x214
                        else
                        {
                            ++ X;
                            // This is an implied JumpToken; Continue!
                            goto J0x147;
                        }
                    }
                }
                // End:0x2a6
                if(bKickVote)
                {
                    UpdateKickVoteCount(MVRI[ExitingPlayerIndex].PlayerID, 0);
                    // End:0x2a6
                    if(MVRI[ExitingPlayerIndex].KickVote > -1 && MVRI[MVRI[ExitingPlayerIndex].KickVote] != none)
                    {
                        UpdateKickVoteCount(MVRI[MVRI[ExitingPlayerIndex].KickVote].PlayerID, -1);
                    }
                }
            }
            // End:0x30d
            if(bKickVote && ExitingPlayerIndex > -1 && MVRI[i] != none && MVRI[i].KickVote == ExitingPlayerIndex)
            {
                MVRI[i].KickVote = -1;
            }
            // End:0x3b5
            if(MVRI[i] != none && MVRI[i].PlayerOwner == none || MVRI[i].PlayerOwner == Exiting)
            {
                Log("___Destroying VRI...", 'MapVoteDebug');
                MVRI[i].Destroy();
                MVRI[i] = none;
                // End:0x3a5
                if(bKickVote)
                {
                    TallyKickVotes();
                }
                // End:0x3b5
                if(bMapVote)
                {
                    TallyVotes(false);
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x63;
        }
    }
}

function AddMapVoteReplicationInfo(PlayerController Player)
{
    local VotingReplicationInfo M;

    Log("___Spawning VotingReplicationInfo", 'MapVoteDebug');
    M = Spawn(class'VotingReplicationInfo', Player,, Player.Location);
    // End:0x8a
    if(M == none)
    {
        Log("___Failed to spawn VotingReplicationInfo", 'MapVote');
        return;
    }
    M.PlayerID = Player.PlayerReplicationInfo.PlayerID;
    MVRI[MVRI.Length] = M;
}

function LoadMapList()
{
    local int i, EnabledMapCount;
    local class<MapListLoader> MapListLoaderClass;
    local MapListLoader Loader;

    MapList.Length = 0;
    MapCount = 0;
    MapVoteHistoryClass = class<MapVoteHistory>(DynamicLoadObject(MapVoteHistoryType, class'Class'));
    History = new (none, "MapVoteHistory" $ string(ServerNumber)) MapVoteHistoryClass;
    // End:0x83
    if(History == none)
    {
        History = new (none, "MapVoteHistory" $ string(ServerNumber)) class'MapVoteHistory_INI';
    }
    Log("GameTypes:", 'MapVote');
    // End:0x162
    if(GameConfig.Length == 0)
    {
        bAutoDetectMode = true;
        GameConfig.Length = 1;
        GameConfig[0].GameClass = string(Level.Game.Class);
        GameConfig[0].Prefix = Level.Game.MapPrefix;
        GameConfig[0].Acronym = Level.Game.Acronym;
        GameConfig[0].GameName = Level.Game.GameName;
        GameConfig[0].Mutators = "";
        GameConfig[0].Options = "";
    }
    MapCount = 0;
    i = 0;
    J0x170:
    // End:0x1b8 [While If]
    if(i < GameConfig.Length)
    {
        // End:0x1ae
        if(GameConfig[i].GameClass != "")
        {
            Log(GameConfig[i].GameName, 'MapVote');
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x170;
    }
    Log("MapListLoaderType = " $ MapListLoaderType, 'MapVote');
    MapListLoaderClass = class<MapListLoader>(DynamicLoadObject(MapListLoaderType, class'Class'));
    Loader = Spawn(MapListLoaderClass);
    // End:0x21e
    if(Loader == none)
    {
        Loader = Spawn(class'DefaultMapListLoader');
    }
    Loader.LoadMapList(self);
    Log(string(MapCount) $ " maps loaded.", 'MapVote');
    History.Save();
    // End:0x313
    if(bEliminationMode)
    {
        EnabledMapCount = 0;
        i = 0;
        J0x273:
        // End:0x2a7 [While If]
        if(i < MapCount)
        {
            // End:0x29d
            if(MapList[i].bEnabled)
            {
                ++ EnabledMapCount;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x273;
        }
        // End:0x313
        if(EnabledMapCount < MinMapCount || EnabledMapCount == 0)
        {
            Log("Elimination Mode Reset/Reload.", 'MapVote');
            RepeatLimit = 0;
            MapList.Length = 0;
            MapCount = 0;
            SaveConfig();
            Loader.LoadMapList(self);
        }
    }
    Loader.Destroy();
}

function AddMap(string MapName, string Mutators, string GameOptions)
{
    local MapHistoryInfo mapInfo;
    local bool bUpdate;
    local int i;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < MapList.Length)
    {
        // End:0x33
        if(MapName ~= MapList[i].MapName)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    mapInfo = History.GetMapHistory(MapName);
    MapList.Length = MapCount + 1;
    MapList[MapCount].MapName = MapName;
    MapList[MapCount].PlayCount = mapInfo.P;
    MapList[MapCount].Sequence = mapInfo.S;
    // End:0xee
    if(mapInfo.S <= RepeatLimit && mapInfo.S != 0)
    {
        MapList[MapCount].bEnabled = false;
    }
    // End:0x101
    else
    {
        MapList[MapCount].bEnabled = true;
    }
    ++ MapCount;
    // End:0x142
    if(Mutators != "" && Mutators != mapInfo.U)
    {
        mapInfo.U = Mutators;
        bUpdate = true;
    }
    // End:0x17c
    if(GameOptions != "" && GameOptions != mapInfo.G)
    {
        mapInfo.G = GameOptions;
        bUpdate = true;
    }
    // End:0x1a5
    if(mapInfo.M == "")
    {
        mapInfo.M = MapName;
        bUpdate = true;
    }
    // End:0x1c2
    if(bUpdate)
    {
        History.AddMap(mapInfo);
    }
}

function int GetMVRIIndex(PlayerController Player)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x58 [While If]
    if(i < MVRI.Length)
    {
        // End:0x4e
        if(MVRI[i] != none && MVRI[i].PlayerOwner == Player)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function SubmitMapVote(int MapIndex, int GameIndex, Actor Voter)
{
    local int Index, VoteCount, PrevMapVote, PrevGameVote;
    local MapHistoryInfo mapInfo;

    // End:0x0b
    if(bLevelSwitchPending)
    {
        return;
    }
    Index = GetMVRIIndex(PlayerController(Voter));
    // End:0x38
    if(!IsValidVote(MapIndex, GameIndex))
    {
        return;
    }
    // End:0x1b4
    if(PlayerController(Voter).PlayerReplicationInfo.bAdmin)
    {
        TextMessage = lmsgAdminMapChange;
        TextMessage = Repl(TextMessage, "%mapname%", MapList[MapIndex].MapName $ "(" $ GameConfig[GameIndex].Acronym $ ")");
        Level.Game.Broadcast(self, TextMessage);
        Log("Admin has forced map switch to " $ MapList[MapIndex].MapName $ "(" $ GameConfig[GameIndex].Acronym $ ")", 'MapVote');
        CloseAllVoteWindows();
        bLevelSwitchPending = true;
        mapInfo = History.PlayMap(MapList[MapIndex].MapName);
        ServerTravelString = SetupGameMap(MapList[MapIndex], GameIndex, mapInfo);
        Log("ServerTravelString = " $ ServerTravelString, 'MapVoteDebug');
        Level.ServerTravel(ServerTravelString, false);
        SetTimer(1.0, true);
        return;
    }
    // End:0x1ef
    if(PlayerController(Voter).PlayerReplicationInfo.bOnlySpectator)
    {
        PlayerController(Voter).ClientMessage(lmsgSpectatorsCantVote);
        return;
    }
    // End:0x277
    if(MapIndex < 0 || MapIndex >= MapCount || GameIndex >= GameConfig.Length || MVRI[Index].GameVote == GameIndex && MVRI[Index].MapVote == MapIndex || !MapList[MapIndex].bEnabled)
    {
        return;
    }
    Log("___" $ string(Index) $ " - " $ PlayerController(Voter).PlayerReplicationInfo.PlayerName $ " voted for " $ MapList[MapIndex].MapName $ "(" $ GameConfig[GameIndex].Acronym $ ")", 'MapVote');
    PrevMapVote = MVRI[Index].MapVote;
    PrevGameVote = MVRI[Index].GameVote;
    MVRI[Index].MapVote = MapIndex;
    MVRI[Index].GameVote = GameIndex;
    // End:0x53b
    if(bAccumulationMode)
    {
        // End:0x45a
        if(bScoreMode)
        {
            VoteCount = GetAccVote(PlayerController(Voter)) + int(GetPlayerScore(PlayerController(Voter)));
            TextMessage = lmsgMapVotedForWithCount;
            TextMessage = Repl(TextMessage, "%playername%", PlayerController(Voter).PlayerReplicationInfo.PlayerName);
            TextMessage = Repl(TextMessage, "%votecount%", string(VoteCount));
            TextMessage = Repl(TextMessage, "%mapname%", MapList[MapIndex].MapName $ "(" $ GameConfig[GameIndex].Acronym $ ")");
            Level.Game.Broadcast(self, TextMessage);
        }
        // End:0x538
        else
        {
            VoteCount = GetAccVote(PlayerController(Voter)) + 1;
            TextMessage = lmsgMapVotedForWithCount;
            TextMessage = Repl(TextMessage, "%playername%", PlayerController(Voter).PlayerReplicationInfo.PlayerName);
            TextMessage = Repl(TextMessage, "%votecount%", string(VoteCount));
            TextMessage = Repl(TextMessage, "%mapname%", MapList[MapIndex].MapName $ "(" $ GameConfig[GameIndex].Acronym $ ")");
            Level.Game.Broadcast(self, TextMessage);
        }
    }
    // End:0x6cf
    else
    {
        // End:0x624
        if(bScoreMode)
        {
            VoteCount = int(GetPlayerScore(PlayerController(Voter)));
            TextMessage = lmsgMapVotedForWithCount;
            TextMessage = Repl(TextMessage, "%playername%", PlayerController(Voter).PlayerReplicationInfo.PlayerName);
            TextMessage = Repl(TextMessage, "%votecount%", string(VoteCount));
            TextMessage = Repl(TextMessage, "%mapname%", MapList[MapIndex].MapName $ "(" $ GameConfig[GameIndex].Acronym $ ")");
            Level.Game.Broadcast(self, TextMessage);
        }
        // End:0x6cf
        else
        {
            VoteCount = 1;
            TextMessage = lmsgMapVotedFor;
            TextMessage = Repl(TextMessage, "%playername%", PlayerController(Voter).PlayerReplicationInfo.PlayerName);
            TextMessage = Repl(TextMessage, "%mapname%", MapList[MapIndex].MapName $ "(" $ GameConfig[GameIndex].Acronym $ ")");
            Level.Game.Broadcast(self, TextMessage);
        }
    }
    UpdateVoteCount(MapIndex, GameIndex, VoteCount);
    // End:0x72a
    if(PrevMapVote > -1 && PrevGameVote > -1)
    {
        UpdateVoteCount(PrevMapVote, PrevGameVote, -MVRI[Index].VoteCount);
    }
    MVRI[Index].VoteCount = VoteCount;
    TallyVotes(false);
}

function bool IsValidVote(int MapIndex, int GameIndex)
{
    local int i;
    local array<string> PrefixList;

    Split(GameConfig[GameIndex].Prefix, ",", PrefixList);
    i = 0;
    J0x21:
    // End:0x6c [While If]
    if(i < PrefixList.Length)
    {
        // End:0x62
        if(Left(MapList[MapIndex].MapName, Len(PrefixList[i])) ~= PrefixList[i])
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
    return false;
}

function UpdateVoteCount(int MapIndex, int GameIndex, int VoteCount)
{
    local int X, i;
    local bool bFound;
    local MapVoteScore MVCData;

    X = 0;
    J0x07:
    // End:0xac [While If]
    if(X < MapVoteCount.Length)
    {
        // End:0xa2
        if(MapVoteCount[X].GameConfigIndex == GameIndex && MapVoteCount[X].MapIndex == MapIndex)
        {
            MapVoteCount[X].VoteCount += VoteCount;
            MVCData = MapVoteCount[X];
            // End:0x97
            if(MapVoteCount[X].VoteCount <= 0)
            {
                MapVoteCount.Remove(X, 1);
            }
            bFound = true;
        }
        // End:0xac
        else
        {
            ++ X;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    // End:0x12f
    if(!bFound && VoteCount > 0)
    {
        X = MapVoteCount.Length;
        MapVoteCount.Insert(X, 1);
        MapVoteCount[X].GameConfigIndex = GameIndex;
        MapVoteCount[X].MapIndex = MapIndex;
        MapVoteCount[X].VoteCount = VoteCount;
        MVCData = MapVoteCount[X];
    }
    i = 0;
    J0x136:
    // End:0x198 [While If]
    if(i < MVRI.Length)
    {
        // End:0x18e
        if(MVRI[i] != none && MVRI[i].PlayerOwner != none)
        {
            MVRI[i].ReceiveMapVoteCount(MVCData, false);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x136;
    }
}

function TallyVotes(bool bForceMapSwitch)
{
    local int Index, X, Y, topmap, R, mapidx,
	    gameidx;

    local array<int> VoteCount, Ranking;
    local int PlayersThatVoted, TieCount;
    local string CurrentMap;
    local int Votes;
    local MapHistoryInfo mapInfo;

    // End:0x0b
    if(bLevelSwitchPending)
    {
        return;
    }
    PlayersThatVoted = 0;
    VoteCount.Length = GameConfig.Length * MapCount;
    X = 0;
    J0x2d:
    // End:0x271 [While If]
    if(X < MVRI.Length)
    {
        // End:0x267
        if(MVRI[X] != none && MVRI[X].MapVote > -1 && MVRI[X].GameVote > -1)
        {
            ++ PlayersThatVoted;
            // End:0x10d
            if(bScoreMode)
            {
                // End:0xe8
                if(bAccumulationMode)
                {
                    Votes = GetAccVote(MVRI[X].PlayerOwner) + int(GetPlayerScore(MVRI[X].PlayerOwner));
                }
                // End:0x10a
                else
                {
                    Votes = int(GetPlayerScore(MVRI[X].PlayerOwner));
                }
            }
            // End:0x143
            else
            {
                // End:0x13c
                if(bAccumulationMode)
                {
                    Votes = GetAccVote(MVRI[X].PlayerOwner) + 1;
                }
                // End:0x143
                else
                {
                    Votes = 1;
                }
            }
            VoteCount[MVRI[X].GameVote * MapCount + MVRI[X].MapVote] = VoteCount[MVRI[X].GameVote * MapCount + MVRI[X].MapVote] + Votes;
            // End:0x267
            if(!bScoreMode)
            {
                // End:0x267
                if(Level.Game.NumPlayers > 2 && float(VoteCount[MVRI[X].GameVote * MapCount + MVRI[X].MapVote]) / float(Level.Game.NumPlayers) > 0.50 && Level.Game.bGameEnded)
                {
                    bForceMapSwitch = true;
                }
            }
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x2d;
    }
    Log("___Voted - " $ string(PlayersThatVoted), 'MapVoteDebug');
    // End:0x34f
    if(Level.Game.NumPlayers > 2 && !Level.Game.bGameEnded && !bMidGameVote && float(PlayersThatVoted) / float(Level.Game.NumPlayers) * float(100) >= float(MidGameVotePercent))
    {
        Level.Game.Broadcast(self, lmsgMidGameVote);
        bMidGameVote = true;
        TimeLeft = VoteTimeLimit;
        ScoreBoardTime = 1;
        SetTimer(1.0, true);
    }
    Index = 0;
    X = 0;
    J0x35d:
    // End:0x3a7 [While If]
    if(X < VoteCount.Length)
    {
        // End:0x39d
        if(VoteCount[X] > 0)
        {
            Ranking.Insert(Index, 1);
            Ranking[++ Index] = X;
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x35d;
    }
    // End:0x45f
    if(PlayersThatVoted > 1)
    {
        X = 0;
        J0x3b9:
        // End:0x45c [While If]
        if(X < Index - 1)
        {
            Y = X + 1;
            J0x3d9:
            // End:0x452 [While If]
            if(Y < Index)
            {
                // End:0x448
                if(VoteCount[Ranking[X]] < VoteCount[Ranking[Y]])
                {
                    topmap = Ranking[X];
                    Ranking[X] = Ranking[Y];
                    Ranking[Y] = topmap;
                }
                ++ Y;
                // This is an implied JumpToken; Continue!
                goto J0x3d9;
            }
            ++ X;
            // This is an implied JumpToken; Continue!
            goto J0x3b9;
        }
    }
    // End:0x4a3
    else
    {
        // End:0x496
        if(PlayersThatVoted == 0)
        {
            GetDefaultMap(mapidx, gameidx);
            topmap = gameidx * MapCount + mapidx;
        }
        // End:0x4a3
        else
        {
            topmap = Ranking[0];
        }
    }
    // End:0x5c9
    if(PlayersThatVoted > 1)
    {
        // End:0x5bc
        if(Index > 1 && VoteCount[Ranking[0]] == VoteCount[Ranking[1]] && VoteCount[Ranking[0]] != 0)
        {
            TieCount = 1;
            X = 1;
            J0x4fd:
            // End:0x540 [While If]
            if(X < Index)
            {
                // End:0x536
                if(VoteCount[Ranking[0]] == VoteCount[Ranking[X]])
                {
                    ++ TieCount;
                }
                ++ X;
                // This is an implied JumpToken; Continue!
                goto J0x4fd;
            }
            topmap = Ranking[Rand(TieCount)];
            CurrentMap = GetURLMap();
            R = 0;
            J0x563:
            // End:0x5b9 [While If]
            if(MapList[topmap - topmap / MapCount * MapCount].MapName ~= CurrentMap)
            {
                topmap = Ranking[Rand(TieCount)];
                // End:0x5b6
                if(++ R > 100)
                {
                }
                // End:0x5b9
                else
                {
                    // This is an implied JumpToken; Continue!
                    goto J0x563;
                }
            }
        }
        // End:0x5c9
        else
        {
            topmap = Ranking[0];
        }
    }
    // End:0x810
    if(bForceMapSwitch || Level.Game.NumPlayers == PlayersThatVoted && Level.Game.NumPlayers > 0)
    {
        // End:0x642
        if(MapList[topmap - topmap / MapCount * MapCount].MapName == "")
        {
            return;
        }
        TextMessage = lmsgMapWon;
        TextMessage = Repl(TextMessage, "%mapname%", MapList[topmap - topmap / MapCount * MapCount].MapName $ "(" $ GameConfig[topmap / MapCount].Acronym $ ")");
        Level.Game.Broadcast(self, TextMessage);
        CloseAllVoteWindows();
        mapInfo = History.PlayMap(MapList[topmap - topmap / MapCount * MapCount].MapName);
        ServerTravelString = SetupGameMap(MapList[topmap - topmap / MapCount * MapCount], topmap / MapCount, mapInfo);
        Log("ServerTravelString = " $ ServerTravelString, 'MapVoteDebug');
        History.Save();
        // End:0x78c
        if(bEliminationMode)
        {
            ++ RepeatLimit;
        }
        // End:0x7c1
        if(bAccumulationMode)
        {
            SaveAccVotes(topmap - topmap / MapCount * MapCount, topmap / MapCount);
        }
        CurrentGameConfig = topmap / MapCount;
        // End:0x7e1
        if(!bAutoDetectMode)
        {
            SaveConfig();
        }
        bLevelSwitchPending = true;
        SetTimer(Level.TimeDilation, true);
        Level.ServerTravel(ServerTravelString, false);
    }
}

event Timer()
{
    local int mapidx, gameidx, i;
    local MapHistoryInfo mapInfo;

    // End:0x10c
    if(bLevelSwitchPending)
    {
        // End:0x10a
        if(Level.NextURL == "")
        {
            // End:0x10a
            if(Level.NextSwitchCountdown < float(0))
            {
                Log("___Map change Failed, bad or missing map file.", 'MapVote');
                GetDefaultMap(mapidx, gameidx);
                mapInfo = History.PlayMap(MapList[mapidx].MapName);
                ServerTravelString = SetupGameMap(MapList[mapidx], gameidx, mapInfo);
                Log("ServerTravelString = " $ ServerTravelString, 'MapVoteDebug');
                History.Save();
                Level.ServerTravel(ServerTravelString, false);
            }
        }
        return;
    }
    // End:0x135
    if(ScoreBoardTime > -1)
    {
        // End:0x12c
        if(ScoreBoardTime == 0)
        {
            OpenAllVoteWindows();
        }
        -- ScoreBoardTime;
        return;
    }
    -- TimeLeft;
    // End:0x1da
    if(TimeLeft == 60 || TimeLeft == 30 || TimeLeft == 20 || TimeLeft == 10)
    {
        i = 0;
        J0x179:
        // End:0x1da [While If]
        if(i < MVRI.Length)
        {
            // End:0x1d0
            if(MVRI[i] != none && MVRI[i].PlayerOwner != none)
            {
                MVRI[i].PlayCountDown(TimeLeft);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x179;
        }
    }
    // End:0x1ec
    if(TimeLeft == 0)
    {
        TallyVotes(true);
    }
}

function CloseAllVoteWindows()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < MVRI.Length)
    {
        // End:0x3d
        if(MVRI[i] != none)
        {
            MVRI[i].CloseWindow();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function OpenAllVoteWindows()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < MVRI.Length)
    {
        // End:0x3d
        if(MVRI[i] != none)
        {
            MVRI[i].OpenWindow();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function string SetupGameMap(MapVoteMapList mapInfo, int GameIndex, MapHistoryInfo MapHistoryInfo)
{
    local string ReturnString, MutatorString, OptionString;

    // End:0x34
    if(GameConfig[GameIndex].Mutators != "")
    {
        MutatorString = MutatorString $ GameConfig[GameIndex].Mutators;
    }
    // End:0x61
    if(MapHistoryInfo.U != "")
    {
        MutatorString = MutatorString $ "," $ MapHistoryInfo.U;
    }
    // End:0xa4
    if(GameConfig[GameIndex].Options != "")
    {
        OptionString = OptionString $ Repl(Repl(GameConfig[GameIndex].Options, ",", "?"), " ", "");
    }
    // End:0xd1
    if(MapHistoryInfo.G != "")
    {
        OptionString = OptionString $ "?" $ MapHistoryInfo.G;
    }
    ReturnString = mapInfo.MapName;
    ReturnString = ReturnString $ "?Game=" $ GameConfig[GameIndex].GameClass;
    // End:0x133
    if(MutatorString != "")
    {
        ReturnString = ReturnString $ "?Mutator=" $ MutatorString;
    }
    // End:0x156
    if(OptionString != "")
    {
        ReturnString = ReturnString $ "?" $ OptionString;
    }
    return ReturnString;
}

function bool HandleRestartGame()
{
    local int i;

    Log("____HandleRestartGame", 'MapVoteDebug');
    // End:0x39
    if(Level.NetMode == 0)
    {
        return true;
    }
    // End:0x90
    if(bMatchSetup)
    {
        i = 0;
        J0x49:
        // End:0x90 [While If]
        if(i < MVRI.Length)
        {
            // End:0x86
            if(MVRI[i] != none && MVRI[i].bMatchSetupPermitted)
            {
                return false;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x49;
        }
    }
    // End:0x12b
    if(bMapVote && bAutoOpen)
    {
        // End:0x10a
        if(string(Level.Game.Class) ~= "RoARAssault.xAssault")
        {
            // End:0x10a
            if(int(Level.Game.GameReplicationInfo.GetPropertyText("Part")) != 2)
            {
                return true;
            }
        }
        TimeLeft = VoteTimeLimit;
        ScoreBoardTime = ScoreBoardDelay;
        SetTimer(1.0, true);
        return false;
    }
    return true;
}

function MapVoteMapList GetMapList(int p_MapIndex)
{
    return MapList[p_MapIndex];
}

function MapVoteGameConfigLite GetGameConfig(int p_GameConfigIndex)
{
    local MapVoteGameConfigLite GameConfigItem;

    GameConfigItem.GameClass = GameConfig[p_GameConfigIndex].GameClass;
    GameConfigItem.Prefix = GameConfig[p_GameConfigIndex].Prefix;
    GameConfigItem.GameName = GameConfig[p_GameConfigIndex].GameName;
    return GameConfigItem;
}

function float GetPlayerScore(PlayerController Player)
{
    local float PlayerScore;

    // End:0x2b
    if(!Level.Game.bGameEnded)
    {
        PlayerScore = 1.0;
    }
    // End:0x48
    else
    {
        PlayerScore = Player.PlayerReplicationInfo.Score;
    }
    // End:0x60
    if(PlayerScore < float(1))
    {
        PlayerScore = 1.0;
    }
    return PlayerScore;
}

function int GetAccVote(PlayerController Player)
{
    local int X, PlayerAccVotes;
    local string PlayerName;

    PlayerName = Player.PlayerReplicationInfo.PlayerName;
    // End:0x2b
    if(PlayerName == "")
    {
        return 0;
    }
    // End:0x8e
    if(AccInfo.Length > 0)
    {
        X = 0;
        J0x3e:
        // End:0x8b [While If]
        if(X < AccInfo.Length)
        {
            // End:0x81
            if(AccInfo[X].Name == PlayerName)
            {
                PlayerAccVotes = AccInfo[X].VoteCount;
            }
            // End:0x8b
            else
            {
                ++ X;
                // This is an implied JumpToken; Continue!
                goto J0x3e;
            }
        }
    }
    // End:0x95
    else
    {
        PlayerAccVotes = 0;
    }
    return PlayerAccVotes;
}

function SaveAccVotes(int WinningMapIndex, int WinningGameIndex)
{
    local Controller C;
    local PlayerController P;
    local int X, Index;
    local bool bFound;

    // End:0x211
    if(AccInfo.Length > 0)
    {
        X = 0;
        J0x13:
        // End:0x1ca [While If]
        if(X < AccInfo.Length)
        {
            // End:0x1c0
            if(AccInfo[X].Name != "")
            {
                bFound = false;
                C = Level.ControllerList;
                J0x56:
                // End:0x190 [While If]
                if(C != none)
                {
                    P = PlayerController(C);
                    // End:0x179
                    if(C.bIsPlayer && P != none && AccInfo[X].Name == P.PlayerReplicationInfo.PlayerName)
                    {
                        Index = GetMVRIIndex(P);
                        // End:0x176
                        if(MVRI[Index] != none && MVRI[Index].MapVote != WinningMapIndex && MVRI[Index].GameVote != WinningGameIndex)
                        {
                            bFound = true;
                            // End:0x164
                            if(bScoreMode)
                            {
                                AccInfo[X].VoteCount = AccInfo[X].VoteCount + int(GetPlayerScore(P));
                            }
                            // End:0x176
                            else
                            {
                                ++ AccInfo[X].VoteCount;
                            }
                        }
                    }
                    // End:0x190
                    else
                    {
                        C = C.nextController;
                        // This is an implied JumpToken; Continue!
                        goto J0x56;
                    }
                }
                // End:0x1c0
                if(!bFound)
                {
                    AccInfo[X].Name = "";
                    AccInfo[X].VoteCount = 0;
                }
            }
            ++ X;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
        X = AccInfo.Length - 1;
        J0x1d9:
        // End:0x211 [While If]
        if(X >= 0)
        {
            // End:0x207
            if(AccInfo[X].Name == "")
            {
                AccInfo.Remove(X, 1);
            }
            -- X;
            // This is an implied JumpToken; Continue!
            goto J0x1d9;
        }
    }
    C = Level.ControllerList;
    J0x225:
    // End:0x3bb [While If]
    if(C != none)
    {
        P = PlayerController(C);
        // End:0x3a4
        if(C.bIsPlayer && P != none)
        {
            bFound = false;
            // End:0x2cb
            if(AccInfo.Length > 0)
            {
                X = 0;
                J0x27a:
                // End:0x2cb [While If]
                if(X < AccInfo.Length)
                {
                    // End:0x2c1
                    if(AccInfo[X].Name == P.PlayerReplicationInfo.PlayerName)
                    {
                        bFound = true;
                    }
                    // End:0x2cb
                    else
                    {
                        ++ X;
                        // This is an implied JumpToken; Continue!
                        goto J0x27a;
                    }
                }
            }
            Index = GetMVRIIndex(P);
            // End:0x3a4
            if(!bFound && MVRI[Index].MapVote != WinningMapIndex && MVRI[Index].GameVote != WinningGameIndex)
            {
                AccInfo.Insert(AccInfo.Length, 1);
                AccInfo[AccInfo.Length - 1].Name = P.PlayerReplicationInfo.PlayerName;
                // End:0x38e
                if(bScoreMode)
                {
                    AccInfo[AccInfo.Length - 1].VoteCount = int(GetPlayerScore(P));
                }
                // End:0x3a4
                else
                {
                    AccInfo[AccInfo.Length - 1].VoteCount = 1;
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x225;
    }
}

function GetDefaultMap(out int mapidx, out int gameidx)
{
    local int i, X, Y, R, P, GCIdx;

    local array<string> PrefixList;
    local bool bLoop;

    // End:0x0d
    if(MapCount <= 0)
    {
        return;
    }
    // End:0x24
    if(bDefaultToCurrentGameType)
    {
        GCIdx = CurrentGameConfig;
    }
    // End:0x2f
    else
    {
        GCIdx = DefaultGameConfig;
    }
    PrefixList.Length = 0;
    P = Split(GameConfig[GCIdx].Prefix, ",", PrefixList);
    // End:0x77
    if(PrefixList.Length == 0)
    {
        gameidx = GCIdx;
        mapidx = 0;
        return;
    }
    R = 0;
    bLoop = true;
    J0x86:
    // End:0x2c2 [While If]
    if(bLoop)
    {
        i = Rand(MapCount);
        // End:0x10b
        if(MapList[i].bEnabled)
        {
            X = 0;
            J0xb7:
            // End:0x10b [While If]
            if(X < PrefixList.Length)
            {
                // End:0x101
                if(Left(MapList[i].MapName, Len(PrefixList[X])) ~= PrefixList[X])
                {
                    bLoop = false;
                }
                // End:0x10b
                else
                {
                    ++ X;
                    // This is an implied JumpToken; Continue!
                    goto J0xb7;
                }
            }
        }
        // End:0x2bf
        if(bLoop && ++ R > 100)
        {
            i = 0;
            J0x12b:
            // End:0x1b3 [While If]
            if(i <= MapCount)
            {
                // End:0x1a9
                if(MapList[i].bEnabled)
                {
                    X = 0;
                    J0x155:
                    // End:0x1a9 [While If]
                    if(X < PrefixList.Length)
                    {
                        // End:0x19f
                        if(Left(MapList[i].MapName, Len(PrefixList[X])) ~= PrefixList[X])
                        {
                            bLoop = false;
                        }
                        // End:0x1a9
                        else
                        {
                            ++ X;
                            // This is an implied JumpToken; Continue!
                            goto J0x155;
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x12b;
            }
            // End:0x2bc
            if(bLoop)
            {
                i = 0;
                J0x1c3:
                // End:0x2bc [While If]
                if(i <= MapCount)
                {
                    // End:0x2b2
                    if(MapList[i].bEnabled)
                    {
                        Y = 0;
                        J0x1ed:
                        // End:0x2af [While If]
                        if(Y < GameConfig.Length)
                        {
                            PrefixList.Length = 0;
                            P = Split(GameConfig[Y].Prefix, ",", PrefixList);
                            // End:0x297
                            if(PrefixList.Length > 0)
                            {
                                X = 0;
                                J0x238:
                                // End:0x297 [While If]
                                if(X < PrefixList.Length)
                                {
                                    // End:0x28d
                                    if(Left(MapList[i].MapName, Len(PrefixList[X])) ~= PrefixList[X])
                                    {
                                        GCIdx = Y;
                                        bLoop = false;
                                    }
                                    // End:0x297
                                    else
                                    {
                                        ++ X;
                                        // This is an implied JumpToken; Continue!
                                        goto J0x238;
                                    }
                                }
                            }
                            // End:0x2a5
                            if(!bLoop)
                            {
                            }
                            // End:0x2af
                            else
                            {
                                ++ Y;
                                // This is an implied JumpToken; Continue!
                                goto J0x1ed;
                            }
                        }
                    }
                    // End:0x2bc
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x1c3;
                    }
                }
            }
        }
        // End:0x2c2
        else
        {
            // This is an implied JumpToken; Continue!
            goto J0x86;
        }
    }
    gameidx = GCIdx;
    mapidx = i;
    Log("Default Map Choosen = " $ MapList[mapidx].MapName $ "(" $ GameConfig[gameidx].Acronym $ ")", 'MapVoteDebug');
}

function SubmitKickVote(int PlayerID, Actor Voter)
{
    local int VoterID, VictumID, i, PreviousVote;
    local bool bFound;
    local string PlayerName;

    Log("SubmitKickVote " $ string(PlayerID), 'MapVoteDebug');
    // End:0x39
    if(bLevelSwitchPending || !bKickVote)
    {
        return;
    }
    VoterID = GetMVRIIndex(PlayerController(Voter));
    bFound = false;
    i = 0;
    J0x5e:
    // End:0xfd [While If]
    if(i < MVRI.Length)
    {
        // End:0xf3
        if(MVRI[i] != none && MVRI[i].PlayerOwner.PlayerReplicationInfo.PlayerID == PlayerID)
        {
            bFound = true;
            VictumID = i;
            PlayerName = MVRI[i].PlayerOwner.PlayerReplicationInfo.PlayerName;
        }
        // End:0xfd
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5e;
        }
    }
    // End:0x10a
    if(!bFound)
    {
        return;
    }
    // End:0x12a
    if(MVRI[VoterID].KickVote == VictumID)
    {
        return;
    }
    // End:0x19a
    if(PlayerController(Voter).PlayerReplicationInfo.bAdmin)
    {
        Log("___Admin " $ PlayerController(Voter).PlayerReplicationInfo.PlayerName $ " kicked " $ PlayerName, 'MapVote');
        KickPlayer(VictumID);
        return;
    }
    // End:0x1d5
    if(PlayerController(Voter).PlayerReplicationInfo.bOnlySpectator)
    {
        PlayerController(Voter).ClientMessage(lmsgSpectatorsCantVote);
        return;
    }
    // End:0x28b
    if(MVRI[VictumID].PlayerOwner.PlayerReplicationInfo.bAdmin || NetConnection(MVRI[VictumID].PlayerOwner.Player) == none)
    {
        TextMessage = lmsgKickVoteAdmin;
        TextMessage = Repl(TextMessage, "%playername%", PlayerController(Voter).PlayerReplicationInfo.PlayerName);
        Level.Game.Broadcast(self, TextMessage);
        return;
    }
    Log("___" $ PlayerController(Voter).PlayerReplicationInfo.PlayerName $ " placed a kick vote against " $ PlayerName, 'MapVote');
    // End:0x331
    if(bAnonymousKicking)
    {
        TextMessage = lmsgAnonymousKickVote;
        TextMessage = Repl(TextMessage, "%playername%", PlayerName);
        Level.Game.Broadcast(self, TextMessage);
    }
    // End:0x3b3
    else
    {
        TextMessage = lmsgKickVote;
        TextMessage = Repl(TextMessage, "%playername1%", PlayerController(Voter).PlayerReplicationInfo.PlayerName);
        TextMessage = Repl(TextMessage, "%playername2%", PlayerName);
        Level.Game.Broadcast(self, TextMessage);
    }
    PreviousVote = MVRI[VoterID].KickVote;
    MVRI[VoterID].KickVote = VictumID;
    UpdateKickVoteCount(MVRI[VictumID].PlayerID, 1);
    // End:0x430
    if(PreviousVote > -1)
    {
        UpdateKickVoteCount(MVRI[PreviousVote].PlayerID, -1);
    }
    TallyKickVotes();
}

function UpdateKickVoteCount(int PlayerID, int VoteCountDelta)
{
    local int X, i;
    local bool bFound;

    // End:0x0d
    if(PlayerID < 0)
    {
        return;
    }
    X = 0;
    J0x14:
    // End:0xb2 [While If]
    if(X < KickVoteCount.Length)
    {
        // End:0xa8
        if(KickVoteCount[X].PlayerID == PlayerID)
        {
            // End:0x5e
            if(VoteCountDelta == 0)
            {
                KickVoteCount[X].KickVoteCount = 0;
            }
            // End:0x75
            else
            {
                KickVoteCount[X].KickVoteCount += VoteCountDelta;
            }
            // End:0x9d
            if(KickVoteCount[X].KickVoteCount < 0)
            {
                KickVoteCount[X].KickVoteCount = 0;
            }
            bFound = true;
        }
        // End:0xb2
        else
        {
            ++ X;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    // End:0x10a
    if(!bFound && VoteCountDelta > 0)
    {
        X = KickVoteCount.Length;
        KickVoteCount.Insert(X, 1);
        KickVoteCount[X].PlayerID = PlayerID;
        KickVoteCount[X].KickVoteCount = 1;
    }
    i = 0;
    J0x111:
    // End:0x18b [While If]
    if(i < MVRI.Length)
    {
        // End:0x181
        if(MVRI[i] != none && MVRI[i].PlayerOwner != none && X < KickVoteCount.Length)
        {
            MVRI[i].ReceiveKickVoteCount(KickVoteCount[X], false);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x111;
    }
}

function TallyKickVotes()
{
    local int i, X, Y, Index, PlayersThatVoted, Lamer;

    local array<int> VoteCount, Ranking;

    VoteCount.Length = MVRI.Length;
    i = 0;
    J0x14:
    // End:0x82 [While If]
    if(i < MVRI.Length)
    {
        // End:0x78
        if(MVRI[i] != none && MVRI[i].KickVote != -1)
        {
            ++ PlayersThatVoted;
            ++ VoteCount[MVRI[i].KickVote];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    Index = 0;
    i = 0;
    J0x90:
    // End:0xda [While If]
    if(i < VoteCount.Length)
    {
        // End:0xd0
        if(VoteCount[i] > 0)
        {
            Ranking.Insert(Index, 1);
            Ranking[++ Index] = i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x90;
    }
    // End:0x19c
    if(PlayersThatVoted > 1)
    {
        X = 0;
        J0xec:
        // End:0x18f [While If]
        if(X < Index - 1)
        {
            Y = X + 1;
            J0x10c:
            // End:0x185 [While If]
            if(Y < Index)
            {
                // End:0x17b
                if(VoteCount[Ranking[X]] < VoteCount[Ranking[Y]])
                {
                    Lamer = Ranking[X];
                    Ranking[X] = Ranking[Y];
                    Ranking[Y] = Lamer;
                }
                ++ Y;
                // This is an implied JumpToken; Continue!
                goto J0x10c;
            }
            ++ X;
            // This is an implied JumpToken; Continue!
            goto J0xec;
        }
        Lamer = Ranking[0];
    }
    // End:0x1e3
    if(float(VoteCount[Lamer]) / float(Level.Game.NumPlayers) * float(100) >= float(KickPercent))
    {
        KickPlayer(Lamer);
        return;
    }
}

function KickPlayer(int PlayerIndex)
{
    local int i;

    // End:0x2f
    if(MVRI[PlayerIndex] == none || MVRI[PlayerIndex].PlayerOwner == none)
    {
        return;
    }
    TextMessage = "%playername% has been kicked.";
    TextMessage = Repl(TextMessage, "%playername%", MVRI[PlayerIndex].PlayerOwner.PlayerReplicationInfo.PlayerName);
    Level.Game.Broadcast(self, TextMessage);
    // End:0x128
    if(bKickVote)
    {
        i = 0;
        J0xc3:
        // End:0x128 [While If]
        if(i < MVRI.Length)
        {
            // End:0x11e
            if(MVRI[i] != none && MVRI[i].KickVote != -1)
            {
                MVRI[i].KickVote = -1;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xc3;
        }
    }
    // End:0x14e
    if(MVRI[PlayerIndex] != none)
    {
        MVRI[PlayerIndex].CloseWindow();
    }
    Log("___" $ MVRI[PlayerIndex].PlayerOwner.PlayerReplicationInfo.PlayerName $ " has been kicked.", 'MapVote');
    Level.Game.AccessControl.BanPlayer(MVRI[PlayerIndex].PlayerOwner, true);
}

function bool MatchSetupLogin(string UserID, string Password, Actor Requestor, out int SecLevel)
{
    local wAdminUser AdminUser;

    // End:0x21b
    if(bMatchSetup && PlayerController(Requestor) != none)
    {
        // End:0x58
        if(UserID ~= "Admin" && PlayerController(Requestor).PlayerReplicationInfo.bAdmin)
        {
            SecLevel = 255;
            return true;
        }
        // End:0x1df
        if(Level.Game.AccessControl.AdminLogin(PlayerController(Requestor), UserID, Password))
        {
            // End:0x192
            if(Level.Game.AccessControl.CanPerform(PlayerController(Requestor), "Xm"))
            {
                Log(UserID $ " has logged in to MatchSetup.");
                AdminUser = Level.Game.AccessControl.GetUser(UserID);
                // End:0x139
                if(AdminUser != none)
                {
                    SecLevel = AdminUser.MaxSecLevel();
                }
                // End:0x140
                else
                {
                    SecLevel = 0;
                }
                // End:0x175
                if(SecLevel == 0 && PlayerController(Requestor).PlayerReplicationInfo.bAdmin)
                {
                    SecLevel = 255;
                }
                Log("SecLevel = " $ string(SecLevel));
                return true;
            }
            // End:0x1dc
            else
            {
                Log(UserID $ " doesnt have MatchSetup permissions.");
                PlayerController(Requestor).ClientMessage(lmsgMatchSetupPermission);
                return false;
            }
        }
        // End:0x21b
        else
        {
            Log(UserID $ " password was invalid.");
            PlayerController(Requestor).ClientMessage(lmsgInvalidPassword);
            return false;
        }
    }
}

function MatchSetupLogout(Actor Requestor)
{
    // End:0x46
    if(bMatchSetup && PlayerController(Requestor) != none)
    {
        Level.Game.AccessControl.AdminLogout(PlayerController(Requestor));
    }
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.MapVoteGroup, "bMapVote", default.PropsDisplayText[0], 0, 1, "Check",,, true, false);
    PlayInfo.AddSetting(default.MapVoteGroup, "bAutoOpen", default.PropsDisplayText[1], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "ScoreBoardDelay", default.PropsDisplayText[2], 0, 1, "Text", "3;0:60",, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "bScoreMode", default.PropsDisplayText[3], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "bAccumulationMode", default.PropsDisplayText[4], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "bEliminationMode", default.PropsDisplayText[5], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "MinMapCount", default.PropsDisplayText[6], 0, 1, "Text", "4;1:9999",, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "RepeatLimit", default.PropsDisplayText[7], 0, 1, "Text", "4;0:9999",, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "VoteTimeLimit", default.PropsDisplayText[8], 0, 1, "Text", "3;10:300",, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "MidGameVotePercent", default.PropsDisplayText[9], 0, 1, "Text", "3;1:100",, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "bDefaultToCurrentGameType", default.PropsDisplayText[10], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.MapVoteGroup, "GameConfig", default.PropsDisplayText[15], 0, 1, "Custom", ";;" $ default.GameConfigPage,, true, true);
    PlayInfo.AddSetting(default.KickVoteGroup, "bKickVote", default.PropsDisplayText[11], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.KickVoteGroup, "KickPercent", default.PropsDisplayText[12], 0, 1, "Text", "3;1:100",, true, true);
    PlayInfo.AddSetting(default.KickVoteGroup, "bAnonymousKicking", default.PropsDisplayText[13], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "bMatchSetup", default.PropsDisplayText[14], 0, 1, "Check",,, true, true);
    class'DefaultMapListLoader'.static.FillPlayInfo(PlayInfo);
    PlayInfo.PopClass();
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x14
    if(class'LevelInfo'.static.IsDemoBuild())
    {
        return false;
    }
    switch(PropertyName)
    {
        // End:0x28
        case "bMapVote":
        // End:0x36
        case "bAutoOpen":
        // End:0x4a
        case "ScoreBoardDelay":
        // End:0x59
        case "bScoreMode":
        // End:0x6f
        case "bAccumulationMode":
        // End:0x84
        case "bEliminationMode":
        // End:0x94
        case "MinMapCount":
        // End:0xa4
        case "RepeatLimit":
        // End:0xb6
        case "VoteTimeLimit":
        // End:0xcd
        case "MidGameVotePercent":
        // End:0xeb
        case "bDefaultToCurrentGameType":
        // End:0xfa
        case "GameConfig":
        // End:0x112
        case "MapListLoaderType":
            return true;
        // End:0x120
        case "bKickVote":
        // End:0x130
        case "KickPercent":
        // End:0x148
        case "bAnonymousKicking":
            return true;
        // End:0x15a
        case "bMatchSetup":
            return false;
        // End:0xffff
        default:
            return super(Info).AcceptPlayInfoProperty(PropertyName);
    }
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1c
        case "bMapVote":
            return default.PropDescription[0];
        // End:0x32
        case "bAutoOpen":
            return default.PropDescription[1];
        // End:0x4f
        case "ScoreBoardDelay":
            return default.PropDescription[2];
        // End:0x67
        case "bScoreMode":
            return default.PropDescription[3];
        // End:0x86
        case "bAccumulationMode":
            return default.PropDescription[4];
        // End:0xa4
        case "bEliminationMode":
            return default.PropDescription[5];
        // End:0xbd
        case "MinMapCount":
            return default.PropDescription[6];
        // End:0xd6
        case "RepeatLimit":
            return default.PropDescription[7];
        // End:0xf1
        case "VoteTimeLimit":
            return default.PropDescription[8];
        // End:0x111
        case "MidGameVotePercent":
            return default.PropDescription[9];
        // End:0x138
        case "bDefaultToCurrentGameType":
            return default.PropDescription[10];
        // End:0x14f
        case "bKickVote":
            return default.PropDescription[11];
        // End:0x168
        case "KickPercent":
            return default.PropDescription[12];
        // End:0x187
        case "bAnonymousKicking":
            return default.PropDescription[13];
        // End:0x1a0
        case "bMatchSetup":
            return default.PropDescription[14];
        // End:0x1b8
        case "GameConfig":
            return default.PropDescription[15];
        // End:0x1d7
        case "MapListLoaderType":
            return default.PropDescription[16];
        // End:0xffff
        default:
            return "";
    }
}

function string GetConfigArrayData(string ConfigArrayName, int RowIndex, int ColumnIndex)
{
    switch(Caps(ConfigArrayName))
    {
        // End:0x120
        case "GAMECONFIG":
            // End:0x3c
            if(RowIndex > GameConfig.Length - 1 || ColumnIndex > 5)
            {
                return "";
            }
            switch(ColumnIndex)
            {
                // End:0x68
                case 0:
                    return "GAMETYPE;50;" $ GameConfig[RowIndex].GameClass;
                // End:0x89
                case 1:
                    return "TEXT;50;" $ GameConfig[RowIndex].Prefix;
                // End:0xab
                case 2:
                    return "TEXT;20;" $ GameConfig[RowIndex].Acronym;
                // End:0xcd
                case 3:
                    return "TEXT;50;" $ GameConfig[RowIndex].GameName;
                // End:0xf4
                case 4:
                    return "MUTATORS;255;" $ GameConfig[RowIndex].Mutators;
                // End:0x117
                case 5:
                    return "TEXT;255;" $ GameConfig[RowIndex].Options;
                // End:0xffff
                default:
                    return "";
            }
            // End:0x132
            break;
        // End:0x12f
        case "MAPLIST":
            // End:0x132
            break;
        // End:0xffff
        default:
}

function string GetConfigArrayColumnTitle(string ConfigArrayName, int ColumnIndex)
{
    switch(Caps(ConfigArrayName))
    {
        // End:0x40
        case "GAMECONFIG":
            // End:0x34
            if(ColumnIndex > 5 || ColumnIndex < 0)
            {
                return "";
            }
            return lmsgGameConfigColumnTitle[ColumnIndex];
        // End:0x4f
        case "MAPLIST":
            // End:0x52
            break;
        // End:0xffff
        default:
}

function DeleteConfigArrayItem(string ConfigArrayName, int RowIndex)
{
    switch(Caps(ConfigArrayName))
    {
        // End:0x48
        case "GAMECONFIG":
            // End:0x3a
            if(RowIndex < 0 || RowIndex > GameConfig.Length - 1)
            {
                return;
            }
            GameConfig.Remove(RowIndex, 1);
            return;
        // End:0x57
        case "MAPLIST":
            // End:0x5a
            break;
        // End:0xffff
        default:
}

function int AddConfigArrayItem(string ConfigArrayName)
{
    switch(Caps(ConfigArrayName))
    {
        // End:0xcd
        case "GAMECONFIG":
            GameConfig.Insert(GameConfig.Length, 1);
            GameConfig[GameConfig.Length - 1].GameClass = "WGame.wDeathMatch";
            GameConfig[GameConfig.Length - 1].Prefix = "";
            GameConfig[GameConfig.Length - 1].Acronym = "";
            GameConfig[GameConfig.Length - 1].GameName = "new";
            GameConfig[GameConfig.Length - 1].Mutators = "";
            GameConfig[GameConfig.Length - 1].Options = "";
            return GameConfig.Length - 1;
        // End:0xdc
        case "MAPLIST":
            // End:0xdf
            break;
        // End:0xffff
        default:
}

function UpdateConfigArrayItem(string ConfigArrayName, int RowIndex, int ColumnIndex, string NewValue)
{
    switch(Caps(ConfigArrayName))
    {
        // End:0x106
        case "GAMECONFIG":
            // End:0x48
            if(RowIndex < 0 || RowIndex > GameConfig.Length - 1 || ColumnIndex > 5)
            {
                return;
            }
            switch(ColumnIndex)
            {
                // End:0x6c
                case 0:
                    GameConfig[RowIndex].GameClass = NewValue;
                    // End:0x104
                    break;
                // End:0x89
                case 1:
                    GameConfig[RowIndex].Prefix = NewValue;
                    // End:0x104
                    break;
                // End:0xa7
                case 2:
                    GameConfig[RowIndex].Acronym = NewValue;
                    // End:0x104
                    break;
                // End:0xc5
                case 3:
                    GameConfig[RowIndex].GameName = NewValue;
                    // End:0x104
                    break;
                // End:0xe3
                case 4:
                    GameConfig[RowIndex].Mutators = NewValue;
                    // End:0x104
                    break;
                // End:0x101
                case 5:
                    GameConfig[RowIndex].Options = NewValue;
                    // End:0x104
                    break;
                // End:0xffff
                default:
                    return;
        }
        // End:0x115
        case "MAPLIST":
            // End:0x118
            break;
        // End:0xffff
        default:
}

function int GetConfigArrayItemCount(string ConfigArrayName)
{
    switch(Caps(ConfigArrayName))
    {
        // End:0x1f
        case "GAMECONFIG":
            return GameConfig.Length;
        // End:0x2e
        case "MAPLIST":
            // End:0x31
            break;
        // End:0xffff
        default:
}

function ReloadAll(optional bool bParam)
{
    ReloadMatchConfig(bParam, bParam);
}

function PropagateValue(VotingReplicationInfo Sender, string Type, string SettingName, string NewValue)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xa7 [While If]
    if(i < MVRI.Length)
    {
        // End:0x9d
        if(MVRI[i].bMatchSetupPermitted && MVRI[i] != Sender)
        {
            MVRI[i].SendClientResponse(Type, MVRI[i].UpdateID, SettingName $ Chr(27) $ NewValue);
            MVRI[i].bMatchSetupAccepted = false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ReloadMatchConfig(bool bRefreshMaps, bool bRefreshMuts, optional PlayerController Caller)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xb0 [While If]
    if(i < MVRI.Length)
    {
        // End:0xa6
        if(MVRI[i] != none && MVRI[i].bMatchSetupPermitted)
        {
            // End:0x85
            if(bRefreshMaps && bRefreshMuts)
            {
                MVRI[i].SendClientResponse(MVRI[i].LoginID, "1");
            }
            // End:0xa6
            else
            {
                MVRI[i].RequestMatchSettings(bRefreshMaps, bRefreshMuts);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function MatchConfig CreateMatchProfile()
{
    return new (none, "MatchConfig" $ Chr(27) $ string(Level.Game.Class) $ Chr(27) $ string(ServerNumber)) class'MatchConfig';
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    local int i;

    i = ServerState.ServerInfo.Length;
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = "MapVoting";
    ServerState.ServerInfo[++ i].Value = Locs(string(bMapVote));
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = "KickVoting";
    ServerState.ServerInfo[++ i].Value = Locs(string(bKickVote));
}

defaultproperties
{
    VoteTimeLimit=70
    ScoreBoardDelay=5
    bAutoOpen=true
    MidGameVotePercent=50
    MinMapCount=2
    MapVoteHistoryType="xVoting.MapVoteHistory_INI"
    RepeatLimit=4
    bDefaultToCurrentGameType=true
    KickPercent=51
    bAnonymousKicking=true
    MapListLoaderType="xVoting.DefaultMapListLoader"
    ServerNumber=1
    GameConfigPage="xVoting.MapVoteGameConfigPage"
    MapListConfigPage="xVoting.MapVoteMapListConfigPage"
    lmsgInvalidPassword="??? ????? ????!"
    lmsgMatchSetupPermission="?? ??? ??? ? ????!"
    lmsgKickVote="%playername1%?? %playername2%?? ?? ????? ????"
    lmsgAnonymousKickVote="%playername%?? ?? ????? ????"
    lmsgKickVoteAdmin="?? ???? ?? %playername%?? ????? ????!"
    lmsgMapWon="%? ??%? ???????!"
    lmsgMidGameVote="???? ? ??? ???????!!"
    lmsgSpectatorsCantVote="???? ??? ? ????."
    lmsgMapVotedFor="%playername%?? %mapname%?? ???????"
    lmsgMapVotedForWithCount="%playername%?? %mapname%?? %votecount% ???????"
    PropsDisplayText[0]="? ??? ?????"
    PropsDisplayText[1]="?? ?? GUI"
    PropsDisplayText[2]="??? ??"
    PropsDisplayText[3]="?? ??"
    PropsDisplayText[4]="?? ??"
    PropsDisplayText[5]="?? ??"
    PropsDisplayText[6]="?? ?"
    PropsDisplayText[7]="?? ??"
    PropsDisplayText[8]="???? ??"
    PropsDisplayText[9]="???? ?? ???"
    PropsDisplayText[10]="??? ?? ??? ??????"
    PropsDisplayText[11]="?? ??? ?????"
    PropsDisplayText[12]="???? ???"
    PropsDisplayText[13]="???? ???? ?"
    PropsDisplayText[14]="?? ??? ?????"
    PropsDisplayText[15]="?? ??"
    PropsDisplayText[16]="? ??? ??"
    PropDescription[0]="?? ??? ????? ??? ??? ? ????."
    PropDescription[1]="?? ??? ? ?? ?????? ??? ?? ? ???? ????."
    PropDescription[2]="?? ?????? ??? ?? ????? ?????."
    PropDescription[3]="?? ??? ? ????? ????? ??? ?????."
    PropDescription[4]="?? ??? ????? ?? ??? ???? ??????."
    PropDescription[5]="?? ??? ?? ?? ??? ??? ?? ??? ?? ??? ????."
    PropDescription[6]="? ???? ????? ?? ? ???(?? ??)? ?? ?? ???? ?? ??."
    PropDescription[7]="?? ????? ??? ? ?? ?? ?."
    PropDescription[8]="??? ???? ??(?)? ?????."
    PropDescription[9]="???? ??? ? ? ?? ?? ???? ? ???? ???."
    PropDescription[10]="?? ??? ??? ????? ??? ??? ??? ?? ??? ??????."
    PropDescription[11]="?? ??? ????? ?? ????? ????? ??? ? ????."
    PropDescription[12]="?? ????? ???? ????? ?? ???? ? ???? ???."
    PropDescription[13]="?? ??? ?? ????? ??? ????? ???? ? ? ????."
    PropDescription[14]="?? ??? ???? ????? ?? ?? ???? ? ? ????."
    PropDescription[15]="? ?? ???? ??? ???"
    PropDescription[16]="? ?? ? ??? ????? ???"
    lmsgAdminMapChange="???? %mapname%?? ?? ?????"
    lmsgGameConfigColumnTitle[0]="????"
    lmsgGameConfigColumnTitle[1]="? ???"
    lmsgGameConfigColumnTitle[2]="???"
    lmsgGameConfigColumnTitle[3]="??"
    lmsgGameConfigColumnTitle[4]="????"
    lmsgGameConfigColumnTitle[5]="??"
}