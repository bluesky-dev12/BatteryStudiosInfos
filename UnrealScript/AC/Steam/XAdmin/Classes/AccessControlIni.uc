/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XAdmin\Classes\AccessControlIni.uc
 * Package Imports:
 *	XAdmin
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:22
 *
 *******************************************************************************/
class AccessControlIni extends AccessControl
    dependson(xAdminConfigIni)
    dependson(AdminIni)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var GameConfigSet ConfigSet;
var AdminBase CSEditor;

event Destroyed()
{
    // End:0x37
    if(CSEditor != none)
    {
        ConfigSet.EndEdit(false);
        AdminIni(CSEditor).ConfigSet = none;
        CSEditor = none;
    }
    super(Actor).Destroyed();
}

function InitPrivs()
{
    local int i, cnt;
    local wPrivilegeBase xPriv;

    super.InitPrivs();
    cnt = 0;
    i = 0;
    J0x14:
    // End:0x114 [While If]
    if(i < PrivClasses.Length)
    {
        xPriv = new PrivClasses[i];
        // End:0xdf
        if(xPriv != none)
        {
            PrivManagers.Length = cnt + 1;
            PrivManagers[cnt] = xPriv;
            ++ cnt;
            // End:0x90
            if(xPriv.LoadMsg != "")
            {
                Log(xPriv.LoadMsg);
            }
            // End:0xac
            if(AllPrivs != "")
            {
                AllPrivs = AllPrivs $ "|";
            }
            AllPrivs = AllPrivs $ xPriv.MainPrivs $ "|" $ xPriv.SubPrivs;
        }
        // End:0x10a
        else
        {
            Log("Invalid Privilege Class:" @ string(PrivClasses[i]));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

event PreBeginPlay()
{
    Users = new (Level.XLevel) class'wAdminUserList';
    Groups = new (Level.XLevel) class'wAdminGroupList';
    class'xAdminConfigIni'.static.Load(Users, Groups, bDontAddDefaultAdmin);
    ConfigSet = new (Level.XLevel) class'GameConfigSet';
    ConfigSet.Level = Level;
    super(Actor).PreBeginPlay();
    InitPrivs();
}

function SaveAdmins()
{
    class'xAdminConfigIni'.static.Save(Users, Groups);
}

function bool AdminLogin(PlayerController P, string UserName, string Password)
{
    local wAdminUser User;
    local int Index;

    // End:0x0d
    if(P == none)
    {
        return false;
    }
    User = GetLoggedAdmin(P);
    // End:0x118
    if(User == none)
    {
        User = Users.FindByName(UserName);
        // End:0x118
        if(User != none)
        {
            // End:0x111
            if(User.Password == Password)
            {
                Index = LoggedAdmins.Length;
                LoggedAdmins.Length = Index + 1;
                LoggedAdmins[Index].User = User;
                LoggedAdmins[Index].PRI = P.PlayerReplicationInfo;
                P.PlayerReplicationInfo.bAdmin = User.bMasterAdmin || User.HasPrivilege("Kp") || User.HasPrivilege("Bp");
            }
            // End:0x118
            else
            {
                User = none;
            }
        }
    }
    return User != none;
}

function bool AdminLogout(PlayerController P)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6c [While If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x62
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            P.PlayerReplicationInfo.bAdmin = false;
            LoggedAdmins.Remove(i, 1);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function SetAdminFromURL(string N, string P)
{
    local wAdminGroup xGroup;
    local wAdminUser User;

    // End:0x5f
    if(Users.FindByName(N) != none)
    {
        Log("User" @ N @ "already in user list, please choose another name");
        return;
    }
    xGroup = Groups.FindByName("URL::Admin");
    // End:0xc6
    if(xGroup == none)
    {
        xGroup = Groups.CreateGroup("URL::Admin", "", byte(255));
        Groups.Add(xGroup);
    }
    // End:0x13e
    if(xGroup != none)
    {
        xGroup.bMasterAdmin = true;
        xGroup.GameSecLevel = byte(255);
        User = Users.Create(N, P, "");
        User.AddGroup(xGroup);
        Users.Add(User);
    }
}

function bool ValidLogin(string UserName, string Password)
{
    local wAdminUser User;

    User = Users.FindByName(UserName);
    return User != none && User.Password == Password;
}

function bool IsAdmin(PlayerController P)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x46 [While If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x3c
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool IsLogged(wAdminUser User)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x33
        if(LoggedAdmins[i].User == User)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool SetAdminPassword(string P)
{
    return false;
}

function bool AllowPriv(string priv)
{
    return true;
}

function SetGamePassword(string P)
{
    super.SetGamePassword(P);
}

function string GetAdminName(PlayerController PC)
{
    local wAdminUser User;

    User = GetLoggedAdmin(PC);
    // End:0x2b
    if(User != none)
    {
        return User.UserName;
    }
    return "Unknown";
}

function AdminEntered(PlayerController P, string UserName)
{
    Log(P.PlayerReplicationInfo.PlayerName @ "logged in as" @ UserName $ ".");
    Level.Game.Broadcast(P, P.PlayerReplicationInfo.PlayerName @ "logged in as a server administrator.");
}

function bool CanPerform(PlayerController P, string Action)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x64 [While If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x5a
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            return LoggedAdmins[i].User.HasPrivilege(Action);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool ReportLoggedAdminsTo(PlayerController P)
{
    return false;
}

function bool LockConfigSet(out GameConfigSet GCS, AdminBase Admin)
{
    // End:0x23
    if(CSEditor == none)
    {
        CSEditor = Admin;
        GCS = ConfigSet;
        return true;
    }
    return false;
}

function bool ReleaseConfigSet(out GameConfigSet GCS, AdminBase Admin)
{
    // End:0x30
    if(CSEditor == Admin && GCS == ConfigSet)
    {
        CSEditor = none;
        GCS = none;
        return true;
    }
    return false;
}

function wAdminUser GetLoggedAdmin(PlayerController P)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x55 [While If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x4b
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            return LoggedAdmins[i].User;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function wAdminUser GetUser(string uname)
{
    return Users.FindByName(uname);
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x1b
    if(PropertyName ~= "AdminPassword")
    {
        return false;
    }
    return super(Info).AcceptPlayInfoProperty(PropertyName);
}

defaultproperties
{
    PrivClasses=// Object reference not set to an instance of an object.
    
    AdminClass=class'AdminIni'
}