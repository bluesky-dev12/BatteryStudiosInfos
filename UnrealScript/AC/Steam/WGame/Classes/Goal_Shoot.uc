/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Shoot.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:5
 *
 *******************************************************************************/
class Goal_Shoot extends Goal;

var Actor Target;
var float FireCheckInterval;
var float elapsed;
var bool StartStopSwitch;
var float LastAmmo;
var float LastAmmoMax;
var float Ammo;
var bool DoAim;
var bool AimAvailable;
var bool WeaponFireModeSingle;

function Goal_Shoot Init(wAIBotBase inOwner, Actor inTarget, bool inDoAim)
{
    InitBase(inOwner);
    Target = inTarget;
    DoAim = inDoAim;
    return self;
}

function ClearReferences()
{
    Log("[Goal_Shoot::ClearRefenreces]");
    Target = none;
}

function Start()
{
    // End:0x6a
    if(GoalStatus == 0)
    {
        // End:0x4e
        if(Owner.Pawn == none || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;
        }
        // End:0x6a
        else
        {
            Owner.Focus = Target;
            GoalStatus = 1;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local bool CurrentAim;

    elapsed += dt;
    // End:0x2fc
    if(elapsed >= FireCheckInterval)
    {
        elapsed = 0.0;
        StartStopSwitch = !StartStopSwitch;
        CurrentAim = wGun(Owner.Pawn.Weapon).AimState == 2;
        AimAvailable = Owner.Pawn.Weapon.BaseParams.bAimAvailable;
        WeaponFireModeSingle = Owner.Pawn.Weapon.BaseParams.iFireMode == 0;
        // End:0x1fa
        if(DoAim != CurrentAim)
        {
            // End:0x198
            if(DoAim)
            {
                // End:0x165
                if(wGun(Owner.Pawn.Weapon).AimState == 0 && !Owner.Pawn.bIsAiming)
                {
                    Owner.Pawn.Weapon.FireMode[1].ModeDoFire();
                }
                // End:0x195
                else
                {
                    // End:0x195
                    if(wGun(Owner.Pawn.Weapon).AimState == 1)
                    {
                    }
                }
            }
            // End:0x1f7
            else
            {
                // End:0x1cb
                if(wGun(Owner.Pawn.Weapon).AimState == 3)
                {
                }
                // End:0x1f7
                else
                {
                    Owner.Pawn.Weapon.FireMode[1].ModeDoFire();
                }
            }
        }
        // End:0x2fc
        else
        {
            // End:0x2a9
            if(WeaponFireModeSingle)
            {
                // End:0x284
                if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring)
                {
                    Owner.Pawn.Weapon.GetAmmoCount(LastAmmoMax, LastAmmo);
                    Owner.Pawn.Weapon.StartFire(0);
                }
                // End:0x2a6
                else
                {
                    Owner.Pawn.Weapon.StopFire(0);
                }
            }
            // End:0x2fc
            else
            {
                // End:0x2fc
                if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring)
                {
                    Owner.Pawn.Weapon.ClientStartFire(0);
                }
            }
        }
    }
    return 1;
}

function string ToString()
{
    return "[Goal_Shoot] Focus=" $ string(Owner.Focus) $ " dotH=" $ string(Owner.Pawn.GetDotH(Owner.Focus.Location));
}

defaultproperties
{
    FireCheckInterval=0.010
    LastAmmo=-1.0
}