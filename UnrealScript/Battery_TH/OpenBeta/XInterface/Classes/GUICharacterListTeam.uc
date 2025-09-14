class GUICharacterListTeam extends GUICharacterList
    editinlinenew
    instanced;

function InitList()
{
    ItemCount = 0;
    //return;    
}

function InitListInclusive(string S)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;

    Class'WGame.wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x1F:

    // End:0x6C [Loop If]
    if(i < AllPlayerList.Length)
    {
        // End:0x62
        if(AllPlayerList[i].Menu == S)
        {
            PlayerList[j++] = AllPlayerList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    ItemCount = j;
    Index = 0;
    //return;    
}

function InitListIncl(array<string> menus, optional string Race)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;
    local string menulist;

    menulist = (";" $ JoinArray(menus, ";")) $ ";";
    Class'WGame.wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x3D:

    // End:0xD0 [Loop If]
    if(i < AllPlayerList.Length)
    {
        // End:0xC6
        if((InStr(menulist, (";" $ AllPlayerList[i].Menu) $ ";") != -1) && (Race == "") || Caps(AllPlayerList[i].Species.default.SpeciesName) == Race)
        {
            PlayerList[j++] = AllPlayerList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x3D;
    }
    ItemCount = j;
    Index = 0;
    //return;    
}

function InitListExclusive(string S, optional string s2)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;

    Class'WGame.wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x1F:

    // End:0xA4 [Loop If]
    if(i < AllPlayerList.Length)
    {
        // End:0x9A
        if((AllPlayerList[i].Menu != S) && (s2 == "") || (s2 != "") && AllPlayerList[i].Menu != s2)
        {
            PlayerList[j++] = AllPlayerList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    ItemCount = j;
    Index = 0;
    //return;    
}

function InitListExcl(array<string> menus, optional string Race)
{
    local int i, j;
    local array<PlayerRecord> AllPlayerList;
    local string menulist;

    menulist = (";" $ JoinArray(menus, ";")) $ ";";
    Class'WGame.wUtil'.static.GetPlayerList(AllPlayerList);
    j = 0;
    i = 0;
    J0x3D:

    // End:0xD0 [Loop If]
    if(i < AllPlayerList.Length)
    {
        // End:0xC6
        if((InStr(menulist, (";" $ AllPlayerList[i].Menu) $ ";") == -1) && (Race == "") || Caps(AllPlayerList[i].Species.default.SpeciesName) == Race)
        {
            PlayerList[j++] = AllPlayerList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x3D;
    }
    ItemCount = j;
    Index = 0;
    //return;    
}

function ResetList(array<PlayerRecord> PlayerTeam, int numchars)
{
    local int i;

    // End:0x5B
    if(PlayerTeam.Length < numchars)
    {
        Log("GUICharacterListTeam::ResetList() could not reset list; invalid team.");
        return;
    }
    i = 0;
    J0x62:

    // End:0x92 [Loop If]
    if(i < numchars)
    {
        PlayerList[i] = PlayerTeam[i];
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    ItemCount = numchars;
    //return;    
}

function PopulateList(array<string> PlayerNames)
{
    local int i, j;
    local array<PlayerRecord> PRlist;

    PlayerList.Length = PlayerNames.Length;
    Class'WGame.wUtil'.static.GetPlayerList(PRlist);
    i = 0;
    J0x25:

    // End:0x9A [Loop If]
    if(i < PlayerNames.Length)
    {
        j = 0;
        J0x3C:

        // End:0x90 [Loop If]
        if(j < PRlist.Length)
        {
            // End:0x86
            if(PlayerNames[i] ~= PRlist[j].DefaultName)
            {
                PlayerList[i] = PRlist[j];
                // [Explicit Break]
                goto J0x90;
            }
            j++;
            // [Loop Continue]
            goto J0x3C;
        }
        J0x90:

        i++;
        // [Loop Continue]
        goto J0x25;
    }
    ItemCount = PlayerNames.Length;
    //return;    
}
