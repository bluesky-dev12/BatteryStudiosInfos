class wAdminUser extends wAdminBase;

var string UserName;
var string Password;
var string Privileges;
var string MergedPrivs;
var wAdminGroupList Groups;
var wAdminGroupList ManagedGroups;
var bool bMasterAdmin;

function Created()
{
    Groups = new (none) Class'Engine.wAdminGroupList';
    ManagedGroups = new (none) Class'Engine.wAdminGroupList';
    //return;    
}

function Init(string uname, string PASS, string privs)
{
    UserName = uname;
    Password = PASS;
    Privileges = privs;
    MergedPrivs = privs;
    //return;    
}

function AddGroup(wAdminGroup Group)
{
    // End:0xA0
    if(Group != none)
    {
        // End:0x38
        if(!Groups.Contains(Group))
        {
            Groups.Add(Group);
        }
        // End:0x6F
        if(!Group.Users.Contains(self))
        {
            Group.Users.Add(self);
        }
        // End:0x8C
        if(Group.bMasterAdmin)
        {
            bMasterAdmin = true;            
        }
        else
        {
            MergePrivs(Group.Privileges);
        }
    }
    //return;    
}

function RemoveGroup(wAdminGroup Group)
{
    // End:0x57
    if((Group != none) && Groups.Contains(Group))
    {
        Group.Users.Remove(self);
        Groups.Remove(Group);
        RedoMergedPrivs();
    }
    //return;    
}

function AddManagedGroup(wAdminGroup Group)
{
    // End:0x6F
    if(Group != none)
    {
        // End:0x38
        if(!ManagedGroups.Contains(Group))
        {
            ManagedGroups.Add(Group);
        }
        // End:0x6F
        if(!Group.Managers.Contains(self))
        {
            Group.Managers.Add(self);
        }
    }
    //return;    
}

function RemoveManagedGroup(wAdminGroup Group)
{
    // End:0x51
    if((Group != none) && ManagedGroups.Contains(Group))
    {
        Group.Managers.Remove(self);
        ManagedGroups.Remove(Group);
    }
    //return;    
}

