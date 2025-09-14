class Goal_SwitchAndFire extends Goal;

var int Group;
var Actor Target;

function Goal_SwitchAndFire Init(wAIBotBase inOwner, int InGroup, Actor inTarget)
{
    InitBase(inOwner);
    Group = InGroup;
    Target = inTarget;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_SwitchAndFire::ClearRefenreces]");
    Target = none;
    //return;    
}

function Start()
{
    // End:0x141
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
        AddSubgoal(Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Fire')).Init(Owner, Target, false, 1));
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
    return "[Goal_SwitchAndFire] Group=" $ string(Group);
    //return;    
}
