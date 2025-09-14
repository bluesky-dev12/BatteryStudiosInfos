/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wInstantFire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:21
 *
 *******************************************************************************/
class wInstantFire extends wWeaponFire
    native;

var class<DamageType> DamageType;
var float TraceRange;
var float Momentum;
var float Momentum_Pawn;
var float HeadShotExtent;
var() name Aim_FireAnim;
var() name Aim_FireLoopAnim;
var() float Aim_FireAnimRate;
var() float Aim_FireLoopAnimRate;
var() class<wEmitter> SilencerSmokeEmitterClass;
var() wEmitter SilencerSmokeEmitter;
var bool bToggleSlot;
var float fSpread_Weapon;
var float fSpread_Char;
var float fSpread_Min;
var float fSpread_Max;
var float fSpreadReduce;
var float fSpreadReduce_Normal;
var float fLastRecoilReduceTime;
var Sound sound_Fire_Silencer;
var float fSpread_2nd_Max_Curr;

event ModeDoFire()
{
    super.ModeDoFire();
    Spread = Spread + BaseParams.fSpread_Fire_Add;
    CalcSpread();
}

simulated function bool AllowFire()
{
    local PlayerController PC;

    // End:0x44
    if(!Instigator.Controller.AllowFire())
    {
        Log("Instigator.Controller.AllowFire()");
        return false;
    }
    // End:0x73
    if(Weapon.MeleeState == 1)
    {
        Weapon.ClientStopFire(ThisModeNum);
        return false;
    }
    PC = PlayerController(Instigator.Controller);
    // End:0x104
    if(PC != none)
    {
        // End:0xcb
        if(PC.bySprintState == 1 || PC.bySprintState == 2)
        {
            return false;
        }
        // End:0x104
        else
        {
            // End:0x104
            if(PC.bySprintState == 3)
            {
                PC.bySprintState = 0;
                PC.bFire = 0;
            }
        }
    }
    Log("Weapon.AmmoAmount(ThisModeNum) = " @ string(Weapon.AmmoAmount(ThisModeNum)) $ " " $ "AmmoPerFire = " @ string(AmmoPerFire));
    return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
}

function PlayFiring()
{
    local name locFireAnim, locFireLoopAnim;
    local float locFireAnimRate, locFireLoopAnimRate;
    local wGun G;
    local bool bSkipAnim;
    local float fFireSoundRad;

    bSkipAnim = false;
    G = wGun(Weapon);
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
            // End:0x19c
            if(G.bSilencer)
            {
                FireSound = ResParams.default.sound_Fire_Silencer;
                FireSound_Stereo = ResParams.default.sound_Fire_Silencer_Stereo;
                fFireSoundRad = ResParams.default.rad_Fire_Silencer;
            }
            // End:0x1d8
            else
            {
                FireSound = ResParams.default.sound_Fire;
                FireSound_Stereo = ResParams.default.sound_Fire_Stereo;
                fFireSoundRad = ResParams.default.rad_Fire;
            }
            Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
            // End:0x281
            if(Weapon.Role == 4)
            {
                Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
            }
            bToggleSlot = !bToggleSlot;
            ClientPlayForceFeedback(FireForce);
            ++ FireCount;
            Weapon.SetRandFiringSwayRot();
}

function ServerPlayFiring()
{
    local wGun G;
    local float fFireSoundRad;

    G = wGun(Weapon);
    // End:0x61
    if(G.bSilencer)
    {
        FireSound = ResParams.default.sound_Fire_Silencer;
        FireSound_Stereo = ResParams.default.sound_Fire_Silencer_Stereo;
        fFireSoundRad = ResParams.default.rad_Fire_Silencer;
    }
    // End:0x9d
    else
    {
        FireSound = ResParams.default.sound_Fire;
        FireSound_Stereo = ResParams.default.sound_Fire_Stereo;
        fFireSoundRad = ResParams.default.rad_Fire;
    }
    Instigator.SpecPlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, fFireSoundRad,, false);
    Instigator.PlaySound(FireSound, 0, 0.70,, fFireSoundRad,, true,,, true);
}

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

