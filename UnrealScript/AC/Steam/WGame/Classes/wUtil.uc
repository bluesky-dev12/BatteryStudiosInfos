/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wUtil.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:9
 *	Functions:28
 *
 *******************************************************************************/
class wUtil extends Object
    dependson(PlayerRecordClass)
    native;

struct native init PlayerRecord
{
    var() string DefaultName;
    var() class<SpeciesType> Species;
    var() string MeshName;
    var() string BodySkinName;
    var() string FaceSkinName;
    var() Material Portrait;
    var() string TextName;
    var() string VoiceClassName;
    var string Sex;
    var string Accuracy;
    var string Aggressiveness;
    var string StrafingAbility;
    var string CombatStyle;
    var string Tactics;
    var string ReactionTime;
    var string Jumpiness;
    var string Race;
    var string FavoriteWeapon;
    var string Menu;
    var string Skeleton;
    var() const int RecordIndex;
    var string Ragdoll;
    var byte BotUse;
    var bool UseSpecular;
    var bool TeamFace;
    var bool ZeroWeaponOffsets;
    var() class<wPlayerInfo> PlayerInfo;
};

struct MutatorRecord
{
    var() const class<Mutator> mutClass;
    var() const string ClassName;
    var() const string FriendlyName;
    var() const string Description;
    var() const string IconMaterialName;
    var() const string ConfigMenuClassName;
    var() const string GroupName;
    var() const int RecordIndex;
    var const byte bActivated;
};

var() const string SectionName;
var() const string FileExtension;
var() private const transient CachePlayers CachedPlayerList;
var localized string NoPreference;
var localized string FavoriteWeapon;
var localized string AgilityString;
var localized string TacticsString;
var localized string AccuracyString;
var localized string AggressivenessString;

// Export UwUtil::execGetPlayerList(FFrame&, void* const)
native(562) static final simulated function GetPlayerList(out array<PlayerRecord> PlayerRecords);
// Export UwUtil::execGetPlayerRecord(FFrame&, void* const)
native(563) static final simulated function PlayerRecord GetPlayerRecord(int Index);
// Export UwUtil::execFindUPLPlayerRecord(FFrame&, void* const)
native(564) static final simulated function PlayerRecord FindUPLPlayerRecord(string CharName);
// Export UwUtil::execLoadDecoText(FFrame&, void* const)
native static final function DecoText LoadDecoText(string PackageName, string DecoTextName, optional int ColumnCount);
static final function GetMutatorList(array<MutatorRecord> MutatorRecords);
static final simulated function PlayerRecord FindPlayerRecord(string CharName)
{
    local PlayerRecord PRE;
    local class<PlayerRecordClass> PRClass;

    PRE = FindUPLPlayerRecord(CharName);
    // End:0x7d
    if(PRE.DefaultName != CharName)
    {
        PRClass = class<PlayerRecordClass>(DynamicLoadObject(CharName $ "mod." $ CharName, class'Class', true));
        // End:0x7d
        if(PRClass != none)
        {
            PRE = PRClass.static.FillPlayerRecord();
            PRE.DefaultName = CharName;
        }
    }
    return PRE;
}

static final simulated function int GetSalaryFor(PlayerRecord PRE)
{
    local float Salary;

    Salary = 500.0;
    // End:0x27
    if(PRE.FavoriteWeapon == "")
    {
        Salary += float(5);
    }
    Salary += float(30) * float(PRE.Jumpiness);
    Salary += float(150) * float(PRE.Accuracy);
    // End:0x8f
    if(float(PRE.Accuracy) > 0.30)
    {
        Salary += float(250) * float(PRE.Accuracy) - 0.30;
    }
    Salary += float(70) * float(PRE.Tactics);
    // End:0xde
    if(float(PRE.Tactics) > 0.50)
    {
        Salary += float(100) * float(PRE.Tactics) - 0.50;
    }
    Salary += float(100) * float(PRE.StrafingAbility);
    // End:0x12d
    if(float(PRE.StrafingAbility) > 0.50)
    {
        Salary += float(100) * float(PRE.StrafingAbility) - 0.50;
    }
    Salary -= float(5) * Abs(float(PRE.Aggressiveness));
    Salary -= float(5) * Abs(float(PRE.CombatStyle));
    return int(Salary);
}

static final simulated function string GetFavoriteWeaponFor(PlayerRecord PRE)
{
    local class<wWeapon> WeaponClass;

    // End:0x52
    if(PRE.FavoriteWeapon != "")
    {
        WeaponClass = class<wWeapon>(DynamicLoadObject(PRE.FavoriteWeapon, class'Class'));
        // End:0x52
        if(WeaponClass != none)
        {
            return default.FavoriteWeapon @ WeaponClass.default.ItemName;
        }
    }
    return default.NoPreference;
}

