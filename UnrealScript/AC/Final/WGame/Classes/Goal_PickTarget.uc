class Goal_PickTarget extends Goal;

var MemoryItem mi;

function Goal_PickTarget Init(wAIBotBase inOwner, MemoryItem inMI)
{
    InitBase(inOwner);
    mi = inMI;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_PickTarget::ClearRefenreces]");
    mi.ClearReferences();
    mi = none;
    //return;    
}

function Start()
{
    // End:0x5B
    if(int(GoalStatus) == int(0))
    {
        mi.LastTargetedTime = Owner.Level.TimeSeconds;
        Owner.Target = mi.Pawn;
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
    return "[Goal_PickTarget] Target=" $ mi.Pawn.PlayerReplicationInfo.PlayerName;
    //return;    
}
