class GameReplicationInfo extends ReplicationInfo
    native
    nativereplication
    exportstructs
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const TEAM_MAX = 3;
const PROPNUM = 4;

enum EROUND_STATE
{
    EROUND_NONE,                    // 0
    EROUND_END,                     // 1
    EROUND_PLAYING,                 // 2
    EGAME_END,                      // 3
    EROUND_COUNT                    // 4
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
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        FlagPos, FlagState, 
        FlagTarget, MatchID, 
        MaxPlayersDuringGame, RoundState, 
        Teams, Winner, 
        bMatchHasBegun, bStartedMatch, 
        bStopCountDown;

    // Pos:0x018
    reliable if((!bNetInitial && bNetDirty) && int(Role) == int(ROLE_Authority))
        RemainingMinute;

    // Pos:0x03D
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        BotDifficulty, ElapsedTime, 
        GameClass, GameName, 
        GoalScore, MaxLives, 
        MinNetPlayers, RemainingTime, 
        RespawnTime, TimeLimit, 
        VoiceReplicationInfo, WeaponBerserk, 
        bAllowPlayerLights, bFastWeaponSwitching, 
        bForceNoPlayerLights, bForceTeamSkins, 
        bMultiBomb, bNoTeamChanges, 
        bNoTeamSkins, bTeamGame;

    // Pos:0x055
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        CurrentAttackingTeam, PostElapsedTime, 
        PostRemaiingTime, WaitingForStart, 
        WaitingForStartCountDown, bMatchOver, 
        bObjectivePlanted;
}

simulated function PostNetBeginPlay()
{
    local PlayerReplicationInfo PRI;

    Level.GRI = self;
    // End:0x30
    if(VoiceReplicationInfo == none)
    {
        // End:0x2F
        foreach DynamicActors(Class'Engine.VoiceChatReplicationInfo', VoiceReplicationInfo)
        {
            // End:0x2F
            break;            
        }        
    }
    // End:0x4C
    foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
    {
        AddPRI(PRI);        
    }    
    // End:0x6C
    if(int(Level.NetMode) == int(NM_Client))
    {
        TeamSymbolNotify();
    }
    //return;    
}

simulated function TeamSymbolNotify()
{
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    //return;    
}

event EventForceBegin()
{
    ForceBegin();
    //return;    
}

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x3F
    if(int(Level.NetMode) == int(NM_Client))
    {
        ServerName = "";
        AdminName = "";
        AdminEmail = "";
        MessageOfTheDay = "";
    }
    SecondCount = Level.TimeSeconds;
    SetTimer(Level.TimeDilation, true);
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    Winner = none;
    //return;    
}

