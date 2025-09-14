class Goal_Fail extends Goal;

function Goal_Fail Init(wAIBotBase inOwner)
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
        GoalStatus = 2;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    return 2;
    //return;    
}

function string ToString()
{
    return "[Goal_Fail]";
    //return;    
}
