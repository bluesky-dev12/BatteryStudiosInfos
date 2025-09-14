/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XAdmin\Classes\xAdminConfigIni.uc
 * Package Imports:
 *	XAdmin
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class xAdminConfigIni extends wAdminConfigBase
    config(XAdmin)
    parseconfig;

struct AdminUser
{
    var string AdminName;
    var string Password;
    var string Privileges;
    var array<string> Groups;
    var array<string> ManagedGroups;
};

struct AdminGroup
{
    var string GroupName;
    var string Privileges;
    var byte GameSecLevel;
};

var config array<AdminUser> AdminUsers;
var config array<AdminGroup> AdminGroups;

static function bool Load(wAdminUserList Users, wAdminGroupList Groups, bool bDontAddDefaultAdmin)
{
    local int i;
    local wAdminUser NewUser;
    local wAdminGroup NewGroup;
    local AdminUser User;
    local AdminGroup Group;
    local bool bDirty;

    Log("Loading Admins & Groups");
    i = 0;
    J0x22:
    // End:0xb3 [While If]
    if(i < default.AdminGroups.Length)
    {
        Group = default.AdminGroups[i];
        // End:0xa9
        if(Groups.FindByName(Group.GroupName) == none)
        {
            NewGroup = Groups.CreateGroup(Group.GroupName, Group.Privileges, Group.GameSecLevel);
            Groups.Add(NewGroup);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
    // End:0x161
    if(Groups.Count() == 0 || Groups.FindByName("Admin") == none)
    {
        Log("Creating Admin Group");
        Groups.Add(Groups.CreateGroup("Admin", "", byte(255)));
        Groups.Add(Groups.CreateGroup("MatchSetup", "Xm", 240));
        bDirty = true;
    }
    i = 0;
    J0x168:
    // End:0x240 [While If]
    if(i < default.AdminUsers.Length)
    {
        User = default.AdminUsers[i];
        // End:0x236
        if(Users.FindByName(User.AdminName) == none)
        {
            NewUser = Users.Create(User.AdminName, User.Password, User.Privileges);
            // End:0x236
            if(NewUser != none)
            {
                NewUser.AddGroupsByName(Groups, User.Groups);
                NewUser.AddManagedGroupsByName(Groups, User.ManagedGroups);
                Users.Add(NewUser);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x168;
    }
    // End:0x2c8
    if(Users.Count() == 0 && !bDontAddDefaultAdmin)
    {
        NewUser = Users.Create("Admin", "Admin", "");
        NewUser.AddGroup(Groups.FindByName("Admin"));
        Users.Add(NewUser);
        bDirty = true;
    }
    // End:0x2e1
    if(bDirty)
    {
        Save(Users, Groups);
    }
    return true;
}

static function bool Save(wAdminUserList Users, wAdminGroupList Groups)
{
    local int i, j, GrpLen, UserLen;
    local wAdminUser User;
    local wAdminGroup Group;

    default.AdminUsers.Length = Users.Count();
    default.AdminGroups.Length = Groups.Count();
    GrpLen = 0;
    i = 0;
    J0x3a:
    // End:0xfa [While If]
    if(i < Groups.Count())
    {
        Group = Groups.Get(i);
        // End:0xf0
        if(Group.GroupName != "URL::Admin")
        {
            default.AdminGroups[GrpLen].GroupName = Group.GroupName;
            default.AdminGroups[GrpLen].Privileges = Group.Privileges;
            default.AdminGroups[GrpLen].GameSecLevel = Group.GameSecLevel;
            ++ GrpLen;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    default.AdminGroups.Length = GrpLen;
    UserLen = 0;
    i = 0;
    J0x114:
    // End:0x372 [While If]
    if(i < Users.Count())
    {
        User = Users.Get(i);
        // End:0x368
        if(User.GetGroup("URL::Admin") == none)
        {
            default.AdminUsers[UserLen].AdminName = User.UserName;
            default.AdminUsers[UserLen].Password = User.Password;
            default.AdminUsers[UserLen].Privileges = User.Privileges;
            // End:0x293
            if(User.Groups != none && User.Groups.Count() > 0)
            {
                default.AdminUsers[UserLen].Groups.Length = User.Groups.Count();
                j = 0;
                J0x22a:
                // End:0x293 [While If]
                if(j < User.Groups.Count())
                {
                    default.AdminUsers[UserLen].Groups[j] = User.Groups.Get(j).GroupName;
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x22a;
                }
            }
            // End:0x361
            if(User.ManagedGroups != none && User.ManagedGroups.Count() > 0)
            {
                default.AdminUsers[UserLen].ManagedGroups.Length = User.ManagedGroups.Count();
                j = 0;
                J0x2f8:
                // End:0x361 [While If]
                if(j < User.ManagedGroups.Count())
                {
                    default.AdminUsers[UserLen].ManagedGroups[j] = User.ManagedGroups.Get(j).GroupName;
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x2f8;
                }
            }
            ++ UserLen;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x114;
    }
    default.AdminUsers.Length = UserLen;
    StaticSaveConfig();
    return true;
}
