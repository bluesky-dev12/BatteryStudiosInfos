class wWeaponFire extends Object
    native;

enum ESpreadStyle
{
    SStyle_None,                    // 0
    SStyle_Random,                  // 1
    SStyle_Line,                    // 2
    SStyle_Ring                     // 3
};

enum ESpreadStance
{
    SS_None,                        // 0
    SS_Stand,                       // 1
    SS_Ducked,                      // 2
    SS_Prone                        // 3
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
var() Class<wAmmunition> AmmoClass;
var() int AmmoPerFire;
var() int AmmoClipSize;
var() float Load;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var() Class<wProjectile> ProjectileClass;
var() float BotRefireRate;
var() float WarnTargetPct;
var() Class<wEmitter> FlashEmitterClass;
var() wEmitter FlashEmitter;
var() Class<Emitter> FlashFirstPersonEmitterClass;
var() Class<wEmitter> SmokeEmitterClass;
var() wEmitter SmokeEmitter;
var() Class<Emitter> SmokeFirstPersonEmitterClass;
var() float AimError;
var() float Spread;
var() wWeaponFire.ESpreadStyle SpreadStyle;
var int FireCount;
var int iPartsDamage;
var int iPartsDamage_Outer;
var FireProperties SavedFireProperties;
var wWeaponBaseParams BaseParams;
var Class<wWeaponRes_Base> ResParams;
var bool bMakeRadarNoise;
var wWeaponFire.ESpreadStance SpreadStance;

simulated function SetTimer(float NewTimerRate, bool bLoop)
{
    bTimerLoop = bLoop;
    TimerInterval = NewTimerRate;
    NextTimerPop = Level.TimeSeconds + TimerInterval;
    //return;    
}

event Timer()
{
    //return;    
}

simulated function PreBeginPlay()
{
    //return;    
}

simulated function BeginPlay()
{
    //return;    
}

simulated function PostNetBeginPlay()
{
    //return;    
}

simulated event SetInitialState()
{
    GotoState('Auto');
    //return;    
}

simulated function PostBeginPlay()
{
    Load = float(AmmoPerFire);
    // End:0x1E
    if(bFireOnRelease)
    {
        bWaitForRelease = true;
    }
    // End:0x2F
    if(bWaitForRelease)
    {
        bNowWaiting = true;
    }
    //return;    
}

simulated function DestroyEffects()
{
    // End:0x17
    if(FlashEmitter != none)
    {
        FlashEmitter.Destroy();
    }
    // End:0x2E
    if(SmokeEmitter != none)
    {
        SmokeEmitter.Destroy();
    }
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
    //return;    
}

function DoFireEffect()
{
    //return;    
}

function DrawMuzzleFlash(Canvas Canvas)
{
    // End:0x61
    if((SmokeEmitter != none) && SmokeEmitter.Base != Weapon)
    {
        SmokeEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(SmokeEmitter, false, false, Weapon.DisplayFOV);
    }
    // End:0xC2
    if((FlashEmitter != none) && FlashEmitter.Base != Weapon)
    {
        FlashEmitter.SetLocation(Weapon.GetEffectStart());
        Canvas.DrawActor(FlashEmitter, false, false, Weapon.DisplayFOV);
    }
    //return;    
}

function FlashMuzzleFlash()
{
    local Actor ac;

    // End:0x27
    if(FlashEmitter != none)
    {
        FlashEmitter.Trigger(Weapon, Instigator);        
    }
    else
    {
        // End:0x79
        if(FlashFirstPersonEmitterClass != none)
        {
            ac = Spawn(FlashFirstPersonEmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin, Instigator.Rotation);
        }
    }
    //return;    
}

function StartMuzzleSmoke()
{
    // End:0x87
    if(!Level.bDropDetail)
    {
        // End:0x3B
        if(SmokeEmitter != none)
        {
            SmokeEmitter.Trigger(Weapon, Instigator);            
        }
        else
        {
            // End:0x87
            if(SmokeFirstPersonEmitterClass != none)
            {
                Spawn(SmokeFirstPersonEmitterClass, Instigator,, WeaponAttachment(Weapon.ThirdPersonActor).GetBoneTipLocation1st().Origin, Instigator.Rotation);
            }
        }
    }
    //return;    
}

function ShakeView()
{
    local PlayerController P;
    local Rotator rMin, rMax;
    local int iPitch, iYaw;
    local float fDecayFastBeginTime;

    P = PlayerController(Instigator.Controller);
    // End:0x2AF
    if(P != none)
    {
        // End:0x185
        if(Weapon.IsA('wGun') && int(wGun(Weapon).AimState) == int(2))
        {
            rMin.Pitch = int(BaseParams.fViewKickAds_YMin);
            rMin.Yaw = int(BaseParams.fViewKickAds_XMin);
            rMax.Pitch = int(BaseParams.fViewKickAds_YMax);
            rMax.Yaw = int(BaseParams.fViewKickAds_XMax);
            iPitch = rMin.Pitch + Rand(rMax.Pitch - rMin.Pitch);
            iYaw = rMin.Yaw + Rand(rMax.Yaw - rMin.Yaw);
            fDecayFastBeginTime = BaseParams.fViewKickAds_DecayTimeFast;
            P.wShakeView(iPitch, iYaw, BaseParams.fViewKickAds_Accel, BaseParams.fViewKickAds_Decel, BaseParams.fViewKickAds_StayTime, BaseParams.fViewKickAds_DecaySpeed, fDecayFastBeginTime);            
        }
        else
        {
            rMin.Pitch = int(BaseParams.fViewKickHip_YMin);
            rMin.Yaw = int(BaseParams.fViewKickHip_XMin);
            rMax.Pitch = int(BaseParams.fViewKickHip_YMax);
            rMax.Yaw = int(BaseParams.fViewKickHip_XMax);
            iPitch = rMin.Pitch + Rand(rMax.Pitch - rMin.Pitch);
            iYaw = rMin.Yaw + Rand(rMax.Yaw - rMin.Yaw);
            fDecayFastBeginTime = BaseParams.fViewKickHip_DecayTimeFast;
            P.wShakeView(iPitch, iYaw, BaseParams.fViewKickHip_Accel, BaseParams.fViewKickHip_Decel, BaseParams.fViewKickHip_StayTime, BaseParams.fViewKickHip_DecaySpeed, fDecayFastBeginTime);
        }
    }
    //return;    
}

function ClientPlayForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Instigator.Controller);
    // End:0x4C
    if((PC != none) && PC.bEnableWeaponForceFeedback)
    {
        PC.ClientPlayForceFeedback(EffectName);
    }
    //return;    
}

function StopForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Instigator.Controller);
    // End:0x4C
    if((PC != none) && PC.bEnableWeaponForceFeedback)
    {
        PC.StopForceFeedback(EffectName);
    }
    //return;    
}

function Update(float dt)
{
    //return;    
}

function StartFiring()
{
    //return;    
}

function StopFiring()
{
    //return;    
}

function bool IsFiring()
{
    return bIsFiring;
    //return;    
}

event ModeTick(float dt)
{
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
    // End:0xDF
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
    }
    // End:0x120
    if(Instigator.IsLocallyControlled())
    {
        Weapon.FireOne(ThisModeNum);
        ShakeView();
        PlayFiring();
        FlashMuzzleFlash();
        StartMuzzleSmoke();        
    }
    else
    {
        ServerPlayFiring();
    }
    Weapon.IncrementFlashCount(ThisModeNum);
    PlaySoundTeam();
    // End:0x186
    if(bFireOnRelease)
    {
        // End:0x168
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
        // End:0x1C3
        if(bEnableBustMode)
        {
            iFireCount++;
            // End:0x1B4
            if(iFireCount >= iFireRBC)
            {
                NextFireTime += FireRate;                
            }
            else
            {
                NextFireTime += fFireRBT;
            }            
        }
        else
        {
            NextFireTime += FireRate;
        }
        NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
    }
    Load = float(AmmoPerFire);
    HoldTime = 0.0000000;
    // End:0x247
    if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
    {
        bIsFiring = false;
        Weapon.PutDown();
    }
    //return;    
}

event ModeHoldFire()
{
    // End:0x18
    if(Instigator.IsLocallyControlled())
    {
        PlayStartHold();
    }
    //return;    
}

simulated function bool AllowFire()
{
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
    return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
    //return;    
}

function ServerPlayFiring()
{
    Instigator.SpecPlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false);
    Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, true,,, true);
    //return;    
}

