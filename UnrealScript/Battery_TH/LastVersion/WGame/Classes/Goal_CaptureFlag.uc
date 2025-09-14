class Goal_CaptureFlag extends Goal;

var wFlagObjectiveBase flag;

function Goal_CaptureFlag Init(wAIBotBase inOwner, wFlagObjectiveBase inFlag)
{
    InitBase(inOwner);
    flag = inFlag;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_ApproachAndMelee::ClearRefenreces]");
    flag = none;
    //return;    
}

function Start()
{
    // End:0xA4
    if(int(GoalStatus) == int(0))
    {
        // End:0x9C
        if(VSize(flag.Location - Owner.Pawn.Location) < flag.CollisionRadius)
        {
            GoalStatus = 1;
            AddSubgoal(Goal_LookAround(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_LookAround')).Init(Owner, 30.0000000));            
        }
        else
        {
            GoalStatus = 2;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    ProcessSubGoals(dt);
    // End:0x33
    if(flag.iActiveTeam == Owner.GetTeamNum())
    {
        return 3;        
    }
    else
    {
        // End:0x75
        if(VSize(flag.Location - Owner.Pawn.Location) < flag.CollisionRadius)
        {
            return 1;            
        }
        else
        {
            return 2;
        }
    }
    //return;    
}

function string ToString()
{
    return (((("[Goal_CaptureFlag] Flag=" $ string(flag)) $ " iActiveTeam=") $ string(flag.iActiveTeam)) $ " iCapturingTeam=") $ string(flag.iCapturingTeam);
    //return;    
}
