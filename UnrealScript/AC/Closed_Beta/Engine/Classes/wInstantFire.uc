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
var Sound sound_Fire_Silencer;

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

    // End:0x1F
    if(!Instigator.Controller.AllowFire())
    {
        return false;
    }
    // End:0x4E
    if(int(Weapon.MeleeState) == int(1))
    {
        Weapon.ClientStopFire(ThisModeNum);
        return false;
    }
    PC = PlayerController(Instigator.Controller);
    // End:0xDF
    if(PC != none)
    {
        // End:0xA6
        if((int(PC.bySprintState) == 1) || int(PC.bySprintState) == 2)
        {
            return false;            
        }
        else
        {
            // End:0xDF
            if(int(PC.bySprintState) == 3)
            {
                PC.bySprintState = 0;
                PC.bFire = 0;
            }
        }
    }
    // End:0x192
    if(bEnableBustMode)
    {
        // End:0x129
        if(iFireCount >= iFireRBC)
        {
            // End:0x127
            if(bool(Instigator.Controller.bFire))
            {
                Weapon.ClientStopFire(ThisModeNum);
            }
            return false;
        }
        // End:0x15E
        if(((iFireCount > 0) && IsFiringBustMode) && NextFireTime > Level.TimeSeconds)
        {
            return false;            
        }
        else
        {
            // End:0x192
            if(((iFireCount == 0) && !IsFiringBustMode) && NextFireTime > Level.TimeSeconds)
            {
                return false;
            }
        }
    }
    Log(((((" / IsFiringBustMode :" $ string(IsFiringBustMode)) $ " / iFireCount : ") $ string(iFireCount)) $ " / bFire : ") $ string(Instigator.Controller.bFire));
    return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
    //return;    
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
        // End:0x19C
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
        Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
        // End:0x281
        if(int(Weapon.Role) == int(ROLE_Authority))
        {
            Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
        }
        bToggleSlot = !bToggleSlot;
        ClientPlayForceFeedback(FireForce);
        FireCount++;
        //return;        
    }
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
    else
    {
        FireSound = ResParams.default.sound_Fire;
        FireSound_Stereo = ResParams.default.sound_Fire_Stereo;
        fFireSoundRad = ResParams.default.rad_Fire;
    }
    Instigator.SpecPlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, fFireSoundRad,, false);
    Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, fFireSoundRad,, true,,, true);
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
    // End:0xC3
    if(bEnableBustMode)
    {
        // End:0x94
        if(iFireCount >= iFireRBC)
        {
            // End:0x94
            if(Instigator.IsLocallyControlled() && !bool(Instigator.Controller.bFire))
            {
                iFireCount = 0;
            }
        }
        // End:0xBB
        if((iFireCount > 0) && iFireCount < iFireRBC)
        {
            IsFiringBustMode = true;            
        }
        else
        {
            IsFiringBustMode = false;
        }
    }
    //return;    
}

function DoFireEffect()
{
    local Vector StartTrace;
    local Rotator R, Aim;

    Instigator.MakeNoise(ResParams.default.rad_Fire / 100.0000000);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    Aim = AdjustAim(StartTrace, AimError);
    // End:0x18B
    if(Weapon.IsA('wGun'))
    {
        // End:0x16A
        if(int(wGun(Weapon).AimState) == int(2))
        {
            // End:0xE3
            if((int(Instigator.Physics) == int(2)) || int(Instigator.Physics) == int(11))
            {
                R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));                
            }
            else
            {
                // End:0x158
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
    // End:0x1C6
    if(Weapon.wt_TestAim)
    {
        R = Aim;
    }
    // End:0x1F7
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
    TrResult = new Class'Engine.BtrTraceResult';
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

    // End:0xB64 [Loop If]
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
        switch(Victim.CollisionPart)
        {
            // End:0x80C
            case 0:
                fDamageAmp = 0.0000000;
                // End:0x8FA
                break;
            // End:0x828
            case 1:
                fDamageAmp = BaseParams.fDamPerc_Head;
                // End:0x8FA
                break;
            // End:0x844
            case 2:
                fDamageAmp = BaseParams.fDamPerc_UpperTorso;
                // End:0x8FA
                break;
            // End:0x860
            case 3:
                fDamageAmp = BaseParams.fDamPerc_LowerTorso;
                // End:0x8FA
                break;
            // End:0x865
            case 4:
            // End:0x881
            case 5:
                fDamageAmp = BaseParams.fDamPerc_UpperArm;
                // End:0x8FA
                break;
            // End:0x886
            case 6:
            // End:0x8A2
            case 7:
                fDamageAmp = BaseParams.fDamPerc_LowerArm;
                // End:0x8FA
                break;
            // End:0x8A7
            case 8:
            // End:0x8C3
            case 9:
                fDamageAmp = BaseParams.fDamPerc_UpperLeg;
                // End:0x8FA
                break;
            // End:0x8C8
            case 10:
            // End:0x8E4
            case 11:
                fDamageAmp = BaseParams.fDamPerc_LowerLeg;
                // End:0x8FA
                break;
            // End:0x8E9
            case 16:
            // End:0xFFFF
            default:
                fDamageAmp = 1.0000000;
                // End:0x8FA
                break;
                break;
        }
        // End:0x939
        if((Victim.HitActor != none) && Victim.HitActor.IsA('wHelicopter'))
        {
            fDamageAmp = BaseParams.fDamPerc_Heli;
        }
        frange = VSize(Victim.HitLocation - Start);
        // End:0x978
        if(frange >= BaseParams.fDamRange_Max)
        {
            fRangeLerp = 1.0000000;            
        }
        else
        {
            // End:0x99E
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
        // End:0xB59
        if(DamageCurr > float(0))
        {
            // End:0xAD9
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
    sound_Fire_Silencer = ResParams.default.sound_Fire_Silencer;
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
    // End:0xEE
    if(Instigator.Acceleration != vect(0.0000000, 0.0000000, 0.0000000))
    {
        // End:0xEE
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
    DamageType=Class'Engine.DamageType'
    TraceRange=10000.0000000
    Momentum=1.0000000
    HeadShotExtent=50.0000000
    Aim_FireAnim="Ads_Fire"
    Aim_FireLoopAnim="Ads_Fire"
    Aim_FireAnimRate=1.0000000
    Aim_FireLoopAnimRate=1.0000000
    bMakeRadarNoise=true
}