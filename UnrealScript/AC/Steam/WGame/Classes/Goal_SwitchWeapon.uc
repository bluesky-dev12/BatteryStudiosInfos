/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_SwitchWeapon.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class Goal_SwitchWeapon extends Goal;

var byte Group;

function Goal_SwitchWeapon Init(wAIBotBase inOwner, byte InGroup)
{
    InitBase(inOwner);
    Group = InGroup;
    return self;
}

function Start()
{
    // End:0x35
    if(GoalStatus == 0)
    {
        Owner.Pawn.SwitchWeapon(Group);
        GoalStatus = 1;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x23
    if(Owner.Pawn.PendingWeapon == none)
    {
        return 3;
    }
    // End:0x26
    else
    {
        return 1;
    }
}

function bool SetFocusValue()
{
    return SetFocusValueToTarget();
}

function string ToString()
{
    local string pendingWeaponID;

    // End:0x4e
    if(Owner.Pawn.PendingWeapon != none)
    {
        pendingWeaponID = string(Owner.Pawn.PendingWeapon.BaseParams.iWeaponID);
    }
    return "[Goal_SwitchWeapon] Group=" $ string(Group) $ " Weapon=" $ string(Owner.Pawn.Weapon.BaseParams.iWeaponID) $ " PendingWeapon=" $ pendingWeaponID;
}
