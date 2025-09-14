/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Roam.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class Goal_Roam extends Goal;

function Goal_Roam Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
}

function Start()
{
    // End:0x1e
    if(GoalStatus == 0)
    {
        AddGoalMovePathToward();
        GoalStatus = 1;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    // End:0x27
    if(gs != 1)
    {
        AddGoalMovePathToward();
    }
    return 1;
}

function AddGoalMovePathToward()
{
    AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MovePathToward')).Init(Owner, Owner.FindRandomDest()));
}

function string ToString()
{
    return "[Goal_Roam]";
}
