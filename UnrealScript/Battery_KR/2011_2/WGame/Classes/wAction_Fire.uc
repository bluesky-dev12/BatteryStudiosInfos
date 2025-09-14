class wAction_Fire extends wAction;

function wAction_Fire Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return (((((ws.FreeHands && ws.Ammo > 0) && ws.Target != none) && ws.TargetVisible) && ws.CurrentWeapon != none) && (ws.CurrentWeapon.iInventoryGroup == 1) || ws.CurrentWeapon.iInventoryGroup == 2) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return 1.0000000;
    //return;    
}

function float CalcDamage(wState ws)
{
    local float fRange, fRangeLerp;
    local int iPartsDamage, iPartsDamage_Outer;
    local float fDamageAmp, DamageCurr;

    fDamageAmp = 1.0000000;
    fRange = VSize(ws.Target.Pawn.Location - ws.Location);
    // End:0x72
    if(fRange >= ws.CurrentWeapon.fDamRange_Max)
    {
        fRangeLerp = 1.0000000;        
    }
    else
    {
        // End:0xA1
        if(fRange <= ws.CurrentWeapon.fDamRange_Eff)
        {
            fRangeLerp = 0.0000000;            
        }
        else
        {
            fRangeLerp = (fRange - ws.CurrentWeapon.fDamRange_Eff) / (ws.CurrentWeapon.fDamRange_Max - ws.CurrentWeapon.fDamRange_Eff);
        }
    }
    DamageCurr = (float(ws.CurrentWeapon.iDamage + iPartsDamage) * (float(1) - fRangeLerp)) + (float(ws.CurrentWeapon.iDam_OOR + iPartsDamage_Outer) * fRangeLerp);
    DamageCurr = DamageCurr * fDamageAmp;
    return DamageCurr;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    local int M;

    ws.FreeHands = false;
    M = GetWeaponMultiplier(ws);
    ws.Ammo -= (1 * M);
    ws.PropsectDealtDamage += int(((CalcDamage(ws)) * float(M)) / (ws.Time + 1.0000000));
    //return;    
}

function Sim_PostEffect(wState ws)
{
    ws.FreeHands = true;
    //return;    
}

function int GetWeaponMultiplier(wState ws)
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