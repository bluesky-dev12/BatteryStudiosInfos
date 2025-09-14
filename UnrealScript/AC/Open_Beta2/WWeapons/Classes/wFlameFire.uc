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
    Instigator.FmodPlaySoundUseID(FmodFireSound_Stereo, 0, FireAnimRate,, false,, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0xE3
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        Instigator.FmodPlaySound(FmodFireSound, 0, FireAnimRate,, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    FireCount++;
    //return;    
}

function ServerPlayFiring()
{
    Instigator.FmodSpecPlaySound(FmodFireSound_Stereo, 0, FireAnimRate,, false);
    Instigator.FmodPlaySound(FmodFireSound, 0, FireAnimRate,, true,,, true);
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
    // End:0x5B
    if(int(Weapon.Instigator.Role) == int(ROLE_Authority))
    {
        Weapon.Instigator.FmodPlaySound(ResParams.default.fsound_Ready, 0, 1.0000000,, true, false, -1, false);        
    }
    else
    {
        Weapon.Instigator.ServerFmodPlaySound(ResParams.default.fsound_Ready, 0, 1.0000000,, true, false, -1, false);
    }
    //return;    
}

function StopFiring()
{
    // End:0x5B
    if(int(Weapon.Instigator.Role) == int(ROLE_Authority))
    {
        Weapon.Instigator.FmodPlaySound(ResParams.default.fsound_Fire_Stop, 0, 1.0000000,, true, false, -1, false);        
    }
    else
    {
        Weapon.Instigator.ServerFmodPlaySound(ResParams.default.fsound_Fire_Stop, 0, 1.0000000,, true, false, -1, false);
    }
    //return;    
}

defaultproperties
{
    ProjSpawnOffset=(X=70.0000000,Y=0.0000000,Z=-10.0000000)
    TransientSoundRadius=150.0000000
    ProjectileClass=Class'WWeapons_Decompressed.wFlameProj'
}