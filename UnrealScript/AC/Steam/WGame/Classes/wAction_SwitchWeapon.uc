/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_SwitchWeapon.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class wAction_SwitchWeapon extends wAction;

var wWeapon Weapon;

function wAction_SwitchWeapon Init(wWeapon inWeapon)
{
    Weapon = inWeapon;
    // End:0x26
    if(Weapon != none)
    {
        Weapon.RegisterDestroyListener(self);
    }
    return self;
}

function ClearReferences()
{
    Log("[wAction_SwitchWeapon::ClearReferences]");
    Weapon = none;
}

function NotifyDestroyed(Actor A)
{
    super(Object).NotifyDestroyed(A);
    // End:0x21
    if(Weapon == A)
    {
        Weapon = none;
    }
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.CurrentWeapon != Weapon.BaseParams && ws.SwitchWeaponCount == 0;
}

function float Sim_GetTime(wState ws)
{
    return 1.0;
}

function Sim_PreEffect(wState ws)
{
    ws.FreeHands = false;
}

function Sim_PostEffect(wState ws)
{
    local float Max, cur;

    ws.FreeHands = true;
    ws.CurrentWeapon = Weapon.BaseParams;
    Weapon.GetAmmoCount(Max, cur);
    ws.Ammo = int(cur);
    ws.Magazine = int(Max);
    ws.MaxAmmo = Weapon.BaseParams.iAmmo_Magazine;
    ++ ws.SwitchWeaponCount;
}

function Goal GetGoal(wAIBotBase Owner)
{
    // End:0x49
    if(Weapon == none)
    {
        return Goal_Fail(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Fail')).Init(Owner);
    }
    // End:0x92
    else
    {
        return Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchWeapon')).Init(Owner, Weapon.InventoryGroup);
    }
}

defaultproperties
{
    Layer=1
    ActionName="SW"
}