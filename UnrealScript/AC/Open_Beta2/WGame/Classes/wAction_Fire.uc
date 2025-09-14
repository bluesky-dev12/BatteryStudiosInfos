class wAction_Fire extends wAction;

function wAction_Fire Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    // End:0x17
    if(false == ws.FreeHands)
    {
        return false;
    }
    // End:0x2D
    if(0 >= ws.Ammo)
    {
        return false;
    }
    // End:0x43
    if(none == ws.Target)
    {
        return false;
    }
    // End:0x5A
    if(false == ws.TargetVisible)
    {
        return false;
    }
    // End:0x70
    if(none == ws.CurrentWeapon)
    {
        return false;
    }
    // End:0xCF
    if(((ws.CurrentWeapon.iInventoryGroup != 1) && ws.CurrentWeapon.iInventoryGroup != 2) && ws.CurrentWeapon.iInventoryGroup != 5)
    {
        return false;
    }
    // End:0xF8
    if(ws.bUseAiming)
    {
        // End:0xF8
        if(false == ws.bAimingTarget)
        {
            return false;
        }
    }
    return true;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 1.0000000;
    //return;    
}

function float CalcDamage(wStateData ws)
{
    local float frange, fRangeLerp;
    local int iPartsDamage, iPartsDamage_Outer;
    local float fDamageAmp, DamageCurr;

    fDamageAmp = 1.0000000;
    // End:0x25
    if(ws.Target == none)
    {
        return 0.0000000;
    }
    frange = VSize(ws.Target.Pawn.Location - ws.Location);
    // End:0x8C
    if(frange >= ws.CurrentWeapon.fDamRange_Max)
    {
        fRangeLerp = 1.0000000;        
    }
    else
    {
        // End:0xBB
        if(frange <= ws.CurrentWeapon.fDamRange_Eff)
        {
            fRangeLerp = 0.0000000;            
        }
        else
        {
            fRangeLerp = (frange - ws.CurrentWeapon.fDamRange_Eff) / (ws.CurrentWeapon.fDamRange_Max - ws.CurrentWeapon.fDamRange_Eff);
        }
    }
    DamageCurr = (float(ws.CurrentWeapon.iDamage + iPartsDamage) * (float(1) - fRangeLerp)) + (float(ws.CurrentWeapon.iDam_OOR + iPartsDamage_Outer) * fRangeLerp);
    DamageCurr = DamageCurr * fDamageAmp;
    return DamageCurr;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    local int M;

    ws.FreeHands = false;
    M = GetWeaponMultiplier(ws);
    ws.Ammo -= (1 * M);
    ws.PropsectDealtDamage += int(((CalcDamage(ws)) * float(M)) / (ws.Time + 1.0000000));
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    ws.FreeHands = true;
    //return;    
}

function int GetWeaponMultiplier(wStateData ws)
{
    local int Result;

    // End:0x3D
    if(ws.CurrentWeapon.iFireMode == 0)
    {
        Result = ws.CurrentWeapon.iNPCFire;        
    }
    else
    {
        // End:0x71
        if(ws.CurrentWeapon.iFireMode == 1)
        {
            Result = ws.Ammo;            
        }
        else
        {
            Result = ws.Ammo;
        }
    }
    return Result;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    local float Max, cur;
    local int Fire;

    Owner.Pawn.Weapon.GetAmmoCount(Max, cur);
    Fire = Min(int(cur), Owner.Pawn.Weapon.BaseParams.iNPCFire);
    return Goal_Fire(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Fire')).Init(Owner, Owner.Target, true, Fire);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="F"
}