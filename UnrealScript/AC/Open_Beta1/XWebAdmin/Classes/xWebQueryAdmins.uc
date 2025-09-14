class xWebQueryAdmins extends xWebQueryHandler within UTServerAdmin
    config;

struct RowGroup
{
    var array<string> Rows;
};

var config string AdminsIndexPage;
var config string UsersHomePage;
var config string UsersAccountPage;
var config string UsersAddPage;
var config string UsersBrowsePage;
var config string UsersEditPage;
var config string UsersGroupsPage;
var config string UsersMGroupsPage;
var config string GroupsAddPage;
var config string GroupsBrowsePage;
var config string GroupsEditPage;
var config string PrivilegeTable;
var localized string NoteUserHomePage;
var localized string NoteAccountPage;
var localized string NoteUserAddPage;
var localized string NoteUserEditPage;
var localized string NoteUsersBrowsePage;
var localized string NoteGroupAddPage;
var localized string NoteGroupEditPage;
var localized string NoteGroupsBrowsePage;
var localized string NoteGroupAccessPage;
var localized string NoteMGroupAccessPage;
var localized string NameText;
var localized string Deleting;
var localized string Group;
var localized string Groups;
var localized string User;
var localized string Modify;
var localized string Managed;
var localized string Privileges;
var localized string SecurityLevel;
var localized string AdminPageTitle;
var localized string AdminHomeTitle;
var localized string AdminAccountTitle;
var localized string BrowseUsersTitle;
var localized string BrowseGroupsTitle;
var localized string AddUserTitle;
var localized string AddUserButton;
var localized string AddGroupTitle;
var localized string AddGroupButton;
var localized string EditUserTitle;
var localized string EditUserButton;
var localized string EditGroupTitle;
var localized string EditGroupButton;
var localized string ModifyUserGroup;
var localized string ModifyMUserGroup;
var localized string UserRemoved;
var localized string GroupRemoved;
var localized string AdminNotFound;
var localized string GroupNotFound;
var localized string PrivTitle;
var localized string NoneText;
var localized string NoneItemText;
var localized string PasswordError;
var localized string InsufficientPrivs;
var localized string InvalidItem;
var localized string InvalidCharacters;
var localized string NameExists;
var localized string YouMustSelect;
var localized string DoesNotExist;
var localized string CouldNotCreate;
var localized string NegSecLevel;
var localized string CannotAssignHigher;
var localized string CannotAssignPrivs;

