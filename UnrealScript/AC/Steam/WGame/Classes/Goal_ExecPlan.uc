/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_ExecPlan.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:9
 *
 *******************************************************************************/
class Goal_ExecPlan extends Goal;

var wActionContainer Plan;

function Goal_ExecPlan Init(wAIBotBase inOwner, wActionContainer inPlan)
{
    InitBase(inOwner);
    Plan = inPlan;
    return self;
}

function ClearReferences()
{
    Log("[Goal_ExecPlan::ClearRefenreces]");
    Plan = none;
}

function Start()
{
    // End:0x1e
    if(GoalStatus == 0)
    {
        GoalStatus = 1;
        InitSubGoals();
    }
}

function InitSubGoals()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x7d [While If]
    if(lp1 < Plan.SubActionContainersLength)
    {
        AddSubgoal(Goal_ExecPartialPlan(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_ExecPartialPlan')).Init(Owner, Plan.SubActionContainers[lp1]));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function float GetProgress()
{
    local int idx;
    local float Step;

    // End:0x15
    if(Subgoals.Length == 0)
    {
        return 1.0;
    }
    // End:0x78
    else
    {
        idx = Plan.SubActionContainersLength - Subgoals.Length;
        Step = 1.0 / float(Plan.SubActionContainersLength);
        return Goal_ExecPartialPlan(Subgoals[0]).GetProgress(float(idx) * Step, Step);
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    return gs;
}

function End()
{
    super.End();
    Plan.FreeAll();
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint.X = 0.0;
    Owner.FocalPoint.Y = 0.0;
    Owner.FocalPoint.Z = 0.0;
    return false;
}

function string ToString()
{
    return "[Goal_ExecPlan] ";
}
