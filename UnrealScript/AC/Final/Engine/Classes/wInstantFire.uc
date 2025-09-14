class wInstantFire extends wWeaponFire
    native;

var Class<DamageType> DamageType;
var float TraceRange;
var float Momentum;
var float Momentum_Pawn;
var float HeadShotExtent;
var() name Aim_FireAnim;
var() name Aim_FireLoopAnim;
var() float Aim_FireAnimRate;
var() float Aim_FireLoopAnimRate;
var() Class<wEmitter> SilencerSmokeEmitterClass;
var() wEmitter SilencerSmokeEmitter;
var bool bToggleSlot;
var float fSpread_Weapon;
var float fSpread_Char;
var float fSpread_Min;
var float fSpread_Max;
var float fSpreadReduce;
var float fSpreadReduce_Normal;
var float fLastRecoilReduceTime;
var string fSound_Fire_Silencer;
var float fSpread_2nd_Max_Curr;

event ModeDoFire()
{
    super.ModeDoFire();
    Spread = Spread + BaseParams.fSpread_Fire_Add;
    CalcSpread();
    //return;    
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
    if(int(Weapon.MeleeState) == int(1))
    {
        Weapon.ClientStopFire(ThisModeNum);
        return false;
    }
    PC = PlayerController(Instigator.Controller);
    // End:0x104
    if(PC != none)
    {
        // End:0xCB
        if((int(PC.bySprintState) == 1) || int(PC.bySprintState) == 2)
        {
            return false;            
        }
        else
        {
            // End:0x104
            if(int(PC.bySprintState) == 3)
            {
                PC.bySprintState = 0;
                PC.bFire = 0;
            }
        }
    }
    Log(((("Weapon.AmmoAmount(ThisModeNum) = " @ string(Weapon.AmmoAmount(ThisModeNum))) $ " ") $ "AmmoPerFire = ") @ string(AmmoPerFire));
    return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
    //return;    
}

function PlayFiring()
{
    local name locFireAnim, locFireLoopAnim;
    local float locFireAnimRate, locFireLoopAnimRate;
    local wGun G;
    local bool bSkipAnim;

    bSkipAnim = false;
    G = wGun(Weapon);
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
        // End:0x105
        if(int(Weapon.WeaponType) == int(Weapon.18))
        {
            WeaponAttachment(Weapon.ThirdPersonActor).LoopWeaponAnim(FireAnim, locFireAnimRate, 0.0000000, 0);            
        }
        else
        {
            // End:0x19D
            if((Weapon.Mesh != none) && bSkipAnim == false)
            {
                // End:0x182
                if(FireCount > 0)
                {
                    // End:0x164
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
        }
        // End:0x1DA
        if(G.bSilencer)
        {
            FmodFireSound = ResParams.default.fSound_Fire_Silencer;
            FmodFireSound_Stereo = ResParams.default.fSound_Fire_Silencer;            
        }
        else
        {
            FmodFireSound = ResParams.default.fsound_Fire;
            FmodFireSound_Stereo = ResParams.default.fsound_Fire_Stereo;
        }
        Instigator.FmodPlaySoundUseID(FmodFireSound_Stereo, 0, FireAnimRate,, false,, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x288
        if(int(Weapon.Role) == int(ROLE_Authority))
        {
            Instigator.FmodPlaySound(FmodFireSound, 0, FireAnimRate,, false,,, true);
        }
        bToggleSlot = !bToggleSlot;
        ClientPlayForceFeedback(FireForce);
        FireCount++;
        Weapon.SetRandFiringSwayRot();
        //return;        
    }
}

function ServerPlayFiring()
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x4D
    if(G.bSilencer)
    {
        FmodFireSound = ResParams.default.fSound_Fire_Silencer;
        FmodFireSound_Stereo = ResParams.default.fSound_Fire_Silencer;        
    }
    else
    {
        FmodFireSound = ResParams.default.fsound_Fire;
        FmodFireSound_Stereo = ResParams.default.fsound_Fire_Stereo;
    }
    Instigator.FmodSpecPlaySound(FmodFireSound_Stereo, 0,,, false);
    Instigator.FmodPlaySound(FmodFireSound, 0,,, true,,, true);
    //return;    
}

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

event ModeTick(float dt)
{
    Spread = Spread - (fSpreadReduce * (Level.TimeSeconds - fLastRecoilReduceTime));
    CalcSpread();
    fLastRecoilReduceTime = Level.TimeSeconds;
    // End:0x91
    if(bIsFiring)
    {
        // End:0x91
        if((int(Instigator.Controller.bFire) == 0) && int(wGun(Weapon).IsRechambering()) == 0)
        {
            bReleasedFiring = true;
        }
    }
    //return;    
}

function DoFireEffect()
{
    local Vector StartTrace;
    local Rotator R, Aim;
    local Coords startCoords;
    local int i;

    Instigator.MakeNoise(3.0000000);
    // End:0x6E
    if(int(Instigator.18) == int(Instigator.TypeOfWeapon))
    {
        startCoords = WeaponAttachment(Weapon.ThirdPersonActor).GetBoneCoords('Bone_GunPoint');
        StartTrace = startCoords.Origin;        
    }
    else
    {
        StartTrace = Instigator.Location + Instigator.EyePosition();
    }
    Aim = AdjustAim(StartTrace, AimError);
    // End:0x1F3
    if(Weapon.IsA('wGun'))
    {
        // End:0x1D2
        if((int(wGun(Weapon).AimState) == int(2)) && int(Weapon.WeaponType) != int(6))
        {
            // End:0x14B
            if((int(Instigator.Physics) == int(2)) || int(Instigator.Physics) == int(11))
            {
                R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));                
            }
            else
            {
                // End:0x1C0
                if(Instigator.Acceleration != vect(0.0000000, 0.0000000, 0.0000000))
                {
                    Spread = (BaseParams.fRunSpeed / BaseParams.fAimRunSpeed) * BaseParams.fSpread_Aim_move_add;
                    R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));                    
                }
                else
                {
                    R = Rotator(Vector(Aim));
                }
            }            
        }
        else
        {
            R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));
        }        
    }
    else
    {
        R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));
    }
    // End:0x22E
    if(Weapon.wt_TestAim)
    {
        R = Aim;
    }
    // End:0x25F
    if(!Level.GetMatchMaker().BotTutorial)
    {
        DoTraceNative(StartTrace, R);        
    }
    else
    {
        DoTrace(StartTrace, R);
    }
    //return;    
}

