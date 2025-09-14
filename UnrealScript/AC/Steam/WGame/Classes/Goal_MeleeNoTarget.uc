/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_MeleeNoTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:5
 *
 *******************************************************************************/
class Goal_MeleeNoTarget extends Goal;

var float FireCheckInterval;
var float elapsed;
var float FailTime;
var int MeleeCount;

function Goal_MeleeNoTarget Init(wAIBotBase inOwner, int inMeleeCount)
{
    InitBase(inOwner);
    FireCheckInterval = default.FireCheckInterval;
    elapsed = default.elapsed;
    FailTime = default.FailTime;
    MeleeCount = inMeleeCount;
    return self;
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
}

function Start()
{
    // End:0x8e
    if(GoalStatus == 0)
    {
        // End:0x38
        if(Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;
        }
        // End:0x8e
        else
        {
            GoalStatus = 1;
            AddSubgoal(Goal_LookAround(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_LookAround')).Init(Owner, float(MeleeCount) * 1.0));
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    ProcessSubGoals(dt);
    elapsed += dt;
    FireCheckInterval -= dt;
    // End:0x9a
    if(FireCheckInterval < float(0))
    {
        FireCheckInterval = default.FireCheckInterval;
        Owner.Pawn.Weapon.FireMode[2].ModeDoFire();
        // End:0x9a
        if(Owner.Pawn.Weapon.MeleeState == 1)
        {
            -- MeleeCount;
        }
    }
    // End:0xab
    if(MeleeCount <= 0)
    {
        return 3;
    }
    // End:0xae
    else
    {
        return 1;
    }
}

function string ToString()
{
    return "[Goal_MeleeNoTarget] MeleeCount=" $ string(MeleeCount);
}

defaultproperties
{
    FireCheckInterval=0.350
}