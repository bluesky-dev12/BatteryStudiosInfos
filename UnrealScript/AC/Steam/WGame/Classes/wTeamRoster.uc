/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTeamRoster.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:8
 *
 *******************************************************************************/
class wTeamRoster extends UnrealTeamInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
    local array<PlayerRecord> PlayerRecords;
    local int i, j;

    super(Actor).PostBeginPlay();
    class'wUtil'.static.GetPlayerList(PlayerRecords);
    i = 0;
    J0x1e:
    // End:0x7a [While If]
    if(i < RosterNames.Length)
    {
        j = Roster.Length;
        Roster.Length = Roster.Length + 1;
        Roster[j] = class'wRosterEntry'.static.CreateRosterEntryCharacter(RosterNames[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
}

function RosterEntry GetNamedBot(string botname)
{
    local array<PlayerRecord> PlayerRecords;
    local PlayerRecord pR;

    class'wUtil'.static.GetPlayerList(PlayerRecords);
    pR = class'wUtil'.static.FindPlayerRecord(botname);
    return class'wRosterEntry'.static.CreateRosterEntry(pR.RecordIndex);
}

function Initialize(int TeamBots)
{
    local int i;

    i = Roster.Length;
    J0x0c:
    // End:0x2b [While If]
    if(i < TeamBots)
    {
        AddRandomPlayer();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0c;
    }
    i = 0;
    J0x32:
    // End:0x61 [While If]
    if(i < TeamBots)
    {
        Roster[i].PrecacheRosterFor(self);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
}

function FillPlayerTeam(GameProfile G)
{
    local int i, j, limit;

    limit = Min(G.4, G.GetNumTeammatesForMatch());
    i = 0;
    J0x29:
    // End:0xd4 [While If]
    if(i < limit)
    {
        j = Roster.Length;
        Roster.Length = Roster.Length + 1;
        Roster[j] = class'wRosterEntry'.static.CreateRosterEntryCharacter(G.PlayerTeam[G.PlayerLineup[i]]);
        Roster[j].SetOrders(G.PlayerPositions[G.PlayerLineup[i]]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x29;
    }
    TeamSymbolName = G.TeamSymbolName;
}

function RosterEntry GetRandomPlayer()
{
    local array<PlayerRecord> PlayerRecords;
    local int RND, i, Num, Max, total;

    class'wUtil'.static.GetPlayerList(PlayerRecords);
    i = 0;
    J0x18:
    // End:0x4b [While If]
    if(i < PlayerRecords.Length)
    {
        Max += PlayerRecords[i].BotUse;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    RND = Rand(Max);
    i = 0;
    J0x5f:
    // End:0xa4 [While If]
    if(i < PlayerRecords.Length)
    {
        total += PlayerRecords[i].BotUse;
        // End:0x9a
        if(total >= RND)
        {
        }
        // End:0xa4
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5f;
        }
    }
    Num = i;
    // End:0xfb
    if(AvailableRecord(PlayerRecords[Num].Menu) && !AlreadyExistsEntry(PlayerRecords[Num].DefaultName, false))
    {
        return class'wRosterEntry'.static.CreateRosterEntry(Num);
    }
    i = Num;
    J0x106:
    // End:0x186 [While If]
    if(i < PlayerRecords.Length)
    {
        // End:0x17c
        if(AvailableRecord(PlayerRecords[i].Menu) && PlayerRecords[i].BotUse > 0 && !AlreadyExistsEntry(PlayerRecords[i].DefaultName, false))
        {
            return class'wRosterEntry'.static.CreateRosterEntry(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x106;
    }
    i = 0;
    J0x18d:
    // End:0x20c [While If]
    if(i < Num)
    {
        // End:0x202
        if(AvailableRecord(PlayerRecords[i].Menu) && PlayerRecords[i].BotUse > 0 && !AlreadyExistsEntry(PlayerRecords[i].DefaultName, false))
        {
            return class'wRosterEntry'.static.CreateRosterEntry(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18d;
    }
    return GetNamedBot("Jakob");
}

function bool AvailableRecord(string MenuString)
{
    return MenuString ~= "DUP" || MenuString ~= "SP" || MenuString ~= "" || MenuString ~= "UNLOCK";
}

function bool AlreadyExistsEntry(string CharacterName, bool bNoRecursion)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < Roster.Length)
    {
        // End:0x54
        if(wRosterEntry(Roster[i]) != none && wRosterEntry(Roster[i]).PlayerName == CharacterName)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0xbe
    if(!bNoRecursion && UnrealTeamInfo(Level.Game.OtherTeam(self)) != none)
    {
        return UnrealTeamInfo(Level.Game.OtherTeam(self)).AlreadyExistsEntry(CharacterName, true);
    }
    return false;
}

function bool BelongsOnTeam(class<Pawn> PawnClass)
{
    return true;
}
