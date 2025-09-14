class wTeamRoster extends UnrealTeamInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local array<PlayerRecord> PlayerRecords;
    local int i, j;

    super(Actor).PostBeginPlay();
    Class'WGame_Decompressed.wUtil'.static.GetPlayerList(PlayerRecords);
    i = 0;
    J0x1E:

    // End:0x7A [Loop If]
    if(i < RosterNames.Length)
    {
        j = Roster.Length;
        Roster.Length = Roster.Length + 1;
        Roster[j] = Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntryCharacter(RosterNames[i]);
        i++;
        // [Loop Continue]
        goto J0x1E;
    }
    //return;    
}

function RosterEntry GetNamedBot(string botname)
{
    local array<PlayerRecord> PlayerRecords;
    local PlayerRecord pR;

    Class'WGame_Decompressed.wUtil'.static.GetPlayerList(PlayerRecords);
    pR = Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(botname);
    return Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntry(pR.RecordIndex);
    //return;    
}

function Initialize(int TeamBots)
{
    local int i;

    i = Roster.Length;
    J0x0C:

    // End:0x2B [Loop If]
    if(i < TeamBots)
    {
        AddRandomPlayer();
        i++;
        // [Loop Continue]
        goto J0x0C;
    }
    i = 0;
    J0x32:

    // End:0x61 [Loop If]
    if(i < TeamBots)
    {
        Roster[i].PrecacheRosterFor(self);
        i++;
        // [Loop Continue]
        goto J0x32;
    }
    //return;    
}

function FillPlayerTeam(GameProfile G)
{
    local int i, j, limit;

    limit = Min(G.4, G.GetNumTeammatesForMatch());
    i = 0;
    J0x29:

    // End:0xD4 [Loop If]
    if(i < limit)
    {
        j = Roster.Length;
        Roster.Length = Roster.Length + 1;
        Roster[j] = Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntryCharacter(G.PlayerTeam[G.PlayerLineup[i]]);
        Roster[j].SetOrders(G.PlayerPositions[G.PlayerLineup[i]]);
        i++;
        // [Loop Continue]
        goto J0x29;
    }
    TeamSymbolName = G.TeamSymbolName;
    //return;    
}

function RosterEntry GetRandomPlayer()
{
    local array<PlayerRecord> PlayerRecords;
    local int RND, i, Num, Max, total;

    Class'WGame_Decompressed.wUtil'.static.GetPlayerList(PlayerRecords);
    i = 0;
    J0x18:

    // End:0x4B [Loop If]
    if(i < PlayerRecords.Length)
    {
        Max += int(PlayerRecords[i].BotUse);
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    RND = Rand(Max);
    i = 0;
    J0x5F:

    // End:0xA4 [Loop If]
    if(i < PlayerRecords.Length)
    {
        total += int(PlayerRecords[i].BotUse);
        // End:0x9A
        if(total >= RND)
        {
            // [Explicit Break]
            goto J0xA4;
        }
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    J0xA4:

    Num = i;
    // End:0xFB
    if((AvailableRecord(PlayerRecords[Num].Menu)) && !AlreadyExistsEntry(PlayerRecords[Num].DefaultName, false))
    {
        return Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntry(Num);
    }
    i = Num;
    J0x106:

    // End:0x186 [Loop If]
    if(i < PlayerRecords.Length)
    {
        // End:0x17C
        if(((AvailableRecord(PlayerRecords[i].Menu)) && int(PlayerRecords[i].BotUse) > 0) && !AlreadyExistsEntry(PlayerRecords[i].DefaultName, false))
        {
            return Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntry(i);
        }
        i++;
        // [Loop Continue]
        goto J0x106;
    }
    i = 0;
    J0x18D:

    // End:0x20C [Loop If]
    if(i < Num)
    {
        // End:0x202
        if(((AvailableRecord(PlayerRecords[i].Menu)) && int(PlayerRecords[i].BotUse) > 0) && !AlreadyExistsEntry(PlayerRecords[i].DefaultName, false))
        {
            return Class'WGame_Decompressed.wRosterEntry'.static.CreateRosterEntry(i);
        }
        i++;
        // [Loop Continue]
        goto J0x18D;
    }
    return GetNamedBot("Jakob");
    //return;    
}

function bool AvailableRecord(string MenuString)
{
    return (((MenuString ~= "DUP") || MenuString ~= "SP") || MenuString ~= "") || MenuString ~= "UNLOCK";
    //return;    
}

function bool AlreadyExistsEntry(string CharacterName, bool bNoRecursion)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < Roster.Length)
    {
        // End:0x54
        if((wRosterEntry(Roster[i]) != none) && wRosterEntry(Roster[i]).PlayerName == CharacterName)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0xBE
    if(!bNoRecursion && UnrealTeamInfo(Level.Game.OtherTeam(self)) != none)
    {
        return UnrealTeamInfo(Level.Game.OtherTeam(self)).AlreadyExistsEntry(CharacterName, true);
    }
    return false;
    //return;    
}

function bool BelongsOnTeam(Class<Pawn> PawnClass)
{
    return true;
    //return;    
}
