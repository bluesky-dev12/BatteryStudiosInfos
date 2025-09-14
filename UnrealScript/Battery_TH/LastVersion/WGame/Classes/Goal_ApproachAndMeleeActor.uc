class Goal_ApproachAndMeleeActor extends Goal;

var Actor Target;

function Goal_ApproachAndMeleeActor Init(wAIBotBase inOwner, Actor inTarget)
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
    Log("[Goal_ApproachAndMeleeActor::ClearRefenreces]");
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
    // End:0xA8
    if(int(GoalStatus) == int(0))
    {
        // End:0xA0
        if((Target != none) && Owner.actorReachable(Target))
        {
            GoalStatus = 1;
            AddSubgoal(Goal_MoveToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToward')).Init(Owner, Target, Target, Owner.NPCParam.MeleeRange, true, false, false));            
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
    return (("[Goal_ApproachAndMeleeActor] target=" $ string(Target)) $ " , dist to dest=") $ string(VSize(Owner.Pawn.Location - Target.Location));
    //return;    
}
