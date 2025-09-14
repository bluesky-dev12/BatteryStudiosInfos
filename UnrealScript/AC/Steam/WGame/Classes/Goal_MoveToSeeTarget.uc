/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_MoveToSeeTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class Goal_MoveToSeeTarget extends Goal;

function Goal_MoveToSeeTarget Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
}

function Start()
{
    // End:0x85
    if(GoalStatus == 0)
    {
        // End:0x2f
        if(Owner.Target == none)
        {
            GoalStatus = 2;
        }
        // End:0x85
        else
        {
            AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MovePathToward')).Init(Owner, Owner.Target));
            GoalStatus = 1;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x3e
    if(Owner.Memory.GetByPawn(Pawn(Owner.Target)).IsVisible)
    {
        return 3;
    }
    // End:0x4a
    else
    {
        return ProcessSubGoals(dt);
    }
}

function string ToString()
{
    return "[Goal_MoveToSeeTarget]";
}
