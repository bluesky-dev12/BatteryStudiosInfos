class Goal_MoveToSeeTarget extends Goal;

function Goal_MoveToSeeTarget Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
    //return;    
}

function Start()
{
    // End:0x85
    if(int(GoalStatus) == int(0))
    {
        // End:0x2F
        if(Owner.Target == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(Owner, Owner.Target));
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x3E
    if(Owner.Memory.GetByPawn(Pawn(Owner.Target)).IsVisible)
    {
        return 3;        
    }
    else
    {
        return ProcessSubGoals(dt);
    }
    //return;    
}

function string ToString()
{
    return "[Goal_MoveToSeeTarget]";
    //return;    
}
