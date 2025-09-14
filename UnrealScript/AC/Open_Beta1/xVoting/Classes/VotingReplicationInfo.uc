class VotingReplicationInfo extends VotingReplicationInfoBase
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum RepDataType
{
    REPDATATYPE_GameConfig,         // 0
    REPDATATYPE_MapList,            // 1
    REPDATATYPE_MapVoteCount,       // 2
    REPDATATYPE_KickVoteCount,      // 3
    REPDATATYPE_MatchConfig,        // 4
    REPDATATYPE_Maps,               // 5
    REPDATATYPE_Mutators            // 6
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
    // Pos:0x000
    reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
        CurrentGameConfig, GameConfigCount, 
        MapCount, PlayerOwner, 
        bKickVote, bMapVote, 
        bMatchSetup;

    // Pos:0x018
    reliable if((int(Role) == int(ROLE_Authority)) && bMapVote)
        CloseWindow, Mode, 
        OpenWindow, PlayCountDown, 
        ReceiveGameConfig, ReceiveKickVoteCount, 
        ReceiveMapInfo, ReceiveMapVoteCount;

    // Pos:0x030
    reliable if((int(Role) == int(ROLE_Authority)) && bKickVote)
        SendPlayerID;

    // Pos:0x048
    reliable if((int(Role) == int(ROLE_Authority)) && bMatchSetup)
        SecurityLevel, bMatchSetupAccepted, 
        bMatchSetupPermitted;

    // Pos:0x060
    reliable if(int(Role) < int(ROLE_Authority))
        MatchSettingsSubmit, MatchSetupLogin, 
        MatchSetupLogout, ReplicationReply, 
        RequestMatchSettings, RequestPlayerIP, 
        RestoreDefaultProfile, SaveAsDefault, 
        SendKickVote, SendMapVote;
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    PlayerOwner = PlayerController(Owner);
    VH = xVotingHandler(Level.Game.VotingHandler);
    //return;    
}

simulated event PostNetBeginPlay()
{
    DebugLog("____VotingReplicationInfo.PostNetBeginPlay");
    super(Actor).PostNetBeginPlay();
    GetServerData();
    //return;    
}

simulated event PostNetReceive()
{
    bNetNotify = NeedNetNotify();
    // End:0x2D
    if(!bNetNotify && Owner == none)
    {
        SetOwner(PlayerOwner);
    }
    //return;    
}

simulated function bool NeedNetNotify()
{
    return PlayerOwner == none;
    //return;    
}

simulated function GUIController GetController()
{
    // End:0x72
    if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_Client))
    {
        // End:0x72
        if((PlayerOwner != none) && PlayerOwner.Player != none)
        {
            return GUIController(PlayerOwner.Player.GUIController);
        }
    }
    return none;
    //return;    
}

simulated function GetServerData()
{
    // End:0x181
    if(int(Level.NetMode) != int(NM_Client))
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
            Mode += byte(int(byte(VH.bScoreMode)) * 2);
            Mode += byte(int(byte(VH.bAccumulationMode)) * 4);
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
    //return;    
}

