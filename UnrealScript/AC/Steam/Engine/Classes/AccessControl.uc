/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AccessControl.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:1
 *	Properties:27
 *	Functions:31
 *
 *******************************************************************************/
class AccessControl extends Info
    dependson(wAdminUserList)
    dependson(wAdminGroup)
    dependson(wAdminUser)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    notplaceable;

const PROPNUM = 4;

struct AdminPlayer
{
    var wAdminUser User;
    var PlayerReplicationInfo PRI;
};

var wAdminUserList Users;
var wAdminGroupList Groups;
var array<AdminPlayer> LoggedAdmins;
var config array< class<wPrivilegeBase> > PrivClasses;
var array<wPrivilegeBase> PrivManagers;
var string AllPrivs;
var array<string> IPPolicies;
var localized string IPBanned;
var localized string WrongPassword;
var localized string NeedPassword;
var localized string SessionBanned;
var localized string KickedMsg;
var localized string DefaultKickReason;
var localized string IdleKickReason;
var class<AdminBase> AdminClass;
var bool bReplyToGUI;
var bool bDontAddDefaultAdmin;
var private string AdminName;
var private string AdminPassword;
var private string GamePassword;
var float LoginDelaySeconds;
var bool bBanByID;
var globalconfig array<string> BannedIDs;
var transient array<string> SessionIPPolicies;
var transient array<string> SessionBannedIDs;
var localized string ACDisplayText[4];
var localized string ACDescText[4];

event PreBeginPlay()
{
    local wAdminUser NewUser;

    super(Actor).PreBeginPlay();
    assert(Users == none);
    Users = new (Level.XLevel) class'wAdminUserList';
    assert(Groups == none);
    Groups = new (Level.XLevel) class'wAdminGroupList';
    // End:0xf1
    if(!bDontAddDefaultAdmin)
    {
        Groups.Add(Groups.CreateGroup("Admin", "", byte(255)));
        NewUser = Users.Create(AdminName, AdminPassword, "");
        NewUser.AddGroup(Groups.FindByName("Admin"));
        Users.Add(NewUser);
        AdminName = "Admin";
    }
    InitPrivs();
}

function InitPrivs();
function SaveAdmins()
{
    AdminPassword = Users.Get(0).Password;
}

function bool AdminLogin(PlayerController P, string UserName, string Password)
{
    // End:0x2f
    if(ValidLogin(UserName, Password))
    {
        P.PlayerReplicationInfo.bAdmin = true;
        return true;
    }
    return false;
}

function bool AdminLogout(PlayerController P)
{
    // End:0x37
    if(P.PlayerReplicationInfo.bAdmin)
    {
        P.PlayerReplicationInfo.bAdmin = false;
        return true;
    }
    return false;
}

function AdminEntered(PlayerController P, string UserName)
{
    Log(P.PlayerReplicationInfo.PlayerName @ "logged in as Administrator.");
    Level.Game.Broadcast(P, P.PlayerReplicationInfo.PlayerName @ "logged in as a server administrator.");
}

function AdminExited(PlayerController P)
{
    Log(P.PlayerReplicationInfo.PlayerName @ "logged out.");
    Level.Game.Broadcast(P, P.PlayerReplicationInfo.PlayerName @ "gave up administrator abilities.");
}

function bool IsAdmin(PlayerController P)
{
    return P.PlayerReplicationInfo.bAdmin;
}

function SetAdminFromURL(string N, string P)
{
    local wAdminUser NewUser;
    local wAdminGroup NewGroup;

    Log("SetAdminFromURL called");
    NewGroup = Groups.CreateGroup("URL::Admin", "", byte(255));
    NewGroup.bMasterAdmin = true;
    Groups.Add(NewGroup);
    NewUser = Users.Create(N, P, "");
    NewUser.AddGroup(NewGroup);
    Users.Add(NewUser);
    AdminName = N;
    SetAdminPassword(P);
}

function bool SetAdminPassword(string P)
{
    AdminPassword = P;
    return true;
}

function SetGamePassword(string P)
{
    GamePassword = P;
}

function bool RequiresPassword()
{
    return GamePassword != "";
}

function wAdminUser GetAdmin(PlayerController PC)
{
    return none;
}

function string GetAdminName(PlayerController PC)
{
    return AdminName;
}

