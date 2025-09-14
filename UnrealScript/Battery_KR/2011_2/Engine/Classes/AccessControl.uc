class AccessControl extends Info
    config
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const PROPNUM = 4;

struct AdminPlayer
{
    var wAdminUser User;
    var PlayerReplicationInfo PRI;
};

var wAdminUserList Users;
var wAdminGroupList Groups;
var protected array<AdminPlayer> LoggedAdmins;
var config array< Class<wPrivilegeBase> > PrivClasses;
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
var Class<AdminBase> AdminClass;
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
    Users = new (Level.XLevel) Class'Engine_Decompressed.wAdminUserList';
    assert(Groups == none);
    Groups = new (Level.XLevel) Class'Engine_Decompressed.wAdminGroupList';
    // End:0xF1
    if(!bDontAddDefaultAdmin)
    {
        Groups.Add(Groups.CreateGroup("Admin", "", byte(255)));
        NewUser = Users.Create(AdminName, AdminPassword, "");
        NewUser.AddGroup(Groups.FindByName("Admin"));
        Users.Add(NewUser);
        AdminName = "Admin";
    }
    InitPrivs();
    //return;    
}

function InitPrivs()
{
    //return;    
}

function SaveAdmins()
{
    AdminPassword = Users.Get(0).Password;
    //return;    
}

function bool AdminLogin(PlayerController P, string UserName, string Password)
{
    // End:0x2F
    if(ValidLogin(UserName, Password))
    {
        P.PlayerReplicationInfo.bAdmin = true;
        return true;
    }
    return false;
    //return;    
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
    //return;    
}

function AdminEntered(PlayerController P, string UserName)
{
    Log(P.PlayerReplicationInfo.PlayerName @ "logged in as Administrator.");
    Level.Game.Broadcast(P, P.PlayerReplicationInfo.PlayerName @ "logged in as a server administrator.");
    //return;    
}

function AdminExited(PlayerController P)
{
    Log(P.PlayerReplicationInfo.PlayerName @ "logged out.");
    Level.Game.Broadcast(P, P.PlayerReplicationInfo.PlayerName @ "gave up administrator abilities.");
    //return;    
}

function bool IsAdmin(PlayerController P)
{
    return P.PlayerReplicationInfo.bAdmin;
    //return;    
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
    //return;    
}

function bool SetAdminPassword(string P)
{
    AdminPassword = P;
    return true;
    //return;    
}

function SetGamePassword(string P)
{
    GamePassword = P;
    //return;    
}

function bool RequiresPassword()
{
    return GamePassword != "";
    //return;    
}

function wAdminUser GetAdmin(PlayerController PC)
{
    return none;
    //return;    
}

function string GetAdminName(PlayerController PC)
{
    return AdminName;
    //return;    
}

function Kick(string S)
{
    local Controller C, NextC;

    C = Level.ControllerList;
    J0x14:

    // End:0xF9 [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0xEB
        if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.PlayerName ~= S)
        {
            // End:0x8D
            if(PlayerController(C) != none)
            {
                KickPlayer(PlayerController(C));                
            }
            else
            {
                // End:0xE8
                if(C.PlayerReplicationInfo.bBot)
                {
                    // End:0xD1
                    if(C.Pawn != none)
                    {
                        C.Pawn.Destroy();
                    }
                    // End:0xE8
                    if(C != none)
                    {
                        C.Destroy();
                    }
                }
            }
            // [Explicit Break]
            goto J0xF9;
        }
        C = NextC;
        // [Loop Continue]
        goto J0x14;
    }
    J0xF9:

    //return;    
}

function SessionKickBan(string S)
{
    local PlayerController P;

    // End:0x59
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', P)
    {
        // End:0x58
        if((P.PlayerReplicationInfo.PlayerName ~= S) && NetConnection(P.Player) != none)
        {
            BanPlayer(P, true);
        }        
    }    
    //return;    
}

function KickBan(string S)
{
    local PlayerController P;

    // End:0x5B
    foreach DynamicActors(Class'Engine_Decompressed.PlayerController', P)
    {
        // End:0x5A
        if((P.PlayerReplicationInfo.PlayerName ~= S) && NetConnection(P.Player) != none)
        {
            BanPlayer(P);            
            return;
        }        
    }    
    //return;    
}

