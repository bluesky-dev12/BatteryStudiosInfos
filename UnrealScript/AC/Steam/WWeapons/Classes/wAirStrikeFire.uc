/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wAirStrikeFire.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class wAirStrikeFire extends wProjectileFire;

var float TraceRange;
var name Aim_FireAnim;

function float MaxRange()
{
    // End:0x51
    if(Instigator.Region.Zone.bDistanceFog)
    {
        TraceRange = FClamp(Instigator.Region.Zone.DistanceFogEnd, 8000.0, default.TraceRange);
    }
    // End:0x5c
    else
    {
        TraceRange = default.TraceRange;
    }
    return TraceRange;
}

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

function DoFireEffect()
{
    local int lp1;
    local Vector StartProj, StartTrace, X, Y, Z, End;

    local Rotator Aim;
    local Vector HitLocation, HitNormal;
    local Actor Other;

    Instigator.MakeNoise(1.0);
    Weapon.GetViewAxes(X, Y, Z);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    StartProj = StartTrace + X * ProjSpawnOffset.X;
    // End:0xc7
    if(!Weapon.WeaponCentered())
    {
        StartProj = StartProj + Weapon.Hand * Y * ProjSpawnOffset.Y + Z * ProjSpawnOffset.Z;
    }
    Aim = AdjustAim(StartProj, AimError);
    MaxRange();
    X = vector(Aim);
    End = StartProj + TraceRange * X;
    Other = Weapon.Trace(HitLocation, HitNormal, End, StartProj, false);
    HitLocation.Z += 3000.0;
    lp1 = 0;
    J0x148:
    // End:0x188 [While If]
    if(lp1 < 5)
    {
        // End:0x16d
        if(SpawnProjectile(HitLocation, Aim) != none)
        {
        }
        // End:0x188
        else
        {
            HitLocation.Z += 1000.0;
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x148;
        }
    }
    Level.Game.AnnounceArtillery(Weapon.Instigator.Controller);
}

simulated function wLoadOut()
{
    super(wWeaponFire).wLoadOut();
    bWaitForRelease = true;
}

function PlayFiring()
{
    local wGun G;

    // End:0x76
    if(Weapon.Mesh != none)
    {
        G = wGun(Weapon);
        // End:0x5b
        if(G.AimState == 2)
        {
            Weapon.PlayAnim(Aim_FireAnim, FireAnimRate, TweenTime);
        }
        // End:0x76
        else
        {
            Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        }
    }
    // End:0xcd
    if(PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).ClientUseSupplyItem(0);
        PlayerController(Instigator.Controller).ServerUseSupplyItem(0);
    }
    Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0x176
    if(Weapon.Role == 4)
    {
        Instigator.PlaySound(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    ++ FireCount;
}

defaultproperties
{
    TraceRange=10000.0
    Aim_FireAnim=Ads_Fire
    ProjectileClass=class'wAirStrikeProj'
    bMakeRadarNoise=true
}