/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealTeamInfo.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:18
 *
 *******************************************************************************/
class UnrealTeamInfo extends TeamInfo
    dependson(TeamAI)
    dependson(RosterEntry)
    dependson(UnrealMPGameInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() RosterEntry DefaultRosterEntry;
var() export editinline array<export editinline RosterEntry> Roster;
var() class<UnrealPawn> AllowedTeamMembers[32];
var() byte TeamAlliance;
var int DesiredTeamSize;
var TeamAI AI;
var Color HudTeamColor;
var string TeamSymbolName;
var array<string> RosterNames;
var float CurrentObjectiveProgress;
var int LastObjectiveTime;
var int ObjectivesDisabledCount;

function Reset()
{
    super(Actor).Reset();
    // End:0x33
    if(!UnrealMPGameInfo(Level.Game).bTeamScoreRounds)
    {
        Score = 0.0;
    }
}

function int OverrideInitialBots(int N, UnrealTeamInfo t)
{
    return N;
}

function bool AllBotsSpawned()
{
    return false;
}

function Initialize(int TeamBots);
function FillPlayerTeam(GameProfile G);
simulated function class<Pawn> NextLoadOut(class<Pawn> CurrentLoadout)
{
    local int i;
    local class<Pawn> Result;

    Result = AllowedTeamMembers[0];
    i = 0;
    J0x14:
    // End:0x84 [While If]
    if(i < 32 - 1)
    {
        // End:0x66
        if(AllowedTeamMembers[i] == CurrentLoadout)
        {
            // End:0x60
            if(AllowedTeamMembers[i + 1] != none)
            {
                Result = AllowedTeamMembers[i + 1];
            }
            // This is an implied JumpToken;
            goto J0x84;
        }
        // End:0x7a
        else
        {
            // End:0x7a
            if(AllowedTeamMembers[i] == none)
            {
            }
            // End:0x84
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    return Result;
}

function bool NeedsBotMoreThan(UnrealTeamInfo t)
{
    return DesiredTeamSize - Size > t.DesiredTeamSize - t.Size;
}

function RosterEntry ChooseBotClass(optional string botname)
{
    // End:0x18
    if(botname == "")
    {
        return GetNextBot(botname);
    }
    return GetNamedBot(botname);
}

function RosterEntry GetRandomPlayer();
function bool AlreadyExistsEntry(string CharacterName, bool bNoRecursion)
{
    return false;
}

function AddRandomPlayer()
{
    local int j;

    j = Roster.Length;
    Roster.Length = Roster.Length + 1;
    Roster[j] = GetRandomPlayer();
    Roster[j].PrecacheRosterFor(self);
}

function AddNamedBot(string botname)
{
    local int j;

    j = Roster.Length;
    Roster.Length = Roster.Length + 1;
    Roster[j] = GetNamedBot(botname);
    Roster[j].PrecacheRosterFor(self);
}

function RosterEntry GetNextBot(string botname)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5e [While If]
    if(i < Roster.Length)
    {
        // End:0x54
        if(!Roster[i].bTaken)
        {
            Roster[i].bTaken = true;
            return Roster[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = Roster.Length;
    Roster.Length = Roster.Length + 1;
    Roster[i] = GetNamedBot(botname);
    Roster[i].bTaken = true;
    return Roster[i];
}

function RosterEntry GetNamedBot(string botname)
{
    return GetNextBot(botname);
}

function bool AddToTeam(Controller Other)
{
    local bool bResult;

    bResult = super.AddToTeam(Other);
    // End:0x60
    if(bResult && Other.PawnClass != none && !BelongsOnTeam(Other.PawnClass))
    {
        Other.PawnClass = DefaultPlayerClass;
    }
    return bResult;
}

function bool BelongsOnTeam(class<Pawn> PawnClass)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x34 [While If]
    if(i < 32)
    {
        // End:0x2a
        if(PawnClass == AllowedTeamMembers[i])
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function SetBotOrders(Bot NewBot, RosterEntry R)
{
    // End:0x24
    if(AI != none)
    {
        AI.SetBotOrders(NewBot, R);
    }
}

function RemoveFromTeam(Controller Other)
{
    super.RemoveFromTeam(Other);
    // End:0x2a
    if(AI != none)
    {
        AI.RemoveFromTeam(Other);
    }
}

defaultproperties
{
    DesiredTeamSize=8
    HudTeamColor=(R=255,G=255,B=255,A=255)
}