class Goal_Roam extends Goal;

function Goal_Roam Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
    //return;    
}

function Start()
{
    // End:0x1E
    if(int(GoalStatus) == int(0))
    {
        AddGoalMovePathToward();
        GoalStatus = 1;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    // End:0x27
    if(int(gs) != int(1))
    {
        AddGoalMovePathToward();
    }
    return 1;
    //return;    
}

function AddGoalMovePathToward()
{
    AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(Owner, Owner.FindRandomDest()));
    //return;    
}

function string ToString()
{
    return "[Goal_Roam]";
    //return;    
}
