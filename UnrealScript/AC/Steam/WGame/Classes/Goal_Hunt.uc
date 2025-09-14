/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Hunt.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class Goal_Hunt extends Goal;

function Goal_Hunt Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
}

function Start()
{
    // End:0x18
    if(GoalStatus == 0)
    {
        GoalStatus = 1;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    // End:0x2d
    if(gs != 1)
    {
        End();
        ClearSubgoals();
    }
    return 1;
}

function string ToString()
{
    return "[Goal_Hunt]";
}
