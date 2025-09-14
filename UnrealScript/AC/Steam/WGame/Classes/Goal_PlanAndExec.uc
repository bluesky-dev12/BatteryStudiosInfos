/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_PlanAndExec.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:12
 *
 *******************************************************************************/
class Goal_PlanAndExec extends Goal
    dependson(Goal_ExecPlan);

var array<wPurpose> purposes;
var wPurpose CurrentPurpose;
var wActionPlanner Planner;
var bool NeedReplaning;
var float CurrentPlanScore;
var int CheckReplanCount;
var string targetName;

function Goal_PlanAndExec Init(wAIBotBase inOwner, wActionPlanner inPlaner)
{
    InitBase(inOwner);
    purposes.Length = 0;
    CurrentPurpose = default.CurrentPurpose;
    Planner = inPlaner;
    NeedReplaning = default.NeedReplaning;
    CurrentPlanScore = default.CurrentPlanScore;
    CheckReplanCount = default.CheckReplanCount;
    return self;
}

function ClearReferences()
{
    Log("[Goal_PlanAndExec::ClearRefenreces]");
    CurrentPurpose = none;
    Planner.ClearReferences();
    Planner = none;
}

function InitPurposes()
{
    local int lp1;
    local array<Object> objPurposes;

    Owner.Level.Game.GetGameSpecificPurposes(Owner, objPurposes);
    lp1 = 0;
    J0x32:
    // End:0x68 [While If]
    if(lp1 < objPurposes.Length)
    {
        purposes[lp1] = wPurpose(objPurposes[lp1]);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
}

function DecidePurposeToActivate()
{
    local int lp1;
    local wPurpose bestPurpose, P;
    local float bestScore, Score;

    lp1 = 0;
    J0x07:
    // End:0x6c [While If]
    if(lp1 < purposes.Length)
    {
        P = purposes[lp1];
        Score = P.GetActivationScore();
        // End:0x62
        if(bestScore < Score)
        {
            bestScore = Score;
            bestPurpose = P;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    CurrentPurpose = bestPurpose;
    Replan();
}

function Replan()
{
    CurrentPlanScore = -9999.0;
    LookForBetterPlan(Owner.PlanMaster.RequestItr());
}

function LookForBetterPlan(int tries)
{
    local wActionContainer Plan;
    local float planScore, currentPlanDecayedScore;

    Plan = Planner.Plan(CurrentPurpose, tries, planScore);
    currentPlanDecayedScore = CurrentPlanScore * 1.10;
    // End:0xfc
    if(planScore > currentPlanDecayedScore)
    {
        CurrentPlanScore = planScore;
        ClearSubgoals(true);
        AddSubgoal(Goal_ExecPlan(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_ExecPlan')).Init(Owner, Plan));
        CurrentPurpose._TEMP_SCORE += planScore;
        CurrentPurpose._TEMP_COUNT += float(1);
        Owner.FutureState.Init();
        Plan.WriteFutureState(Owner.FutureState);
    }
    // End:0x10b
    else
    {
        Plan.FreeAll();
    }
}

function LogPlan(int tries, float planScore, out wActionContainer Plan)
{
    local int lp1;

    Owner.clog(Owner.PlayerReplicationInfo.PlayerName $ " Purpose=" $ CurrentPurpose.PlanName $ " PLAN score=" $ string(planScore) $ " avg=" $ string(CurrentPurpose._TEMP_SCORE / CurrentPurpose._TEMP_COUNT) $ " wpn=" $ Owner.Pawn.Weapon.BaseParams.strName);
    Owner.clog(Owner.PlayerReplicationInfo.PlayerName $ " got a new plan - score=" $ string(planScore) $ " tries=" $ string(tries) $ " Purpose=" $ CurrentPurpose.PlanName);
    lp1 = 0;
    J0x13e:
    // End:0x193 [While If]
    if(lp1 < Plan.SubActionContainersLength)
    {
        Owner.clog("  " $ Plan.SubActionContainers[lp1].ToString());
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x13e;
    }
}

function LogFlag()
{
    // End:0xec
    if(true)
    {
        // End:0x78
        if(Owner.FutureState.FlagDest != none)
        {
            Owner.dblog(Owner.PlayerReplicationInfo.PlayerName $ " goto " $ string(Owner.FutureState.FlagDest.Tag));
        }
        // End:0xec
        else
        {
            // End:0xec
            if(Owner.FutureState.FlagCapturing != none)
            {
                Owner.dblog(Owner.PlayerReplicationInfo.PlayerName $ " capture " $ string(Owner.FutureState.FlagCapturing.Tag));
            }
        }
    }
}

function Start()
{
    // End:0x24
    if(GoalStatus == 0)
    {
        GoalStatus = 1;
        InitPurposes();
        DecidePurposeToActivate();
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;
    local MemoryItem temp;

    // End:0x97
    if(!NeedReplaning)
    {
        temp = Owner.TargetSystem.GetTarget();
        // End:0x3f
        if(temp == none)
        {
            targetName = "";
        }
        // End:0x97
        else
        {
            // End:0x97
            if(targetName != temp.Pawn.PlayerReplicationInfo.PlayerName)
            {
                targetName = temp.Pawn.PlayerReplicationInfo.PlayerName;
                NeedReplaning = true;
            }
        }
    }
    // End:0xb1
    if(NeedReplaning)
    {
        DecidePurposeToActivate();
        NeedReplaning = false;
    }
    // End:0xe9
    else
    {
        ++ CheckReplanCount;
        // End:0xe9
        if(CheckReplanCount >= 5)
        {
            CheckReplanCount = 0;
            LookForBetterPlan(Owner.PlanMaster.RequestUpdateItr());
        }
    }
    gs = ProcessSubGoals(dt);
    // End:0x124
    if(gs == 2 || gs == 3)
    {
        NeedReplaning = true;
    }
    return 1;
}

function HandleMessage(string Msg)
{
    super.HandleMessage(Msg);
    switch(Msg)
    {
        // End:0x2e
        case default.MessageBePeaceful:
            Planner.Peaceful = true;
            // End:0x5f
            break;
        // End:0x41
        case default.MessageFlashed:
            NeedReplaning = true;
            // End:0x5f
            break;
        // End:0x5c
        case default.MessageNotifyDied:
            targetName = "";
            NeedReplaning = true;
            // End:0x5f
            break;
        // End:0xffff
        default:
}

function string ToString()
{
    return "[Goal_PlanAndExec] " $ string(CurrentPurpose.Name);
}

defaultproperties
{
    CurrentPlanScore=-9999.0
}