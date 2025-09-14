class TeamBlueConfigured extends wTeamRoster
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var config array<string> Characters;

function Initialize(int TeamBots)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x37 [Loop If]
    if(i < Roster.Length)
    {
        Roster[i].PrecacheRosterFor(self);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function int OverrideInitialBots(int N, UnrealTeamInfo t)
{
    return Roster.Length + t.Roster.Length;
    //return;    
}

function bool AllBotsSpawned()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < Roster.Length)
    {
        // End:0x33
        if(!Roster[i].bTaken)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function PostBeginPlay()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < Characters.Length)
    {
        RosterNames[i] = Characters[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    super.PostBeginPlay();
    //return;    
}

static function SetCharacters(array<string> Chars)
{
    default.Characters = Chars;
    //return;    
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
    //return;    
}

static function RemoveCharacter(int Index, int Count)
{
    // End:0x1F
    if((Index < 0) || Index >= default.Characters.Length)
    {
        return;
    }
    // End:0x36
    if(Count < 0)
    {
        Count = default.Characters.Length;
    }
    default.Characters.Remove(Index, Min(Count, default.Characters.Length - Index));
    //return;    
}

static function int FindCharIndex(string CharName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(i < default.Characters.Length)
    {
        // End:0x32
        if(default.Characters[i] ~= CharName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

static function GetAllCharacters(out array<string> Chars)
{
    Chars = default.Characters;
    //return;    
}
