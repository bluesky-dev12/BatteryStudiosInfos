class Goal_Stay extends Goal;

var float StayLength;

function Goal_Stay Init(wAIBotBase inOwner, float inStayLength)
{
    InitBase(inOwner);
    StayLength = inStayLength;
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
    StayLength -= dt;
    // End:0x1F
    if(StayLength < float(0))
    {
        return 3;        
    }
    else
    {
        return 1;
    }
    //return;    
}

function string ToString()
{
    return "[Goal_Stay] StayLength=" $ string(StayLength);
    //return;    
}
