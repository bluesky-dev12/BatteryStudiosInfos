/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wThrowingFire.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
class wThrowingFire extends wProjectileFire;

var() name RemovePinAnim;
var() float RemovePinAnimRate;
var bool bCancelFire;
var bool bApplyThrowingDelay;

event ModeDoFire()
{
    // End:0x0d
    if(!AllowFire())
    {
        return;
    }
    // End:0x2e
    if(MaxHoldTime > 0.0)
    {
        HoldTime = FMin(HoldTime, MaxHoldTime);
    }
    // End:0xc6
    if(Weapon.Role == 4)
    {
        HoldTime = 0.0;
        // End:0x75
        if(Instigator == none || Instigator.Controller == none)
        {
            return;
        }
        // End:0xb1
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
        MakeFireNoise();
    }
    // End:0x12d
    if(Instigator.IsLocallyControlled())
    {
        Weapon.FireOne(ThisModeNum);
        ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();
        // End:0x12a
        if(wThrowingWeapon(Weapon) != none)
        {
            wThrowingWeapon(Weapon).bActiveFire = true;
        }
    }
    // End:0x133
    else
    {
        ServerPlayFiring();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    PlaySoundTeam();
    // End:0x193
    if(bFireOnRelease)
    {
        // End:0x175
        if(bIsFiring)
        {
            NextFireTime += MaxHoldTime + FireRate;
        }
        // End:0x190
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }
    }
    // End:0x1ba
    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0;
    // End:0x217
    if(Instigator.PendingWeapon != Weapon && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
}

function PlayPreFire()
{
    super(wWeaponFire).PlayPreFire();
    Weapon.PlayOwnedSound(ResParams.default.sound_Ready, 0, TransientSoundVolume,, TransientSoundRadius,, false);
}

simulated function bool AllowFire()
{
    // End:0x16
    if(bCancelFire == false)
    {
        return super(wWeaponFire).AllowFire();
    }
    // End:0x5a
    else
    {
        bCancelFire = false;
        // End:0x5a
        if(Instigator.Controller.IsA('PlayerController'))
        {
            PlayerController(Instigator.Controller).bFire = 0;
        }
    }
    return false;
}

defaultproperties
{
    RemovePinAnim=RemovePin
    RemovePinAnimRate=1.0
    bApplyThrowingDelay=true
    bFireOnRelease=true
    TransientSoundRadius=105.0
    PreFireAnim=RemovePin
    ProjectileClass=class'wGrenade'
    bMakeRadarNoise=true
}