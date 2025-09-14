/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Stay.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *
 *******************************************************************************/
class Goal_Stay extends Goal;

var float StayLength;

function Goal_Stay Init(wAIBotBase inOwner, float inStayLength)
{
    InitBase(inOwner);
    StayLength = inStayLength;
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
    StayLength -= dt;
    // End:0x1f
    if(StayLength < float(0))
    {
        return 3;
    }
    // End:0x22
    else
    {
        return 1;
    }
}

function string ToString()
{
    return "[Goal_Stay] StayLength=" $ string(StayLength);
}
