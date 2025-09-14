/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_GoToFlag.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class Goal_GoToFlag extends Goal;

var wFlagObjectiveBase flag;

function Goal_GoToFlag Init(wAIBotBase inOwner, wFlagObjectiveBase inFlag)
{
    InitBase(inOwner);
    flag = inFlag;
    return self;
}

function ClearReferences()
{
    Log("[Goal_Fire::ClearRefenreces]");
    flag = none;
}

function Start()
{
    // End:0x76
    if(GoalStatus == 0)
    {
        AddSubgoal(Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MovePathToward')).Init(Owner, flag, 30.0));
        GoalStatus = 1;
        Owner.LastTargetFlag = flag;
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
    return "[Goal_GoToFlag] Flag=" $ string(flag);
}
