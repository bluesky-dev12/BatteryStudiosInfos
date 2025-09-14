/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\VotingReplicationInfo.uc
 * Package Imports:
 *	xVoting
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:2
 *	Properties:45
 *	Functions:45
 *
 *******************************************************************************/
class VotingReplicationInfo extends VotingReplicationInfoBase
    dependson(KickInfoPage)
    dependson(PlayerInfoMultiColumnListBox)
    dependson(xVotingHandler)
    dependson(MatchConfig)
    dependson(KickVotingPage)
    dependson(MapVotingPage)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

enum RepDataType
{
    REPDATATYPE_GameConfig,
    REPDATATYPE_MapList,
    REPDATATYPE_MapVoteCount,
    REPDATATYPE_KickVoteCount,
    REPDATATYPE_MatchConfig,
    REPDATATYPE_Maps,
    REPDATATYPE_Mutators
};

struct TickedReplicationQueueItem
{
    var VotingReplicationInfo.RepDataType DataType;
    var int Index;
    var int Last;
};

struct MutatorData
{
    var string ClassName;
    var string FriendlyName;
};

var array<TickedReplicationQueueItem> TickedReplicationQueue;
var array<MapVoteMapList> MapList;
var int MapCount;
var array<MapVoteGameConfigLite> GameConfig;
var int GameConfigCount;
var int CurrentGameConfig;
var bool bWaitingForReply;
var array<MapVoteScore> MapVoteCount;
var array<KickVoteScore> KickVoteCount;
var int MapVote;
var int VoteCount;
var int GameVote;
var int KickVote;
var PlayerController PlayerOwner;
var int PlayerID;
var byte Mode;
var bool bMapVote;
var bool bKickVote;
var bool bMatchSetup;
var bool bMatchSetupPermitted;
var bool bMatchSetupAccepted;
var bool bSendingMatchSetup;
var int SecurityLevel;
var config bool bDebugLog;
var() name CountDownSounds[60];
var int CountDown;
var xVotingHandler VH;
var localized string lmsgSavedAsDefaultSuccess;
var localized string lmsgNotAllAccepted;
var string MapID;
var string MutatorID;
var string OptionID;
var string GeneralID;
var string URLID;
var string StatusID;
var string MatchSetupID;
var string LoginID;
var string CompleteID;
var string AddID;
var string RemoveID;
var string UpdateID;
var string FailedID;
var string TournamentID;
var string DemoRecID;
var string GameTypeID;

replication
{
    // Pos:0x00
    reliable if(Role == 4 && bNetInitial)
        MapCount, GameConfigCount,
        CurrentGameConfig, PlayerOwner,
        bMapVote, bKickVote,
        bMatchSetup;

    // Pos:0x18
    reliable if(Role == 4 && bMapVote)
        PlayCountDown, OpenWindow,
        CloseWindow, ReceiveMapVoteCount,
        ReceiveMapInfo, ReceiveKickVoteCount,
        Mode, ReceiveGameConfig;

    // Pos:0x30
    reliable if(Role == 4 && bKickVote)
        SendPlayerID;

    // Pos:0x48
    reliable if(Role == 4 && bMatchSetup)
        SecurityLevel, bMatchSetupAccepted,
        bMatchSetupPermitted;

    // Pos:0x60
    reliable if(Role < 4)
        RequestPlayerIP, ReplicationReply,
        SendMapVote, SendKickVote,
        MatchSetupLogin, MatchSetupLogout,
        RequestMatchSettings, MatchSettingsSubmit,
        SaveAsDefault, RestoreDefaultProfile;

}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    PlayerOwner = PlayerController(Owner);
    VH = xVotingHandler(Level.Game.VotingHandler);
}

simulated event PostNetBeginPlay()
{
    DebugLog("____VotingReplicationInfo.PostNetBeginPlay");
    super(Actor).PostNetBeginPlay();
    GetServerData();
}

simulated event PostNetReceive()
{
    bNetNotify = NeedNetNotify();
    // End:0x2d
    if(!bNetNotify && Owner == none)
    {
        SetOwner(PlayerOwner);
    }
}

simulated function bool NeedNetNotify()
{
    return PlayerOwner == none;
}

simulated function GUIController GetController()
{
    // End:0x72
    if(Level.NetMode == 2 || Level.NetMode == 3)
    {
        // End:0x72
        if(PlayerOwner != none && PlayerOwner.Player != none)
        {
            return GUIController(PlayerOwner.Player.GUIController);
        }
    }
    return none;
}