function PlaySoundTeam()
{
    local string strSound;
    local int iCodeID;
    local float fRadius, fMessageRange;
    local Vector vLocation;

    // End:0x1CA
    if(int(Weapon.WeaponType) == int(5))
    {
        switch(Weapon.BaseParams.iWeaponID)
        {
            // End:0x3A
            case 6000:
            // End:0x42
            case 6003:
            // End:0x61
            case 6004:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllyGreanade;
                // End:0xD9
                break;
            // End:0x80
            case 6001:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllySmokeGreanade;
                // End:0xD9
                break;
            // End:0x9F
            case 6002:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllyStunGreanade;
                // End:0xD9
                break;
            // End:0xAA
            case 6005:
                // End:0xD9
                break;
            // End:0xC9
            case 7001:
                iCodeID = Class'Engine_Decompressed.wMessage_Game'.default.Code_AllyTimeC4;
                // End:0xD9
                break;
            // End:0xD4
            case 7003:
                // End:0xD9
                break;
            // End:0xFFFF
            default:
                return;
                break;
        }
        strSound = Class'Engine_Decompressed.wGameManager'.default.VoicePackageName $ ResParams.default.str_sound_Grenade;
        fRadius = Class'Engine_Decompressed.wMessage_Game'.default.SoundRadius;
        fMessageRange = Class'Engine_Decompressed.wMessage_Game'.default.MessageRange;
        vLocation = Instigator.Location;
        Weapon.PlayOwnedSound(Sound(DynamicLoadObject(strSound, Class'Engine_Decompressed.Sound')), 7, 1.0000000,, fRadius,,,, Instigator.GetTeamNum());
        Level.Game.TeamReceiveLocalizedMessageEx(byte(Instigator.GetTeamNum()), Class'Engine_Decompressed.wMessage_Game', iCodeID, Instigator.PlayerReplicationInfo,,, vLocation, fMessageRange, true);
    }
    //return;    
}

function PlayPreFire()
{
    // End:0x45
    if((Weapon.Mesh != none) && Weapon.HasAnim(PreFireAnim))
    {
        Weapon.PlayAnim(PreFireAnim, PreFireAnimRate, TweenTime);
    }
    //return;    
}

function PlayStartHold()
{
    //return;    
}

function PlayFiring()
{
    // End:0x8A
    if(Weapon.Mesh != none)
    {
        // End:0x6F
        if(FireCount > 0)
        {
            // End:0x51
            if(Weapon.HasAnim(FireLoopAnim))
            {
                Weapon.PlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000);                
            }
            else
            {
                Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
            }            
        }
        else
        {
            Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
        }
    }
    Instigator.PlaySoundHK(FireSound_Stereo, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false, false, -1, !Instigator == Owner.Level.GetLocalPlayerController().ViewTarget);
    // End:0x133
    if(int(Weapon.Role) == int(ROLE_Authority))
    {
        Instigator.PlaySound(FireSound, 0, TransientSoundVolume,, ResParams.default.rad_Fire, FireAnimRate, false,,, true);
    }
    ClientPlayForceFeedback(FireForce);
    FireCount++;
    //return;    
}

function PlayFireEnd()
{
    // End:0x45
    if((Weapon.Mesh != none) && Weapon.HasAnim(FireEndAnim))
    {
        Weapon.PlayAnim(FireEndAnim, FireEndAnimRate, TweenTime);
    }
    //return;    
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
    // End:0xA6
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
    //return;    
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Instigator.Location + Instigator.EyePosition();
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(0, byte(255), 0);
    Canvas.DrawText((((((("  FIREMODE " $ string(self)) $ "/[FireOnRelease]:") $ string(bFireOnRelease)) $ "/[IsFiring]:") $ string(bIsFiring)) $ "/[bFire]:") $ string(Instigator.Controller.bFire));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("  FireOnRelease " $ string(bFireOnRelease)) $ " HoldTime ") $ string(HoldTime)) $ " MaxHoldTime ") $ string(MaxHoldTime));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("  NextFireTime " $ string(NextFireTime)) $ " NowWaiting ") $ string(bNowWaiting));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.SetDrawColor(0, byte(255), 0);
    Canvas.DrawText((("  FIREMODE :" $ string(self)) $ "/ IsAiming ") $ string(wGun(Weapon).IsAiming()));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function float MaxRange()
{
    return 5000.0000000;
    //return;    
}

function Actor Spawn(Class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation)
{
    return Weapon.Spawn(SpawnClass, SpawnOwner, SpawnTag, SpawnLocation, SpawnRotation);
    //return;    
}

