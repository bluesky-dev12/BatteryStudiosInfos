class Goal_Fire extends Goal;

var Actor Target;
var float FireCheckInterval;
var float elapsed;
var bool StartStopSwitch;
var float LastAmmo;
var float LastAmmoMax;
var float Ammo;
var float StartAmmo;
var float StartAmmoMax;
var float CurrentAmmo;
var float CurrentAmmoMax;
var int FireCount;
var bool DoAim;
var bool AimAvailable;
var bool WeaponFireModeSingle;
var float FailTime;
var string StartWeaponName;
var bool StartedWithTarget;

function Goal_Fire Init(wAIBotBase inOwner, Actor inTarget, bool inDoAim, int inFireCount)
{
    InitBase(inOwner);
    Target = inTarget;
    FireCheckInterval = default.FireCheckInterval;
    elapsed = default.elapsed;
    StartStopSwitch = default.StartStopSwitch;
    LastAmmo = default.LastAmmo;
    LastAmmoMax = default.LastAmmoMax;
    Ammo = default.Ammo;
    StartAmmo = default.StartAmmo;
    StartAmmoMax = default.StartAmmoMax;
    DoAim = inDoAim;
    AimAvailable = default.AimAvailable;
    WeaponFireModeSingle = default.WeaponFireModeSingle;
    FailTime = default.FailTime;
    StartWeaponName = "";
    FireCount = inFireCount;
    // End:0xD0
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    StartedWithTarget = Target != none;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_Fire::ClearRefenreces]");
    Target = none;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
    // End:0x49
    if(Owner.Focus == A)
    {
        Owner.Focus = none;
    }
    //return;    
}

function bool SetFocusValue()
{
    // End:0x6D
    if(StartedWithTarget)
    {
        Owner.Focus = Target;
        Owner.FocalPoint.X = 0.0000000;
        Owner.FocalPoint.Y = 0.0000000;
        Owner.FocalPoint.Z = 0.0000000;
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function Start()
{
    // End:0x190
    if(int(GoalStatus) == int(0))
    {
        // End:0x66
        if((((Target == none) && StartedWithTarget) || Owner.Pawn == none) || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            StartWeaponName = Owner.Pawn.Weapon.BaseParams.strName;
            Owner.Pawn.Weapon.GetAmmoCount(StartAmmoMax, StartAmmo);
            CurrentAmmoMax = StartAmmoMax;
            CurrentAmmo = StartAmmo;
            GoalStatus = 1;
            // End:0x13C
            if(Owner.Pawn.Weapon.BaseParams.iFireMode == 0)
            {
                FireCheckInterval = Owner.Pawn.Weapon.BaseParams.fNPCRateOfFire;
            }
            // End:0x154
            if(!StartedWithTarget)
            {
                StartedWithTarget = StartedWithTarget;
            }
            DoAim = DoAim && Owner.Pawn.Weapon.BaseParams.bAimAvailable;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local bool CurrentAim, Visible;
    local MemoryItem MI;

    // End:0x1C
    if((Target == none) && StartedWithTarget)
    {
        return 2;        
    }
    else
    {
        elapsed += dt;
        FailTime -= dt;
        // End:0x6A
        if(StartWeaponName != Owner.Pawn.Weapon.BaseParams.strName)
        {
            return 3;
        }
        // End:0x4D2
        if(elapsed >= FireCheckInterval)
        {
            elapsed = 0.0000000;
            StartStopSwitch = !StartStopSwitch;
            AimAvailable = Owner.Pawn.Weapon.BaseParams.bAimAvailable;
            CurrentAim = AimAvailable && int(wGun(Owner.Pawn.Weapon).AimState) == int(2);
            WeaponFireModeSingle = Owner.Pawn.Weapon.BaseParams.iFireMode == 0;
            // End:0x4A7
            if((Owner.Focus == none) || Abs(Owner.Pawn.GetDotH(Owner.Focus.Location)) > 0.9000000)
            {
                Visible = false;
                // End:0x1CE
                if(Pawn(Target) == none)
                {
                    // End:0x1C3
                    if(StartedWithTarget)
                    {
                        Visible = Owner.LineOfSightTo(Target);                        
                    }
                    else
                    {
                        Visible = true;
                    }                    
                }
                else
                {
                    MI = Owner.Memory.GetByPawn(Pawn(Target));
                    // End:0x21C
                    if(MI == none)
                    {
                        Visible = Owner.LineOfSightTo(Target);                        
                    }
                    else
                    {
                        Visible = MI.IsVisible;
                    }
                }
                // End:0x262
                if(!Visible)
                {
                    Owner.Pawn.Weapon.ClientStopFire(0);                    
                }
                else
                {
                    // End:0x38F
                    if(DoAim != CurrentAim)
                    {
                        // End:0x32D
                        if(DoAim)
                        {
                            // End:0x2FA
                            if((int(wGun(Owner.Pawn.Weapon).AimState) == int(0)) && !Owner.Pawn.bIsAiming)
                            {
                                Owner.Pawn.Weapon.FireMode[1].ModeDoFire();                                
                            }
                            else
                            {
                                // End:0x32A
                                if(int(wGun(Owner.Pawn.Weapon).AimState) == int(1))
                                {
                                }
                            }                            
                        }
                        else
                        {
                            // End:0x360
                            if(int(wGun(Owner.Pawn.Weapon).AimState) == int(3))
                            {                                
                            }
                            else
                            {
                                Owner.Pawn.Weapon.FireMode[1].ModeDoFire();
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x449
                        if(WeaponFireModeSingle)
                        {
                            // End:0x424
                            if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring && Visible)
                            {
                                Owner.Pawn.Weapon.GetAmmoCount(LastAmmoMax, LastAmmo);
                                Owner.Pawn.Weapon.StartFire(0);                                
                            }
                            else
                            {
                                Owner.Pawn.Weapon.StopFire(0);
                            }                            
                        }
                        else
                        {
                            // End:0x4A7
                            if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring && Visible)
                            {
                                Owner.Pawn.Weapon.ClientStartFire(0);
                            }
                        }
                    }
                }
            }
            Owner.Pawn.Weapon.GetAmmoCount(CurrentAmmoMax, CurrentAmmo);
        }
        // End:0x4FE
        if((((StartAmmoMax + StartAmmo) - CurrentAmmoMax) - CurrentAmmo) >= float(FireCount))
        {
            return 3;            
        }
        else
        {
            // End:0x511
            if(FailTime < float(0))
            {
                return 2;                
            }
            else
            {
                return 1;
            }
        }
    }
    //return;    
}

function End()
{
    Owner.Focus = none;
    // End:0x65
    if((Owner.Pawn != none) && Owner.Pawn.Weapon != none)
    {
        Owner.Pawn.Weapon.StopFire(0);
    }
    //return;    
}

function string ToString()
{
    // End:0x25
    if(Owner.Focus == none)
    {
        return "[Goal_Fire]";        
    }
    else
    {
        return (("[Goal_Fire] Focus=" $ string(Owner.Focus)) $ " dotH=") $ string(Owner.Pawn.GetDotH(Owner.Focus.Location));
    }
    //return;    
}

defaultproperties
{
    FireCheckInterval=0.0100000
    LastAmmo=-1.0000000
    FailTime=4.5000000
}