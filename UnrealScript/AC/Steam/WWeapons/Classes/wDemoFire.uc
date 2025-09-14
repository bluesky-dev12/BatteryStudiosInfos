/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wDemoFire.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:7
 *
 *******************************************************************************/
class wDemoFire extends wWeaponFire;

var name PlantAni;
var name DefuseAni;
var byte byFirstTick;
var float fFirstTime;
var Sound DefuseSound;
var Sound DefuseSound_Stereo;

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = 0;
    byFirstTick = 0;
    FireSound = ResParams.default.sound_Fire;
    FireSound_Stereo = ResParams.default.sound_Fire_Silencer_Stereo;
    DefuseSound = ResParams.default.sound_Fire_Silencer;
    DefuseSound_Stereo = ResParams.default.sound_Fire_Silencer_Stereo;
}

simulated function bool AllowFire()
{
    // End:0x0d
    if(!super.AllowFire())
    {
        return false;
    }
    // End:0x40
    if(Instigator.IsLocallyControlled())
    {
        // End:0x40
        if(0 == Instigator.Controller.bUseKey)
        {
            return false;
        }
    }
    // End:0x5b
    if(Weapon.ClientState == 3)
    {
        return false;
    }
    return true;
}

event ModeDoFire()
{
    super.ModeDoFire();
}

function ShakeView()
{
    return;
}

event ModeTick(float dt)
{
    // End:0x18
    if(0 != Weapon.byActionThrowsWeapon)
    {
        return;
    }
    // End:0x27
    if(byFirstTick > 1)
    {
        return;
    }
    // End:0x53
    if(byFirstTick == 0)
    {
        fFirstTime = Level.TimeSeconds;
        byFirstTick = 1;
    }
    // End:0x80
    else
    {
        // End:0x80
        if(Level.TimeSeconds - fFirstTime > 0.10)
        {
            ModeDoFire();
            byFirstTick = 2;
        }
    }
}

function ServerPlayFiring()
{
    local bool hasBomb;

    hasBomb = Weapon.Owner.IsA('Pawn') && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag != none && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted && !Level.GRI.IsDefender(byte(Instigator.Controller.GetTeamNum()));
    // End:0x180
    if(hasBomb)
    {
        Instigator.SpecPlaySoundHK(FireSound, 3, TransientSoundVolume,, ResParams.default.rad_Fire, default.FireAnimRate / FireAnimRate, false);
        Instigator.PlaySound(FireSound, 3, TransientSoundVolume,, ResParams.default.rad_Fire, default.FireAnimRate / FireAnimRate, true,,, true);
    }
    // End:0x1ee
    else
    {
        Instigator.SpecPlaySoundHK(DefuseSound, 3, TransientSoundVolume,, ResParams.default.rad_Fire, default.FireAnimRate / FireAnimRate, false);
        Instigator.PlaySound(DefuseSound, 3, TransientSoundVolume,, ResParams.default.rad_Fire, default.FireAnimRate / FireAnimRate, true,,, true);
    }
}

function PlayFiring()
{
    local float locFireAnimRate;
    local bool hasBomb;

    locFireAnimRate = FireAnimRate;
    hasBomb = Weapon.Owner.IsA('Pawn') && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag != none && Pawn(Weapon.Owner).PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb');
    hasBomb = hasBomb || Level.GRI.bMultiBomb && !Level.GRI.bObjectivePlanted && !Level.GRI.IsDefender(byte(Instigator.Controller.GetTeamNum()));
    // End:0x1e1
    if(hasBomb)
    {
        Weapon.PlayAnim(PlantAni, locFireAnimRate, TweenTime);
        Instigator.PlaySoundHK(FireSound_Stereo, 3, TransientSoundVolume,, ResParams.default.rad_Fire, locFireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x1de
        if(Weapon.Role == 4)
        {
            Instigator.PlaySound(FireSound_Stereo, 3, TransientSoundVolume,, ResParams.default.rad_Fire, locFireAnimRate, false,,, true);
        }
    }
    // End:0x2f9
    else
    {
        Weapon.PlayAnim(DefuseAni, locFireAnimRate, TweenTime);
        Log(string(self) $ "PlayFiring() ======================================== / DefuseAni:" $ string(DefuseAni));
        Instigator.PlaySoundHK(DefuseSound_Stereo, 3, TransientSoundVolume,, ResParams.default.rad_Fire, locFireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x2f9
        if(Weapon.Role == 4)
        {
            Instigator.PlaySound(DefuseSound_Stereo, 3, TransientSoundVolume,, ResParams.default.rad_Fire, locFireAnimRate, false,,, true);
        }
    }
    ClientPlayForceFeedback(FireForce);
    ++ FireCount;
}

defaultproperties
{
    PlantAni=plant
    DefuseAni=Defuse
}