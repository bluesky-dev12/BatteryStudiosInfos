class Goal_RemoveBarricade extends Goal;

var wFlagObjectiveBase flag;
var Decoration DecoBarricade;

function Goal_RemoveBarricade Init(wAIBotBase inOwner, Decoration Deco)
{
    InitBase(inOwner);
    flag = wAIDefencePawn(inOwner.Pawn).AttackFlag;
    DecoBarricade = Deco;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_RemoveBarricade::ClearRefenreces]");
    flag = none;
    DecoBarricade = none;
    //return;    
}

function Start()
{
    // End:0x5D
    if(int(GoalStatus) == int(0))
    {
        GoalStatus = 1;
        AddSubgoal(Goal_MeleeBarricade(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MeleeBarricade')).Init(Owner, DecoBarricade));
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local float fDist, fReachRadius;

    ProcessSubGoals(dt);
    // End:0x36
    if(DecoBarricade.bHidden || DecoBarricade.Health < 1)
    {
        return 3;
    }
    fDist = VSize(flag.Location - Owner.Pawn.Location);
    fReachRadius = flag.ReachRadius + Owner.Pawn.CollisionRadius;
    // End:0xA7
    if(fDist < fReachRadius)
    {
        return 1;        
    }
    else
    {
        return 2;
    }
    //return;    
}

function string ToString()
{
    return (((("[Goal_RemoveBarricade] Flag=" $ string(flag)) $ " iActiveTeam=") $ string(flag.iActiveTeam)) $ " iCapturingTeam=") $ string(flag.iCapturingTeam);
    //return;    
}
