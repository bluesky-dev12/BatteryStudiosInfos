class Goal_ApproachAndMelee extends Goal;

var Pawn Target;

function Goal_ApproachAndMelee Init(wAIBotBase inOwner, Pawn inTarget)
{
    InitBase(inOwner);
    Target = inTarget;
    // End:0x31
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_ApproachAndMelee::ClearRefenreces]");
    Target = none;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
    //return;    
}

function Start()
{
    // End:0xED
    if(int(GoalStatus) == int(0))
    {
        // End:0xE5
        if((Target != none) && Owner.actorReachable(Target))
        {
            GoalStatus = 1;
            AddSubgoal(Goal_MoveToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToward')).Init(Owner, Target, Target, Owner.NPCParam.MeleeRange, true, false, false));
            AddSubgoal(Goal_Melee(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Melee')).Init(Owner, Target));            
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
    // End:0x11
    if(Target == none)
    {
        return 2;        
    }
    else
    {
        return ProcessSubGoals(dt);
    }
    //return;    
}

function string ToString()
{
    return (("[Goal_ApproachAndMelee] target=" $ Target.PlayerReplicationInfo.PlayerName) $ ", dist to dest=") $ string(VSize(Owner.Pawn.Location - Target.Location));
    //return;    
}
