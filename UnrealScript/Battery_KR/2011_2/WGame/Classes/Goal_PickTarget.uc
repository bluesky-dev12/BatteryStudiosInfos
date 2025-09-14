class Goal_PickTarget extends Goal;

var MemoryItem MI;

function Goal_PickTarget Init(wAIBotBase inOwner, MemoryItem inMI)
{
    InitBase(inOwner);
    MI = inMI;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_PickTarget::ClearRefenreces]");
    MI.ClearReferences();
    MI = none;
    //return;    
}

function Start()
{
    // End:0x5B
    if(int(GoalStatus) == int(0))
    {
        MI.LastTargetedTime = Owner.Level.TimeSeconds;
        Owner.Target = MI.Pawn;
        GoalStatus = 3;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    return 3;
    //return;    
}

function string ToString()
{
    return "[Goal_PickTarget] Target=" $ MI.Pawn.PlayerReplicationInfo.PlayerName;
    //return;    
}
