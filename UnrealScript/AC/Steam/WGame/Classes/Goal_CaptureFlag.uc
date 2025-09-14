/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_CaptureFlag.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class Goal_CaptureFlag extends Goal;

var wFlagObjectiveBase flag;

function Goal_CaptureFlag Init(wAIBotBase inOwner, wFlagObjectiveBase inFlag)
{
    InitBase(inOwner);
    flag = inFlag;
    return self;
}

function ClearReferences()
{
    Log("[Goal_ApproachAndMelee::ClearRefenreces]");
    flag = none;
}

function Start()
{
    // End:0xa4
    if(GoalStatus == 0)
    {
        // End:0x9c
        if(VSize(flag.Location - Owner.Pawn.Location) < flag.CollisionRadius)
        {
            GoalStatus = 1;
            AddSubgoal(Goal_LookAround(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_LookAround')).Init(Owner, 30.0));
        }
        // End:0xa4
        else
        {
            GoalStatus = 2;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    ProcessSubGoals(dt);
    // End:0x33
    if(flag.iActiveTeam == Owner.GetTeamNum())
    {
        return 3;
    }
    // End:0x78
    else
    {
        // End:0x75
        if(VSize(flag.Location - Owner.Pawn.Location) < flag.CollisionRadius)
        {
            return 1;
        }
        // End:0x78
        else
        {
            return 2;
        }
    }
}

function string ToString()
{
    return "[Goal_CaptureFlag] Flag=" $ string(flag) $ " iActiveTeam=" $ string(flag.iActiveTeam) $ " iCapturingTeam=" $ string(flag.iCapturingTeam);
}