simulated function GetServerData()
{
    // End:0x181
    if(Level.NetMode != 3)
    {
        bKickVote = VH.bKickVote;
        bMapVote = VH.bMapVote;
        bMatchSetup = VH.bMatchSetup;
        MapCount = VH.MapCount;
        GameConfigCount = VH.GameConfig.Length;
        // End:0x147
        if(bMapVote)
        {
            Mode = byte(VH.bEliminationMode);
            Mode += byte(byte(VH.bScoreMode) * 2);
            Mode += byte(byte(VH.bAccumulationMode) * 4);
            CurrentGameConfig = VH.CurrentGameConfig;
            AddToTickedReplicationQueue(0, GameConfigCount - 1);
            AddToTickedReplicationQueue(1, MapCount - 1);
            // End:0x147
            if(VH.MapVoteCount.Length > 0)
            {
                AddToTickedReplicationQueue(2, VH.MapVoteCount.Length - 1);
            }
        }
        // End:0x181
        if(bKickVote && VH.KickVoteCount.Length > 0)
        {
            AddToTickedReplicationQueue(3, VH.KickVoteCount.Length - 1);
        }
    }
}

simulated function Tick(float DeltaTime)
{
    local int i;
    local bool bDedicated, bListening;

    // End:0x19
    if(TickedReplicationQueue.Length == 0 || bWaitingForReply)
    {
        return;
    }
    bDedicated = Level.NetMode == 1 || Level.NetMode == 2 && PlayerOwner != none && PlayerOwner.Player.Console == none;
    bListening = Level.NetMode == 2 && PlayerOwner != none && PlayerOwner.Player.Console != none;
    // End:0xe0
    if(!bDedicated && !bListening)
    {
        return;
    }
    i = TickedReplicationQueue.Length - 1;
    switch(TickedReplicationQueue[i].DataType)
    {
        // End:0x125
        case 0:
            TickedReplication_GameConfig(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x149
        case 1:
            TickedReplication_MapList(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x16d
        case 2:
            TickedReplication_MapVoteCount(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x191
        case 3:
            TickedReplication_KickVoteCount(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x1b5
        case 4:
            TickedReplication_MatchConfig(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x1d9
        case 5:
            TickedReplication_Maps(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x1fd
        case 6:
            TickedReplication_Mutators(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0xffff
        default:
            ++ TickedReplicationQueue[i].Index;
            // End:0x243
            if(TickedReplicationQueue[i].Index > TickedReplicationQueue[i].Last)
            {
                TickedReplicationQueue.Remove(i, 1);
            }
}

function AddToTickedReplicationQueue(VotingReplicationInfo.RepDataType Type, int Last)
{
    // End:0x49
    if(Last > -1)
    {
        TickedReplicationQueue.Insert(0, 1);
        TickedReplicationQueue[0].DataType = Type;
        TickedReplicationQueue[0].Index = 0;
        TickedReplicationQueue[0].Last = Last;
    }
}

function TickedReplication_GameConfig(int Index, bool bDedicated)
{
    local MapVoteGameConfigLite GameConfigItem;

    GameConfigItem = VH.GetGameConfig(Index);
    DebugLog("___Sending " $ string(Index) $ " - " $ GameConfigItem.GameName);
    // End:0x68
    if(bDedicated)
    {
        ReceiveGameConfig(GameConfigItem);
        bWaitingForReply = true;
    }
    // End:0x7a
    else
    {
        GameConfig[GameConfig.Length] = GameConfigItem;
    }
}

function TickedReplication_MapList(int Index, bool bDedicated)
{
    local MapVoteMapList mapInfo;

    mapInfo = VH.GetMapList(Index);
    DebugLog("___Sending " $ string(Index) $ " - " $ mapInfo.MapName);
    // End:0x68
    if(bDedicated)
    {
        ReceiveMapInfo(mapInfo);
        bWaitingForReply = true;
    }
    // End:0x7a
    else
    {
        MapList[MapList.Length] = mapInfo;
    }
}

function TickedReplication_MatchConfig(int Index, bool bDedicated)
{
    local MatchConfig MatchProfile;
    local PlayInfoData PIData;

    // End:0x153
    if(Index < 6)
    {
        MatchProfile = VH.MatchProfile;
        switch(Index)
        {
            // End:0x59
            case 0:
                SendClientResponse(GeneralID, UpdateID $ Chr(27) $ GameTypeID, MatchProfile.GameClassString);
                // End:0x143
                break;
            // End:0x7e
            case 1:
                SendClientResponse(MapID, UpdateID, MatchProfile.MapIndexList);
                // End:0x143
                break;
            // End:0xa4
            case 2:
                SendClientResponse(MutatorID, UpdateID, MatchProfile.MutatorIndexList);
                // End:0x143
                break;
            // End:0xd7
            case 3:
                SendClientResponse(GeneralID, UpdateID $ Chr(27) $ URLID, MatchProfile.Parameters);
                // End:0x143
                break;
            // End:0x10d
            case 4:
                SendClientResponse(GeneralID, UpdateID $ Chr(27) $ TournamentID, string(MatchProfile.bTournamentMode));
                // End:0x143
                break;
            // End:0x140
            case 5:
                SendClientResponse(GeneralID, UpdateID $ Chr(27) $ DemoRecID, MatchProfile.DemoRecFileName);
                // End:0x143
                break;
            // End:0xffff
            default:
                bWaitingForReply = bDedicated;
                // End:0x228 Break;
                break;
            }
    }
    DebugLog("___Sending " $ VH.MatchProfile.PInfo.Settings[Index - 6].SettingName);
    PIData = VH.MatchProfile.PInfo.Settings[Index - 6];
    // End:0x228
    if(PIData.ArrayDim == -1)
    {
        SendClientResponse(OptionID, AddID, PIData.SettingName $ Chr(27) $ string(PIData.ClassFrom) $ Chr(27) $ PIData.Value);
        bWaitingForReply = bDedicated;
    }
}

function TickedReplication_MapVoteCount(int Index, bool bDedicated)
{
    DebugLog("___Sending MapVoteCountIndex " $ string(Index));
    // End:0x5d
    if(bDedicated)
    {
        ReceiveMapVoteCount(VH.MapVoteCount[Index], true);
        bWaitingForReply = true;
    }
    // End:0x7e
    else
    {
        MapVoteCount[MapVoteCount.Length] = VH.MapVoteCount[Index];
    }
}

function TickedReplication_KickVoteCount(int Index, bool bDedicated)
{
    DebugLog("___Sending KickVoteCountIndex " $ string(Index));
    // End:0x5e
    if(bDedicated)
    {
        ReceiveKickVoteCount(VH.KickVoteCount[Index], true);
        bWaitingForReply = true;
    }
    // End:0x7f
    else
    {
        KickVoteCount[KickVoteCount.Length] = VH.KickVoteCount[Index];
    }
}

function TickedReplication_Maps(int Index, bool bDedicated)
{
    DebugLog("TickedReplication_Maps " $ string(Index) $ ", " $ VH.MatchProfile.Maps[Index].MapName);
    SendClientResponse(MapID, AddID, string(Index) $ "," $ VH.MatchProfile.Maps[Index].MapName);
    bWaitingForReply = bDedicated;
}

function TickedReplication_Mutators(int Index, bool bDedicated)
{
    local MatchConfig MatchProfile;
    local MutatorData M;

    MatchProfile = VH.MatchProfile;
    DebugLog("TickedReplication_Mutators " $ string(Index) $ ", " $ MatchProfile.Mutators[Index].ClassName);
    M.ClassName = MatchProfile.Mutators[Index].ClassName;
    M.FriendlyName = MatchProfile.Mutators[Index].FriendlyName;
    SendClientResponse(MutatorID, AddID, string(Index) $ "," $ M.ClassName $ Chr(27) $ M.FriendlyName);
    bWaitingForReply = bDedicated;
}

simulated function ReceiveGameConfig(MapVoteGameConfigLite p_GameConfig)
{
    GameConfig[GameConfig.Length] = p_GameConfig;
    DebugLog("___Receiving - " $ p_GameConfig.GameName);
    ReplicationReply();
}

simulated function ReceiveMapInfo(MapVoteMapList mapInfo)
{
    MapList[MapList.Length] = mapInfo;
    DebugLog("___Receiving - " $ mapInfo.MapName);
    ReplicationReply();
}

simulated function ReceiveMapVoteCount(MapVoteScore MVCData, bool bReply)
{
    local int i;
    local bool bFound;

    i = 0;
    J0x07:
    // End:0xa6 [While If]
    if(i < MapVoteCount.Length)
    {
        // End:0x9c
        if(MVCData.MapIndex == MapVoteCount[i].MapIndex && MVCData.GameConfigIndex == MapVoteCount[i].GameConfigIndex)
        {
            // End:0x76
            if(MVCData.VoteCount <= 0)
            {
                MapVoteCount.Remove(i, 1);
            }
            // End:0x91
            else
            {
                MapVoteCount[i].VoteCount = MVCData.VoteCount;
            }
            bFound = true;
        }
        // End:0xa6
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    // End:0xda
    if(!bFound)
    {
        i = MapVoteCount.Length;
        MapVoteCount.Insert(i, 1);
        MapVoteCount[i] = MVCData;
    }
    // End:0xec
    if(bReply)
    {
        ReplicationReply();
    }
    // End:0x1aa
    else
    {
        // End:0x1aa
        if(PlayerOwner != none && PlayerOwner.Player != none)
        {
            // End:0x157
            if(MapVotingPage(GetController().ActivePage) != none)
            {
                MapVotingPage(GetController().ActivePage).UpdateMapVoteCount(i, MVCData.VoteCount == 0);
            }
            // End:0x1aa
            if(MapInfoPage(GetController().ActivePage) != none)
            {
                MapVotingPage(GetController().ActivePage.ParentPage).UpdateMapVoteCount(i, MVCData.VoteCount == 0);
            }
        }
    }
}

simulated function ReceiveKickVoteCount(KickVoteScore KVCData, bool bReply)
{
    local int i;
    local bool bFound;

    i = 0;
    J0x07:
    // End:0x66 [While If]
    if(i < KickVoteCount.Length)
    {
        // End:0x5c
        if(KVCData.PlayerID == KickVoteCount[i].PlayerID)
        {
            KickVoteCount[i].KickVoteCount = KVCData.KickVoteCount;
            bFound = true;
        }
        // End:0x66
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    // End:0x9a
    if(!bFound)
    {
        i = KickVoteCount.Length;
        KickVoteCount.Insert(i, 1);
        KickVoteCount[i] = KVCData;
    }
    // End:0xac
    if(bReply)
    {
        ReplicationReply();
    }
    // End:0xef
    else
    {
        // End:0xef
        if(KickVotingPage(GetController().ActivePage) != none)
        {
            KickVotingPage(GetController().ActivePage).UpdateKickVoteCount(KickVoteCount[i]);
        }
    }
}

function ReplicationReply()
{
    bWaitingForReply = false;
    // End:0x37
    if(bSendingMatchSetup && TickedReplicationQueue.Length == 0)
    {
        SendClientResponse(StatusID, CompleteID);
        bSendingMatchSetup = false;
    }
}

function SendMapVote(int MapIndex, int p_GameIndex)
{
    DebugLog("MVRI.SendMapVote(" $ string(MapIndex) $ ", " $ string(p_GameIndex) $ ")");
    VH.SubmitMapVote(MapIndex, p_GameIndex, Owner);
}

function SendKickVote(int PlayerID)
{
    VH.SubmitKickVote(PlayerID, Owner);
}

simulated function CloseWindow()
{
    SetTimer(0.0, false);
    GetController().CloseAll(true);
}

simulated function OpenWindow()
{
    // End:0x54
    if(GetController().FindMenuByClass(class<GUIPage>(DynamicLoadObject(GetController().MapVotingMenu, class'Class'))) != none || GetController().FindMenuByClass(class'MapVotingPage') != none)
    {
        return;
    }
    GetController().OpenMenu(GetController().MapVotingMenu);
}

simulated function string GetMapNameString(int Index)
{
    // End:0x16
    if(Index >= MapList.Length)
    {
        return "";
    }
    // End:0x27
    else
    {
        return MapList[Index].MapName;
    }
}

function MatchSetupLogin(string UserID, string Password)
{
    local int SecLevel;

    // End:0x4a
    if(VH.MatchSetupLogin(UserID, Password, PlayerOwner, SecLevel))
    {
        bMatchSetupPermitted = true;
        SecurityLevel = SecLevel;
        SendClientResponse(LoginID, "1");
    }
    // End:0x5d
    else
    {
        bMatchSetupPermitted = false;
        SendClientResponse(LoginID);
    }
}

function MatchSetupLogout()
{
    bMatchSetupPermitted = false;
    bMatchSetupAccepted = false;
    bSendingMatchSetup = false;
    VH.MatchSetupLogout(PlayerOwner);
    SendClientResponse("logout");
}

function RequestMatchSettings(bool bRefreshMaps, bool bRefreshMutators)
{
    DebugLog("____RequestConfigSettings");
    // End:0xc2
    if(bMatchSetupPermitted)
    {
        bMatchSetupAccepted = false;
        bSendingMatchSetup = true;
        // End:0x66
        if(bRefreshMaps)
        {
            AddToTickedReplicationQueue(5, VH.MatchProfile.Maps.Length - 1);
        }
        // End:0x92
        if(bRefreshMutators)
        {
            AddToTickedReplicationQueue(6, VH.MatchProfile.Mutators.Length - 1);
        }
        AddToTickedReplicationQueue(4, VH.MatchProfile.PInfo.Settings.Length + 5);
    }
    // End:0xd2
    else
    {
        SendClientResponse(MatchSetupID, FailedID);
    }
}

function SendClientResponse(string Identifier, optional string Response, optional string Data)
{
    // End:0x0e
    if(Identifier == "")
    {
        return;
    }
    // End:0x2d
    if(Response != "")
    {
        Identifier $= ":" $ Response;
    }
    // End:0x4c
    if(Data != "")
    {
        Identifier $= ";" $ Data;
    }
    SendResponse(Identifier);
}

function ReceiveCommand(string Command)
{
    local string Type, Info, Data;

    DecodeCommand(Command, Type, Info, Data);
    HandleCommand(Type, Info, Data);
}

static function DecodeCommand(string Response, out string Type, out string Info, out string Data)
{
    local string str;

    Type = "";
    Info = "";
    Data = "";
    // End:0x26
    if(Response == "")
    {
        return;
    }
    // End:0x64
    if(Divide(Response, ":", Type, str))
    {
        // End:0x61
        if(!Divide(str, ";", Info, Data))
        {
            Info = str;
        }
    }
    // End:0x6f
    else
    {
        Type = Response;
    }
}

function HandleCommand(string Type, string Info, string Data)
{
    local bool bPropagate;

    // End:0x0e
    if(Type == "")
    {
        return;
    }
    Log("HandleCommand Type: '" $ Type $ "'   Info: '" $ Info $ "'   Data: '" $ Data $ "'", 'MapVoteDebug');
    switch(Type)
    {
        // End:0xb0
        case MapID:
            // End:0xad
            if(bMatchSetupPermitted)
            {
                bMatchSetupAccepted = false;
                bPropagate = VH.MatchProfile.ChangeSetting(Type, Info);
            }
            // End:0x15f
            break;
        // End:0xf5
        case MutatorID:
            // End:0xf2
            if(bMatchSetupPermitted)
            {
                bMatchSetupAccepted = false;
                bPropagate = VH.MatchProfile.ChangeSetting(Type, Info);
            }
            // End:0x15f
            break;
        // End:0x15c
        case GeneralID:
            // End:0x159
            if(bMatchSetupPermitted)
            {
                bMatchSetupAccepted = false;
                switch(Info)
                {
                    // End:0x11d
                    case OptionID:
                    // End:0x125
                    case TournamentID:
                    // End:0x156
                    case DemoRecID:
                        bPropagate = VH.MatchProfile.ChangeSetting(Info, Data);
                    // End:0xffff
                    default:
                    }
                    // This is an implied JumpToken;
                    goto J0x15f;
            // End:0xffff
            default:
            // End:0x187
            if(bPropagate)
            {
                VH.PropagateValue(self, Type, Info, Data);
            }
}

simulated function SendResponse(string Response)
{
    super.SendResponse(Response);
    ReplicationReply();
}

function MatchSettingsSubmit()
{
    local int i;
    local bool bAllAccepted;

    DebugLog("____MatchSettingsSubmit()");
    // End:0xe9
    if(bMatchSetupPermitted)
    {
        bAllAccepted = true;
        bMatchSetupAccepted = true;
        i = 0;
        J0x41:
        // End:0xb5 [While If]
        if(i < VH.MVRI.Length)
        {
            // End:0xab
            if(VH.MVRI[i].bMatchSetupPermitted && !VH.MVRI[i].bMatchSetupAccepted)
            {
                bAllAccepted = false;
            }
            // End:0xb5
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x41;
            }
        }
        // End:0xd9
        if(bAllAccepted)
        {
            VH.MatchProfile.StartMatch();
        }
        // End:0xe9
        else
        {
            SendClientResponse(StatusID, lmsgNotAllAccepted);
        }
    }
}

function SaveAsDefault()
{
    DebugLog("____SaveAsDefault()");
    // End:0x69
    if(bMatchSetupPermitted && PlayerOwner.PlayerReplicationInfo.bAdmin)
    {
        VH.MatchProfile.SaveDefault();
        SendClientResponse(StatusID, lmsgSavedAsDefaultSuccess);
    }
}

function RestoreDefaultProfile()
{
    local MatchConfig MatchProfile;

    DebugLog("____RestoreDefaultProfile()");
    // End:0x54
    if(bMatchSetupPermitted)
    {
        MatchProfile = VH.MatchProfile;
        MatchProfile.RestoreDefault(PlayerOwner);
    }
}

simulated function PlayCountDown(int Count)
{
    local float t;

    // End:0x55
    if(Count > 10 && Count <= 60 && CountDownSounds[Count - 1] != 'None')
    {
        PlayerOwner.PlayStatusAnnouncement(string(CountDownSounds[Count - 1]), 1);
    }
    // End:0xe1
    if(Count == 10)
    {
        t = GetSoundDuration(PlayerOwner.StatusAnnouncer.PrecacheSound(string(CountDownSounds[9])));
        // End:0xae
        if(t + 0.150 < float(1))
        {
            t = 1.0;
        }
        SetTimer(t + 0.150, false);
        PlayerOwner.PlayStatusAnnouncement(string(CountDownSounds[9]), 1);
        CountDown = 9;
    }
}

simulated function Timer()
{
    local float t;

    t = GetSoundDuration(PlayerOwner.StatusAnnouncer.PrecacheSound(string(CountDownSounds[CountDown - 1])));
    // End:0x53
    if(t + 0.150 < float(1))
    {
        t = 1.0;
    }
    PlayerOwner.PlayStatusAnnouncement(string(CountDownSounds[CountDown - 1]), 1);
    -- CountDown;
    // End:0x96
    if(CountDown > 0)
    {
        SetTimer(t + 0.150, false);
    }
}

function RequestPlayerIP(string PlayerName)
{
    local PlayerController P;

    // End:0x75
    if(PlayerOwner.PlayerReplicationInfo.bAdmin)
    {
        // End:0x74
        foreach DynamicActors(class'PlayerController', P)
        {
            // End:0x73
            if(P.PlayerReplicationInfo.PlayerName ~= PlayerName)
            {
                SendPlayerID(P.GetPlayerNetworkAddress(), P.GetPlayerIDHash());
            }
            // End:0x74
            else
            {
                continue;
            }            
        }
    }
}

simulated function SendPlayerID(string IPAddress, string PlayerID)
{
    local export editinline KickInfoPage Page;

    Page = KickInfoPage(GetController().ActivePage);
    // End:0x7b
    if(Page != none)
    {
        Page.lb_PlayerInfoBox.Add(class'KickInfoPage'.default.IPText, IPAddress);
        Page.lb_PlayerInfoBox.Add(class'KickInfoPage'.default.IDText, PlayerID);
    }
}

simulated function DebugLog(string Text)
{
    // End:0x15
    if(bDebugLog)
    {
        Log(Text, 'MapVoteDebug');
    }
}

simulated function bool MatchSetupLocked()
{
    return !bMatchSetupPermitted;
}

simulated function bool MapVoteEnabled()
{
    return bMapVote;
}

simulated function bool KickVoteEnabled()
{
    return bKickVote;
}

simulated function bool MatchSetupEnabled()
{
    return bMatchSetup;
}

defaultproperties
{
    MapVote=-1
    GameVote=-1
    KickVote=-1
    CountDownSounds[0]=one
    CountDownSounds[1]=two
    CountDownSounds[2]=three
    CountDownSounds[3]=four
    CountDownSounds[4]=five
    CountDownSounds[5]=six
    CountDownSounds[6]=seven
    CountDownSounds[7]=eight
    CountDownSounds[8]=nine
    CountDownSounds[9]=ten
    CountDownSounds[19]=20_seconds
    CountDownSounds[29]=30_seconds_remain
    CountDownSounds[59]=1_minute_remains
    lmsgSavedAsDefaultSuccess="????? ????? ??????"
    lmsgNotAllAccepted="??? ????? ???????. ?? ???? ?????? ?????."
    MapID="map"
    MutatorID="mutator"
    OptionID="option"
    GeneralID="general"
    URLID="url"
    StatusID="status"
    MatchSetupID="matchsetup"
    LoginID="login"
    CompleteID="done"
    AddID="add"
    RemoveID="remove"
    UpdateID="update"
    FailedID="failed"
    TournamentID="tournament"
    DemoRecID="demorec"
    GameTypeID="game"
    ProcessCommand=ReceiveCommand
    bOnlyRelevantToOwner=true
    NetUpdateFrequency=1.0
    bNetNotify=true
}