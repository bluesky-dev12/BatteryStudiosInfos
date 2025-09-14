/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Suicide.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class Goal_Suicide extends Goal;

function Goal_Suicide Init(wAIBotBase inOwner)
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
    Owner.Pawn.Suicide();
    return 3;
}

function string ToString()
{
    return "[Goal_Suicide]";
}
