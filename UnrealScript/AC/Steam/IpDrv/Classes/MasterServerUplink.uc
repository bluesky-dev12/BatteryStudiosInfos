/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\MasterServerUplink.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Enums:3
 *	Structs:1
 *	Properties:19
 *	Functions:9
 *
 *******************************************************************************/
class MasterServerUplink extends MasterServerLink
    dependson(MasterServerLink)
    dependson(MasterServerGameStats)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient;

const MSUPROPNUM = 3;

enum EServerToMaster
{
    STM_ClientResponse,
    STM_GameState,
    STM_Stats,
    STM_ClientDisconnectFailed,
    STM_MD5Version,
    STM_CheckOptionReply
};

enum EMasterToServer
{
    MTS_ClientChallenge,
    MTS_ClientAuthFailed,
    MTS_Shutdown,
    MTS_MatchID,
    MTS_MD5Update,
    MTS_UpdateOption,
    MTS_CheckOption,
    MTS_ClientMD5Fail,
    MTS_ClientBanned,
    MTS_ClientDupKey,
    MTS_UTANBan
};

enum EHeartbeatType
{
    HB_QueryInterface,
    HB_GamePort,
    HB_GamespyQueryPort
};

struct native export MD5UpdateData
{
    var string Guid;
    var string MD5;
    var int Revision;
};

var bool bInitialStateCached;
var ServerResponseLine ServerState;
var ServerResponseLine FullCachedServerState;
var ServerResponseLine CachedServerState;
var float CacheRefreshTime;
var int CachePlayerCount;
var MasterServerGameStats GameStats;
var UdpLink GamespyQueryLink;
var const int MatchID;
var float ReconnectTime;
var bool bReconnectPending;
var bool DoUplink;
var bool UplinkToGamespy;
var bool SendStats;
var bool ServerBehindNAT;
var bool DoLANBroadcast;
var bool bIgnoreUTANBans;
var localized string MSUPropText[3];
var localized string MSUPropDesc[3];

// Export UMasterServerUplink::execReconnect(FFrame&, void* const)
native function Reconnect();
// Export UMasterServerUplink::execForceGameStateRefresh(FFrame&, void* const)
native function ForceGameStateRefresh(int When);
event BeginPlay()
{
    local class<UdpLink> LinkClass;

    // End:0x143
    if(DoUplink)
    {
        // End:0x99
        if(UplinkToGamespy)
        {
            LinkClass = class<UdpLink>(DynamicLoadObject("IpDrv.UdpGamespyQuery", class'Class'));
            // End:0x58
            if(LinkClass != none)
            {
                GamespyQueryLink = Spawn(LinkClass);
            }
            LinkClass = class<UdpLink>(DynamicLoadObject("IpDrv.UdpGamespyUplink", class'Class'));
            // End:0x99
            if(LinkClass != none)
            {
                Spawn(LinkClass);
            }
        }
        // End:0x143
        if(SendStats)
        {
            // End:0xe4
            foreach AllActors(class'MasterServerGameStats', GameStats)
            {
                // End:0xd9
                if(GameStats.Uplink == none)
                {
                    GameStats.Uplink = self;
                }
                // End:0xe0
                else
                {
                    GameStats = none;
                }
                // End:0xe4
                break;                                
            }
            // End:0x143
            if(GameStats == none)
            {
                Log("MasterServerUplink: MasterServerGameStats not found - stats uploading disabled.");
            }
        }
    }
    Reconnect();
}

event ConnectionFailed(bool bShouldReconnect)
{
    Log("Master server connection failed");
    bReconnectPending = bShouldReconnect;
    // End:0x8b
    if(bShouldReconnect)
    {
        // End:0x63
        if(ActiveMasterServerList.Length > 0 && LastMSIndex < ActiveMasterServerList.Length)
        {
            ActiveMasterServerList.Remove(LastMSIndex, 1);
        }
        // End:0x7d
        if(ActiveMasterServerList.Length == 0)
        {
            ReconnectTime = 10.0;
        }
        // End:0x88
        else
        {
            ReconnectTime = 2.0;
        }
    }
    // End:0x96
    else
    {
        ReconnectTime = 0.0;
    }
}

event Refresh()
{
    // End:0xb7
    if(!bInitialStateCached || Level.TimeSeconds > CacheRefreshTime)
    {
        Level.Game.GetServerInfo(FullCachedServerState);
        Level.Game.GetServerDetails(FullCachedServerState);
        CachedServerState = FullCachedServerState;
        Level.Game.GetServerPlayers(FullCachedServerState);
        ServerState = FullCachedServerState;
        CacheRefreshTime = Level.TimeSeconds + float(60);
        bInitialStateCached = false;
    }
    // End:0x119
    else
    {
        // End:0x10e
        if(Level.Game.NumPlayers != CachePlayerCount)
        {
            ServerState = CachedServerState;
            Level.Game.GetServerPlayers(ServerState);
            FullCachedServerState = ServerState;
        }
        // End:0x119
        else
        {
            ServerState = FullCachedServerState;
        }
    }
    CachePlayerCount = Level.Game.NumPlayers;
}

// Export UMasterServerUplink::execLogStatLine(FFrame&, void* const)
native event bool LogStatLine(string StatLine);
simulated function Tick(float Delta)
{
    super.Tick(Delta);
    // End:0x6a
    if(bReconnectPending)
    {
        ReconnectTime -= Delta;
        // End:0x6a
        if(ReconnectTime <= 0.0)
        {
            Log("Attempting to reconnect to master server!");
            bReconnectPending = false;
            Reconnect();
        }
    }
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.ServerGroup, "DoUplink", default.MSUPropText[0], byte(255), 1, "Check",,, true);
    PlayInfo.AddSetting(default.ServerGroup, "bIgnoreUTANBans", default.MSUPropText[2], byte(255), 1, "Check",,, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1c
        case "DoUplink":
            return default.MSUPropDesc[0];
        // End:0x32
        case "SendStats":
            return default.MSUPropDesc[1];
        // End:0x4f
        case "bIgnoreUTANBans":
            return default.MSUPropDesc[2];
        // End:0xffff
        default:
            return super(Info).GetDescriptionText(PropName);
    }
}

defaultproperties
{
    CachePlayerCount=-1
    DoUplink=true
    UplinkToGamespy=true
    SendStats=true
    MSUPropText[0]="?????? ??"
    MSUPropText[1]="?? ??"
    MSUPropText[2]="Ignore UTAN Bans"
    MSUPropDesc[0]="??? ??? ??? ?? ????? ?? ???."
    MSUPropDesc[1]="??? ??? ?? ???? ?? ????? UT2004 ?? ????? ?????."
    MSUPropDesc[2]="If true, your server will ignore UTAN based bans coming from the master server."
}