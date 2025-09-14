class Goal_SwitchWeapon extends Goal;

var byte Group;

function Goal_SwitchWeapon Init(wAIBotBase inOwner, byte InGroup)
{
    InitBase(inOwner);
    Group = InGroup;
    return self;
    //return;    
}

function Start()
{
    // End:0x35
    if(int(GoalStatus) == int(0))
    {
        Owner.Pawn.SwitchWeapon(Group);
        GoalStatus = 1;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x23
    if(Owner.Pawn.PendingWeapon == none)
    {
        return 3;        
    }
    else
    {
        return 1;
    }
    //return;    
}

function bool SetFocusValue()
{
    return SetFocusValueToTarget();
    //return;    
}

function string ToString()
{
    local string pendingWeaponID;

    // End:0x4E
    if(Owner.Pawn.PendingWeapon != none)
    {
        pendingWeaponID = string(Owner.Pawn.PendingWeapon.BaseParams.iWeaponID);
    }
    return (((("[Goal_SwitchWeapon] Group=" $ string(Group)) $ " Weapon=") $ string(Owner.Pawn.Weapon.BaseParams.iWeaponID)) $ " PendingWeapon=") $ pendingWeaponID;
    //return;    
}