// Export UwInstantFire::execDoTraceNative(FFrame&, void* const)
native function DoTraceNative(Vector Start, Rotator Dir)
{
    //native.Start;
    //native.Dir;        
}

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
        if((int(wGun(Weapon).AimState) == int(2)) && int(Weapon.WeaponType) != int(6))
        {
            // End:0xDD
            if((int(Instigator.Physics) == int(2)) || int(Instigator.Physics) == int(11))
            {
                R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));                
            }
            else
            {
                // End:0x152
                if(Instigator.Acceleration != vect(0.0000000, 0.0000000, 0.0000000))
                {
                    Spread = (BaseParams.fRunSpeed / BaseParams.fAimRunSpeed) * BaseParams.fSpread_Aim_move_add;
                    R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));                    
                }
                else
                {
                    R = Rotator(Vector(Aim));
                }
            }            
        }
        else
        {
            R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));
        }        
    }
    else
    {
        R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));
    }
    DoTraceForClient(StartTrace, R);
    //return;    
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
    X = Vector(Dir);
    End = Start + (TraceRange * X);
    TrResult = new Class'Engine_Decompressed.BtrTraceResult';
    Weapon.MultiTrace(TrResult, End, Start, true, true);
    // End:0xAC
    if(TrResult.TraceResultArray.Length == 0)
    {
        return;
    }
    arrResultDist.Insert(0, TrResult.TraceResultArray.Length);
    i = 0;
    J0xC9:

    // End:0x111 [Loop If]
    if(i < arrResultDist.Length)
    {
        arrResultDist[i] = VSize(TrResult.TraceResultArray[i].HitLocation - Start);
        i++;
        // [Loop Continue]
        goto J0xC9;
    }
    i = 0;
    J0x118:

    // End:0x20E [Loop If]
    if(i < (arrResultDist.Length - 1))
    {
        j = i + 1;
        J0x139:

        // End:0x204 [Loop If]
        if(j < arrResultDist.Length)
        {
            // End:0x1FA
            if(arrResultDist[j] < arrResultDist[i])
            {
                SortTempResult = TrResult.TraceResultArray[j];
                TrResult.TraceResultArray[j] = TrResult.TraceResultArray[i];
                TrResult.TraceResultArray[i] = SortTempResult;
                SortTempResultDist = arrResultDist[j];
                arrResultDist[j] = arrResultDist[i];
                arrResultDist[i] = SortTempResultDist;
            }
            j++;
            // [Loop Continue]
            goto J0x139;
        }
        i++;
        // [Loop Continue]
        goto J0x118;
    }
    i = 0;
    J0x215:

    // End:0x479 [Loop If]
    if(i < TrResult.TraceResultArray.Length)
    {
        TrData = TrResult.TraceResultArray[i];
        // End:0x46F
        if((TrData.HitActor != none) && TrData.HitActor != Instigator)
        {
            LastHitTrace = TrData.HitLocation;
            frange = VSize(TrData.HitLocation - Start);
            // End:0x2BD
            if(frange >= BaseParams.fDamRange_Max)
            {
                fRangeLerp = 1.0000000;                
            }
            else
            {
                // End:0x2E3
                if(frange <= BaseParams.fDamRange_Eff)
                {
                    fRangeLerp = 0.0000000;                    
                }
                else
                {
                    fRangeLerp = (frange - BaseParams.fDamRange_Eff) / (BaseParams.fDamRange_Max - BaseParams.fDamRange_Eff);
                }
            }
            // End:0x356
            if(!TrData.HitActor.bWorldGeometry && TrData.HitActor.bForceCollision == false)
            {
                // [Explicit Continue]
                goto J0x46F;
            }
            // End:0x46F
            if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
            {
                EffCnt++;
                DamageEff = DamageEff * (1.0000000 - BaseParams.fDamWallShot);
                DamageOuter = DamageOuter * (1.0000000 - BaseParams.fDamWallShot);
                WeaponAttachment(Weapon.ThirdPersonActor).FakeThirdPersonEffects(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                // End:0x46F
                if((((DamageEff * (1.0000000 - fRangeLerp)) + (DamageOuter * fRangeLerp)) <= 10.0000000) || !TrData.HitActor.IsPenetrate())
                {
                    WeaponAttachment(Weapon.ThirdPersonActor).FakeUpdateTracer(TrData.HitLocation);
                    // [Explicit Break]
                    goto J0x479;
                }
            }
        }
        J0x46F:

        i++;
        // [Loop Continue]
        goto J0x215;
    }
    J0x479:

    // End:0x589
    if((EffCnt > 1) && EffCnt <= 3)
    {
        ReverseTrResult = new Class'Engine_Decompressed.BtrTraceResult';
        Weapon.MultiTrace(ReverseTrResult, Start, LastHitTrace, true, true);
        i = 0;
        J0x4C8:

        // End:0x589 [Loop If]
        if(i < ReverseTrResult.TraceResultArray.Length)
        {
            TrData = ReverseTrResult.TraceResultArray[i];
            // End:0x57F
            if((TrData.HitActor != none) && TrData.HitActor != Instigator)
            {
                // End:0x57F
                if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
                {
                    WeaponAttachment(Weapon.ThirdPersonActor).FakeThirdPersonEffects(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                }
            }
            i++;
            // [Loop Continue]
            goto J0x4C8;
        }
    }
    //return;    
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
    X = Vector(Dir);
    End = Start + (TraceRange * X);
    TrResult = new Class'Engine_Decompressed.BtrTraceResult';
    Weapon.MultiTrace(TrResult, End, Start, true, true);
    // End:0x72
    if(TrResult.TraceResultArray.Length == 0)
    {
        return;
    }
    arrResultDist.Insert(0, TrResult.TraceResultArray.Length);
    i = 0;
    J0x8F:

    // End:0xD7 [Loop If]
    if(i < arrResultDist.Length)
    {
        arrResultDist[i] = VSize(TrResult.TraceResultArray[i].HitLocation - Start);
        i++;
        // [Loop Continue]
        goto J0x8F;
    }
    i = 0;
    J0xDE:

    // End:0x1D4 [Loop If]
    if(i < (arrResultDist.Length - 1))
    {
        j = i + 1;
        J0xFF:

        // End:0x1CA [Loop If]
        if(j < arrResultDist.Length)
        {
            // End:0x1C0
            if(arrResultDist[j] < arrResultDist[i])
            {
                SortTempResult = TrResult.TraceResultArray[j];
                TrResult.TraceResultArray[j] = TrResult.TraceResultArray[i];
                TrResult.TraceResultArray[i] = SortTempResult;
                SortTempResultDist = arrResultDist[j];
                arrResultDist[j] = arrResultDist[i];
                arrResultDist[i] = SortTempResultDist;
            }
            j++;
            // [Loop Continue]
            goto J0xFF;
        }
        i++;
        // [Loop Continue]
        goto J0xDE;
    }
    i = 0;
    J0x1DB:

    // End:0x642 [Loop If]
    if(i < TrResult.TraceResultArray.Length)
    {
        TrData = TrResult.TraceResultArray[i];
        // End:0x638
        if((TrData.HitActor != none) && TrData.HitActor != Instigator)
        {
            // End:0x5D7
            if(!TrData.HitActor.bWorldGeometry)
            {
                // End:0x37B
                if(int(TrData.CollisionPart) == int(17))
                {
                    // End:0x378
                    if(TrData.HitActor.IsA('wPawn') && Pawn(TrData.HitActor).TeamIndex != Instigator.TeamIndex)
                    {
                        bHeadRound = true;
                        j = 0;
                        J0x2B7:

                        // End:0x341 [Loop If]
                        if(j < TrResult.TraceResultArray.Length)
                        {
                            // End:0x337
                            if(((j != i) && TrData.HitActor == TrResult.TraceResultArray[j].HitActor) && int(TrResult.TraceResultArray[j].CollisionPart) >= 1)
                            {
                                bHeadRound = false;
                                // [Explicit Break]
                                goto J0x341;
                            }
                            j++;
                            // [Loop Continue]
                            goto J0x2B7;
                        }
                        J0x341:

                        // End:0x378
                        if(bHeadRound)
                        {
                            TrData.HitActor.TakeHeadRoundBullet(TrData.HitLocation, int(Weapon.WeaponType));
                        }
                    }
                    // [Explicit Continue]
                    goto J0x638;
                }
                // End:0x3B9
                if(TrData.HitActor.IsA('wPawn'))
                {
                    arrVictim.Insert(arrVictim.Length, 1);
                    arrVictim[arrVictim.Length - 1] = TrData;                    
                }
                else
                {
                    DamageCurr = float(BaseParams.iDamage + iPartsDamage);
                    // End:0x46E
                    if(TrData.HitActor.IsA('Vehicle') || !TrData.HitActor.IsA('Pawn') && !TrData.HitActor.IsA('HitScanBlockingVolume'))
                    {
                        WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                    }
                    // End:0x4E6
                    if(!Level.GetMatchMaker().BotTutorial)
                    {
                        TrData.HitActor.TakeDamage(int(DamageCurr), Instigator, TrData.HitLocation, Momentum * X, ResParams, int(TrData.CollisionPart), int(Weapon.WeaponType));                        
                    }
                    else
                    {
                        // End:0x57A
                        if(TrData.HitActor.IsA('Mover'))
                        {
                            // End:0x524
                            if(wGun(Weapon).IsAiming())
                            {
                                iTutorialZoomCheckID = 9999;                                
                            }
                            else
                            {
                                iTutorialZoomCheckID = 0;
                            }
                            TrData.HitActor.TakeDamage(int(DamageCurr), Instigator, TrData.HitLocation, Momentum * X, ResParams, int(TrData.CollisionPart), iTutorialZoomCheckID);                            
                        }
                        else
                        {
                            TrData.HitActor.TakeDamage(int(DamageCurr), Instigator, TrData.HitLocation, Momentum * X, ResParams, int(TrData.CollisionPart), int(Weapon.WeaponType));
                        }
                    }
                    // [Explicit Break]
                    goto J0x642;
                }
                // [Explicit Continue]
                goto J0x638;
            }
            // End:0x638
            if(WeaponAttachment(Weapon.ThirdPersonActor) != none)
            {
                WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(TrData.HitActor, TrData.HitLocation, TrData.HitNormal, TrData.HitMaterial);
                // [Explicit Break]
                goto J0x642;
            }
        }
        J0x638:

        i++;
        // [Loop Continue]
        goto J0x1DB;
    }
    J0x642:

    // End:0xA30 [Loop If]
    if(arrVictim.Length > 0)
    {
        Victim = arrVictim[0];
        i = 1;
        J0x662:

        // End:0x7ED [Loop If]
        if(i < arrVictim.Length)
        {
            // End:0x7E3
            if(Victim.HitActor == arrVictim[i].HitActor)
            {
                // End:0x78D
                if(((((int(Victim.CollisionPart) == int(4)) || int(Victim.CollisionPart) == int(6)) || int(Victim.CollisionPart) == int(5)) || int(Victim.CollisionPart) == int(7)) && ((((int(arrVictim[i].CollisionPart) != int(0)) && int(arrVictim[i].CollisionPart) != int(4)) && int(arrVictim[i].CollisionPart) != int(6)) && int(arrVictim[i].CollisionPart) != int(5)) && int(arrVictim[i].CollisionPart) != int(7))
                {
                    Victim = arrVictim[i];
                }
                // End:0x7D0
                if((int(Victim.CollisionPart) == int(0)) && int(arrVictim[i].CollisionPart) != int(0))
                {
                    Victim = arrVictim[i];
                }
                arrVictim.Remove(i, 1);
                i--;
            }
            i++;
            // [Loop Continue]
            goto J0x662;
        }
        fDamageAmp = GetCollisionPartsDamage(int(Victim.CollisionPart));
        frange = VSize(Victim.HitLocation - Start);
        // End:0x844
        if(frange >= BaseParams.fDamRange_Max)
        {
            fRangeLerp = 1.0000000;            
        }
        else
        {
            // End:0x86A
            if(frange <= BaseParams.fDamRange_Eff)
            {
                fRangeLerp = 0.0000000;                
            }
            else
            {
                fRangeLerp = (frange - BaseParams.fDamRange_Eff) / (BaseParams.fDamRange_Max - BaseParams.fDamRange_Eff);
            }
        }
        DamageCurr = (float(BaseParams.iDamage + iPartsDamage) * (float(1) - fRangeLerp)) + (float(BaseParams.iDam_OOR + iPartsDamage_Outer) * fRangeLerp);
        DamageCurr = DamageCurr * fDamageAmp;
        // End:0xA25
        if(DamageCurr > float(0))
        {
            // End:0x9A5
            if(Victim.HitActor.IsA('Vehicle') || !Victim.HitActor.IsA('Pawn') && !Victim.HitActor.IsA('HitScanBlockingVolume'))
            {
                WeaponAttachment(Weapon.ThirdPersonActor).UpdateHit(Victim.HitActor, Victim.HitLocation, Victim.HitNormal, Victim.HitMaterial);
            }
            DamageLog(Pawn(Victim.HitActor), DamageCurr, frange, Victim.CollisionPart);
            Victim.HitActor.TakeDamage(int(DamageCurr), Instigator, Victim.HitLocation, Momentum * X, ResParams, int(Victim.CollisionPart), int(Weapon.WeaponType));
        }
        arrVictim.Remove(0, 1);
        // [Loop Continue]
        goto J0x642;
    }
    //return;    
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
    //return;    
}

simulated function wLoadOut()
{
    super.wLoadOut();
    Momentum = BaseParams.fMomentum;
    Momentum_Pawn = BaseParams.fMomentum_Pawn;
    fSound_Fire_Silencer = ResParams.default.fSound_Fire_Silencer;
    // End:0x7B
    if(ResParams.default.szClass_Smoke_Silencer_1st != "")
    {
        SilencerSmokeEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_Silencer_1st, Class'Core.Class'));
    }
    SetSpreadStance(1);
    //return;    
}

