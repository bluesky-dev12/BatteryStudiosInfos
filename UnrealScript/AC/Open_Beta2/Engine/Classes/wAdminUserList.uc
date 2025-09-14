class wAdminUserList extends wAdminBase;

var private array<wAdminUser> Users;

function int Count()
{
    return Users.Length;
    //return;    
}

function wAdminUser Create(string UserName, string Password, string Privileges)
{
    local wAdminUser NewUser;

    NewUser = new (none) Class'Engine_Decompressed.wAdminUser';
    // End:0x38
    if(NewUser != none)
    {
        NewUser.Init(UserName, Password, Privileges);
    }
    return NewUser;
    //return;    
}

function Add(wAdminUser NewUser)
{
    // End:0x42
    if((NewUser != none) && !Contains(NewUser))
    {
        Users.Length = Users.Length + 1;
        Users[Users.Length - 1] = NewUser;
    }
    //return;    
}

function wAdminUser Get(int i)
{
    return Users[i];
    //return;    
}

function Remove(wAdminUser User)
{
    local int i;

    // End:0x4F
    if(User != none)
    {
        i = 0;
        J0x12:

        // End:0x4F [Loop If]
        if(i < Users.Length)
        {
            // End:0x45
            if(Users[i] == User)
            {
                Users.Remove(i, 1);
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
    }
    //return;    
}

function Clear()
{
    Users.Length = 0;
    //return;    
}

function bool Contains(wAdminUser User)
{
    local int i;

    // End:0x43
    if(User != none)
    {
        i = 0;
        J0x12:

        // End:0x43 [Loop If]
        if(i < Users.Length)
        {
            // End:0x39
            if(Users[i] == User)
            {
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
    }
    return false;
    //return;    
}

function wAdminUser FindByName(string UserName)
{
    local int i;

    // End:0x57
    if(UserName != "")
    {
        i = 0;
        J0x13:

        // End:0x57 [Loop If]
        if(i < Users.Length)
        {
            // End:0x4D
            if(Users[i].UserName == UserName)
            {
                return Users[i];
            }
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    return none;
    //return;    
}
