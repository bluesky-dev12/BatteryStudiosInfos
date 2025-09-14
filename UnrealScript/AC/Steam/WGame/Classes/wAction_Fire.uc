/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_Fire.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:8
 *
 *******************************************************************************/
class wAction_Fire extends wAction;

function wAction_Fire Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.Ammo > 0 && ws.Target != none && ws.TargetVisible && ws.CurrentWeapon != none && ws.CurrentWeapon.iInventoryGroup == 1 || ws.CurrentWeapon.iInventoryGroup == 2 && !ws.IsFlashed;
}

function float Sim_GetTime(wState ws)
{
    return 1.0;
}

function float CalcDamage(wState ws)
{
    local float frange, fRangeLerp;
    local int iPartsDamage, iPartsDamage_Outer;
    local float fDamageAmp, DamageCurr;

    fDamageAmp = 1.0;
    frange = VSize(ws.Target.Pawn.Location - ws.Location);
    // End:0x72
    if(frange >= ws.CurrentWeapon.fDamRange_Max)
    {
        fRangeLerp = 1.0;
    }
    // End:0xf7
    else
    {
        // End:0xa1
        if(frange <= ws.CurrentWeapon.fDamRange_Eff)
        {
            fRangeLerp = 0.0;
        }
        // End:0xf7
        else
        {
            fRangeLerp = frange - ws.CurrentWeapon.fDamRange_Eff / ws.CurrentWeapon.fDamRange_Max - ws.CurrentWeapon.fDamRange_Eff;
        }
    }
    DamageCurr = float(ws.CurrentWeapon.iDamage + iPartsDamage) * float(1) - fRangeLerp + float(ws.CurrentWeapon.iDam_OOR + iPartsDamage_Outer) * fRangeLerp;
    DamageCurr = DamageCurr * fDamageAmp;
    return DamageCurr;
}

function Sim_PreEffect(wState ws)
{
    local int M;

    ws.FreeHands = false;
    M = GetWeaponMultiplier(ws);
    ws.Ammo -= 1 * M;
    ws.PropsectDealtDamage += int(CalcDamage(ws) * float(M) / ws.Time + 1.0);
}

function Sim_PostEffect(wState ws)
{
    ws.FreeHands = true;
}

function int GetWeaponMultiplier(wState ws)
{
    local int Result;

    // End:0x3d
    if(ws.CurrentWeapon.iFireMode == 0)
    {
        Result = ws.CurrentWeapon.iNPCFire;
    }
    // End:0x85
    else
    {
        // End:0x71
        if(ws.CurrentWeapon.iFireMode == 1)
        {
            Result = ws.Ammo;
        }
        // End:0x85
        else
        {
            Result = ws.Ammo;
        }
    }
    return Result;
}

function Goal GetGoal(wAIBotBase Owner)
{
    local float Max, cur;
    local int Fire;

    Owner.Pawn.Weapon.GetAmmoCount(Max, cur);
    Fire = Min(int(cur), Owner.Pawn.Weapon.BaseParams.iNPCFire);
    return Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Fire')).Init(Owner, Owner.Target, true, Fire);
}

defaultproperties
{
    Layer=1
    ActionName="F"
}