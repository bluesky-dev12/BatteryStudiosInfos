/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_SwitchAndThrow.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class Goal_SwitchAndThrow extends Goal;

var Actor Target;
var int Group;

function Goal_SwitchAndThrow Init(wAIBotBase inOwner, Actor inTarget, int InGroup)
{
    InitBase(inOwner);
    Target = inTarget;
    Group = InGroup;
    // End:0x3c
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    return self;
}

function ClearReferences()
{
    Log("[Goal_SwitchAndThrow::ClearRefenreces]");
    Target = none;
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
}

function Start()
{
    // End:0x155
    if(GoalStatus == 0)
    {
        // End:0x26
        if(Target == none)
        {
            GoalStatus = 2;
        }
        // End:0x155
        else
        {
            // End:0xc1
            if(Owner.Pawn.PendingWeapon != none && Owner.Pawn.PendingWeapon.InventoryGroup == Group || Owner.Pawn.PendingWeapon == none && Owner.Pawn.Weapon.InventoryGroup == Group)
            {
            }
            // End:0x108
            else
            {
                AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchWeapon')).Init(Owner, byte(Group)));
            }
            AddSubgoal(Goal_Throw(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Throw')).Init(Owner, Target));
            GoalStatus = 1;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x11
    if(Target == none)
    {
        return 2;
    }
    // End:0x1d
    else
    {
        return ProcessSubGoals(dt);
    }
}

function End();
function string ToString()
{
    return "[Goal_SwitchAndThrow] Group=" $ string(Group) $ " Target=" $ string(Target) $ " Loc=" $ string(Target.Location);
}
