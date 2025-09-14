/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_SwitchAndFire.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class Goal_SwitchAndFire extends Goal;

var int Group;
var Actor Target;

function Goal_SwitchAndFire Init(wAIBotBase inOwner, int InGroup, Actor inTarget)
{
    InitBase(inOwner);
    Group = InGroup;
    Target = inTarget;
    return self;
}

function ClearReferences()
{
    Log("[Goal_SwitchAndFire::ClearRefenreces]");
    Target = none;
}

function Start()
{
    // End:0x141
    if(GoalStatus == 0)
    {
        // End:0xab
        if(Owner.Pawn.PendingWeapon != none && Owner.Pawn.PendingWeapon.InventoryGroup == Group || Owner.Pawn.PendingWeapon == none && Owner.Pawn.Weapon.InventoryGroup == Group)
        {
        }
        // End:0xf2
        else
        {
            AddSubgoal(Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchWeapon')).Init(Owner, byte(Group)));
        }
        AddSubgoal(Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Fire')).Init(Owner, Target, false, 1));
        GoalStatus = 1;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = ProcessSubGoals(dt);
    return gs;
}

function End();
function string ToString()
{
    return "[Goal_SwitchAndFire] Group=" $ string(Group);
}
