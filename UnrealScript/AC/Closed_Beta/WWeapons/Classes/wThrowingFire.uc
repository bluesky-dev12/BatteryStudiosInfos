class wThrowingFire extends wProjectileFire;

var() name RemovePinAnim;
var() float RemovePinAnimRate;
var bool bCancelFire;
var bool bApplyThrowingDelay;

event ModeDoFire()
{
    // End:0x0D
    if(!AllowFire())
    {
        return;
    }
    // End:0x2E
    if(MaxHoldTime > 0.0000000)
    {
        HoldTime = FMin(HoldTime, MaxHoldTime);
    }
    // End:0xC6
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        HoldTime = 0.0000000;
        // End:0x75
        if((Instigator == none) || Instigator.Controller == none)
        {
            return;
        }
        // End:0xB1
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
        MakeFireNoise();
    }
    // End:0x12D
    if(Instigator.IsLocallyControlled())
    {
        Weapon.FireOne(ThisModeNum);
        ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();
        // End:0x12A
        if(wThrowingWeapon(Weapon) != none)
        {
            wThrowingWeapon(Weapon).bActiveFire = true;
        }        
    }
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
            NextFireTime += (MaxHoldTime + FireRate);            
        }
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }        
    }
    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0000000;
    // End:0x217
    if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
    //return;    
}

function PlayPreFire()
{
    super(wWeaponFire).PlayPreFire();
    Weapon.PlayOwnedSound(ResParams.default.sound_Ready, 0, TransientSoundVolume,, TransientSoundRadius,, false);
    //return;    
}

simulated function bool AllowFire()
{
    // End:0x16
    if(bCancelFire == false)
    {
        return super(wWeaponFire).AllowFire();        
    }
    else
    {
        bCancelFire = false;
        // End:0x5A
        if(Instigator.Controller.IsA('PlayerController'))
        {
            PlayerController(Instigator.Controller).bFire = 0;
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    RemovePinAnim="RemovePin"
    RemovePinAnimRate=1.0000000
    bApplyThrowingDelay=true
    bFireOnRelease=true
    PreFireAnim="RemovePin"
    ProjectileClass=Class'WWeapons_Decompressed.wGrenade'
    bMakeRadarNoise=false
}