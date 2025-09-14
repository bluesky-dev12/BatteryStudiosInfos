/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wRocketFire.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:10
 *
 *******************************************************************************/
class wRocketFire extends wProjectileFire;

var() name Aim_FireAnim;
var() name Aim_FireLoopAnim;
var() float Aim_FireAnimRate;
var() float Aim_FireLoopAnimRate;
var float fWaitingTime;

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
    // End:0xe5
    if(Weapon.Role == 4)
    {
        Weapon.SeverConsumeAmmo(ThisModeNum, Load);
        DoFireEffect();
        HoldTime = 0.0;
        // End:0x94
        if(Instigator == none || Instigator.Controller == none)
        {
            return;
        }
        // End:0xd0
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
        NewActiveStartFire();
    }
    // End:0xfa
    if(Instigator.IsLocallyControlled())
    {
    }
    // End:0x100
    else
    {
        ServerPlayFiring();
    }
}

simulated function NewActiveStartFire()
{
    local Vector V;
    local Coords cR;

    // End:0x3e
    if(Instigator.IsLocallyControlled())
    {
        Weapon.FireOne(ThisModeNum);
        ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    PlaySoundTeam();
    // End:0x9e
    if(bFireOnRelease)
    {
        // End:0x80
        if(bIsFiring)
        {
            NextFireTime += MaxHoldTime + FireRate;
        }
        // End:0x9b
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }
    }
    // End:0xc5
    else
    {
        NextFireTime += FireRate;
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0;
    // End:0x122
    if(Instigator.PendingWeapon != Weapon && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
    cR = Weapon.GetBoneCoords('tip');
    cR = WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st();
    V = WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin;
    V = V;
}

function FlashMuzzleFlash()
{
    local Actor ac;
    local Vector vOrigin;
    local Coords cR;

    cR = Weapon.GetBoneCoords(WeaponAttachment(Weapon.ThirdPersonActor).GetBoneNameTip());
    vOrigin = cR.Origin;
    // End:0x69
    if(FlashEmitter != none)
    {
        FlashEmitter.Trigger(Weapon, Instigator);
    }
    // End:0x9e
    else
    {
        // End:0x9e
        if(FlashFirstPersonEmitterClass != none)
        {
            ac = Spawn(FlashFirstPersonEmitterClass, Instigator,, vOrigin, Instigator.Rotation);
        }
    }
}

function StartMuzzleSmoke()
{
    local Vector vOrigin;
    local Coords cR;

    // End:0xac
    if(!Level.bDropDetail)
    {
        cR = Weapon.GetBoneCoords(WeaponAttachment(Weapon.ThirdPersonActor).GetBoneNameTip());
        vOrigin = cR.Origin;
        // End:0x7d
        if(SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(Weapon, Instigator);
        }
        // End:0xac
        else
        {
            // End:0xac
            if(SmokeFirstPersonEmitterClass != none)
            {
                Spawn(SmokeFirstPersonEmitterClass, Instigator,, vOrigin, Instigator.Rotation);
            }
        }
    }
}

event ServerDoFire()
{
    ModeDoFire();
}

simulated function bool CheckRPGAimMode()
{
    local wRocketLauncher wRocket;

    wRocket = wRocketLauncher(Weapon);
    // End:0x91
    if(wRocket != none && wRocket.IsRPG())
    {
        // End:0x7b
        if(!wRocket.IsAiming() && false == bInputFire)
        {
            wRocket.SetAim(true);
            wRocket.ClientStartFire(1);
            bInputFire = true;
            return false;
        }
        // End:0x91
        if(!wRocket.IsAiming())
        {
            return false;
        }
    }
    return true;
}

simulated function bool IsInputFire()
{
    return bInputFire;
}

simulated function ResetInputFire()
{
    bInputFire = false;
}

function PlayFiring()
{
    local name locFireAnim, locFireLoopAnim;
    local float locFireAnimRate, locFireLoopAnimRate;
    local wRocketLauncher G;
    local bool bSkipAnim;

    bSkipAnim = false;
    G = wRocketLauncher(Weapon);
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
            // End:0x14b
            if(Weapon.Mesh != none && bSkipAnim == false)
            {
                // End:0x130
                if(FireCount > 0)
                {
                    // End:0x112
                    if(Weapon.HasAnim(locFireLoopAnim))
                    {
                        Weapon.PlayAnim(locFireLoopAnim, locFireLoopAnimRate, 0.0);
                    }
                    // End:0x12d
                    else
                    {
                        Weapon.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
                    }
                }
                // End:0x14b
                else
                {
                    Weapon.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
                }
            }
            Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
            // End:0x1f4
            if(Weapon.Role == 4)
            {
                Instigator.PlaySound(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
            }
            ClientPlayForceFeedback(FireForce);
            ++ FireCount;
}

function StartFiring()
{
    super(wWeaponFire).StartFiring();
    // End:0x13
    if(!AllowFire())
    {
        return;
    }
    // End:0x46
    if(Weapon.Role < 4 && Instigator.IsLocallyControlled())
    {
        NewActiveStartFire();
    }
}

defaultproperties
{
    Aim_FireAnim=Ads_Fire
    Aim_FireLoopAnim=Ads_Fire
    Aim_FireAnimRate=1.0
    Aim_FireLoopAnimRate=1.0
    ProjSpawnOffset=(X=0.0,Y=0.0,Z=0.0)
    ProjectileClass=Class'Engine.wRocket'
}