/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_MoveToFrontline.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class Goal_MoveToFrontline extends Goal;

function Goal_MoveToFrontline Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
}

function Start()
{
    // End:0x81
    if(GoalStatus == 0)
    {
        AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MovePathToward')).Init(Owner, Owner.AILevel.GetRandomDestFromFrontLine(byte(Owner.GetTeamNum()))));
        GoalStatus = 1;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    return gs;
}

function string ToString()
{
    return "[Goal_MoveToFrontline]";
}
