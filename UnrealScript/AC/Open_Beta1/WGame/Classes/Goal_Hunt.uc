class Goal_Hunt extends Goal;

function Goal_Hunt Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
    //return;    
}

function Start()
{
    // End:0x18
    if(int(GoalStatus) == int(0))
    {
        GoalStatus = 1;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    // End:0x2D
    if(int(gs) != int(1))
    {
        End();
        ClearSubgoals();
    }
    return 1;
    //return;    
}

function string ToString()
{
    return "[Goal_Hunt]";
    //return;    
}
