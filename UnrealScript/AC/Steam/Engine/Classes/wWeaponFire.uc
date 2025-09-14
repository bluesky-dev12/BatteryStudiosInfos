/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeaponFire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:90
 *	Functions:42
 *
 *******************************************************************************/
class wWeaponFire extends Object
    dependson(HUD)
    dependson(wWeaponRes_Base)
    dependson(WeaponAttachment)
    dependson(AIController)
    dependson(wGun)
    dependson(wEmitter)
    native;

enum ESpreadStyle
{
    SStyle_None,
    SStyle_Random,
    SStyle_Line,
    SStyle_Ring
};

enum ESpreadStance
{
    SS_None,
    SS_Stand,
    SS_Ducked,
    SS_Prone
};

var() bool bSplashDamage;
var() bool bSplashJump;
var() bool bRecommendSplashDamage;
var() bool bTossed;
var() bool bLeadTarget;
var() bool bInstantHit;
var() bool bPawnRapidFireAnim;
var() bool bReflective;
var bool bTimerLoop;
var() bool bFireOnRelease;
var() bool bWaitForRelease;
var() bool bModeExclusive;
var bool bInputFire;
var bool bIsFiring;
var bool bNowWaiting;
var bool bServerDelayStopFire;
var bool bServerDelayStartFire;
var bool bInstantStop;
var() bool bAttachSmokeEmitter;
var() bool bAttachFlashEmitter;
var float TimerInterval;
var float NextTimerPop;
var() wWeapon Weapon;
var Pawn Instigator;
var LevelInfo Level;
var Actor Owner;
var float NextFireTime;
var() float PreFireTime;
var() float MaxHoldTime;
var() float HoldTime;
var() int ThisModeNum;
var float TransientSoundVolume;
var float TransientSoundRadius;
var() name PreFireAnim;
var() name FireAnim;
var() name FireLoopAnim;
var() name FireEndAnim;
var() name ReloadAnim;
var() float PreFireAnimRate;
var() float FireAnimRate;
var() float FireLoopAnimRate;
var() float FireEndAnimRate;
var() float ReloadAnimRate;
var() float TweenTime;
var() Sound FireSound_Stereo;
var() Sound FireSound;
var() Sound ReloadSound;
var() Sound NoAmmoSound;
var() string FireForce;
var() string ReloadForce;
var() string NoAmmoForce;
var() float FireRate;
var float ServerStartFireTime;
var bool bEnableBustMode;
var bool IsFiringBustMode;
var int iFireRBC;
var int iFireCount;
var float fFireRBT;
var() class<wAmmunition> AmmoClass;
var() int AmmoPerFire;
var() int AmmoClipSize;
var() float Load;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() class<wProjectile> ProjectileClass;
var() float BotRefireRate;
var() float WarnTargetPct;
var() class<wEmitter> FlashEmitterClass;
var() wEmitter FlashEmitter;
var() class<Emitter> FlashFirstPersonEmitterClass;
var() class<wEmitter> SmokeEmitterClass;
var() wEmitter SmokeEmitter;
var() class<Emitter> SmokeFirstPersonEmitterClass;
var() float AimError;
var() float Spread;
var() wWeaponFire.ESpreadStyle SpreadStyle;
var int FireCount;
var int iPartsDamage;
var int iPartsDamage_Outer;
var FireProperties SavedFireProperties;
var wWeaponBaseParams BaseParams;
var class<wWeaponRes_Base> ResParams;
var bool bMakeRadarNoise;
var wWeaponFire.ESpreadStance SpreadStance;
var int nBulletPerfire;
var int AutoAimCount;

simulated function SetTimer(float NewTimerRate, bool bLoop)
{
    bTimerLoop = bLoop;
    TimerInterval = NewTimerRate;
    NextTimerPop = Level.TimeSeconds + TimerInterval;
}

event Timer();
simulated function PreBeginPlay();
simulated function BeginPlay();
simulated function PostNetBeginPlay();
simulated event SetInitialState()
{
    GotoState('Auto');
}

simulated function PostBeginPlay()
{
    Load = float(AmmoPerFire);
    // End:0x1e
    if(bFireOnRelease)
    {
        bWaitForRelease = true;
    }
    // End:0x2f
    if(bWaitForRelease)
    {
        bNowWaiting = true;
    }
}

