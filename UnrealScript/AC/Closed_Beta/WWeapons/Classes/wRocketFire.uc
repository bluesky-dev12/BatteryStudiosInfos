class wRocketFire extends wProjectileFire;

var() name Aim_FireAnim;
var() name Aim_FireLoopAnim;
var() float Aim_FireAnimRate;
var() float Aim_FireLoopAnimRate;
var float fWaitingTime;

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
    // End:0xE5
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        Weapon.SeverConsumeAmmo(ThisModeNum, Load);
        DoFireEffect();
        HoldTime = 0.0000000;
        // End:0x94
        if((Instigator == none) || Instigator.Controller == none)
        {
            return;
        }
        // End:0xD0
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
        NewActiveStartFire();
    }
    // End:0xFA
    if(Instigator.IsLocallyControlled())
    {        
    }
    else
    {
        ServerPlayFiring();
    }
    //return;    
}

simulated function NewActiveStartFire()
{
    local Vector V;
    local Coords cR;

    // End:0x3E
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
    // End:0x9E
    if(bFireOnRelease)
    {
        // End:0x80
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
    // End:0x122
    if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
    cR = Weapon.GetBoneCoords('tip');
    cR = WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st();
    V = WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin;
    V = V;
    //return;    
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
    else
    {
        // End:0x9E
        if(FlashFirstPersonEmitterClass != none)
        {
            ac = Spawn(FlashFirstPersonEmitterClass, Instigator,, vOrigin, Instigator.Rotation);
        }
    }
    //return;    
}

function StartMuzzleSmoke()
{
    local Actor ac;
    local Vector vOrigin;
    local Coords cR;

    // End:0xAC
    if(!Level.bDropDetail)
    {
        cR = Weapon.GetBoneCoords(WeaponAttachment(Weapon.ThirdPersonActor).GetBoneNameTip());
        vOrigin = cR.Origin;
        // End:0x7D
        if(SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(Weapon, Instigator);            
        }
        else
        {
            // End:0xAC
            if(SmokeFirstPersonEmitterClass != none)
            {
                Spawn(SmokeFirstPersonEmitterClass, Instigator,, vOrigin, Instigator.Rotation);
            }
        }
    }
    //return;    
}

event ServerDoFire()
{
    ModeDoFire();
    //return;    
}

simulated function bool CheckRPGAimMode()
{
    local wRocketLauncher wRocket;

    wRocket = wRocketLauncher(Weapon);
    // End:0x91
    if((wRocket != none) && wRocket.IsRPG())
    {
        // End:0x7B
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
    //return;    
}

simulated function bool IsInputFire()
{
    return bInputFire;
    //return;    
}

simulated function ResetInputFire()
{
    bInputFire = false;
    //return;    
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
        // End:0x14B
        if((Weapon.Mesh != none) && bSkipAnim == false)
        {
            // End:0x130
            if(FireCount > 0)
            {
                // End:0x112
                if(Weapon.HasAnim(locFireLoopAnim))
                {
                    Weapon.PlayAnim(locFireLoopAnim, locFireLoopAnimRate, 0.0000000);                    
                }
                else
                {
                    Weapon.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
                }                
            }
            else
            {
                Weapon.PlayAnim(locFireAnim, locFireAnimRate, TweenTime);
            }
        }
        Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x1F4
        if(int(Weapon.Role) == int(ROLE_Authority))
        {
            Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
        }
        ClientPlayForceFeedback(FireForce);
        FireCount++;
        //return;        
    }
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
    if((int(Weapon.Role) < int(ROLE_Authority)) && Instigator.IsLocallyControlled())
    {
        NewActiveStartFire();
    }
    //return;    
}

defaultproperties
{
    Aim_FireAnim="Ads_Fire"
    Aim_FireLoopAnim="Ads_Fire"
    Aim_FireAnimRate=1.0000000
    Aim_FireLoopAnimRate=1.0000000
    ProjSpawnOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ProjectileClass=Class'Engine.wRocket'
}