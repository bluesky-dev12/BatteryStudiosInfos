class AccessControlIni extends AccessControl
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
    //return;    
}

function InitPrivs()
{
    local int i, cnt;
    local wPrivilegeBase xPriv;

    super.InitPrivs();
    cnt = 0;
    i = 0;
    J0x14:

    // End:0x114 [Loop If]
    if(i < PrivClasses.Length)
    {
        xPriv = new PrivClasses[i];
        // End:0xDF
        if(xPriv != none)
        {
            PrivManagers.Length = cnt + 1;
            PrivManagers[cnt] = xPriv;
            cnt++;
            // End:0x90
            if(xPriv.LoadMsg != "")
            {
                Log(xPriv.LoadMsg);
            }
            // End:0xAC
            if(AllPrivs != "")
            {
                AllPrivs = AllPrivs $ "|";
            }
            AllPrivs = ((AllPrivs $ xPriv.MainPrivs) $ "|") $ xPriv.SubPrivs;
            // [Explicit Continue]
            goto J0x10A;
        }
        Log("Invalid Privilege Class:" @ string(PrivClasses[i]));
        J0x10A:

        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

event PreBeginPlay()
{
    Users = new (Level.XLevel) Class'Engine.wAdminUserList';
    Groups = new (Level.XLevel) Class'Engine.wAdminGroupList';
    Class'XAdmin_Decompressed.xAdminConfigIni'.static.Load(Users, Groups, bDontAddDefaultAdmin);
    ConfigSet = new (Level.XLevel) Class'XAdmin_Decompressed.GameConfigSet';
    ConfigSet.Level = Level;
    super(Actor).PreBeginPlay();
    InitPrivs();
    //return;    
}

function SaveAdmins()
{
    Class'XAdmin_Decompressed.xAdminConfigIni'.static.Save(Users, Groups);
    //return;    
}

function bool AdminLogin(PlayerController P, string UserName, string Password)
{
    local wAdminUser User;
    local int Index;

    // End:0x0D
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
                P.PlayerReplicationInfo.bAdmin = (User.bMasterAdmin || User.HasPrivilege("Kp")) || User.HasPrivilege("Bp");                
            }
            else
            {
                User = none;
            }
        }
    }
    return User != none;
    //return;    
}

function bool AdminLogout(PlayerController P)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6C [Loop If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x62
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            P.PlayerReplicationInfo.bAdmin = false;
            LoggedAdmins.Remove(i, 1);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function SetAdminFromURL(string N, string P)
{
    local wAdminGroup xGroup;
    local wAdminUser User;

    // End:0x5F
    if(Users.FindByName(N) != none)
    {
        Log(("User" @ N) @ "already in user list, please choose another name");
        return;
    }
    xGroup = Groups.FindByName("URL::Admin");
    // End:0xC6
    if(xGroup == none)
    {
        xGroup = Groups.CreateGroup("URL::Admin", "", byte(255));
        Groups.Add(xGroup);
    }
    // End:0x13E
    if(xGroup != none)
    {
        xGroup.bMasterAdmin = true;
        xGroup.GameSecLevel = byte(255);
        User = Users.Create(N, P, "");
        User.AddGroup(xGroup);
        Users.Add(User);
    }
    //return;    
}

function bool ValidLogin(string UserName, string Password)
{
    local wAdminUser User;

    User = Users.FindByName(UserName);
    return (User != none) && User.Password == Password;
    //return;    
}

function bool IsAdmin(PlayerController P)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x3C
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool IsLogged(wAdminUser User)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x33
        if(LoggedAdmins[i].User == User)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool SetAdminPassword(string P)
{
    return false;
    //return;    
}

function bool AllowPriv(string priv)
{
    return true;
    //return;    
}

function SetGamePassword(string P)
{
    super.SetGamePassword(P);
    //return;    
}

function string GetAdminName(PlayerController PC)
{
    local wAdminUser User;

    User = GetLoggedAdmin(PC);
    // End:0x2B
    if(User != none)
    {
        return User.UserName;
    }
    return "Unknown";
    //return;    
}

function AdminEntered(PlayerController P, string UserName)
{
    Log(((P.PlayerReplicationInfo.PlayerName @ "logged in as") @ UserName) $ ".");
    Level.Game.Broadcast(P, P.PlayerReplicationInfo.PlayerName @ "logged in as a server administrator.");
    //return;    
}

function bool CanPerform(PlayerController P, string Action)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x64 [Loop If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x5A
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            return LoggedAdmins[i].User.HasPrivilege(Action);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool ReportLoggedAdminsTo(PlayerController P)
{
    return false;
    //return;    
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
    //return;    
}

function bool ReleaseConfigSet(out GameConfigSet GCS, AdminBase Admin)
{
    // End:0x30
    if((CSEditor == Admin) && GCS == ConfigSet)
    {
        CSEditor = none;
        GCS = none;
        return true;
    }
    return false;
    //return;    
}

function wAdminUser GetLoggedAdmin(PlayerController P)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x55 [Loop If]
    if(i < LoggedAdmins.Length)
    {
        // End:0x4B
        if(LoggedAdmins[i].PRI == P.PlayerReplicationInfo)
        {
            return LoggedAdmins[i].User;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function wAdminUser GetUser(string uname)
{
    return Users.FindByName(uname);
    //return;    
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x1B
    if(PropertyName ~= "AdminPassword")
    {
        return false;
    }
    return super(Info).AcceptPlayInfoProperty(PropertyName);
    //return;    
}

defaultproperties
{
    PrivClasses=/* Array type was not detected. */
    AdminClass=Class'XAdmin_Decompressed.AdminIni'
}