class Goal_ExecPlan extends Goal;

var wActionContainer Plan;

function Goal_ExecPlan Init(wAIBotBase inOwner, wActionContainer inPlan)
{
    InitBase(inOwner);
    Plan = inPlan;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_ExecPlan::ClearRefenreces]");
    Plan = none;
    //return;    
}

function Start()
{
    // End:0x1E
    if(int(GoalStatus) == int(0))
    {
        GoalStatus = 1;
        InitSubGoals();
    }
    //return;    
}

function InitSubGoals()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x7D [Loop If]
    if(lp1 < Plan.SubActionContainersLength)
    {
        AddSubgoal(Goal_ExecPartialPlan(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_ExecPartialPlan')).Init(Owner, Plan.SubActionContainers[lp1]));
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function float GetProgress()
{
    local int idx;
    local float Step;

    // End:0x15
    if(Subgoals.Length == 0)
    {
        return 1.0000000;        
    }
    else
    {
        idx = Plan.SubActionContainersLength - Subgoals.Length;
        Step = 1.0000000 / float(Plan.SubActionContainersLength);
        return Goal_ExecPartialPlan(Subgoals[0]).GetProgress(float(idx) * Step, Step);
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    return gs;
    //return;    
}

function End()
{
    super.End();
    Plan.FreeAll();
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint.X = 0.0000000;
    Owner.FocalPoint.Y = 0.0000000;
    Owner.FocalPoint.Z = 0.0000000;
    return false;
    //return;    
}

function string ToString()
{
    return "[Goal_ExecPlan] ";
    //return;    
}
