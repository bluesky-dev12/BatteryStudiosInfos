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
    //return;    
}

function ClearReferences()
{
    Log("[wAction_SwitchWeapon::ClearReferences]");
    Weapon = none;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super(Object).NotifyDestroyed(A);
    // End:0x21
    if(Weapon == A)
    {
        Weapon = none;
    }
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return (ws.FreeHands && ws.CurrentWeapon != Weapon.BaseParams) && ws.SwitchWeaponCount == 0;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return 1.0000000;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    ws.FreeHands = false;
    //return;    
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
    ws.SwitchWeaponCount++;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    // End:0x49
    if(Weapon == none)
    {
        return Goal_Fail(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Fail')).Init(Owner);        
    }
    else
    {
        return Goal_SwitchWeapon(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchWeapon')).Init(Owner, Weapon.InventoryGroup);
    }
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="SW"
}