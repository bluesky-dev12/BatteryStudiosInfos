class Goal_SwitchAndUse extends Goal;

var int Group;

function Goal_SwitchAndUse Init(wAIBotBase inOwner, int InGroup)
{
    InitBase(inOwner);
    Group = InGroup;
    return self;
    //return;    
}

function Start()
{
    // End:0x13F
    if(int(GoalStatus) == int(0))
    {
        // End:0xAB
        if(((Owner.Pawn.PendingWeapon != none) && int(Owner.Pawn.PendingWeapon.InventoryGroup) == Group) || (Owner.Pawn.PendingWeapon == none) && int(Owner.Pawn.Weapon.InventoryGroup) == Group)
        {            
        }
        else
        {
            AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchWeapon')).Init(Owner, byte(Group)));
        }
        AddSubgoal(Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 3.0000000));
        GoalStatus = 1;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    return gs;
    //return;    
}

function End()
{
    //return;    
}

function string ToString()
{
    return "[Goal_SwitchAndUse] Group=" $ string(Group);
    //return;    
}