function Kick(string S)
{
    local Controller C, NextC;

    C = Level.ControllerList;
    J0x14:
    // End:0xf9 [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xeb
        if(C.PlayerReplicationInfo != none && C.PlayerReplicationInfo.PlayerName ~= S)
        {
            // End:0x8d
            if(PlayerController(C) != none)
            {
                KickPlayer(PlayerController(C));
            }
            // End:0xe8
            else
            {
                // End:0xe8
                if(C.PlayerReplicationInfo.bBot)
                {
                    // End:0xd1
                    if(C.Pawn != none)
                    {
                        C.Pawn.Destroy();
                    }
                    // End:0xe8
                    if(C != none)
                    {
                        C.Destroy();
                    }
                }
            }
        }
        // End:0xf9
        else
        {
            C = NextC;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
}

function SessionKickBan(string S)
{
    local PlayerController P;

    // End:0x59
    foreach DynamicActors(class'PlayerController', P)
    {
        // End:0x58
        if(P.PlayerReplicationInfo.PlayerName ~= S && NetConnection(P.Player) != none)
        {
            BanPlayer(P, true);
        }                
    }
}

function KickBan(string S)
{
    local PlayerController P;

    // End:0x5b
    foreach DynamicActors(class'PlayerController', P)
    {
        // End:0x5a
        if(P.PlayerReplicationInfo.PlayerName ~= S && NetConnection(P.Player) != none)
        {
            BanPlayer(P);
            break;
            return;
        }                
    }
}

function bool KickPlayer(PlayerController C)
{
    // End:0x99
    if(C != none && !IsAdmin(C) && NetConnection(C.Player) != none)
    {
        C.ClientNetworkMessage("AC_Kicked", DefaultKickReason);
        // End:0x80
        if(C.Pawn != none)
        {
            C.Pawn.Destroy();
        }
        // End:0x97
        if(C != none)
        {
            C.Destroy();
        }
        return true;
    }
    return false;
}

function bool BanPlayer(PlayerController C, optional bool bSession)
{
    local string IP;

    // End:0x10
    if(IsAdmin(C))
    {
        return false;
    }
    IP = C.GetPlayerNetworkAddress();
    // End:0x261
    if(CheckIPPolicy(IP) == 0)
    {
        IP = Left(IP, InStr(IP, ":"));
        // End:0x148
        if(bSession)
        {
            Log("Adding Session Ban for: " $ IP @ C.GetPlayerIDHash() @ C.PlayerReplicationInfo.PlayerName);
            // End:0xe9
            if(bBanByID)
            {
                SessionBannedIDs[SessionBannedIDs.Length] = C.GetPlayerIDHash() $ "|" $ C.PlayerReplicationInfo.PlayerName;
            }
            // End:0x104
            else
            {
                SessionIPPolicies[SessionIPPolicies.Length] = "DENY;" $ IP;
            }
            SaveConfig();
            C.ClientNetworkMessage("AC_SessionBan", Level.Game.GameReplicationInfo.AdminEmail);
        }
        // End:0x22a
        else
        {
            Log("Adding Global Ban for: " $ IP @ C.GetPlayerIDHash() @ C.PlayerReplicationInfo.PlayerName);
            // End:0x1d5
            if(bBanByID)
            {
                BannedIDs[BannedIDs.Length] = C.GetPlayerIDHash() @ C.PlayerReplicationInfo.PlayerName;
            }
            // End:0x1f0
            else
            {
                IPPolicies[IPPolicies.Length] = "DENY;" $ IP;
            }
            SaveConfig();
            C.ClientNetworkMessage("AC_Ban", Level.Game.GameReplicationInfo.AdminEmail);
        }
        // End:0x253
        if(C.Pawn != none)
        {
            C.Pawn.Destroy();
        }
        C.Destroy();
        return true;
    }
    return false;
}

function bool KickBanPlayer(PlayerController P)
{
    local string IP;

    // End:0x188
    if(!IsAdmin(P))
    {
        IP = P.GetPlayerNetworkAddress();
        // End:0x132
        if(CheckIPPolicy(IP) == 0)
        {
            IP = Left(IP, InStr(IP, ":"));
            Log("Adding Global Ban for: " $ IP @ P.GetPlayerIDHash() @ P.PlayerReplicationInfo.PlayerName);
            // End:0xda
            if(bBanByID)
            {
                BannedIDs[BannedIDs.Length] = P.GetPlayerIDHash() @ P.PlayerReplicationInfo.PlayerName;
            }
            // End:0xf5
            else
            {
                IPPolicies[IPPolicies.Length] = "DENY;" $ IP;
            }
            SaveConfig();
            P.ClientNetworkMessage("AC_Ban", Level.Game.GameReplicationInfo.AdminEmail);
        }
        // End:0x151
        else
        {
            P.ClientNetworkMessage("AC_Kicked", DefaultKickReason);
        }
        // End:0x17a
        if(P.Pawn != none)
        {
            P.Pawn.Destroy();
        }
        P.Destroy();
        return true;
    }
    return false;
}

function bool CheckOptionsAdmin(string Options)
{
    local string InAdminName, InPassword;

    InPassword = Level.Game.ParseOption(Options, "Password");
    InAdminName = Level.Game.ParseOption(Options, "AdminName");
    return ValidLogin(InAdminName, InPassword);
}

function bool ValidLogin(string UserName, string Password)
{
    return AdminPassword != "" && Password == AdminPassword;
}

function wAdminUser GetLoggedAdmin(PlayerController P)
{
    return Users.Get(0);
}

function wAdminUser GetUser(string uname)
{
    return none;
}

event PreLogin(string Options, string Address, string PlayerID, out string Error, out string FailCode, bool bSpectator)
{
    local string InPassword;
    local bool bAdmin;
    local int Result;

    Error = "";
    InPassword = Level.Game.ParseOption(Options, "Password");
    bAdmin = CheckOptionsAdmin(Options);
    // End:0xad
    if(Level.NetMode != 0 && !bAdmin && Level.Game.AtCapacity(bSpectator))
    {
        FailCode = "SERVERFULL";
        Error = "";
    }
    // End:0x117
    else
    {
        // End:0x117
        if(GamePassword != "" && Caps(InPassword) != Caps(GamePassword) && !bAdmin)
        {
            // End:0x100
            if(InPassword == "")
            {
                Error = "";
                FailCode = "NEEDPW";
            }
            // End:0x117
            else
            {
                Error = "";
                FailCode = "WRONGPW";
            }
        }
    }
    Result = CheckIPPolicy(Address);
    // End:0x14f
    if(Result == 0 && bBanByID)
    {
        Result = CheckID(PlayerID);
    }
    // End:0x1a6
    if(Result > 0)
    {
        // End:0x182
        if(Result == 1)
        {
            Error = "";
            FailCode = "SESSIONBAN";
        }
        // End:0x1a6
        else
        {
            // End:0x1a6
            if(Result == 2)
            {
                Error = "";
                FailCode = "LOCALBAN";
            }
        }
    }
}

function int CheckIPPolicy(string Address, optional bool bSilent)
{
    local int i, j, LastMatchingPolicy;
    local string Policy, Mask;
    local bool bAcceptAddress, bAcceptPolicy;

    j = InStr(Address, ":");
    // End:0x31
    if(j != -1)
    {
        Address = Left(Address, j);
    }
    bAcceptAddress = true;
    i = 0;
    J0x40:
    // End:0x130 [While If]
    if(i < IPPolicies.Length)
    {
        // End:0x126
        if(Divide(IPPolicies[i], ";", Policy, Mask))
        {
            // End:0x8a
            if(Policy ~= "ACCEPT")
            {
                bAcceptPolicy = true;
            }
            // End:0xa8
            else
            {
                // End:0xa5
                if(Policy ~= "DENY")
                {
                    bAcceptPolicy = false;
                }
                // End:0xa8
                else
                {
                    // This is an implied JumpToken;
                    goto J0x126;
                }
            }
            j = InStr(Mask, "*");
            // End:0xff
            if(j != -1)
            {
                // End:0xfc
                if(Left(Mask, j) == Left(Address, j))
                {
                    bAcceptAddress = bAcceptPolicy;
                    LastMatchingPolicy = i;
                }
            }
            // End:0x126
            else
            {
                // End:0x126
                if(Mask == Address)
                {
                    bAcceptAddress = bAcceptPolicy;
                    LastMatchingPolicy = i;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    // End:0x18b
    if(!bAcceptAddress)
    {
        // End:0x188
        if(!bSilent)
        {
            Log("Denied connection for " $ Address $ " with IP policy " $ IPPolicies[LastMatchingPolicy]);
        }
        return 2;
    }
    i = 0;
    J0x192:
    // End:0x293 [While If]
    if(i < SessionIPPolicies.Length && SessionIPPolicies[i] != "")
    {
        Divide(SessionIPPolicies[i], ";", Policy, Mask);
        // End:0x1ed
        if(Policy ~= "ACCEPT")
        {
            bAcceptPolicy = true;
        }
        // End:0x20b
        else
        {
            // End:0x208
            if(Policy ~= "DENY")
            {
                bAcceptPolicy = false;
            }
            // End:0x20b
            else
            {
                // This is an implied JumpToken;
                goto J0x289;
            }
        }
        j = InStr(Mask, "*");
        // End:0x262
        if(j != -1)
        {
            // End:0x25f
            if(Left(Mask, j) == Left(Address, j))
            {
                bAcceptAddress = bAcceptPolicy;
                LastMatchingPolicy = i;
            }
        }
        // End:0x289
        else
        {
            // End:0x289
            if(Mask == Address)
            {
                bAcceptAddress = bAcceptPolicy;
                LastMatchingPolicy = i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x192;
    }
    // End:0x2f5
    if(!bAcceptAddress)
    {
        // End:0x2f3
        if(!bSilent)
        {
            Log("Denied connection for " $ Address $ " with Session IP policy " $ SessionIPPolicies[LastMatchingPolicy]);
        }
        return 1;
    }
    return 0;
}

function bool CanPerform(PlayerController P, string Action)
{
    // End:0x12
    if(!AllowPriv(Action))
    {
        return false;
    }
    return P.PlayerReplicationInfo.bAdmin;
}

function bool AllowPriv(string priv)
{
    // End:0x24
    if(Left(priv, 1) ~= "A" || Left(priv, 1) ~= "G")
    {
        return false;
    }
    return true;
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super.FillPlayInfo(PlayInfo);
    i = 0;
    PlayInfo.AddSetting(default.ServerGroup, "GamePassword", default.ACDisplayText[++ i], 240, 1, "Text", "16",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "IPPolicies", default.ACDisplayText[++ i], 254, 1, "Text", "15",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "AdminPassword", default.ACDisplayText[++ i], byte(255), 1, "Text", "16",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "LoginDelaySeconds", default.ACDisplayText[++ i], 200, 1, "Text", "3;0:999",, true, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x20
        case "GamePassword":
            return default.ACDescText[0];
        // End:0x37
        case "IPPolicies":
            return default.ACDescText[1];
        // End:0x52
        case "AdminPassword":
            return default.ACDescText[2];
        // End:0x71
        case "LoginDelaySeconds":
            return default.ACDescText[3];
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

function int CheckID(string CDHash)
{
    local int i;

    // End:0x14
    if(class'LevelInfo'.static.IsDemoBuild())
    {
        return 0;
    }
    i = 0;
    J0x1b:
    // End:0x51 [While If]
    if(i < BannedIDs.Length)
    {
        // End:0x47
        if(CDHash ~= Left(BannedIDs[i], 32))
        {
            return 2;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b;
    }
    i = 0;
    J0x58:
    // End:0x8d [While If]
    if(i < SessionBannedIDs.Length)
    {
        // End:0x83
        if(CDHash ~= Left(SessionBannedIDs[i], 32))
        {
            return 1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    return 0;
}

defaultproperties
{
    IPPolicies=// Object reference not set to an instance of an object.
    
    IPBanned="Your IP address is banned from this server."
    WrongPassword="Invalid password."
    NeedPassword="This game requires a password to join."
    SessionBanned="Your IP address is banned for this game session."
    KickedMsg="You have been booted from the game."
    DefaultKickReason="Unspecified"
    IdleKickReason="Kicked for idling."
    AdminClass=class'Admin'
    bBanByID=true
    ACDisplayText[0]="Game Password"
    ACDisplayText[1]="Participation Policy"
    ACDisplayText[2]="Admin Password"
    ACDisplayText[3]="Login Delayed"
    ACDescText[0]="Players must enter this password to join the server."
    ACDescText[1]="Set IP addresses, or address ranges, to ban."
    ACDescText[2]="Password required to log into the server as an admin."
    ACDescText[3]="If the login fails, try again in a moment."
}