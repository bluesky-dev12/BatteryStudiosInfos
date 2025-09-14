class Goal_MoveToFrontline extends Goal;

function Goal_MoveToFrontline Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
    //return;    
}

function Start()
{
    // End:0x81
    if(int(GoalStatus) == int(0))
    {
        AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(Owner, Owner.AILevel.GetRandomDestFromFrontLine(byte(Owner.GetTeamNum()))));
        GoalStatus = 1;
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
    return "[Goal_MoveToFrontline]";
    //return;    
}