simulated function InitEffects()
{
    // End:0x36
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
    {
        return;
    }
    super.InitEffects();
    // End:0x7F
    if((SilencerSmokeEmitterClass != none) && (SilencerSmokeEmitter == none) || SmokeEmitter.bDeleteMe)
    {
        SilencerSmokeEmitter = Weapon.Spawn(SilencerSmokeEmitterClass);
    }
    // End:0xA3
    if(FlashEmitter != none)
    {
        Weapon.AttachToBone(FlashEmitter, 'tip');
    }
    //return;    
}

simulated function DestroyEffects()
{
    super.DestroyEffects();
    // End:0x1D
    if(SilencerSmokeEmitter != none)
    {
        SilencerSmokeEmitter.Destroy();
    }
    //return;    
}

function DrawMuzzleFlash(Canvas Canvas)
{
    // End:0x61
    if((SilencerSmokeEmitter != none) && SilencerSmokeEmitter.Base != Weapon)
    {
        SilencerSmokeEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(SilencerSmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    super.DrawMuzzleFlash(Canvas);
    //return;    
}

function StartMuzzleSmoke()
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x5F
    if(G.bSilencer)
    {
        // End:0x5C
        if(!Level.bDropDetail && SilencerSmokeEmitter != none)
        {
            SilencerSmokeEmitter.Trigger(Weapon, Instigator);
        }        
    }
    else
    {
        super.StartMuzzleSmoke();
    }
    //return;    
}

function SetSpreadStance(wWeaponFire.ESpreadStance ss)
{
    super.SetSpreadStance(ss);
    switch(SpreadStance)
    {
        // End:0x1A
        case 0:
            // End:0xE9
            break;
        // End:0x5E
        case 1:
            fSpread_Min = BaseParams.fSpread_Stand_Min;
            fSpread_Max = BaseParams.fSpread_Stand_Max;
            fSpreadReduce_Normal = BaseParams.fSpread_Stand_Reduce;
            // End:0xE9
            break;
        // End:0xA2
        case 2:
            fSpread_Min = BaseParams.fSpread_Ducked_Min;
            fSpread_Max = BaseParams.fSpread_Ducked_Max;
            fSpreadReduce_Normal = BaseParams.fSpread_Ducked_Reduce;
            // End:0xE9
            break;
        // End:0xE6
        case 3:
            fSpread_Min = BaseParams.fSpread_Prone_Min;
            fSpread_Max = BaseParams.fSpread_Prone_Max;
            fSpreadReduce_Normal = BaseParams.fSpread_Prone_Reduce;
            // End:0xE9
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x13C
    if(Instigator != none)
    {
        // End:0x13C
        if((int(Instigator.Role) != int(ROLE_Authority)) && int(Instigator.Role) != int(ROLE_AutonomousProxy))
        {
            Instigator.ServerStanceChanged(SpreadStance);
        }
    }
    //return;    
}

function CalcSpread()
{
    local float fSpreadMin, fSpreadMax;

    // End:0x73
    if((int(Instigator.Physics) == int(2)) || int(Instigator.Physics) == int(11))
    {
        fSpreadMin = BaseParams.fSpread_Jump;
        fSpreadMax = BaseParams.fSpread_Jump;
        fSpreadReduce = BaseParams.fSpread_Stand_Reduce;        
    }
    else
    {
        fSpreadMin = fSpread_Min;
        fSpreadMax = fSpread_Max;
        fSpreadReduce = fSpreadReduce_Normal;
    }
    // End:0x14B
    if(BaseParams.iSpread_2nd_StartNum > 0)
    {
        // End:0xFE
        if(FireCount >= BaseParams.iSpread_2nd_StartNum)
        {
            // End:0xE7
            if(bIsFiring == true)
            {
                fSpreadMin = fSpreadMin + BaseParams.fSpread_2nd_Add;
            }
            fSpread_2nd_Max_Curr = BaseParams.fSpread_2nd_Max;            
        }
        else
        {
            fSpread_2nd_Max_Curr = fSpread_2nd_Max_Curr - (fSpreadReduce * (Level.TimeSeconds - fLastRecoilReduceTime));
            fSpread_2nd_Max_Curr = FMax(0.0000000, fSpread_2nd_Max_Curr);
        }
        fSpreadMax = fSpreadMax + fSpread_2nd_Max_Curr;
    }
    // End:0x1BA
    if((int(wGun(Weapon).AimState) == int(2)) && int(Weapon.WeaponType) == int(6))
    {
        fSpreadMin = fSpreadMin * BaseParams.fSpread_Shotgun;
        fSpreadMax = fSpreadMax * BaseParams.fSpread_Shotgun;
    }
    // End:0x214
    if(Instigator.Acceleration != vect(0.0000000, 0.0000000, 0.0000000))
    {
        // End:0x214
        if(Spread < (fSpreadMin + BaseParams.fSpread_Move_Add))
        {
            Spread = fSpreadMin + BaseParams.fSpread_Move_Add;
        }
    }
    Spread = FClamp(Spread, fSpreadMin, fSpreadMax);
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.DrawText(((((" / IsFiringBustMode :" $ string(IsFiringBustMode)) $ " / iFireCount : ") $ string(iFireCount)) $ " / bFire : ") $ string(Instigator.Controller.bFire));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
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
    //return;    
}

defaultproperties
{
    DamageType=Class'Engine_Decompressed.DamageType'
    TraceRange=10000.0000000
    Momentum=1.0000000
    HeadShotExtent=50.0000000
    Aim_FireAnim="Ads_Fire"
    Aim_FireLoopAnim="Ads_Fire"
    Aim_FireAnimRate=1.0000000
    Aim_FireLoopAnimRate=1.0000000
    bMakeRadarNoise=true
}