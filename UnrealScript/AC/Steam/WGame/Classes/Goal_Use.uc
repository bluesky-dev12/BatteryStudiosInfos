/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Use.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:5
 *
 *******************************************************************************/
class Goal_Use extends Goal;

var float FireCheckInterval;
var float elapsed;
var float LastAmmo;
var float LastAmmoMax;
var float Ammo;
var float StartAmmo;
var float StartAmmoMax;
var float CurrentAmmo;
var float CurrentAmmoMax;
var float FailTime;
var string StartWeaponName;

function Goal_Use Init(wAIBotBase inOwner)
{
    InitBase(inOwner);
    elapsed = default.elapsed;
    LastAmmo = default.LastAmmo;
    LastAmmoMax = default.LastAmmoMax;
    Ammo = default.Ammo;
    StartAmmo = default.StartAmmo;
    StartAmmoMax = default.StartAmmoMax;
    StartWeaponName = "";
    return self;
}

function Start()
{
    // End:0xc6
    if(GoalStatus == 0)
    {
        // End:0x4e
        if(Owner.Pawn == none || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;
        }
        // End:0xc6
        else
        {
            StartWeaponName = Owner.Pawn.Weapon.BaseParams.strName;
            Owner.Pawn.Weapon.GetAmmoCount(StartAmmoMax, StartAmmo);
            CurrentAmmoMax = StartAmmoMax;
            CurrentAmmo = StartAmmo;
            GoalStatus = 1;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    elapsed += dt;
    FailTime -= dt;
    // End:0x4e
    if(StartWeaponName != Owner.Pawn.Weapon.BaseParams.strName)
    {
        return 3;
    }
    // End:0x136
    if(elapsed >= FireCheckInterval)
    {
        elapsed = 0.0;
        // End:0xe9
        if(!Owner.Pawn.Weapon.FireMode[0].bIsFiring)
        {
            Owner.Pawn.Weapon.GetAmmoCount(LastAmmoMax, LastAmmo);
            Owner.Pawn.Weapon.StartFire(0);
        }
        // End:0x10b
        else
        {
            Owner.Pawn.Weapon.StopFire(0);
        }
        Owner.Pawn.Weapon.GetAmmoCount(CurrentAmmoMax, CurrentAmmo);
    }
    // End:0x15e
    if(StartAmmoMax + StartAmmo - CurrentAmmoMax - CurrentAmmo >= float(1))
    {
        return 3;
    }
    // End:0x174
    else
    {
        // End:0x171
        if(FailTime < float(0))
        {
            return 2;
        }
        // End:0x174
        else
        {
            return 1;
        }
    }
}

function End()
{
    // End:0x55
    if(Owner.Pawn != none && Owner.Pawn.Weapon != none)
    {
        Owner.Pawn.Weapon.StopFire(0);
    }
}

function string ToString()
{
    return "[Goal_Use]";
}

defaultproperties
{
    FireCheckInterval=0.250
    LastAmmo=-1.0
    FailTime=5.0
}