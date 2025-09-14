/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_FireSpecialTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class wAction_FireSpecialTarget extends wAction_Fire;

var Actor Target;
var float DmgFactor;

function wAction_FireSpecialTarget Init2(Actor inTarget, float inDmgFactor)
{
    Init();
    Target = inTarget;
    Target.RegisterDestroyListener(self);
    DmgFactor = inDmgFactor;
    return self;
}

function NotifyDestroyed(Actor A)
{
    super(Object).NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.Ammo > 0 && ws.CurrentWeapon != none && ws.CurrentWeapon.iInventoryGroup == 1 || ws.CurrentWeapon.iInventoryGroup == 2 && !ws.IsFlashed;
}

function float Sim_GetTime(wState ws)
{
    return 3.0;
}

function float CalcDamage(wState ws)
{
    return super.CalcDamage(ws) * DmgFactor;
}

function Goal GetGoal(wAIBotBase Owner)
{
    local float Max, cur;
    local int Fire;

    Owner.Pawn.Weapon.GetAmmoCount(Max, cur);
    Fire = int(Max);
    return Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Fire')).Init(Owner, Target, true, Fire);
}

defaultproperties
{
    DmgFactor=1.0
    Layer=2
    ActionName="F_SP"
}