class Goal_AimSpecificParts extends Goal;

function Goal_AimSpecificParts Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
    //return;    
}

function Start()
{
    // End:0x56
    if(int(GoalStatus) == int(0))
    {
        // End:0x4E
        if((Owner.Pawn == none) || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    return 1;
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    return true;
    //return;    
}

function End()
{
    //return;    
}

function string ToString()
{
    return "[Goal_AimSpecificParts]";
    //return;    
}
