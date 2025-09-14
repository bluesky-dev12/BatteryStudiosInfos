class wMSGameReplicationInfo extends GameReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ERoundWinner
{
    ERW_None,                       // 0
    ERW_PracticeRoundEnded,         // 1
    ERW_RedAttacked,                // 2
    ERW_BlueAttacked,               // 3
    ERW_RedDefended,                // 4
    ERW_BlueDefended,               // 5
    ERW_RedMoreObjectives,          // 6
    ERW_BlueMoreObjectives,         // 7
    ERW_RedMoreProgress,            // 8
    ERW_BlueMoreProgress,           // 9
    ERW_RedGotSameOBJFaster,        // 10
    ERW_BlueGotSameOBJFaster,       // 11
    ERW_Draw                        // 12
};

var int RoundTimeLimit;
var int RoundStartTime;
var int CurrentRound;
var int MaxRounds;
var int ReinforcementCountDown;
var int PracticeTimeLimit;
var int DefuseTimeLimit;
var int RoundOverTime;
var int MaxTeleportTime;
var int ScoreLimit;
var bool bChangeAttackingTeam;
var int ScoringTeam;
var float fEndRoundTime;
var byte ObjectiveProgress;
var byte MaxObjectivePriority;
var int PrimaryTeam;
var int MaxLives;
var GameObjective Objectives;
var GameObject GameObject;
var wMSGameReplicationInfo.ERoundWinner RoundWinner;
var localized string ERW_PracticeRoundEndedStr;
var localized string ERW_RedAttackedStr;
var localized string ERW_BlueAttackedStr;
var localized string ERW_RedDefendedStr;
var localized string ERW_BlueDefendedStr;
var localized string ERW_DefendersStr;
var localized string ERW_AttackersStr;
var localized string ERW_RedMoreObjectivesStr;
var localized string ERW_BlueMoreObjectivesStr;
var localized string ERW_RedMoreProgressStr;
var localized string ERW_BlueMoreProgressStr;
var localized string ERW_RedGotSameOBJFasterStr;
var localized string ERW_BlueGotSameOBJFasterStr;
var localized string ERW_DrawStr;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        CurrentRound, DefuseTimeLimit, 
        GameObject, MaxLives, 
        ObjectiveProgress, PrimaryTeam, 
        ReinforcementCountDown, RoundOverTime, 
        RoundStartTime, RoundTimeLimit, 
        RoundWinner, ScoringTeam, 
        bChangeAttackingTeam, fEndRoundTime;

    // Pos:0x018
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        MaxRounds, ScoreLimit;
}

simulated function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    SecondCount = Level.TimeSeconds;
    SetTimer(1.0000000, true);
    //return;    
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    SetupAssaultObjectivePriority();
    //return;    
}

simulated function SetupAssaultObjectivePriority()
{
    local GameObjective Go, BestGO, NextBestGO;
    local byte CurrentPriority;

    Log("## ASGRI::SetupAssaultObjectivePriority");
    // End:0xA2
    foreach AllActors(Class'UnrealGame.GameObjective', Go)
    {
        // End:0x64
        if(Go.bBotOnlyObjective)
        {
            Go.ObjectivePriority = byte(255);
            continue;            
        }
        // End:0xA1
        if((BestGO == none) || int(Go.DefensePriority) > int(BestGO.DefensePriority))
        {
            BestGO = Go;
        }        
    }    
    // End:0xB0
    if(BestGO == none)
    {
        return;
    }
    J0xB0:

    NextBestGO = none;
    // End:0x1FD
    foreach AllActors(Class'UnrealGame.GameObjective', Go)
    {
        // End:0xDD
        if(Go.bBotOnlyObjective)
        {
            continue;            
        }
        // End:0x198
        if(int(Go.DefensePriority) == int(BestGO.DefensePriority))
        {
            Log((((((("  Assault Priority:" @ string(CurrentPriority)) @ "DefensePriority:") @ string(Go.DefensePriority)) @ "Info:") @ Go.Objective_Info_Attacker) @ "Destruction:") @ Go.DestructionMessage);
            Go.ObjectivePriority = CurrentPriority;
            // End:0x1FC
            continue;
        }
        // End:0x1FC
        if((int(Go.DefensePriority) < int(BestGO.DefensePriority)) && (NextBestGO == none) || int(Go.DefensePriority) > int(NextBestGO.DefensePriority))
        {
            NextBestGO = Go;
        }        
    }    
    BestGO = NextBestGO;
    CurrentPriority++;
    // End:0xB0
    if(!(NextBestGO == none))
        goto J0xB0;
    MaxObjectivePriority = byte(int(CurrentPriority) - 1);
    //return;    
}