function bool Query(WebRequest Request, WebResponse Response)
{
    // End:0x1B
    if(!Outer.CanPerform(NeededPrivs))
    {
        return false;
    }
    switch(Mid(Request.URI, 1))
    {
        // End:0x48
        case DefaultPage:
            QueryAdminsFrame(Request, Response);
            return true;
        // End:0x62
        case AdminsIndexPage:
            QueryAdminsMenu(Request, Response);
            return true;
        // End:0x90
        case UsersHomePage:
            // End:0x8E
            if(!Outer.MapIsChanging())
            {
                QueryUsersHomePage(Request, Response);
            }
            return true;
        // End:0xBE
        case UsersAccountPage:
            // End:0xBC
            if(!Outer.MapIsChanging())
            {
                QueryUserAccountPage(Request, Response);
            }
            return true;
        // End:0xEC
        case UsersBrowsePage:
            // End:0xEA
            if(!Outer.MapIsChanging())
            {
                QueryUsersBrowsePage(Request, Response);
            }
            return true;
        // End:0x11A
        case UsersAddPage:
            // End:0x118
            if(!Outer.MapIsChanging())
            {
                QueryUsersAddPage(Request, Response);
            }
            return true;
        // End:0x148
        case UsersEditPage:
            // End:0x146
            if(!Outer.MapIsChanging())
            {
                QueryUsersEditPage(Request, Response);
            }
            return true;
        // End:0x176
        case UsersGroupsPage:
            // End:0x174
            if(!Outer.MapIsChanging())
            {
                QueryUsersGroupsPage(Request, Response);
            }
            return true;
        // End:0x1A4
        case UsersMGroupsPage:
            // End:0x1A2
            if(!Outer.MapIsChanging())
            {
                QueryUsersMGroupsPage(Request, Response);
            }
            return true;
        // End:0x1D2
        case GroupsBrowsePage:
            // End:0x1D0
            if(!Outer.MapIsChanging())
            {
                QueryGroupsBrowsePage(Request, Response);
            }
            return true;
        // End:0x200
        case GroupsAddPage:
            // End:0x1FE
            if(!Outer.MapIsChanging())
            {
                QueryGroupsAddPage(Request, Response);
            }
            return true;
        // End:0x22E
        case GroupsEditPage:
            // End:0x22C
            if(!Outer.MapIsChanging())
            {
                QueryGroupsEditPage(Request, Response);
            }
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function QueryAdminsFrame(WebRequest Request, WebResponse Response)
{
    local string Page;

    Page = Request.GetVariable("Page", UsersHomePage);
    Response.Subst("IndexURI", (AdminsIndexPage $ "?Page=") $ Page);
    Response.Subst("MainURI", Page);
    Outer.ShowPage(Response, DefaultPage);
    //return;    
}

function QueryAdminsMenu(WebRequest Request, WebResponse Response)
{
    Response.Subst("Title", AdminPageTitle);
    Response.Subst("UsersHomeURI", UsersHomePage);
    Response.Subst("UserAccountURI", UsersAccountPage);
    Response.Subst("UsersAddURI", UsersAddPage);
    Response.Subst("GroupsAddURI", GroupsAddPage);
    Response.Subst("UsersBrowseURI", UsersBrowsePage);
    Response.Subst("GroupsBrowseURI", GroupsBrowsePage);
    Outer.ShowPage(Response, AdminsIndexPage);
    //return;    
}

function QueryUsersHomePage(WebRequest Request, WebResponse Response)
{
    Response.Subst("AdminName", Outer.CurAdmin.UserName);
    Response.Subst("Section", AdminHomeTitle);
    Response.Subst("PageHelp", NoteUserHomePage);
    Outer.ShowPage(Response, UsersHomePage);
    //return;    
}

function QueryUserAccountPage(WebRequest Request, WebResponse Response)
{
    local string upass;

    Response.Subst("NameValue", Outer.HtmlEncode(Outer.CurAdmin.UserName));
    // End:0x13A
    if(Request.GetVariable("edit", "") != "")
    {
        upass = Request.GetVariable("Password", Outer.CurAdmin.Password);
        // End:0xD2
        if(!Outer.CurAdmin.ValidPass(upass))
        {
            Outer.StatusError(Response, PasswordError);            
        }
        else
        {
            // End:0x13A
            if(upass != Outer.CurAdmin.Password)
            {
                Outer.CurAdmin.Password = upass;
                Outer.Level.Game.AccessControl.SaveAdmins();
            }
        }
    }
    Response.Subst("PassValue", Outer.CurAdmin.Password);
    Response.Subst("PrivTable", GetPrivsTable(Outer.CurAdmin.Privileges, true));
    Response.Subst("GroupLinks", "");
    Response.Subst("SubmitValue", Outer.Accept);
    Response.Subst("PostAction", UsersAccountPage);
    Response.Subst("Section", AdminAccountTitle);
    Response.Subst("PageHelp", NoteAccountPage);
    Outer.ShowPage(Response, UsersAccountPage);
    //return;    
}

function QueryUsersBrowsePage(WebRequest Request, WebResponse Response)
{
    local wAdminUser xUser;
    local string tmp;

    // End:0x26A
    if(Outer.CanPerform("Al|Aa|Ae|Ag|Am"))
    {
        // End:0x1ED
        if(Request.GetVariable("delete") != "")
        {
            xUser = Outer.Level.Game.AccessControl.Users.FindByName(Request.GetVariable("delete"));
            // End:0x1C5
            if(xUser != none)
            {
                // End:0x173
                if(Outer.CurAdmin.CanManageUser(xUser))
                {
                    Outer.StatusOk(Response, Repl(UserRemoved, "%UserName%", Outer.HtmlEncode(xUser.UserName)));
                    xUser.UnlinkGroups();
                    Outer.Level.Game.AccessControl.Users.Remove(xUser);
                    Outer.Level.Game.AccessControl.SaveAdmins();                    
                }
                else
                {
                    tmp = Repl(InsufficientPrivs, "%Action%", Deleting);
                    tmp = Repl(tmp, "%Item%", Group);
                    Outer.StatusError(Response, tmp);
                }                
            }
            else
            {
                Outer.StatusError(Response, Repl(InvalidItem, "%Item%", Group));
            }
        }
        Response.Subst("BrowseList", GetUsersForBrowse(Response));
        Response.Subst("Section", BrowseUsersTitle);
        Response.Subst("PageHelp", NoteUsersBrowsePage);
        Outer.ShowPage(Response, UsersBrowsePage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryUsersAddPage(WebRequest Request, WebResponse Response)
{
    local wAdminUser xUser;
    local wAdminGroup xGroup;
    local wAdminGroupList xGroups;
    local string uname, upass, uprivs, ugrp, ErrMsg;

    // End:0x589
    if(Outer.CanPerform("Aa"))
    {
        // End:0x63
        if(Outer.CurAdmin.bMasterAdmin)
        {
            xGroups = Outer.Level.Game.AccessControl.Groups;            
        }
        else
        {
            xGroups = Outer.CurAdmin.ManagedGroups;
        }
        // End:0x3BF
        if(Request.GetVariable("addnew") != "")
        {
            uname = Request.GetVariable("Username");
            upass = Request.GetVariable("Password");
            uprivs = FixPrivs(Request, "");
            ugrp = Request.GetVariable("Usergroup");
            xGroup = xGroups.FindByName(ugrp);
            // End:0x168
            if(!Outer.CurAdmin.ValidName(uname))
            {
                ErrMsg = Repl(InvalidCharacters, "%Item%", User);                
            }
            else
            {
                // End:0x1BB
                if(Outer.Level.Game.AccessControl.Users.FindByName(uname) != none)
                {
                    ErrMsg = NameExists @ User;                    
                }
                else
                {
                    // End:0x1EB
                    if(!Outer.CurAdmin.ValidPass(upass))
                    {
                        ErrMsg = PasswordError;                        
                    }
                    else
                    {
                        // End:0x211
                        if(ugrp == "")
                        {
                            ErrMsg = (YouMustSelect @ Group) $ "!";                            
                        }
                        else
                        {
                            // End:0x236
                            if(xGroup == none)
                            {
                                ErrMsg = Repl(DoesNotExist, "%Item%", Group);
                            }
                        }
                    }
                }
            }
            Response.Subst("NameValue", Outer.HtmlEncode(uname));
            Response.Subst("PassValue", upass);
            Response.Subst("PrivTable", GetPrivsTable(uprivs));
            // End:0x397
            if(ErrMsg == "")
            {
                xUser = Outer.Level.Game.AccessControl.Users.Create(uname, upass, uprivs);
                // End:0x380
                if(xUser != none)
                {
                    xUser.AddGroup(xGroup);
                    Outer.Level.Game.AccessControl.Users.Add(xUser);
                    Outer.Level.Game.AccessControl.SaveAdmins();                    
                }
                else
                {
                    ErrMsg = (CouldNotCreate @ User) $ "!";
                }
            }
            // End:0x3BC
            if(ErrMsg != "")
            {
                Outer.StatusError(Response, ErrMsg);
            }            
        }
        else
        {
            Response.Subst("PrivTable", GetPrivsTable(""));
        }
        // End:0x4A7
        if(xUser != none)
        {
            Response.Subst("PostAction", UsersEditPage);
            Response.Subst("SubmitName", "addnew");
            Response.Subst("SubmitValue", EditUserButton);
            Response.Subst("Section", EditUserTitle);
            Response.Subst("PageHelp", NoteUserEditPage);
            Outer.ShowPage(Response, UsersEditPage);            
        }
        else
        {
            Response.Subst("Groups", GetGroupOptions(xGroups, ugrp));
            Response.Subst("PostAction", UsersAddPage);
            Response.Subst("SubmitName", "addnew");
            Response.Subst("SubmitValue", AddUserButton);
            Response.Subst("Section", AddUserTitle);
            Response.Subst("PageHelp", NoteUserAddPage);
            Outer.ShowPage(Response, UsersAddPage);
        }        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryUsersEditPage(WebRequest Request, WebResponse Response)
{
    local wAdminUser xUser;
    local string uname, upass, privs, ErrMsg;

    // End:0x493
    if(Outer.CanPerform("Aa|Ae"))
    {
        ErrMsg = "";
        Response.Subst("Section", EditUserTitle);
        xUser = Outer.Level.Game.AccessControl.GetUser(Request.GetVariable("edit"));
        // End:0x463
        if(xUser != none)
        {
            // End:0x40C
            if(Outer.CurAdmin.CanManageUser(xUser))
            {
                // End:0x2B0
                if(Request.GetVariable("mod") != "")
                {
                    uname = Request.GetVariable("Username");
                    upass = Request.GetVariable("Password");
                    privs = FixPrivs(Request, xUser.Privileges);
                    // End:0x1D0
                    if(uname != xUser.UserName)
                    {
                        // End:0x1B6
                        if(xUser.ValidName(uname))
                        {
                            // End:0x1A1
                            if(Outer.Level.Game.AccessControl.GetUser(uname) == none)
                            {
                                xUser.UserName = uname;                                
                            }
                            else
                            {
                                ErrMsg = NameExists @ User;
                            }                            
                        }
                        else
                        {
                            ErrMsg = Repl(InvalidCharacters, "%Item%", User);
                        }
                    }
                    // End:0x231
                    if((ErrMsg == "") && !upass == xUser.Password)
                    {
                        // End:0x226
                        if(xUser.ValidPass(upass))
                        {
                            xUser.Password = upass;                            
                        }
                        else
                        {
                            ErrMsg = PasswordError;
                        }
                    }
                    // End:0x27A
                    if((ErrMsg == "") && privs != xUser.Privileges)
                    {
                        xUser.Privileges = privs;
                        xUser.RedoMergedPrivs();
                    }
                    // End:0x2B0
                    if(ErrMsg == "")
                    {
                        Outer.Level.Game.AccessControl.SaveAdmins();
                    }
                }
                // End:0x2D5
                if(ErrMsg != "")
                {
                    Outer.StatusError(Response, ErrMsg);
                }
                Response.Subst("NameValue", Outer.HtmlEncode(xUser.UserName));
                Response.Subst("PassValue", Outer.HtmlEncode(xUser.Password));
                Response.Subst("PrivTable", GetPrivsTable(xUser.Privileges));
                Response.Subst("PostAction", UsersEditPage);
                Response.Subst("SubmitName", "mod");
                Response.Subst("SubmitValue", EditUserButton);
                Response.Subst("PageHelp", NoteUserEditPage);
                Outer.ShowPage(Response, UsersEditPage);                
            }
            else
            {
                ErrMsg = Repl(InsufficientPrivs, "%Action%", Modify);
                ErrMsg = Repl(ErrMsg, "%Item%", User);
                Outer.ShowMessage(Response, PrivTitle, ErrMsg);
            }            
        }
        else
        {
            Outer.ShowMessage(Response, AdminNotFound, Repl(DoesNotExist, "%Item%", User));
        }        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryUsersGroupsPage(WebRequest Request, WebResponse Response)
{
    local wAdminUser xUser;
    local wAdminGroupList xGroups;
    local wAdminGroup xGroup;
    local StringArray GrpNames;
    local string GroupRows, GrpName, str;
    local int i;
    local bool bModify, bChecked;

    // End:0x4CE
    if(Outer.CanPerform("Ag"))
    {
        xUser = Outer.Level.Game.AccessControl.Users.FindByName(Request.GetVariable("edit"));
        // End:0x49E
        if(xUser != none)
        {
            // End:0x447
            if(Outer.CurAdmin.CanManageUser(xUser))
            {
                // End:0xDC
                if(Outer.CurAdmin.bMasterAdmin)
                {
                    xGroups = Outer.Level.Game.AccessControl.Groups;                    
                }
                else
                {
                    xGroups = Outer.CurAdmin.ManagedGroups;
                }
                GroupRows = "";
                bModify = Request.GetVariable("submit") != "";
                GrpNames = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
                i = 0;
                J0x139:

                // End:0x1A5 [Loop If]
                if(i < xGroups.Count())
                {
                    GrpNames.Add(xGroups.Get(i).GroupName, xGroups.Get(i).GroupName);
                    i++;
                    // [Loop Continue]
                    goto J0x139;
                }
                i = 0;
                J0x1AC:

                // End:0x328 [Loop If]
                if(i < GrpNames.Count())
                {
                    GrpName = GrpNames.GetItem(i);
                    xGroup = xGroups.FindByName(GrpName);
                    bChecked = Request.GetVariable(GrpName) != "";
                    // End:0x280
                    if(bModify)
                    {
                        // End:0x263
                        if(xUser.Groups.Contains(xGroup))
                        {
                            // End:0x260
                            if(!bChecked)
                            {
                                xUser.RemoveGroup(xGroup);
                            }                            
                        }
                        else
                        {
                            // End:0x280
                            if(bChecked)
                            {
                                xUser.AddGroup(xGroup);
                            }
                        }
                    }
                    Response.Subst("GroupName", GrpName);
                    str = "";
                    // End:0x2D7
                    if(xUser.Groups.Contains(xGroup))
                    {
                        str = " checked";
                    }
                    Response.Subst("Checked", str);
                    GroupRows $= Outer.WebInclude("users_groups_row");
                    i++;
                    // [Loop Continue]
                    goto J0x1AC;
                }
                // End:0x35B
                if(bModify)
                {
                    Outer.Level.Game.AccessControl.SaveAdmins();
                }
                Response.Subst("NameValue", Outer.HtmlEncode(xUser.UserName));
                Response.Subst("GroupRows", GroupRows);
                Response.Subst("PostAction", UsersGroupsPage);
                Response.Subst("Section", ModifyUserGroup @ Outer.HtmlEncode(xUser.UserName));
                Response.Subst("PageHelp", NoteGroupAccessPage);
                Outer.ShowPage(Response, UsersGroupsPage);                
            }
            else
            {
                str = Repl(InsufficientPrivs, "%Action%", Modify);
                str = Repl(str, "%Item%", User);
                Outer.ShowMessage(Response, PrivTitle, str);
            }            
        }
        else
        {
            Outer.ShowMessage(Response, AdminNotFound, Repl(DoesNotExist, "%Item%", User));
        }        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryUsersMGroupsPage(WebRequest Request, WebResponse Response)
{
    local wAdminUser xUser;
    local wAdminGroupList xGroups;
    local wAdminGroup xGroup;
    local StringArray GrpNames;
    local string GroupRows, GrpName, str;
    local int i;
    local bool bModify, bChecked;

    // End:0x4EB
    if(Outer.CanPerform("Am"))
    {
        xUser = Outer.Level.Game.AccessControl.Users.FindByName(Request.GetVariable("edit"));
        // End:0x4BB
        if(xUser != none)
        {
            // End:0x464
            if(Outer.CurAdmin.CanManageUser(xUser))
            {
                // End:0xDC
                if(Outer.CurAdmin.bMasterAdmin)
                {
                    xGroups = Outer.Level.Game.AccessControl.Groups;                    
                }
                else
                {
                    xGroups = Outer.CurAdmin.ManagedGroups;
                }
                GroupRows = "";
                bModify = Request.GetVariable("submit") != "";
                GrpNames = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
                i = 0;
                J0x139:

                // End:0x1A5 [Loop If]
                if(i < xGroups.Count())
                {
                    GrpNames.Add(xGroups.Get(i).GroupName, xGroups.Get(i).GroupName);
                    i++;
                    // [Loop Continue]
                    goto J0x139;
                }
                i = 0;
                J0x1AC:

                // End:0x328 [Loop If]
                if(i < GrpNames.Count())
                {
                    GrpName = GrpNames.GetItem(i);
                    xGroup = xGroups.FindByName(GrpName);
                    bChecked = Request.GetVariable(GrpName) != "";
                    // End:0x280
                    if(bModify)
                    {
                        // End:0x263
                        if(xUser.ManagedGroups.Contains(xGroup))
                        {
                            // End:0x260
                            if(!bChecked)
                            {
                                xUser.RemoveManagedGroup(xGroup);
                            }                            
                        }
                        else
                        {
                            // End:0x280
                            if(bChecked)
                            {
                                xUser.AddManagedGroup(xGroup);
                            }
                        }
                    }
                    Response.Subst("GroupName", GrpName);
                    str = "";
                    // End:0x2D7
                    if(xUser.ManagedGroups.Contains(xGroup))
                    {
                        str = " checked";
                    }
                    Response.Subst("Checked", str);
                    GroupRows $= Outer.WebInclude("users_groups_row");
                    i++;
                    // [Loop Continue]
                    goto J0x1AC;
                }
                // End:0x35B
                if(bModify)
                {
                    Outer.Level.Game.AccessControl.SaveAdmins();
                }
                Response.Subst("Managed", Managed);
                Response.Subst("NameValue", Outer.HtmlEncode(xUser.UserName));
                Response.Subst("GroupRows", GroupRows);
                Response.Subst("PostAction", UsersMGroupsPage);
                Response.Subst("Section", ModifyMUserGroup @ Outer.HtmlEncode(xUser.UserName));
                Response.Subst("PageHelp", NoteMGroupAccessPage);
                Outer.ShowPage(Response, UsersGroupsPage);                
            }
            else
            {
                str = Repl(InsufficientPrivs, "%Action%", Modify);
                str = Repl(str, "%Item%", User);
                Outer.ShowMessage(Response, PrivTitle, str);
            }            
        }
        else
        {
            Outer.ShowMessage(Response, AdminNotFound, Repl(DoesNotExist, "%Item%", User));
        }        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryGroupsBrowsePage(WebRequest Request, WebResponse Response)
{
    local wAdminGroup xGroup;
    local string str;

    // End:0x262
    if(Outer.CanPerform("Gl|Ge"))
    {
        Response.Subst("Section", BrowseGroupsTitle);
        // End:0x202
        if(Request.GetVariable("delete") != "")
        {
            xGroup = Outer.Level.Game.AccessControl.Groups.FindByName(Request.GetVariable("delete"));
            // End:0x1DA
            if(xGroup != none)
            {
                // End:0x188
                if(Outer.CurAdmin.CanManageGroup(xGroup))
                {
                    Outer.StatusOk(Response, Repl(GroupRemoved, "%GroupName%", Outer.HtmlEncode(xGroup.GroupName)));
                    xGroup.UnlinkUsers();
                    Outer.Level.Game.AccessControl.Groups.Remove(xGroup);
                    Outer.Level.Game.AccessControl.SaveAdmins();                    
                }
                else
                {
                    str = Repl(InsufficientPrivs, "%Action%", Deleting);
                    str = Repl(str, "%Item%", Group);
                    Outer.StatusError(Response, str);
                }                
            }
            else
            {
                Outer.StatusError(Response, Repl(InvalidItem, "%Item%", Group));
            }
        }
        Response.Subst("BrowseList", GetGroupsForBrowse(Response));
        Response.Subst("PageHelp", NoteGroupsBrowsePage);
        Outer.ShowPage(Response, GroupsBrowsePage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryGroupsAddPage(WebRequest Request, WebResponse Response)
{
    local wAdminGroup xGroup;
    local string gname, gprivs, ErrMsg;
    local int gsec;

    // End:0x47B
    if(Outer.CanPerform("Ga"))
    {
        // End:0x2F4
        if(Request.GetVariable("addnew") != "")
        {
            gname = Request.GetVariable("GroupName");
            gprivs = FixPrivs(Request, "");
            gsec = int(Request.GetVariable("GameSec"));
            // End:0xBD
            if(!Class'Engine.wAdminGroup'.static.ValidName(gname))
            {
                ErrMsg = Repl(InvalidCharacters, "%Item%", Group);                
            }
            else
            {
                // End:0x115
                if(Outer.Level.Game.AccessControl.Groups.FindByName(gname) != none)
                {
                    ErrMsg = (NameExists @ Group) $ "!";                    
                }
                else
                {
                    // End:0x12E
                    if(gsec < 0)
                    {
                        ErrMsg = NegSecLevel;                        
                    }
                    else
                    {
                        // End:0x15B
                        if(gsec > Outer.CurAdmin.MaxSecLevel())
                        {
                            ErrMsg = CannotAssignHigher;
                        }
                    }
                }
            }
            Response.Subst("NameValue", Outer.HtmlEncode(gname));
            Response.Subst("PrivTable", GetPrivsTable(gprivs));
            Response.Subst("GameSecValue", string(gsec));
            // End:0x2CC
            if(ErrMsg == "")
            {
                xGroup = Outer.Level.Game.AccessControl.Groups.CreateGroup(gname, gprivs, byte(gsec));
                // End:0x2B5
                if(xGroup != none)
                {
                    Outer.CurAdmin.AddManagedGroup(xGroup);
                    Outer.Level.Game.AccessControl.Groups.Add(xGroup);
                    Outer.Level.Game.AccessControl.SaveAdmins();                    
                }
                else
                {
                    ErrMsg = (CouldNotCreate @ Group) $ "!";
                }
            }
            // End:0x2F1
            if(ErrMsg != "")
            {
                Outer.StatusError(Response, ErrMsg);
            }            
        }
        else
        {
            Response.Subst("PrivTable", GetPrivsTable(""));
        }
        // End:0x3C0
        if(xGroup != none)
        {
            Response.Subst("PostAction", GroupsEditPage);
            Response.Subst("SubmitName", "mod");
            Response.Subst("SubmitValue", EditGroupButton);
            Response.Subst("PageHelp", NoteGroupEditPage);
            Response.Subst("Section", EditGroupTitle);            
        }
        else
        {
            Response.Subst("PostAction", GroupsAddPage);
            Response.Subst("SubmitName", "addnew");
            Response.Subst("SubmitValue", AddGroupButton);
            Response.Subst("Section", AddGroupTitle);
            Response.Subst("PageHelp", NoteGroupAddPage);
        }
        Outer.ShowPage(Response, GroupsEditPage);        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function QueryGroupsEditPage(WebRequest Request, WebResponse Response)
{
    local wAdminGroup xGroup;
    local string ErrMsg, gname, gprivs;
    local int gsec;

    // End:0x437
    if(Outer.CanPerform("Gm"))
    {
        Response.Subst("Section", EditGroupTitle);
        xGroup = Outer.Level.Game.AccessControl.Groups.FindByName(Request.GetVariable("edit"));
        // End:0x407
        if(xGroup != none)
        {
            // End:0x3B0
            if(Outer.CurAdmin.CanManageGroup(xGroup))
            {
                // End:0x25E
                if(Request.GetVariable("mod") != "")
                {
                    gname = Request.GetVariable("GroupName");
                    gprivs = FixPrivs(Request, xGroup.Privileges);
                    gsec = Clamp(int(Request.GetVariable("GameSec")), 0, 255);
                    // End:0x1E6
                    if(gname != xGroup.GroupName)
                    {
                        // End:0x1CC
                        if(xGroup.ValidName(gname))
                        {
                            // End:0x1AF
                            if(Outer.Level.Game.AccessControl.Groups.FindByName(gname) == none)
                            {
                                xGroup.GroupName = gname;                                
                            }
                            else
                            {
                                ErrMsg = Repl(NameExists, "%Item%", Group);
                            }                            
                        }
                        else
                        {
                            ErrMsg = Repl(InvalidCharacters, "%Item%", Group);
                        }
                    }
                    // End:0x25E
                    if(ErrMsg == "")
                    {
                        // End:0x21E
                        if(gprivs != xGroup.Privileges)
                        {
                            xGroup.SetPrivs(gprivs);
                        }
                        xGroup.GameSecLevel = byte(gsec);
                        Outer.Level.Game.AccessControl.SaveAdmins();
                    }
                }
                // End:0x283
                if(ErrMsg != "")
                {
                    Outer.StatusError(Response, ErrMsg);
                }
                Response.Subst("NameValue", Outer.HtmlEncode(xGroup.GroupName));
                Response.Subst("PrivTable", GetPrivsTable(xGroup.Privileges));
                Response.Subst("GameSecValue", string(xGroup.GameSecLevel));
                Response.Subst("PostAction", GroupsEditPage);
                Response.Subst("SubmitName", "mod");
                Response.Subst("SubmitValue", EditGroupButton);
                Response.Subst("PageHelp", NoteGroupEditPage);
                Outer.ShowPage(Response, GroupsEditPage);                
            }
            else
            {
                ErrMsg = Repl(InsufficientPrivs, "%Action%", Modify);
                ErrMsg = Repl(ErrMsg, "%Item%", Group);
                Outer.ShowMessage(Response, PrivTitle, ErrMsg);
            }            
        }
        else
        {
            Outer.ShowMessage(Response, GroupNotFound, Repl(DoesNotExist, "%Item%", Group));
        }        
    }
    else
    {
        Outer.AccessDenied(Response);
    }
    //return;    
}

function string GetUsersForBrowse(WebResponse Response)
{
    local ObjectArray Users;
    local wAdminUser xUser;
    local string OutStr, tmp;
    local int i;
    local bool CanDelete;

    CanDelete = Outer.CanPerform("Aa");
    Users = ManagedUsers();
    // End:0xBD
    if(Users.Count() == 0)
    {
        Response.Subst("Content", Repl(NoneItemText, "%Item%", User));
        Response.Subst("RowContent", Outer.WebInclude(Outer.CellLeft));
        return Outer.WebInclude(Outer.RowLeft);
    }
    Response.Subst("Content", NameText);
    tmp = Outer.WebInclude(Outer.CellLeft);
    Response.Subst("Content", Privileges);
    tmp = tmp $ Outer.WebInclude(Outer.CellLeft);
    Response.Subst("Content", "&nbsp;");
    tmp = Eval(CanDelete, tmp $ Outer.WebInclude(Outer.CellLeft), tmp);
    Response.Subst("RowContent", tmp);
    OutStr = Outer.WebInclude(Outer.RowLeft);
    i = 0;
    J0x1E5:

    // End:0x455 [Loop If]
    if(i < Users.Count())
    {
        xUser = wAdminUser(Users.GetItem(i));
        Response.Subst("Username", Outer.HyperLink((UsersEditPage $ "?edit=") $ Outer.HtmlEncode(xUser.UserName), Outer.HtmlEncode(xUser.UserName), Outer.CanPerform("Ae|Aa")));
        Response.Subst("Privileges", xUser.Privileges);
        Response.Subst("Groups", Eval(Outer.CanPerform("Ag"), Outer.HyperLink((UsersGroupsPage $ "?edit=") $ Outer.HtmlEncode(xUser.UserName), Groups, true), ""));
        Response.Subst("Managed", Eval(Outer.CanPerform("Am"), Outer.HyperLink((UsersMGroupsPage $ "?edit=") $ Outer.HtmlEncode(xUser.UserName), Managed $ Groups, true), ""));
        Response.Subst("Delete", Eval(CanDelete, Outer.HyperLink((UsersBrowsePage $ "?delete=") $ Outer.HtmlEncode(xUser.UserName), Outer.DeleteText, true), ""));
        OutStr $= Outer.WebInclude("users_row");
        i++;
        // [Loop Continue]
        goto J0x1E5;
    }
    return OutStr;
    //return;    
}

function string GetGroupsForBrowse(WebResponse Response)
{
    local wAdminGroup xGroup;
    local wAdminGroupList xGroups;
    local string OutStr, tmp;
    local int i;
    local bool CanDelete, CanEdit;

    CanDelete = Outer.CanPerform("Gd");
    CanEdit = Outer.CanPerform("Ge");
    // End:0x81
    if(Outer.CurAdmin.bMasterAdmin)
    {
        xGroups = Outer.Level.Game.AccessControl.Groups;        
    }
    else
    {
        xGroups = Outer.CurAdmin.ManagedGroups;
    }
    // End:0x135
    if(xGroups.Count() == 0)
    {
        Response.Subst("Content", Repl(NoneItemText, "%Item%", Group));
        Response.Subst("RowContent", Outer.WebInclude(Outer.CellLeft));
        return Outer.WebInclude(Outer.RowLeft);
    }
    Response.Subst("Content", NameText);
    tmp = Outer.WebInclude(Outer.CellLeft);
    Response.Subst("Content", Privileges);
    tmp = tmp $ Outer.WebInclude(Outer.CellLeft);
    Response.Subst("Content", SecurityLevel);
    tmp = tmp $ Outer.WebInclude(Outer.CellLeft);
    Response.Subst("Content", "&nbsp;");
    tmp = Eval(CanDelete, tmp $ Outer.WebInclude(Outer.CellLeft), tmp);
    Response.Subst("RowContent", tmp);
    OutStr = Outer.WebInclude(Outer.RowLeft);
    i = 0;
    J0x2A4:

    // End:0x43A [Loop If]
    if(i < xGroups.Count())
    {
        xGroup = xGroups.Get(i);
        Response.Subst("Groupname", Outer.HyperLink((GroupsEditPage $ "?edit=") $ Outer.HtmlEncode(xGroup.GroupName), Outer.HtmlEncode(xGroup.GroupName), true));
        Response.Subst("Privileges", xGroup.Privileges);
        Response.Subst("Gamesec", string(xGroup.GameSecLevel));
        Response.Subst("Delete", Eval(CanDelete, Outer.HyperLink((GroupsBrowsePage $ "?delete=") $ Outer.HtmlEncode(xGroup.GroupName), Outer.DeleteText, true), ""));
        OutStr $= Outer.WebInclude("groups_row");
        i++;
        // [Loop Continue]
        goto J0x2A4;
    }
    return OutStr;
    //return;    
}

function string GetPrivsHeader(string privs, string Text, bool cond, string Tag)
{
    Outer.Resp.Subst("Checkbox", Outer.Checkbox(Tag, InStr(("|" $ privs) $ "|", ("|" $ Tag) $ "|") != -1, !cond));
    Outer.Resp.Subst("Text", Text);
    return Outer.WebInclude("privs_header");
    //return;    
}

function string GetPrivsItem(string privs, string Text, bool cond, string Tag, optional bool bReadOnly)
{
    local string S;

    // End:0x0E
    if(!cond)
    {
        return "";
    }
    cond = InStr(("|" $ privs) $ "|", ("|" $ Tag) $ "|") != -1;
    J0x3C:

    // End:0x8D [Loop If]
    if((privs != "") && cond == true)
    {
        S = Outer.NextPriv(privs);
        // End:0x8A
        if(S == Left(Tag, 1))
        {
            cond = false;
        }
        // [Loop Continue]
        goto J0x3C;
    }
    Outer.Resp.Subst("Checkbox", Outer.Checkbox(Tag, cond, !bReadOnly));
    Outer.Resp.Subst("Text", Text);
    return Outer.WebInclude("privs_element");
    //return;    
}

function ObjectArray ManagedUsers()
{
    local ObjectArray Users;
    local int i, j;
    local wAdminGroup xGroup;
    local wAdminUser xUser;
    local wAdminGroupList xGroups;

    Users = new (none) Class'XWebAdmin_Decompressed.SortedObjectArray';
    // End:0x5C
    if(Outer.CurAdmin.bMasterAdmin)
    {
        xGroups = Outer.Level.Game.AccessControl.Groups;        
    }
    else
    {
        xGroups = Outer.CurAdmin.ManagedGroups;
    }
    i = 0;
    J0x80:

    // End:0x14F [Loop If]
    if(i < xGroups.Count())
    {
        xGroup = xGroups.Get(i);
        j = 0;
        J0xBA:

        // End:0x145 [Loop If]
        if(j < xGroup.Users.Count())
        {
            xUser = xGroup.Users.Get(j);
            // End:0x13B
            if(Users.FindItemId(xUser) < 0)
            {
                Users.Add(xUser, xUser.UserName);
            }
            j++;
            // [Loop Continue]
            goto J0xBA;
        }
        i++;
        // [Loop Continue]
        goto J0x80;
    }
    return Users;
    //return;    
}

function string MakePrivsTable(wPrivilegeBase PM, string privs, bool bReadOnly)
{
    local int TagIndex, CurCol, maxcols;
    local string MainStr, SubStr, Main, SPriv, OutStr, PrivHeader,
	    PrivItems;

    local bool bShowPrivGroup, bHasPriv, bCanEdit;

    MainStr = PM.MainPrivs;
    OutStr = "";
    TagIndex = 0;
    maxcols = 3;
    CurCol = 1;
    J0x32:

    // End:0x232 [Loop If]
    if(MainStr != "")
    {
        Main = Outer.NextPriv(MainStr);
        SubStr = PM.SubPrivs;
        bShowPrivGroup = CheckPrivilegeGroup(Main, SubStr);
        bCanEdit = Outer.CanPerform(Main) && !bReadOnly;
        PrivHeader = "";
        PrivHeader = GetPrivsHeader(privs, PM.Tags[TagIndex++], bCanEdit, Main);
        J0xE5:

        // End:0x1D2 [Loop If]
        if(SubStr != "")
        {
            SPriv = Outer.NextPriv(SubStr);
            bHasPriv = Outer.CanPerform(SPriv);
            bCanEdit = !bReadOnly && bHasPriv;
            // End:0x1CF
            if(((Left(SPriv, 1) == Main) && bShowPrivGroup) && bHasPriv)
            {
                // End:0x192
                if(CurCol > maxcols)
                {
                    CurCol = 1;
                    PrivItems $= "</tr><tr>";
                }
                PrivItems $= (GetPrivsItem(privs, PM.Tags[TagIndex++], true, SPriv, bCanEdit));
                CurCol++;
            }
            // [Loop Continue]
            goto J0xE5;
        }
        // End:0x22F
        if(bShowPrivGroup)
        {
            Outer.Resp.Subst("PrivilegeRows", PrivItems);
            OutStr = (OutStr $ PrivHeader) $ Outer.WebInclude(PrivilegeTable);
        }
        // [Loop Continue]
        goto J0x32;
    }
    return OutStr;
    //return;    
}

function string GetPrivsTable(string privs, optional bool bNoEdit)
{
    local string str;
    local int i;

    str = "";
    i = 0;
    J0x0F:

    // End:0x9A [Loop If]
    if(i < Outer.Level.Game.AccessControl.PrivManagers.Length)
    {
        str = str $ (MakePrivsTable(Outer.Level.Game.AccessControl.PrivManagers[i], privs, bNoEdit));
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    // End:0xB1
    if(str == "")
    {
        str = CannotAssignPrivs;
    }
    return str;
    //return;    
}

function string FixPrivs(WebRequest Request, string oldprivs)
{
    local string privs, myprivs, priv;

    // End:0x4D
    if(Outer.CurAdmin.bMasterAdmin)
    {
        myprivs = Outer.Level.Game.AccessControl.AllPrivs;        
    }
    else
    {
        myprivs = Outer.CurAdmin.MergedPrivs;
    }
    privs = "";
    J0x72:

    // End:0xEB [Loop If]
    if(oldprivs != "")
    {
        priv = Outer.NextPriv(oldprivs);
        // End:0xE8
        if(InStr(("|" $ myprivs) $ "|", ("|" $ priv) $ "|") == -1)
        {
            // End:0xDA
            if(privs != "")
            {
                privs $= "|";
            }
            privs $= priv;
        }
        // [Loop Continue]
        goto J0x72;
    }
    J0xEB:

    // End:0x184 [Loop If]
    if(myprivs != "")
    {
        priv = Outer.NextPriv(myprivs);
        // End:0x181
        if((Request.GetVariable(priv) != "") && InStr(("|" $ privs) $ "|", ("|" $ Left(priv, 1)) $ "|") == -1)
        {
            // End:0x173
            if(privs != "")
            {
                privs $= "|";
            }
            privs $= priv;
        }
        // [Loop Continue]
        goto J0xEB;
    }
    return privs;
    //return;    
}

function string GetGroupOptions(wAdminGroupList xGroups, string grpsel)
{
    local int i;
    local string OutStr, GrpName;
    local StringArray GrpNames;

    // End:0x3D
    if(xGroups.Count() == 0)
    {
        return ("<option value=\"\">" $ NoneText) $ "</option>";
    }
    GrpNames = new (none) Class'XWebAdmin_Decompressed.SortedStringArray';
    i = 0;
    J0x53:

    // End:0xBF [Loop If]
    if(i < xGroups.Count())
    {
        GrpNames.Add(xGroups.Get(i).GroupName, xGroups.Get(i).GroupName);
        i++;
        // [Loop Continue]
        goto J0x53;
    }
    // End:0xFC
    if(GrpNames.Count() == 0)
    {
        return ("<option value=\"\">" $ NoneText) $ "</option>";
    }
    OutStr = "";
    i = 0;
    J0x10B:

    // End:0x1CC [Loop If]
    if(i < GrpNames.Count())
    {
        GrpName = GrpNames.GetItem(i);
        OutStr = ((OutStr $ "<option value='") $ GrpName) $ "'";
        // End:0x18F
        if(GrpName == grpsel)
        {
            OutStr = OutStr $ " selected";
        }
        OutStr = ((OutStr $ ">") $ Outer.HtmlEncode(GrpName)) $ "</option>";
        i++;
        // [Loop Continue]
        goto J0x10B;
    }
    return OutStr;
    //return;    
}

function bool CheckPrivilegeGroup(string MainPriv, string SubPrivs)
{
    local string tmp;

    // End:0x19
    if(Outer.CanPerform(MainPriv))
    {
        return true;
    }
    J0x19:

    // End:0x5B [Loop If]
    if(SubPrivs != "")
    {
        tmp = Outer.NextPriv(SubPrivs);
        // End:0x58
        if(Outer.CanPerform(tmp))
        {
            return true;
        }
        // [Loop Continue]
        goto J0x19;
    }
    return false;
    //return;    
}

defaultproperties
{
    AdminsIndexPage="admins_menu"
    UsersHomePage="admins_home"
    UsersAccountPage="admins_account"
    UsersAddPage="users_add"
    UsersBrowsePage="users_browse"
    UsersEditPage="users_edit"
    UsersGroupsPage="users_groups"
    UsersMGroupsPage="users_mgroups"
    GroupsAddPage="groups_add"
    GroupsBrowsePage="groups_browse"
    GroupsEditPage="groups_edit"
    PrivilegeTable="admins_priv_table"
    NoteUserHomePage="??? &amp; ?? ?????."
    NoteAccountPage="??? ??? ??? ? ????.  ?? ??? ???? ???? ??? ??? ? ? ????."
    NoteUserAddPage="??? ? ??? ?????? ??? ???? ???? ??? ? ? ????. ? ????? ??? ??? ???? ?? ??? ???."
    NoteUserEditPage="??? ? ??? ?????? ??? ???? ???? ??? ??? ??? ? ????."
    NoteUsersBrowsePage="??? ??? ???? ?? ???? ??? ?? ??? ? ? ????."
    NoteGroupAddPage="?? ??? ??? ??? ??? ?? ? ????. ??? ?? ????? ??? ??? ?? ??? ?????."
    NoteGroupEditPage="? ??? ??? ??? ??? ? ????. ??? ?? ??? ???? ??? ? ?? ?? ??????."
    NoteGroupsBrowsePage="??? ??? ???? ?? ??? ? ? ????. ????? ?? ??? ?????."
    NoteGroupAccessPage="??? ?? ??? ??? ???? ???? ??? ? ????. ??? ?? ? ???? ?? ??? ??? ?? ??? ? ????."
    NoteMGroupAccessPage="??? ? ???? ??? ??? ??? ? ????. ??? ???? ? ???? ? ??? ??? ? ????."
    NameText="??"
    Deleting="???.."
    Group="??"
    Groups="???"
    User="??"
    Modify="???"
    Managed="??? "
    Privileges="???"
    SecurityLevel="????"
    AdminPageTitle="??? &amp; ?? ??"
    AdminHomeTitle="??? ????"
    AdminAccountTitle="??"
    BrowseUsersTitle="??? ??? ??"
    BrowseGroupsTitle="??? ?? ??"
    AddUserTitle="??? ??? ??"
    AddUserButton="??? ??"
    AddGroupTitle="??? ?? ??? ??"
    AddGroupButton="?? ??"
    EditUserTitle="??? ???"
    EditUserButton="??? ???"
    EditGroupTitle="????? ???"
    EditGroupButton="?? ???"
    ModifyUserGroup="??? ?? :"
    ModifyMUserGroup="?? ?? :"
    UserRemoved="??? '%UserName%'? ???????.!"
    GroupRemoved="?? '%GroupName%'? ???????.!"
    AdminNotFound="??? ??"
    GroupNotFound="?? ??"
    PrivTitle="??? ?????."
    NoneText="*** ?? ***"
    NoneItemText="** %Item%? ???? ????. **"
    PasswordError="????? ??? ??? ????? ?? ??? 6?? ????? ???."
    InsufficientPrivs="??? ???? %Action% ? %Item% ? ?? ????."
    InvalidItem="??? %Item% ?????.!"
    InvalidCharacters="??? ??? %Item% ??? ???????.!"
    NameExists="??? ??? ??????."
    YouMustSelect="????? ???."
    DoesNotExist="???? %Item%? ???? ????.!"
    CouldNotCreate="?? ???? ????.(??)"
    NegSecLevel="????? ??? ??? ? ????!"
    CannotAssignHigher="??? ?????? ???? ???? ? ????."
    CannotAssignPrivs="??? ??? ? ????."
    DefaultPage="adminsframe"
    Title="Admins & Groups"
    NeededPrivs="A|G|Al|Aa|Ae|Ag|Am|Gl|Ga|Ge"
}