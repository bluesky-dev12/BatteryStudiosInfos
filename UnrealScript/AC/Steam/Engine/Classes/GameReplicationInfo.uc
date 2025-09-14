/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GameReplicationInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:2
 *	Enums:1
 *	Properties:57
 *	Functions:24
 *
 *******************************************************************************/
class GameReplicationInfo extends ReplicationInfo
    dependson(ReplicationInfo)
    dependson(PlayInfo)
    dependson(TeamInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    nativereplication
    exportstructs
    notplaceable;

const TEAM_MAX = 3;
const PROPNUM = 4;

enum EROUND_STATE
{
    EROUND_NONE,
    EROUND_END,
    EROUND_PLAYING,
    EGAME_END,
    EROUND_COUNT
};

var string GameName;
var string GameClass;
var bool bTeamGame;
var bool bStopCountDown;
var bool bMatchHasBegun;
var bool bTeamSymbolsUpdated;
var bool bNoTeamSkins;
var bool bForceTeamSkins;
var bool bForceNoPlayerLights;
var bool bAllowPlayerLights;
var bool bFastWeaponSwitching;
var bool bNoTeamChanges;
var float RespawnTime;
var int RemainingTime;
var int ElapsedTime;
var int RemainingMinute;
var int PostElapsedTime;
var int PostElapsedTimeClient;
var int PostRemaiingTime;
var int PostRemaiingTimeClient;
var float SecondCount;
var int GoalScore;
var int TimeLimit;
var int MaxLives;
var int MinNetPlayers;
var float WeaponBerserk;
var bool bStartedMatch;
var bool bMatchOver;
var bool WaitingForStart;
var int WaitingForStartCountDown;
var TeamInfo Teams[3];
var() string ServerName;
var() string ShortName;
var() string AdminName;
var() string AdminEmail;
var() int ServerRegion;
var() string MessageOfTheDay;
var() deprecated string MOTDLine1;
var() deprecated string MOTDLine2;
var() deprecated string MOTDLine3;
var() deprecated string MOTDLine4;
var Actor Winner;
var VoiceChatReplicationInfo VoiceReplicationInfo;
var() array<PlayerReplicationInfo> PRIArray;
var localized string GRIPropsDisplayText[4];
var localized string GRIPropDescText[4];
var Vector FlagPos;
var Actor.EFlagState FlagState[2];
var PlayerReplicationInfo FlagHolder[2];
var PlayerReplicationInfo FlagTarget;
var int MatchID;
var int BotDifficulty;
var GameReplicationInfo.EROUND_STATE RoundState;
var bool bObjectivePlanted;
var bool bMultiBomb;
var int MaxPlayersDuringGame;
var int CurrentAttackingTeam;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        FlagState, bStartedMatch,
        Teams, Winner,
        FlagPos, FlagTarget,
        MaxPlayersDuringGame, bMatchHasBegun,
        bStopCountDown, RoundState,
        MatchID;

    // Pos:0x18
    reliable if(!bNetInitial && bNetDirty && Role == 4)
        RemainingMinute;

    // Pos:0x3d
    reliable if(bNetInitial && Role == 4)
        BotDifficulty, MinNetPlayers,
        VoiceReplicationInfo, bMultiBomb,
        WeaponBerserk, GameName,
        MaxLives, GoalScore,
        GameClass, bTeamGame,
        bNoTeamSkins, bForceTeamSkins,
        bForceNoPlayerLights, bAllowPlayerLights,
        bFastWeaponSwitching, TimeLimit,
        bNoTeamChanges, RemainingTime,
        ElapsedTime, RespawnTime;

    // Pos:0x55
    reliable if(bNetDirty && Role == 4)
        WaitingForStartCountDown, WaitingForStart,
        bMatchOver, PostElapsedTime,
        bObjectivePlanted, PostRemaiingTime,
        CurrentAttackingTeam;

}

simulated function PostNetBeginPlay()
{
    local PlayerReplicationInfo PRI;

    Level.GRI = self;
    // End:0x30
    if(VoiceReplicationInfo == none)
    {
        // End:0x2f
        foreach DynamicActors(class'VoiceChatReplicationInfo', VoiceReplicationInfo)
        {
            // End:0x2f
            break;                        
        }
    }
    // End:0x4c
    foreach DynamicActors(class'PlayerReplicationInfo', PRI)
    {
        AddPRI(PRI);                
    }
    // End:0x6c
    if(Level.NetMode == 3)
    {
        TeamSymbolNotify();
    }
}