function Actor Trace(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional Vector Extent, optional out Material Material)
{
    return Weapon.Trace(HitLocation, HitNormal, TraceEnd, TraceStart, bTraceActors, Extent, Material);
    //return;    
}

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = BaseParams.iBulletCount;
    switch(BaseParams.iFireMode)
    {
        // End:0x5B
        case 0:
            bWaitForRelease = true;
            // End:0x80
            break;
        // End:0x6A
        case 1:
            bWaitForRelease = false;
            // End:0x80
            break;
        // End:0x7A
        case 2:
            bWaitForRelease = true;
            // End:0x80
            break;
        // End:0xFFFF
        default:
            // End:0x80
            break;
            break;
    }
    // End:0xE8
    if(ResParams.default.szClass_Muzz_1st != "")
    {
        FlashEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, Class'Core.Class'));
        // End:0xE8
        if(FlashEmitterClass == none)
        {
            FlashFirstPersonEmitterClass = Class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Muzz_1st, Class'Core.Class'));
        }
    }
    // End:0x150
    if(ResParams.default.szClass_Smoke_1st != "")
    {
        SmokeEmitterClass = Class<wEmitter>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, Class'Core.Class'));
        // End:0x150
        if(SmokeEmitterClass == none)
        {
            SmokeFirstPersonEmitterClass = Class<EmitterFirstPerson>(DynamicLoadObject(ResParams.default.szClass_Smoke_1st, Class'Core.Class'));
        }
    }
    FireSound = ResParams.default.sound_Fire;
    FireSound_Stereo = ResParams.default.sound_Fire_Stereo;
    FireRate = BaseParams.fRateOfFire;
    iFireRBC = BaseParams.iRoundBurstCount;
    fFireRBT = BaseParams.fRoundBurstTime;
    iFireCount = 0;
    // End:0x1CE
    if(iFireRBC > 0)
    {
        bEnableBustMode = true;
    }
    //return;    
}

function SetSpreadStance(wWeaponFire.ESpreadStance ss)
{
    SpreadStance = ss;
    //return;    
}

function MakeFireNoise()
{
    // End:0x18
    if(bMakeRadarNoise)
    {
        Instigator.MakeFireNoise();
    }
    //return;    
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
    if((Instigator.Controller != Level.GetLocalPlayerController()) && Victim.Controller != Level.GetLocalPlayerController())
    {
        return;
    }
    // End:0x88
    if(Victim.PlayerReplicationInfo.PlayerName == "")
    {
        return;
    }
    // End:0xDA
    if(Instigator.Controller == Level.GetLocalPlayerController())
    {
        szType = "[Attack]";
        szName = Victim.PlayerReplicationInfo.PlayerName;        
    }
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
            // End:0x2BB
            break;
        // End:0x13D
        case 2:
            szParts = "Upper Torso";
            // End:0x2BB
            break;
        // End:0x158
        case 3:
            szParts = "Lower Torso";
            // End:0x2BB
            break;
        // End:0x173
        case 4:
            szParts = "Upper Arm L";
            // End:0x2BB
            break;
        // End:0x18E
        case 5:
            szParts = "Upper Arm R";
            // End:0x2BB
            break;
        // End:0x1A9
        case 6:
            szParts = "Lower Arm L";
            // End:0x2BB
            break;
        // End:0x1C4
        case 7:
            szParts = "Lower Arm R";
            // End:0x2BB
            break;
        // End:0x1DF
        case 8:
            szParts = "Upper Leg L";
            // End:0x2BB
            break;
        // End:0x1FA
        case 9:
            szParts = "Upper Leg R";
            // End:0x2BB
            break;
        // End:0x215
        case 10:
            szParts = "Lower Leg L";
            // End:0x2BB
            break;
        // End:0x230
        case 11:
            szParts = "Lower Leg R";
            // End:0x2BB
            break;
        // End:0x246
        case 12:
            szParts = "Bomb L";
            // End:0x2BB
            break;
        // End:0x25C
        case 13:
            szParts = "Bomb R";
            // End:0x2BB
            break;
        // End:0x272
        case 14:
            szParts = "Bomb U";
            // End:0x2BB
            break;
        // End:0x288
        case 15:
            szParts = "Bomb D";
            // End:0x2BB
            break;
        // End:0x2A4
        case 16:
            szParts = "Unknown Part";
            // End:0x2BB
            break;
        // End:0x2A9
        case 0:
        // End:0xFFFF
        default:
            szParts = "None";
            // End:0x2BB
            break;
            break;
    }
    Level.GetLocalPlayerController().myHUD.AddTextMessage((((((((((((((((szType $ " ") $ string(fDam)) $ " / ") $ szName) $ " / ") $ BaseParams.strName) $ " / ") $ string(0)) $ " / ") $ string(fDist)) $ " / ") $ szParts) $ " / ") $ "0%") $ " / ") $ string(Level.TimeSeconds), Class'Engine_Decompressed.GameMessage', Instigator.Controller.PlayerReplicationInfo);
    //return;    
}

defaultproperties
{
    bInstantHit=true
    TransientSoundVolume=1.0000000
    TransientSoundRadius=400.0000000
    PreFireAnim="PreFire"
    FireAnim="Fire"
    FireLoopAnim="FireLoop"
    FireEndAnim="FireEnd"
    ReloadAnim="Reload"
    PreFireAnimRate=1.0000000
    FireAnimRate=1.0000000
    FireLoopAnimRate=1.0000000
    FireEndAnimRate=1.0000000
    ReloadAnimRate=1.0000000
    FireRate=0.5000000
    BotRefireRate=0.9500000
    AimError=600.0000000
}