simulated function DestroyEffects()
{
    // End:0x17
    if(FlashEmitter != none)
    {
        FlashEmitter.Destroy();
    }
    // End:0x2e
    if(SmokeEmitter != none)
    {
        SmokeEmitter.Destroy();
    }
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
}

function DoFireEffect();
function DoFireEffectForClient();
function DrawMuzzleFlash(Canvas Canvas)
{
    // End:0x61
    if(SmokeEmitter != none && SmokeEmitter.Base != Weapon)
    {
        SmokeEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(SmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    // End:0xc2
    if(FlashEmitter != none && FlashEmitter.Base != Weapon)
    {
        FlashEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(FlashEmitter, false, false, Weapon.DisplayFOV);
    }
}

function FlashMuzzleFlash()
{
    local Actor ac;

    // End:0x27
    if(FlashEmitter != none)
    {
        FlashEmitter.Trigger(Weapon, Instigator);
    }
    // End:0x79
    else
    {
        // End:0x79
        if(FlashFirstPersonEmitterClass != none)
        {
            ac = Spawn(FlashFirstPersonEmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin, Instigator.Rotation);
        }
    }
}

function StartMuzzleSmoke()
{
    // End:0x87
    if(!Level.bDropDetail)
    {
        // End:0x3b
        if(SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(Weapon, Instigator);
        }
        // End:0x87
        else
        {
            // End:0x87
            if(SmokeFirstPersonEmitterClass != none)
            {
                Spawn(SmokeFirstPersonEmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin, Instigator.Rotation);
            }
        }
    }
}

function ShakeView()
{
    local PlayerController P;
    local Rotator rMin, rMax;
    local int iPitch, iYaw;
    local float fDecayFastBeginTime;
    local Rotator Range;
    local float frange, frangeY;
    local bool bUseWT;

    P = PlayerController(Instigator.Controller);
    bUseWT = false;
    // End:0x84
    if(P != none)
    {
        bUseWT = !P.bAimMode && Weapon.wt_BoundingMax > 0 || P.bAimMode && Weapon.wtAim_BoundingMax > 0;
    }
    // End:0x47c
    if(bUseWT)
    {
        // End:0x1cf
        if(P.bAimMode)
        {
            frange = 0.0;
            // End:0xdc
            if(Weapon.wt_index >= Weapon.wtAim_x.Length)
            {
                Weapon.wt_index = 0;
            }
            // End:0x102
            if(Weapon.wt_index > 80)
            {
                Weapon.wt_index = 75;
            }
            frangeY = Weapon.wtAim_y[Weapon.wt_index] + Weapon.wtAim_RandomMul * FRand() - 0.50 * Weapon.wtAim_RandomWeight[Weapon.wt_index];
            frange = Weapon.wtAim_x[Weapon.wt_index] + Weapon.wtAim_RandomMul * FRand() - 0.50 * Weapon.wtAim_RandomWeight[Weapon.wt_index];
            ++ Weapon.wt_index;
        }
        // End:0x2fc
        else
        {
            frange = 0.0;
            // End:0x20c
            if(Weapon.wt_index >= Weapon.wt_x.Length)
            {
                Weapon.wt_index = 0;
            }
            // End:0x232
            if(Weapon.wt_index > 80)
            {
                Weapon.wt_index = 75;
            }
            frangeY = Weapon.wt_y[Weapon.wt_index] + Weapon.wt_RandomMul * FRand() - 0.50 * Weapon.wt_RandomWeight[Weapon.wt_index];
            frange = Weapon.wt_x[Weapon.wt_index] + Weapon.wt_RandomMul * FRand() - 0.50 * Weapon.wt_RandomWeight[Weapon.wt_index];
            ++ Weapon.wt_index;
        }
        // End:0x32b
        if(frange >= -0.0010 && frange <= 0.0010)
        {
            Range.Yaw = 0;
        }
        // End:0x3bc
        else
        {
            // End:0x376
            if(frange > float(0))
            {
                Range.Yaw = int(float(int(float(32768) / 3.1415930)) * 3.1415930 / 2.0 - Atan(1.0, frange));
            }
            // End:0x3bc
            else
            {
                // End:0x3bc
                if(frange < float(0))
                {
                    Range.Yaw = int(-32768.0 / 3.1415930 * 3.1415930 / 2.0 - Atan(1.0, -frange));
                }
            }
        }
        // End:0x3eb
        if(frangeY >= -0.0010 && frangeY <= 0.0010)
        {
            Range.Pitch = 0;
        }
        // End:0x47c
        else
        {
            // End:0x436
            if(frangeY > float(0))
            {
                Range.Pitch = int(float(int(float(32768) / 3.1415930)) * 3.1415930 / 2.0 - Atan(1.0, frangeY));
            }
            // End:0x47c
            else
            {
                // End:0x47c
                if(frangeY < float(0))
                {
                    Range.Pitch = int(-32768.0 / 3.1415930 * 3.1415930 / 2.0 - Atan(1.0, -frangeY));
                }
            }
        }
    }
    // End:0x7ea
    if(P != none)
    {
        // End:0x654
        if(Weapon.IsA('wGun') && wGun(Weapon).AimState == 2)
        {
            fDecayFastBeginTime = BaseParams.fViewKickAds_DecayTimeFast;
            // End:0x53b
            if(bUseWT)
            {
                P.wShakeView(Range.Pitch, Range.Yaw, BaseParams.fViewKickAds_Accel, BaseParams.fViewKickAds_Decel, BaseParams.fViewKickAds_StayTime, BaseParams.fViewKickAds_DecaySpeed, fDecayFastBeginTime);
            }
            // End:0x651
            else
            {
                rMin.Pitch = int(BaseParams.fViewKickAds_YMin);
                rMin.Yaw = int(BaseParams.fViewKickAds_XMin);
                rMax.Pitch = int(BaseParams.fViewKickAds_YMax);
                rMax.Yaw = int(BaseParams.fViewKickAds_XMax);
                iPitch = rMin.Pitch + Rand(rMax.Pitch - rMin.Pitch);
                iYaw = rMin.Yaw + Rand(rMax.Yaw - rMin.Yaw);
                P.wShakeView(iPitch, iYaw, BaseParams.fViewKickAds_Accel, BaseParams.fViewKickAds_Decel, BaseParams.fViewKickAds_StayTime, BaseParams.fViewKickAds_DecaySpeed, fDecayFastBeginTime);
            }
        }
        // End:0x7ea
        else
        {
            fDecayFastBeginTime = BaseParams.fViewKickHip_DecayTimeFast;
            // End:0x6d4
            if(bUseWT)
            {
                P.wShakeView(Range.Pitch, Range.Yaw, BaseParams.fViewKickHip_Accel, BaseParams.fViewKickHip_Decel, BaseParams.fViewKickHip_StayTime, BaseParams.fViewKickHip_DecaySpeed, fDecayFastBeginTime);
            }
            // End:0x7ea
            else
            {
                rMin.Pitch = int(BaseParams.fViewKickHip_YMin);
                rMin.Yaw = int(BaseParams.fViewKickHip_XMin);
                rMax.Pitch = int(BaseParams.fViewKickHip_YMax);
                rMax.Yaw = int(BaseParams.fViewKickHip_XMax);
                iPitch = rMin.Pitch + Rand(rMax.Pitch - rMin.Pitch);
                iYaw = rMin.Yaw + Rand(rMax.Yaw - rMin.Yaw);
                P.wShakeView(iPitch, iYaw, BaseParams.fViewKickHip_Accel, BaseParams.fViewKickHip_Decel, BaseParams.fViewKickHip_StayTime, BaseParams.fViewKickHip_DecaySpeed, fDecayFastBeginTime);
            }
        }
    }
}

function ClientPlayForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Instigator.Controller);
    // End:0x4c
    if(PC != none && PC.bEnableWeaponForceFeedback)
    {
        PC.ClientPlayForceFeedback(EffectName);
    }
}

function StopForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Instigator.Controller);
    // End:0x4c
    if(PC != none && PC.bEnableWeaponForceFeedback)
    {
        PC.StopForceFeedback(EffectName);
    }
}

function Update(float dt);
function StartFiring();
function StopFiring();
function bool IsFiring()
{
    return bIsFiring;
}

event ModeTick(float dt);
simulated function SyncRandSeed()
{
    local int RandSeed, DeathCount;

    // End:0x23
    if(Instigator == none || Instigator.PlayerReplicationInfo == none)
    {
        return;
    }
    DeathCount = int(Instigator.PlayerReplicationInfo.Deaths * float(1000));
    RandSeed = DeathCount + Instigator.PlayerReplicationInfo.PlayerID + Weapon.SRand_FireCount;
    SRand(RandSeed);
    ++ Weapon.SRand_FireCount;
}

event ModeDoFire()
{
    local int i;

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
    // End:0x151
    if(Weapon.Role == 4)
    {
        Weapon.SeverConsumeAmmo(ThisModeNum, Load);
        WeaponAttachment(Weapon.ThirdPersonActor).ClearArray();
        nBulletPerfire = Weapon.BaseParams.iBulletCount;
        // End:0xac
        if(nBulletPerfire == 0)
        {
            nBulletPerfire = 1;
        }
        i = 0;
        J0xb3:
        // End:0xd8 [While If]
        if(i < nBulletPerfire)
        {
            SyncRandSeed();
            DoFireEffect();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xb3;
        }
        HoldTime = 0.0;
        // End:0x106
        if(Instigator == none || Instigator.Controller == none)
        {
            return;
        }
        // End:0x142
        if(AIController(Instigator.Controller) != none)
        {
            AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
        }
        Instigator.DeactivateSpawnProtection();
    }
    // End:0x1f2
    if(Instigator.IsLocallyControlled())
    {
        ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();
        // End:0x1ef
        if(Weapon.Role < 4)
        {
            nBulletPerfire = Weapon.BaseParams.iBulletCount;
            // End:0x1c3
            if(nBulletPerfire == 0)
            {
                nBulletPerfire = 1;
            }
            i = 0;
            J0x1ca:
            // End:0x1ef [While If]
            if(i < nBulletPerfire)
            {
                SyncRandSeed();
                DoFireEffectForClient();
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1ca;
            }
        }
    }
    // End:0x1f8
    else
    {
        ServerPlayFiring();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    PlaySoundTeam();
    // End:0x26a
    if(bFireOnRelease)
    {
        Log("bFireOnRelease");
        // End:0x24c
        if(bIsFiring)
        {
            NextFireTime += MaxHoldTime + FireRate;
        }
        // End:0x267
        else
        {
            NextFireTime = Level.TimeSeconds + FireRate;
        }
    }
    // End:0x2ce
    else
    {
        // End:0x2a7
        if(bEnableBustMode)
        {
            ++ iFireCount;
            // End:0x298
            if(iFireCount >= iFireRBC)
            {
                NextFireTime += FireRate;
            }
            // End:0x2a4
            else
            {
                NextFireTime += fFireRBT;
            }
        }
        // End:0x2b3
        else
        {
            NextFireTime += FireRate;
        }
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0;
    // End:0x332
    if(Instigator.PendingWeapon != Weapon && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        iFireCount = 0;
        Weapon.PutDown();
    }
}

event ModeHoldFire()
{
    // End:0x18
    if(Instigator.IsLocallyControlled())
    {
        PlayStartHold();
    }
}

simulated function bool AllowFire()
{
    // End:0x1f
    if(!Instigator.Controller.AllowFire())
    {
        return false;
    }
    // End:0x4e
    if(Weapon.MeleeState == 1)
    {
        Weapon.ClientStopFire(ThisModeNum);
        return false;
    }
    return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
}

function ServerPlayFiring()
{
    Instigator.SpecPlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false);
    Instigator.PlaySound(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, true,,, true);
}

function PlaySoundTeam()
{
    local string strSound;
    local int iCodeID;
    local float fRadius, fMessageRange;
    local Vector vLocation;

    // End:0x1ca
    if(Weapon.WeaponType == 5)
    {
        switch(Weapon.BaseParams.iWeaponID)
        {
            // End:0x3a
            case 6000:
            // End:0x42
            case 6003:
            // End:0x61
            case 6004:
                iCodeID = class'wMessage_Game'.default.Code_AllyGreanade;
                // End:0xd9
                break;
            // End:0x80
            case 6001:
                iCodeID = class'wMessage_Game'.default.Code_AllySmokeGreanade;
                // End:0xd9
                break;
            // End:0x9f
            case 6002:
                iCodeID = class'wMessage_Game'.default.Code_AllyStunGreanade;
                // End:0xd9
                break;
            // End:0xaa
            case 6005:
                // End:0xd9
                break;
            // End:0xc9
            case 7001:
                iCodeID = class'wMessage_Game'.default.Code_AllyTimeC4;
                // End:0xd9
                break;
            // End:0xd4
            case 7003:
                // End:0xd9
                break;
            // End:0xffff
            default:
                return;
        }
        strSound = class'wGameManager'.default.VoicePackageName $ ResParams.default.str_sound_Grenade;
        fRadius = class'wMessage_Game'.default.SoundRadius;
        fMessageRange = class'wMessage_Game'.default.MessageRange;
        vLocation = Instigator.Location;
        Weapon.PlayOwnedSound(Sound(DynamicLoadObject(strSound, class'Sound')), 7, 1.0,, fRadius,,,, Instigator.GetTeamNum());
        Level.Game.TeamReceiveLocalizedMessageEx(byte(Instigator.GetTeamNum()), class'wMessage_Game', iCodeID, Instigator.PlayerReplicationInfo,,, vLocation, fMessageRange, true);
    }
}

function PlayPreFire()
{
    // End:0x45
    if(Weapon.Mesh != none && Weapon.HasAnim(PreFireAnim))
    {
        Weapon.PlayAnim(PreFireAnim, PreFireAnimRate, TweenTime);
    }
}

function PlayStartHold();
function PlayFiring()
{
    // End:0x8a
    if(Weapon.Mesh != none)
    {
        // End:0x6f
        if(FireCount > 0)
        {
            // End:0x51
            if(Weapon.HasAnim(FireLoopAnim))
            {
                Weapon.PlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0);
            }
            // End:0x6c
            else
            {
                Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
            }
        }
        // End:0x8a
        else
        {
            Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        }
    }
    Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0x133
    if(Weapon.Role == 4)
    {
        Instigator.PlaySound(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    ++ FireCount;
}

function PlayFireEnd()
{
    // End:0x45
    if(Weapon.Mesh != none && Weapon.HasAnim(FireEndAnim))
    {
        Weapon.PlayAnim(FireEndAnim, FireEndAnimRate, TweenTime);
    }
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
    // End:0xa6
    if(!SavedFireProperties.bInitialized)
    {
        SavedFireProperties.AmmoClass = AmmoClass;
        SavedFireProperties.ProjectileClass = ProjectileClass;
        SavedFireProperties.WarnTargetPct = WarnTargetPct;
        SavedFireProperties.MaxRange = MaxRange();
        SavedFireProperties.bTossed = bTossed;
        SavedFireProperties.bTrySplash = bRecommendSplashDamage;
        SavedFireProperties.bLeadTarget = bLeadTarget;
        SavedFireProperties.bInstantHit = bInstantHit;
        SavedFireProperties.bInitialized = true;
    }
    return Instigator.super(wWeaponFire).AdjustAim(SavedFireProperties, Start, int(InAimError));
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Instigator.Location + Instigator.EyePosition();
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(0, byte(255), 0);
}

function float MaxRange()
{
    return 5000.0;
}

function Actor Spawn(class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation)
{
    return Weapon.Spawn(SpawnClass, SpawnOwner, SpawnTag, SpawnLocation, SpawnRotation);
}

function Actor Trace(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional Vector Extent, optional out Material Material)
{
    return Weapon.Trace(HitLocation, HitNormal, TraceEnd, TraceStart, bTraceActors, Extent, Material);
}

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = BaseParams.iBulletCount / BaseParams.iBulletCount;
    switch(BaseParams.iFireMode)
    {
        // End:0x6b
        case 0:
            bWaitForRelease = true;
            // End:0x90
            break;
        // End:0x7a
        case 1:
            bWaitForRelease = false;
            // End:0x90
            break;
        // End:0x8a
        case 2:
            bWaitForRelease = true;
            // End:0x90
            break;
        // End:0xffff
        default:
            // End:0x90 Break;
            break;
    }
    // End:0xf8
    if(ResParams.default.szClass_Muzz_1st != "")
    {
        FlashEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, class'Class'));
        // End:0xf8
        if(FlashEmitterClass == none)
        {
            FlashFirstPersonEmitterClass = class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, class'Class'));
        }
    }
    // End:0x160
    if(ResParams.default.szClass_Smoke_1st != "")
    {
        SmokeEmitterClass = class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, class'Class'));
        // End:0x160
        if(SmokeEmitterClass == none)
        {
            SmokeFirstPersonEmitterClass = class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, class'Class'));
        }
    }
    FireSound = ResParams.default.sound_Fire;
    FireSound_Stereo = ResParams.default.sound_Fire_Stereo;
    FireRate = BaseParams.fRateOfFire;
    iFireRBC = BaseParams.iRoundBurstCount;
    fFireRBT = BaseParams.fRoundBurstTime;
    iFireCount = 0;
    // End:0x1de
    if(iFireRBC > 0)
    {
        bEnableBustMode = true;
    }
}