simulated function Tick(float DeltaTime)
{
    local int i;
    local bool bDedicated, bListening;

    // End:0x19
    if((TickedReplicationQueue.Length == 0) || bWaitingForReply)
    {
        return;
    }
    bDedicated = (int(Level.NetMode) == int(NM_DedicatedServer)) || ((int(Level.NetMode) == int(NM_ListenServer)) && PlayerOwner != none) && PlayerOwner.Player.Console == none;
    bListening = ((int(Level.NetMode) == int(NM_ListenServer)) && PlayerOwner != none) && PlayerOwner.Player.Console != none;
    // End:0xE0
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
        // End:0x16D
        case 2:
            TickedReplication_MapVoteCount(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x191
        case 3:
            TickedReplication_KickVoteCount(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x1B5
        case 4:
            TickedReplication_MatchConfig(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x1D9
        case 5:
            TickedReplication_Maps(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0x1FD
        case 6:
            TickedReplication_Mutators(TickedReplicationQueue[i].Index, bDedicated);
            // End:0x200
            break;
        // End:0xFFFF
        default:
            break;
    }
    TickedReplicationQueue[i].Index++;
    // End:0x243
    if(TickedReplicationQueue[i].Index > TickedReplicationQueue[i].Last)
    {
        TickedReplicationQueue.Remove(i, 1);
    }
    //return;    
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
    //return;    
}

function TickedReplication_GameConfig(int Index, bool bDedicated)
{
    local MapVoteGameConfigLite GameConfigItem;

    GameConfigItem = VH.GetGameConfig(Index);
    DebugLog((("___Sending " $ string(Index)) $ " - ") $ GameConfigItem.GameName);
    // End:0x68
    if(bDedicated)
    {
        ReceiveGameConfig(GameConfigItem);
        bWaitingForReply = true;        
    }
    else
    {
        GameConfig[GameConfig.Length] = GameConfigItem;
    }
    //return;    
}

function TickedReplication_MapList(int Index, bool bDedicated)
{
    local MapVoteMapList mapInfo;

    mapInfo = VH.GetMapList(Index);
    DebugLog((("___Sending " $ string(Index)) $ " - ") $ mapInfo.MapName);
    // End:0x68
    if(bDedicated)
    {
        ReceiveMapInfo(mapInfo);
        bWaitingForReply = true;        
    }
    else
    {
        MapList[MapList.Length] = mapInfo;
    }
    //return;    
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
                SendClientResponse(GeneralID, (UpdateID $ Chr(27)) $ GameTypeID, MatchProfile.GameClassString);
                // End:0x143
                break;
            // End:0x7E
            case 1:
                SendClientResponse(MapID, UpdateID, MatchProfile.MapIndexList);
                // End:0x143
                break;
            // End:0xA4
            case 2:
                SendClientResponse(MutatorID, UpdateID, MatchProfile.MutatorIndexList);
                // End:0x143
                break;
            // End:0xD7
            case 3:
                SendClientResponse(GeneralID, (UpdateID $ Chr(27)) $ URLID, MatchProfile.Parameters);
                // End:0x143
                break;
            // End:0x10D
            case 4:
                SendClientResponse(GeneralID, (UpdateID $ Chr(27)) $ TournamentID, string(MatchProfile.bTournamentMode));
                // End:0x143
                break;
            // End:0x140
            case 5:
                SendClientResponse(GeneralID, (UpdateID $ Chr(27)) $ DemoRecID, MatchProfile.DemoRecFileName);
                // End:0x143
                break;
            // End:0xFFFF
            default:
                break;
        }
        bWaitingForReply = bDedicated;        
    }
    else
    {
        DebugLog("___Sending " $ VH.MatchProfile.PInfo.Settings[Index - 6].SettingName);
        PIData = VH.MatchProfile.PInfo.Settings[Index - 6];
        // End:0x228
        if(PIData.ArrayDim == -1)
        {
            SendClientResponse(OptionID, AddID, (((PIData.SettingName $ Chr(27)) $ string(PIData.ClassFrom)) $ Chr(27)) $ PIData.Value);
            bWaitingForReply = bDedicated;
        }
    }
    //return;    
}

function TickedReplication_MapVoteCount(int Index, bool bDedicated)
{
    DebugLog("___Sending MapVoteCountIndex " $ string(Index));
    // End:0x5D
    if(bDedicated)
    {
        ReceiveMapVoteCount(VH.MapVoteCount[Index], true);
        bWaitingForReply = true;        
    }
    else
    {
        MapVoteCount[MapVoteCount.Length] = VH.MapVoteCount[Index];
    }
    //return;    
}

function TickedReplication_KickVoteCount(int Index, bool bDedicated)
{
    DebugLog("___Sending KickVoteCountIndex " $ string(Index));
    // End:0x5E
    if(bDedicated)
    {
        ReceiveKickVoteCount(VH.KickVoteCount[Index], true);
        bWaitingForReply = true;        
    }
    else
    {
        KickVoteCount[KickVoteCount.Length] = VH.KickVoteCount[Index];
    }
    //return;    
}

function TickedReplication_Maps(int Index, bool bDedicated)
{
    DebugLog((("TickedReplication_Maps " $ string(Index)) $ ", ") $ VH.MatchProfile.Maps[Index].MapName);
    SendClientResponse(MapID, AddID, (string(Index) $ ",") $ VH.MatchProfile.Maps[Index].MapName);
    bWaitingForReply = bDedicated;
    //return;    
}

function TickedReplication_Mutators(int Index, bool bDedicated)
{
    local MatchConfig MatchProfile;
    local MutatorData M;

    MatchProfile = VH.MatchProfile;
    DebugLog((("TickedReplication_Mutators " $ string(Index)) $ ", ") $ MatchProfile.Mutators[Index].ClassName);
    M.ClassName = MatchProfile.Mutators[Index].ClassName;
    M.FriendlyName = MatchProfile.Mutators[Index].FriendlyName;
    SendClientResponse(MutatorID, AddID, (((string(Index) $ ",") $ M.ClassName) $ Chr(27)) $ M.FriendlyName);
    bWaitingForReply = bDedicated;
    //return;    
}

simulated function ReceiveGameConfig(MapVoteGameConfigLite p_GameConfig)
{
    GameConfig[GameConfig.Length] = p_GameConfig;
    DebugLog("___Receiving - " $ p_GameConfig.GameName);
    ReplicationReply();
    //return;    
}

simulated function ReceiveMapInfo(MapVoteMapList mapInfo)
{
    MapList[MapList.Length] = mapInfo;
    DebugLog("___Receiving - " $ mapInfo.MapName);
    ReplicationReply();
    //return;    
}

simulated function ReceiveMapVoteCount(MapVoteScore MVCData, bool bReply)
{
    local int i;
    local bool bFound;

    i = 0;
    J0x07:

    // End:0xA6 [Loop If]
    if(i < MapVoteCount.Length)
    {
        // End:0x9C
        if((MVCData.MapIndex == MapVoteCount[i].MapIndex) && MVCData.GameConfigIndex == MapVoteCount[i].GameConfigIndex)
        {
            // End:0x76
            if(MVCData.VoteCount <= 0)
            {
                MapVoteCount.Remove(i, 1);                
            }
            else
            {
                MapVoteCount[i].VoteCount = MVCData.VoteCount;
            }
            bFound = true;
            // [Explicit Break]
            goto J0xA6;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xA6:

    // End:0xDA
    if(!bFound)
    {
        i = MapVoteCount.Length;
        MapVoteCount.Insert(i, 1);
        MapVoteCount[i] = MVCData;
    }
    // End:0xEC
    if(bReply)
    {
        ReplicationReply();        
    }
    else
    {
        // End:0x1AA
        if((PlayerOwner != none) && PlayerOwner.Player != none)
        {
            // End:0x157
            if(MapVotingPage(GetController().ActivePage) != none)
            {
                MapVotingPage(GetController().ActivePage).UpdateMapVoteCount(i, MVCData.VoteCount == 0);
            }
            // End:0x1AA
            if(MapInfoPage(GetController().ActivePage) != none)
            {
                MapVotingPage(GetController().ActivePage.ParentPage).UpdateMapVoteCount(i, MVCData.VoteCount == 0);
            }
        }
    }
    //return;    
}

simulated function ReceiveKickVoteCount(KickVoteScore KVCData, bool bReply)
{
    local int i;
    local bool bFound;

    i = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(i < KickVoteCount.Length)
    {
        // End:0x5C
        if(KVCData.PlayerID == KickVoteCount[i].PlayerID)
        {
            KickVoteCount[i].KickVoteCount = KVCData.KickVoteCount;
            bFound = true;
            // [Explicit Break]
            goto J0x66;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x66:

    // End:0x9A
    if(!bFound)
    {
        i = KickVoteCount.Length;
        KickVoteCount.Insert(i, 1);
        KickVoteCount[i] = KVCData;
    }
    // End:0xAC
    if(bReply)
    {
        ReplicationReply();        
    }
    else
    {
        // End:0xEF
        if(KickVotingPage(GetController().ActivePage) != none)
        {
            KickVotingPage(GetController().ActivePage).UpdateKickVoteCount(KickVoteCount[i]);
        }
    }
    //return;    
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
    //return;    
}

function SendMapVote(int MapIndex, int p_GameIndex)
{
    DebugLog(((("MVRI.SendMapVote(" $ string(MapIndex)) $ ", ") $ string(p_GameIndex)) $ ")");
    VH.SubmitMapVote(MapIndex, p_GameIndex, Owner);
    //return;    
}

function SendKickVote(int PlayerID)
{
    VH.SubmitKickVote(PlayerID, Owner);
    //return;    
}

simulated function CloseWindow()
{
    SetTimer(0.0000000, false);
    GetController().CloseAll(true);
    //return;    
}

simulated function OpenWindow()
{
    // End:0x54
    if((GetController().FindMenuByClass(Class<GUIPage>(DynamicLoadObject(GetController().MapVotingMenu, Class'Core.Class'))) != none) || GetController().FindMenuByClass(Class'xVoting_Decompressed.MapVotingPage') != none)
    {
        return;
    }
    GetController().OpenMenu(GetController().MapVotingMenu);
    //return;    
}

simulated function string GetMapNameString(int Index)
{
    // End:0x16
    if(Index >= MapList.Length)
    {
        return "";        
    }
    else
    {
        return MapList[Index].MapName;
    }
    //return;    
}

function MatchSetupLogin(string UserID, string Password)
{
    local int SecLevel;

    // End:0x4A
    if(VH.MatchSetupLogin(UserID, Password, PlayerOwner, SecLevel))
    {
        bMatchSetupPermitted = true;
        SecurityLevel = SecLevel;
        SendClientResponse(LoginID, "1");        
    }
    else
    {
        bMatchSetupPermitted = false;
        SendClientResponse(LoginID);
    }
    //return;    
}

function MatchSetupLogout()
{
    bMatchSetupPermitted = false;
    bMatchSetupAccepted = false;
    bSendingMatchSetup = false;
    VH.MatchSetupLogout(PlayerOwner);
    SendClientResponse("logout");
    //return;    
}

function RequestMatchSettings(bool bRefreshMaps, bool bRefreshMutators)
{
    DebugLog("____RequestConfigSettings");
    // End:0xC2
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
    else
    {
        SendClientResponse(MatchSetupID, FailedID);
    }
    //return;    
}

function SendClientResponse(string Identifier, optional string Response, optional string Data)
{
    // End:0x0E
    if(Identifier == "")
    {
        return;
    }
    // End:0x2D
    if(Response != "")
    {
        Identifier $= (":" $ Response);
    }
    // End:0x4C
    if(Data != "")
    {
        Identifier $= (";" $ Data);
    }
    SendResponse(Identifier);
    //return;    
}

function ReceiveCommand(string Command)
{
    local string Type, Info, Data;

    DecodeCommand(Command, Type, Info, Data);
    HandleCommand(Type, Info, Data);
    //return;    
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
    else
    {
        Type = Response;
    }
    //return;    
}

function HandleCommand(string Type, string Info, string Data)
{
    local bool bPropagate;

    // End:0x0E
    if(Type == "")
    {
        return;
    }
    Log(((((("HandleCommand Type: '" $ Type) $ "'   Info: '") $ Info) $ "'   Data: '") $ Data) $ "'", 'MapVoteDebug');
    switch(Type)
    {
        // End:0xB0
        case MapID:
            // End:0xAD
            if(bMatchSetupPermitted)
            {
                bMatchSetupAccepted = false;
                bPropagate = VH.MatchProfile.ChangeSetting(Type, Info);
            }
            // End:0x15F
            break;
        // End:0xF5
        case MutatorID:
            // End:0xF2
            if(bMatchSetupPermitted)
            {
                bMatchSetupAccepted = false;
                bPropagate = VH.MatchProfile.ChangeSetting(Type, Info);
            }
            // End:0x15F
            break;
        // End:0x15C
        case GeneralID:
            // End:0x159
            if(bMatchSetupPermitted)
            {
                bMatchSetupAccepted = false;
                switch(Info)
                {
                    // End:0x11D
                    case OptionID:
                    // End:0x125
                    case TournamentID:
                    // End:0x156
                    case DemoRecID:
                        bPropagate = VH.MatchProfile.ChangeSetting(Info, Data);
                    // End:0xFFFF
                    default:
                        break;
                    }
            }
            else
            {
                // End:0x15F
                break;/* !MISMATCHING REMOVE, tried Case got Type:Else Position:0x159! */
            // End:0xFFFF
            default:
                break;
        }/* !MISMATCHING REMOVE, tried Switch got Type:Case Position:0x0F5! */
        // End:0x187
        if(bPropagate)
        {
            VH.PropagateValue(self, Type, Info, Data);
        }
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:Switch Position:0x064! */
}

simulated function SendResponse(string Response)
{
    super.SendResponse(Response);
    ReplicationReply();
    //return;    
}

function MatchSettingsSubmit()
{
    local int i;
    local bool bAllAccepted;

    DebugLog("____MatchSettingsSubmit()");
    // End:0xE9
    if(bMatchSetupPermitted)
    {
        bAllAccepted = true;
        bMatchSetupAccepted = true;
        i = 0;
        J0x41:

        // End:0xB5 [Loop If]
        if(i < VH.MVRI.Length)
        {
            // End:0xAB
            if(VH.MVRI[i].bMatchSetupPermitted && !VH.MVRI[i].bMatchSetupAccepted)
            {
                bAllAccepted = false;
                // [Explicit Break]
                goto J0xB5;
            }
            i++;
            // [Loop Continue]
            goto J0x41;
        }
        J0xB5:

        // End:0xD9
        if(bAllAccepted)
        {
            VH.MatchProfile.StartMatch();            
        }
        else
        {
            SendClientResponse(StatusID, lmsgNotAllAccepted);
        }
    }
    //return;    
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
    //return;    
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
    //return;    
}

simulated function PlayCountDown(int Count)
{
    local float t;

    // End:0x55
    if(((Count > 10) && Count <= 60) && CountDownSounds[Count - 1] != 'None')
    {
        PlayerOwner.PlayStatusAnnouncement(string(CountDownSounds[Count - 1]), 1);
    }
    // End:0xE1
    if(Count == 10)
    {
        t = GetSoundDuration(PlayerOwner.StatusAnnouncer.PrecacheSound(string(CountDownSounds[9])));
        // End:0xAE
        if((t + 0.1500000) < float(1))
        {
            t = 1.0000000;
        }
        SetTimer(t + 0.1500000, false);
        PlayerOwner.PlayStatusAnnouncement(string(CountDownSounds[9]), 1);
        CountDown = 9;
    }
    //return;    
}

simulated function Timer()
{
    local float t;

    t = GetSoundDuration(PlayerOwner.StatusAnnouncer.PrecacheSound(string(CountDownSounds[CountDown - 1])));
    // End:0x53
    if((t + 0.1500000) < float(1))
    {
        t = 1.0000000;
    }
    PlayerOwner.PlayStatusAnnouncement(string(CountDownSounds[CountDown - 1]), 1);
    CountDown--;
    // End:0x96
    if(CountDown > 0)
    {
        SetTimer(t + 0.1500000, false);
    }
    //return;    
}

function RequestPlayerIP(string PlayerName)
{
    local PlayerController P;

    // End:0x75
    if(PlayerOwner.PlayerReplicationInfo.bAdmin)
    {
        // End:0x74
        foreach DynamicActors(Class'Engine.PlayerController', P)
        {
            // End:0x73
            if(P.PlayerReplicationInfo.PlayerName ~= PlayerName)
            {
                SendPlayerID(P.GetPlayerNetworkAddress(), P.GetPlayerIDHash());
                // End:0x74
                break;
            }            
        }        
    }
    //return;    
}

simulated function SendPlayerID(string IPAddress, string PlayerID)
{
    local export editinline KickInfoPage Page;

    Page = KickInfoPage(GetController().ActivePage);
    // End:0x7B
    if(Page != none)
    {
        Page.lb_PlayerInfoBox.Add(Class'xVoting_Decompressed.KickInfoPage'.default.IPText, IPAddress);
        Page.lb_PlayerInfoBox.Add(Class'xVoting_Decompressed.KickInfoPage'.default.IDText, PlayerID);
    }
    //return;    
}

simulated function DebugLog(string Text)
{
    // End:0x15
    if(bDebugLog)
    {
        Log(Text, 'MapVoteDebug');
    }
    //return;    
}

simulated function bool MatchSetupLocked()
{
    return !bMatchSetupPermitted;
    //return;    
}

simulated function bool MapVoteEnabled()
{
    return bMapVote;
    //return;    
}

simulated function bool KickVoteEnabled()
{
    return bKickVote;
    //return;    
}

simulated function bool MatchSetupEnabled()
{
    return bMatchSetup;
    //return;    
}

defaultproperties
{
    MapVote=-1
    GameVote=-1
    KickVote=-1
    CountDownSounds[0]="one"
    CountDownSounds[1]="two"
    CountDownSounds[2]="three"
    CountDownSounds[3]="four"
    CountDownSounds[4]="five"
    CountDownSounds[5]="six"
    CountDownSounds[6]="seven"
    CountDownSounds[7]="eight"
    CountDownSounds[8]="nine"
    CountDownSounds[9]="ten"
    CountDownSounds[19]="20_seconds"
    CountDownSounds[29]="30_seconds_remain"
    CountDownSounds[59]="1_minute_remains"
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
    ProcessCommand=VotingReplicationInfo.ReceiveCommand
    bOnlyRelevantToOwner=true
    NetUpdateFrequency=1.0000000
    bNetNotify=true
}