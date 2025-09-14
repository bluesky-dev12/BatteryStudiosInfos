/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Test.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:7
 *
 *******************************************************************************/
class Goal_Test extends Goal;

function Goal_Test Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
}

function Start()
{
    // End:0x1e
    if(GoalStatus == 0)
    {
        AddGoal();
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
        AddGoal();
    }
    return 1;
}

function End()
{
    super.End();
}

function NavigationPoint GetReachableRandomTarget()
{
    local NavigationPoint t;

    // End:0x38 [While If]
    if(t == none || !Owner.actorReachable(t))
    {
        J0x00:
        t = Owner.FindRandomDest();
        // This is an implied JumpToken; Continue!
        goto J0x00;
    }
    return t;
}

function AddGoal()
{
    local int lp1;

    AddSubgoal(Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 5.0));
    lp1 = 0;
    J0x4c:
    // End:0xe6 [While If]
    if(lp1 < 200)
    {
        AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchWeapon')).Init(Owner, 1));
        AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchWeapon')).Init(Owner, 2));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
}

function string ToString()
{
    return "[Goal_Test]";
}
