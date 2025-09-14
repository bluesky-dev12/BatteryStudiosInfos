/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAdminGroup.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:7
 *
 *******************************************************************************/
class wAdminGroup extends wAdminBase
    dependson(wAdminBase)
    dependson(wAdminUser);

var string GroupName;
var string Privileges;
var byte GameSecLevel;
var wAdminUserList Users;
var wAdminUserList Managers;
var bool bMasterAdmin;

function Created()
{
    Users = new (none) class'wAdminUserList';
    Managers = new (none) class'wAdminUserList';
}

function Init(string sGroupName, string sPrivileges, byte nGameSecLevel)
{
    GroupName = sGroupName;
    Privileges = sPrivileges;
    GameSecLevel = nGameSecLevel;
    // End:0x3a
    if(GroupName == "Admin")
    {
        bMasterAdmin = true;
    }
}

function SetPrivs(string privs)
{
    local int i;

    Privileges = privs;
    i = 0;
    J0x12:
    // End:0x53 [While If]
    if(i < Users.Count())
    {
        Users.Get(i).RedoMergedPrivs();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
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
    // End:0x9b [While If]
    if(i < Len(uname))
    {
        // End:0x91
        if(InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJMLMNOPQRSTUVWXYZ0123456789!%^*(){}[]<>.,", Mid(uname, i, 1)) == -1)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    return true;
}

function UnlinkUsers()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x49 [While If]
    if(i < Users.Count())
    {
        Users.Get(i).RemoveGroup(self);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x50:
    // End:0x92 [While If]
    if(i < Managers.Count())
    {
        Managers.Get(i).RemoveManagedGroup(self);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
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
}

function bool HasPrivilege(string priv)
{
    return bMasterAdmin || InStr("|" $ Privileges $ "|", "|" $ priv $ "|") != -1 || InStr("|" $ Left(Privileges, 1) $ "|", "|" $ priv $ "|") != -1;
}
