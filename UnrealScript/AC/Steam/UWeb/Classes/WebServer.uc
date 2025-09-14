/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UWeb\Classes\WebServer.uc
 * Package Imports:
 *	UWeb
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:5
 *
 *******************************************************************************/
class WebServer extends TcpLink
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    transient;

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
    local class<WebApplication> ApplicationClass;
    local IpAddr L;
    local string S;

    // End:0x39
    if(Level.NetMode == 0 || Level.NetMode == 3)
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
    J0x9e:
    // End:0x16f [While If]
    if(i < 10)
    {
        // End:0xbf
        if(Applications[i] == "")
        {
        }
        // End:0x16f
        else
        {
            ApplicationClass = class<WebApplication>(DynamicLoadObject(Applications[i], class'Class'));
            // End:0x165
            if(ApplicationClass != none)
            {
                ApplicationObjects[i] = new (none) ApplicationClass;
                ApplicationObjects[i].Level = Level;
                ApplicationObjects[i].WebServer = self;
                ApplicationObjects[i].Path = ApplicationPaths[i];
                ApplicationObjects[i].Init();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x9e;
        }
    }
    // End:0x1e1
    if(ServerName == "")
    {
        GetLocalIP(L);
        S = IpAddrToString(L);
        i = InStr(S, ":");
        // End:0x1c8
        if(i != -1)
        {
            S = Left(S, i);
        }
        ServerURL = "http://" $ S;
    }
    // End:0x1f7
    else
    {
        ServerURL = "http://" $ ServerName;
    }
    // End:0x21c
    if(ListenPort != 80)
    {
        ServerURL = ServerURL $ ":" $ string(ListenPort);
    }
    BindPort(ListenPort);
    Listen();
}

event Destroyed()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x43 [While If]
    if(i < 10)
    {
        // End:0x39
        if(ApplicationObjects[i] != none)
        {
            ApplicationObjects[i].CleanupApp();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super(Actor).Destroyed();
}

event GainedChild(Actor C)
{
    super(Actor).GainedChild(C);
    ++ ConnectionCount;
    // End:0x80
    if(MaxConnections > 0 && ConnectionCount > MaxConnections && LinkState == 2)
    {
        Log("WebServer: Too many connections - closing down Listen.");
        Close();
    }
}

event LostChild(Actor C)
{
    super(Actor).LostChild(C);
    -- ConnectionCount;
    // End:0x77
    if(ConnectionCount <= MaxConnections && LinkState != 2)
    {
        Log("WebServer: Listening again - connections have been closed.");
        Listen();
    }
}

function WebApplication GetApplication(string URI, out string SubURI)
{
    local int i, L;

    SubURI = "";
    i = 0;
    J0x0f:
    // End:0xae [While If]
    if(i < 10)
    {
        // End:0xa4
        if(ApplicationPaths[i] != "")
        {
            L = Len(ApplicationPaths[i]);
            // End:0xa4
            if(Left(URI, L) == ApplicationPaths[i] && Len(URI) == L || Mid(URI, L, 1) == "/")
            {
                SubURI = Mid(URI, L);
                return ApplicationObjects[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    return none;
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
    AcceptClass=class'WebConnection'
}