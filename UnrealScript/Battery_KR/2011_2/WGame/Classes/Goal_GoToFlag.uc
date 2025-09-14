class Goal_GoToFlag extends Goal;

var wFlagObjectiveBase flag;

function Goal_GoToFlag Init(wAIBotBase inOwner, wFlagObjectiveBase inFlag)
{
    InitBase(inOwner);
    flag = inFlag;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_Fire::ClearRefenreces]");
    flag = none;
    //return;    
}

function Start()
{
    // End:0x76
    if(int(GoalStatus) == int(0))
    {
        AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(Owner, flag, 30.0000000));
        GoalStatus = 1;
        Owner.LastTargetFlag = flag;
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

function string ToString()
{
    return "[Goal_GoToFlag] Flag=" $ string(flag);
    //return;    
}
