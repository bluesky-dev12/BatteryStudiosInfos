class wGameSettings extends Object;

var localized string TeamGame_UserFriendlyName;
var localized string TeamGame_ModeDescription;
var array<string> TeamGame_TimeLimits;
var array<string> TeamGame_Scores;
var array<string> TeamGame_Scores_DefaultTimeLimits;
var string TeamGame_ScoreDefault;
var localized string Domination_UserFriendlyName;
var localized string Domination_ModeDescription;
var array<string> Domination_TimeLimits;
var array<string> Domination_Scores;
var array<string> Domination_Scores_DefaultTimeLimits;
var string Domination_ScoreDefault;
var localized string SD_UserFriendlyName;
var localized string SD_ModeDescription;
var array<string> SD_TimeLimits;
var array<string> SD_Scores;
var array<string> SD_Scores_DefaultTimeLimits;
var string SD_ScoreDefault;
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
var localized string Deathmatch_UserFriendlyName;
var localized string DeathMatch_ModeDescription;
var array<string> Deathmatch_TimeLimits;
var array<string> Deathmatch_Scores;
var array<string> Deathmatch_Scores_DefaultTimeLimits;
var string Deathmatch_ScoreDefault;
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

static function GameModeInfo GetGameModeByClass(string ClassName)
{
    local int lp1;
    local array<GameModeInfo> modes;

    modes = GetAllGameModes();
    ClassName = Caps(ClassName);
    lp1 = 0;
    J0x20:

    // End:0x62 [Loop If]
    if(lp1 < modes.Length)
    {
        // End:0x58
        if(Caps(modes[lp1].ClassName) == ClassName)
        {
            return modes[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x20;
    }
    return modes[0];
    //return;    
}

static function GameModeInfo GetGameModeByIndex(int Index)
{
    local GameModeInfo Mode;

    switch(Index)
    {
        // End:0xAA
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
            // End:0x68B
            break;
        // End:0x152
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
            // End:0x68B
            break;
        // End:0x1F8
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
            // End:0x68B
            break;
        // End:0x2A2
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
            // End:0x68B
            break;
        // End:0x34C
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
            // End:0x68B
            break;
        // End:0x3F0
        case 5:
            Mode.ClassName = "WGame.wTeamGame";
            Mode.UserFriendlyName = default.TeamGameAI_UserFriendlyName;
            Mode.ModeDescription = default.TeamGame_ModeDescription;
            Mode.TimeLimits = default.TeamGame_TimeLimits;
            Mode.Scores = default.TeamGame_Scores;
            Mode.ScoreDefault = default.TeamGame_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.TeamGame_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_UserCount;
            Mode.UserCount_Default = default.Bot_UserCount_Default;
            // End:0x68B
            break;
        // End:0x49A
        case 6:
            Mode.ClassName = "wMission.wDOMGameInfo";
            Mode.UserFriendlyName = default.DominationAI_UserFriendlyName;
            Mode.ModeDescription = default.Domination_ModeDescription;
            Mode.TimeLimits = default.Domination_TimeLimits;
            Mode.Scores = default.Domination_Scores;
            Mode.ScoreDefault = default.Domination_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Domination_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_UserCount;
            Mode.UserCount_Default = default.Bot_UserCount_Default;
            // End:0x68B
            break;
        // End:0x540
        case 7:
            Mode.ClassName = "wGame.wDeathMatch";
            Mode.UserFriendlyName = default.DeathMatchAI_UserFriendlyName;
            Mode.ModeDescription = default.DeathMatch_ModeDescription;
            Mode.TimeLimits = default.Deathmatch_TimeLimits;
            Mode.Scores = default.Deathmatch_Scores;
            Mode.ScoreDefault = default.Deathmatch_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.Deathmatch_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_DeathMatch_UserCount;
            Mode.UserCount_Default = default.Bot_DeathMatch_UserCount_Default;
            // End:0x68B
            break;
        // End:0x5E4
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
            // End:0x68B
            break;
        // End:0x688
        case 11:
            Mode.ClassName = "WGame.wTeamGame";
            Mode.UserFriendlyName = default.TeamGameBeginnerAI_UserFriendlyName;
            Mode.ModeDescription = default.TeamGameBeginner_ModeDescription;
            Mode.TimeLimits = default.TeamGame_TimeLimits;
            Mode.Scores = default.TeamGame_Scores;
            Mode.ScoreDefault = default.TeamGame_ScoreDefault;
            Mode.Scores_DefaultTimeLimits = default.TeamGame_Scores_DefaultTimeLimits;
            Mode.UserCount = default.Bot_UserCount;
            Mode.UserCount_Default = default.Bot_UserCount_Default;
            // End:0x68B
            break;
        // End:0xFFFF
        default:
            break;
    }
    Mode.BotNum0_Default = default.BotNum0_Default[Index];
    Mode.BotNum1_Default = default.BotNum1_Default[Index];
    Mode.BotUserTeam_Default = default.BotUserTeam_Default[Index];
    Mode.BotDifficulty_Default = default.BotDifficulty_Default[Index];
    return Mode;
    //return;    
}

static function bool IsBotModeIndex(int Index)
{
    // End:0x1C
    if((Index >= 5) && Index <= 8)
    {
        return true;
    }
    // End:0x2A
    if(Index == 11)
    {
        return true;
    }
    return false;
    //return;    
}

static function int GetModeIndex_TeamDeath()
{
    return 0;
    //return;    
}

static function int GetModeIndex_SD()
{
    return 1;
    //return;    
}

static function int GetModeIndex_DeathMatch()
{
    return 2;
    //return;    
}

static function int GetModeIndex_Domination()
{
    return 3;
    //return;    
}

static function int GetModeIndex_Sabotage()
{
    return 4;
    //return;    
}

static function int GetModeIndex_BotTeamDeath()
{
    return 5;
    //return;    
}

static function int GetModeIndex_BotDomination()
{
    return 6;
    //return;    
}

static function int GetModeIndex_BotDeathMatch()
{
    return 7;
    //return;    
}

static function int GetModeIndex_BotTutorial()
{
    return 8;
    //return;    
}

static function int GetModeIndex_BotTeamDeathBeginner()
{
    return 11;
    //return;    
}

static function array<GameModeInfo> GetAllGameModes()
{
    local array<GameModeInfo> modes;
    local int i;

    modes.Length = 0;
    i = 0;
    J0x0F:

    // End:0x50 [Loop If]
    if(i < 12)
    {
        modes.Length = modes.Length + 1;
        modes[modes.Length - 1] = GetGameModeByIndex(i);
        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    return modes;
    //return;    
}

static function array<GameModeInfo> GetAllGameModesAtServiceBuild()
{
    local GameModeInfo modeTeamGame, ModeDomination, modeDeathMatch;
    local array<GameModeInfo> modes;

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
    //return;    
}

static function string GetDefaultTimeLimit_ModeNum(int ModeNum, string Score)
{
    local int lp1;
    local GameModeInfo Mode;

    Mode = GetGameModeByIndex(ModeNum);
    lp1 = 0;
    J0x18:

    // End:0x62 [Loop If]
    if(lp1 < Mode.Scores.Length)
    {
        // End:0x58
        if(Mode.Scores[lp1] == Score)
        {
            return Mode.Scores_DefaultTimeLimits[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x18;
    }
    //return;    
}

static function string GetDefaultTimeLimit(string ClassName, string Score)
{
    local int lp1;
    local GameModeInfo Mode;

    Mode = GetGameModeByClass(ClassName);
    lp1 = 0;
    J0x18:

    // End:0x62 [Loop If]
    if(lp1 < Mode.Scores.Length)
    {
        // End:0x58
        if(Mode.Scores[lp1] == Score)
        {
            return Mode.Scores_DefaultTimeLimits[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x18;
    }
    //return;    
}

static function string GetDefaultScore_ModeNum(int ModeNum)
{
    local GameModeInfo Mode;

    Mode = GetGameModeByIndex(ModeNum);
    return Mode.ScoreDefault;
    //return;    
}

static function string GetDefaultScore(string ClassName)
{
    local GameModeInfo Mode;

    Mode = GetGameModeByClass(ClassName);
    return Mode.ScoreDefault;
    //return;    
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
    //return;    
}

static function string GetBotModeTeamByIndex(int Index)
{
    local array<string> BotModeTeam;

    BotModeTeam[0] = default.BotModeDesc_AF;
    BotModeTeam[1] = default.BotModeDesc_RSA;
    BotModeTeam[2] = default.BotModeDesc_AFvsRSA;
    return BotModeTeam[Index];
    //return;    
}

static function array<string> GetBotModeTeam(int BotModeIdx)
{
    local array<string> BotModeTeam;

    // End:0x2D
    if(BotModeIdx == (GetModeIndex_BotTeamDeathBeginner()))
    {
        BotModeTeam[0] = default.BotModeDesc_AF;
        BotModeTeam[1] = default.BotModeDesc_RSA;        
    }
    else
    {
        // End:0x4D
        if(BotModeIdx == (GetModeIndex_BotDeathMatch()))
        {
            BotModeTeam[0] = default.BotModeDesc_AF;            
        }
        else
        {
            BotModeTeam[0] = default.BotModeDesc_AF;
            BotModeTeam[1] = default.BotModeDesc_RSA;
            BotModeTeam[2] = default.BotModeDesc_AFvsRSA;
        }
    }
    return BotModeTeam;
    //return;    
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
    return WeaponRestrictions;
    //return;    
}

static function bool IsAllowedWeaponRest(int Index)
{
    // End:0x1F
    if((Index == 2) || Index == 3)
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return;    
}

defaultproperties
{
    TeamGame_UserFriendlyName="????"
    TeamGame_ModeDescription="??? ????!"
    TeamGame_TimeLimits[0]="5"
    TeamGame_TimeLimits[1]="10"
    TeamGame_TimeLimits[2]="15"
    TeamGame_TimeLimits[3]="20"
    TeamGame_TimeLimits[4]="25"
    TeamGame_TimeLimits[5]="30"
    TeamGame_Scores[0]="750"
    TeamGame_Scores[1]="1000"
    TeamGame_Scores[2]="1300"
    TeamGame_Scores[3]="1600"
    TeamGame_Scores[4]="2000"
    TeamGame_Scores_DefaultTimeLimits[0]="5"
    TeamGame_Scores_DefaultTimeLimits[1]="10"
    TeamGame_Scores_DefaultTimeLimits[2]="10"
    TeamGame_Scores_DefaultTimeLimits[3]="15"
    TeamGame_Scores_DefaultTimeLimits[4]="20"
    TeamGame_ScoreDefault="1300"
    Domination_UserFriendlyName="???"
    Domination_ModeDescription="??? ???? ????!"
    Domination_TimeLimits[0]="5"
    Domination_TimeLimits[1]="10"
    Domination_TimeLimits[2]="15"
    Domination_TimeLimits[3]="20"
    Domination_TimeLimits[4]="25"
    Domination_TimeLimits[5]="30"
    Domination_Scores[0]="100"
    Domination_Scores[1]="200"
    Domination_Scores[2]="300"
    Domination_Scores[3]="400"
    Domination_Scores[4]="500"
    Domination_Scores_DefaultTimeLimits[0]="10"
    Domination_Scores_DefaultTimeLimits[1]="15"
    Domination_Scores_DefaultTimeLimits[2]="20"
    Domination_Scores_DefaultTimeLimits[3]="25"
    Domination_Scores_DefaultTimeLimits[4]="30"
    Domination_ScoreDefault="200"
    SD_UserFriendlyName="????"
    SD_ModeDescription="???(A ? B)? ??? ???? ????!"
    SD_TimeLimits[0]="2"
    SD_TimeLimits[1]="3"
    SD_TimeLimits[2]="4"
    SD_TimeLimits[3]="10"
    SD_Scores[0]="4"
    SD_Scores[1]="6"
    SD_Scores[2]="8"
    SD_Scores[3]="10"
    SD_Scores_DefaultTimeLimits[0]="3"
    SD_Scores_DefaultTimeLimits[1]="3"
    SD_Scores_DefaultTimeLimits[2]="3"
    SD_Scores_DefaultTimeLimits[3]="3"
    SD_ScoreDefault="6"
    SBT_UserFriendlyName="????"
    SBT_ModeDescription="??? ?? ???? ??? ???? ????!"
    SBT_TimeLimits[0]="4"
    SBT_TimeLimits[1]="5"
    SBT_TimeLimits[2]="6"
    SBT_Scores[0]="1"
    SBT_Scores[1]="2"
    SBT_Scores[2]="3"
    SBT_Scores[3]="4"
    SBT_Scores_DefaultTimeLimits[0]="5"
    SBT_Scores_DefaultTimeLimits[1]="5"
    SBT_Scores_DefaultTimeLimits[2]="5"
    SBT_Scores_DefaultTimeLimits[3]="5"
    SBT_ScoreDefault="2"
    COL_UserFriendlyName="???"
    COL_ModeDescription="??? ????!"
    COL_TimeLimits[0]="5"
    COL_TimeLimits[1]="7"
    COL_TimeLimits[2]="10"
    COL_Scores[0]="4"
    COL_Scores[1]="6"
    COL_Scores[2]="8"
    COL_Scores[3]="10"
    COL_Scores_DefaultTimeLimits[0]="5"
    COL_Scores_DefaultTimeLimits[1]="5"
    COL_Scores_DefaultTimeLimits[2]="5"
    COL_Scores_DefaultTimeLimits[3]="5"
    COL_ScoreDefault="1"
    Deathmatch_UserFriendlyName="???"
    DeathMatch_ModeDescription="??? ????!"
    Deathmatch_TimeLimits[0]="5"
    Deathmatch_TimeLimits[1]="10"
    Deathmatch_TimeLimits[2]="15"
    Deathmatch_TimeLimits[3]="20"
    Deathmatch_TimeLimits[4]="25"
    Deathmatch_TimeLimits[5]="30"
    Deathmatch_Scores[0]="100"
    Deathmatch_Scores[1]="200"
    Deathmatch_Scores[2]="300"
    Deathmatch_Scores[3]="400"
    Deathmatch_Scores[4]="500"
    Deathmatch_Scores_DefaultTimeLimits[0]="5"
    Deathmatch_Scores_DefaultTimeLimits[1]="10"
    Deathmatch_Scores_DefaultTimeLimits[2]="10"
    Deathmatch_Scores_DefaultTimeLimits[3]="15"
    Deathmatch_Scores_DefaultTimeLimits[4]="20"
    Deathmatch_ScoreDefault="300"
    TeamGameAI_UserFriendlyName="? ????"
    DominationAI_UserFriendlyName="? ???"
    DeathMatchAI_UserFriendlyName="? ???"
    TeamGameBeginnerAI_UserFriendlyName="????"
    TeamGameBeginner_ModeDescription="??? ????!"
    Tutorial_UserFriendlyName="????"
    Tutorial_TimeLimits[0]="9999"
    Tutorial_Scores[0]="9999"
    Tutorial_Scores_DefaultTimeLimits[0]="9999"
    Tutorial_ScoreDefault="9999"
    Tutorial_UserCount[0]=1
    Tutorial_UserCount_Default=1
    Capacities[0]="2"
    Capacities[1]="4"
    Capacities[2]="6"
    Capacities[3]="8"
    Capacities[4]="10"
    Capacities[5]="12"
    Capacities[6]="14"
    Capacities[7]="16"
    CapacityDefault="16"
    UserCount[0]=2
    UserCount[1]=4
    UserCount[2]=6
    UserCount[3]=8
    UserCount[4]=10
    UserCount[5]=12
    UserCount[6]=14
    UserCount[7]=16
    UserCount_Default=16
    Domination_UserCount[0]=4
    Domination_UserCount[1]=6
    Domination_UserCount[2]=8
    Domination_UserCount[3]=10
    Domination_UserCount[4]=12
    Domination_UserCount[5]=14
    Domination_UserCount[6]=16
    Domination_UserCount_Default=16
    SD_UserCount[0]=4
    SD_UserCount[1]=6
    SD_UserCount[2]=8
    SD_UserCount[3]=10
    SD_UserCount[4]=12
    SD_UserCount[5]=14
    SD_UserCount[6]=16
    SD_UserCount_Default=16
    DeathMatch_UserCount[0]=2
    DeathMatch_UserCount[1]=4
    DeathMatch_UserCount[2]=6
    DeathMatch_UserCount[3]=8
    DeathMatch_UserCount_Default=8
    Bot_UserCount[0]=1
    Bot_UserCount[1]=2
    Bot_UserCount[2]=3
    Bot_UserCount[3]=4
    Bot_UserCount[4]=5
    Bot_UserCount[5]=6
    Bot_UserCount[6]=7
    Bot_UserCount[7]=8
    Bot_UserCount_Default=6
    Bot_DeathMatch_UserCount[0]=1
    Bot_DeathMatch_UserCount[1]=2
    Bot_DeathMatch_UserCount[2]=3
    Bot_DeathMatch_UserCount[3]=4
    Bot_DeathMatch_UserCount_Default=4
    Hardcores[0]="no"
    Hardcores[1]="yes"
    HardcoreDefault="no"
    DefaultMap="dm-downtown"
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
    BotModeDesc_AF="AF"
    BotModeDesc_RSA="RSA"
    BotModeDesc_AFvsRSA="AF vs RSA"
    BotNum0_Default[0]=0
    BotNum0_Default[1]=0
    BotNum0_Default[2]=0
    BotNum0_Default[3]=0
    BotNum0_Default[4]=0
    BotNum0_Default[5]=6
    BotNum0_Default[6]=6
    BotNum0_Default[7]=8
    BotNum0_Default[8]=1
    BotNum0_Default[9]=0
    BotNum0_Default[10]=0
    BotNum0_Default[11]=6
    BotNum1_Default[0]=0
    BotNum1_Default[1]=0
    BotNum1_Default[2]=0
    BotNum1_Default[3]=0
    BotNum1_Default[4]=0
    BotNum1_Default[5]=6
    BotNum1_Default[6]=6
    BotNum1_Default[7]=0
    BotNum1_Default[8]=8
    BotNum1_Default[9]=0
    BotNum1_Default[10]=0
    BotNum1_Default[11]=6
    BotUserTeam_Default[0]=0
    BotUserTeam_Default[1]=0
    BotUserTeam_Default[2]=0
    BotUserTeam_Default[3]=0
    BotUserTeam_Default[4]=0
    BotUserTeam_Default[5]=0
    BotUserTeam_Default[6]=0
    BotUserTeam_Default[7]=0
    BotUserTeam_Default[8]=0
    BotUserTeam_Default[9]=0
    BotUserTeam_Default[10]=0
    BotUserTeam_Default[11]=0
    BotDifficulty_Default[0]=0
    BotDifficulty_Default[1]=0
    BotDifficulty_Default[2]=0
    BotDifficulty_Default[3]=0
    BotDifficulty_Default[4]=0
    BotDifficulty_Default[5]=1
    BotDifficulty_Default[6]=1
    BotDifficulty_Default[7]=1
    BotDifficulty_Default[8]=100
    BotDifficulty_Default[9]=0
    BotDifficulty_Default[10]=0
    BotDifficulty_Default[11]=1
    WeaponRestriction_All="-"
    WeaponRestriction_KnifeOnly="??"
    WeaponRestriction_RPGOnly="???"
    WeaponRestriction_SROnly="???"
    WeaponRestriction_SRBan="????"
}