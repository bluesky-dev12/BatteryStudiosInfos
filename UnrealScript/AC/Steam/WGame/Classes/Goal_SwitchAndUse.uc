/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_SwitchAndUse.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class Goal_SwitchAndUse extends Goal;

var int Group;

function Goal_SwitchAndUse Init(wAIBotBase inOwner, int InGroup)
{
    InitBase(inOwner);
    Group = InGroup;
    return self;
}

function Start()
{
    // End:0x13f
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
        AddSubgoal(Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 3.0));
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
    return "[Goal_SwitchAndUse] Group=" $ string(Group);
}
