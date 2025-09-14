/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wTurret_FNM240_Fire.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:15
 *
 *******************************************************************************/
class wTurret_FNM240_Fire extends wInstantFire;

var bool bStartFireSound;
var Sound SoundNotReady;
var bool bSoundNotReady;

event ModeDoFire()
{
    local int iCodeID;

    // End:0x0d
    if(Instigator == none)
    {
        return;
    }
    // End:0xb0
    if(Instigator.Weapon.bHoldFire)
    {
        // End:0xae
        if(Instigator.IsLocallyControlled())
        {
            iCodeID = class'wMessage_Game_ImpSystem'.default.Code_HoldFireOverHeat;
            PlayerController(Instigator.Controller).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCodeID);
            // End:0xae
            if(!bSoundNotReady)
            {
                PlayerController(Instigator.Controller).ClientPlaySound(SoundNotReady,,, 0);
                bSoundNotReady = true;
            }
        }
        return;
    }
    super.ModeDoFire();
}

function DoFireEffect()
{
    local Vector StartTrace, HL, HN;
    local Rotator R, Aim;
    local Actor HitActor;

    Instigator.MakeNoise(1.0);
    StartTrace = wVehicle(Instigator).GetFireStart();
    Aim = AdjustAim(StartTrace, AimError);
    HitActor = wVehicle(Instigator).CalcWeaponFire(HL, HN);
    R = rotator(Normal(HL - StartTrace) + VRand() * FRand() * Spread);
    DoTraceNative(StartTrace, R);
    wWeapon_Turret_FNM240(Instigator.Weapon).OverHeatUp();
}

function DoFireEffectForClient()
{
    local Vector StartTrace, HL, HN;
    local Rotator R, Aim;
    local Actor HitActor;

    StartTrace = wVehicle(Instigator).GetFireStart();
    Aim = AdjustAim(StartTrace, AimError);
    HitActor = wVehicle(Instigator).CalcWeaponFire(HL, HN);
    R = rotator(Normal(HL - StartTrace) + VRand() * FRand() * Spread);
    DoTraceForClient(StartTrace, R);
}

event Timer();
function PlayFiring()
{
    local name locFireAnim, locFireLoopAnim;
    local float locFireAnimRate, locFireLoopAnimRate;
    local wWeapon_Turret_FNM240 G;
    local bool bSkipAnim;
    local float fFireSoundRad;

    bSkipAnim = false;
    G = wWeapon_Turret_FNM240(Weapon);
    locFireAnim = FireAnim;
    locFireLoopAnim = FireLoopAnim;
    locFireAnimRate = FireAnimRate;
    locFireLoopAnimRate = FireLoopAnimRate;
    // End:0xb3
    if(G != none)
    {
        switch(G.AimState)
        {
            // End:0x67
            case 0:
                // End:0xb3
                break;
            // End:0x9b
            case 2:
                locFireAnim = Aim_FireAnim;
                locFireLoopAnim = Aim_FireLoopAnim;
                locFireAnimRate = Aim_FireAnimRate;
                locFireLoopAnimRate = Aim_FireLoopAnimRate;
                // End:0xb3
                break;
            // End:0xa0
            case 1:
            // End:0xb0
            case 3:
                bSkipAnim = true;
                // End:0xb3
                break;
            // End:0xffff
            default:
            }
            // End:0x1a7
            if(Weapon.Mesh != none && bSkipAnim == false)
            {
                // End:0x175
                if(FireCount > 0)
                {
                    // End:0x140
                    if(wTurret_FNM240(Weapon.Instigator).TurretBase.HasAnim(locFireLoopAnim))
                    {
                        wTurret_FNM240(Weapon.Instigator).TurretBase.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
                    }
                    // End:0x172
                    else
                    {
                        wTurret_FNM240(Weapon.Instigator).TurretBase.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
                    }
                }
                // End:0x1a7
                else
                {
                    wTurret_FNM240(Weapon.Instigator).TurretBase.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
                }
            }
            // End:0x1f8
            if(G.bSilencer)
            {
                FireSound = ResParams.default.sound_Fire_Silencer;
                FireSound_Stereo = ResParams.default.sound_Fire_Silencer_Stereo;
                fFireSoundRad = ResParams.default.rad_Fire_Silencer;
            }
            // End:0x234
            else
            {
                FireSound = ResParams.default.sound_Fire;
                FireSound_Stereo = ResParams.default.sound_Fire_Stereo;
                fFireSoundRad = ResParams.default.rad_Fire;
            }
            Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, fFireSoundRad, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
            // End:0x2cb
            if(Weapon.Role == 4)
            {
                Instigator.PlaySound(FireSound_Stereo, 0, TransientSoundVolume,, fFireSoundRad, FireAnimRate, false,,, true);
            }
            ClientPlayForceFeedback(FireForce);
            ++ FireCount;
}

simulated function bool AllowFire()
{
    local int iCodeID;

    // End:0xa8
    if(wWeapon_Turret_FNM240(Instigator.Weapon).bHoldFire)
    {
        // End:0xa6
        if(Instigator.IsLocallyControlled())
        {
            iCodeID = class'wMessage_Game_ImpSystem'.default.Code_HoldFireOverHeat;
            PlayerController(Instigator.Controller).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCodeID);
            // End:0xa6
            if(!bSoundNotReady)
            {
                PlayerController(Instigator.Controller).ClientPlaySound(SoundNotReady,,, 0);
                bSoundNotReady = true;
            }
        }
        return false;
    }
    return true;
}

