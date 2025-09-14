class Goal_PlanAndExec extends Goal;

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
    //return;    
}

function ClearReferences()
{
    Log("[Goal_PlanAndExec::ClearRefenreces]");
    CurrentPurpose = none;
    Planner.ClearReferences();
    Planner = none;
    //return;    
}

function InitPurposes()
{
    local int lp1;
    local array<Object> objPurposes;

    Owner.Level.Game.GetGameSpecificPurposes(Owner, objPurposes);
    lp1 = 0;
    J0x32:

    // End:0x68 [Loop If]
    if(lp1 < objPurposes.Length)
    {
        purposes[lp1] = wPurpose(objPurposes[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x32;
    }
    //return;    
}

function DecidePurposeToActivate()
{
    local int lp1;
    local wPurpose bestPurpose, P;
    local float bestScore, Score;

    lp1 = 0;
    J0x07:

    // End:0x6C [Loop If]
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
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    CurrentPurpose = bestPurpose;
    Replan();
    //return;    
}

function Replan()
{
    CurrentPlanScore = -9999.0000000;
    LookForBetterPlan(Owner.PlanMaster.RequestItr());
    //return;    
}

function LookForBetterPlan(int tries)
{
    local wActionContainer Plan;
    local float planScore, currentPlanDecayedScore;

    Plan = Planner.Plan(CurrentPurpose, tries, planScore);
    currentPlanDecayedScore = CurrentPlanScore * 1.1000000;
    // End:0xFC
    if(planScore > currentPlanDecayedScore)
    {
        CurrentPlanScore = planScore;
        ClearSubgoals(true);
        AddSubgoal(Goal_ExecPlan(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_ExecPlan')).Init(Owner, Plan));
        CurrentPurpose._TEMP_SCORE += planScore;
        CurrentPurpose._TEMP_COUNT += float(1);
        Owner.FutureState.Init();
        Plan.WriteFutureState(Owner.FutureState);        
    }
    else
    {
        Plan.FreeAll();
    }
    //return;    
}

function LogPlan(int tries, float planScore, out wActionContainer Plan)
{
    local int lp1;

    Owner.clog((((((((Owner.PlayerReplicationInfo.PlayerName $ " Purpose=") $ CurrentPurpose.PlanName) $ " PLAN score=") $ string(planScore)) $ " avg=") $ string(CurrentPurpose._TEMP_SCORE / CurrentPurpose._TEMP_COUNT)) $ " wpn=") $ Owner.Pawn.Weapon.BaseParams.strName);
    Owner.clog((((((Owner.PlayerReplicationInfo.PlayerName $ " got a new plan - score=") $ string(planScore)) $ " tries=") $ string(tries)) $ " Purpose=") $ CurrentPurpose.PlanName);
    lp1 = 0;
    J0x13E:

    // End:0x193 [Loop If]
    if(lp1 < Plan.SubActionContainersLength)
    {
        Owner.clog("  " $ Plan.SubActionContainers[lp1].ToString());
        lp1++;
        // [Loop Continue]
        goto J0x13E;
    }
    //return;    
}

function LogFlag()
{
    // End:0xEC
    if(true)
    {
        // End:0x78
        if(Owner.FutureState.FlagDest != none)
        {
            Owner.dblog((Owner.PlayerReplicationInfo.PlayerName $ " goto ") $ string(Owner.FutureState.FlagDest.Tag));            
        }
        else
        {
            // End:0xEC
            if(Owner.FutureState.FlagCapturing != none)
            {
                Owner.dblog((Owner.PlayerReplicationInfo.PlayerName $ " capture ") $ string(Owner.FutureState.FlagCapturing.Tag));
            }
        }
    }
    //return;    
}

function Start()
{
    // End:0x24
    if(int(GoalStatus) == int(0))
    {
        GoalStatus = 1;
        InitPurposes();
        DecidePurposeToActivate();
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;
    local MemoryItem temp;

    // End:0x97
    if(!NeedReplaning)
    {
        temp = Owner.TargetSystem.GetTarget();
        // End:0x3F
        if(temp == none)
        {
            targetName = "";            
        }
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
    // End:0xB1
    if(NeedReplaning)
    {
        DecidePurposeToActivate();
        NeedReplaning = false;        
    }
    else
    {
        CheckReplanCount++;
        // End:0x11D
        if(CheckReplanCount >= 5)
        {
            CheckReplanCount = 0;
            // End:0xFF
            if(int(Owner.Pawn.TypeOfWeapon) == int(Owner.18))
            {
                Replan();                
            }
            else
            {
                LookForBetterPlan(Owner.PlanMaster.RequestUpdateItr());
            }
        }
    }
    gs = ProcessSubGoals(dt);
    // End:0x158
    if((int(gs) == int(2)) || int(gs) == int(3))
    {
        NeedReplaning = true;
    }
    return 1;
    //return;    
}

function HandleMessage(string Msg)
{
    super.HandleMessage(Msg);
    switch(Msg)
    {
        // End:0x2E
        case default.MessageBePeaceful:
            Planner.Peaceful = true;
            // End:0x5F
            break;
        // End:0x41
        case default.MessageFlashed:
            NeedReplaning = true;
            // End:0x5F
            break;
        // End:0x5C
        case default.MessageNotifyDied:
            targetName = "";
            NeedReplaning = true;
            // End:0x5F
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function string ToString()
{
    return "[Goal_PlanAndExec] " $ string(CurrentPurpose.Name);
    //return;    
}

defaultproperties
{
    CurrentPlanScore=-9999.0000000
}