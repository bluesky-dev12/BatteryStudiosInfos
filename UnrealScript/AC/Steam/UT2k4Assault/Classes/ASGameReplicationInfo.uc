/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASGameReplicationInfo.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:28
 *	Functions:7
 *
 *******************************************************************************/
class ASGameReplicationInfo extends GameReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ERoundWinner
{
    ERW_None,
    ERW_PracticeRoundEnded,
    ERW_RedAttacked,
    ERW_BlueAttacked,
    ERW_RedDefended,
    ERW_BlueDefended,
    ERW_RedMoreObjectives,
    ERW_BlueMoreObjectives,
    ERW_RedMoreProgress,
    ERW_BlueMoreProgress,
    ERW_RedGotSameOBJFaster,
    ERW_BlueGotSameOBJFaster,
    ERW_Draw
};

var int RoundTimeLimit;
var int RoundStartTime;
var int CurrentRound;
var int MaxRounds;
var int ReinforcementCountDown;
var int PracticeTimeLimit;
var bool bTeamZeroIsAttacking;
var int RoundOverTime;
var int MaxTeleportTime;
var byte ObjectiveProgress;
var byte MaxObjectivePriority;
var GameObjective Objectives;
var GameObject GameObject;
var ASGameReplicationInfo.ERoundWinner RoundWinner;
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
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        RoundTimeLimit, RoundStartTime,
        CurrentRound, ReinforcementCountDown,
        bTeamZeroIsAttacking, RoundOverTime,
        ObjectiveProgress, GameObject,
        RoundWinner;

    // Pos:0x18
    reliable if(bNetInitial && Role == 4)
        MaxRounds;

}

simulated function PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    SecondCount = Level.TimeSeconds;
    SetTimer(1.0, true);
}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    SetupAssaultObjectivePriority();
}

simulated function SetupAssaultObjectivePriority()
{
    local GameObjective Go, BestGO, NextBestGO;
    local byte CurrentPriority;

    Log("## ASGRI::SetupAssaultObjectivePriority");
    // End:0xa2
    foreach AllActors(class'GameObjective', Go)
    {
        // End:0x64
        if(Go.bBotOnlyObjective)
        {
            Go.ObjectivePriority = byte(255);
            continue;
        }
        // End:0xa2
        else
        {
            // End:0xa1
            if(BestGO == none || Go.DefensePriority > BestGO.DefensePriority)
            {
                BestGO = Go;
            }
            continue;
        }        
    }
    // End:0xb0
    if(BestGO == none)
    {
        return;
    }
    NextBestGO = none;
    // End:0x1fd
    foreach AllActors(class'GameObjective', Go)
    {
        // End:0xdd
        if(Go.bBotOnlyObjective)
        {
            continue;
        }
        // End:0x1fd
        else
        {
            // End:0x198
            if(Go.DefensePriority == BestGO.DefensePriority)
            {
                Log("  Assault Priority:" @ string(CurrentPriority) @ "DefensePriority:" @ string(Go.DefensePriority) @ "Info:" @ Go.Objective_Info_Attacker @ "Destruction:" @ Go.DestructionMessage);
                Go.ObjectivePriority = CurrentPriority;
            }
            // End:0x1fc
            else
            {
                // End:0x1fc
                if(Go.DefensePriority < BestGO.DefensePriority && NextBestGO == none || Go.DefensePriority > NextBestGO.DefensePriority)
                {
                    NextBestGO = Go;
                }
            }
            continue;
        }        
    }
    BestGO = NextBestGO;
    ++ CurrentPriority;
    // End:0xb0
    if(NextBestGO == none)
    	goto J0xb0;
    MaxObjectivePriority = byte(CurrentPriority - 1);
}

simulated function Timer()
{
    // End:0x53
    if(Level.NetMode != 1)
    {
        // End:0x53
        if(Level.TimeSeconds - SecondCount >= Level.TimeDilation)
        {
            // End:0x53
            if(ReinforcementCountDown > 0)
            {
                -- ReinforcementCountDown;
            }
        }
    }
    super.Timer();
}

simulated function bool IsPracticeRound()
{
    return CurrentRound == 0;
}

simulated function bool IsDefender(byte Team)
{
    return Team == byte(bTeamZeroIsAttacking);
}

simulated function string GetRoundWinnerString()
{
    switch(RoundWinner)
    {
        // End:0x0f
        case 0:
            return "";
        // End:0x1a
        case 1:
            return ERW_PracticeRoundEndedStr;
        // End:0x25
        case 2:
            return ERW_RedAttackedStr;
        // End:0x30
        case 3:
            return ERW_BlueAttackedStr;
        // End:0x3b
        case 4:
            return ERW_RedDefendedStr;
        // End:0x46
        case 5:
            return ERW_BlueDefendedStr;
        // End:0x51
        case 6:
            return ERW_RedMoreObjectivesStr;
        // End:0x5c
        case 7:
            return ERW_BlueMoreObjectivesStr;
        // End:0x67
        case 8:
            return ERW_RedMoreProgressStr;
        // End:0x72
        case 9:
            return ERW_BlueMoreProgressStr;
        // End:0x7d
        case 10:
            return ERW_RedGotSameOBJFasterStr;
        // End:0x88
        case 11:
            return ERW_BlueGotSameOBJFasterStr;
        // End:0x93
        case 12:
            return ERW_DrawStr;
        // End:0xffff
        default:
}

defaultproperties
{
    MaxTeleportTime=7
    ERW_PracticeRoundEndedStr="?? ???? ?????. ?????!"
    ERW_RedAttackedStr="??? ????? ??????!"
    ERW_BlueAttackedStr="??? ????? ??????!"
    ERW_RedDefendedStr="??? ????? ??????!"
    ERW_BlueDefendedStr="??? ????? ??????!"
    ERW_RedMoreObjectivesStr="??? ??????. (? ?? ?? ??)"
    ERW_BlueMoreObjectivesStr="??? ??????. (? ?? ?? ??)"
    ERW_RedMoreProgressStr="??? ??????. (??? ???)"
    ERW_BlueMoreProgressStr="??? ??????. (??? ???)"
    ERW_RedGotSameOBJFasterStr="??? ??????. (?? ??)"
    ERW_BlueGotSameOBJFasterStr="??? ??????. (?? ??)"
    ERW_DrawStr="??? ?????."
}