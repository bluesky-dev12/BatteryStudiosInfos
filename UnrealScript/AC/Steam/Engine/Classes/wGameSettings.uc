/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wGameSettings.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:139
 *	Functions:32
 *
 *******************************************************************************/
class wGameSettings extends Object;

var localized string TeamGame_UserFriendlyName;
var localized string TeamGame_ModeDescription;
var array<string> TeamGame_TimeLimits;
var array<string> TeamGame_Scores;
var array<string> TeamGame_Scores_DefaultTimeLimits;
var string TeamGame_ScoreDefault;
var array<string> Bot_TeamGame_TimeLimits;
var array<string> Bot_TeamGame_Scores;
var array<string> Bot_TeamGame_Scores_DefaultTimeLimits;
var string Bot_TeamGame_ScoreDefault;
var localized string Domination_UserFriendlyName;
var localized string Domination_ModeDescription;
var array<string> Domination_TimeLimits;
var array<string> Domination_Scores;
var array<string> Domination_Scores_DefaultTimeLimits;
var string Domination_ScoreDefault;
var array<string> Bot_Domination_TimeLimits;
var array<string> Bot_Domination_Scores;
var array<string> Bot_Domination_Scores_DefaultTimeLimits;
var string Bot_Domination_ScoreDefault;
var localized string SD_UserFriendlyName;
var localized string SD_ModeDescription;
var array<string> SD_TimeLimits;
var array<string> SD_Scores;
var array<string> SD_Scores_DefaultTimeLimits;
var string SD_ScoreDefault;
var localized string DOA_UserFriendlyName;
var localized string DOA_ModeDescription;
var array<string> DOA_TimeLimits;
var array<string> DOA_Scores;
var array<string> DOA_Scores_DefaultTimeLimits;
var string DOA_ScoreDefault;
var array<int> DOA_UserCount;
var int DOA_UserCount_Default;
var localized string SBT_UserFriendlyName;
var localized string SBT_ModeDescription;
var array<string> SBT_TimeLimits;
var array<string> SBT_Scores;
var array<string> SBT_Scores_DefaultTimeLimits;
var string SBT_ScoreDefault;
var localized string COL_UserFriendlyName;
var localized string COL_ModeDescription;
var array<string> COL_TimeLimits;
var array<string> COL_Scores;
var array<string> COL_Scores_DefaultTimeLimits;
var string COL_ScoreDefault;
var localized string Medal_UserFriendlyName;
var localized string Medal_ModeDescription;
var array<string> Medal_TimeLimits;
var array<string> Medal_Scores;
var array<string> Medal_Scores_DefaultTimeLimits;
var string Medal_ScoreDefault;
var array<int> Medal_UserCount;
var int Medal_UserCount_Default;
var localized string Deathmatch_UserFriendlyName;
var localized string DeathMatch_ModeDescription;
var array<string> Deathmatch_TimeLimits;
var array<string> Deathmatch_Scores;
var array<string> Deathmatch_Scores_DefaultTimeLimits;
var string Deathmatch_ScoreDefault;
var array<string> Bot_Deathmatch_TimeLimits;
var array<string> Bot_Deathmatch_Scores;
var array<string> Bot_Deathmatch_Scores_DefaultTimeLimits;
var string Bot_Deathmatch_ScoreDefault;
var localized string TeamGameAI_UserFriendlyName;
var localized string DominationAI_UserFriendlyName;
var localized string DeathMatchAI_UserFriendlyName;
var localized string TeamGameBeginnerAI_UserFriendlyName;
var localized string TeamGameBeginner_ModeDescription;
var localized string Tutorial_UserFriendlyName;
var localized string Tutorial_ModeDescription;
var array<string> Tutorial_TimeLimits;
var array<string> Tutorial_Scores;
var array<string> Tutorial_Scores_DefaultTimeLimits;
var string Tutorial_ScoreDefault;
var array<int> Tutorial_UserCount;
var int Tutorial_UserCount_Default;
var localized string Defence_UserFriendlyName;
var localized string Defence_ModeDescription;
var array<string> Defence_TimeLimits;
var array<string> Defence_Scores;
var array<string> Defence_Scores_DefaultTimeLimits;
var string Defence_ScoreDefault;
var array<int> Defence_UserCount;
var int Defence_UserCount_Default;
var localized string Invader_UserFriendlyName;
var localized string Invader_ModeDescription;
var array<string> Invader_TimeLimits;
var array<string> Invader_Scores;
var array<string> Invader_Scores_DefaultTimeLimits;
var string Invader_ScoreDefault;
var array<int> Invader_UserCount;
var int Invader_UserCount_Default;
var array<string> Capacities;
var string CapacityDefault;
var array<int> UserCount;
var int UserCount_Default;
var array<int> Domination_UserCount;
var int Domination_UserCount_Default;
var array<int> SD_UserCount;
var int SD_UserCount_Default;
var array<int> DeathMatch_UserCount;
var int DeathMatch_UserCount_Default;
var array<int> Bot_UserCount;
var int Bot_UserCount_Default;
var array<int> Bot_DeathMatch_UserCount;
var int Bot_DeathMatch_UserCount_Default;
var array<string> Hardcores;
var string HardcoreDefault;
var string DefaultMap;
var string DefaultGameModeClass;
var string SBTGameModeClass;
var string SDGameModeClass;
var string TeamDeathGameModeClass;
var string DominationGameModeClass;
var string FreeForAllGameModeClass;
var string COLGameModeClass;
var string Bot_TeamDeathModeClass;
var string Bot_DominationGameModeClass;
var string Bot_FreeForAllGameModeClass;
var string DefenceGameModeClass;
var localized string BotModeDesc_AF;
var localized string BotModeDesc_RSA;
var localized string BotModeDesc_AFvsRSA;
var array<int> BotNum0_Default;
var array<int> BotNum1_Default;
var array<int> BotUserTeam_Default;
var array<int> BotDifficulty_Default;
var localized string WeaponRestriction_All;
var localized string WeaponRestriction_KnifeOnly;
var localized string WeaponRestriction_PistolOnly;
var localized string WeaponRestriction_GrenadeOnly;
var localized string WeaponRestriction_RPGOnly;
var localized string WeaponRestriction_SROnly;
var localized string WeaponRestriction_SRBan;
var localized string WeaponRestriction_FlameThrower;
var localized string WeaponRestriction_ShotgunOnly;
var localized string WeaponRestriction_MGOnly;
var localized string RespawnType[2];

