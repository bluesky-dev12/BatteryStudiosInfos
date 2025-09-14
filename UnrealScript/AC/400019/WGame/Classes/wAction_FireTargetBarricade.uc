class wAction_FireTargetBarricade extends wAction_Fire;

var Actor Target;
var float DmgFactor;

function wAction_FireTargetBarricade Init2(Actor inTarget, float inDmgFactor)
{
    Init();
    Target = inTarget;
    Target.RegisterDestroyListener(self);
    DmgFactor = inDmgFactor;
    return self;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super(Object).NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return (((ws.FreeHands && ws.Ammo > 0) && ws.CurrentWeapon != none) && ((ws.CurrentWeapon.iInventoryGroup == 1) || ws.CurrentWeapon.iInventoryGroup == 2) || ws.CurrentWeapon.iInventoryGroup == 5) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 3.0000000;
    //return;    
}

function float CalcDamage(wStateData ws)
{
    return super.CalcDamage(ws) * DmgFactor;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    local float Max, cur;
    local int Fire;

    Owner.Pawn.Weapon.GetAmmoCount(Max, cur);
    Fire = int(Max);
    return Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Fire')).Init(Owner, Target, true, Fire);
    //return;    
}

defaultproperties
{
    DmgFactor=1.0000000
    ActionName="F_FTB"
}