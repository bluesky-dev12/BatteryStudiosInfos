class MasterServerUplink extends MasterServerLink
    transient
    native
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const MSUPROPNUM = 3;

enum EServerToMaster
{
    STM_ClientResponse,             // 0
    STM_GameState,                  // 1
    STM_Stats,                      // 2
    STM_ClientDisconnectFailed,     // 3
    STM_MD5Version,                 // 4
    STM_CheckOptionReply            // 5
};

enum EMasterToServer
{
    MTS_ClientChallenge,            // 0
    MTS_ClientAuthFailed,           // 1
    MTS_Shutdown,                   // 2
    MTS_MatchID,                    // 3
    MTS_MD5Update,                  // 4
    MTS_UpdateOption,               // 5
    MTS_CheckOption,                // 6
    MTS_ClientMD5Fail,              // 7
    MTS_ClientBanned,               // 8
    MTS_ClientDupKey,               // 9
    MTS_UTANBan                     // 10
};

enum EHeartbeatType
{
    HB_QueryInterface,              // 0
    HB_GamePort,                    // 1
    HB_GamespyQueryPort             // 2
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
native function ForceGameStateRefresh(int When)
{
    //native.When;        
}

event BeginPlay()
{
    local Class<UdpLink> LinkClass;

    // End:0x143
    if(DoUplink)
    {
        // End:0x99
        if(UplinkToGamespy)
        {
            LinkClass = Class<UdpLink>(DynamicLoadObject("IpDrv.UdpGamespyQuery", Class'Core.Class'));
            // End:0x58
            if(LinkClass != none)
            {
                GamespyQueryLink = Spawn(LinkClass);
            }
            LinkClass = Class<UdpLink>(DynamicLoadObject("IpDrv.UdpGamespyUplink", Class'Core.Class'));
            // End:0x99
            if(LinkClass != none)
            {
                Spawn(LinkClass);
            }
        }
        // End:0x143
        if(SendStats)
        {
            // End:0xE4
            foreach AllActors(Class'IpDrv_Decompressed.MasterServerGameStats', GameStats)
            {
                // End:0xD9
                if(GameStats.Uplink == none)
                {
                    GameStats.Uplink = self;                    
                }
                else
                {
                    GameStats = none;
                }
                // End:0xE4
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
    //return;    
}

event ConnectionFailed(bool bShouldReconnect)
{
    Log("Master server connection failed");
    bReconnectPending = bShouldReconnect;
    // End:0x8B
    if(bShouldReconnect)
    {
        // End:0x63
        if((ActiveMasterServerList.Length > 0) && LastMSIndex < ActiveMasterServerList.Length)
        {
            ActiveMasterServerList.Remove(LastMSIndex, 1);
        }
        // End:0x7D
        if(ActiveMasterServerList.Length == 0)
        {
            ReconnectTime = 10.0000000;            
        }
        else
        {
            ReconnectTime = 2.0000000;
        }        
    }
    else
    {
        ReconnectTime = 0.0000000;
    }
    //return;    
}

event Refresh()
{
    // End:0xB7
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
    else
    {
        // End:0x10E
        if(Level.Game.NumPlayers != CachePlayerCount)
        {
            ServerState = CachedServerState;
            Level.Game.GetServerPlayers(ServerState);
            FullCachedServerState = ServerState;            
        }
        else
        {
            ServerState = FullCachedServerState;
        }
    }
    CachePlayerCount = Level.Game.NumPlayers;
    //return;    
}

// Export UMasterServerUplink::execLogStatLine(FFrame&, void* const)
native event bool LogStatLine(string StatLine)
{
    //native.StatLine;        
}

simulated function Tick(float Delta)
{
    super.Tick(Delta);
    // End:0x6A
    if(bReconnectPending)
    {
        ReconnectTime -= Delta;
        // End:0x6A
        if(ReconnectTime <= 0.0000000)
        {
            Log("Attempting to reconnect to master server!");
            bReconnectPending = false;
            Reconnect();
        }
    }
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.ServerGroup, "DoUplink", default.MSUPropText[0], byte(255), 1, "Check",,, true);
    PlayInfo.AddSetting(default.ServerGroup, "bIgnoreUTANBans", default.MSUPropText[2], byte(255), 1, "Check",,, true);
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1C
        case "DoUplink":
            return default.MSUPropDesc[0];
        // End:0x32
        case "SendStats":
            return default.MSUPropDesc[1];
        // End:0x4F
        case "bIgnoreUTANBans":
            return default.MSUPropDesc[2];
        // End:0xFFFF
        default:
            return super(Info).GetDescriptionText(PropName);
            break;
    }
    //return;    
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