event ModeTick(float dt)
{
    Spread = Spread - fSpreadReduce * Level.TimeSeconds - fLastRecoilReduceTime;
    CalcSpread();
    fLastRecoilReduceTime = Level.TimeSeconds;
    // End:0x55
    if(bEnableBustMode)
    {
        // End:0x55
        if(bIsFiring)
        {
        }
    }
}

function DoFireEffect()
{
    local Vector StartTrace;
    local Rotator R, Aim;
    local int i;

    Instigator.MakeNoise(ResParams.default.rad_Fire / 100.0);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    Aim = AdjustAim(StartTrace, AimError);
    // End:0x1a6
    if(Weapon.IsA('wGun'))
    {
        // End:0x185
        if(wGun(Weapon).AimState == 2 && Weapon.WeaponType != 6)
        {
            // End:0xfe
            if(Instigator.Physics == 2 || Instigator.Physics == 11)
            {
                R = rotator(vector(Aim) + VRand() * FRand() * Spread);
            }
            // End:0x182
            else
            {
                // End:0x173
                if(Instigator.Acceleration != vect(0.0, 0.0, 0.0))
                {
                    Spread = BaseParams.fRunSpeed / BaseParams.fAimRunSpeed * BaseParams.fSpread_Aim_move_add;
                    R = rotator(vector(Aim) + VRand() * FRand() * Spread);
                }
                // End:0x182
                else
                {
                    R = rotator(vector(Aim));
                }
            }
        }
        // End:0x1a3
        else
        {
            R = rotator(vector(Aim) + VRand() * FRand() * Spread);
        }
    }
    // End:0x1c4
    else
    {
        R = rotator(vector(Aim) + VRand() * FRand() * Spread);
    }
    // End:0x1e1
    if(Weapon.wt_TestAim)
    {
        R = Aim;
    }
    // End:0x212
    if(!Level.GetMatchMaker().BotTutorial)
    {
        DoTraceNative(StartTrace, R);
    }
    // End:0x222
    else
    {
        DoTrace(StartTrace, R);
    }
}

// Export UwInstantFire::execDoTraceNative(FFrame&, void* const)
native function DoTraceNative(Vector Start, Rotator Dir);
function DoFireEffectForClient()
{
    local Vector StartTrace;
    local Rotator R, Aim;

    StartTrace = Instigator.Location + Instigator.EyePosition();
    Aim = AdjustAim(StartTrace, AimError);
    // End:0x185
    if(Weapon.IsA('wGun'))
    {
        // End:0x164
        if(wGun(Weapon).AimState == 2 && Weapon.WeaponType != 6)
        {
            // End:0xdd
            if(Instigator.Physics == 2 || Instigator.Physics == 11)
            {
                R = rotator(vector(Aim) + VRand() * FRand() * Spread);
            }
            // End:0x161
            else
            {
                // End:0x152
                if(Instigator.Acceleration != vect(0.0, 0.0, 0.0))
                {
                    Spread = BaseParams.fRunSpeed / BaseParams.fAimRunSpeed * BaseParams.fSpread_Aim_move_add;
                    R = rotator(vector(Aim) + VRand() * FRand() * Spread);
                }
                // End:0x161
                else
                {
                    R = rotator(vector(Aim));
                }
            }
        }
        // End:0x182
        else
        {
            R = rotator(vector(Aim) + VRand() * FRand() * Spread);
        }
    }
    // End:0x1a3
    else
    {
        R = rotator(vector(Aim) + VRand() * FRand() * Spread);
    }
    DoTraceForClient(StartTrace, R);
}