simulated function TeamSymbolNotify();
simulated function UpdatePrecacheMaterials();
event EventForceBegin()
{
    ForceBegin();
}

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x3f
    if(Level.NetMode == 3)
    {
        ServerName = "";
        AdminName = "";
        AdminEmail = "";
        MessageOfTheDay = "";
    }
    SecondCount = Level.TimeSeconds;
    SetTimer(Level.TimeDilation, true);
}

function Reset()
{
    super(Actor).Reset();
    Winner = none;
}

simulated function Timer()
{
    local int i;
    local PlayerReplicationInfo OldHolder[2];
    local Controller C;

    // End:0xf2
    if(Level.NetMode == 3)
    {
        // End:0x4b
        if(PostRemaiingTime != 0 && PostRemaiingTime != PostRemaiingTimeClient)
        {
            PostRemaiingTimeClient = PostRemaiingTime;
            RemainingTime = PostRemaiingTime;
        }
        // End:0x7d
        if(PostElapsedTime != 0 && PostElapsedTime != PostElapsedTimeClient)
        {
            PostElapsedTimeClient = PostElapsedTime;
            ElapsedTime = PostElapsedTime;
        }
        // End:0xcc
        if(!Level.GetMatchMaker().bChangingHost)
        {
            // End:0xcc
            if(!WaitingForStart)
            {
                ++ ElapsedTime;
                // End:0xcc
                if(RemainingTime > 0 && !bStopCountDown)
                {
                    -- RemainingTime;
                }
            }
        }
        // End:0xdd
        if(!bTeamSymbolsUpdated)
        {
            TeamSymbolNotify();
        }
        SetTimer(Level.TimeDilation, true);
    }
    // End:0x263
    else
    {
        // End:0x263
        if(Level.NetMode != 0)
        {
            OldHolder[0] = FlagHolder[0];
            OldHolder[1] = FlagHolder[1];
            FlagHolder[0] = none;
            FlagHolder[1] = none;
            i = 0;
            J0x142:
            // End:0x1c1 [While If]
            if(i < PRIArray.Length)
            {
                // End:0x1b7
                if(PRIArray[i].HasFlag != none && PRIArray[i].Team != none)
                {
                    FlagHolder[PRIArray[i].Team.TeamIndex] = PRIArray[i];
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x142;
            }
            i = 0;
            J0x1c8:
            // End:0x263 [While If]
            if(i < 2)
            {
                // End:0x259
                if(OldHolder[i] != FlagHolder[i])
                {
                    C = Level.ControllerList;
                    J0x203:
                    // End:0x259 [While If]
                    if(C != none)
                    {
                        // End:0x242
                        if(PlayerController(C) != none)
                        {
                            PlayerController(C).ClientUpdateFlagHolder(FlagHolder[i], i);
                        }
                        C = C.nextController;
                        // This is an implied JumpToken; Continue!
                        goto J0x203;
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1c8;
            }
        }
    }
    // End:0x2bb
    if(!Level.GetMatchMaker().bChangingHost)
    {
        // End:0x2bb
        if(Level.NetMode == 3 || Level.NetMode == 2)
        {
            PlayTimerSound();
        }
    }
}

simulated function PlayTimerSound()
{
    // End:0xd2
    if(!bStopCountDown)
    {
        // End:0x6e
        if(bObjectivePlanted)
        {
            Level.GetLocalPlayerController().ClientPlaySound(Sound(DynamicLoadObject("Warfare_Sound_ATS.com.ats_com_bomb_countdown", class'Sound')));
        }
        // End:0xd2
        else
        {
            // End:0xd2
            if(GetRemainingTime() <= 30)
            {
                Level.GetLocalPlayerController().ClientPlaySound(Sound(DynamicLoadObject("Warfare_Sound_ATS.com.ats_com_time_countdown", class'Sound')));
            }
        }
    }
}

simulated function int GetRemainingTime()
{
    return RemainingTime;
}

simulated function array<int> GetTeamScores()
{
    local int lp1;
    local array<int> TeamScores;

    lp1 = 0;
    J0x07:
    // End:0x2a [While If]
    if(lp1 < 2)
    {
        TeamScores[lp1] = 0;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    lp1 = 0;
    J0x31:
    // End:0x89 [While If]
    if(lp1 < 3)
    {
        // End:0x7f
        if(Teams[lp1] != none)
        {
            TeamScores[Teams[lp1].TeamIndex] = int(Teams[lp1].Score);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    return TeamScores;
}

simulated function int GetWinTeamIndex()
{
    local int winTeamIndex;
    local array<int> TeamScores;

    TeamScores = GetTeamScores();
    // End:0x29
    if(TeamScores[0] > TeamScores[1])
    {
        winTeamIndex = 0;
    }
    // End:0x30
    else
    {
        winTeamIndex = 1;
    }
    // End:0x78
    if(TeamInfo(Winner) != none && TeamInfo(Winner).TeamIndex != winTeamIndex)
    {
        winTeamIndex = TeamInfo(Winner).TeamIndex;
    }
    return winTeamIndex;
}

simulated function PlayerReplicationInfo FindPlayerByID(int PlayerID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4b [While If]
    if(i < PRIArray.Length)
    {
        // End:0x41
        if(PRIArray[i].PlayerID == PlayerID)
        {
            return PRIArray[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

event ForcedAddPRI(PlayerReplicationInfo PRI)
{
    AddPRI(PRI);
}

event ForcedRemovePRI(PlayerReplicationInfo PRI)
{
    RemovePRI(PRI);
}

simulated function AddPRI(PlayerReplicationInfo PRI)
{
    local byte NewVoiceID;
    local int i;

    // End:0xb6
    if(Level.NetMode == 2 || Level.NetMode == 1)
    {
        i = 0;
        J0x3b:
        // End:0x8c [While If]
        if(i < PRIArray.Length)
        {
            // End:0x82
            if(PRIArray[i].VoiceID == NewVoiceID)
            {
                i = -1;
                ++ NewVoiceID;
            }
            // End:0x82
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3b;
        }
        // End:0xa2
        if(NewVoiceID >= 32)
        {
            NewVoiceID = 0;
        }
        PRI.VoiceID = NewVoiceID;
    }
    PRIArray[PRIArray.Length] = PRI;
}

simulated function RemovePRI(PlayerReplicationInfo PRI)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x44 [While If]
    if(i < PRIArray.Length)
    {
        // End:0x3a
        if(PRIArray[i] == PRI)
        {
            PRIArray.Remove(i, 1);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Log("GameReplicationInfo::RemovePRI() pri=" $ string(PRI) $ " not found.", 'Error');
}

simulated function GetPRIArray(out array<PlayerReplicationInfo> pris)
{
    local int i, Num;

    pris.Remove(0, pris.Length);
    i = 0;
    J0x14:
    // End:0x58 [While If]
    if(i < PRIArray.Length)
    {
        // End:0x4e
        if(PRIArray[i] != none)
        {
            pris[++ Num] = PRIArray[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.ServerGroup, "ServerName", default.GRIPropsDisplayText[++ i], byte(255), 1, "Text", "60",, true);
    PlayInfo.AddSetting(default.ServerGroup, "AdminName", default.GRIPropsDisplayText[++ i], byte(255), 1, "Text", "40",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "AdminEmail", default.GRIPropsDisplayText[++ i], byte(255), 1, "Text", "60",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "MessageOfTheDay", default.GRIPropsDisplayText[++ i], 251, 1, "Custom", "255;;GUI2K4.MOTDConfigPage",, true, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1e
        case "ServerName":
            return default.GRIPropDescText[0];
        // End:0x34
        case "AdminName":
            return default.GRIPropDescText[1];
        // End:0x4c
        case "AdminEmail":
            return default.GRIPropDescText[2];
        // End:0x69
        case "MessageOfTheDay":
            return default.GRIPropDescText[3];
        // End:0xffff
        default:
            return super(Info).GetDescriptionText(PropName);
    }
}

function SyncRemainingTime()
{
    PostRemaiingTime = RemainingTime;
    PostElapsedTime = ElapsedTime;
    NetUpdateTime = Level.TimeSeconds - float(999);
}

simulated function bool IsDefender(byte Team);
simulated function bool IsGhostChatting(Actor Sender)
{
    return false;
}

simulated function int GetMaxLives()
{
    Log(string(self) $ " MaxLives :" $ string(MaxLives));
    return MaxLives;
}

simulated function SetMaxLives(int iMaxLives)
{
    Log(string(self) $ " MaxLives :" $ string(iMaxLives));
    MaxLives = iMaxLives;
}

defaultproperties
{
    bStopCountDown=true
    WeaponBerserk=1.0
    ServerName="Battery Server"
    ShortName="Server"
    AdminEmail="Non-disclosed"
    GRIPropsDisplayText[0]="Server Name"
    GRIPropsDisplayText[1]="Admin Name"
    GRIPropsDisplayText[2]="Admin E-Mail"
    GRIPropsDisplayText[3]="MOTD Line 1"
    GRIPropDescText[0]="The server name shown in the server browser."
    GRIPropDescText[1]="The server administrator's name."
    GRIPropDescText[2]="The server administrator's e-mail address."
    GRIPropDescText[3]="First line of the message of the day."
    BotDifficulty=-1
}