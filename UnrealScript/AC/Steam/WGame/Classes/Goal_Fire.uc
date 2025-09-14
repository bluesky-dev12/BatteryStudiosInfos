/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Fire.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:8
 *
 *******************************************************************************/
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
    // End:0xd0
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    StartedWithTarget = Target != none;
    return self;
}

function ClearReferences()
{
    Log("[Goal_Fire::ClearRefenreces]");
    Target = none;
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
}

function bool SetFocusValue()
{
    // End:0x6d
    if(StartedWithTarget)
    {
        Owner.Focus = Target;
        Owner.FocalPoint.X = 0.0;
        Owner.FocalPoint.Y = 0.0;
        Owner.FocalPoint.Z = 0.0;
        return true;
    }
    // End:0x6f
    else
    {
        return false;
    }
}

function Start()
{
    // End:0x190
    if(GoalStatus == 0)
    {
        // End:0x66
        if(Target == none && StartedWithTarget || Owner.Pawn == none || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;
        }
        // End:0x190
        else
        {
            StartWeaponName = Owner.Pawn.Weapon.BaseParams.strName;
            Owner.Pawn.Weapon.GetAmmoCount(StartAmmoMax, StartAmmo);
            CurrentAmmoMax = StartAmmoMax;
            CurrentAmmo = StartAmmo;
            GoalStatus = 1;
            // End:0x13c
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
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local bool CurrentAim, Visible;
    local MemoryItem MI;

    // End:0x1c
    if(Target == none && StartedWithTarget)
    {
        return 2;
    }
    // End:0x514
    else
    {
        elapsed += dt;
        FailTime -= dt;
        // End:0x6a
        if(StartWeaponName != Owner.Pawn.Weapon.BaseParams.strName)
        {
            return 3;
        }
        // End:0x4d2
        if(elapsed >= FireCheckInterval)
        {
            elapsed = 0.0;
            StartStopSwitch = !StartStopSwitch;
            AimAvailable = Owner.Pawn.Weapon.BaseParams.bAimAvailable;
            CurrentAim = AimAvailable && wGun(Owner.Pawn.Weapon).AimState == 2;
            WeaponFireModeSingle = Owner.Pawn.Weapon.BaseParams.iFireMode == 0;
            // End:0x4a7
            if(Owner.Focus == none || Abs(Owner.Pawn.GetDotH(Owner.Focus.Location)) > 0.90)
            {
                Visible = false;
                // End:0x1ce
                if(Pawn(Target) == none)
                {
                    // End:0x1c3
                    if(StartedWithTarget)
                    {
                        Visible = Owner.LineOfSightTo(Target);
                    }
                    // End:0x1cb
                    else
                    {
                        Visible = true;
                    }
                }
                // End:0x232
                else
                {
                    MI = Owner.Memory.GetByPawn(Pawn(Target));
                    // End:0x21c
                    if(MI == none)
                    {
                        Visible = Owner.LineOfSightTo(Target);
                    }
                    // End:0x232
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
                // End:0x4a7
                else
                {
                    // End:0x38f
                    if(DoAim != CurrentAim)
                    {
                        // End:0x32d
                        if(DoAim)
                        {
                            // End:0x2fa
                            if(wGun(Owner.Pawn.Weapon).AimState == 0 && !Owner.Pawn.bIsAiming)
                            {
                                Owner.Pawn.Weapon.FireMode[1].ModeDoFire();
                            }
                            // End:0x32a
                            else
                            {
                                // End:0x32a
                                if(wGun(Owner.Pawn.Weapon).AimState == 1)
                                {
                                }
                            }
                        }
                        // End:0x38c
                        else
                        {
                            // End:0x360
                            if(wGun(Owner.Pawn.Weapon).AimState == 3)
                            {
                            }
                            // End:0x38c
                            else
                            {
                                Owner.Pawn.Weapon.FireMode[1].ModeDoFire();
                            }
                        }
                    }
                    // End:0x4a7
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
                            // End:0x446
                            else
                            {
                                Owner.Pawn.Weapon.StopFire(0);
                            }
                        }
                        // End:0x4a7
                        else
                        {
                            // End:0x4a7
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
        // End:0x4fe
        if(StartAmmoMax + StartAmmo - CurrentAmmoMax - CurrentAmmo >= float(FireCount))
        {
            return 3;
        }
        // End:0x514
        else
        {
            // End:0x511
            if(FailTime < float(0))
            {
                return 2;
            }
            // End:0x514
            else
            {
                return 1;
            }
        }
    }
}

function End()
{
    Owner.Focus = none;
    // End:0x65
    if(Owner.Pawn != none && Owner.Pawn.Weapon != none)
    {
        Owner.Pawn.Weapon.StopFire(0);
    }
}

function string ToString()
{
    // End:0x25
    if(Owner.Focus == none)
    {
        return "[Goal_Fire]";
    }
    // End:0x89
    else
    {
        return "[Goal_Fire] Focus=" $ string(Owner.Focus) $ " dotH=" $ string(Owner.Pawn.GetDotH(Owner.Focus.Location));
    }
}

defaultproperties
{
    FireCheckInterval=0.010
    LastAmmo=-1.0
    FailTime=4.50
}