function DoTraceForClient(Vector Start, Rotator Dir)
{
    local Vector X, End;
    local float DamageCurr, fDamageAmp;
    local int i, j;
    local BtrTraceResult TrResult;
    local ResultData TrData;
    local array<float> arrResultDist;
    local array<ResultData> arrVictim;
    local ResultData SortTempResult;
    local float SortTempResultDist;
    local ResultData Victim;
    local bool bHeadRound;
    local float frange, fRangeLerp;
    local int iTutorialZoomCheckID;
    local BtrTraceResult ReverseTrResult;
    local array<bool> arrIsWallShot;
    local float DamageEff, DamageOuter;
    local int EffCnt;
    local Vector LastHitTrace;

    DamageEff = float(BaseParams.iDamage + iPartsDamage);
    DamageOuter = float(BaseParams.iDam_OOR + iPartsDamage_Outer);
    MaxRange();
    X = vector(Dir);
    End = Start + TraceRange * X;
    TrResult = new class'BtrTraceResult';
    Weapon.MultiTrace(TrResult, End, Start, true, true);
    // End:0xac
    if(TrResult.TraceResultArray.Length == 0)
    {
        return;
    }
    arrResultDist.Insert(0, TrResult.TraceResultArray.Length);
    i = 0;
    J0xc9:
    // End:0x111 [While If]
    if(i < arrResultDist.Length)
    {
        arrResultDist[i] = VSize(TrResult.TraceResultArray[i].HitLocation - Start);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc9;
    }
    i = 0;
    J0x118:
    // End:0x20e [While If]
    if(i < arrResultDist.Length - 1)
    {
        j = i + 1;
        J0x139:
        // End:0x204 [While If]
        if(j < arrResultDist.Length)
        {
            // End:0x1fa
            if(arrResultDist[j] < arrResultDist[i])
            {
                SortTempResult = TrResult.TraceResultArray[j];
                TrResult.TraceResultArray[j] = TrResult.TraceResultArray[i];
                TrResult.TraceResultArray[i] = SortTempResult;
                SortTempResultDist = arrResultDist[j];
                arrResultDist[j] = arrResultDist[i];
                arrResultDist[i] = SortTempResultDist;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x139;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x118;
    }
    i = 0;
    J0x215:
    // End:0x45d [While If]
    if(i < TrResult.TraceResultArray.Length)
    {
        TrData = TrResult.TraceResultArray[i];
        // End:0x453
        if(TrData.HitActor != none && TrData.HitActor != Instigator)
        {
            LastHitTrace = TrData.HitLocation;
            frange = VSize(TrData.HitLocation - Start);
            // End:0x2bd
            if(frange >= BaseParams.fDamRange_Max)
            {
                fRangeLerp = 1.0;
            }
            // End:0x31e
            else
            {
                // End:0x2e3
                if(frange <= BaseParams.fDamRange_Eff)
                {
                    fRangeLerp = 0.0;
                }
                // End:0x31e
                else
                {
                    fRangeLerp = frange - BaseParams.fDamRange_Eff / BaseParams.fDamRange_Max - BaseParams.fDamRange_Eff;
                }
            }
            // End:0x33a
            if(!TrData.HitActor.bWorldGeometry)
            {
            }
            // End:0x453
            else
            {
                // End:0x453
                if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
                {
                    ++ EffCnt;
                    DamageEff = DamageEff * 1.0 - BaseParams.fDamWallShot;
                    DamageOuter = DamageOuter * 1.0 - BaseParams.fDamWallShot;
                    WeaponAttachment(Weapon.ThirdPersonActor).FakeThirdPersonEffects(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                    // End:0x453
                    if(DamageEff * 1.0 - fRangeLerp + DamageOuter * fRangeLerp <= 10.0 || !TrData.HitActor.IsPenetrate())
                    {
                        WeaponAttachment(Weapon.ThirdPersonActor).FakeUpdateTracer(TrData.HitLocation);
                    }
                    // End:0x45d
                    else
                    {
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x215;
        }
    }
    // End:0x56d
    if(EffCnt > 1 && EffCnt <= 3)
    {
        ReverseTrResult = new class'BtrTraceResult';
        Weapon.MultiTrace(ReverseTrResult, Start, LastHitTrace, true, true);
        i = 0;
        J0x4ac:
        // End:0x56d [While If]
        if(i < ReverseTrResult.TraceResultArray.Length)
        {
            TrData = ReverseTrResult.TraceResultArray[i];
            // End:0x563
            if(TrData.HitActor != none && TrData.HitActor != Instigator)
            {
                // End:0x563
                if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
                {
                    WeaponAttachment(Weapon.ThirdPersonActor).FakeThirdPersonEffects(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4ac;
        }
    }
}

function DoTrace(Vector Start, Rotator Dir)
{
    local Vector X, End;
    local float DamageCurr, fDamageAmp;
    local int i, j;
    local BtrTraceResult TrResult;
    local ResultData TrData;
    local array<float> arrResultDist;
    local array<ResultData> arrVictim;
    local ResultData SortTempResult;
    local float SortTempResultDist;
    local ResultData Victim;
    local bool bHeadRound;
    local float frange, fRangeLerp;
    local int iTutorialZoomCheckID;

    MaxRange();
    X = vector(Dir);
    End = Start + TraceRange * X;
    TrResult = new class'BtrTraceResult';
    Weapon.MultiTrace(TrResult, End, Start, true, true);
    // End:0x72
    if(TrResult.TraceResultArray.Length == 0)
    {
        return;
    }
    arrResultDist.Insert(0, TrResult.TraceResultArray.Length);
    i = 0;
    J0x8f:
    // End:0xd7 [While If]
    if(i < arrResultDist.Length)
    {
        arrResultDist[i] = VSize(TrResult.TraceResultArray[i].HitLocation - Start);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8f;
    }
    i = 0;
    J0xde:
    // End:0x1d4 [While If]
    if(i < arrResultDist.Length - 1)
    {
        j = i + 1;
        J0xff:
        // End:0x1ca [While If]
        if(j < arrResultDist.Length)
        {
            // End:0x1c0
            if(arrResultDist[j] < arrResultDist[i])
            {
                SortTempResult = TrResult.TraceResultArray[j];
                TrResult.TraceResultArray[j] = TrResult.TraceResultArray[i];
                TrResult.TraceResultArray[i] = SortTempResult;
                SortTempResultDist = arrResultDist[j];
                arrResultDist[j] = arrResultDist[i];
                arrResultDist[i] = SortTempResultDist;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xff;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xde;
    }
    i = 0;
    J0x1db:
    // End:0x642 [While If]
    if(i < TrResult.TraceResultArray.Length)
    {
        TrData = TrResult.TraceResultArray[i];
        // End:0x638
        if(TrData.HitActor != none && TrData.HitActor != Instigator)
        {
            // End:0x5d7
            if(!TrData.HitActor.bWorldGeometry)
            {
                // End:0x37b
                if(TrData.CollisionPart == 17)
                {
                    // End:0x378
                    if(TrData.HitActor.IsA('wPawn') && Pawn(TrData.HitActor).TeamIndex != Instigator.TeamIndex)
                    {
                        bHeadRound = true;
                        j = 0;
                        J0x2b7:
                        // End:0x341 [While If]
                        if(j < TrResult.TraceResultArray.Length)
                        {
                            // End:0x337
                            if(j != i && TrData.HitActor == TrResult.TraceResultArray[j].HitActor && TrResult.TraceResultArray[j].CollisionPart >= 1)
                            {
                                bHeadRound = false;
                            }
                            // End:0x341
                            else
                            {
                                ++ j;
                                // This is an implied JumpToken; Continue!
                                goto J0x2b7;
                            }
                        }
                        // End:0x378
                        if(bHeadRound)
                        {
                            TrData.HitActor.TakeHeadRoundBullet(TrData.HitLocation, Weapon.WeaponType);
                        }
                    }
                }
                // End:0x638
                else
                {
                    // End:0x3b9
                    if(TrData.HitActor.IsA('wPawn'))
                    {
                        arrVictim.Insert(arrVictim.Length, 1);
                        arrVictim[arrVictim.Length - 1] = TrData;
                    }
                    // End:0x5d4
                    else
                    {
                        DamageCurr = float(BaseParams.iDamage + iPartsDamage);
                        // End:0x46e
                        if(TrData.HitActor.IsA('Vehicle') || !TrData.HitActor.IsA('Pawn') && !TrData.HitActor.IsA('HitScanBlockingVolume'))
                        {
                            WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                        }
                        // End:0x4e6
                        if(!Level.GetMatchMaker().BotTutorial)
                        {
                            TrData.HitActor.TakeDamage(int(DamageCurr), Instigator, TrData.HitLocation, Momentum * X, ResParams, TrData.CollisionPart, Weapon.WeaponType);
                        }
                        // End:0x5d1
                        else
                        {
                            // End:0x57a
                            if(TrData.HitActor.IsA('Mover'))
                            {
                                // End:0x524
                                if(wGun(Weapon).IsAiming())
                                {
                                    iTutorialZoomCheckID = 9999;
                                }
                                // End:0x52b
                                else
                                {
                                    iTutorialZoomCheckID = 0;
                                }
                                TrData.HitActor.TakeDamage(int(DamageCurr), Instigator, TrData.HitLocation, Momentum * X, ResParams, TrData.CollisionPart, iTutorialZoomCheckID);
                            }
                            // End:0x5d1
                            else
                            {
                                TrData.HitActor.TakeDamage(int(DamageCurr), Instigator, TrData.HitLocation, Momentum * X, ResParams, TrData.CollisionPart, Weapon.WeaponType);
                            }
                        }
                        // This is an implied JumpToken;
                        goto J0x642;
                    }
                    // This is an implied JumpToken;
                    goto J0x638;
                }
                // End:0x638
                if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
                {
                    WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                }
                // End:0x642
                else
                {
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1db;
        }
    }
    // End:0xb64 [While If]
    if(arrVictim.Length > 0)
    {
        Victim = arrVictim[0];
        i = 1;
        J0x662:
        // End:0x7ed [While If]
        if(i < arrVictim.Length)
        {
            // End:0x7e3
            if(Victim.HitActor == arrVictim[i].HitActor)
            {
                // End:0x78d
                if(Victim.CollisionPart == 4 || Victim.CollisionPart == 6 || Victim.CollisionPart == 5 || Victim.CollisionPart == 7 && arrVictim[i].CollisionPart != 0 && arrVictim[i].CollisionPart != 4 && arrVictim[i].CollisionPart != 6 && arrVictim[i].CollisionPart != 5 && arrVictim[i].CollisionPart != 7)
                {
                    Victim = arrVictim[i];
                }
                // End:0x7d0
                if(Victim.CollisionPart == 0 && arrVictim[i].CollisionPart != 0)
                {
                    Victim = arrVictim[i];
                }
                arrVictim.Remove(i, 1);
                -- i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x662;
        }
        switch(Victim.CollisionPart)
        {
            // End:0x80c
            case 0:
                fDamageAmp = 0.0;
                // End:0x8fa
                break;
            // End:0x828
            case 1:
                fDamageAmp = BaseParams.fDamPerc_Head;
                // End:0x8fa
                break;
            // End:0x844
            case 2:
                fDamageAmp = BaseParams.fDamPerc_UpperTorso;
                // End:0x8fa
                break;
            // End:0x860
            case 3:
                fDamageAmp = BaseParams.fDamPerc_LowerTorso;
                // End:0x8fa
                break;
            // End:0x865
            case 4:
            // End:0x881
            case 5:
                fDamageAmp = BaseParams.fDamPerc_UpperArm;
                // End:0x8fa
                break;
            // End:0x886
            case 6:
            // End:0x8a2
            case 7:
                fDamageAmp = BaseParams.fDamPerc_LowerArm;
                // End:0x8fa
                break;
            // End:0x8a7
            case 8:
            // End:0x8c3
            case 9:
                fDamageAmp = BaseParams.fDamPerc_UpperLeg;
                // End:0x8fa
                break;
            // End:0x8c8
            case 10:
            // End:0x8e4
            case 11:
                fDamageAmp = BaseParams.fDamPerc_LowerLeg;
                // End:0x8fa
                break;
            // End:0x8e9
            case 16:
            // End:0xffff
            default:
                fDamageAmp = 1.0;
                // End:0x8fa Break;
                break;
        }
        // End:0x939
        if(Victim.HitActor != none && Victim.HitActor.IsA('wHelicopter'))
        {
            fDamageAmp = BaseParams.fDamPerc_Heli;
        }
        frange = VSize(Victim.HitLocation - Start);
        // End:0x978
        if(frange >= BaseParams.fDamRange_Max)
        {
            fRangeLerp = 1.0;
        }
        // End:0x9d9
        else
        {
            // End:0x99e
            if(frange <= BaseParams.fDamRange_Eff)
            {
                fRangeLerp = 0.0;
            }
            // End:0x9d9
            else
            {
                fRangeLerp = frange - BaseParams.fDamRange_Eff / BaseParams.fDamRange_Max - BaseParams.fDamRange_Eff;
            }
        }
        DamageCurr = float(BaseParams.iDamage + iPartsDamage) * float(1) - fRangeLerp + float(BaseParams.iDam_OOR + iPartsDamage_Outer) * fRangeLerp;
        DamageCurr = DamageCurr * fDamageAmp;
        // End:0xb59
        if(DamageCurr > float(0))
        {
            // End:0xad9
            if(Victim.HitActor.IsA('Vehicle') || !Victim.HitActor.IsA('Pawn') && !Victim.HitActor.IsA('HitScanBlockingVolume'))
            {
                WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(Victim.HitActor, Victim.HitLocation, Victim.HitNormal, Victim.HitMaterial);
            }
            DamageLog(Pawn(Victim.HitActor), DamageCurr, frange, Victim.CollisionPart);
            Victim.HitActor.TakeDamage(int(DamageCurr), Instigator, Victim.HitLocation, Momentum * X, ResParams, Victim.CollisionPart, Weapon.WeaponType);
        }
        arrVictim.Remove(0, 1);
        // This is an implied JumpToken; Continue!
        goto J0x642;
    }
}

function FlashMuzzleFlash()
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x24
    if(G.bSilencer)
    {
        return;
    }
    super.FlashMuzzleFlash();
}

simulated function wLoadOut()
{
    super.wLoadOut();
    Momentum = BaseParams.fMomentum;
    Momentum_Pawn = BaseParams.fMomentum_Pawn;
    sound_Fire_Silencer = ResParams.default.sound_Fire_Silencer;
    // End:0x7b
    if(ResParams.default.szClass_Smoke_Silencer_1st != "")
    {
        SilencerSmokeEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_Silencer_1st, class'Class'));
    }
    SetSpreadStance(1);
}

simulated function InitEffects()
{
    // End:0x36
    if(Level.NetMode == 1 || AIController(Instigator.Controller) != none)
    {
        return;
    }
    super.InitEffects();
    // End:0x7f
    if(SilencerSmokeEmitterClass != none && SilencerSmokeEmitter == none || SmokeEmitter.bDeleteMe)
    {
        SilencerSmokeEmitter = Weapon.Spawn(SilencerSmokeEmitterClass);
    }
    // End:0xa3
    if(FlashEmitter != none)
    {
        Weapon.AttachToBone(FlashEmitter, 'tip');
    }
}

simulated function DestroyEffects()
{
    super.DestroyEffects();
    // End:0x1d
    if(SilencerSmokeEmitter != none)
    {
        SilencerSmokeEmitter.Destroy();
    }
}

function DrawMuzzleFlash(Canvas Canvas)
{
    // End:0x61
    if(SilencerSmokeEmitter != none && SilencerSmokeEmitter.Base != Weapon)
    {
        SilencerSmokeEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(SilencerSmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    super.DrawMuzzleFlash(Canvas);
}

function StartMuzzleSmoke()
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x5f
    if(G.bSilencer)
    {
        // End:0x5c
        if(!Level.bDropDetail && SilencerSmokeEmitter != none)
        {
            SilencerSmokeEmitter.Trigger(Weapon, Instigator);
        }
    }
    // End:0x65
    else
    {
        super.StartMuzzleSmoke();
    }
}

function SetSpreadStance(wWeaponFire.ESpreadStance ss)
{
    super.SetSpreadStance(ss);
    switch(SpreadStance)
    {
        // End:0x1a
        case 0:
            // End:0xe9
            break;
        // End:0x5e
        case 1:
            fSpread_Min = BaseParams.fSpread_Stand_Min;
            fSpread_Max = BaseParams.fSpread_Stand_Max;
            fSpreadReduce_Normal = BaseParams.fSpread_Stand_Reduce;
            // End:0xe9
            break;
        // End:0xa2
        case 2:
            fSpread_Min = BaseParams.fSpread_Ducked_Min;
            fSpread_Max = BaseParams.fSpread_Ducked_Max;
            fSpreadReduce_Normal = BaseParams.fSpread_Ducked_Reduce;
            // End:0xe9
            break;
        // End:0xe6
        case 3:
            fSpread_Min = BaseParams.fSpread_Prone_Min;
            fSpread_Max = BaseParams.fSpread_Prone_Max;
            fSpreadReduce_Normal = BaseParams.fSpread_Prone_Reduce;
            // End:0xe9
            break;
        // End:0xffff
        default:
            // End:0x13c
            if(Instigator != none)
            {
                // End:0x13c
                if(Instigator.Role != 4 && Instigator.Role != 3)
                {
                    Instigator.ServerStanceChanged(SpreadStance);
                }
            }
}

function CalcSpread()
{
    local float fSpreadMin, fSpreadMax;

    // End:0x73
    if(Instigator.Physics == 2 || Instigator.Physics == 11)
    {
        fSpreadMin = BaseParams.fSpread_Jump;
        fSpreadMax = BaseParams.fSpread_Jump;
        fSpreadReduce = BaseParams.fSpread_Stand_Reduce;
    }
    // End:0x94
    else
    {
        fSpreadMin = fSpread_Min;
        fSpreadMax = fSpread_Max;
        fSpreadReduce = fSpreadReduce_Normal;
    }
    // End:0x14b
    if(BaseParams.iSpread_2nd_StartNum > 0)
    {
        // End:0xfe
        if(FireCount >= BaseParams.iSpread_2nd_StartNum)
        {
            // End:0xe7
            if(bIsFiring == true)
            {
                fSpreadMin = fSpreadMin + BaseParams.fSpread_2nd_Add;
            }
            fSpread_2nd_Max_Curr = BaseParams.fSpread_2nd_Max;
        }
        // End:0x139
        else
        {
            fSpread_2nd_Max_Curr = fSpread_2nd_Max_Curr - fSpreadReduce * Level.TimeSeconds - fLastRecoilReduceTime;
            fSpread_2nd_Max_Curr = FMax(0.0, fSpread_2nd_Max_Curr);
        }
        fSpreadMax = fSpreadMax + fSpread_2nd_Max_Curr;
    }
    // End:0x1ba
    if(wGun(Weapon).AimState == 2 && Weapon.WeaponType == 6)
    {
        fSpreadMin = fSpreadMin * BaseParams.fSpread_Shotgun;
        fSpreadMax = fSpreadMax * BaseParams.fSpread_Shotgun;
    }
    // End:0x214
    if(Instigator.Acceleration != vect(0.0, 0.0, 0.0))
    {
        // End:0x214
        if(Spread < fSpreadMin + BaseParams.fSpread_Move_Add)
        {
            Spread = fSpreadMin + BaseParams.fSpread_Move_Add;
        }
    }
    Spread = FClamp(Spread, fSpreadMin, fSpreadMax);
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawText(" / IsFiringBustMode :" $ string(IsFiringBustMode) $ " / iFireCount : " $ string(iFireCount) $ " / bFire : " $ string(Instigator.Controller.bFire));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

function MakeFireNoise()
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x24
    if(G.bSilencer)
    {
        return;
    }
    super.MakeFireNoise();
}

defaultproperties
{
    DamageType=class'DamageType'
    TraceRange=10000.0
    Momentum=1.0
    HeadShotExtent=50.0
    Aim_FireAnim=Ads_Fire
    Aim_FireLoopAnim=Ads_Fire
    Aim_FireAnimRate=1.0
    Aim_FireLoopAnimRate=1.0
    bMakeRadarNoise=true
}