function bool KickPlayer(PlayerController C)
{
    // End:0x99
    if(((C != none) && !IsAdmin(C)) && NetConnection(C.Player) != none)
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
    //return;    
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
    if((CheckIPPolicy(IP)) == 0)
    {
        IP = Left(IP, InStr(IP, ":"));
        // End:0x148
        if(bSession)
        {
            Log((("Adding Session Ban for: " $ IP) @ C.GetPlayerIDHash()) @ C.PlayerReplicationInfo.PlayerName);
            // End:0xE9
            if(bBanByID)
            {
                SessionBannedIDs[SessionBannedIDs.Length] = (C.GetPlayerIDHash() $ "|") $ C.PlayerReplicationInfo.PlayerName;                
            }
            else
            {
                SessionIPPolicies[SessionIPPolicies.Length] = "DENY;" $ IP;
            }
            SaveConfig();
            C.ClientNetworkMessage("AC_SessionBan", Level.Game.GameReplicationInfo.AdminEmail);            
        }
        else
        {
            Log((("Adding Global Ban for: " $ IP) @ C.GetPlayerIDHash()) @ C.PlayerReplicationInfo.PlayerName);
            // End:0x1D5
            if(bBanByID)
            {
                BannedIDs[BannedIDs.Length] = C.GetPlayerIDHash() @ C.PlayerReplicationInfo.PlayerName;                
            }
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
    //return;    
}

function bool KickBanPlayer(PlayerController P)
{
    local string IP;

    // End:0x188
    if(!IsAdmin(P))
    {
        IP = P.GetPlayerNetworkAddress();
        // End:0x132
        if((CheckIPPolicy(IP)) == 0)
        {
            IP = Left(IP, InStr(IP, ":"));
            Log((("Adding Global Ban for: " $ IP) @ P.GetPlayerIDHash()) @ P.PlayerReplicationInfo.PlayerName);
            // End:0xDA
            if(bBanByID)
            {
                BannedIDs[BannedIDs.Length] = P.GetPlayerIDHash() @ P.PlayerReplicationInfo.PlayerName;                
            }
            else
            {
                IPPolicies[IPPolicies.Length] = "DENY;" $ IP;
            }
            SaveConfig();
            P.ClientNetworkMessage("AC_Ban", Level.Game.GameReplicationInfo.AdminEmail);            
        }
        else
        {
            P.ClientNetworkMessage("AC_Kicked", DefaultKickReason);
        }
        // End:0x17A
        if(P.Pawn != none)
        {
            P.Pawn.Destroy();
        }
        P.Destroy();
        return true;
    }
    return false;
    //return;    
}

function bool CheckOptionsAdmin(string Options)
{
    local string InAdminName, InPassword;

    InPassword = Level.Game.ParseOption(Options, "Password");
    InAdminName = Level.Game.ParseOption(Options, "AdminName");
    return ValidLogin(InAdminName, InPassword);
    //return;    
}

function bool ValidLogin(string UserName, string Password)
{
    return (AdminPassword != "") && Password == AdminPassword;
    //return;    
}

function wAdminUser GetLoggedAdmin(PlayerController P)
{
    return Users.Get(0);
    //return;    
}

function wAdminUser GetUser(string uname)
{
    return none;
    //return;    
}

event PreLogin(string Options, string Address, string PlayerID, out string Error, out string FailCode, bool bSpectator)
{
    local string InPassword;
    local bool bAdmin;
    local int Result;

    Error = "";
    InPassword = Level.Game.ParseOption(Options, "Password");
    bAdmin = CheckOptionsAdmin(Options);
    // End:0xAD
    if(((int(Level.NetMode) != int(NM_Standalone)) && !bAdmin) && Level.Game.AtCapacity(bSpectator))
    {
        FailCode = "SERVERFULL";
        Error = "";        
    }
    else
    {
        // End:0x117
        if(((GamePassword != "") && Caps(InPassword) != Caps(GamePassword)) && !bAdmin)
        {
            // End:0x100
            if(InPassword == "")
            {
                Error = "";
                FailCode = "NEEDPW";                
            }
            else
            {
                Error = "";
                FailCode = "WRONGPW";
            }
        }
    }
    Result = CheckIPPolicy(Address);
    // End:0x14F
    if((Result == 0) && bBanByID)
    {
        Result = CheckID(PlayerID);
    }
    // End:0x1A6
    if(Result > 0)
    {
        // End:0x182
        if(Result == 1)
        {
            Error = "";
            FailCode = "SESSIONBAN";            
        }
        else
        {
            // End:0x1A6
            if(Result == 2)
            {
                Error = "";
                FailCode = "LOCALBAN";
            }
        }
    }
    //return;    
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

    // End:0x130 [Loop If]
    if(i < IPPolicies.Length)
    {
        // End:0x126
        if(Divide(IPPolicies[i], ";", Policy, Mask))
        {
            // End:0x8A
            if(Policy ~= "ACCEPT")
            {
                bAcceptPolicy = true;                
            }
            else
            {
                // End:0xA5
                if(Policy ~= "DENY")
                {
                    bAcceptPolicy = false;                    
                }
                else
                {
                    // [Explicit Continue]
                    goto J0x126;
                }
            }
            j = InStr(Mask, "*");
            // End:0xFF
            if(j != -1)
            {
                // End:0xFC
                if(Left(Mask, j) == Left(Address, j))
                {
                    bAcceptAddress = bAcceptPolicy;
                    LastMatchingPolicy = i;
                }
                // [Explicit Continue]
                goto J0x126;
            }
            // End:0x126
            if(Mask == Address)
            {
                bAcceptAddress = bAcceptPolicy;
                LastMatchingPolicy = i;
            }
        }
        J0x126:

        i++;
        // [Loop Continue]
        goto J0x40;
    }
    // End:0x18B
    if(!bAcceptAddress)
    {
        // End:0x188
        if(!bSilent)
        {
            Log((("Denied connection for " $ Address) $ " with IP policy ") $ IPPolicies[LastMatchingPolicy]);
        }
        return 2;
    }
    i = 0;
    J0x192:

    // End:0x293 [Loop If]
    if((i < SessionIPPolicies.Length) && SessionIPPolicies[i] != "")
    {
        Divide(SessionIPPolicies[i], ";", Policy, Mask);
        // End:0x1ED
        if(Policy ~= "ACCEPT")
        {
            bAcceptPolicy = true;            
        }
        else
        {
            // End:0x208
            if(Policy ~= "DENY")
            {
                bAcceptPolicy = false;                
            }
            else
            {
                // [Explicit Continue]
                goto J0x289;
            }
        }
        j = InStr(Mask, "*");
        // End:0x262
        if(j != -1)
        {
            // End:0x25F
            if(Left(Mask, j) == Left(Address, j))
            {
                bAcceptAddress = bAcceptPolicy;
                LastMatchingPolicy = i;
            }
            // [Explicit Continue]
            goto J0x289;
        }
        // End:0x289
        if(Mask == Address)
        {
            bAcceptAddress = bAcceptPolicy;
            LastMatchingPolicy = i;
        }
        J0x289:

        i++;
        // [Loop Continue]
        goto J0x192;
    }
    // End:0x2F5
    if(!bAcceptAddress)
    {
        // End:0x2F3
        if(!bSilent)
        {
            Log((("Denied connection for " $ Address) $ " with Session IP policy ") $ SessionIPPolicies[LastMatchingPolicy]);
        }
        return 1;
    }
    return 0;
    //return;    
}

function bool CanPerform(PlayerController P, string Action)
{
    // End:0x12
    if(!AllowPriv(Action))
    {
        return false;
    }
    return P.PlayerReplicationInfo.bAdmin;
    //return;    
}

function bool AllowPriv(string priv)
{
    // End:0x24
    if((Left(priv, 1) ~= "A") || Left(priv, 1) ~= "G")
    {
        return false;
    }
    return true;
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super.FillPlayInfo(PlayInfo);
    i = 0;
    PlayInfo.AddSetting(default.ServerGroup, "GamePassword", default.ACDisplayText[i++], 240, 1, "Text", "16",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "IPPolicies", default.ACDisplayText[i++], 254, 1, "Text", "15",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "AdminPassword", default.ACDisplayText[i++], byte(255), 1, "Text", "16",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "LoginDelaySeconds", default.ACDisplayText[i++], 200, 1, "Text", "3;0:999",, true, true);
    //return;    
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
        // End:0xFFFF
        default:
            return super.GetDescriptionText(PropName);
            break;
    }
    //return;    
}

function int CheckID(string CDHash)
{
    local int i;

    // End:0x14
    if(Class'Engine_Decompressed.LevelInfo'.static.IsDemoBuild())
    {
        return 0;
    }
    i = 0;
    J0x1B:

    // End:0x51 [Loop If]
    if(i < BannedIDs.Length)
    {
        // End:0x47
        if(CDHash ~= Left(BannedIDs[i], 32))
        {
            return 2;
        }
        i++;
        // [Loop Continue]
        goto J0x1B;
    }
    i = 0;
    J0x58:

    // End:0x8D [Loop If]
    if(i < SessionBannedIDs.Length)
    {
        // End:0x83
        if(CDHash ~= Left(SessionBannedIDs[i], 32))
        {
            return 1;
        }
        i++;
        // [Loop Continue]
        goto J0x58;
    }
    return 0;
    //return;    
}

defaultproperties
{
    IPPolicies[0]="ACCEPT;*"
    IPBanned="??? IP ??? ? ???? ???????."
    WrongPassword="????? ???? ????."
    NeedPassword="? ??? ????? ????? ?????."
    SessionBanned="??? IP ??? ?? ???? ?? ???? ???????."
    KickedMsg="???? ??? ??????."
    DefaultKickReason="????"
    IdleKickReason="Kicked for idling."
    AdminClass=Class'Engine_Decompressed.Admin'
    bBanByID=true
    ACDisplayText[0]="?? ????"
    ACDisplayText[1]="?? ??"
    ACDisplayText[2]="??? ????"
    ACDisplayText[3]="??? ??"
    ACDescText[0]="????? ??? ??? ? ? ????? ???? ???."
    ACDescText[1]="?? ?? ? IP ??? ?? ?? ??"
    ACDescText[2]="??? ???? ? ??? ??? ? ? ???? ????"
    ACDescText[3]="???? ???? ??, ?? ? ?? ??? ??? ????."
}