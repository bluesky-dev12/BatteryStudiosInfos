/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wFlameFire.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:9
 *
 *******************************************************************************/
class wFlameFire extends wProjectileFire;

simulated function wLoadOut()
{
    super(wWeaponFire).wLoadOut();
    PreFireTime = 0.010;
}

simulated function InitEffects()
{
    // End:0x36
    if(Level.NetMode == 1 || AIController(Instigator.Controller) != none)
    {
        return;
    }
    super(wWeaponFire).InitEffects();
    // End:0x60
    if(FlashEmitter != none)
    {
        Weapon.AttachToBone(FlashEmitter, 'tip');
    }
}

function PlayPreFire()
{
    super(wWeaponFire).PlayPreFire();
}

function PlayFiring()
{
    local name szAnim;
    local float fFrame, fRate;

    // End:0x5d
    if(Weapon.Mesh != none)
    {
        Weapon.GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x5d
        if(szAnim != 'Fire')
        {
            Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        }
    }
    Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0x106
    if(Weapon.Role == 4)
    {
        Instigator.PlaySound(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    ++ FireCount;
}

function ServerPlayFiring()
{
    Instigator.SpecPlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false);
    Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire,, true,,, true);
}

function PlayFireEnd()
{
    // End:0x23
    if(Weapon.Mesh != none)
    {
        Weapon.PlayIdle();
    }
}

simulated event Destroyed();
function StartFiring()
{
    // End:0x6b
    if(Weapon.Instigator.Role == 4)
    {
        Weapon.Instigator.PlaySound(ResParams.default.sound_Ready, 0, TransientSoundVolume,, ResParams.default.rad_Fire, 1.0, true, false, -1, false);
    }
    // End:0xb4
    else
    {
        Weapon.Instigator.ServerPlaySound(ResParams.default.sound_Ready, 0, TransientSoundVolume,, ResParams.default.rad_Fire, 1.0, true, false, -1, false);
    }
}

function StopFiring()
{
    // End:0x6b
    if(Weapon.Instigator.Role == 4)
    {
        Weapon.Instigator.PlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0, true, false, -1, false);
    }
    // End:0xb4
    else
    {
        Weapon.Instigator.ServerPlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0, true, false, -1, false);
    }
}

defaultproperties
{
    ProjSpawnOffset=(X=70.0,Y=0.0,Z=-10.0)
    TransientSoundRadius=150.0
    ProjectileClass=class'wFlameProj'
}