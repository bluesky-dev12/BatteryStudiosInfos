class Goal_Test extends Goal;

function Goal_Test Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    return self;
    //return;    
}

function Start()
{
    // End:0x1E
    if(int(GoalStatus) == int(0))
    {
        AddGoal();
        GoalStatus = 1;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    // End:0x27
    if(int(gs) != int(1))
    {
        AddGoal();
    }
    return 1;
    //return;    
}

function End()
{
    super.End();
    //return;    
}

function NavigationPoint GetReachableRandomTarget()
{
    local NavigationPoint t;

    J0x00:
    // End:0x38 [Loop If]
    if((t == none) || !Owner.actorReachable(t))
    {
        t = Owner.FindRandomDest();
        // [Loop Continue]
        goto J0x00;
    }
    return t;
    //return;    
}

function AddGoal()
{
    local int lp1;

    AddSubgoal(Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 5.0000000));
    lp1 = 0;
    J0x4C:

    // End:0xE6 [Loop If]
    if(lp1 < 200)
    {
        AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchWeapon')).Init(Owner, 1));
        AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchWeapon')).Init(Owner, 2));
        lp1++;
        // [Loop Continue]
        goto J0x4C;
    }
    //return;    
}

function string ToString()
{
    return "[Goal_Test]";
    //return;    
}
