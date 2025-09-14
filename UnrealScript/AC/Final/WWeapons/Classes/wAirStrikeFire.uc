class wAirStrikeFire extends wProjectileFire;

var float TraceRange;
var name Aim_FireAnim;

function float MaxRange()
{
    // End:0x51
    if(Instigator.Region.Zone.bDistanceFog)
    {
        TraceRange = FClamp(Instigator.Region.Zone.DistanceFogEnd, 8000.0000000, default.TraceRange);        
    }
    else
    {
        TraceRange = default.TraceRange;
    }
    return TraceRange;
    //return;    
}

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
    // End:0x98
    if(bFireOnRelease)
    {
        // End:0x7A
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
    // End:0x11C
    if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
    //return;    
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

function DoFireEffect()
{
    local int lp1;
    local Vector StartProj, StartTrace, X, Y, Z, End;

    local Rotator Aim;
    local Vector HitLocation, HitNormal;
    local Actor Other;

    Instigator.MakeNoise(1.0000000);
    Weapon.GetViewAxes(X, Y, Z);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    StartProj = StartTrace + (X * ProjSpawnOffset.X);
    // End:0xC7
    if(!Weapon.WeaponCentered())
    {
        StartProj = (StartProj + ((Weapon.Hand * Y) * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
    }
    Aim = AdjustAim(StartProj, AimError);
    MaxRange();
    X = Vector(Aim);
    End = StartProj + (TraceRange * X);
    Other = Weapon.Trace(HitLocation, HitNormal, End, StartProj, false);
    HitLocation.Z += 3000.0000000;
    lp1 = 0;
    J0x148:

    // End:0x188 [Loop If]
    if(lp1 < 5)
    {
        // End:0x16D
        if((SpawnProjectile(HitLocation, Aim)) != none)
        {
            // [Explicit Break]
            goto J0x188;
        }
        HitLocation.Z += 1000.0000000;
        lp1++;
        // [Loop Continue]
        goto J0x148;
    }
    J0x188:

    Level.Game.AnnounceArtillery(Weapon.Instigator.Controller);
    //return;    
}

simulated function wLoadOut()
{
    super(wWeaponFire).wLoadOut();
    bWaitForRelease = true;
    //return;    
}

function PlayFiring()
{
    local wGun G;

    // End:0x76
    if(Weapon.Mesh != none)
    {
        G = wGun(Weapon);
        // End:0x5B
        if(int(G.AimState) == int(2))
        {
            Weapon.PlayAnim(Aim_FireAnim, FireAnimRate, TweenTime);            
        }
        else
        {
            Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        }
    }
    // End:0xCD
    if(PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).ClientUseSupplyItem(3);
        PlayerController(Instigator.Controller).ServerUseSupplyItem(3);
    }
    Instigator.FmodPlaySoundUseID(FmodFireSound_Stereo, 0, FireAnimRate,, false,, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0x153
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        Instigator.FmodPlaySound(FmodFireSound, 0, FireAnimRate,, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    FireCount++;
    //return;    
}

defaultproperties
{
    TraceRange=10000.0000000
    Aim_FireAnim="Ads_Fire"
    ProjectileClass=Class'WWeapons_Decompressed.wAirStrikeProj'
    bMakeRadarNoise=false
}