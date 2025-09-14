/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAdminGroupList.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:9
 *
 *******************************************************************************/
class wAdminGroupList extends wAdminBase
    dependson(wAdminBase)
    dependson(wAdminGroup);

var private array<wAdminGroup> Groups;

function int Count()
{
    return Groups.Length;
}

function wAdminGroup CreateGroup(string GroupName, string Privileges, byte GameSecLevel)
{
    local wAdminGroup NewGroup;

    NewGroup = FindByName(GroupName);
    // End:0x5a
    if(NewGroup == none)
    {
        NewGroup = new (none) class'wAdminGroup';
        // End:0x54
        if(NewGroup != none)
        {
            NewGroup.Init(GroupName, Privileges, GameSecLevel);
        }
        return NewGroup;
    }
    return none;
}

function Add(wAdminGroup Group)
{
    // End:0x42
    if(Group != none && !Contains(Group))
    {
        Groups.Length = Groups.Length + 1;
        Groups[Groups.Length - 1] = Group;
    }
}

function Remove(wAdminGroup Group)
{
    local int i;

    // End:0x4f
    if(Group != none)
    {
        i = 0;
        J0x12:
        // End:0x4f [While If]
        if(i < Groups.Length)
        {
            // End:0x45
            if(Groups[i] == Group)
            {
                Groups.Remove(i, 1);
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
}

function wAdminGroup Get(int Index)
{
    // End:0x1f
    if(Index < 0 || Index >= Groups.Length)
    {
        return none;
    }
    return Groups[Index];
}

function wAdminGroup FindByName(string GroupName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4b [While If]
    if(i < Groups.Length)
    {
        // End:0x41
        if(Groups[i].GroupName == GroupName)
        {
            return Groups[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function bool Contains(wAdminGroup Group)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < Groups.Length)
    {
        // End:0x2e
        if(Groups[i] == Group)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function wAdminGroup FindMasterGroup()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4a [While If]
    if(i < Groups.Length)
    {
        // End:0x40
        if(Groups[i].GameSecLevel == 255)
        {
            return Groups[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function Clear()
{
    Groups.Remove(0, Groups.Length);
}