static final simulated function int RatingModifier(string CharacterName)
{
    local int Hash;

    Hash = Asc(CharacterName);
    // End:0x20
    if(Hash == 2)
    {
        Hash = 1;
    }
    return int(float(Hash) % float(5) - float(2));
}

static final simulated function int AccuracyRating(PlayerRecord PRE)
{
    // End:0x47
    if(float(2) * float(PRE.Accuracy) < float(-1))
    {
        return int(float(55) + float(8) * FMax(-7.0, 2.0 * float(PRE.Accuracy)));
    }
    // End:0x76
    if(float(2) * float(PRE.Accuracy) == float(0))
    {
        return 75 - RatingModifier(PRE.DefaultName);
    }
    // End:0xca
    if(float(2) * float(PRE.Accuracy) < float(1))
    {
        return int(float(75) + float(20 * 2) * float(PRE.Accuracy) - 0.50 * float(RatingModifier(PRE.DefaultName)));
    }
    return Min(100, int(float(95) + float(2) * float(PRE.Accuracy)));
}

static final simulated function int AgilityRating(PlayerRecord PRE)
{
    local float Add;

    Add = 3.0 * float(PRE.Jumpiness);
    // End:0x5a
    if(float(PRE.StrafingAbility) < float(-1))
    {
        return int(Add + float(58) + float(8) * FMax(-7.0, float(PRE.StrafingAbility)));
    }
    // End:0x9f
    if(Add == float(0) && float(PRE.StrafingAbility) == float(0))
    {
        return int(float(75) + 0.50 * float(RatingModifier(PRE.DefaultName)));
    }
    // End:0xf0
    if(float(PRE.StrafingAbility) < float(1))
    {
        return int(Add + float(75) + float(17) * float(PRE.StrafingAbility) - 0.50 * float(RatingModifier(PRE.DefaultName)));
    }
    return Min(100, int(Add + float(92) + float(PRE.StrafingAbility)));
}

static final simulated function int TacticsRating(PlayerRecord PRE)
{
    // End:0x3a
    if(float(PRE.Tactics) < float(-1))
    {
        return int(float(55) + float(8) * FMax(-7.0, float(PRE.Tactics)));
    }
    // End:0x63
    if(float(PRE.Tactics) == float(0))
    {
        return 75 + RatingModifier(PRE.DefaultName);
    }
    // End:0xad
    if(float(PRE.Tactics) < float(1))
    {
        return int(float(75) + float(20) * float(PRE.Tactics) + 0.50 * float(RatingModifier(PRE.DefaultName)));
    }
    return Min(100, int(float(95) + float(PRE.Tactics)));
}

static final simulated function int AggressivenessRating(PlayerRecord PRE)
{
    return Clamp(int(float(73) + float(25) * float(PRE.Aggressiveness) + float(PRE.CombatStyle) + 0.50 * float(RatingModifier(PRE.DefaultName))), 0, 100);
}

