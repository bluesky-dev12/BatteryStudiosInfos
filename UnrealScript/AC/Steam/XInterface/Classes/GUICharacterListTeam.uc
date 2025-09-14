/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUICharacterListTeam.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:7
 *
 *******************************************************************************/
class GUICharacterListTeam extends GUICharacterList
    dependson(GUICharacterList)
    editinlinenew
    instanced;

function InitList()
{
    ItemCount = 0;
}

function InitListInclusive(string S)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;

    class'wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x1f:
    // End:0x6c [While If]
    if(i < AllPlayerList.Length)
    {
        // End:0x62
        if(AllPlayerList[i].Menu == S)
        {
            PlayerList[++ j] = AllPlayerList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    ItemCount = j;
    Index = 0;
}

function InitListIncl(array<string> menus, optional string Race)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;
    local string menulist;

    menulist = ";" $ JoinArray(menus, ";") $ ";";
    class'wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x3d:
    // End:0xd0 [While If]
    if(i < AllPlayerList.Length)
    {
        // End:0xc6
        if(InStr(menulist, ";" $ AllPlayerList[i].Menu $ ";") != -1 && Race == "" || Caps(AllPlayerList[i].Species.default.SpeciesName) == Race)
        {
            PlayerList[++ j] = AllPlayerList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
    ItemCount = j;
    Index = 0;
}

function InitListExclusive(string S, optional string s2)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;

    class'wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x1f:
    // End:0xa4 [While If]
    if(i < AllPlayerList.Length)
    {
        // End:0x9a
        if(AllPlayerList[i].Menu != S && s2 == "" || s2 != "" && AllPlayerList[i].Menu != s2)
        {
            PlayerList[++ j] = AllPlayerList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    ItemCount = j;
    Index = 0;
}

function InitListExcl(array<string> menus, optional string Race)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;
    local string menulist;

    menulist = ";" $ JoinArray(menus, ";") $ ";";
    class'wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x3d:
    // End:0xd0 [While If]
    if(i < AllPlayerList.Length)
    {
        // End:0xc6
        if(InStr(menulist, ";" $ AllPlayerList[i].Menu $ ";") == -1 && Race == "" || Caps(AllPlayerList[i].Species.default.SpeciesName) == Race)
        {
            PlayerList[++ j] = AllPlayerList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
    ItemCount = j;
    Index = 0;
}

function ResetList(array<PlayerRecord> PlayerTeam, int numchars)
{
    local int i;

    // End:0x5b
    if(PlayerTeam.Length < numchars)
    {
        Log("GUICharacterListTeam::ResetList() could not reset list; invalid team.");
        return;
    }
    i = 0;
    J0x62:
    // End:0x92 [While If]
    if(i < numchars)
    {
        PlayerList[i] = PlayerTeam[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    ItemCount = numchars;
}

function PopulateList(array<string> PlayerNames)
{
    local int i, j;
    local array<PlayerRecord> PRlist;

    PlayerList.Length = PlayerNames.Length;
    class'wUtil'.static.GetPlayerList(PRlist);
    i = 0;
    J0x25:
    // End:0x9a [While If]
    if(i < PlayerNames.Length)
    {
        j = 0;
        J0x3c:
        // End:0x90 [While If]
        if(j < PRlist.Length)
        {
            // End:0x86
            if(PlayerNames[i] ~= PRlist[j].DefaultName)
            {
                PlayerList[i] = PRlist[j];
            }
            // End:0x90
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x3c;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    ItemCount = PlayerNames.Length;
}
