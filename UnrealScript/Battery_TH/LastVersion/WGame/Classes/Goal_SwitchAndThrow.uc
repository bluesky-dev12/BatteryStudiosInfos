class Goal_SwitchAndThrow extends Goal;

var Actor Target;
var int Group;

function Goal_SwitchAndThrow Init(wAIBotBase inOwner, Actor inTarget, int InGroup)
{
    InitBase(inOwner);
    Target = inTarget;
    Group = InGroup;
    // End:0x3C
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_SwitchAndThrow::ClearRefenreces]");
    Target = none;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
    //return;    
}

function Start()
{
    // End:0x155
    if(int(GoalStatus) == int(0))
    {
        // End:0x26
        if(Target == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            // End:0xC1
            if(((Owner.Pawn.PendingWeapon != none) && int(Owner.Pawn.PendingWeapon.InventoryGroup) == Group) || (Owner.Pawn.PendingWeapon == none) && int(Owner.Pawn.Weapon.InventoryGroup) == Group)
            {                
            }
            else
            {
                AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchWeapon')).Init(Owner, byte(Group)));
            }
            AddSubgoal(Goal_Throw(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Throw')).Init(Owner, Target));
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x11
    if(Target == none)
    {
        return 2;        
    }
    else
    {
        return ProcessSubGoals(dt);
    }
    //return;    
}

function End()
{
    //return;    
}

function string ToString()
{
    return (((("[Goal_SwitchAndThrow] Group=" $ string(Group)) $ " Target=") $ string(Target)) $ " Loc=") $ string(Target.Location);
    //return;    
}
