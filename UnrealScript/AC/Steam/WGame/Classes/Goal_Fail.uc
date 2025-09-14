/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Fail.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class Goal_Fail extends Goal;

function Goal_Fail Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
}

function Start()
{
    // End:0x18
    if(GoalStatus == 0)
    {
        GoalStatus = 2;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    return 2;
}

function string ToString()
{
    return "[Goal_Fail]";
}