simulated function Timer()
{
    // End:0x53
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x53
        if((Level.TimeSeconds - SecondCount) >= Level.TimeDilation)
        {
            // End:0x53
            if(ReinforcementCountDown > 0)
            {
                ReinforcementCountDown--;
            }
        }
    }
    super.Timer();
    //return;    
}

simulated function int GetRemainingTime()
{
    return Max(0, RoundTimeLimit - (RoundStartTime - RemainingTime));
    //return;    
}

simulated function bool IsPracticeRound()
{
    return CurrentRound == 0;
    //return;    
}

simulated function bool IsDefender(byte Team)
{
    // End:0x2A
    if((0 <= CurrentAttackingTeam) && CurrentAttackingTeam <= 1)
    {
        return int(Team) != CurrentAttackingTeam;        
    }
    else
    {
        return false;
    }
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

simulated function string GetRoundWinnerString()
{
    switch(RoundWinner)
    {
        // End:0x0F
        case 0:
            return "";
        // End:0x1A
        case 1:
            return ERW_PracticeRoundEndedStr;
        // End:0x25
        case 2:
            return ERW_RedAttackedStr;
        // End:0x30
        case 3:
            return ERW_BlueAttackedStr;
        // End:0x3B
        case 4:
            return ERW_RedDefendedStr;
        // End:0x46
        case 5:
            return ERW_BlueDefendedStr;
        // End:0x51
        case 6:
            return ERW_RedMoreObjectivesStr;
        // End:0x5C
        case 7:
            return ERW_BlueMoreObjectivesStr;
        // End:0x67
        case 8:
            return ERW_RedMoreProgressStr;
        // End:0x72
        case 9:
            return ERW_BlueMoreProgressStr;
        // End:0x7D
        case 10:
            return ERW_RedGotSameOBJFasterStr;
        // End:0x88
        case 11:
            return ERW_BlueGotSameOBJFasterStr;
        // End:0x93
        case 12:
            return ERW_DrawStr;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

simulated function bool IsGhostChatting(Actor Sender)
{
    local PlayerReplicationInfo PRI;
    local bool bGhostChatting;

    // End:0x2C
    if(Pawn(Sender) != none)
    {
        PRI = Pawn(Sender).PlayerReplicationInfo;        
    }
    else
    {
        // End:0x55
        if(Controller(Sender) != none)
        {
            PRI = Controller(Sender).PlayerReplicationInfo;
        }
    }
    // End:0x62
    if(PRI == none)
    {
        return false;
    }
    // End:0x101
    if(PRI.IsDead && (GameClass ~= "WMission.wSDGameInfo") || GameClass ~= "WMission.wSBTGameInfo")
    {
        bGhostChatting = true;
        // End:0xEF
        if(GameClass ~= "WMission.wSBTGameInfo")
        {
            // End:0xEF
            if(MaxLives <= 0)
            {
                return false;
            }
        }
        // End:0x101
        if(int(RoundState) != int(2))
        {
            return false;
        }
    }
    return bGhostChatting;
    //return;    
}

defaultproperties
{
    MaxTeleportTime=7
    ERW_PracticeRoundEndedStr="Practice round over. Get ready!"
    ERW_RedAttackedStr="Red team successfully attacked!"
    ERW_BlueAttackedStr="Blue team successfully attacked!"
    ERW_RedDefendedStr="Red team successfully defended!"
    ERW_BlueDefendedStr="Blue team successfully defended!"
    ERW_RedMoreObjectivesStr="Red team scored (more objectives)."
    ERW_BlueMoreObjectivesStr="Blue team scored (more objectives)."
    ERW_RedMoreProgressStr="Red team scored (closer to completion)."
    ERW_BlueMoreProgressStr="Blue team scored (closer to completion)."
    ERW_RedGotSameOBJFasterStr="Red team scored (fastest)."
    ERW_BlueGotSameOBJFasterStr="Blue team scored (fastest)."
    ERW_DrawStr="Draw game."
    CurrentAttackingTeam=-1
    NetUpdateFrequency=25.0000000
    NetPriority=1.3000000
}