/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DMRosterConfigured.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:9
 *
 *******************************************************************************/
class DMRosterConfigured extends wDMRoster
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

var config array<string> Characters;

function Initialize(int TeamBots)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x37 [While If]
    if(i < Roster.Length)
    {
        Roster[i].PrecacheRosterFor(self);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int OverrideInitialBots(int N, UnrealTeamInfo t)
{
    return Roster.Length;
}

function bool AllBotsSpawned()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < Roster.Length)
    {
        // End:0x33
        if(!Roster[i].bTaken)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function PostBeginPlay()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < Characters.Length)
    {
        RosterNames[i] = Characters[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    super.PostBeginPlay();
}

static function SetCharacters(array<string> Chars)
{
    default.Characters = Chars;
}

static function AddCharacter(string CharName)
{
    local int i;

    i = FindCharIndex(CharName);
    // End:0x32
    if(i == -1)
    {
        default.Characters[default.Characters.Length] = CharName;
    }
}

static function RemoveCharacter(int Index, int Count)
{
    // End:0x1f
    if(Index < 0 || Index >= default.Characters.Length)
    {
        return;
    }
    // End:0x36
    if(Count < 0)
    {
        Count = default.Characters.Length;
    }
    default.Characters.Remove(Index, Min(Count, default.Characters.Length - Index));
}

static function int FindCharIndex(string CharName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3c [While If]
    if(i < default.Characters.Length)
    {
        // End:0x32
        if(default.Characters[i] ~= CharName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

static function GetAllCharacters(out array<string> Chars)
{
    Chars = default.Characters;
}
