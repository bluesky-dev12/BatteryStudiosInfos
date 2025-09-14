class Goal_GoToBarricade extends Goal;

var wFlagObjectiveBase flag;
var Decoration DecoBarricade;

function Goal_GoToBarricade Init(wAIBotBase inOwner, wFlagObjectiveBase inFlag, optional Decoration Deco)
{
    InitBase(inOwner);
    flag = inFlag;
    DecoBarricade = Deco;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_GoToBarricade::ClearRefenreces]");
    flag = none;
    DecoBarricade = none;
    //return;    
}

function Start()
{
    local float fDist;

    // End:0xC6
    if(int(GoalStatus) == int(0))
    {
        // End:0x60
        if((flag != none) && Owner.Pawn != none)
        {
            fDist = VSize(flag.Location - Owner.Pawn.Location);
        }
        AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(Owner, flag, 100.0000000));
        GoalStatus = 1;
        Owner.LastTargetFlag = flag;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    return gs;
    //return;    
}

function string ToString()
{
    return "[Goal_GoToBarricade] Flag=" $ string(DecoBarricade);
    //return;    
}
