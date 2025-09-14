class wAdminGroupList extends wAdminBase;

var private array<wAdminGroup> Groups;

function int Count()
{
    return Groups.Length;
    //return;    
}

function wAdminGroup CreateGroup(string GroupName, string Privileges, byte GameSecLevel)
{
    local wAdminGroup NewGroup;

    NewGroup = FindByName(GroupName);
    // End:0x5A
    if(NewGroup == none)
    {
        NewGroup = new (none) Class'Engine_Decompressed.wAdminGroup';
        // End:0x54
        if(NewGroup != none)
        {
            NewGroup.Init(GroupName, Privileges, GameSecLevel);
        }
        return NewGroup;
    }
    return none;
    //return;    
}

function Add(wAdminGroup Group)
{
    // End:0x42
    if((Group != none) && !Contains(Group))
    {
        Groups.Length = Groups.Length + 1;
        Groups[Groups.Length - 1] = Group;
    }
    //return;    
}

function Remove(wAdminGroup Group)
{
    local int i;

    // End:0x4F
    if(Group != none)
    {
        i = 0;
        J0x12:

        // End:0x4F [Loop If]
        if(i < Groups.Length)
        {
            // End:0x45
            if(Groups[i] == Group)
            {
                Groups.Remove(i, 1);
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
    }
    //return;    
}

function wAdminGroup Get(int Index)
{
    // End:0x1F
    if((Index < 0) || Index >= Groups.Length)
    {
        return none;
    }
    return Groups[Index];
    //return;    
}

function wAdminGroup FindByName(string GroupName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < Groups.Length)
    {
        // End:0x41
        if(Groups[i].GroupName == GroupName)
        {
            return Groups[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function bool Contains(wAdminGroup Group)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < Groups.Length)
    {
        // End:0x2E
        if(Groups[i] == Group)
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

function wAdminGroup FindMasterGroup()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4A [Loop If]
    if(i < Groups.Length)
    {
        // End:0x40
        if(int(Groups[i].GameSecLevel) == 255)
        {
            return Groups[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function Clear()
{
    Groups.Remove(0, Groups.Length);
    //return;    
}