simulated function InitEffects()
{
    // End:0x36
    if(Level.NetMode == 1 || AIController(Instigator.Controller) != none)
    {
        return;
    }
    // End:0x79
    if(FlashEmitterClass != none && FlashEmitter == none || FlashEmitter.bDeleteMe)
    {
        FlashEmitter = Weapon.Spawn(FlashEmitterClass);
    }
    // End:0xbc
    if(SmokeEmitterClass != none && SmokeEmitter == none || SmokeEmitter.bDeleteMe)
    {
        SmokeEmitter = Weapon.Spawn(SmokeEmitterClass);
    }
    // End:0xff
    if(SilencerSmokeEmitterClass != none && SilencerSmokeEmitter == none || SmokeEmitter.bDeleteMe)
    {
        SilencerSmokeEmitter = Weapon.Spawn(SilencerSmokeEmitterClass);
    }
    // End:0x14c
    if(FlashEmitter != none && wTurret_FNM240(Instigator).TurretBase != none)
    {
        wTurret_FNM240(Instigator).TurretBase.AttachToBone(FlashEmitter, 'tip');
    }
}

function DrawMuzzleFlash(Canvas Canvas)
{
    local Coords C;

    // End:0x53
    if(wTurret_FNM240(Instigator) != none && wTurret_FNM240(Instigator).TurretBase != none)
    {
        C = wTurret_FNM240(Instigator).TurretBase.GetBoneCoords('tip');
    }
    // End:0xaf
    if(SilencerSmokeEmitter != none && SilencerSmokeEmitter.Base != Weapon)
    {
        SilencerSmokeEmitter.SetLocation(C.Origin);
        Canvas.DrawActor(SilencerSmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    // End:0x10b
    if(SmokeEmitter != none && SmokeEmitter.Base != Weapon)
    {
        SmokeEmitter.SetLocation(C.Origin);
        Canvas.DrawActor(SmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    // End:0x167
    if(FlashEmitter != none && FlashEmitter.Base != Weapon)
    {
        FlashEmitter.SetLocation(C.Origin);
        Canvas.DrawActor(FlashEmitter, false, false, Weapon.DisplayFOV);
    }
}

function FlashMuzzleFlash()
{
    super.FlashMuzzleFlash();
    UpdateEmitter();
}

simulated function UpdateEmitter()
{
    local Rotator R;
    local Coords C;

    // End:0x9c
    if(wTurret_FNM240(Instigator) != none && wTurret_FNM240(Instigator).TurretBase != none)
    {
        C = wTurret_FNM240(Instigator).TurretBase.GetBoneCoords('tip');
        R = wTurret_FNM240(Instigator).TurretBase.Rotation;
        FlashEmitter.SetLocation(C.Origin);
        FlashEmitter.SetRotation(R);
    }
}

function StartMuzzleSmoke()
{
    local wWeapon_Turret_FNM240 G;

    G = wWeapon_Turret_FNM240(Weapon);
    // End:0x6d
    if(G.bSilencer)
    {
        // End:0x6a
        if(!Level.bDropDetail && SilencerSmokeEmitter != none)
        {
            SilencerSmokeEmitter.Trigger(wTurret_FNM240(Instigator).TurretBase, Instigator);
        }
    }
    // End:0xb5
    else
    {
        // End:0xb5
        if(!Level.bDropDetail && SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(wTurret_FNM240(Instigator).TurretBase, Instigator);
        }
    }
}

event ModeTick(float dt)
{
    Spread = Spread - fSpreadReduce * Level.TimeSeconds - fLastRecoilReduceTime;
    CalcSpread();
    fLastRecoilReduceTime = Level.TimeSeconds;
    // End:0x6f
    if(PlayerController(Instigator.Controller).bFire == 0)
    {
        bSoundNotReady = false;
    }
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
}

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
    bStartFireSound = true;
}

function StopFiring()
{
    // End:0xc5
    if(bStartFireSound)
    {
        // End:0x74
        if(Weapon.Instigator.Role == 4)
        {
            Weapon.Instigator.PlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0, true, false, -1, false);
        }
        // End:0xbd
        else
        {
            Weapon.Instigator.ServerPlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0, true, false, -1, false);
        }
        bStartFireSound = false;
    }
    bSoundNotReady = false;
}

defaultproperties
{
    SoundNotReady=Sound'Warfare_Sound_ATS.cb.ats_cb_use_fail'
    Aim_FireAnim=None
    Aim_FireLoopAnim=None
    FireRate=0.150
    Spread=0.0150
}