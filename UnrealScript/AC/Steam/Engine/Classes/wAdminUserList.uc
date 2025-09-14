/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAdminUserList.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class wAdminUserList extends wAdminBase
    dependson(wAdminBase)
    dependson(wAdminUser);

var private array<wAdminUser> Users;

function int Count()
{
    return Users.Length;
}

function wAdminUser Create(string UserName, string Password, string Privileges)
{
    local wAdminUser NewUser;

    NewUser = new (none) class'wAdminUser';
    // End:0x38
    if(NewUser != none)
    {
        NewUser.Init(UserName, Password, Privileges);
    }
    return NewUser;
}

function Add(wAdminUser NewUser)
{
    // End:0x42
    if(NewUser != none && !Contains(NewUser))
    {
        Users.Length = Users.Length + 1;
        Users[Users.Length - 1] = NewUser;
    }
}

function wAdminUser Get(int i)
{
    return Users[i];
}

function Remove(wAdminUser User)
{
    local int i;

    // End:0x4f
    if(User != none)
    {
        i = 0;
        J0x12:
        // End:0x4f [While If]
        if(i < Users.Length)
        {
            // End:0x45
            if(Users[i] == User)
            {
                Users.Remove(i, 1);
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
}

function Clear()
{
    Users.Length = 0;
}

function bool Contains(wAdminUser User)
{
    local int i;

    // End:0x43
    if(User != none)
    {
        i = 0;
        J0x12:
        // End:0x43 [While If]
        if(i < Users.Length)
        {
            // End:0x39
            if(Users[i] == User)
            {
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    return false;
}

function wAdminUser FindByName(string UserName)
{
    local int i;

    // End:0x57
    if(UserName != "")
    {
        i = 0;
        J0x13:
        // End:0x57 [While If]
        if(i < Users.Length)
        {
            // End:0x4d
            if(Users[i].UserName == UserName)
            {
                return Users[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    return none;
}
