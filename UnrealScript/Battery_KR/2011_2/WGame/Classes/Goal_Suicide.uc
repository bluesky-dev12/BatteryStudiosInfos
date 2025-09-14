class Goal_Suicide extends Goal;

function Goal_Suicide Init(wAIBotBase inOwner)
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
    Owner.Pawn.Suicide();
    return 3;
    //return;    
}

function string ToString()
{
    return "[Goal_Suicide]";
    //return;    
}