static function GameModeInfo GetGameModeByClass(string ClassName)
{
    local int lp1;
    local array<GameModeInfo> modes;

    modes = GetAllGameModes();
    ClassName = Caps(ClassName);
    lp1 = 0;
    J0x20:
    // End:0x62 [While If]
    if(lp1 < modes.Length)
    {
        // End:0x58
        if(Caps(modes[lp1].ClassName) == ClassName)
        {
            return modes[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
    return modes[0];
}

static function GameModeInfo GetGameModeByIndex(int Index)
{
    local GameModeInfo Mode;

    Mode.ModeIndex = Index;
    switch(Index)
    {
        // End:0xba
        case 0:
            Mode.ClassName = "WGame.wTeamGame";
            Mode.UserFriendlyName = default.TeamGame_UserFriendlyName;
            Mode.ModeDescription = default.TeamGame_ModeDescription;
            Mode.TimeLimits = default.TeamGame_TimeLimits;
            Mode.Scores = default.TeamGame_Scores;
            Mode.ScoreDefault = default.TeamGame_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.TeamGame_Scores_DefaultTimeLimits;
            Mode.UserCount = default.UserCount;
            Mode.UserCount_Default = default.UserCount_Default;
            // End:0x959
            break;
        // End:0x162
        case 1:
            Mode.ClassName = "wMission.wSDGameInfo";
            Mode.UserFriendlyName = default.SD_UserFriendlyName;
            Mode.ModeDescription = default.SD_ModeDescription;
            Mode.TimeLimits = default.SD_TimeLimits;
            Mode.Scores = default.SD_Scores;
            Mode.ScoreDefault = default.SD_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.SD_Scores_DefaultTimeLimits;
            Mode.UserCount = default.SD_UserCount;
            Mode.UserCount_Default = default.SD_UserCount_Default;
            // End:0x959
            break;
        // End:0x208
        case 2:
            Mode.ClassName = "wGame.wDeathMatch";
            Mode.UserFriendlyName = default.Deathmatch_UserFriendlyName;
            Mode.ModeDescription = default.DeathMatch_ModeDescription;
            Mode.TimeLimits = default.Deathmatch_TimeLimits;
            Mode.Scores = default.Deathmatch_Scores;
            Mode.ScoreDefault = default.Deathmatch_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Deathmatch_Scores_DefaultTimeLimits;
            Mode.UserCount = default.DeathMatch_UserCount;
            Mode.UserCount_Default = default.DeathMatch_UserCount_Default;
            // End:0x959
            break;
        // End:0x2b2
        case 3:
            Mode.ClassName = "wMission.wDOMGameInfo";
            Mode.UserFriendlyName = default.Domination_UserFriendlyName;
            Mode.ModeDescription = default.Domination_ModeDescription;
            Mode.TimeLimits = default.Domination_TimeLimits;
            Mode.Scores = default.Domination_Scores;
            Mode.ScoreDefault = default.Domination_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Domination_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Domination_UserCount;
            Mode.UserCount_Default = default.Domination_UserCount_Default;
            // End:0x959
            break;
        // End:0x35c
        case 4:
            Mode.ClassName = "wMission.wSBTGameInfo";
            Mode.UserFriendlyName = default.SBT_UserFriendlyName;
            Mode.ModeDescription = default.SBT_ModeDescription;
            Mode.TimeLimits = default.SBT_TimeLimits;
            Mode.Scores = default.SBT_Scores;
            Mode.ScoreDefault = default.SBT_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.SBT_Scores_DefaultTimeLimits;
            Mode.UserCount = default.UserCount;
            Mode.UserCount_Default = default.UserCount_Default;
            // End:0x959
            break;
        // End:0x400
        case 5:
            Mode.ClassName = "WGame.wTeamGame";
            Mode.UserFriendlyName = default.TeamGameAI_UserFriendlyName;
            Mode.ModeDescription = default.TeamGame_ModeDescription;
            Mode.TimeLimits = default.Bot_TeamGame_TimeLimits;
            Mode.Scores = default.Bot_TeamGame_Scores;
            Mode.ScoreDefault = default.Bot_TeamGame_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Bot_TeamGame_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_UserCount;
            Mode.UserCount_Default = default.Bot_UserCount_Default;
            // End:0x959
            break;
        // End:0x4aa
        case 6:
            Mode.ClassName = "wMission.wDOMGameInfo";
            Mode.UserFriendlyName = default.DominationAI_UserFriendlyName;
            Mode.ModeDescription = default.Domination_ModeDescription;
            Mode.TimeLimits = default.Bot_Domination_TimeLimits;
            Mode.Scores = default.Bot_Domination_Scores;
            Mode.ScoreDefault = default.Bot_Domination_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Bot_Domination_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_UserCount;
            Mode.UserCount_Default = default.Bot_UserCount_Default;
            // End:0x959
            break;
        // End:0x550
        case 7:
            Mode.ClassName = "wGame.wDeathMatch";
            Mode.UserFriendlyName = default.DeathMatchAI_UserFriendlyName;
            Mode.ModeDescription = default.DeathMatch_ModeDescription;
            Mode.TimeLimits = default.Bot_Deathmatch_TimeLimits;
            Mode.Scores = default.Bot_Deathmatch_Scores;
            Mode.ScoreDefault = default.Bot_Deathmatch_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Bot_Deathmatch_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_DeathMatch_UserCount;
            Mode.UserCount_Default = default.Bot_DeathMatch_UserCount_Default;
            // End:0x959
            break;
        // End:0x5f4
        case 8:
            Mode.ClassName = "wGame.wTeamGame";
            Mode.UserFriendlyName = default.Tutorial_UserFriendlyName;
            Mode.ModeDescription = default.Tutorial_ModeDescription;
            Mode.TimeLimits = default.Tutorial_TimeLimits;
            Mode.Scores = default.Tutorial_Scores;
            Mode.ScoreDefault = default.Tutorial_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Tutorial_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Tutorial_UserCount;
            Mode.UserCount_Default = default.Tutorial_UserCount_Default;
            // End:0x959
            break;
        // End:0x6a0
        case 9:
            Mode.ClassName = "wMission.wMedalGameInfo";
            Mode.UserFriendlyName = default.Medal_UserFriendlyName;
            Mode.ModeDescription = default.Medal_ModeDescription;
            Mode.TimeLimits = default.Medal_TimeLimits;
            Mode.Scores = default.Medal_Scores;
            Mode.ScoreDefault = default.Medal_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Medal_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Medal_UserCount;
            Mode.UserCount_Default = default.Medal_UserCount_Default;
            // End:0x959
            break;
        // End:0x74a
        case 10:
            Mode.ClassName = "wMission.wCOLGameInfo";
            Mode.UserFriendlyName = default.COL_UserFriendlyName;
            Mode.ModeDescription = default.COL_ModeDescription;
            Mode.TimeLimits = default.COL_TimeLimits;
            Mode.Scores = default.COL_Scores;
            Mode.ScoreDefault = default.COL_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.COL_Scores_DefaultTimeLimits;
            Mode.UserCount = default.UserCount;
            Mode.UserCount_Default = default.UserCount_Default;
            // End:0x959
            break;
        // End:0x7ee
        case 11:
            Mode.ClassName = "WGame.wTeamGame";
            Mode.UserFriendlyName = default.TeamGameBeginnerAI_UserFriendlyName;
            Mode.ModeDescription = default.TeamGameBeginner_ModeDescription;
            Mode.TimeLimits = default.Bot_TeamGame_TimeLimits;
            Mode.Scores = default.Bot_TeamGame_Scores;
            Mode.ScoreDefault = default.Bot_TeamGame_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Bot_TeamGame_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_UserCount;
            Mode.UserCount_Default = default.Bot_UserCount_Default;
            // End:0x959
            break;
        // End:0x89c
        case 12:
            Mode.ClassName = "wMission.wDefenceGameInfo";
            Mode.UserFriendlyName = default.Defence_UserFriendlyName;
            Mode.ModeDescription = default.Defence_ModeDescription;
            Mode.TimeLimits = default.Defence_TimeLimits;
            Mode.Scores = default.Defence_Scores;
            Mode.ScoreDefault = default.Defence_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Defence_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Defence_UserCount;
            Mode.UserCount_Default = default.Defence_UserCount_Default;
            // End:0x959
            break;
        // End:0x946
        case 13:
            Mode.ClassName = "wMission.wDOAGameInfo";
            Mode.UserFriendlyName = default.DOA_UserFriendlyName;
            Mode.ModeDescription = default.DOA_ModeDescription;
            Mode.TimeLimits = default.DOA_TimeLimits;
            Mode.Scores = default.DOA_Scores;
            Mode.ScoreDefault = default.DOA_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.DOA_Scores_DefaultTimeLimits;
            Mode.UserCount = default.DOA_UserCount;
            Mode.UserCount_Default = default.DOA_UserCount_Default;
            // End:0x959
            break;
        // End:0xffff
        default:
            Mode.ModeIndex = -1;
            Mode.BotNum0_Default = default.BotNum0_Default[Index];
            Mode.BotNum1_Default = default.BotNum1_Default[Index];
            Mode.BotUserTeam_Default = default.BotUserTeam_Default[Index];
            Mode.BotDifficulty_Default = default.BotDifficulty_Default[Index];
            return Mode;
    }
}

static function bool IsBotModeIndex(int Index)
{
    // End:0x1c
    if(Index >= 5 && Index <= 8)
    {
        return true;
    }
    // End:0x38
    if(Index == 11 || Index == 12)
    {
        return true;
    }
    return false;
}

static function int GetModeIndex_TeamDeath()
{
    return 0;
}

static function int GetModeIndex_SD()
{
    return 1;
}

static function int GetModeIndex_DeathMatch()
{
    return 2;
}

static function int GetModeIndex_Domination()
{
    return 3;
}

static function int GetModeIndex_Sabotage()
{
    return 4;
}

static function int GetModeIndex_BotTeamDeath()
{
    return 5;
}

static function int GetModeIndex_BotDomination()
{
    return 6;
}

static function int GetModeIndex_BotDeathMatch()
{
    return 7;
}

static function int GetModeIndex_BotTutorial()
{
    return 8;
}

static function int GetModeIndex_Medal()
{
    return 9;
}

static function int GetModeIndex_COL()
{
    return 10;
}

static function int GetModeIndex_BotTeamDeathBeginner()
{
    return 11;
}

static function int GetModeIndex_Defence()
{
    return 12;
}

static function int GetModeIndex_DOA()
{
    return 13;
}

static function int GetModeIndex_Alien()
{
    return 14;
}

static function int GetModeCount()
{
    return 15;
}

static function array<GameModeInfo> GetAllGameModes()
{
    local array<GameModeInfo> modes;
    local GameModeInfo gmi;
    local int i;

    modes.Length = 0;
    i = 0;
    J0x0f:
    // End:0x5f [While If]
    if(i < GetModeCount())
    {
        gmi = GetGameModeByIndex(i);
        modes.Length = modes.Length + 1;
        modes[modes.Length - 1] = gmi;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    return modes;
}

static function array<GameModeInfo> GetAllGameModesAtServiceBuild()
{
    local GameModeInfo modeTeamGame, ModeDomination, modeDeathMatch;
    local array<GameModeInfo> modes;

    modeTeamGame.ModeIndex = class'wGameSettings'.static.GetModeIndex_TeamDeath();
    modeTeamGame.ClassName = "WGame.wTeamGame";
    modeTeamGame.UserFriendlyName = default.TeamGame_UserFriendlyName;
    modeTeamGame.ModeDescription = default.TeamGame_ModeDescription;
    modeTeamGame.TimeLimits = default.TeamGame_TimeLimits;
    modeTeamGame.Scores = default.TeamGame_Scores;
    modeTeamGame.ScoreDefault = default.TeamGame_ScoreDefault;
    modeTeamGame.Scores_DefaultTimeLimits = default.TeamGame_Scores_DefaultTimeLimits;
    modeTeamGame.UserCount = default.UserCount;
    modeTeamGame.UserCount_Default = default.UserCount_Default;
    modes.Length = modes.Length + 1;
    modes[modes.Length - 1] = modeTeamGame;
    ModeDomination.ModeIndex = class'wGameSettings'.static.GetModeIndex_Domination();
    ModeDomination.ClassName = "wMission.wDOMGameInfo";
    ModeDomination.UserFriendlyName = default.Domination_UserFriendlyName;
    ModeDomination.ModeDescription = default.Domination_ModeDescription;
    ModeDomination.TimeLimits = default.Domination_TimeLimits;
    ModeDomination.Scores = default.Domination_Scores;
    ModeDomination.ScoreDefault = default.Domination_ScoreDefault;
    ModeDomination.Scores_DefaultTimeLimits = default.Domination_Scores_DefaultTimeLimits;
    ModeDomination.UserCount = default.Domination_UserCount;
    ModeDomination.UserCount_Default = default.Domination_UserCount_Default;
    modes.Length = modes.Length + 1;
    modes[modes.Length - 1] = ModeDomination;
    modeDeathMatch.ModeIndex = class'wGameSettings'.static.GetModeIndex_DeathMatch();
    modeDeathMatch.ClassName = "wGame.wDeathMatch";
    modeDeathMatch.UserFriendlyName = default.Deathmatch_UserFriendlyName;
    modeDeathMatch.ModeDescription = default.DeathMatch_ModeDescription;
    modeDeathMatch.TimeLimits = default.Deathmatch_TimeLimits;
    modeDeathMatch.Scores = default.Deathmatch_Scores;
    modeDeathMatch.ScoreDefault = default.Deathmatch_ScoreDefault;
    modeDeathMatch.Scores_DefaultTimeLimits = default.Deathmatch_Scores_DefaultTimeLimits;
    modeDeathMatch.UserCount = default.DeathMatch_UserCount;
    modeDeathMatch.UserCount_Default = default.DeathMatch_UserCount_Default;
    modes.Length = modes.Length + 1;
    modes[modes.Length - 1] = modeDeathMatch;
    return modes;
}

static function string GetDefaultTimeLimit_ModeNum(int ModeNum, string Score)
{
    local int lp1;
    local GameModeInfo Mode;

    Mode = GetGameModeByIndex(ModeNum);
    lp1 = 0;
    J0x18:
    // End:0x62 [While If]
    if(lp1 < Mode.Scores.Length)
    {
        // End:0x58
        if(Mode.Scores[lp1] == Score)
        {
            return Mode.Scores_DefaultTimeLimits[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

static function string GetDefaultTimeLimit(string ClassName, string Score)
{
    local int lp1;
    local GameModeInfo Mode;

    Mode = GetGameModeByClass(ClassName);
    lp1 = 0;
    J0x18:
    // End:0x62 [While If]
    if(lp1 < Mode.Scores.Length)
    {
        // End:0x58
        if(Mode.Scores[lp1] == Score)
        {
            return Mode.Scores_DefaultTimeLimits[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

static function string GetDefaultScore_ModeNum(int ModeNum)
{
    local GameModeInfo Mode;

    Mode = GetGameModeByIndex(ModeNum);
    return Mode.ScoreDefault;
}

static function string GetDefaultScore(string ClassName)
{
    local GameModeInfo Mode;

    Mode = GetGameModeByClass(ClassName);
    return Mode.ScoreDefault;
}

static function string GetWeaponRestrictionByIndex(int Index)
{
    local array<string> WeaponRestrictions;

    WeaponRestrictions[0] = default.WeaponRestriction_All;
    WeaponRestrictions[1] = default.WeaponRestriction_KnifeOnly;
    WeaponRestrictions[2] = default.WeaponRestriction_PistolOnly;
    WeaponRestrictions[3] = default.WeaponRestriction_GrenadeOnly;
    WeaponRestrictions[4] = default.WeaponRestriction_RPGOnly;
    WeaponRestrictions[5] = default.WeaponRestriction_SROnly;
    WeaponRestrictions[6] = default.WeaponRestriction_SRBan;
    return WeaponRestrictions[Index];
}

static function string GetBotModeTeamByIndex(int Index)
{
    local array<string> BotModeTeam;

    BotModeTeam[0] = default.BotModeDesc_AF;
    BotModeTeam[1] = default.BotModeDesc_RSA;
    BotModeTeam[2] = default.BotModeDesc_AFvsRSA;
    return BotModeTeam[Index];
}

static function array<string> GetBotModeTeam(int BotModeIdx)
{
    local array<string> BotModeTeam;

    // End:0x2d
    if(BotModeIdx == GetModeIndex_BotTeamDeathBeginner())
    {
        BotModeTeam[0] = default.BotModeDesc_AF;
        BotModeTeam[1] = default.BotModeDesc_RSA;
    }
    // End:0x75
    else
    {
        // End:0x4d
        if(BotModeIdx == GetModeIndex_BotDeathMatch())
        {
            BotModeTeam[0] = default.BotModeDesc_AF;
        }
        // End:0x75
        else
        {
            BotModeTeam[0] = default.BotModeDesc_AF;
            BotModeTeam[1] = default.BotModeDesc_RSA;
            BotModeTeam[2] = default.BotModeDesc_AFvsRSA;
        }
    }
    return BotModeTeam;
}

static function array<string> GetWeaponRestrictions()
{
    local array<string> WeaponRestrictions;

    WeaponRestrictions[0] = default.WeaponRestriction_All;
    WeaponRestrictions[1] = default.WeaponRestriction_KnifeOnly;
    WeaponRestrictions[2] = default.WeaponRestriction_PistolOnly;
    WeaponRestrictions[3] = default.WeaponRestriction_GrenadeOnly;
    WeaponRestrictions[4] = default.WeaponRestriction_RPGOnly;
    WeaponRestrictions[5] = default.WeaponRestriction_SROnly;
    WeaponRestrictions[6] = default.WeaponRestriction_SRBan;
    WeaponRestrictions[WeaponRestrictions.Length] = "TEST_MODE";
    WeaponRestrictions[WeaponRestrictions.Length] = default.WeaponRestriction_ShotgunOnly;
    WeaponRestrictions[WeaponRestrictions.Length] = default.WeaponRestriction_MGOnly;
    WeaponRestrictions[WeaponRestrictions.Length] = default.WeaponRestriction_FlameThrower;
    return WeaponRestrictions;
}

static function bool IsAllowedWeaponRest(int Index)
{
    return true;
    // End:0x21
    if(Index == 2 || Index == 3)
    {
        return false;
    }
    // End:0x23
    else
    {
        return true;
    }
}

static function array<int> GetGameModeDispOrder()
{
    local array<int> GameModeDispOrder;

    GameModeDispOrder[GameModeDispOrder.Length] = 11;
    GameModeDispOrder[GameModeDispOrder.Length] = 0;
    GameModeDispOrder[GameModeDispOrder.Length] = 3;
    GameModeDispOrder[GameModeDispOrder.Length] = 1;
    GameModeDispOrder[GameModeDispOrder.Length] = 4;
    GameModeDispOrder[GameModeDispOrder.Length] = 2;
    GameModeDispOrder[GameModeDispOrder.Length] = 5;
    GameModeDispOrder[GameModeDispOrder.Length] = 6;
    GameModeDispOrder[GameModeDispOrder.Length] = 7;
    GameModeDispOrder[GameModeDispOrder.Length] = 8;
    GameModeDispOrder[GameModeDispOrder.Length] = 13;
    return GameModeDispOrder;
}

static function string GetRespawnTypeByIndex(int Index)
{
    local string sRespawn;

    // End:0x1b
    if(Index == 0)
    {
        sRespawn = default.RespawnType[0];
    }
    // End:0x28
    else
    {
        sRespawn = default.RespawnType[1];
    }
    return sRespawn;
}

defaultproperties
{
    TeamGame_UserFriendlyName="Team DM"
    TeamGame_ModeDescription="Destroy the enemy team!"
    TeamGame_TimeLimits=// Object reference not set to an instance of an object.
    
    TeamGame_Scores=// Object reference not set to an instance of an object.
    
    TeamGame_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    TeamGame_ScoreDefault="1300"
    Bot_TeamGame_TimeLimits=// Object reference not set to an instance of an object.
    
    Bot_TeamGame_Scores=// Object reference not set to an instance of an object.
    
    Bot_TeamGame_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Bot_TeamGame_ScoreDefault="1300"
    Domination_UserFriendlyName="Domination"
    Domination_ModeDescription="Capture and defend the flag!"
    Domination_TimeLimits=// Object reference not set to an instance of an object.
    
    Domination_Scores=// Object reference not set to an instance of an object.
    
    Domination_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Domination_ScoreDefault="300"
    Bot_Domination_TimeLimits=// Object reference not set to an instance of an object.
    
    Bot_Domination_Scores=// Object reference not set to an instance of an object.
    
    Bot_Domination_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Bot_Domination_ScoreDefault="200"
    SD_UserFriendlyName="S & D"
    SD_ModeDescription="Plant a bomb at a target site and destroy it!"
    SD_TimeLimits=// Object reference not set to an instance of an object.
    
    SD_Scores=// Object reference not set to an instance of an object.
    
    SD_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    SD_ScoreDefault="6"
    DOA_UserFriendlyName="Annihilation"
    DOA_ModeDescription="Annihilate the enemy!"
    DOA_TimeLimits=// Object reference not set to an instance of an object.
    
    DOA_Scores=// Object reference not set to an instance of an object.
    
    DOA_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    DOA_ScoreDefault="6"
    DOA_UserCount=// Object reference not set to an instance of an object.
    
    SBT_UserFriendlyName="Demolition"
    SBT_ModeDescription="Find a bomb and plant it at the target to destroy it!"
    SBT_TimeLimits=// Object reference not set to an instance of an object.
    
    SBT_Scores=// Object reference not set to an instance of an object.
    
    SBT_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    SBT_ScoreDefault="2"
    COL_UserFriendlyName="Retrieval"
    COL_ModeDescription="Retrieve the flag!"
    COL_TimeLimits=// Object reference not set to an instance of an object.
    
    COL_Scores=// Object reference not set to an instance of an object.
    
    COL_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    COL_ScoreDefault="1"
    Medal_TimeLimits=// Object reference not set to an instance of an object.
    
    Medal_Scores=// Object reference not set to an instance of an object.
    
    Medal_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Medal_ScoreDefault="6"
    Medal_UserCount=// Object reference not set to an instance of an object.
    
    Medal_UserCount_Default=16
    Deathmatch_UserFriendlyName="FFA"
    DeathMatch_ModeDescription="Destroy your enemies!"
    Deathmatch_TimeLimits=// Object reference not set to an instance of an object.
    
    Deathmatch_Scores=// Object reference not set to an instance of an object.
    
    Deathmatch_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Deathmatch_ScoreDefault="400"
    Bot_Deathmatch_TimeLimits=// Object reference not set to an instance of an object.
    
    Bot_Deathmatch_Scores=// Object reference not set to an instance of an object.
    
    Bot_Deathmatch_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Bot_Deathmatch_ScoreDefault="200"
    TeamGameAI_UserFriendlyName="Bot TDM"
    DominationAI_UserFriendlyName="Bot Domin."
    DeathMatchAI_UserFriendlyName="Bot FFA"
    TeamGameBeginnerAI_UserFriendlyName="Rookie Mission"
    TeamGameBeginner_ModeDescription="Destroy your enemies!"
    Tutorial_UserFriendlyName="Tutorial"
    Tutorial_TimeLimits=// Object reference not set to an instance of an object.
    
    Tutorial_Scores=// Object reference not set to an instance of an object.
    
    Tutorial_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Tutorial_ScoreDefault="9999"
    Tutorial_UserCount=// Object reference not set to an instance of an object.
    
    Tutorial_UserCount_Default=1
    Defence_UserFriendlyName="Defense"
    Defence_ModeDescription="Defense"
    Defence_TimeLimits=// Object reference not set to an instance of an object.
    
    Defence_Scores=// Object reference not set to an instance of an object.
    
    Defence_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Defence_ScoreDefault="0"
    Defence_UserCount=// Object reference not set to an instance of an object.
    
    Defence_UserCount_Default=4
    Invader_TimeLimits=// Object reference not set to an instance of an object.
    
    Invader_Scores=// Object reference not set to an instance of an object.
    
    Invader_Scores_DefaultTimeLimits=// Object reference not set to an instance of an object.
    
    Invader_ScoreDefault="7"
    Invader_UserCount=// Object reference not set to an instance of an object.
    
    Invader_UserCount_Default=16
    Capacities=// Object reference not set to an instance of an object.
    
    CapacityDefault="16"
    UserCount=// Object reference not set to an instance of an object.
    
    UserCount_Default=16
    Domination_UserCount=// Object reference not set to an instance of an object.
    
    Domination_UserCount_Default=16
    SD_UserCount=// Object reference not set to an instance of an object.
    
    SD_UserCount_Default=16
    DeathMatch_UserCount=// Object reference not set to an instance of an object.
    
    DeathMatch_UserCount_Default=8
    Bot_UserCount=// Object reference not set to an instance of an object.
    
    Bot_UserCount_Default=6
    Bot_DeathMatch_UserCount=// Object reference not set to an instance of an object.
    
    Bot_DeathMatch_UserCount_Default=4
    Hardcores=// Object reference not set to an instance of an object.
    
    HardcoreDefault="no"
    DefaultMap="dm-mirage"
    DefaultGameModeClass="WGame.wTeamGame"
    SBTGameModeClass="wMission.wSBTGameInfo"
    SDGameModeClass="wMission.wSDGameInfo"
    TeamDeathGameModeClass="WGame.wTeamGame"
    DominationGameModeClass="wMission.wDOMGameInfo"
    FreeForAllGameModeClass="wGame.wDeathMatch"
    COLGameModeClass="wMission.wCOLGameInfo"
    Bot_TeamDeathModeClass="WGame.wTeamGame|BOT"
    Bot_DominationGameModeClass="wMission.wDOMGameInfo|BOT"
    Bot_FreeForAllGameModeClass="wGame.wDeathMatch|BOT"
    DefenceGameModeClass="wMission.wDefenceGame|BOT"
    BotModeDesc_AF="AF"
    BotModeDesc_RSA="RSA"
    BotModeDesc_AFvsRSA="AF vs. RSA"
    BotNum0_Default=// Object reference not set to an instance of an object.
    
    BotNum1_Default=// Object reference not set to an instance of an object.
    
    BotUserTeam_Default=// Object reference not set to an instance of an object.
    
    BotDifficulty_Default=// Object reference not set to an instance of an object.
    
    WeaponRestriction_All="All Wpns"
    WeaponRestriction_KnifeOnly="Knife Only"
    WeaponRestriction_PistolOnly="Pistol Only"
    WeaponRestriction_GrenadeOnly="Grenade Only"
    WeaponRestriction_RPGOnly="Rocket Only"
    WeaponRestriction_SROnly="Sniper Only"
    WeaponRestriction_SRBan="No Sniper"
    WeaponRestriction_FlameThrower="Flame Thrower Mode"
    WeaponRestriction_ShotgunOnly="Shotgun Only"
    WeaponRestriction_MGOnly="Machine Gun Mode"
    RespawnType[0]="Fixed"
    RespawnType[1]="Random"
}