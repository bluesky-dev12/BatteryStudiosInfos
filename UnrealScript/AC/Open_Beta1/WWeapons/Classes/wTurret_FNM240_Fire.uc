class wTurret_FNM240_Fire extends wInstantFire;

var bool bStartFireSound;
var Sound SoundNotReady;
var bool bSoundNotReady;

event ModeDoFire()
{
    local int iCodeID;

    // End:0x0D
    if(Instigator == none)
    {
        return;
    }
    // End:0xB0
    if(Instigator.Weapon.bHoldFire)
    {
        // End:0xAE
        if(Instigator.IsLocallyControlled())
        {
            iCodeID = Class'Engine.wMessage_Game_ImpSystem'.default.Code_HoldFireOverHeat;
            PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', iCodeID);
            // End:0xAE
            if(!bSoundNotReady)
            {
                PlayerController(Instigator.Controller).ClientPlaySound(SoundNotReady,,, 0);
                bSoundNotReady = true;
            }
        }
        return;
    }
    super.ModeDoFire();
    //return;    
}

function DoFireEffect()
{
    local Vector StartTrace, HL, HN;
    local Rotator R, Aim;
    local Actor HitActor;

    Instigator.MakeNoise(1.0000000);
    StartTrace = wVehicle(Instigator).GetFireStart();
    Aim = AdjustAim(StartTrace, AimError);
    HitActor = wVehicle(Instigator).CalcWeaponFire(HL, HN);
    R = Rotator(Normal(HL - StartTrace) + ((VRand() * FRand()) * Spread));
    DoTraceNative(StartTrace, R);
    wWeapon_Turret_FNM240(Instigator.Weapon).OverHeatUp();
    //return;    
}

event Timer()
{
    //return;    
}

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
    // End:0xB3
    if(G != none)
    {
        switch(G.AimState)
        {
            // End:0x67
            case 0:
                // End:0xB3
                break;
            // End:0x9B
            case 2:
                locFireAnim = Aim_FireAnim;
                locFireLoopAnim = Aim_FireLoopAnim;
                locFireAnimRate = Aim_FireAnimRate;
                locFireLoopAnimRate = Aim_FireLoopAnimRate;
                // End:0xB3
                break;
            // End:0xA0
            case 1:
            // End:0xB0
            case 3:
                bSkipAnim = true;
                // End:0xB3
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        // End:0x1A7
        if((Weapon.Mesh != none) && bSkipAnim == false)
        {
            // End:0x175
            if(FireCount > 0)
            {
                // End:0x140
                if(wTurret_FNM240(Weapon.Instigator).TurretBase.HasAnim(locFireLoopAnim))
                {
                    wTurret_FNM240(Weapon.Instigator).TurretBase.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);                    
                }
                else
                {
                    wTurret_FNM240(Weapon.Instigator).TurretBase.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
                }                
            }
            else
            {
                wTurret_FNM240(Weapon.Instigator).TurretBase.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
            }
        }
        // End:0x1F8
        if(G.bSilencer)
        {
            FireSound = ResParams.default.sound_Fire_Silencer;
            FireSound_Stereo = ResParams.default.sound_Fire_Silencer_Stereo;
            fFireSoundRad = ResParams.default.rad_Fire_Silencer;            
        }
        else
        {
            FireSound = ResParams.default.sound_Fire;
            FireSound_Stereo = ResParams.default.sound_Fire_Stereo;
            fFireSoundRad = ResParams.default.rad_Fire;
        }
        Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, fFireSoundRad, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x2CB
        if(int(Weapon.Role) == int(ROLE_Authority))
        {
            Instigator.PlaySound(FireSound_Stereo, 0, TransientSoundVolume,, fFireSoundRad, FireAnimRate, false,,, true);
        }
        ClientPlayForceFeedback(FireForce);
        FireCount++;
        //return;        
    }
}

simulated function bool AllowFire()
{
    local int iCodeID;

    // End:0xA8
    if(wWeapon_Turret_FNM240(Instigator.Weapon).bHoldFire)
    {
        // End:0xA6
        if(Instigator.IsLocallyControlled())
        {
            iCodeID = Class'Engine.wMessage_Game_ImpSystem'.default.Code_HoldFireOverHeat;
            PlayerController(Instigator.Controller).ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', iCodeID);
            // End:0xA6
            if(!bSoundNotReady)
            {
                PlayerController(Instigator.Controller).ClientPlaySound(SoundNotReady,,, 0);
                bSoundNotReady = true;
            }
        }
        return false;
    }
    return true;
    //return;    
}