simulated function Timer()
{
    local int i;
    local PlayerReplicationInfo OldHolder[2];
    local Controller C;

    // End:0xF2
    if(int(Level.NetMode) == int(NM_Client))
    {
        // End:0x4B
        if((PostRemaiingTime != 0) && PostRemaiingTime != PostRemaiingTimeClient)
        {
            PostRemaiingTimeClient = PostRemaiingTime;
            RemainingTime = PostRemaiingTime;
        }
        // End:0x7D
        if((PostElapsedTime != 0) && PostElapsedTime != PostElapsedTimeClient)
        {
            PostElapsedTimeClient = PostElapsedTime;
            ElapsedTime = PostElapsedTime;
        }
        // End:0xCC
        if(!Level.GetMatchMaker().bChangingHost)
        {
            // End:0xCC
            if(!WaitingForStart)
            {
                ElapsedTime++;
                // End:0xCC
                if((RemainingTime > 0) && !bStopCountDown)
                {
                    RemainingTime--;
                }
            }
        }
        // End:0xDD
        if(!bTeamSymbolsUpdated)
        {
            TeamSymbolNotify();
        }
        SetTimer(Level.TimeDilation, true);        
    }
    else
    {
        // End:0x263
        if(int(Level.NetMode) != int(NM_Standalone))
        {
            OldHolder[0] = FlagHolder[0];
            OldHolder[1] = FlagHolder[1];
            FlagHolder[0] = none;
            FlagHolder[1] = none;
            i = 0;
            J0x142:

            // End:0x1C1 [Loop If]
            if(i < PRIArray.Length)
            {
                // End:0x1B7
                if((PRIArray[i].HasFlag != none) && PRIArray[i].Team != none)
                {
                    FlagHolder[PRIArray[i].Team.TeamIndex] = PRIArray[i];
                }
                i++;
                // [Loop Continue]
                goto J0x142;
            }
            i = 0;
            J0x1C8:

            // End:0x263 [Loop If]
            if(i < 2)
            {
                // End:0x259
                if(OldHolder[i] != FlagHolder[i])
                {
                    C = Level.ControllerList;
                    J0x203:

                    // End:0x259 [Loop If]
                    if(C != none)
                    {
                        // End:0x242
                        if(PlayerController(C) != none)
                        {
                            PlayerController(C).ClientUpdateFlagHolder(FlagHolder[i], i);
                        }
                        C = C.nextController;
                        // [Loop Continue]
                        goto J0x203;
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x1C8;
            }
        }
    }
    // End:0x2BB
    if(!Level.GetMatchMaker().bChangingHost)
    {
        // End:0x2BB
        if((int(Level.NetMode) == int(NM_Client)) || int(Level.NetMode) == int(NM_ListenServer))
        {
            PlayTimerSound();
        }
    }
    //return;    
}

simulated function PlayTimerSound()
{
    // End:0xB2
    if(!bStopCountDown)
    {
        // End:0x5E
        if(bObjectivePlanted)
        {
            Level.GetLocalPlayerController().FmodClientPlaySound("Warfare_Sound_ATS/com/ats_com_bomb_countdown");            
        }
        else
        {
            // End:0xB2
            if((GetRemainingTime()) <= 30)
            {
                Level.GetLocalPlayerController().FmodClientPlaySound("Warfare_Sound_ATS/com/ats_com_time_countdown");
            }
        }
    }
    //return;    
}

simulated function int GetRemainingTime()
{
    return RemainingTime;
    //return;    
}

simulated function array<int> GetTeamScores()
{
    local int lp1;
    local array<int> TeamScores;

    lp1 = 0;
    J0x07:

    // End:0x2A [Loop If]
    if(lp1 < 2)
    {
        TeamScores[lp1] = 0;
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    lp1 = 0;
    J0x31:

    // End:0x89 [Loop If]
    if(lp1 < 3)
    {
        // End:0x7F
        if(Teams[lp1] != none)
        {
            TeamScores[Teams[lp1].TeamIndex] = int(Teams[lp1].Score);
        }
        lp1++;
        // [Loop Continue]
        goto J0x31;
    }
    return TeamScores;
    //return;    
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
    else
    {
        winTeamIndex = 1;
    }
    // End:0x78
    if((TeamInfo(Winner) != none) && TeamInfo(Winner).TeamIndex != winTeamIndex)
    {
        winTeamIndex = TeamInfo(Winner).TeamIndex;
    }
    return winTeamIndex;
    //return;    
}

simulated function PlayerReplicationInfo FindPlayerByID(int PlayerID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < PRIArray.Length)
    {
        // End:0x41
        if(PRIArray[i].PlayerID == PlayerID)
        {
            return PRIArray[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

event ForcedAddPRI(PlayerReplicationInfo PRI)
{
    AddPRI(PRI);
    //return;    
}

event ForcedRemovePRI(PlayerReplicationInfo PRI)
{
    RemovePRI(PRI);
    //return;    
}

simulated function AddPRI(PlayerReplicationInfo PRI)
{
    local byte NewVoiceID;
    local int i;

    // End:0xB6
    if((int(Level.NetMode) == int(NM_ListenServer)) || int(Level.NetMode) == int(NM_DedicatedServer))
    {
        i = 0;
        J0x3B:

        // End:0x8C [Loop If]
        if(i < PRIArray.Length)
        {
            // End:0x82
            if(int(PRIArray[i].VoiceID) == int(NewVoiceID))
            {
                i = -1;
                NewVoiceID++;
                // [Explicit Continue]
            }
            i++;
            // [Loop Continue]
            goto J0x3B;
        }
        // End:0xA2
        if(int(NewVoiceID) >= 32)
        {
            NewVoiceID = 0;
        }
        PRI.VoiceID = NewVoiceID;
    }
    PRIArray[PRIArray.Length] = PRI;
    //return;    
}

simulated function RemovePRI(PlayerReplicationInfo PRI)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x44 [Loop If]
    if(i < PRIArray.Length)
    {
        // End:0x3A
        if(PRIArray[i] == PRI)
        {
            PRIArray.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Log(("GameReplicationInfo::RemovePRI() pri=" $ string(PRI)) $ " not found.", 'Error');
    //return;    
}

simulated function GetPRIArray(out array<PlayerReplicationInfo> pris)
{
    local int i, Num;

    pris.Remove(0, pris.Length);
    i = 0;
    J0x14:

    // End:0x58 [Loop If]
    if(i < PRIArray.Length)
    {
        // End:0x4E
        if(PRIArray[i] != none)
        {
            pris[Num++] = PRIArray[i];
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    local int i;

    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.ServerGroup, "ServerName", default.GRIPropsDisplayText[i++], byte(255), 1, "Text", "60",, true);
    PlayInfo.AddSetting(default.ServerGroup, "AdminName", default.GRIPropsDisplayText[i++], byte(255), 1, "Text", "40",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "AdminEmail", default.GRIPropsDisplayText[i++], byte(255), 1, "Text", "60",, true, true);
    PlayInfo.AddSetting(default.ServerGroup, "MessageOfTheDay", default.GRIPropsDisplayText[i++], 251, 1, "Custom", "255;;GUI2K4.MOTDConfigPage",, true, true);
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1E
        case "ServerName":
            return default.GRIPropDescText[0];
        // End:0x34
        case "AdminName":
            return default.GRIPropDescText[1];
        // End:0x4C
        case "AdminEmail":
            return default.GRIPropDescText[2];
        // End:0x69
        case "MessageOfTheDay":
            return default.GRIPropDescText[3];
        // End:0xFFFF
        default:
            return super(Info).GetDescriptionText(PropName);
            break;
    }
    //return;    
}

function SyncRemainingTime()
{
    PostRemaiingTime = RemainingTime;
    PostElapsedTime = ElapsedTime;
    NetUpdateTime = Level.TimeSeconds - float(999);
    //return;    
}

simulated function bool IsDefender(byte Team)
{
    //return;    
}

simulated function bool IsGhostChatting(Actor Sender)
{
    return false;
    //return;    
}

simulated function int GetMaxLives()
{
    Log((string(self) $ " MaxLives :") $ string(MaxLives));
    return MaxLives;
    //return;    
}

simulated function SetMaxLives(int iMaxLives)
{
    Log((string(self) $ " MaxLives :") $ string(iMaxLives));
    MaxLives = iMaxLives;
    //return;    
}

simulated function int GetCurRound()
{
    //return;    
}

simulated function int GetMaxRound()
{
    //return;    
}

simulated function byte GetCurTeamMemberCount(int TeamIndex)
{
    //return;    
}

simulated function int GetCurAlienModeWaitingTimeCount()
{
    //return;    
}

defaultproperties
{
    bStopCountDown=true
    WeaponBerserk=1.0000000
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