function AddGroupsByName(wAdminGroupList lGroups, array<string> aGroupNames)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < aGroupNames.Length)
    {
        AddGroup(lGroups.FindByName(aGroupNames[i]));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function AddManagedGroupsByName(wAdminGroupList lGroups, array<string> aGroupNames)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < aGroupNames.Length)
    {
        AddManagedGroup(lGroups.FindByName(aGroupNames[i]));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool HasPrivilege(string priv)
{
    return (bMasterAdmin || InStr(("|" $ MergedPrivs) $ "|", ("|" $ priv) $ "|") != -1) || InStr(("|" $ MergedPrivs) $ "|", ("|" $ Left(priv, 1)) $ "|") != -1;
    //return;    
}

function RedoMergedPrivs()
{
    local int i;

    bMasterAdmin = false;
    i = 0;
    J0x0F:

    // End:0x5E [Loop If]
    if(i < Groups.Count())
    {
        // End:0x54
        if(Groups.Get(i).bMasterAdmin)
        {
            bMasterAdmin = true;
            // [Explicit Break]
            goto J0x5E;
        }
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x5E:

    // End:0x72
    if(bMasterAdmin)
    {
        MergedPrivs = "";        
    }
    else
    {
        MergedPrivs = Privileges;
        i = 0;
        J0x84:

        // End:0xCA [Loop If]
        if(i < Groups.Count())
        {
            MergePrivs(Groups.Get(i).Privileges);
            i++;
            // [Loop Continue]
            goto J0x84;
        }
    }
    //return;    
}

private function MergePrivs(string newprivs)
{
    local string priv;
    local int pos;

    J0x00:
    // End:0xD1 [Loop If]
    if(newprivs != "")
    {
        pos = InStr(newprivs, "|");
        // End:0x41
        if(pos == -1)
        {
            priv = newprivs;
            newprivs = "";            
        }
        else
        {
            priv = Left(newprivs, pos);
            newprivs = Mid(newprivs, pos + 1);
        }
        pos = InStr(("|" $ MergedPrivs) $ "|", ("|" $ priv) $ "|");
        // End:0xCE
        if(pos == -1)
        {
            // End:0xB7
            if(MergedPrivs == "")
            {
                MergedPrivs = priv;                
            }
            else
            {
                MergedPrivs = (MergedPrivs $ "|") $ priv;
            }
        }
        // [Loop Continue]
        goto J0x00;
    }
    //return;    
}

function bool CanManageGroup(wAdminGroup Group)
{
    return bMasterAdmin || ManagedGroups.Contains(Group);
    //return;    
}

function bool CanManageUser(wAdminUser User)
{
    local int i;

    // End:0x0B
    if(bMasterAdmin)
    {
        return true;
    }
    i = 0;
    J0x12:

    // End:0x66 [Loop If]
    if(i < ManagedGroups.Count())
    {
        // End:0x5C
        if(ManagedGroups.Get(i).Users.Contains(User))
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return false;
    //return;    
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

    // End:0x9B [Loop If]
    if(i < Len(upass))
    {
        // End:0x91
        if(InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJMLMNOPQRSTUVWXYZ0123456789!%^*(){}[]<>.,", Mid(upass, i, 1)) == -1)
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

static function bool ValidName(string uname)
{
    local int i;

    // End:0x0F
    if(Len(uname) < 1)
    {
        return false;
    }
    i = 0;
    J0x16:

    // End:0x9A [Loop If]
    if(i < Len(uname))
    {
        // End:0x90
        if(InStr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJMLMNOPQRSTUVWXYZ0123456789!%^*(){}[]<>.,", Mid(uname, i, 1)) == -1)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    return true;
    //return;    
}

function int MaxSecLevel()
{
    local int i, M;

    // End:0x0C
    if(bMasterAdmin)
    {
        return 255;
    }
    M = 0;
    i = 0;
    J0x1A:

    // End:0x8B [Loop If]
    if(i < Groups.Count())
    {
        // End:0x81
        if(int(Groups.Get(i).GameSecLevel) > M)
        {
            M = int(Groups.Get(i).GameSecLevel);
        }
        i++;
        // [Loop Continue]
        goto J0x1A;
    }
    return M;
    //return;    
}

function wAdminGroup GetGroup(string GroupName)
{
    return Groups.FindByName(GroupName);
    //return;    
}

function wAdminGroup GetManagedGroup(string GroupName)
{
    return ManagedGroups.FindByName(GroupName);
    //return;    
}

function wAdminUserList GetManagedUsers(wAdminGroupList uAllGroups)
{
    local wAdminUserList retList, uList;
    local wAdminGroupList uGroups;
    local int i, j;

    retList = new (none) Class'Engine.wAdminUserList';
    // End:0x26
    if(bMasterAdmin)
    {
        uGroups = uAllGroups;        
    }
    else
    {
        uGroups = ManagedGroups;
    }
    i = 0;
    J0x38:

    // End:0xCB [Loop If]
    if(i < uGroups.Count())
    {
        uList = uGroups.Get(i).Users;
        j = 0;
        J0x7B:

        // End:0xC1 [Loop If]
        if(j < uList.Count())
        {
            retList.Add(uList.Get(j));
            j++;
            // [Loop Continue]
            goto J0x7B;
        }
        i++;
        // [Loop Continue]
        goto J0x38;
    }
    return retList;
    //return;    
}

function UnlinkGroups()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x49 [Loop If]
    if(i < Groups.Count())
    {
        Groups.Get(i).RemoveUser(self);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x50:

    // End:0x92 [Loop If]
    if(i < ManagedGroups.Count())
    {
        ManagedGroups.Get(i).RemoveUser(self);
        i++;
        // [Loop Continue]
        goto J0x50;
    }
    //return;    
}
