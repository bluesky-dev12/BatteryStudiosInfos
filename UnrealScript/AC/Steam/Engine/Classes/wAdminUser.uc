/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAdminUser.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:20
 *
 *******************************************************************************/
class wAdminUser extends wAdminBase
    dependson(wAdminBase);

var string UserName;
var string Password;
var string Privileges;
var string MergedPrivs;
var wAdminGroupList Groups;
var wAdminGroupList ManagedGroups;
var bool bMasterAdmin;

function Created()
{
    Groups = new (none) class'wAdminGroupList';
    ManagedGroups = new (none) class'wAdminGroupList';
}

function Init(string uname, string PASS, string privs)
{
    UserName = uname;
    Password = PASS;
    Privileges = privs;
    MergedPrivs = privs;
}

function AddGroup(wAdminGroup Group)
{
    // End:0xa0
    if(Group != none)
    {
        // End:0x38
        if(!Groups.Contains(Group))
        {
            Groups.Add(Group);
        }
        // End:0x6f
        if(!Group.Users.Contains(self))
        {
            Group.Users.Add(self);
        }
        // End:0x8c
        if(Group.bMasterAdmin)
        {
            bMasterAdmin = true;
        }
        // End:0xa0
        else
        {
            MergePrivs(Group.Privileges);
        }
    }
}

function RemoveGroup(wAdminGroup Group)
{
    // End:0x57
    if(Group != none && Groups.Contains(Group))
    {
        Group.Users.Remove(self);
        Groups.Remove(Group);
        RedoMergedPrivs();
    }
}

function AddManagedGroup(wAdminGroup Group)
{
    // End:0x6f
    if(Group != none)
    {
        // End:0x38
        if(!ManagedGroups.Contains(Group))
        {
            ManagedGroups.Add(Group);
        }
        // End:0x6f
        if(!Group.Managers.Contains(self))
        {
            Group.Managers.Add(self);
        }
    }
}

function RemoveManagedGroup(wAdminGroup Group)
{
    // End:0x51
    if(Group != none && ManagedGroups.Contains(Group))
    {
        Group.Managers.Remove(self);
        ManagedGroups.Remove(Group);
    }
}

function AddGroupsByName(wAdminGroupList lGroups, array<string> aGroupNames)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < aGroupNames.Length)
    {
        AddGroup(lGroups.FindByName(aGroupNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function AddManagedGroupsByName(wAdminGroupList lGroups, array<string> aGroupNames)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < aGroupNames.Length)
    {
        AddManagedGroup(lGroups.FindByName(aGroupNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool HasPrivilege(string priv)
{
    return bMasterAdmin || InStr("|" $ MergedPrivs $ "|", "|" $ priv $ "|") != -1 || InStr("|" $ MergedPrivs $ "|", "|" $ Left(priv, 1) $ "|") != -1;
}

function RedoMergedPrivs()
{
    local int i;

    bMasterAdmin = false;
    i = 0;
    J0x0f:
    // End:0x5e [While If]
    if(i < Groups.Count())
    {
        // End:0x54
        if(Groups.Get(i).bMasterAdmin)
        {
            bMasterAdmin = true;
        }
        // End:0x5e
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x0f;
        }
    }
    // End:0x72
    if(bMasterAdmin)
    {
        MergedPrivs = "";
    }
    // End:0xca
    else
    {
        MergedPrivs = Privileges;
        i = 0;
        J0x84:
        // End:0xca [While If]
        if(i < Groups.Count())
        {
            MergePrivs(Groups.Get(i).Privileges);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x84;
        }
    }
}

private function MergePrivs(string newprivs)
{
    local string priv;
    local int pos;

    // End:0xd1 [While If]
    if(newprivs != "")
    {
        J0x00:
        pos = InStr(newprivs, "|");
        // End:0x41
        if(pos == -1)
        {
            priv = newprivs;
            newprivs = "";
        }
        // End:0x68
        else
        {
            priv = Left(newprivs, pos);
            newprivs = Mid(newprivs, pos + 1);
        }
        pos = InStr("|" $ MergedPrivs $ "|", "|" $ priv $ "|");
        // End:0xce
        if(pos == -1)
        {
            // End:0xb7
            if(MergedPrivs == "")
            {
                MergedPrivs = priv;
            }
            // End:0xce
            else
            {
                MergedPrivs = MergedPrivs $ "|" $ priv;
            }
        }
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
}

function bool CanManageGroup(wAdminGroup Group)
{
    return bMasterAdmin || ManagedGroups.Contains(Group);
}

function bool CanManageUser(wAdminUser User)
{
    local int i;

    // End:0x0b
    if(bMasterAdmin)
    {
        return true;
    }
    i = 0;
    J0x12:
    // End:0x66 [While If]
    if(i < ManagedGroups.Count())
    {
        // End:0x5c
        if(ManagedGroups.Get(i).Users.Contains(User))
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return false;
}

static function bool ValidPass(string upass)
{
    local int i;

    // End:0x10
    if(Len(upass) < 6)
    {
        return false;
    }
    i = 0;
    J0x17:
    // End:0x9b [While If]
    if(i < Len(upass))
    {
        // End:0x91
        if(InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJMLMNOPQRSTUVWXYZ0123456789!%^*(){}[]<>.,", Mid(upass, i, 1)) == -1)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    return true;
}

static function bool ValidName(string uname)
{
    local int i;

    // End:0x0f
    if(Len(uname) < 1)
    {
        return false;
    }
    i = 0;
    J0x16:
    // End:0x9a [While If]
    if(i < Len(uname))
    {
        // End:0x90
        if(InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJMLMNOPQRSTUVWXYZ0123456789!%^*(){}[]<>.,", Mid(uname, i, 1)) == -1)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
    return true;
}

function int MaxSecLevel()
{
    local int i, M;

    // End:0x0c
    if(bMasterAdmin)
    {
        return 255;
    }
    M = 0;
    i = 0;
    J0x1a:
    // End:0x8b [While If]
    if(i < Groups.Count())
    {
        // End:0x81
        if(Groups.Get(i).GameSecLevel > M)
        {
            M = Groups.Get(i).GameSecLevel;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a;
    }
    return M;
}

function wAdminGroup GetGroup(string GroupName)
{
    return Groups.FindByName(GroupName);
}

function wAdminGroup GetManagedGroup(string GroupName)
{
    return ManagedGroups.FindByName(GroupName);
}

function wAdminUserList GetManagedUsers(wAdminGroupList uAllGroups)
{
    local wAdminUserList retList, uList;
    local wAdminGroupList uGroups;
    local int i, j;

    retList = new (none) class'wAdminUserList';
    // End:0x26
    if(bMasterAdmin)
    {
        uGroups = uAllGroups;
    }
    // End:0x31
    else
    {
        uGroups = ManagedGroups;
    }
    i = 0;
    J0x38:
    // End:0xcb [While If]
    if(i < uGroups.Count())
    {
        uList = uGroups.Get(i).Users;
        j = 0;
        J0x7b:
        // End:0xc1 [While If]
        if(j < uList.Count())
        {
            retList.Add(uList.Get(j));
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x7b;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return retList;
}

function UnlinkGroups()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x49 [While If]
    if(i < Groups.Count())
    {
        Groups.Get(i).RemoveUser(self);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x50:
    // End:0x92 [While If]
    if(i < ManagedGroups.Count())
    {
        ManagedGroups.Get(i).RemoveUser(self);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
}