function SetSpreadStance(wWeaponFire.ESpreadStance ss)
{
    SpreadStance = ss;
}

function MakeFireNoise()
{
    // End:0x18
    if(bMakeRadarNoise)
    {
        Instigator.MakeFireNoise();
    }
}

event DamageLog(Pawn Victim, float fDam, float fDist, Actor.CollisionPartsType CParts)
{
    local string szType, szName, szParts;

    // End:0x20
    if(!Level.GetLocalPlayerController().bDamageLog)
    {
        return;
    }
    // End:0x68
    if(Instigator.Controller != Level.GetLocalPlayerController() && Victim.Controller != Level.GetLocalPlayerController())
    {
        return;
    }
    // End:0x88
    if(Victim.PlayerReplicationInfo.PlayerName == "")
    {
        return;
    }
    // End:0xda
    if(Instigator.Controller == Level.GetLocalPlayerController())
    {
        szType = "[Attack]";
        szName = Victim.PlayerReplicationInfo.PlayerName;
    }
    // End:0x107
    else
    {
        szType = "[Defend]";
        szName = Instigator.PlayerReplicationInfo.PlayerName;
    }
    switch(CParts)
    {
        // End:0x122
        case 1:
            szParts = "Head";
            // End:0x2bb
            break;
        // End:0x13d
        case 2:
            szParts = "Upper Torso";
            // End:0x2bb
            break;
        // End:0x158
        case 3:
            szParts = "Lower Torso";
            // End:0x2bb
            break;
        // End:0x173
        case 4:
            szParts = "Upper Arm L";
            // End:0x2bb
            break;
        // End:0x18e
        case 5:
            szParts = "Upper Arm R";
            // End:0x2bb
            break;
        // End:0x1a9
        case 6:
            szParts = "Lower Arm L";
            // End:0x2bb
            break;
        // End:0x1c4
        case 7:
            szParts = "Lower Arm R";
            // End:0x2bb
            break;
        // End:0x1df
        case 8:
            szParts = "Upper Leg L";
            // End:0x2bb
            break;
        // End:0x1fa
        case 9:
            szParts = "Upper Leg R";
            // End:0x2bb
            break;
        // End:0x215
        case 10:
            szParts = "Lower Leg L";
            // End:0x2bb
            break;
        // End:0x230
        case 11:
            szParts = "Lower Leg R";
            // End:0x2bb
            break;
        // End:0x246
        case 12:
            szParts = "Bomb L";
            // End:0x2bb
            break;
        // End:0x25c
        case 13:
            szParts = "Bomb R";
            // End:0x2bb
            break;
        // End:0x272
        case 14:
            szParts = "Bomb U";
            // End:0x2bb
            break;
        // End:0x288
        case 15:
            szParts = "Bomb D";
            // End:0x2bb
            break;
        // End:0x2a4
        case 16:
            szParts = "Unknown Part";
            // End:0x2bb
            break;
        // End:0x2a9
        case 0:
        // End:0xffff
        default:
            szParts = "None";
            // End:0x2bb Break;
            break;
    }
    Level.GetLocalPlayerController().myHUD.AddTextMessage(szType $ " " $ string(fDam) $ " / " $ szName $ " / " $ BaseParams.strName $ " / " $ string(0) $ " / " $ string(fDist) $ " / " $ szParts $ " / " $ "0%" $ " / " $ string(Level.TimeSeconds), class'GameMessage', Instigator.Controller.PlayerReplicationInfo);
}

defaultproperties
{
    bInstantHit=true
    TransientSoundVolume=1.0
    TransientSoundRadius=300.0
    PreFireAnim=PreFire
    FireAnim=Fire
    FireLoopAnim=FireLoop
    FireEndAnim=FireEnd
    ReloadAnim=Reload
    PreFireAnimRate=1.0
    FireAnimRate=1.0
    FireLoopAnimRate=1.0
    FireEndAnimRate=1.0
    ReloadAnimRate=1.0
    FireRate=0.50
    BotRefireRate=0.950
    AimError=600.0
}