static final simulated function int TeamAccuracyRating(GameProfile GP, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(GP.4, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x31:
    // End:0x7d [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += AccuracyRating(FindPlayerRecord(GP.PlayerTeam[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    // End:0xa3
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb4
    else
    {
        retval = AccuracyRating(pR);
    }
    return retval;
}

static final simulated function int TeamInfoAccuracyRating(UnrealTeamInfo UT, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(UT.RosterNames.Length, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x35:
    // End:0x81 [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += AccuracyRating(FindPlayerRecord(UT.RosterNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    // End:0xa7
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb8
    else
    {
        retval = AccuracyRating(pR);
    }
    return retval;
}

static final simulated function int TeamArrayAccuracyRating(array<string> Players)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;

    Count = 0.0;
    retval = 0;
    i = 0;
    J0x19:
    // End:0x5d [While If]
    if(i < Players.Length)
    {
        Count += 1.0;
        retval += AccuracyRating(FindPlayerRecord(Players[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    // End:0x83
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0x94
    else
    {
        retval = AccuracyRating(pR);
    }
    return retval;
}

static final simulated function int TeamAggressivenessRating(GameProfile GP, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(GP.4, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x31:
    // End:0x7d [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += AggressivenessRating(FindPlayerRecord(GP.PlayerTeam[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    // End:0xa3
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb4
    else
    {
        retval = AggressivenessRating(pR);
    }
    return retval;
}

static final simulated function int TeamInfoAggressivenessRating(UnrealTeamInfo UT, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(UT.RosterNames.Length, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x35:
    // End:0x81 [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += AggressivenessRating(FindPlayerRecord(UT.RosterNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    // End:0xa7
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb8
    else
    {
        retval = AggressivenessRating(pR);
    }
    return retval;
}

static final simulated function int TeamArrayAggressivenessRating(array<string> Players)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;

    Count = 0.0;
    retval = 0;
    i = 0;
    J0x19:
    // End:0x5d [While If]
    if(i < Players.Length)
    {
        Count += 1.0;
        retval += AggressivenessRating(FindPlayerRecord(Players[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    // End:0x83
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0x94
    else
    {
        retval = AggressivenessRating(pR);
    }
    return retval;
}

static final simulated function int TeamAgilityRating(GameProfile GP, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(GP.4, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x31:
    // End:0x7d [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += AgilityRating(FindPlayerRecord(GP.PlayerTeam[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    // End:0xa3
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb4
    else
    {
        retval = AgilityRating(pR);
    }
    return retval;
}

static final simulated function int TeamInfoAgilityRating(UnrealTeamInfo UT, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(UT.RosterNames.Length, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x35:
    // End:0x81 [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += AgilityRating(FindPlayerRecord(UT.RosterNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    // End:0xa7
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb8
    else
    {
        retval = AgilityRating(pR);
    }
    return retval;
}

static final simulated function int TeamArrayAgilityRating(array<string> Players)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;

    Count = 0.0;
    retval = 0;
    i = 0;
    J0x19:
    // End:0x5d [While If]
    if(i < Players.Length)
    {
        Count += 1.0;
        retval += AgilityRating(FindPlayerRecord(Players[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    // End:0x83
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0x94
    else
    {
        retval = AgilityRating(pR);
    }
    return retval;
}

static final simulated function int TeamTacticsRating(GameProfile GP, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(GP.4, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x31:
    // End:0x7d [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += TacticsRating(FindPlayerRecord(GP.PlayerTeam[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    // End:0xa3
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb4
    else
    {
        retval = TacticsRating(pR);
    }
    return retval;
}

static final simulated function int TeamInfoTacticsRating(UnrealTeamInfo UT, optional int lineupsize)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;
    local int numchars;

    numchars = Max(UT.RosterNames.Length, lineupsize);
    Count = 0.0;
    retval = 0;
    i = 0;
    J0x35:
    // End:0x81 [While If]
    if(i < numchars)
    {
        Count += 1.0;
        retval += TacticsRating(FindPlayerRecord(UT.RosterNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    // End:0xa7
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0xb8
    else
    {
        retval = TacticsRating(pR);
    }
    return retval;
}

static final simulated function int TeamArrayTacticsRating(array<string> Players)
{
    local int retval;
    local float Count;
    local int i;
    local PlayerRecord pR;

    Count = 0.0;
    retval = 0;
    i = 0;
    J0x19:
    // End:0x5d [While If]
    if(i < Players.Length)
    {
        Count += 1.0;
        retval += TacticsRating(FindPlayerRecord(Players[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    // End:0x83
    if(Count > float(0))
    {
        retval = int(float(retval) / Count);
    }
    // End:0x94
    else
    {
        retval = TacticsRating(pR);
    }
    return retval;
}

static final simulated function int GetTeamSalaryFor(GameProfile GP, optional int lineupsize)
{
    local int retval, i, numchars;

    numchars = Max(GP.4, lineupsize);
    retval = 0;
    i = 0;
    J0x26:
    // End:0x66 [While If]
    if(i < numchars)
    {
        retval += GetSalaryFor(FindPlayerRecord(GP.PlayerTeam[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
    return retval;
}

static final simulated function int GetTeamInfoSalaryFor(UnrealTeamInfo UT, optional int lineupsize)
{
    local int retval, i, numchars;

    numchars = Max(UT.RosterNames.Length, lineupsize);
    retval = 0;
    i = 0;
    J0x2a:
    // End:0x6a [While If]
    if(i < numchars)
    {
        retval += GetSalaryFor(FindPlayerRecord(UT.RosterNames[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    return retval;
}

static simulated function array< class<Mutator> > GetMutatorClasses(optional array<string> MutClassNames)
{
    local int i, j;
    local array< class<Mutator> > Arr;
    local array<MutatorRecord> LocalRecords;

    class'CacheManager'.static.GetMutatorList(LocalRecords);
    // End:0x2a
    if(MutClassNames.Length == 0)
    {
        Arr.Length = LocalRecords.Length;
    }
    i = 0;
    J0x31:
    // End:0xf7 [While If]
    if(i < LocalRecords.Length)
    {
        // End:0x7c
        if(MutClassNames.Length == 0)
        {
            Arr[i] = class<Mutator>(DynamicLoadObject(LocalRecords[i].ClassName, class'Class'));
        }
        // End:0xed
        else
        {
            j = 0;
            J0x83:
            // End:0xed [While If]
            if(j < MutClassNames.Length)
            {
                // End:0xe3
                if(MutClassNames[j] ~= LocalRecords[i].ClassName)
                {
                    Arr[Arr.Length] = class<Mutator>(DynamicLoadObject(LocalRecords[i].ClassName, class'Class'));
                }
                // End:0xed
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x83;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    return Arr;
}

defaultproperties
{
    NoPreference="???? ?? ??"
    FavoriteWeapon="???? ??:"
    AgilityString="???:"
    TacticsString="? ??:"
    AccuracyString="???:"
    AggressivenessString="??:"
}