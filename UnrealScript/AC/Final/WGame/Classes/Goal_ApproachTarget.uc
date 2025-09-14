class Goal_ApproachTarget extends Goal;

var Pawn Target;
var float inReachRadius;

function Goal_ApproachTarget Init(wAIBotBase inOwner, Pawn inTarget)
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
    // End:0xFB
    if(int(GoalStatus) == int(0))
    {
        // End:0xF3
        if(Target != none)
        {
            GoalStatus = 1;
            // End:0x8C
            if(!Owner.actorReachable(Target))
            {
                AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(Owner, Target, inReachRadius + float(10)));                
            }
            else
            {
                AddSubgoal(Goal_MoveToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToward')).Init(Owner, Target, Target, Owner.NPCParam.MeleeRange, true, false, false));
            }            
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
    // End:0x25
    if((Target == none) || Owner.IsStopAction)
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

defaultproperties
{
    inReachRadius=50.0000000
}