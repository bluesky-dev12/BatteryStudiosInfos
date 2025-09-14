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
    local float fDist;

    // End:0x166
    if(int(GoalStatus) == int(0))
    {
        // End:0x15E
        if((Target != none) && Owner.actorReachable(Target))
        {
            GoalStatus = 1;
            fDist = VSize(Target.Location - Owner.Pawn.Location);
            // End:0xF7
            if(fDist < Owner.NPCParam.MeleeRange)
            {
                Owner.Focus = Target;
                // End:0xF4
                if(Owner.ReadyToMeleeAttack())
                {
                    AddSubgoal(Goal_Melee(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Melee')).Init(Owner, Target));
                }                
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
