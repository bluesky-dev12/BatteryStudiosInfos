class wFlameFire extends wProjectileFire;

simulated function wLoadOut()
{
    super(wWeaponFire).wLoadOut();
    PreFireTime = 0.0100000;
    //return;    
}

simulated function InitEffects()
{
    // End:0x36
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
    {
        return;
    }
    super(wWeaponFire).InitEffects();
    // End:0x60
    if(FlashEmitter != none)
    {
        Weapon.AttachToBone(FlashEmitter, 'tip');
    }
    //return;    
}

function PlayPreFire()
{
    super(wWeaponFire).PlayPreFire();
    //return;    
}

function PlayFiring()
{
    local name szAnim;
    local float fFrame, fRate;

    // End:0x5D
    if(Weapon.Mesh != none)
    {
        Weapon.GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x5D
        if(szAnim != 'Fire')
        {
            Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        }
    }
    Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0x106
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    FireCount++;
    //return;    
}

function ServerPlayFiring()
{
    Instigator.SpecPlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false);
    Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire,, true,,, true);
    //return;    
}

function PlayFireEnd()
{
    // End:0x23
    if(Weapon.Mesh != none)
    {
        Weapon.PlayIdle();
    }
    //return;    
}

simulated event Destroyed()
{
    //return;    
}

function StartFiring()
{
    // End:0x6B
    if(int(Weapon.Instigator.Role) == int(ROLE_Authority))
    {
        Weapon.Instigator.PlaySound(ResParams.default.sound_Ready, 0, TransientSoundVolume,, ResParams.default.rad_Fire, 1.0000000, true, false, -1, false);        
    }
    else
    {
        Weapon.Instigator.ServerPlaySound(ResParams.default.sound_Ready, 0, TransientSoundVolume,, ResParams.default.rad_Fire, 1.0000000, true, false, -1, false);
    }
    //return;    
}

function StopFiring()
{
    // End:0x6B
    if(int(Weapon.Instigator.Role) == int(ROLE_Authority))
    {
        Weapon.Instigator.PlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0000000, true, false, -1, false);        
    }
    else
    {
        Weapon.Instigator.ServerPlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0000000, true, false, -1, false);
    }
    //return;    
}

defaultproperties
{
    ProjSpawnOffset=(X=70.0000000,Y=0.0000000,Z=-10.0000000)
    ProjectileClass=Class'WWeapons_Decompressed.wFlameProj'
}