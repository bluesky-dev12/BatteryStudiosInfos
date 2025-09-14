class WebServer extends TcpLink
    transient
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var string ServerName;
var string Applications[10];
var string ApplicationPaths[10];
var bool bEnabled;
var int ListenPort;
var int MaxConnections;
var int DefaultApplication;
var int ExpirationSeconds;
var string ServerURL;
var WebApplication ApplicationObjects[10];
var int ConnectionCount;

function BeginPlay()
{
    local int i;
    local Class<WebApplication> ApplicationClass;
    local IpAddr L;
    local string S;

    // End:0x39
    if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_Client))
    {
        Destroy();
        return;
    }
    // End:0x91
    if(!bEnabled)
    {
        Log("Webserver is not enabled.  Set bEnabled to True in Advanced Options.");
        Destroy();
        return;
    }
    super(Actor).BeginPlay();
    i = 0;
    J0x9E:

    // End:0x16F [Loop If]
    if(i < 10)
    {
        // End:0xBF
        if(Applications[i] == "")
        {
            // [Explicit Break]
            goto J0x16F;
        }
        ApplicationClass = Class<WebApplication>(DynamicLoadObject(Applications[i], Class'Core.Class'));
        // End:0x165
        if(ApplicationClass != none)
        {
            ApplicationObjects[i] = new (none) ApplicationClass;
            ApplicationObjects[i].Level = Level;
            ApplicationObjects[i].WebServer = self;
            ApplicationObjects[i].Path = ApplicationPaths[i];
            ApplicationObjects[i].Init();
        }
        i++;
        // [Loop Continue]
        goto J0x9E;
    }
    J0x16F:

    // End:0x1E1
    if(ServerName == "")
    {
        GetLocalIP(L);
        S = IpAddrToString(L);
        i = InStr(S, ":");
        // End:0x1C8
        if(i != -1)
        {
            S = Left(S, i);
        }
        ServerURL = "http://" $ S;        
    }
    else
    {
        ServerURL = "http://" $ ServerName;
    }
    // End:0x21C
    if(ListenPort != 80)
    {
        ServerURL = (ServerURL $ ":") $ string(ListenPort);
    }
    BindPort(ListenPort);
    Listen();
    //return;    
}

event Destroyed()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x43 [Loop If]
    if(i < 10)
    {
        // End:0x39
        if(ApplicationObjects[i] != none)
        {
            ApplicationObjects[i].CleanupApp();
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super(Actor).Destroyed();
    //return;    
}

event GainedChild(Actor C)
{
    super(Actor).GainedChild(C);
    ConnectionCount++;
    // End:0x80
    if(((MaxConnections > 0) && ConnectionCount > MaxConnections) && int(LinkState) == int(2))
    {
        Log("WebServer: Too many connections - closing down Listen.");
        Close();
    }
    //return;    
}

event LostChild(Actor C)
{
    super(Actor).LostChild(C);
    ConnectionCount--;
    // End:0x77
    if((ConnectionCount <= MaxConnections) && int(LinkState) != int(2))
    {
        Log("WebServer: Listening again - connections have been closed.");
        Listen();
    }
    //return;    
}

function WebApplication GetApplication(string URI, out string SubURI)
{
    local int i, L;

    SubURI = "";
    i = 0;
    J0x0F:

    // End:0xAE [Loop If]
    if(i < 10)
    {
        // End:0xA4
        if(ApplicationPaths[i] != "")
        {
            L = Len(ApplicationPaths[i]);
            // End:0xA4
            if((Left(URI, L) == ApplicationPaths[i]) && (Len(URI) == L) || Mid(URI, L, 1) == "/")
            {
                SubURI = Mid(URI, L);
                return ApplicationObjects[i];
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    return none;
    //return;    
}

defaultproperties
{
    Applications[0]="xWebAdmin.UTServerAdmin"
    Applications[1]="xWebAdmin.UTImageServer"
    ApplicationPaths[0]="/ServerAdmin"
    ApplicationPaths[1]="/images"
    ListenPort=80
    MaxConnections=30
    ExpirationSeconds=86400
    AcceptClass=Class'UWeb_Decompressed.WebConnection'
}