simulated function InitEffects()
{
    // End:0x36
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
    {
        return;
    }
    // End:0x79
    if((FlashEmitterClass != none) && (FlashEmitter == none) || FlashEmitter.bDeleteMe)
    {
        FlashEmitter = Weapon.Spawn(FlashEmitterClass);
    }
    // End:0xBC
    if((SmokeEmitterClass != none) && (SmokeEmitter == none) || SmokeEmitter.bDeleteMe)
    {
        SmokeEmitter = Weapon.Spawn(SmokeEmitterClass);
    }
    // End:0xFF
    if((SilencerSmokeEmitterClass != none) && (SilencerSmokeEmitter == none) || SmokeEmitter.bDeleteMe)
    {
        SilencerSmokeEmitter = Weapon.Spawn(SilencerSmokeEmitterClass);
    }
    // End:0x14C
    if((FlashEmitter != none) && wTurret_FNM240(Instigator).TurretBase != none)
    {
        wTurret_FNM240(Instigator).TurretBase.AttachToBone(FlashEmitter, 'tip');
    }
    //return;    
}

function DrawMuzzleFlash(Canvas Canvas)
{
    local Coords C;

    // End:0x53
    if((wTurret_FNM240(Instigator) != none) && wTurret_FNM240(Instigator).TurretBase != none)
    {
        C = wTurret_FNM240(Instigator).TurretBase.GetBoneCoords('tip');
    }
    // End:0xAF
    if((SilencerSmokeEmitter != none) && SilencerSmokeEmitter.Base != Weapon)
    {
        SilencerSmokeEmitter.SetLocation(C.Origin);
        Canvas.DrawActor(SilencerSmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    // End:0x10B
    if((SmokeEmitter != none) && SmokeEmitter.Base != Weapon)
    {
        SmokeEmitter.SetLocation(C.Origin);
        Canvas.DrawActor(SmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    // End:0x167
    if((FlashEmitter != none) && FlashEmitter.Base != Weapon)
    {
        FlashEmitter.SetLocation(C.Origin);
        Canvas.DrawActor(FlashEmitter, false, false, Weapon.DisplayFOV);
    }
    //return;    
}

function FlashMuzzleFlash()
{
    super.FlashMuzzleFlash();
    UpdateEmitter();
    //return;    
}

simulated function UpdateEmitter()
{
    local Rotator R;
    local Coords C;

    // End:0x9C
    if((wTurret_FNM240(Instigator) != none) && wTurret_FNM240(Instigator).TurretBase != none)
    {
        C = wTurret_FNM240(Instigator).TurretBase.GetBoneCoords('tip');
        R = wTurret_FNM240(Instigator).TurretBase.Rotation;
        FlashEmitter.SetLocation(C.Origin);
        FlashEmitter.SetRotation(R);
    }
    //return;    
}

function StartMuzzleSmoke()
{
    local wWeapon_Turret_FNM240 G;

    G = wWeapon_Turret_FNM240(Weapon);
    // End:0x6D
    if(G.bSilencer)
    {
        // End:0x6A
        if(!Level.bDropDetail && SilencerSmokeEmitter != none)
        {
            SilencerSmokeEmitter.Trigger(wTurret_FNM240(Instigator).TurretBase, Instigator);
        }        
    }
    else
    {
        // End:0xB5
        if(!Level.bDropDetail && SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(wTurret_FNM240(Instigator).TurretBase, Instigator);
        }
    }
    //return;    
}

event ModeTick(float dt)
{
    Spread = Spread - (fSpreadReduce * (Level.TimeSeconds - fLastRecoilReduceTime));
    CalcSpread();
    fLastRecoilReduceTime = Level.TimeSeconds;
    // End:0x6F
    if(int(PlayerController(Instigator.Controller).bFire) == 0)
    {
        bSoundNotReady = false;
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
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
    bStartFireSound = true;
    //return;    
}

function StopFiring()
{
    // End:0xC5
    if(bStartFireSound)
    {
        // End:0x74
        if(int(Weapon.Instigator.Role) == int(ROLE_Authority))
        {
            Weapon.Instigator.PlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0000000, true, false, -1, false);            
        }
        else
        {
            Weapon.Instigator.ServerPlaySound(ResParams.default.sound_Fire_Stop, 0, TransientSoundVolume,, ResParams.default.rad_Fire_Stop, 1.0000000, true, false, -1, false);
        }
        bStartFireSound = false;
    }
    bSoundNotReady = false;
    //return;    
}

defaultproperties
{
    SoundNotReady=Sound'Warfare_Sound_ATS.cb.ats_cb_use_fail'
    Aim_FireAnim="None"
    Aim_FireLoopAnim="None"
    FireRate=0.1500000
    Spread=0.0150000
}