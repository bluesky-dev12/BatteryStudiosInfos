class wAdminGroup extends wAdminBase;

var string GroupName;
var string Privileges;
var byte GameSecLevel;
var wAdminUserList Users;
var wAdminUserList Managers;
var bool bMasterAdmin;

function Created()
{
    Users = new (none) Class'Engine_Decompressed.wAdminUserList';
    Managers = new (none) Class'Engine_Decompressed.wAdminUserList';
    //return;    
}

function Init(string sGroupName, string sPrivileges, byte nGameSecLevel)
{
    GroupName = sGroupName;
    Privileges = sPrivileges;
    GameSecLevel = nGameSecLevel;
    // End:0x3A
    if(GroupName == "Admin")
    {
        bMasterAdmin = true;
    }
    //return;    
}

function SetPrivs(string privs)
{
    local int i;

    Privileges = privs;
    i = 0;
    J0x12:

    // End:0x53 [Loop If]
    if(i < Users.Count())
    {
        Users.Get(i).RedoMergedPrivs();
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

static function bool ValidName(string uname)
{
    local int i;

    // End:0x10
    if(Len(uname) < 5)
    {
        return false;
    }
    i = 0;
    J0x17:

    // End:0x9B [Loop If]
    if(i < Len(uname))
    {
        // End:0x91
        if(InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJMLMNOPQRSTUVWXYZ0123456789!%^*(){}[]<>.,", Mid(uname, i, 1)) == -1)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    return true;
    //return;    
}

function UnlinkUsers()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x49 [Loop If]
    if(i < Users.Count())
    {
        Users.Get(i).RemoveGroup(self);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x50:

    // End:0x92 [Loop If]
    if(i < Managers.Count())
    {
        Managers.Get(i).RemoveManagedGroup(self);
        i++;
        // [Loop Continue]
        goto J0x50;
    }
    //return;    
}

function RemoveUser(wAdminUser User)
{
    // End:0x61
    if(User != none)
    {
        // End:0x36
        if(Users.Contains(User))
        {
            Users.Remove(User);
        }
        // End:0x61
        if(Managers.Contains(User))
        {
            Managers.Remove(User);
        }
    }
    //return;    
}

function bool HasPrivilege(string priv)
{
    return (bMasterAdmin || InStr(("|" $ Privileges) $ "|", ("|" $ priv) $ "|") != -1) || InStr(("|" $ Left(Privileges, 1)) $ "|", ("|" $ priv) $ "|") != -1;
    //return;    
}
