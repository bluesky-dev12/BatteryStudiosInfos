/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_ApproachAndMelee.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class Goal_ApproachAndMelee extends Goal
    dependson(Goal_Melee);

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
}

function ClearReferences()
{
    Log("[Goal_ApproachAndMelee::ClearRefenreces]");
    Target = none;
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
}

function Start()
{
    // End:0xed
    if(GoalStatus == 0)
    {
        // End:0xe5
        if(Target != none && Owner.actorReachable(Target))
        {
            GoalStatus = 1;
            AddSubgoal(Goal_MoveToward(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MoveToward')).Init(Owner, Target, Target, Owner.NPCParam.MeleeRange, true, false, false));
            AddSubgoal(Goal_Melee(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Melee')).Init(Owner, Target));
        }
        // End:0xed
        else
        {
            GoalStatus = 2;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x11
    if(Target == none)
    {
        return 2;
    }
    // End:0x1d
    else
    {
        return ProcessSubGoals(dt);
    }
}

function string ToString()
{
    return "[Goal_ApproachAndMelee] target=" $ Target.PlayerReplicationInfo.PlayerName $ ", dist to dest=" $ string(VSize(Owner.Pawn.Location - Target.Location));
}
