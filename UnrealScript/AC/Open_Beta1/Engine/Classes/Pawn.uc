class Pawn extends Actor
    abstract
    native
    nativereplication
    exportstructs
    placeable;

struct PlayerDamageInfo
{
    var Pawn Attacker;
    var Controller ac;
    var int AttackerUID;
    var float DamageAmount;
    var float DamageTime;
    var bool DamageStun;
};

struct HitFXData
{
    var() name Bone;
    var() Class<DamageType> damtype;
    var() bool bSever;
    var() Rotator rotDir;
    var() int iCollisionPart;
    var Vector vHitLoc;
};

struct sStartWeaponInfo
{
    var int iWeaponID;
    var int iPartsID;
    var BtrDouble iUniqueID;
};

var Controller Controller;
var float NetRelevancyTime;
var PlayerController LastRealViewer;
var Actor LastViewer;
var const float LastLocTime;
var bool bForceDesiredRotation;
var bool CannotFindPath;
var int CannotFindPathCount;
var float CannotFindPathTime;
var float CannotFindPathTimeHoldDuration;
var bool CannotReachPath;
var bool bDoNotBackPathFinding;
var bool bJustLanded;
var bool bLandRecovery;
var bool bUpAndOut;
var bool bIsSprinting;
var bool bIsAiming;
var bool bWasAimMode;
var bool bWarping;
var bool bAddToLevelPawnList;
var bool bWantsToCrouch;
var const bool bIsCrouched;
var const bool bTryToUncrouch;
var bool bIsCrouching;
var() bool bCanCrouch;
var bool bWasCrouched;
var bool bDrawNameTag;
var bool NametagVisInFront;
var bool NametagVisFastTrace;
var bool NametagVisTraceThisActor;
var Vector NametagPosition;
var Vector NametagScreenPos;
var bool bIsStanding;
var float fWeaponSpread;
var byte byGoToProne;
var bool bWantsToProne;
var const bool bIsProned;
var bool bIsProning;
var bool bWasProned;
var float ProneHeight;
var float ProneRadius;
var byte byUseKey;
var byte bySpecialState;
var bool bCrawler;
var const bool bReducedSpeed;
var bool bJumpCapable;
var bool bCanJump;
var bool bCanWalk;
var bool bCanSwim;
var bool bCanFly;
var bool bCanClimbLadders;
var bool bCanStrafe;
var bool bCanDoubleJump;
var bool bCanWallDodge;
var bool bAvoidLedges;
var bool bStopAtLedges;
var bool bNoJumpAdjust;
var bool bCountJumps;
var const bool bSimulateGravity;
var bool bUpdateEyeheight;
var bool bIgnoreForces;
var const bool bNoVelocityUpdate;
var bool bCanWalkOffLedges;
var bool bSteadyFiring;
var bool bCanBeBaseForPawns;
var bool bClientCollision;
var const bool bSimGravityDisabled;
var bool bDirectHitWall;
var bool bServerMoveSetPawnRot;
var bool bFlyingKarma;
var bool bDrawCorona;
var bool bNoCoronas;
var bool bThumped;
var bool bInvulnerableBody;
var bool bIsFemale;
var bool bAutoActivate;
var bool bCanPickupInventory;
var bool bUpdatingDisplay;
var bool bAmbientCreature;
var(AI) bool bLOSHearing;
var(AI) bool bSameZoneHearing;
var(AI) bool bAdjacentZoneHearing;
var(AI) bool bMuffledHearing;
var(AI) float fWallHearingFactor;
var(AI) bool bAroundCornerHearing;
var(AI) bool bDontPossess;
var bool bAutoFire;
var bool bRollToDesired;
var bool bIgnorePlayFiring;
var bool bStationary;
var bool bCachedRelevant;
var bool bUseCompressedPosition;
var bool bWeaponBob;
var bool bHideRegularHUD;
var bool bSpecialHUD;
var bool bSpecialCrosshair;
var bool bSpecialCalcView;
var bool bNoTeamBeacon;
var bool bNoWeaponFiring;
var bool bIsTyping;
var bool bScriptPostRender;
var bool bCanUse;
var bool bSuperSize;
var bool bWaterStepup;
var byte FlashCount;
var byte Visibility;
var float DesiredSpeed;
var float MaxDesiredSpeed;
var(AI) name AIScriptTag;
var(AI) float HearingThreshold;
var(AI) float Alertness;
var(AI) float SightRadius;
var(AI) float PeripheralVision;
var() float SkillModifier;
var const float AvgPhysicsTime;
var float MeleeRange;
var float NavigationPointRange;
var NavigationPoint Anchor;
var const NavigationPoint LastAnchor;
var float FindAnchorFailedTime;
var float LastValidAnchorTime;
var float DestinationOffset;
var float NextPathRadius;
var Vector SerpentineDir;
var float SerpentineDist;
var float SerpentineTime;
var const float UncrouchTime;
var float SpawnTime;
var float GroundSpeed;
var float WaterSpeed;
var float AirSpeed;
var float LadderSpeed;
var float AccelRate;
var float JumpZ;
var float AirControl;
var float SprintSpeed;
var float CrouchedSpeed;
var float PronedSpeed;
var float AimedGroundSpeed;
var float AimedCrouchedSpeed;
var float F_DiagmoveRatio;
var float SideMoveRatio;
var float B_DiagmoveRatio;
var float BackMoveRatio;
var float WalkZDamp;
var float MaxFallSpeed;
var Vector ConstantAcceleration;
var Vehicle DrivenVehicle;
var Vehicle EntryVehicle;
var Vector ImpactVelocity;
var() int PitchUpLimit;
var() int PitchDownLimit;
var string OwnerName;
var travel wWeapon Weapon;
var wWeapon PendingWeapon;
var travel Powerups SelectedItem;
var float BaseEyeHeight;
var float BaseEyeHeightCroucned;
var float BaseEyeHeightProned;
var float EyeHeight;
var Vector Floor;
var float SplashTime;
var float CrouchHeight;
var float CrouchRadius;
var() float DrivingHeight;
var() float DrivingRadius;
var float OldZ;
var PhysicsVolume HeadVolume;
var float HealthMax;
var float SuperHealthMax;
var travel int Health;
var float BreathTime;
var float UnderWaterTime;
var float LastPainTime;
var Class<DamageType> ReducedDamageType;
var float HeadRadius;
var float HeadHeight;
var float HeadScale;
var bool bSetPCRotOnPossess;
var const Vector noise1spot;
var const float noise1time;
var const Pawn noise1other;
var const float noise1loudness;
var const Vector noise2spot;
var const float noise2time;
var const Pawn noise2other;
var const float noise2loudness;
var float LastPainSound;
var float Bob;
var float BobMagicValue1;
var float BobMagicValue2;
var float BobMagicValue3;
var float BobMagicValue4;
var float LandBob;
var float AppliedBob;
var float bobtime;
var float bobTimeX;
var float bobTimeY;
var float bobTimeZ;
var Vector WalkBob;
var Vector WalkBobCamera;
var float SoundDampening;
var float DamageScaling;
var float AmbientSoundScaling;
var localized string MenuName;
var Projector Shadow;
var Class<Effects> BloodEffect;
var Class<Effects> LowGoreBlood;
var Class<AIController> ControllerClass;
var PlayerReplicationInfo PlayerReplicationInfo;
var LadderVolume OnLadder;
var name LandMovementState;
var name WaterMovementState;
var PlayerStart LastStartSpot;
var float LastStartTime;
var name AnimAction;
var Vector TakeHitLocation;
var Class<DamageType> HitDamageType;
var int HitCollisionPart;
var Vector TearOffMomentum;
var Actor.EPhysics OldPhysics;
var bool bPhysicsAnimUpdate;
var bool bInitializeAnimation;
var bool bPlayedDeath;
var bool bIsIdle;
var bool bWaitForAnim;
var const bool bReverseRun;
var bool bDoTorsoTwist;
var const bool FootTurning;
var const bool FootStill;
var byte byRunCase;
var const byte ViewPitch;
var int SmoothViewPitch;
var int SmoothViewYaw;
var float OldRotYaw;
var Vector OldAcceleration;
var(AnimTweaks) float BlendChangeTime;
var float MovementBlendStartTime;
var float ForwardStrafeBias;
var float BackwardStrafeBias;
var float DodgeSpeedFactor;
var float DodgeSpeedZ;
var const int OldAnimDir;
var const Vector OldVelocity;
var float IdleTime;
var name SwimAnims[4];
var name DoubleJumpAnims[4];
var name DodgeAnims[4];
var name IdleSwimAnim;
var name IdleWeaponAnim;
var name IdleChatAnim;
var bool bIsNeedUpdateAnim;
var name Prone_Anim;
var name WeaponSelectAnim;
var name WeaponPutDownAnim;
var name WeaponIdleRestAnim;
var array<PlayerDamageInfo> DamageInfo;
var array<Controller> AssistList;
var I3DL2Listener curEAXEffect;
var float EAXEffectTime;
var float RepPawnPositionTime;
var Vector PrevLocation;
var Vector PrevMoveDir;
var Vector PrevInterpoLocation;
var int PrevTime;
var name IdleRifleAnim;
var name IdleRestAnim[2];
var name MovementAnims[4];
var name FireRifleRapidAnim;
var name FireRifleBurstAnim;
var name Rifle_BoltLeverAnim;
var name Reload_Rifle_Anim;
var name Putdown_Rifle_Anim;
var name PutdownQuick_Rifle_Anim;
var name Select_Rifle_Anim;
var name SelectNew_Rifle_Anim;
var name SprintAnims[4];
var name IdleAimAnim;
var name AimAnims[4];
var name FireAimRifleRapidAnim;
var name FireAimRifleSemiAnim;
var name TakeoffStillAnim;
var name AirStillAnim;
var name TakeoffAnims[4];
var name AirAnims[4];
var name LandAnims[5];
var name Pistol_TakeoffStillAnim;
var name Pistol_AirStillAnim;
var name Pistol_TakeoffAnims[4];
var name Pistol_AirAnims[4];
var name Pistol_LandAnims[5];
var name Frag_TakeoffStillAnim;
var name Frag_AirStillAnim;
var name Frag_TakeoffAnims[4];
var name Frag_AirAnims[4];
var name Frag_LandAnims[5];
var name Rpg_TakeoffStillAnim;
var name Rpg_AirStillAnim;
var name Rpg_TakeoffAnims[4];
var name Rpg_AirAnims[4];
var name Rpg_LandAnims[5];
var name IdleCrouchAnim;
var name IdleCrouchRestAnim[2];
var name CrouchAnims[4];
var name FireCrouchRifleRapidAnim;
var name IdleAimCrouchAnim;
var name AimCrouchAnims[4];
var name IdleProneAnim;
var name ProneAnims[4];
var name FireProneRifleRapidAnim;
var name Rifle_Prone_BoltLeverAnim;
var name Reload_Prone_Rifle_Anim;
var name Putdown_Prone_Rifle_Anim;
var name PutdownQuick_Prone_Rifle_Anim;
var name Select_Prone_Rifle_Anim;
var name SelectNew_Prone_Rifle_Anim;
var name Prone_Standup_Anim;
var name Meele_Rifle;
var name Meele_Rifle_Cr;
var name Meele_Rifle_Pr;
var name Meele_Rifle_F;
var name Meele_Rifle_Cr_F;
var name Meele_Knife;
var name Meele_Knife_Cr;
var name Meele_Knife_Pr;
var name Meele_Knife_F;
var name Meele_Knife_Cr_F;
var name Meele_Scharge;
var name Pistol_IdleRifleAnim;
var name Pistol_IdleRestAnim[2];
var name Pistol_MovementAnims[4];
var name Pistol_FireAimRifleRapidAnim;
var name Pistol_Reload_Rifle_Anim;
var name Pistol_Putdown_Rifle_Anim;
var name Pistol_PutdownQuick_Rifle_Anim;
var name Pistol_Select_Rifle_Anim;
var name Pistol_SprintAnims[4];
var name Pistol_IdleCrouchAnim;
var name Pistol_IdleCrouchRest[2];
var name Pistol_CrouchAnims[4];
var name Pistol_FireCrouchRifleRapidAnim;
var name Pistol_IdleProne;
var name Pistol_ProneBurst;
var name Pistol_ProneReload;
var name Pistol_PronePutdown;
var name Pistol_PronePutdownQuick;
var name Pistol_ProneSelect;
var name Frag_Idle_Anim;
var name Frag_Rest_Idle_Anim[2];
var name Frag_MovementAnims[4];
var name Frag_PutDown_Anim;
var name Frag_PutDownQuick_Anim;
var name Frag_Select_Anim;
var name Frag_Burst_Anim;
var name Frag_SprintAnims[4];
var name Frag_IdleCrouchAnim;
var name Frag_CrouchMovementAnims[4];
var name Frag_IdleProne;
var name Frag_ProneBurst;
var name Frag_PronePutdown;
var name Frag_PronePutdownQuick;
var name Frag_ProneSelect;
var name Rpg_Idle_Anim;
var name Rpg_Rest_Idle_Anim;
var name Rpg_MovementAnims[4];
var name Rpg_Burst_Anim;
var name Rpg_Reload_Anim;
var name Rpg_PutDown_Anim;
var name Rpg_PutDownQuick_Anim;
var name Rpg_Select_Anim;
var name Rpg_SprintAnims[4];
var name Rpg_Idle_AimAnim;
var name Rpg_AimAnims[4];
var name Rpg_AimAnims_Cr[4];
var name Rpg_IdleCrouchAnim;
var name Rpg_IdleCrouchRest;
var name Rpg_CrouchMovementAnims[4];
var name Rpg_FireCrouchRifleRapidAnim;
var name Rpg_IdleProne;
var name Rpg_ProneBurst;
var name Rpg_ProneReload;
var name Rpg_PronePutdown;
var name Rpg_PronePutdownQuick;
var name Rpg_ProneSelect;
var name Rpg_Prone_Standup_Anim;
var name TurretIdle;
var name TurretIdleUpDown;
var name TurretBurst;
var name ShotGun_BoltLeverAnim;
var name ShotGun_Reload;
var name ShotGun_Crouch_Pump;
var name ShotGun_Crouch_Reload3;
var name ShotGun_Prone_Pump;
var name ShotGun_Prone_Reload3;
var name Hit_AR[4];
var name Hit_Head;
var name Hit_AR_Cr[4];
var name Hit_Pr;
var name Death_F[3];
var name Death_B[3];
var name Death_L[3];
var name Death_R[3];
var name Death_Head;
var name Death_Cr_F[2];
var name Death_Cr_B[2];
var name Death_Cr_L[2];
var name Death_Cr_R[2];
var name Death_Cr_Head;
var name Death_Pr;
var name Death_Frag_F;
var name Death_Frag_B;
var name Death_Frag_L;
var name Death_Frag_R;
var name Bomb_Plant;
var name Bomb_Defuse;
var name Crouch_Bomb_Plant;
var name Crouch_Bomb_Defuse;
var name Prone_Bomb_Plant;
var name Prone_Bomb_Defuse;
var name Bomb_Throw;
var name DemoPack_Plant_PutDown_Anim;
var name DemoPack_Defuse_PutDown_Anim;
var name DemoPack_Plant_Crouch_PutDown_Anim;
var name DemoPack_Defuse_Crouch_PutDown_Anim;
var name DemoPack_Plant_Prone_PutDown_Anim;
var name DemoPack_Defuse_Prone_PutDown_Anim;
var name DemoPack_Throw_Anim;
var name DemoPack_Throw_Crouch_Anim;
var name DemoPack_Throw_Prone_Anim;
var byte byThrowsWeapon;
var wMyPlayerStatus wMyParam;
var array<name> TauntAnims;
var localized string TauntAnimNames[16];
var const int FootRot;
var const int TurnDir;
var name MainRootBone;
var name MainRotateBone;
var name RootBone;
var name HeadBone;
var name SpineBone;
var name SpineBone1;
var name SpineBone2;
var name PelvisBone;
var Vector vDiagonalRot;
var float fDiagonalBodyRot;
var Vector vFL_Rot;
var Vector vFR_Rot;
var Vector vBL_Rot;
var Vector vBR_Rot;
var Vector vCFL_Rot;
var Vector vCFR_Rot;
var Vector vCBL_Rot;
var Vector vCBR_Rot;
var float fBodyFL_Rot;
var float fBodyFR_Rot;
var float fBodyBL_Rot;
var float fBodyBR_Rot;
var(Shield) transient float ShieldStrength;
var() HitFXData HitFx[8];
var transient int HitFxTicker;
var transient CompressedPosition PawnPosition;
var Controller DelayedDamageInstigatorController;
var Controller LastHitBy;
var float MinFlySpeed;
var float MaxRotation;
var bool bReloading;
var bool bWasReloading;
var bool bMeleeAttacking;
var bool bWaitingPreAnim;
var byte TypeOfWeapon;
var float DriverCurrentFrame;
var float DriverUpDownFrame;
var bool bIsTurreting;
var string LoginName;
var int IDNum;
var int iSoundChannel_SuffEff;
var float fTimer_SuffEff;
var float fLastFireNoiseTime;
var Vector vFormerFireNoisePos;
var Vector vLastFireNoisePos;
var float FireNoiseDistance;
var float fLastRadioMessageTime;
var Vector vFormerRadioMessagePos;
var Vector vLastRadioMessagePos;
var float RadioMessageDistance;
var float UAVScannedTime;
var Vector UAVLastScannedPos;
var Vector LastKnownPos;
var float LastKnownTime;
var wWeaponPickup kPendingWPick;
var float LastDamageDealtTime;
var int LastDamageCollisionPart;
var float LastDamageReceiveTime;
var int TeamIndex;
var float DealDamageRatio_Default;
var float DealDamageRatio_Explosive;
var float DealDamageRatio_Melee;
var Vector RespawnLocation;
var bool bInvulnerableOnRespawn;
var float fRespawnInvulnerableTime;
var float fRespawnInvulnerableTime_SDMode;
var float fRespawnInvulnerableTimeBeginner;
var array<sStartWeaponInfo> arStartWeaponInfo;
var float fReduceVelRate;
var float fSequenceAnimRate;
var bool bCanQuickReload;
var bool bCanQuickWeaponChange;
var Vector AttackerLoc;
var float TweenRate_Proned_Run;
var float TweenRate_Crouched_Run;
var float TweenRate_Sprint;
var float TweenRate_Run;
var float TweenRate_Aim_Run;
var float TweenRate_Idle;
var float TweenRate_SideStep;
var float TweenRate_Proned_Idle;
var float TweenRate_Crouched_Idle;
//var delegate<OnReachedDestination> __OnReachedDestination__Delegate;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        AnimAction, AttackerLoc, 
        DrivenVehicle, HeadScale, 
        HitCollisionPart, HitDamageType, 
        OwnerName, PlayerReplicationInfo, 
        TakeHitLocation, TeamIndex, 
        bIsCrouched, bIsProned, 
        bIsSprinting, bSimulateGravity, 
        bSpecialHUD, byUseKey;

    // Pos:0x018
    reliable if(int(Role) == int(ROLE_Authority))
        DriverCurrentFrame, DriverUpDownFrame, 
        IDNum, LoginName, 
        TypeOfWeapon, bCanQuickReload, 
        bCanQuickWeaponChange, bIsAiming, 
        bIsTurreting, bWaitingPreAnim, 
        bWasReloading;

    // Pos:0x025
    reliable if((bTearOff && bNetDirty) && int(Role) == int(ROLE_Authority))
        TearOffMomentum;

    // Pos:0x048
    reliable if((bNetDirty && !bNetOwner) && int(Role) == int(ROLE_Authority))
        ViewPitch, bSteadyFiring;

    // Pos:0x06D
    reliable if((bNetDirty && bNetOwner) && int(Role) == int(ROLE_Authority))
        AccelRate, AirControl, 
        AirSpeed, Controller, 
        GroundSpeed, JumpZ, 
        PitchDownLimit, PitchUpLimit, 
        SelectedItem, WaterSpeed, 
        bCanWallDodge;

    // Pos:0x090
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        Health, HealthMax;

    // Pos:0x0A8
    reliable if(!bNetOwner && int(Role) == int(ROLE_Authority))
        PawnPosition;

    // Pos:0x0C2
    reliable if(int(Role) == int(ROLE_Authority))
        EntryVehicle, HitFx, 
        HitFxTicker, ShieldStrength, 
        kPendingWPick;

    // Pos:0x0CF
    reliable if(int(Role) < int(ROLE_Authority))
        NextItem, ServerAddWeapon, 
        ServerChangedWeapon, ServerNoTranslocator, 
        ServerPickupWeapon, ServerPlayPutdownWeaponAnim, 
        ServerRefreshCollisionHash, ServerSetAnimAction, 
        ServerStanceChanged, ServerThrowsWeaponAnim;

    // Pos:0x0DC
    reliable if(int(Role) < int(ROLE_Authority))
        ServerSetReloadMode, ServerSetTurretingMode, 
        ServerSetTypeOfWeapon, ServerSetUseKeyState, 
        ServerSetWaitingPreAnimMode, ServerSetWasReloadMode, 
        SetAimMode;

    // Pos:0x0E9
    reliable if(int(Role) < int(ROLE_Authority))
        ServerSetPlayerScoreInfo, ServerSetWeaponInfo;

    // Pos:0x0F6
    reliable if(int(Role) == int(ROLE_Authority))
        ClientForceChangedWeapon, ClientSetPlayerScoreInfo, 
        ClientSetWeaponInfo;

    // Pos:0x103
    reliable if(int(Role) == int(ROLE_Authority))
        LastDamageCollisionPart, LastDamageDealtTime;

    // Pos:0x110
    reliable if(int(Role) < int(ROLE_Authority))
        ServerPlaySound, ServerStopAllSoundByActor, 
        ServerStopLoopSoundByActor;
}

delegate bool OnReachedDestination(Vector Dir, Actor GoalActor)
{
    //return;    
}

function ServerPlaySound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    PlaySound(Sound, Slot, Volume, bNoOverride, Radius, Pitch, Attenuate, Loop, SellectTeam, bExceptOwner);
    //return;    
}

function ServerStopAllSoundByActor()
{
    local Controller C, NextC;

    C = Level.ControllerList;
    J0x14:

    // End:0x66 [Loop If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0x58
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientStopAllSoundByActor(self);
        }
        C = NextC;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function ServerStopLoopSoundByActor()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x5B [Loop If]
    if(C != none)
    {
        // End:0x44
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientStopLoopSoundByActor(self);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

// Export UPawn::execHasChannel(FFrame&, void* const)
native function string HasChannel();

// Export UPawn::execCheckRelevantTimeOut(FFrame&, void* const)
native function string CheckRelevantTimeOut();

// Export UPawn::execIsNetReady(FFrame&, void* const)
native function string IsNetReady();

// Export UPawn::execCanSee(FFrame&, void* const)
native function string CanSee();

simulated function FootStepping(int side)
{
    //return;    
}

simulated function PlayBreathSound()
{
    //return;    
}

simulated function PlayBreathSounds()
{
    //return;    
}

simulated function PlayEquipHitSound()
{
    //return;    
}

event StoreWeaponInfo()
{
    //return;    
}

event ClientSetWeaponInfo()
{
    //return;    
}

event ServerSetWeaponInfo(int WeaponClassNumber, int WeaponAddPartsID, int WeaponTotalAmmo, int WeaponCurrentAmmo)
{
    //return;    
}

event StorePlayerScoreInfo()
{
    //return;    
}

event ClientSetPlayerScoreInfo()
{
    //return;    
}

event ServerSetPlayerScoreInfo(int TeamIndex, int Kills, int Assists, int Deaths, int EXPs, int Points, int Scores)
{
    //return;    
}

function ServerStanceChanged(wWeaponFire.ESpreadStance ss)
{
    Weapon.GetFireMode(0).SetSpreadStance(ss);
    //return;    
}

static function StaticPrecache(LevelInfo L)
{
    //return;    
}

// Export UPawn::execSetViewPitch(FFrame&, void* const)
native simulated function SetViewPitch(int NewPitch)
{
    //native.NewPitch;        
}

// Export UPawn::execSetTwistLook(FFrame&, void* const)
native simulated function SetTwistLook(int twist, int look)
{
    //native.twist;
    //native.look;        
}

// Export UPawn::execGet4WayDirection(FFrame&, void* const)
native simulated function int Get4WayDirection();

// Export UPawn::execGetIsEnableProne(FFrame&, void* const)
native simulated function bool GetIsEnableProne();

simulated event SetHeadScale(float NewScale)
{
    //return;    
}

simulated function AddNoWeaponChangeMessage(byte bySlot)
{
    //return;    
}

// Export UPawn::execGetDetailOffset(FFrame&, void* const)
native simulated function Vector GetDetailOffset(Vector vLoc, Rotator rRot)
{
    //native.vLoc;
    //native.rRot;        
}

simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY)
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x5E
    if((PC != none) && PC.myHUD != none)
    {
        PC.myHUD.DrawCustomBeacon(C, self, ScreenLocX, ScreenLocY);
    }
    //return;    
}

// Export UPawn::execReachedDestination(FFrame&, void* const)
native function bool ReachedDestination(Actor Goal)
{
    //native.Goal;        
}

// Export UPawn::execForceCrouch(FFrame&, void* const)
native function ForceCrouch();

// Export UPawn::execRefreshCollisionHash(FFrame&, void* const)
native function RefreshCollisionHash();

// Export UPawn::execCheckProneRotate(FFrame&, void* const)
native function bool CheckProneRotate(int CurYaw, int NewYaw)
{
    //native.CurYaw;
    //native.NewYaw;        
}

// Export UPawn::execForcePlayIdle(FFrame&, void* const)
native function ForcePlayIdle();

simulated function MakeShellEffect()
{
    //return;    
}

simulated function MakeShellEffect_Rechamber()
{
    //return;    
}

function int SpawnSupplyItem()
{
    //return;    
}

function SpawnMedals()
{
    //return;    
}

function int GetPostureIndex()
{
    // End:0x0F
    if(bIsProned)
    {
        return 2;        
    }
    else
    {
        // End:0x1D
        if(bIsCrouched)
        {
            return 1;            
        }
        else
        {
            return 0;
        }
    }
    //return;    
}

simulated function wWeapon GetDemoRecordingWeapon()
{
    local Inventory Inv;
    local int i;

    Inv = Inventory;
    J0x0B:

    // End:0x9A [Loop If]
    if(Inv != none)
    {
        // End:0x6B
        if((wWeapon(Inv) != none) && Inv.ThirdPersonActor != none)
        {
            Weapon = wWeapon(Inv);
            PendingWeapon = Weapon;
            Weapon.bSpectated = true;
            // [Explicit Break]
            goto J0x9A;
        }
        i++;
        // End:0x83
        if(i > 500)
        {
            return none;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x9A:

    return Weapon;
    //return;    
}

simulated function SetBaseEyeheight()
{
    // End:0x19
    if(!bIsCrouched)
    {
        BaseEyeHeight = default.BaseEyeHeight;        
    }
    else
    {
        BaseEyeHeight = default.BaseEyeHeightCroucned;
    }
    EyeHeight = BaseEyeHeight;
    //return;    
}

simulated function bool GetIsFiring()
{
    return false;
    //return;    
}

function Pawn GetAimTarget()
{
    return self;
    //return;    
}

function DeactivateSpawnProtection()
{
    SpawnTime = -100000.0000000;
    //return;    
}

function Actor GetPathTo(Actor Dest)
{
    // End:0x16
    if(PlayerController(Controller) == none)
    {
        return Dest;
    }
    return PlayerController(Controller).GetPathTo(Dest);
    //return;    
}

function PlayerChangedTeam()
{
    Died(none, Class'Engine_Decompressed.DamageType', Location);
    //return;    
}

function Reset()
{
    // End:0x40
    if((Controller == none) || Controller.bIsPlayer)
    {
        // End:0x3A
        if(Controller != none)
        {
            Controller.PawnDied(self);
        }
        Destroy();        
    }
    else
    {
        super.Reset();
    }
    DamageInfo.Length = 0;
    //return;    
}

function bool HasWeapon()
{
    return Weapon != none;
    //return;    
}

function bool HasWeaponByWeaponID(int weaponID)
{
    local Inventory i;
    local wWeapon W;

    i = Inventory;
    J0x0B:

    // End:0x6B [Loop If]
    if(i != none)
    {
        W = wWeapon(i);
        // End:0x54
        if(W != none)
        {
            // End:0x54
            if(W.BaseParams.iWeaponID == weaponID)
            {
                return true;
            }
        }
        i = i.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return;    
}

function wWeapon GetWeaponByInvenGroup(int nInvenGroupID)
{
    local Inventory i;
    local wWeapon W;

    i = Inventory;
    J0x0B:

    // End:0x6F [Loop If]
    if(i != none)
    {
        W = wWeapon(i);
        // End:0x58
        if(W != none)
        {
            // End:0x58
            if(W.BaseParams.iInventoryGroup == nInvenGroupID)
            {
                return W;
            }
        }
        i = i.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return;    
}

function ChooseFireAt(Actor A)
{
    Fire(0.0000000);
    //return;    
}

function bool StopWeaponFiring()
{
    // End:0x54
    if((Weapon != none) && Weapon.IsFiring())
    {
        Weapon.ServerStopFire(0);
        Weapon.ServerStopFire(1);
        Weapon.ServerStopFire(2);
        return true;
    }
    return false;
    //return;    
}

simulated function Fire(optional float f)
{
    // End:0x1F
    if(Weapon != none)
    {
        Weapon.Fire(f);
    }
    //return;    
}

simulated function AltFire(optional float f)
{
    // End:0x1F
    if(Weapon != none)
    {
        Weapon.AltFire(f);
    }
    //return;    
}

function bool RecommendLongRangedAttack()
{
    // End:0x1B
    if(Weapon != none)
    {
        return Weapon.RecommendLongRangedAttack();
    }
    return false;
    //return;    
}

function bool CanAttack(Actor Other)
{
    // End:0x0D
    if(Weapon == none)
    {
        return false;
    }
    return Weapon.CanAttack(Other);
    //return;    
}

function bool TooCloseToAttack(Actor Other)
{
    return false;
    //return;    
}

function float RefireRate()
{
    // End:0x1B
    if(Weapon != none)
    {
        return Weapon.RefireRate();
    }
    return 0.0000000;
    //return;    
}

function bool IsFiring()
{
    // End:0x1B
    if(Weapon != none)
    {
        return Weapon.IsFiring();
    }
    return false;
    //return;    
}

function bool IsWeaponSingleFire()
{
    // End:0x1B
    if(Weapon != none)
    {
        return Weapon.IsSingleFire();
    }
    return false;
    //return;    
}

function bool FireOnRelease()
{
    // End:0x1B
    if(Weapon != none)
    {
        return Weapon.FireOnRelease();
    }
    return false;
    //return;    
}

function bool NeedToTurn(Vector targ)
{
    local Vector LookDir, AimDir;

    LookDir = Vector(Rotation);
    LookDir.Z = 0.0000000;
    LookDir = Normal(LookDir);
    AimDir = targ - Location;
    AimDir.Z = 0.0000000;
    AimDir = Normal(AimDir);
    return (LookDir Dot AimDir) < 0.9300000;
    //return;    
}

function float ModifyThreat(float Current, Pawn Threat)
{
    return Current;
    //return;    
}

function DrawHUD(Canvas Canvas)
{
    //return;    
}

simulated function SpecialDrawCrosshair(Canvas C)
{
    //return;    
}

function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    //return;    
}

function bool SpectatorSpecialCalcView(PlayerController Viewer, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    //return;    
}

simulated function string GetHumanReadableName()
{
    // End:0x1A
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;
    }
    return MenuName;
    //return;    
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
    MakeNoise(1.0000000);
    //return;    
}

function HoldFlag(Actor FlagActor)
{
    //return;    
}

function DropFlag(optional string sReason)
{
    //return;    
}

function bool PerformDodge(Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross)
{
    //return;    
}

function NotifyTeamChanged()
{
    //return;    
}

function AddDefaultSkills(optional bool bQuickslotChange)
{
    //return;    
}

function ChangeInventoryByQSlot()
{
    //return;    
}

function PossessedBy(Controller C)
{
    Controller = C;
    NetPriority = 3.0000000;
    NetUpdateFrequency = C.BtrUpdateFrequency;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x7F
    if(C.PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo = C.PlayerReplicationInfo;
        OwnerName = PlayerReplicationInfo.PlayerName;
    }
    // End:0xD7
    if(C.IsA('PlayerController'))
    {
        // End:0xAD
        if(bSetPCRotOnPossess)
        {
            C.SetRotation(Rotation);
        }
        // End:0xCE
        if(int(Level.NetMode) != int(NM_Standalone))
        {
            RemoteRole = ROLE_AutonomousProxy;
        }
        BecomeViewTarget();        
    }
    else
    {
        RemoteRole = default.RemoteRole;
    }
    SetOwner(Controller);
    EyeHeight = BaseEyeHeight;
    ChangeAnimation();
    TeamIndex = GetTeamNum();
    //return;    
}

function UnPossessed()
{
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x2F
    if(DrivenVehicle != none)
    {
        NetUpdateFrequency = 5.0000000;
    }
    PlayerReplicationInfo = none;
    SetOwner(none);
    Controller = none;
    //return;    
}

simulated function bool PointOfView()
{
    return false;
    //return;    
}

function BecomeViewTarget()
{
    bUpdateEyeheight = true;
    //return;    
}

function DropToGround()
{
    bCollideWorld = true;
    bInterpolating = false;
    // End:0x45
    if(Health > 0)
    {
        SetCollision(true, true);
        SetPhysics(2);
        AmbientSound = none;
        // End:0x45
        if(IsHumanControlled())
        {
            Controller.GotoState(LandMovementState);
        }
    }
    //return;    
}

function bool CanGrabLadder()
{
    return ((bCanClimbLadders && Controller != none) && int(Physics) != int(11)) && (int(Physics) != int(2)) || Abs(Velocity.Z) <= JumpZ;
    //return;    
}

event SetSprinting(bool bNewIsSprinting)
{
    // End:0x24
    if(bNewIsSprinting != bIsSprinting)
    {
        bIsSprinting = bNewIsSprinting;
        ChangeAnimation();
    }
    //return;    
}

simulated function bool CanSplash()
{
    // End:0x70
    if((((Level.TimeSeconds - SplashTime) > 0.1500000) && (int(Physics) == int(2)) || int(Physics) == int(4)) && Abs(Velocity.Z) > float(100))
    {
        SplashTime = Level.TimeSeconds;
        return true;
    }
    return false;
    //return;    
}

function EndClimbLadder(LadderVolume OldLadder)
{
    // End:0x1A
    if(Controller != none)
    {
        Controller.EndClimbLadder();
    }
    // End:0x2F
    if(int(Physics) == int(11))
    {
        SetPhysics(2);
    }
    //return;    
}

function ClimbLadder(LadderVolume L)
{
    OnLadder = L;
    SetPhysics(11);
    // End:0x29
    if(IsHumanControlled())
    {
        Controller.GotoState('PlayerClimbing');
    }
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local name Anim;
    local float frame, Rate;
    local Vector camLoc, AxisX, AxisY, AxisZ;
    local Rotator camRot;
    local string t;

    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.GetCameraLocation(camLoc, camRot);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("CamLoc: " $ string(camLoc)) $ " / CamRot: ") $ string(camRot)) $ " / DrivenVehicle : ") $ string(DrivenVehicle));
    GetAnimParams(1, Anim, frame, Rate);
    t = (((((("HIJ - CH 1 AnimSequence " $ string(Anim)) $ " Frame ") $ string(frame)) $ " Rate ") $ string(Rate)) $ " // Physics : ") $ string(Physics);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText(t);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("Animation Action " $ string(AnimAction)) $ " Health ") $ string(Health));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("Anchor " $ string(Anchor)) $ " Serpentine Dist ") $ string(SerpentineDist)) $ " Time ") $ string(SerpentineTime));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    t = (((((("Floor " $ string(Floor)) $ " DesiredSpeed ") $ string(DesiredSpeed)) $ " Crouched ") $ string(bIsCrouched)) $ " Try to uncrouch ") $ string(UncrouchTime);
    // End:0x31F
    if((OnLadder != none) || int(Physics) == int(11))
    {
        t = (t $ " on ladder ") $ string(OnLadder);
    }
    Canvas.DrawText(t);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("EyeHeight " $ string(EyeHeight)) $ " BaseEyeHeight ") $ string(BaseEyeHeight)) $ " Physics Anim ") $ string(bPhysicsAnimUpdate));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("[WalkBob] " $ string(WalkBob)) $ " / [WalkBobCamera] ") $ string(WalkBobCamera));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    GetAxes(Rotation, AxisX, AxisY, AxisZ);
    Canvas.DrawText((((("[AxisX] " $ string(AxisX)) $ " / [AxisY] ") $ string(AxisY)) $ "/ [AxisZ] ") $ string(AxisZ));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((((("[BobTimeX] " $ string(bobTimeX)) $ " / [BobTimeY] ") $ string(bobTimeY)) $ "/ [BobTimeZ] ") $ string(bobTimeZ));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText("[AppliedBob] " $ string(AppliedBob));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    // End:0x5EC
    if(Controller == none)
    {
        Canvas.SetDrawColor(byte(255), 0, 0);
        Canvas.DrawText("NO CONTROLLER");
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);        
    }
    else
    {
        // End:0x6B6
        if(Controller.PlayerReplicationInfo != none)
        {
            Canvas.SetDrawColor(byte(255), 0, 0);
            YPos += YL;
            Canvas.SetPos(4.0000000, YPos);
            YPos += YL;
            Canvas.SetPos(4.0000000, YPos);
            Canvas.DrawText("Owned by " $ Controller.PlayerReplicationInfo.PlayerName);
            YPos += YL;
            Canvas.SetPos(4.0000000, YPos);
        }
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        Controller.DisplayDebug(Canvas, YL, YPos);
    }
    // End:0x75A
    if(Weapon == none)
    {
        Canvas.SetDrawColor(0, byte(255), 0);
        Canvas.DrawText("NO WEAPON");
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);        
    }
    else
    {
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        Weapon.DisplayDebug(Canvas, YL, YPos);
    }
    //return;    
}

simulated function Vector CalcDrawOffset(Inventory Inv)
{
    local Vector DrawOffset;

    // End:0x38
    if(Controller == none)
    {
        return (Inv.PlayerViewOffset >> Rotation) + (BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
    }
    DrawOffset = GetDetailOffset(((0.9000000 / Weapon.DisplayFOV) * float(100)) * (ModifiedPlayerViewOffset(Inv)), GetViewRotation());
    // End:0x91
    if(!IsLocallyControlled())
    {
        DrawOffset.Z += BaseEyeHeight;        
    }
    else
    {
        DrawOffset.Z += EyeHeight;
        // End:0xC6
        if(bWeaponBob)
        {
            DrawOffset += (WeaponBob(Inv.BobDamping));
        }
        DrawOffset += (CameraShake());
    }
    return DrawOffset;
    //return;    
}

simulated function Vector CalcFPSpectatorDrawOffset(Vector VOffset, Rotator rRotation, Vector vBobOffset)
{
    local Vector DrawOffset;

    DrawOffset = GetDetailOffset(((0.9000000 / float(60)) * float(100)) * VOffset, rRotation);
    DrawOffset.Z += EyeHeight;
    // End:0x55
    if(bWeaponBob)
    {
        DrawOffset += (WeaponBob(0.9600000));
    }
    DrawOffset = (DrawOffset + vBobOffset) + (CameraShake());
    return DrawOffset;
    //return;    
}

simulated function Vector CameraShake()
{
    local Vector X, Y, Z, shakevect;
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x21
    if(PC == none)
    {
        return shakevect;
    }
    GetAxes(PC.Rotation, X, Y, Z);
    shakevect = ((PC.ShakeOffset.X * X) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
    return shakevect;
    //return;    
}

simulated function Vector ModifiedPlayerViewOffset(Inventory Inv)
{
    return Inv.PlayerViewOffset;
    //return;    
}

simulated function Vector WeaponBob(float BobDamping)
{
    local Vector WBob;

    WBob = BobDamping * WalkBob;
    WBob.Z = (0.4500000 + (0.5500000 * BobDamping)) * WalkBob.Z;
    WBob.Z += LandBob;
    WBob += WalkBobCamera;
    return WBob;
    //return;    
}

function float GetMaxSpeed()
{
    local float MaxSpeed;

    // End:0x34
    if(bIsCrouched == true)
    {
        // End:0x26
        if(bIsAiming == true)
        {
            MaxSpeed = AimedCrouchedSpeed;            
        }
        else
        {
            MaxSpeed = CrouchedSpeed;
        }        
    }
    else
    {
        // End:0x4E
        if(bIsProned == true)
        {
            MaxSpeed = PronedSpeed;            
        }
        else
        {
            // End:0x68
            if(bIsAiming == true)
            {
                MaxSpeed = AimedGroundSpeed;                
            }
            else
            {
                MaxSpeed = GroundSpeed;
            }
        }
    }
    return MaxSpeed;
    //return;    
}

function GetBobParam(out float Bob, out float BobCamera, out float fBobZ, out float fBobCameraZ)
{
    local float fSprintIntensity;

    // End:0x3A
    if(Weapon == none)
    {
        Bob = 0.0000000;
        BobCamera = 0.0000000;
        fBobZ = 0.4000000;
        fBobCameraZ = 0.4000000;        
    }
    else
    {
        // End:0x234
        if(!bIsSprinting)
        {
            // End:0xC5
            if(bIsCrouched)
            {
                Bob = Weapon.BaseParams.fBobWeapon_Ducked_Move;
                BobCamera = Weapon.BaseParams.fBobScreen_Ducked_Move;
                fBobZ = Weapon.BaseParams.fBobWeapon_ducked_move_y;
                fBobCameraZ = Weapon.BaseParams.fBobScreen_ducked_move_y;                
            }
            else
            {
                // End:0x133
                if(bIsProned)
                {
                    Bob = 0.0000000;
                    BobCamera = Weapon.BaseParams.fBobScreen_Prone_Move;
                    fBobZ = Weapon.BaseParams.fBobScreen_Prone_Move;
                    fBobCameraZ = Weapon.BaseParams.fBobScreen_Prone_Move;                    
                }
                else
                {
                    Bob = Weapon.BaseParams.fBobWeapon_Move;
                    BobCamera = Weapon.BaseParams.fBobScreen_Move;
                    fBobZ = Weapon.BaseParams.fBobWeapon_move_y;
                    fBobCameraZ = Weapon.BaseParams.fBobScreen_move_y;
                }
            }
            // End:0x231
            if(bIsAiming && !bIsProned)
            {
                Bob = Weapon.BaseParams.fBobWeapon_Ads_Move;
                BobCamera = Weapon.BaseParams.fBobScreen_Ads_Move;
                fBobZ = Weapon.BaseParams.fBobWeapon_ads_move_y;
                fBobCameraZ = Weapon.BaseParams.fBobScreen_ads_move_y;
            }            
        }
        else
        {
            Bob = Weapon.BaseParams.fBobWeapon_Sprint_Move;
            BobCamera = Weapon.BaseParams.fBobScreen_Sprint_Move;
            fBobZ = Weapon.BaseParams.fBobWeapon_sprint_y;
            fBobCameraZ = Weapon.BaseParams.fBobScreen_sprint_y;
            fSprintIntensity = FClamp(Controller.fSprintPassTime / 5.0000000, 0.0000000, 1.0000000);
            BobCamera *= fSprintIntensity;
        }
    }
    //return;    
}

function CheckBob(float DeltaTime, Vector Y)
{
    local float Speed2D, BobCamera, MaxSpeed, fRatioSpeed;
    local Rotator rotTemp;
    local bool bWeaponBobZ;
    local float fBobAdd, fBobZ, fBobCameraZ, fBobRot;

    fBobAdd = 1.0000000;
    fBobZ = 0.4000000;
    fBobCameraZ = 0.4000000;
    fBobRot = 150.0000000;
    // End:0x46
    if(float(0) < VSize(Velocity))
    {
        bWeaponBob = true;        
    }
    else
    {
        bWeaponBob = false;
    }
    // End:0xE6
    if(((none == Weapon) || !bWeaponBob) || bWeaponBobZ)
    {
        bobtime = 0.0000000;
        WalkBob = vect(0.0000000, 0.0000000, 0.0000000);
        WalkBobCamera = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0xE4
        if((wGun(Weapon) != none) && bIsAiming)
        {
            wGun(Weapon).SetWalkingSwayRot(Normalize(rot(0, 0, 0)));
        }
        return;
    }
    GetBobParam(Bob, BobCamera, fBobZ, fBobCameraZ);
    // End:0x148
    if((!bIsProned && !bIsAiming) && Bob == float(0))
    {
        Bob = default.Bob;
        // End:0x148
        if(!bIsSprinting)
        {
            Bob = 0.0005000;
        }
    }
    Bob = FClamp(Bob, -0.0100000, 0.0100000);
    BobCamera = FClamp(BobCamera, -0.0400000, 0.0400000);
    // End:0x436
    if(int(Physics) == int(1))
    {
        Speed2D = VSize(Velocity);
        // End:0x1B7
        if(Speed2D < float(10))
        {
            bobtime += (0.2000000 * DeltaTime);            
        }
        else
        {
            MaxSpeed = GetMaxSpeed();
            bobtime += (DeltaTime * (0.3000000 + ((0.7000000 * Speed2D) / MaxSpeed)));
        }
        WalkBob = ((Y * Bob) * Speed2D) * Sin(8.0000000 * bobtime);
        WalkBobCamera = ((Y * BobCamera) * Speed2D) * Sin(8.0000000 * bobtime);
        AppliedBob = AppliedBob * (float(1) - FMin(1.0000000, 16.0000000 * DeltaTime));
        WalkBob.Z = AppliedBob;
        WalkBobCamera.Z = AppliedBob;
        fRatioSpeed = Speed2D / (GetMaxSpeed());
        WalkBob.Z = (Sqrt(Sin(8.0000000 * bobtime) * Sin(8.0000000 * bobtime)) * fBobZ) * fRatioSpeed;
        // End:0x319
        if(Level.GetIsUseAdvCamShake())
        {
            WalkBobCamera.Z = (Sqrt(Sin(8.0000000 * bobtime) * Sin(8.0000000 * bobtime)) * fBobCameraZ) * fRatioSpeed;
        }
        rotTemp.Yaw = int((Sin(8.0000000 * bobtime) * fBobRot) * fRatioSpeed);
        // End:0x3A6
        if(wGun(Weapon) != none)
        {
            // End:0x37F
            if(!bIsAiming)
            {
                wGun(Weapon).SetWalkingSwayRot(Normalize(rotTemp));                
            }
            else
            {
                wGun(Weapon).SetWalkingSwayRot(Normalize(rot(0, 0, 0)));
            }
        }
        bobTimeZ = 0.0000000;
        // End:0x433
        if(Speed2D > float(10))
        {
            WalkBob.Z = WalkBob.Z + (((WalkZDamp * Bob) * Speed2D) * Sin(16.0000000 * bobtime));
            WalkBobCamera.Z = WalkBobCamera.Z + (((WalkZDamp * BobCamera) * Speed2D) * Sin(16.0000000 * bobtime));
        }        
    }
    else
    {
        // End:0x4E9
        if(int(Physics) == int(3))
        {
            bobtime += DeltaTime;
            Speed2D = Sqrt((Velocity.X * Velocity.X) + (Velocity.Y * Velocity.Y));
            WalkBob = (((Y * Bob) * 0.5000000) * Speed2D) * Sin(4.0000000 * bobtime);
            WalkBob.Z = ((Bob * 1.5000000) * Speed2D) * Sin(8.0000000 * bobtime);            
        }
        else
        {
            bobtime = 0.0000000;
            WalkBob = WalkBob * (float(1) - FMin(1.0000000, 8.0000000 * DeltaTime));
            WalkBobCamera = WalkBobCamera * (float(1) - FMin(1.0000000, 8.0000000 * DeltaTime));
        }
    }
    //return;    
}

simulated function InitialPlayer()
{
    //return;    
}

// Export UPawn::execForceStandup(FFrame&, void* const)
native simulated function ForceStandup();

simulated event StartDriving(Vehicle V)
{
    local Controller VehicleController;

    ForceStandup();
    InitialPlayer();
    // End:0x26
    if(int(Role) == int(ROLE_Authority))
    {
        ClientSetTurretingMode(true);        
    }
    else
    {
        // End:0x3D
        if(int(Role) < int(ROLE_Authority))
        {
            ServerSetTurretingMode(true);
        }
    }
    DrivenVehicle = V;
    NetUpdateTime = Level.TimeSeconds - float(1);
    AmbientSound = none;
    StopWeaponFiring();
    DeactivateSpawnProtection();
    bWantsToProne = false;
    bWantsToCrouch = false;
    bIsCrouching = false;
    bIsProning = false;
    bIsStanding = false;
    byGoToProne = 0;
    Controller.bProne = 0;
    Controller.bDuck = 0;
    Controller.bGotoProne = 0;
    Controller.byGoCrouch = 0;
    Controller.byGoProne = 0;
    bIgnoreForces = true;
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    bCanTeleport = false;
    // End:0x1BE
    if(!V.bRemoteControlled || V.bHideRemoteDriver)
    {
        V.AttachDriver(self);
        // End:0x187
        if(V.bDrawDriverInTP)
        {
            CullDistance = 5000.0000000;            
        }
        else
        {
            // End:0x1AE
            if(V.IsA('wTurret_FNM240'))
            {
                bHidden = false;
                bNotDrawSelf = true;                
            }
            else
            {
                bHidden = true;
                bNotDrawSelf = false;
            }
        }
    }
    bWaitForAnim = false;
    // End:0x1E4
    if(int(Role) == int(ROLE_Authority))
    {
        VehicleController = Controller;        
    }
    else
    {
        // End:0x208
        if(int(Role) < int(ROLE_Authority))
        {
            VehicleController = V.Controller;
        }
    }
    // End:0x258
    if(VehicleController == Level.GetLocalPlayerController())
    {
        // End:0x248
        if(V.IsA('wTurret_FNM240'))
        {
            bHidden = false;
            bNotDrawSelf = true;            
        }
        else
        {
            bHidden = true;
            bNotDrawSelf = false;
        }
    }
    //return;    
}

simulated event StopDriving(Vehicle V)
{
    InitialPlayer();
    // End:0x4B
    if((int(Role) == int(ROLE_Authority)) && PlayerController(Controller) != none)
    {
        V.PlayerStartTime = Level.TimeSeconds + float(12);
    }
    CullDistance = default.CullDistance;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0xA8
    if((V != none) && V.Weapon != none)
    {
        V.Weapon.ImmediateStopFire();
    }
    // End:0xBA
    if(int(Physics) == int(13))
    {
        return;
    }
    DrivenVehicle = none;
    bIgnoreForces = false;
    bHardAttach = false;
    bWaitForAnim = false;
    bCanTeleport = true;
    ForcePlayIdle();
    // End:0x102
    if(V != none)
    {
        V.DetachDriver(self);
    }
    // End:0x185
    if((int(Role) == int(ROLE_Authority)) && Health > 0)
    {
        // End:0x185
        if(!V.bRemoteControlled || V.bHideRemoteDriver)
        {
            Acceleration = vect(0.0000000, 0.0000000, 24000.0000000);
            // End:0x174
            if(PhysicsVolume.bWaterVolume)
            {
                SetPhysics(3);                
            }
            else
            {
                SetPhysics(2);
            }
            SetBase(none);
            bHidden = false;
        }
    }
    bOwnerNoSee = default.bOwnerNoSee;
    // End:0x1C3
    if(Weapon != none)
    {
        PendingWeapon = none;
        Weapon.AttachToPawn(self);
        Weapon.BringUp();
    }
    // End:0x1DD
    if(int(Role) == int(ROLE_Authority))
    {
        ClientSetTurretingMode(false);        
    }
    else
    {
        // End:0x1FC
        if(int(Role) < int(ROLE_Authority))
        {
            bIsTurreting = false;
            ServerSetTurretingMode(false);
        }
    }
    // End:0x210
    if(bHidden == true)
    {
        bHidden = false;
    }
    bNotDrawSelf = false;
    //return;    
}

simulated function bool FindValidTaunt(out name Sequence)
{
    return true;
    //return;    
}

simulated function bool CheckTauntValid(name Sequence)
{
    return FindValidTaunt(Sequence);
    //return;    
}

simulated function bool IsPlayerPawn()
{
    return (Controller != none) && Controller.bIsPlayer;
    //return;    
}

simulated function bool WasPlayerPawn()
{
    return false;
    //return;    
}

simulated function bool IsHumanControlled()
{
    return PlayerController(Controller) != none;
    //return;    
}

simulated function bool IsLocallyControlled()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        return true;
    }
    // End:0x28
    if(Controller == none)
    {
        return false;
    }
    // End:0x3A
    if(PlayerController(Controller) == none)
    {
        return true;
    }
    return Viewport(PlayerController(Controller).Player) != none;
    //return;    
}

simulated function bool IsFirstPerson()
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    return ((PC != none) && !PC.bBehindView) && Viewport(PC.Player) != none;
    //return;    
}

simulated function bool IsLocalPlayerViewtarget()
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    return PC.ViewTarget == self;
    //return;    
}

simulated function Rotator GetViewRotation()
{
    local PlayerController PC;
    local Rotator rReturn;

    // End:0x11
    if(Controller == none)
    {
        return Rotation;
    }
    PC = PlayerController(Controller);
    // End:0x14D
    if(PC != none)
    {
        rReturn = ((Controller.GetViewRotation() + PC.ShakeRot) + PC.wShakeRot) + PC.wShockRot;
        // End:0x144
        if((Weapon != none) && Weapon.IsA('wGun'))
        {
            // End:0x10A
            if(((int(wGun(Weapon).AimState) == int(2)) && Weapon.GetFireMode(1) != none) && Weapon.GetFireMode(1).IsA('wZoomFire3D'))
            {
                rReturn = rReturn + PC.wBreathRot;
            }
            // End:0x144
            if(int(wGun(Weapon).AimState) == int(2))
            {
                rReturn = rReturn + PC.wAttackedRot;
            }
        }
        return rReturn;        
    }
    else
    {
        return Controller.GetViewRotation();
    }
    //return;    
}

simulated function Rotator GetViewRotationForFP()
{
    return Controller.GetViewRotation();
    //return;    
}

simulated function SetViewRotation(Rotator NewRotation)
{
    // End:0x1C
    if(Controller != none)
    {
        Controller.SetRotation(NewRotation);
    }
    //return;    
}

final function bool InGodMode()
{
    return (Controller != none) && Controller.bGodMode;
    //return;    
}

function bool NearMoveTarget()
{
    // End:0x23
    if((Controller == none) || Controller.MoveTarget == none)
    {
        return false;
    }
    return ReachedDestination(Controller.MoveTarget);
    //return;    
}

final simulated function bool PressingFire()
{
    return (Controller != none) && int(Controller.bFire) != 0;
    //return;    
}

final simulated function bool PressingAltFire()
{
    return (Controller != none) && int(Controller.bAltFire) != 0;
    //return;    
}

function Actor GetMoveTarget()
{
    // End:0x0D
    if(Controller == none)
    {
        return none;
    }
    return Controller.MoveTarget;
    //return;    
}

function SetMoveTarget(Actor NewTarget)
{
    // End:0x1F
    if(Controller != none)
    {
        Controller.MoveTarget = NewTarget;
    }
    //return;    
}

function bool LineOfSightTo(Actor Other)
{
    return (Controller != none) && Controller.LineOfSightTo(Other);
    //return;    
}

final simulated function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    // End:0x11
    if(Controller == none)
    {
        return Rotation;
    }
    return Controller.AdjustAim(FiredAmmunition, projStart, AimError);
    //return;    
}

function Actor ShootSpecial(Actor A)
{
    // End:0x23
    if(!Controller.bCanDoSpecial || Weapon == none)
    {
        return none;
    }
    SetRotation(Rotator(A.Location - Location));
    Controller.Focus = A;
    Controller.FireWeaponAt(A);
    return A;
    //return;    
}

function float AdjustedStrength()
{
    return 0.0000000;
    //return;    
}

function HandlePickup(Pickup pick)
{
    MakeNoise(0.2000000);
    // End:0x27
    if(Controller != none)
    {
        Controller.HandlePickup(pick);
    }
    //return;    
}

function ReceiveLocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x3D
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    //return;    
}

event ClientMessage(coerce string S, optional name Type)
{
    // End:0x2E
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).ClientMessage(S, Type);
    }
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x24
    if(Controller != none)
    {
        Controller.Trigger(Other, EventInstigator);
    }
    //return;    
}

function bool CanTrigger(Trigger t)
{
    return true;
    //return;    
}

function Inventory CreateInventory(string InventoryClassName)
{
    return none;
    //return;    
}

function GiveWeapon(string aClassName)
{
    local Class<wWeapon> WeaponClass;
    local wWeapon newWeapon;

    WeaponClass = Class<wWeapon>(DynamicLoadObject(aClassName, Class'Core.Class'));
    // End:0x2E
    if((FindInventoryType(WeaponClass)) != none)
    {
        return;
    }
    newWeapon = Spawn(WeaponClass);
    // End:0x57
    if(newWeapon != none)
    {
        newWeapon.GiveTo(self);
    }
    //return;    
}

function SetDisplayProperties(Actor.ERenderStyle NewStyle, Material NewTexture, bool bLighting)
{
    Style = NewStyle;
    Texture = NewTexture;
    bUnlit = bLighting;
    // End:0x4D
    if(Weapon != none)
    {
        Weapon.SetDisplayProperties(Style, Texture, bUnlit);
    }
    // End:0x7C
    if(!bUpdatingDisplay && Inventory != none)
    {
        bUpdatingDisplay = true;
        Inventory.SetOwnerDisplay();
    }
    bUpdatingDisplay = false;
    //return;    
}

function SetDefaultDisplayProperties()
{
    Style = default.Style;
    Texture = default.Texture;
    bUnlit = default.bUnlit;
    // End:0x3D
    if(Weapon != none)
    {
        Weapon.SetDefaultDisplayProperties();
    }
    // End:0x6C
    if(!bUpdatingDisplay && Inventory != none)
    {
        bUpdatingDisplay = true;
        Inventory.SetOwnerDisplay();
    }
    bUpdatingDisplay = false;
    //return;    
}

function FinishedInterpolation()
{
    DropToGround();
    //return;    
}

function JumpOutOfWater(Vector jumpDir)
{
    Falling();
    Velocity = jumpDir * WaterSpeed;
    Acceleration = jumpDir * AccelRate;
    Velocity.Z = FMax(380.0000000, JumpZ);
    bUpAndOut = true;
    //return;    
}

simulated event ModifyVelocity(float DeltaTime, Vector OldVelocity)
{
    //return;    
}

event FellOutOfWorld(Actor.eKillZType KillType)
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_Client))
    {
        return;
    }
    // End:0x3C
    if((Controller != none) && Controller.AvoidCertainDeath())
    {
        return;
    }
    Health = -1;
    // End:0x6B
    if(int(KillType) == int(1))
    {
        Died(none, Class'Engine_Decompressed.FellLava', Location);        
    }
    else
    {
        // End:0x8F
        if(int(KillType) == int(2))
        {
            Died(none, Class'Engine_Decompressed.fell', Location);            
        }
        else
        {
            // End:0xA4
            if(int(Physics) != int(13))
            {
                SetPhysics(0);
            }
            Died(none, Class'Engine_Decompressed.fell', Location);
        }
    }
    //return;    
}

function ShouldCrouch(bool crouch)
{
    // End:0x1E
    if(bWantsToCrouch != crouch)
    {
        bWantsToCrouch = crouch;
    }
    //return;    
}

function ShouldProne(bool Prone)
{
    // End:0x1E
    if(bWantsToProne != Prone)
    {
        bWantsToProne = Prone;
    }
    //return;    
}

simulated function ServerSetUseKeyState(byte byKey)
{
    byUseKey = byKey;
    //return;    
}

event EndCrouch(float HeightAdjust)
{
    EyeHeight -= HeightAdjust;
    OldZ += HeightAdjust;
    BaseEyeHeight = default.BaseEyeHeight;
    Weapon.GetFireMode(0).SetSpreadStance(1);
    bIsStanding = true;
    // End:0x71
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).fStandingTimeCount = 0.0000000;
    }
    //return;    
}

event StartCrouch(float HeightAdjust)
{
    EyeHeight += HeightAdjust;
    OldZ -= HeightAdjust;
    BaseEyeHeight = default.BaseEyeHeightCroucned;
    Weapon.GetFireMode(0).SetSpreadStance(2);
    bIsCrouching = true;
    bIsStanding = false;
    // End:0x92
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).fCrouchingTimeCount = 0.0000000;
        PlayerController(Controller).fStandingTimeCount = 0.0000000;
    }
    //return;    
}

event EndProne(float HeightAdjust)
{
    EyeHeight -= HeightAdjust;
    OldZ += HeightAdjust;
    BaseEyeHeight = default.BaseEyeHeightCroucned;
    Weapon.GetFireMode(0).SetSpreadStance(2);
    bIsCrouching = true;
    // End:0x71
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).fCrouchingTimeCount = 0.0000000;
    }
    //return;    
}

event StartProne(float HeightAdjust)
{
    EyeHeight += HeightAdjust;
    OldZ -= HeightAdjust;
    BaseEyeHeight = default.BaseEyeHeightProned;
    Weapon.GetFireMode(0).SetSpreadStance(3);
    bIsProning = true;
    // End:0x71
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).fProningTimeCount = 0.0000000;
    }
    //return;    
}

function RestartPlayer()
{
    //return;    
}

function AddVelocity(Vector NewVelocity)
{
    // End:0x24
    if(bIgnoreForces || NewVelocity == vect(0.0000000, 0.0000000, 0.0000000))
    {
        return;
    }
    // End:0x52
    if((int(Physics) == int(2)) && AIController(Controller) != none)
    {
        ImpactVelocity += NewVelocity;
    }
    // End:0xA1
    if((int(Physics) == int(1)) || ((int(Physics) == int(11)) || int(Physics) == int(9)) && NewVelocity.Z > default.JumpZ)
    {
        SetPhysics(2);
    }
    // End:0xDC
    if((Velocity.Z > float(380)) && NewVelocity.Z > float(0))
    {
        NewVelocity.Z *= 0.5000000;
    }
    Velocity += NewVelocity;
    //return;    
}

function KilledBy(Pawn EventInstigator)
{
    local Controller Killer;

    Health = 0;
    // End:0x26
    if(EventInstigator != none)
    {
        Killer = EventInstigator.Controller;
    }
    Died(Killer, Class'Engine_Decompressed.Suicided', Location);
    //return;    
}

function TakeFallingDamage()
{
    local float Shake, EffectiveSpeed;

    // End:0x128
    if(Velocity.Z < (-0.5000000 * MaxFallSpeed))
    {
        // End:0xDF
        if(int(Role) == int(ROLE_Authority))
        {
            MakeNoise(1.0000000);
            // End:0xDF
            if(Velocity.Z < (float(-1) * MaxFallSpeed))
            {
                EffectiveSpeed = Velocity.Z;
                // End:0x81
                if(TouchingWaterVolume())
                {
                    EffectiveSpeed = FMin(0.0000000, EffectiveSpeed + float(100));
                }
                // End:0xDF
                if(EffectiveSpeed < (float(-1) * MaxFallSpeed))
                {
                    TakeDamage(int(FClamp((-100.0000000 * (EffectiveSpeed + MaxFallSpeed)) / MaxFallSpeed, 0.0000000, 20.0000000)), none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine_Decompressed.fell');
                }
            }
        }
        // End:0x125
        if(Controller != none)
        {
            Shake = FMin(1.0000000, (-1.0000000 * Velocity.Z) / MaxFallSpeed);
            Controller.DamageShake(int(Shake));
        }        
    }
    else
    {
        // End:0x14B
        if(Velocity.Z < (-1.4000000 * JumpZ))
        {
            MakeNoise(0.5000000);
        }
    }
    //return;    
}

function ClientReStart()
{
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    BaseEyeHeight = default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
    PlayWaiting();
    //return;    
}

function ClientSetLocation(Vector NewLocation, Rotator NewRotation)
{
    // End:0x24
    if(Controller != none)
    {
        Controller.ClientSetLocation(NewLocation, NewRotation);
    }
    //return;    
}

function ClientSetRotation(Rotator NewRotation)
{
    // End:0x1F
    if(Controller != none)
    {
        Controller.ClientSetRotation(NewRotation);
    }
    //return;    
}

simulated function FaceRotation(Rotator NewRotation, float DeltaTime)
{
    // End:0x2B
    if(int(Physics) == int(11))
    {
        NewRotation.Pitch = 0;
        NewRotation.Roll = 0;        
    }
    else
    {
        // End:0x59
        if((int(Physics) == int(1)) || int(Physics) == int(2))
        {
            NewRotation.Pitch = 0;
        }
    }
    SetRotation(NewRotation);
    //return;    
}

function int LimitPitch(int Pitch)
{
    Pitch = Pitch & 65535;
    // End:0x68
    if((Pitch > PitchUpLimit) && Pitch < PitchDownLimit)
    {
        // End:0x5D
        if((Pitch - PitchUpLimit) < (PitchDownLimit - Pitch))
        {
            Pitch = PitchUpLimit;            
        }
        else
        {
            Pitch = PitchDownLimit;
        }
    }
    return Pitch;
    //return;    
}

function ClientDying(Class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x24
    if(Controller != none)
    {
        Controller.ClientDying(DamageType, HitLocation);
    }
    //return;    
}

function DoComboName(string ComboClassName)
{
    //return;    
}

function bool InCurrentCombo()
{
    return false;
    //return;    
}

function EnableUDamage(float Amount)
{
    //return;    
}

function DisableUDamage()
{
    //return;    
}

function float GetShieldStrengthMax()
{
    //return;    
}

function float GetShieldStrength()
{
    //return;    
}

function bool AddShieldStrength(int Amount)
{
    //return;    
}

function int CanUseShield(int Amount)
{
    //return;    
}

simulated function bool CanThrowWeapon()
{
    return ((Weapon != none) && Weapon.CanThrow()) && Level.Game.bAllowWeaponThrowing;
    //return;    
}

function TossWeapon(Vector TossVel)
{
    local Rotator rToss;

    Weapon.Velocity = TossVel;
    rToss = Rotation;
    rToss.Roll = 16384;
    Weapon.DropFrom(Location, rToss);
    //return;    
}

function CheckTouchWeaponPickup()
{
    local wWeaponPickup WPick;

    // End:0x42
    foreach TouchingActors(Class'Engine_Decompressed.wWeaponPickup', WPick)
    {
        // End:0x41
        if(WPick.ValidTouch(self))
        {
            kPendingWPick = WPick;
            WPick.AddTouchingPawn(self);            
            return;
        }        
    }    
    kPendingWPick = none;
    //return;    
}

function CheckEntryVehicle()
{
    local Vehicle V;
    local int lp1;

    EntryVehicle = none;
    // End:0xD0
    if(int(Physics) == int(1))
    {
        lp1 = 0;
        J0x1E:

        // End:0xD0 [Loop If]
        if(lp1 < Level.Vehicles.Length)
        {
            V = Level.Vehicles[lp1];
            // End:0xC6
            if(((V != none) && VSize(Location - V.Location) < float(200)) && Level.FastTrace(Location, V.Location))
            {
                EntryVehicle = V.FindEntryVehicle(self);
                // End:0xC6
                if(EntryVehicle != none)
                {
                    // [Explicit Break]
                    goto J0xD0;
                }
            }
            lp1++;
            // [Loop Continue]
            goto J0x1E;
        }
    }
    J0xD0:

    //return;    
}

function ServerPickupWeapon()
{
    // End:0x0D
    if(kPendingWPick == none)
    {
        return;
    }
    kPendingWPick.PickWeapon(self);
    //return;    
}

simulated function ClientPickupWeapon()
{
    local PlayerController PC;

    // End:0x0D
    if(kPendingWPick == none)
    {
        return;
    }
    PC = PlayerController(Controller);
    // End:0x37
    if(PC != none)
    {
        PC.ClientResetAim();
    }
    ServerPickupWeapon();
    //return;    
}

exec function SwitchToLastWeapon()
{
    // End:0x1CB
    if(Weapon != none)
    {
        // End:0x7A
        if((Weapon.OldWeapon != none) && Weapon.OldWeapon.HasAmmo())
        {
            PendingWeapon = Weapon.OldWeapon;
            // End:0x77
            if(Weapon.PutDown())
            {
                ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);
            }            
        }
        else
        {
            // End:0x1CB
            if(Weapon.IsA('wDemopack') && (Weapon.OldWeapon == none) || Weapon.OldWeapon.IsA('wDemopack'))
            {
                Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(1);
                // End:0x121
                if(Weapon.OldWeapon == none)
                {
                    Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(2);
                }
                // End:0x190
                if(int(Level.GetMatchMaker().3) == int(Level.GetMatchMaker().eWeaponLimit))
                {
                    // End:0x190
                    if(Weapon.OldWeapon == none)
                    {
                        Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(3);
                    }
                }
                PendingWeapon = Weapon.OldWeapon;
                // End:0x1CB
                if(Weapon.PutDown())
                {
                    ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);
                }
            }
        }
    }
    //return;    
}

simulated function SwitchToLastWeapon_ThrowsWeapon()
{
    // End:0x17E
    if(Weapon != none)
    {
        // End:0x8B
        if((Weapon.OldWeapon != none) && Weapon.OldWeapon.HasAmmo())
        {
            PendingWeapon = Weapon.OldWeapon;
            // End:0x88
            if(Weapon.PutDown())
            {
                ServerThrowsWeaponAnim(Weapon.bQuickDropAnim);
                Weapon.byActionThrowsWeapon = 2;
            }            
        }
        else
        {
            // End:0x17E
            if(Weapon.IsA('wDemopack') && (Weapon.OldWeapon == none) || Weapon.OldWeapon.IsA('wDemopack'))
            {
                Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(1);
                // End:0x132
                if(Weapon.OldWeapon == none)
                {
                    Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(2);
                }
                PendingWeapon = Weapon.OldWeapon;
                // End:0x17E
                if(Weapon.PutDown())
                {
                    ServerThrowsWeaponAnim(Weapon.bQuickDropAnim);
                    Weapon.byActionThrowsWeapon = 2;
                }
            }
        }
    }
    //return;    
}

simulated function PrevWeapon()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x3F
    if((Weapon == none) && Controller != none)
    {
        Controller.SwitchToBestWeapon();
        return;
    }
    // End:0x7C
    if(PendingWeapon != none)
    {
        // End:0x5E
        if(PendingWeapon.bForceSwitch)
        {
            return;
        }
        PendingWeapon = Inventory.PrevWeapon(none, PendingWeapon);        
    }
    else
    {
        PendingWeapon = Inventory.PrevWeapon(none, Weapon);
    }
    // End:0xB1
    if(PendingWeapon != none)
    {
        Weapon.PutDown();
    }
    //return;    
}

simulated function NextWeapon()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x3F
    if((Weapon == none) && Controller != none)
    {
        Controller.SwitchToBestWeapon();
        return;
    }
    // End:0x7C
    if(PendingWeapon != none)
    {
        // End:0x5E
        if(PendingWeapon.bForceSwitch)
        {
            return;
        }
        PendingWeapon = Inventory.NextWeapon(none, PendingWeapon);        
    }
    else
    {
        PendingWeapon = Inventory.NextWeapon(none, Weapon);
    }
    // End:0xB1
    if(PendingWeapon != none)
    {
        Weapon.PutDown();
    }
    //return;    
}

simulated function SelectPrevWeapon()
{
    // End:0x0D
    if(Weapon == none)
    {
        return;
    }
    // End:0xBE
    if(((Weapon.OldWeapon == none) || int(Weapon.OldWeapon.WeaponType) == int(10)) && Controller.IsA('PlayerController'))
    {
        // End:0x99
        if(int(Weapon.InventoryGroup) == 1)
        {
            Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(2);            
        }
        else
        {
            Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(1);
        }
    }
    // End:0xEF
    if(Weapon.OldWeapon != none)
    {
        SwitchWeapon(Weapon.OldWeapon.InventoryGroup);
    }
    //return;    
}

simulated function bool SwitchWeapon(byte f, optional bool bQuickGr)
{
    local wWeapon newWeapon;
    local wMatchMaker kMM;

    // End:0x23
    if((Level.Pauser != none) || Inventory == none)
    {
        return false;
    }
    // End:0x9F
    if((Weapon != none) && Weapon.Inventory != none)
    {
        // End:0x78
        if(int(f) == 250)
        {
            newWeapon = Weapon.Inventory.WeaponChangeWClass('wDemopack');            
        }
        else
        {
            newWeapon = Weapon.Inventory.WeaponChange(f, false);
        }        
    }
    else
    {
        newWeapon = none;
    }
    // End:0xF7
    if(newWeapon == none)
    {
        // End:0xDC
        if(int(f) == 250)
        {
            newWeapon = Inventory.WeaponChangeWClass('wDemopack');            
        }
        else
        {
            newWeapon = Inventory.WeaponChange(f, true);
        }
    }
    // End:0x12B
    if(newWeapon == none)
    {
        switch(f)
        {
            // End:0x10E
            case 3:
            // End:0x113
            case 4:
            // End:0x126
            case 5:
                AddNoWeaponChangeMessage(f);
                // End:0x129
                break;
            // End:0xFFFF
            default:
                break;
        }
        return false;
    }
    kMM = Level.GetMatchMaker();
    // End:0x1F9
    if(int(kMM.eWeaponLimit) != int(kMM.0))
    {
        // End:0x1F9
        if(!Controller.IsPermitSpecialMode(true, int(newWeapon.InventoryGroup), newWeapon.WeaponType, int(f)))
        {
            // End:0x1F7
            if((PlayerController(Controller) != none) && int(kMM.eWeaponLimit) == int(kMM.5))
            {
                PlayerController(Controller).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game_ImpSystem', Class'Engine_Decompressed.wMessage_Game_ImpSystem'.default.Code_HoldWeapon);
            }
            return false;
        }
    }
    // End:0x252
    if(int(newWeapon.WeaponType) == int(15))
    {
        // End:0x24F
        if(self.Controller.IsActiveHelicopter() == true)
        {
            PlayerController(Controller).myHUD.CallSkill(6, true, false);
            return true;
        }        
    }
    else
    {
        // End:0x2A8
        if(int(newWeapon.WeaponType) == int(14))
        {
            // End:0x2A8
            if(self.Controller.IsActiveAirFire() == true)
            {
                PlayerController(Controller).myHUD.CallSkill(6, true, false);
                return true;
            }
        }
    }
    // End:0x2C9
    if((PendingWeapon != none) && PendingWeapon.bForceSwitch)
    {
        return false;
    }
    // End:0x2FC
    if((bQuickGr == true) && newWeapon.IsA('wThrowingWeapon'))
    {
        newWeapon.bQuickThrow = true;
    }
    // End:0x31B
    if(Weapon == none)
    {
        PendingWeapon = newWeapon;
        ChangedWeapon();        
    }
    else
    {
        // End:0x371
        if((Weapon != newWeapon) || PendingWeapon != none)
        {
            PendingWeapon = newWeapon;
            // End:0x359
            if(false == Weapon.PutDown())
            {
                return false;
            }
            ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);            
        }
        else
        {
            // End:0x38F
            if(Weapon == newWeapon)
            {
                Weapon.Reselect();
            }
        }
    }
    Weapon.wt_index = 0;
    return true;
    //return;    
}

simulated function bool SwitchWeaponByWeaponItem(wWeapon wSwitchWeapon, optional bool bQuickGr)
{
    local wWeapon newWeapon;

    // End:0x0D
    if(wSwitchWeapon == none)
    {
        return false;
    }
    newWeapon = wSwitchWeapon;
    // End:0x39
    if((PendingWeapon != none) && PendingWeapon.bForceSwitch)
    {
        return false;
    }
    // End:0x6C
    if((bQuickGr == true) && newWeapon.IsA('wThrowingWeapon'))
    {
        newWeapon.bQuickThrow = true;
    }
    // End:0x8B
    if(Weapon == none)
    {
        PendingWeapon = newWeapon;
        ChangedWeapon();        
    }
    else
    {
        // End:0xE1
        if((Weapon != newWeapon) || PendingWeapon != none)
        {
            PendingWeapon = newWeapon;
            // End:0xC9
            if(false == Weapon.PutDown())
            {
                return false;
            }
            ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);            
        }
        else
        {
            // End:0xFF
            if(Weapon == newWeapon)
            {
                Weapon.Reselect();
            }
        }
    }
    return true;
    //return;    
}

simulated function SwitchWeaponWClass(name ClassName, optional string sReason)
{
    local wWeapon newWeapon;

    // End:0x23
    if((Level.Pauser != none) || Inventory == none)
    {
        return;
    }
    // End:0x6A
    if((Weapon != none) && Weapon.Inventory != none)
    {
        newWeapon = Weapon.Inventory.WeaponChangeWClass(ClassName);        
    }
    else
    {
        newWeapon = none;
    }
    // End:0x96
    if(newWeapon == none)
    {
        newWeapon = Inventory.WeaponChangeWClass(ClassName);
    }
    // End:0xA3
    if(newWeapon == none)
    {
        return;
    }
    // End:0xC4
    if((PendingWeapon != none) && PendingWeapon.bForceSwitch)
    {
        return;
    }
    // End:0xFB
    if(sReason ~= "ThrowsTheWeapon")
    {
        // End:0xFB
        if(newWeapon != none)
        {
            newWeapon.byActionThrowsWeapon = 1;
        }
    }
    // End:0x11A
    if(Weapon == none)
    {
        PendingWeapon = newWeapon;
        ChangedWeapon();        
    }
    else
    {
        // End:0x168
        if((Weapon != newWeapon) || PendingWeapon != none)
        {
            PendingWeapon = newWeapon;
            Weapon.PutDown();
            ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);            
        }
        else
        {
            // End:0x186
            if(Weapon == newWeapon)
            {
                Weapon.Reselect();
            }
        }
    }
    //return;    
}

function ServerNoTranslocator()
{
    // End:0x36
    if(Level.Game != none)
    {
        Level.Game.NoTranslocatorKeyPressed(PlayerController(Controller));
    }
    //return;    
}

exec function NextItem()
{
    // End:0x22
    if(SelectedItem == none)
    {
        SelectedItem = Inventory.SelectNext();
        return;
    }
    // End:0x57
    if(SelectedItem.Inventory != none)
    {
        SelectedItem = SelectedItem.Inventory.SelectNext();        
    }
    else
    {
        SelectedItem = Inventory.SelectNext();
    }
    // End:0x8C
    if(SelectedItem == none)
    {
        SelectedItem = Inventory.SelectNext();
    }
    //return;    
}

function Inventory FindInventoryType(Class DesiredClass)
{
    local Inventory Inv;
    local int Count;

    Inv = Inventory;
    J0x0B:

    // End:0x63 [Loop If]
    if((Inv != none) && Count < 1000)
    {
        // End:0x45
        if(Inv.Class == DesiredClass)
        {
            return Inv;
        }
        Count++;
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    Count = 0;
    Inv = Inventory;
    J0x75:

    // End:0xCE [Loop If]
    if((Inv != none) && Count < 1000)
    {
        // End:0xB0
        if(ClassIsChildOf(Inv.Class, DesiredClass))
        {
            return Inv;
        }
        Count++;
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x75;
    }
    return none;
    //return;    
}

function bool AddInventory(Inventory NewItem)
{
    local Inventory Inv;
    local Actor Last, Prev;
    local bool bAddedInOrder;

    Last = self;
    // End:0x3A
    if(NewItem == none)
    {
        Log("tried to add none inventory to " $ string(self));
    }
    NewItem.SetOwner(self);
    NewItem.NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x11F
    if(wWeapon(NewItem) != none)
    {
        Prev = self;
        Inv = Inventory;
        J0x8B:

        // End:0xC3 [Loop If]
        if(Inv != none)
        {
            // End:0xAC
            if(!bAddedInOrder)
            {
                Prev = Inv;
            }
            Inv = Inv.Inventory;
            // [Loop Continue]
            goto J0x8B;
        }
        // End:0x11F
        if(bAddedInOrder)
        {
            NewItem.Inventory = Prev.Inventory;
            Prev.Inventory = NewItem;
            Prev.NetUpdateTime = Level.TimeSeconds - float(1);
        }
    }
    // End:0x1B9
    if(!bAddedInOrder)
    {
        Inv = Inventory;
        J0x135:

        // End:0x173 [Loop If]
        if(Inv != none)
        {
            // End:0x151
            if(Inv == NewItem)
            {
                return false;
            }
            Last = Inv;
            Inv = Inv.Inventory;
            // [Loop Continue]
            goto J0x135;
        }
        NewItem.Inventory = none;
        Last.Inventory = NewItem;
        Last.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    // End:0x1D8
    if(Controller != none)
    {
        Controller.NotifyAddInventory(NewItem);
    }
    return true;
    //return;    
}

function DeleteInventoriesFromStorage()
{
    local Inventory Item;

    Item = Inventory;
    J0x0B:

    // End:0x38 [Loop If]
    if(Item != none)
    {
        DeleteInventoryFromStorage(Item);
        Item = Item.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function DeleteInventoryFromStorage(Inventory Item)
{
    local PlayerController PC;
    local string sWeapon;

    PC = PlayerController(Controller);
    // End:0x2B
    if(PC == none)
    {
        PC = PlayerController(Owner);
    }
    // End:0x11F
    if((PC != none) && PC.GSSS != none)
    {
        // End:0x7B
        if(__NFUN_920__(Item.InventoryUniqueNumber, 0))
        {
            sWeapon = __NFUN_918__(Item.InventoryUniqueNumber);            
        }
        else
        {
            sWeapon = Level.WeaponMgr.GetBaseParam(Item.InventoryClassNumber).strName;
        }
        PC.GSSS.DeleteFromStorage_Weapon(sWeapon);
        Log((("DeleteFromStorage - Weapon=" $ sWeapon) $ " owner name=") $ PC.PlayerReplicationInfo.PlayerName);        
    }
    else
    {
        Log((("DeleteFromStorage is skipped owner=" $ string(Owner)) $ " ctrlr=") $ string(Controller));
    }
    //return;    
}

function DeleteInventory(Inventory Item)
{
    local Actor Link;
    local int Count;

    Log((("Pawn::DeleteInventory() Name:" $ LoginName) $ "  Item:") $ Item.InventoryClassName);
    // End:0x59
    if(Item == Weapon)
    {
        Weapon = none;
    }
    // End:0x6F
    if(Item == SelectedItem)
    {
        SelectedItem = none;
    }
    Link = self;
    J0x76:

    // End:0x156 [Loop If]
    if(Link != none)
    {
        // End:0x10D
        if(Link.Inventory == Item)
        {
            Link.Inventory = Item.Inventory;
            Item.Inventory = none;
            Link.NetUpdateTime = Level.TimeSeconds - float(1);
            Item.NetUpdateTime = Level.TimeSeconds - float(1);
            // [Explicit Break]
            goto J0x156;
        }
        // End:0x13F
        if(int(Level.NetMode) == int(NM_Client))
        {
            Count++;
            // End:0x13F
            if(Count > 1000)
            {
                // [Explicit Break]
                goto J0x156;
            }
        }
        Link = Link.Inventory;
        // [Loop Continue]
        goto J0x76;
    }
    J0x156:

    Item.SetOwner(none);
    DeleteInventoryFromStorage(Item);
    // End:0x192
    if(Item.IsA('wWeapon'))
    {
        SetRemoveWeaponSkill(wWeapon(Item));
    }
    // End:0x1D5
    if((wWeapon(Item) != none) && int(wWeapon(Item).InventoryGroup) == 5)
    {
        PlayerController(Controller).ClientChangeSlot5(none);
    }
    //return;    
}

simulated function ClientForceChangedWeapon(wWeapon newWeapon)
{
    PendingWeapon = newWeapon;
    ChangedWeapon();
    //return;    
}

simulated function ChangedWeapon()
{
    local wWeapon OldWeapon;

    // End:0x1A
    if(Weapon != none)
    {
        Weapon.StopAnimating();
    }
    ServerChangedWeapon(Weapon, PendingWeapon);
    // End:0x90
    if(int(Role) < int(ROLE_Authority))
    {
        OldWeapon = Weapon;
        Weapon = PendingWeapon;
        PendingWeapon = none;
        // End:0x71
        if(Controller != none)
        {
            Controller.ChangedWeapon();
        }
        // End:0x90
        if(Weapon != none)
        {
            Weapon.BringUp(OldWeapon);
        }
    }
    //return;    
}

function name GetOffhandBoneFor(Inventory i)
{
    return 'None';
    //return;    
}

function name GetWeaponBoneFor(Inventory i)
{
    return 'righthand';
    //return;    
}

function ServerChangedWeapon(wWeapon OldWeapon, wWeapon newWeapon)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x116
    if((PC != none) && PC.GSSS != none)
    {
        // End:0xAE
        if(!OldWeapon.IsA('wMeleeWeapon') && newWeapon.IsA('wMeleeWeapon'))
        {
            Log(string(self) $ " !OldWeapon.IsA( 'wMeleeWeapon' ) && NewWeapon.IsA( 'wMeleeWeapon' ) ");            
        }
        else
        {
            PC.GSSS.SetToStorage_CurrentWeapon(newWeapon.BaseParams.iWeaponID);
            Log((((string(self) $ " OldWeapon : ") $ string(OldWeapon)) $ " / NewWeapon:") $ string(newWeapon));
        }
    }
    Weapon = newWeapon;
    TypeOfWeapon = newWeapon.WeaponType;
    // End:0x14F
    if(Controller != none)
    {
        Controller.ChangedWeapon();
    }
    PendingWeapon = none;
    // End:0x1F4
    if(OldWeapon != none)
    {
        // End:0x1B1
        if((PC != none) && PC.GSSS != none)
        {
            PC.GSSS.SetToStorage_OldWeapon(OldWeapon.BaseParams.iWeaponID);
        }
        OldWeapon.SetDefaultDisplayProperties();
        OldWeapon.DetachFromPawn(self);
        OldWeapon.GotoState('Hidden');
        OldWeapon.NetUpdateFrequency = 2.0000000;
    }
    // End:0x284
    if((Controller != none) && Weapon != none)
    {
        Weapon.NetUpdateFrequency = 2.0000000;
        Weapon.AttachToPawn(self);
        Weapon.BringUp(OldWeapon);
        PlayWeaponSwitch(newWeapon);
        Weapon.bCanSelectNew = false;
        // End:0x284
        if(OldWeapon != none)
        {
            PlayerController(Controller).ClientChangeSlot5(Weapon);
        }
    }
    // End:0x2B5
    if(Weapon != none)
    {
        PlayerReplicationInfo.iCurrentWeaponID = Weapon.BaseParams.iWeaponID;
    }
    // End:0x2D4
    if(Inventory != none)
    {
        Inventory.OwnerEvent('ChangedWeapon');
    }
    //return;    
}

function bool IsHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
    local Coords C;
    local Vector HeadLoc, B, M, diff;
    local float t, DotMM, Distance;
    local int look;

    // End:0x11
    if(HeadBone == 'None')
    {
        return false;
    }
    // End:0x16E
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        // End:0x51
        if(int(Physics) == int(2))
        {
            PlayAnim(AirAnims[0], 1.0000000, 0.0000000);            
        }
        else
        {
            // End:0x13F
            if(int(Physics) == int(1))
            {
                // End:0xA4
                if(bIsCrouched)
                {
                    // End:0x8F
                    if(int(TypeOfWeapon) == int(4))
                    {
                        PlayAnim(Pistol_IdleCrouchAnim, 1.0000000, 0.0000000);                        
                    }
                    else
                    {
                        PlayAnim(IdleCrouchAnim, 1.0000000, 0.0000000);
                    }                    
                }
                else
                {
                    // End:0xC2
                    if(bIsProned)
                    {
                        PlayAnim(IdleProneAnim, 1.0000000, 0.0000000);                        
                    }
                    else
                    {
                        PlayAnim(IdleWeaponAnim, 1.0000000, 0.0000000);
                    }
                }
                // End:0x13C
                if(bDoTorsoTwist)
                {
                    SmoothViewYaw = Rotation.Yaw;
                    SmoothViewPitch = int(ViewPitch);
                    look = (256 * int(ViewPitch)) & 65535;
                    // End:0x130
                    if(look > 32768)
                    {
                        look -= 65536;
                    }
                    SetTwistLook(0, look);
                }                
            }
            else
            {
                // End:0x163
                if(int(Physics) == int(3))
                {
                    PlayAnim(SwimAnims[0], 1.0000000, 0.0000000);
                }
            }
        }
        SetAnimFrame(0.5000000);
    }
    C = GetBoneCoords(HeadBone);
    HeadLoc = C.Origin + (((HeadHeight * HeadScale) * AdditionalScale) * C.XAxis);
    B = loc;
    M = ray * ((2.0000000 * CollisionHeight) + (2.0000000 * CollisionRadius));
    diff = HeadLoc - B;
    t = M Dot diff;
    // End:0x27C
    if(t > float(0))
    {
        DotMM = M Dot M;
        // End:0x262
        if(t < DotMM)
        {
            t = t / DotMM;
            diff = diff - (t * M);            
        }
        else
        {
            t = 1.0000000;
            diff -= M;
        }        
    }
    else
    {
        t = 0.0000000;
    }
    Distance = Sqrt(diff Dot diff);
    return Distance < ((HeadRadius * HeadScale) * AdditionalScale);
    //return;    
}

event bool EncroachingOn(Actor Other)
{
    // End:0x28
    if(Other.bWorldGeometry || Other.bBlocksTeleport)
    {
        return true;
    }
    // End:0x5D
    if(((Vehicle(Other) != none) && Weapon != none) && Weapon.IsA('Translauncher'))
    {
        return true;
    }
    // End:0x9D
    if((((Controller == none) || !Controller.bIsPlayer) || bWarping) && Pawn(Other) != none)
    {
        return true;
    }
    return false;
    //return;    
}

event EncroachedBy(Actor Other)
{
    //return;    
}

function gibbedBy(Actor Other)
{
    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x48
    if(Pawn(Other) != none)
    {
        Died(Pawn(Other).Controller, Class'Engine_Decompressed.DamTypeTelefragged', Location);        
    }
    else
    {
        Died(none, Class'Engine_Decompressed.Gibbed', Location);
    }
    //return;    
}

function JumpOffPawn()
{
    Velocity += ((float(100) + CollisionRadius) * VRand());
    Velocity.Z = 200.0000000 + CollisionHeight;
    SetPhysics(2);
    bNoJumpAdjust = true;
    // End:0x54
    if(Controller != none)
    {
        Controller.SetFall();
    }
    //return;    
}

singular event BaseChange()
{
    local float decorMass;
    local int footdamage;

    // End:0x0B
    if(bInterpolating)
    {
        return;
    }
    // End:0x30
    if((Base == none) && int(Physics) == int(0))
    {
        SetPhysics(2);        
    }
    else
    {
        // End:0xA6
        if((Pawn(Base) != none) && Base != DrivenVehicle)
        {
            // End:0xA3
            if(!Pawn(Base).bCanBeBaseForPawns)
            {
                footdamage = 100;
                Base.TakeDamage(footdamage, self, Location, 0.5000000 * Velocity, Class'Engine_Decompressed.wDamageStepOn');
                JumpOffPawn();
            }            
        }
        else
        {
            // End:0x140
            if((Decoration(Base) != none) && Velocity.Z < float(-400))
            {
                decorMass = FMax(Decoration(Base).Mass, 1.0000000);
                Base.TakeDamage(int((((float(-2) * Mass) / decorMass) * Velocity.Z) / float(400)), self, Location, 0.5000000 * Velocity, Class'Engine_Decompressed.Crushed');
            }
        }
    }
    //return;    
}

// Export UPawn::execUpdateEyeHeightNative(FFrame&, void* const)
native function UpdateEyeHeightNative(float DeltaTime)
{
    //native.DeltaTime;        
}

event UpdateEyeHeight(float DeltaTime)
{
    UpdateEyeHeightScript(DeltaTime);
    //return;    
}

function UpdateEyeHeightScript(float DeltaTime)
{
    local float smooth, MaxEyeHeight, OldEyeHeight;
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    // End:0x18
    if(Controller == none)
    {
        EyeHeight = 0.0000000;
        return;
    }
    // End:0x3E
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        EyeHeight = BaseEyeHeight;
        return;
    }
    // End:0x5C
    if(bTearOff)
    {
        EyeHeight = default.BaseEyeHeight;
        bUpdateEyeheight = false;
        return;
    }
    HitActor = Trace(HitLocation, HitNormal, Location + (((CollisionHeight + 35.0000000) + float(14)) * vect(0.0000000, 0.0000000, 1.0000000)), Location + (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), true);
    // End:0xD3
    if(HitActor == none)
    {
        MaxEyeHeight = CollisionHeight + 35.0000000;        
    }
    else
    {
        MaxEyeHeight = (HitLocation.Z - Location.Z) - float(14);
    }
    // End:0x121
    if(Abs(Location.Z - OldZ) > float(15))
    {
        bJustLanded = false;
        bLandRecovery = false;
    }
    // End:0x200
    if(!bJustLanded)
    {
        smooth = FMin(0.9000000, (10.0000000 * DeltaTime) / Level.TimeDilation);
        LandBob *= (float(1) - smooth);
        // End:0x1D1
        if(Controller.WantsSmoothedView())
        {
            OldEyeHeight = EyeHeight;
            EyeHeight = FClamp((((EyeHeight - Location.Z) + OldZ) * (float(1) - smooth)) + (BaseEyeHeight * smooth), -0.5000000 * CollisionHeight, MaxEyeHeight);            
        }
        else
        {
            EyeHeight = FMin((EyeHeight * (float(1) - smooth)) + (BaseEyeHeight * smooth), MaxEyeHeight);
        }        
    }
    else
    {
        // End:0x2AA
        if(bLandRecovery)
        {
            smooth = FMin(0.9000000, 10.0000000 * DeltaTime);
            OldEyeHeight = EyeHeight;
            EyeHeight = FMin((EyeHeight * (float(1) - (0.6000000 * smooth))) + ((BaseEyeHeight * 0.6000000) * smooth), BaseEyeHeight);
            LandBob *= (float(1) - smooth);
            // End:0x2A7
            if(EyeHeight >= (BaseEyeHeight - float(1)))
            {
                bJustLanded = false;
                bLandRecovery = false;
                EyeHeight = BaseEyeHeight;
            }            
        }
        else
        {
            smooth = FMin(0.6500000, 10.0000000 * DeltaTime);
            OldEyeHeight = EyeHeight;
            EyeHeight = FMin(EyeHeight * (float(1) - (1.5000000 * smooth)), MaxEyeHeight);
            LandBob += (0.0300000 * (OldEyeHeight - EyeHeight));
            // End:0x357
            if((EyeHeight < ((0.4500000 * BaseEyeHeight) + float(1))) || LandBob > float(3))
            {
                bLandRecovery = true;
                EyeHeight = (0.4500000 * BaseEyeHeight) + float(1);
            }
        }
    }
    Controller.AdjustView(DeltaTime);
    //return;    
}

simulated function Vector EyePosition()
{
    return (EyeHeight * vect(0.0000000, 0.0000000, 1.0000000)) + WalkBob;
    //return;    
}

simulated event Destroyed()
{
    local int lp1;

    StopLoopSoundByActor();
    // End:0x6B
    if(bAddToLevelPawnList)
    {
        lp1 = Level.PawnList.Length - 1;
        J0x27:

        // End:0x6B [Loop If]
        if(lp1 >= 0)
        {
            // End:0x61
            if(Level.PawnList[lp1] == self)
            {
                Level.PawnList.Remove(lp1, 1);
            }
            lp1--;
            // [Loop Continue]
            goto J0x27;
        }
    }
    // End:0x82
    if(Shadow != none)
    {
        Shadow.Destroy();
    }
    // End:0x9D
    if(Controller != none)
    {
        Controller.PawnDied(self);
    }
    // End:0xB8
    if(int(Level.NetMode) == int(NM_Client))
    {
        return;
    }
    J0xB8:

    // End:0xD2 [Loop If]
    if(Inventory != none)
    {
        Inventory.Destroy();
        // [Loop Continue]
        goto J0xB8;
    }
    Weapon = none;
    super.Destroyed();
    //return;    
}

event PreBeginPlay()
{
    super.PreBeginPlay();
    Instigator = self;
    DesiredRotation = Rotation;
    // End:0x23
    if(bDeleteMe)
    {
        return;
    }
    // End:0x42
    if(BaseEyeHeight == float(0))
    {
        BaseEyeHeight = 0.8000000 * CollisionHeight;
    }
    EyeHeight = BaseEyeHeight;
    // End:0x6C
    if(MenuName == "")
    {
        MenuName = GetItemName(string(Class));
    }
    //return;    
}

event PostBeginPlay()
{
    local AIScript A;

    super.PostBeginPlay();
    SplashTime = 0.0000000;
    SpawnTime = Level.TimeSeconds;
    EyeHeight = BaseEyeHeight;
    OldRotYaw = float(Rotation.Yaw);
    bIsAiming = false;
    bWasAimMode = false;
    SetTimer(30.0000000, true);
    // End:0x133
    if((Level.bStartup && Health > 0) && !bDontPossess)
    {
        // End:0xD8
        if(AIScriptTag != 'None')
        {
            // End:0xAF
            foreach AllActors(Class'Engine_Decompressed.AIScript', A, AIScriptTag)
            {
                // End:0xAF
                break;                
            }            
            // End:0xD8
            if(A != none)
            {
                A.SpawnControllerFor(self);
                // End:0xD8
                if(Controller != none)
                {
                    return;
                }
            }
        }
        // End:0xFE
        if((ControllerClass != none) && Controller == none)
        {
            Controller = Spawn(ControllerClass);
        }
        // End:0x133
        if(Controller != none)
        {
            Controller.Possess(self);
            AIController(Controller).Skill += SkillModifier;
        }
    }
    RespawnLocation = Location;
    clog("[Pawn::PostBeginPlay] " $ self.PlayerReplicationInfo.PlayerName);
    //return;    
}

simulated event PostNetBeginPlay()
{
    local PlayerController P;

    // End:0x29
    if(bAddToLevelPawnList)
    {
        Level.PawnList[Level.PawnList.Length] = self;
    }
    // End:0x69
    if(Level.bDropDetail || int(Level.DetailMode) == int(0))
    {
        MaxLights = byte(Min(4, int(MaxLights)));
    }
    // End:0x7B
    if(int(Role) == int(ROLE_Authority))
    {
        return;
    }
    // End:0xF0
    if((Controller != none) && Controller.Pawn == none)
    {
        Controller.Pawn = self;
        // End:0xF0
        if((PlayerController(Controller) != none) && PlayerController(Controller).ViewTarget == Controller)
        {
            PlayerController(Controller).SetViewTarget(self);
        }
    }
    // End:0x108
    if(int(Role) == int(ROLE_AutonomousProxy))
    {
        bUpdateEyeheight = true;
    }
    // End:0x1AB
    if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Owner == none)
    {
        PlayerReplicationInfo.SetOwner(Controller);
        // End:0x1AB
        if(Left(PlayerReplicationInfo.PlayerName, 5) ~= "PRESS")
        {
            P = Level.GetLocalPlayerController();
            // End:0x1AB
            if((P.PlayerReplicationInfo != none) && !Left(PlayerReplicationInfo.PlayerName, 5) ~= "PRESS")
            {
                bScriptPostRender = true;
            }
        }
    }
    PlayWaiting();
    RespawnLocation = Location;
    PlayerReplicationInfo.PlayerHealth = Health;
    //return;    
}

simulated event SetShadowLight(Vector vLightDir)
{
    //return;    
}

simulated function SetMesh()
{
    // End:0x0D
    if(Mesh != none)
    {
        return;
    }
    LinkMesh(default.Mesh);
    //return;    
}

function Gasp()
{
    //return;    
}

function SetMovementPhysics()
{
    //return;    
}

function bool GiveHealth(int HealAmount, int HealMax)
{
    // End:0x2A
    if(Health < HealMax)
    {
        Health = Min(HealMax, Health + HealAmount);
        return true;
    }
    return false;
    //return;    
}

function bool HasUDamage()
{
    return false;
    //return;    
}

function int ShieldAbsorb(int Damage)
{
    return Damage;
    //return;    
}

function TakeHeadRoundBullet(Vector HitLocation, int WeaponType)
{
    local Vector loctohit;

    loctohit = HitLocation - PlayerController(Controller).ViewTarget.Location;
    loctohit = Normal(loctohit);
    loctohit = (loctohit * float(100)) + PlayerController(Controller).ViewTarget.Location;
    PlaySoundHK2(Sound(DynamicLoadObject("Warfare_Sound_Char.whizby.char_whizby", Class'Engine_Decompressed.Sound')), 0, 1.0000000,, 50.0000000,, true,,, false, HitLocation);
    //return;    
}

function TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer)
{
    //return;    
}

function Controller GetDelayedInstigatorController(Pawn instigatedBy)
{
    local Controller Killer, C;

    Killer = DelayedDamageInstigatorController;
    // End:0xC9
    if(instigatedBy.OwnerName != "")
    {
        Log("[Pawn::GetDelayedInstigatorController] " $ instigatedBy.OwnerName);
        C = Level.ControllerList;
        J0x6F:

        // End:0xC9 [Loop If]
        if(C != none)
        {
            // End:0xB2
            if(C.PlayerReplicationInfo.PlayerName == instigatedBy.OwnerName)
            {
                Killer = C;
                // [Explicit Break]
                goto J0xC9;
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x6F;
        }
    }
    J0xC9:

    return Killer;
    //return;    
}

function ApplyDealDamageRatio(Pawn instigatedBy, Class<DamageType> DamageType, int WeaponType, out int ActualDamage)
{
    // End:0xB1
    if(instigatedBy != none)
    {
        switch(WeaponType)
        {
            // End:0x58
            case int(0):
                // End:0x40
                if(DamageType == Class'Engine_Decompressed.wDamageMelee')
                {
                    ActualDamage *= instigatedBy.DealDamageRatio_Melee;                    
                }
                else
                {
                    ActualDamage *= instigatedBy.DealDamageRatio_Default;
                }
                // End:0xB1
                break;
            // End:0x5F
            case int(1):
            // End:0x66
            case int(2):
            // End:0x6D
            case int(3):
            // End:0x8C
            case int(4):
                ActualDamage *= instigatedBy.DealDamageRatio_Default;
                // End:0xB1
                break;
            // End:0xAB
            case int(5):
                ActualDamage *= instigatedBy.DealDamageRatio_Explosive;
                // End:0xB1
                break;
            // End:0xFFFF
            default:
                // End:0xB1
                break;
                break;
        }
    }
    //return;    
}

function Controller GetDamagedByKiller(Class<DamageType> DamageType, Pawn instigatedBy)
{
    local Controller Killer;

    // End:0x19
    if((Health - 25) <= 0)
    {
        Killer = none;        
    }
    else
    {
        Killer = none;
    }
    // End:0x6D
    if((DamageType.default.bCausedByWorld && (instigatedBy == none) || instigatedBy == self) && LastHitBy != none)
    {
        Killer = self.GetKillerController();        
    }
    else
    {
        // End:0x8D
        if(instigatedBy != none)
        {
            Killer = instigatedBy.GetKillerController();
        }
    }
    // End:0xD7
    if((((Killer == none) && DamageType.default.bCausedByWorld) && instigatedBy == none) && LastHitBy == none)
    {
        Killer = self.GetKillerController();
    }
    // End:0x107
    if((Killer == none) && DamageType.default.bDelayedDamage)
    {
        Killer = GetDelayedInstigatorController(instigatedBy);
    }
    // End:0x13C
    if((Killer != none) && Killer.IsA('wHelicopterController'))
    {
        Killer = Killer.Caller;
    }
    return Killer;
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int ActualDamage;
    local Controller Killer;

    // End:0x6D
    if(DamageType == none)
    {
        // End:0x62
        if(instigatedBy != none)
        {
            Warn((("No damagetype for damage by " $ string(instigatedBy)) $ " with weapon ") $ string(instigatedBy.Weapon));
        }
        DamageType = Class'Engine_Decompressed.DamageType';
    }
    // End:0xB6
    if(int(Role) < int(ROLE_Authority))
    {
        Log((((string(self) $ " client damage type ") $ string(DamageType)) $ " by ") $ string(instigatedBy));
        return;
    }
    // End:0xE2
    if((Health <= 0) || !Level.Game.CanPawnTakeDamage())
    {
        return;
    }
    // End:0x138
    if((((instigatedBy == none) || instigatedBy.Controller == none) && DamageType.default.bDelayedDamage) && DelayedDamageInstigatorController != none)
    {
        instigatedBy = DelayedDamageInstigatorController.Pawn;
    }
    // End:0x15B
    if((int(Physics) == int(0)) && DrivenVehicle == none)
    {
        SetMovementPhysics();
    }
    // End:0x1A4
    if((int(Physics) == int(1)) && DamageType.default.bExtraMomentumZ)
    {
        Momentum.Z = FMax(Momentum.Z, 0.4000000 * VSize(Momentum));
    }
    // End:0x1BB
    if(instigatedBy == self)
    {
        Momentum *= 0.6000000;
    }
    Momentum = Momentum / Mass;
    // End:0x200
    if(Weapon != none)
    {
        Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x233
    if(DrivenVehicle != none)
    {
        DrivenVehicle.AdjustDriverDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x25D
    if((instigatedBy != none) && instigatedBy.HasUDamage())
    {
        Damage *= float(2);
    }
    ActualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
    // End:0x2CA
    if(DamageType.default.bArmorStops && ActualDamage > 0)
    {
        ActualDamage = ShieldAbsorb(ActualDamage);
    }
    ApplyDealDamageRatio(instigatedBy, DamageType, WeaponType, ActualDamage);
    // End:0x306
    if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
    {
        HitLocation = Location;
    }
    AddDamageInfo(instigatedBy, ActualDamage, DamageType);
    // End:0x36B
    if(ActualDamage > 0)
    {
        instigatedBy.LastDamageDealtTime = Level.TimeSeconds;
        instigatedBy.LastDamageCollisionPart = CollisionPart;
        LastDamageReceiveTime = Level.TimeSeconds;
    }
    PlayHit(float(ActualDamage), instigatedBy, HitLocation, DamageType, Momentum, CollisionPart);
    Killer = GetDamagedByKiller(DamageType, instigatedBy);
    // End:0x46D
    if((Health - ActualDamage) <= 0)
    {
        // End:0x3CD
        if(bPhysicsAnimUpdate)
        {
            TearOffMomentum = Momentum;
        }
        Level.Game.KDLOG_Initialize();
        Level.Game.SC.KDLog.KillDamage = ActualDamage;
        Health -= ActualDamage;
        Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType, bWallShot);
        TakeDamageSound(Health, ActualDamage, HitLocation, DamageType, CollisionPart, WeaponType, Killer);        
    }
    else
    {
        AttackerLoc = instigatedBy.Location;
        // End:0x4D9
        if(DrivenVehicle != none)
        {
            // End:0x4D6
            if(DrivenVehicle.Controller != none)
            {
                DrivenVehicle.Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
            }            
        }
        else
        {
            // End:0x511
            if(Controller != none)
            {
                Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
            }
        }
        // End:0x53D
        if((instigatedBy != none) && instigatedBy != self)
        {
            LastHitBy = instigatedBy.Controller;
        }
        Health -= ActualDamage;
        TakeDamageSound(Health, ActualDamage, HitLocation, DamageType, CollisionPart, WeaponType, Killer);
    }
    MakeNoise(1.0000000);
    //return;    
}

function AddDamageInfo(Pawn instigatedBy, int Damage, Class<DamageType> DamageType)
{
    local PlayerDamageInfo DInfo;
    local string strDamageType;

    DInfo.Attacker = instigatedBy;
    // End:0xB1
    if(Level.GetMatchMaker().IsFixedAssistPoint)
    {
        DInfo.ac = instigatedBy.Controller;
        DInfo.AttackerUID = instigatedBy.PlayerReplicationInfo.GetUID();
        strDamageType = string(DamageType);
        // End:0xB1
        if(strDamageType ~= "WWeapons_Res.wWeaponRes_StunGrenade")
        {
            DInfo.DamageStun = true;
        }
    }
    DInfo.DamageAmount = float(Damage);
    DInfo.DamageTime = Level.TimeSeconds;
    DamageInfo[DamageInfo.Length] = DInfo;
    //return;    
}

function int GetAssistScore(int UID)
{
    local PlayerDamageInfo tmSrcInfo;
    local int i;
    local bool bFindStun;

    i = 0;
    J0x07:

    // End:0xA4 [Loop If]
    if(i < DamageInfo.Length)
    {
        // End:0x48
        if((DamageInfo[i].AttackerUID <= 0) || DamageInfo[i].Attacker == self)
        {
            // [Explicit Continue]
            goto J0x9A;
        }
        // End:0x9A
        if(DamageInfo[i].AttackerUID == UID)
        {
            tmSrcInfo.DamageAmount += DamageInfo[i].DamageAmount;
            // End:0x9A
            if(DamageInfo[i].DamageStun)
            {
                bFindStun = true;
            }
        }
        J0x9A:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Log((((string(self) $ " Assist PlayerName ") $ tmSrcInfo.ac.PlayerReplicationInfo.PlayerName) $ "/  DamageAmount: ") $ string(tmSrcInfo.DamageAmount));
    // End:0x12E
    if((tmSrcInfo.DamageAmount < float(20)) && bFindStun)
    {
        return Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist;
    }
    // End:0x153
    if(tmSrcInfo.DamageAmount < float(51))
    {
        return Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist;        
    }
    else
    {
        // End:0x178
        if(tmSrcInfo.DamageAmount < float(81))
        {
            return Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist4;            
        }
        else
        {
            return Class'Engine_Decompressed.wMessage_Score'.default.Code_MessageScore_Assist5;
        }
    }
    return 0;
    //return;    
}

function array<Controller> GetAssistList(Pawn Killer)
{
    local array<PlayerDamageInfo> ADmInfo;
    local PlayerDamageInfo tmSrcInfo;
    local int i, j, AssistGainTime, AssistMinDamage;
    local bool bFind;

    // End:0x12
    if(AssistList.Length > 0)
    {
        return AssistList;
    }
    // End:0x59
    if(Level.GetMatchMaker().IsFixedAssistPoint)
    {
        AssistGainTime = int(Level.GetMatchMaker().FixedAssistTime);
        AssistMinDamage = 19;        
    }
    else
    {
        AssistGainTime = 8;
        AssistMinDamage = 29;
    }
    i = 0;
    J0x70:

    // End:0x38B [Loop If]
    if(i < DamageInfo.Length)
    {
        tmSrcInfo = DamageInfo[i];
        Log((string(self) $ " tmSrcInfo.AC :  ") $ tmSrcInfo.ac.PlayerReplicationInfo.PlayerName);
        // End:0x123
        if(Level.GetMatchMaker().IsFixedAssistPoint)
        {
            // End:0x120
            if(((tmSrcInfo.ac == none) || tmSrcInfo.Attacker == Killer) || tmSrcInfo.Attacker == self)
            {
                // [Explicit Continue]
                goto J0x381;
            }            
        }
        else
        {
            // End:0x15E
            if(((tmSrcInfo.Attacker == none) || tmSrcInfo.Attacker == Killer) || tmSrcInfo.Attacker == self)
            {
                // [Explicit Continue]
                goto J0x381;
            }
        }
        bFind = false;
        j = 0;
        J0x16D:

        // End:0x363 [Loop If]
        if(j < ADmInfo.Length)
        {
            // End:0x259
            if(Level.GetMatchMaker().IsFixedAssistPoint)
            {
                // End:0x1B2
                if(ADmInfo[j].ac == none)
                {
                    // [Explicit Continue]
                    goto J0x359;
                }
                // End:0x256
                if(ADmInfo[j].ac == tmSrcInfo.ac)
                {
                    // End:0x218
                    if((tmSrcInfo.DamageTime - ADmInfo[j].DamageTime) <= float(AssistGainTime))
                    {
                        ADmInfo[j].DamageAmount += tmSrcInfo.DamageAmount;                        
                    }
                    else
                    {
                        ADmInfo[j].DamageAmount = tmSrcInfo.DamageAmount;
                    }
                    ADmInfo[j].DamageTime = tmSrcInfo.DamageTime;
                    bFind = true;
                }                
            }
            else
            {
                // End:0x2FD
                if(ADmInfo[j].Attacker == tmSrcInfo.Attacker)
                {
                    // End:0x2BF
                    if((tmSrcInfo.DamageTime - ADmInfo[j].DamageTime) <= float(AssistGainTime))
                    {
                        ADmInfo[j].DamageAmount += tmSrcInfo.DamageAmount;                        
                    }
                    else
                    {
                        ADmInfo[j].DamageAmount = tmSrcInfo.DamageAmount;
                    }
                    ADmInfo[j].DamageTime = tmSrcInfo.DamageTime;
                    bFind = true;
                }
            }
            Log((((string(self) $ " Name ") $ ADmInfo[j].ac.PlayerReplicationInfo.PlayerName) $ " / DamageAmount  ") $ string(ADmInfo[j].DamageAmount));
            J0x359:

            j++;
            // [Loop Continue]
            goto J0x16D;
        }
        // End:0x381
        if(bFind == false)
        {
            ADmInfo[ADmInfo.Length] = tmSrcInfo;
        }
        J0x381:

        i++;
        // [Loop Continue]
        goto J0x70;
    }
    i = 0;
    J0x392:

    // End:0x522 [Loop If]
    if(i < ADmInfo.Length)
    {
        // End:0x45F
        if(Level.GetMatchMaker().IsFixedAssistPoint)
        {
            // End:0x45C
            if((((ADmInfo[i].ac != none) && ADmInfo[i].ac.bIsPlayer) && ADmInfo[i].DamageAmount > float(AssistMinDamage)) && (Level.TimeSeconds - ADmInfo[i].DamageTime) <= float(AssistGainTime))
            {
                AssistList[AssistList.Length] = ADmInfo[i].ac;
            }
            // [Explicit Continue]
            goto J0x518;
        }
        // End:0x518
        if((((ADmInfo[i].Attacker.Controller != none) && ADmInfo[i].Attacker.Controller.bIsPlayer) && ADmInfo[i].DamageAmount > float(AssistMinDamage)) && (Level.TimeSeconds - ADmInfo[i].DamageTime) <= float(AssistGainTime))
        {
            AssistList[AssistList.Length] = ADmInfo[i].Attacker.Controller;
        }
        J0x518:

        i++;
        // [Loop Continue]
        goto J0x392;
    }
    return AssistList;
    //return;    
}

function SetDelayedDamageInstigatorController(Controller C)
{
    DelayedDamageInstigatorController = C;
    //return;    
}

// Export UPawn::execGetTeamNum(FFrame&, void* const)
native simulated function int GetTeamNum();

function TeamInfo GetTeam()
{
    // End:0x1A
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.Team;
    }
    // End:0x53
    if((DrivenVehicle != none) && DrivenVehicle.PlayerReplicationInfo != none)
    {
        return DrivenVehicle.PlayerReplicationInfo.Team;
    }
    return none;
    //return;    
}

function Controller GetKillerController()
{
    return Controller;
    //return;    
}

function CalcItemUsedTimeSelf()
{
    CalcItemUsedTime(Level.GetMatchMaker().GetUserInfoByUserName(PlayerReplicationInfo.PlayerName));
    //return;    
}

function CalcItemUsedTime(wMatchUserInfo kUser)
{
    local int i, j;
    local float Time;

    // End:0x0D
    if(kUser == none)
    {
        return;
    }
    Time = float(Level.Game.GameReplicationInfo.ElapsedTime) - PlayerReplicationInfo.fSpawnedTime;
    i = 0;
    J0x4C:

    // End:0x88 [Loop If]
    if(i < kUser.EquippedItems.Length)
    {
        kUser.ResetItemUse(i, Time);
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    i = 0;
    J0x8F:

    // End:0xE0 [Loop If]
    if(i < 5)
    {
        j = 0;
        J0xA2:

        // End:0xD6 [Loop If]
        if(j < 4)
        {
            kUser.ResetQSlotItemUse(i, j, Time);
            j++;
            // [Loop Continue]
            goto J0xA2;
        }
        i++;
        // [Loop Continue]
        goto J0x8F;
    }
    //return;    
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vector TossVel;
    local Trigger t;
    local NavigationPoint N;
    local bool bTossWeapon, bSkillWeapon;
    local wItemBaseParam ItemParam;

    // End:0x52
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.bySupply_Helipack = 0;
        PlayerReplicationInfo.bySupply_UAV = 0;
        PlayerReplicationInfo.bySupply_AirStrike = 0;
        PlayerReplicationInfo.IsInvulnerable = true;        
    }
    else
    {
        Log(((string(self) $ "PlayerReplicationInfo is None") $ "/ Killer:") $ string(Killer));
    }
    // End:0xC3
    if((bDeleteMe || Level.bLevelChange) || Level.Game == none)
    {
        return;
    }
    // End:0x111
    if((DamageType.default.bCausedByWorld && (Killer == none) || Killer == Controller) && LastHitBy != none)
    {
        Killer = self.GetKillerController();
    }
    // End:0x14C
    if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
    {
        Health = Max(Health, 1);
        return;
    }
    Health = Min(0, Health);
    // End:0x394
    if(Weapon != none)
    {
        Level.Game.SC.KDLog.DeathWeapon = Weapon.BaseParams.iWeaponID;
        Level.Game.SC.KDLog.DeathWeaponPart = Weapon.Parts[0].PartsGroupID;
        // End:0x394
        if((DrivenVehicle == none) || DrivenVehicle.bAllowWeaponToss)
        {
            // End:0x228
            if(Controller != none)
            {
                Controller.LastPawnWeapon = Weapon.Class;
            }
            Weapon.HolderDied();
            bSkillWeapon = false;
            // End:0x308
            if(int(Weapon.InventoryGroup) == 5)
            {
                ItemParam = Level.GameMgr.GetItemParam(Weapon.BaseParams.iWeaponID);
                // End:0x2C2
                if((ItemParam.iItemID >= 0) && int(ItemParam.eGrade) == int(11))
                {
                    bSkillWeapon = true;
                }
                // End:0x2FD
                if((bSkillWeapon == false) && (int(TypeOfWeapon) == int(7)) || int(TypeOfWeapon) == int(8))
                {
                    bTossWeapon = true;                    
                }
                else
                {
                    bTossWeapon = false;
                }                
            }
            else
            {
                bTossWeapon = false;
            }
            // End:0x394
            if(((int(Weapon.InventoryGroup) == 1) || int(Weapon.InventoryGroup) == 2) || bTossWeapon)
            {
                TossVel = Vector(GetViewRotation());
                TossVel = (TossVel * ((Velocity Dot TossVel) + float(500))) + vect(0.0000000, 0.0000000, 200.0000000);
                TossWeapon(TossVel);
            }
        }
    }
    // End:0x3C2
    if(DrivenVehicle != none)
    {
        Velocity = DrivenVehicle.Velocity;
        DrivenVehicle.DriverDied();
    }
    // End:0x41C
    if(Controller != none)
    {
        Controller.WasKilledBy(Killer);
        Level.Game.Killed(Killer, Controller, self, DamageType, CollisionPart, WeaponType, bWallShot);        
    }
    else
    {
        Level.Game.Killed(Killer, Controller(Owner), self, DamageType, CollisionPart, WeaponType, bWallShot);
    }
    DrivenVehicle = none;
    // End:0x488
    if(Killer != none)
    {
        TriggerEvent(Event, self, Killer.Pawn);        
    }
    else
    {
        TriggerEvent(Event, self, none);
    }
    // End:0x50F
    if((IsPlayerPawn()) || WasPlayerPawn())
    {
        PhysicsVolume.PlayerPawnDiedInVolume(self);
        // End:0x4DA
        foreach TouchingActors(Class'Engine_Decompressed.Trigger', t)
        {
            t.PlayerToucherDied(self);            
        }        
        // End:0x50E
        foreach TouchingActors(Class'Engine_Decompressed.NavigationPoint', N)
        {
            // End:0x50D
            if(N.bReceivePlayerToucherDiedNotify)
            {
                N.PlayerToucherDied(self);
            }            
        }        
    }
    RemovePowerups();
    Velocity.Z *= 1.3000000;
    // End:0x543
    if(IsHumanControlled())
    {
        PlayerController(Controller).ForceDeathUpdate();
    }
    // End:0x57E
    if((DamageType != none) && DamageType.default.bAlwaysGibs)
    {
        ChunkUp(Rotation, DamageType.default.GibPerterbation);        
    }
    else
    {
        NetUpdateFrequency = default.NetUpdateFrequency;
        PlayDying(DamageType, HitLocation, CollisionPart);
        // End:0x5BB
        if(Level.Game.bGameEnded)
        {
            return;
        }
        // End:0x5E3
        if(!bPhysicsAnimUpdate && !IsLocallyControlled())
        {
            ClientDying(DamageType, HitLocation);
        }
    }
    //return;    
}

function RemovePowerups()
{
    //return;    
}

event Falling()
{
    // End:0x1A
    if(Controller != none)
    {
        Controller.SetFall();
    }
    //return;    
}

event HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    //return;    
}

event PlayLandedSound(int SurfType)
{
    //return;    
}

event Landed(Vector HitNormal)
{
    ImpactVelocity = vect(0.0000000, 0.0000000, 0.0000000);
    TakeFallingDamage();
    // End:0x34
    if(Health > 0)
    {
        PlayLanded(Velocity.Z);
    }
    // End:0x87
    if((Velocity.Z < float(-200)) && PlayerController(Controller) != none)
    {
        bJustLanded = PlayerController(Controller).bLandingShake;
        OldZ = Location.Z;
    }
    LastHitBy = none;
    //return;    
}

event HeadVolumeChange(PhysicsVolume newHeadVolume)
{
    // End:0x28
    if((int(Level.NetMode) == int(NM_Client)) || Controller == none)
    {
        return;
    }
    // End:0x93
    if(HeadVolume.bWaterVolume)
    {
        // End:0x90
        if(!newHeadVolume.bWaterVolume)
        {
            // End:0x85
            if((Controller.bIsPlayer && BreathTime > float(0)) && BreathTime < float(8))
            {
                Gasp();
            }
            BreathTime = -1.0000000;
        }        
    }
    else
    {
        // End:0xB0
        if(newHeadVolume.bWaterVolume)
        {
            BreathTime = UnderWaterTime;
        }
    }
    //return;    
}

function bool TouchingWaterVolume()
{
    local PhysicsVolume V;

    // End:0x26
    foreach TouchingActors(Class'Engine_Decompressed.PhysicsVolume', V)
    {
        // End:0x25
        if(V.bWaterVolume)
        {            
            return true;
        }        
    }    
    return false;
    //return;    
}

function bool IsInPain()
{
    local PhysicsVolume V;

    // End:0x58
    foreach TouchingActors(Class'Engine_Decompressed.PhysicsVolume', V)
    {
        // End:0x57
        if((V.bPainCausing && V.DamageType != ReducedDamageType) && V.DamagePerSec > float(0))
        {            
            return true;
        }        
    }    
    return false;
    //return;    
}

event BreathTimer()
{
    // End:0x35
    if(((Health < 0) || int(Level.NetMode) == int(NM_Client)) || DrivenVehicle != none)
    {
        return;
    }
    TakeDrowningDamage();
    // End:0x51
    if(Health > 0)
    {
        BreathTime = 2.0000000;
    }
    //return;    
}

function TakeDrowningDamage()
{
    //return;    
}

function bool CheckWaterJump(out Vector WallNormal)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, checkpoint, Start, checkNorm;

    // End:0x2B
    if(AIController(Controller) != none)
    {
        checkpoint = Acceleration;
        checkpoint.Z = 0.0000000;
    }
    // End:0x4F
    if(checkpoint == vect(0.0000000, 0.0000000, 0.0000000))
    {
        checkpoint = Vector(Rotation);
    }
    checkpoint.Z = 0.0000000;
    checkNorm = Normal(checkpoint);
    checkpoint = Location + ((1.2000000 * CollisionRadius) * checkNorm);
    HitActor = Trace(HitLocation, HitNormal, checkpoint, Location, true, GetCollisionExtent());
    // End:0x164
    if((HitActor != none) && Pawn(HitActor) == none)
    {
        WallNormal = float(-1) * HitNormal;
        Start = Location;
        Start.Z += (1.1000000 * 35.0000000);
        checkpoint = Start + ((float(2) * CollisionRadius) * checkNorm);
        HitActor = Trace(HitLocation, HitNormal, checkpoint, Start, true);
        // End:0x164
        if((HitActor == none) || HitNormal.Z > 0.7000000)
        {
            return true;
        }
    }
    return false;
    //return;    
}

function DoDoubleJump(bool bUpdating)
{
    //return;    
}

function bool CanDoubleJump()
{
    //return;    
}

function bool CanMultiJump()
{
    //return;    
}

function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
    //return;    
}

function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
    //return;    
}

function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
    return false;
    //return;    
}

function bool DoJump(bool bUpdating)
{
    // End:0x1DD
    if((((!bIsCrouched && !bWantsToCrouch) && !bIsProned) && !bWantsToProne) && ((int(Physics) == int(1)) || int(Physics) == int(11)) || int(Physics) == int(9))
    {
        // End:0x91
        if((PlayerController(Controller) != none) && PlayerController(Controller).bAimMode)
        {
        }
        // End:0x122
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0xF8
            if((Level.Game != none) && Level.Game.GameDifficulty > float(2))
            {
                MakeNoise(0.1000000 * Level.Game.GameDifficulty);
            }
            // End:0x122
            if(bCountJumps && Inventory != none)
            {
                Inventory.OwnerEvent('Jumped');
            }
        }
        // End:0x147
        if(int(Physics) == int(9))
        {
            Velocity = JumpZ * Floor;            
        }
        else
        {
            // End:0x16A
            if(int(Physics) == int(11))
            {
                Velocity.Z = 0.0000000;                
            }
            else
            {
                // End:0x186
                if(bIsSprinting)
                {
                    Velocity.Z = default.JumpZ;                    
                }
                else
                {
                    Velocity.Z = JumpZ;
                }
            }
        }
        // End:0x1D6
        if((Base != none) && !Base.bWorldGeometry)
        {
            Velocity.Z += Base.Velocity.Z;
        }
        SetPhysics(2);
        return true;
    }
    return false;
    //return;    
}

function PlayMoverHitSound()
{
    //return;    
}

function PlayDyingSound()
{
    //return;    
}

function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local Vector BloodOffset, Mo, HitNormal;
    local Class<Effects> DesiredEffect;
    local Class<Emitter> DesiredEmitter;
    local PlayerController Hearer;

    // End:0x0D
    if(DamageType == none)
    {
        return;
    }
    // End:0x3F
    if((Damage <= float(0)) && (Controller == none) || !Controller.bGodMode)
    {
        return;
    }
    // End:0x1CD
    if(Damage > float(DamageType.default.DamageThreshold))
    {
        HitNormal = Normal(HitLocation - Location);
        // End:0x1CD
        if(EffectIsRelevant(Location, true))
        {
            DesiredEffect = DamageType.static.GetPawnDamageEffect(HitLocation, Damage, Momentum, self, Level.bDropDetail || int(Level.DetailMode) == int(0));
            // End:0x156
            if(DesiredEffect != none)
            {
                BloodOffset = (0.2000000 * CollisionRadius) * HitNormal;
                BloodOffset.Z = BloodOffset.Z * 0.5000000;
                Mo = Momentum;
                // End:0x139
                if(Mo.Z > float(0))
                {
                    Mo.Z *= 0.5000000;
                }
                Spawn(DesiredEffect, self,, HitLocation + BloodOffset, Rotator(Mo));
            }
            DesiredEmitter = DamageType.static.GetPawnDamageEmitter(HitLocation, Damage, Momentum, self, Level.bDropDetail || int(Level.DetailMode) == int(0));
            // End:0x1CD
            if(DesiredEmitter != none)
            {
                Spawn(DesiredEmitter,,, HitLocation + HitNormal, Rotator(HitNormal));
            }
        }
    }
    // End:0x213
    if(Health <= 0)
    {
        // End:0x211
        if(PhysicsVolume.bDestructive && PhysicsVolume.ExitActor != none)
        {
            Spawn(PhysicsVolume.ExitActor);
        }
        return;
    }
    // End:0x2DA
    if((Level.TimeSeconds - LastPainTime) > 0.1000000)
    {
        // End:0x277
        if(((instigatedBy != none) && DamageType != none) && DamageType.default.bDirectDamage)
        {
            Hearer = PlayerController(instigatedBy.Controller);
        }
        // End:0x293
        if(Hearer != none)
        {
            Hearer.bAcuteHearing = true;
        }
        PlayTakeHit(HitLocation, int(Damage), DamageType);
        // End:0x2C6
        if(Hearer != none)
        {
            Hearer.bAcuteHearing = false;
        }
        LastPainTime = Level.TimeSeconds;
    }
    //return;    
}

simulated function ChunkUp(Rotator HitRotation, float ChunkPerterbation)
{
    // End:0x57
    if((int(Level.NetMode) != int(NM_Client)) && Controller != none)
    {
        // End:0x4B
        if(Controller.bIsPlayer)
        {
            Controller.PawnDied(self);            
        }
        else
        {
            Controller.Destroy();
        }
    }
    Destroy();
    //return;    
}

simulated function TurnOff()
{
    SetCollision(true, false);
    AmbientSound = none;
    bNoWeaponFiring = true;
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    SetPhysics(0);
    bPhysicsAnimUpdate = false;
    bIsIdle = true;
    bWaitForAnim = false;
    StopAnimating();
    bIgnoreForces = true;
    //return;    
}

function bool IsInLoadout(Class<Inventory> InventoryClass)
{
    return true;
    //return;    
}

function ServerSetAnimAction(name NewAction)
{
    SetAnimAction(NewAction);
    //return;    
}

simulated event SetAnimAction(name NewAction)
{
    Log("Pawn::SetAnimAction called");
    AnimBlendParams(1, 0.0000000);
    PlayAnim(NewAction,, 0.1000000, 0);
    //return;    
}

simulated event PlayDying(Class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    AmbientSound = none;
    GotoState('Dying');
    // End:0x38
    if(bPhysicsAnimUpdate)
    {
        bReplicateMovement = false;
        bTearOff = true;
        Velocity += TearOffMomentum;
        SetPhysics(2);
    }
    bPlayedDeath = true;
    //return;    
}

simulated function PlayFiring(optional float Rate, optional name FiringMode)
{
    //return;    
}

function PlayWeaponSwitch(wWeapon newWeapon)
{
    //return;    
}

simulated function ServerPlayPutdownWeaponAnim(bool bQuick)
{
    //return;    
}

simulated function ServerThrowsWeaponAnim(bool bQuick)
{
    //return;    
}

simulated event StopPlayFiring()
{
    bSteadyFiring = false;
    //return;    
}

function PlayTakeHit(Vector HitLoc, int Damage, Class<DamageType> DamageType)
{
    local Sound DesiredSound;

    // End:0x0D
    if(Damage == 0)
    {
        return;
    }
    DesiredSound = DamageType.static.GetPawnDamageSound();
    // End:0x3A
    if(DesiredSound != none)
    {
        PlayOwnedSound(DesiredSound, 1);
    }
    //return;    
}

simulated event ChangeAnimation()
{
    // End:0x21
    if((Controller != none) && Controller.bControlAnimations)
    {
        return;
    }
    PlayWaiting();
    PlayMoving();
    //return;    
}

simulated event AnimEnd(int Channel)
{
    // End:0x11
    if(Channel == 0)
    {
        PlayWaiting();
    }
    //return;    
}

function bool CannotJumpNow()
{
    return false;
    //return;    
}

simulated event PlayJump()
{
    //return;    
}

simulated event PlayFalling()
{
    //return;    
}

simulated function PlayMoving()
{
    //return;    
}

simulated function PlayWaiting()
{
    //return;    
}

simulated function PlayReload()
{
    //return;    
}

simulated function PlayRechamber()
{
    //return;    
}

simulated event CheckProneAni(bool bGoProne)
{
    //return;    
}

function PlayLanded(float impactVel)
{
    // End:0x16
    if(!bPhysicsAnimUpdate)
    {
        PlayLandingAnimation(impactVel);
    }
    //return;    
}

simulated event PlayLandingAnimation(float impactVel)
{
    //return;    
}

function PlayVictoryAnimation()
{
    //return;    
}

function Vehicle GetVehicleBase()
{
    return Vehicle(Base);
    //return;    
}

function int GetSpree()
{
    return 0;
    //return;    
}

function IncrementSpree()
{
    //return;    
}

simulated function RawInput(float DeltaTime, float aBaseX, float aBaseY, float aBaseZ, float aMouseX, float aMouseY, float aForward, float aTurn, float aStrafe, float aUp, float aLookUp)
{
    //return;    
}

function Suicide()
{
    KilledBy(self);
    //return;    
}

function bool CheatWalk()
{
    UnderWaterTime = default.UnderWaterTime;
    SetCollision(true, true, true);
    SetPhysics(1);
    bCollideWorld = true;
    return true;
    //return;    
}

function bool CheatGhost()
{
    UnderWaterTime = -1.0000000;
    SetCollision(false, false, false);
    bCollideWorld = false;
    return true;
    //return;    
}

function bool CheatFly()
{
    UnderWaterTime = default.UnderWaterTime;
    SetCollision(true, true, true);
    bCollideWorld = true;
    return true;
    //return;    
}

function float RangedAttackTime()
{
    return 0.0000000;
    //return;    
}

simulated function Vector GetTargetLocation()
{
    return Location;
    //return;    
}

simulated function SetAimMode(bool bToggle)
{
    Log("SetAimMode");
    bIsAiming = bToggle;
    // End:0x28
    if(PlayerReplicationInfo == none)
    {
        return;
    }
    AnimBlendParams(1, 0.0000000);
    // End:0x1B5
    if(bIsIdle == true)
    {
        // End:0x105
        if(bIsCrouched == true)
        {
            // End:0x5A
            if(bWaitForAnim == true)
            {
                return;
            }
            // End:0x92
            if(bIsAiming == false)
            {
                // End:0x84
                if(int(TypeOfWeapon) == int(4))
                {
                    IdleWeaponAnim = Pistol_IdleCrouchAnim;                    
                }
                else
                {
                    IdleWeaponAnim = IdleCrouchAnim;
                }                
            }
            else
            {
                // End:0xB0
                if(int(TypeOfWeapon) == int(4))
                {
                    IdleWeaponAnim = Pistol_IdleCrouchAnim;                    
                }
                else
                {
                    IdleWeaponAnim = IdleAimCrouchAnim;
                }
            }
            Log("SetAimMode:AnimAction set");
            AnimAction = IdleWeaponAnim;
            AnimBlendParams(1, 0.0000000);
            PlayAnim(IdleWeaponAnim, 1.0000000, 1.0000000, 0);            
        }
        else
        {
            // End:0x1B5
            if(bIsProned == false)
            {
                // End:0x149
                if(bIsAiming == false)
                {
                    // End:0x13B
                    if(int(TypeOfWeapon) == int(4))
                    {
                        IdleWeaponAnim = Pistol_IdleRifleAnim;                        
                    }
                    else
                    {
                        IdleWeaponAnim = IdleRifleAnim;
                    }                    
                }
                else
                {
                    // End:0x167
                    if(int(TypeOfWeapon) == int(4))
                    {
                        IdleWeaponAnim = Pistol_IdleRifleAnim;                        
                    }
                    else
                    {
                        IdleWeaponAnim = IdleAimAnim;
                    }
                }
                Log("SetAimMode:AnimAction set");
                AnimAction = IdleWeaponAnim;
                AnimBlendParams(1, 0.0000000);
                PlayAnim(IdleWeaponAnim,, 0.1000000, 0);
            }
        }
    }
    //return;    
}

simulated function SetAimModeValueOnly(bool bToggle)
{
    bIsAiming = bToggle;
    //return;    
}

simulated function SetDriverFrame(float frame, optional float UpDownFrame)
{
    DriverCurrentFrame = frame;
    DriverUpDownFrame = UpDownFrame;
    //return;    
}

simulated event PlayTurretIdleAnim(optional bool UpDown)
{
    // End:0x20
    if(UpDown)
    {
        PlayAnim(TurretIdleUpDown, 1.0000000, 0.1000000, 2);        
    }
    else
    {
        PlayAnim(TurretIdle, 1.0000000, 0.1000000, 0);
    }
    //return;    
}

simulated event SetTurretIdleAnimFrame(float frame, optional float UpDownFrame)
{
    local name CurrentAnim;
    local float CurrentFrame, CurrentRate;

    // End:0x52
    if(UpDownFrame != float(0))
    {
        GetAnimParams(1, CurrentAnim, CurrentFrame, CurrentRate);
        // End:0x39
        if(CurrentAnim != TurretIdleUpDown)
        {
            PlayTurretIdleAnim(true);
        }
        SetAnimFrame(UpDownFrame, 1, 1);
        FreezeAnimAt(UpDownFrame, 1);
    }
    GetAnimParams(0, CurrentAnim, CurrentFrame, CurrentRate);
    // End:0x7D
    if(CurrentAnim != TurretIdle)
    {
        PlayTurretIdleAnim();
    }
    SetAnimFrame(frame, 0, 1);
    FreezeAnimAt(frame, 0);
    //return;    
}

simulated function ServerSetTurretingMode(bool bTurret)
{
    bIsTurreting = bTurret;
    RefreshCollisionHash();
    //return;    
}

function ClientSetTurretingMode(bool bTurret)
{
    bIsTurreting = bTurret;
    //return;    
}

simulated function ServerSetReloadMode(bool bReload)
{
    bReloading = bReload;
    //return;    
}

function ClientSetReloadMode(bool bReload)
{
    bReloading = bReload;
    //return;    
}

simulated function ServerSetWasReloadMode(bool bReload)
{
    bWasReloading = bReload;
    //return;    
}

function ClientSetWasReloadMode(bool bReload)
{
    bWasReloading = bReload;
    //return;    
}

simulated function ServerSetWaitingPreAnimMode(bool bWaiting)
{
    bWaitingPreAnim = bWaiting;
    //return;    
}

function ClientSetWaitingPreAnimMode(bool bWaiting)
{
    bWaitingPreAnim = bWaiting;
    //return;    
}

simulated function ServerSetTypeOfWeapon(byte ty)
{
    TypeOfWeapon = ty;
    //return;    
}

simulated event Tick(float Delta)
{
    // End:0x41
    if(fTimer_SuffEff > float(0))
    {
        fTimer_SuffEff -= Delta;
        // End:0x41
        if(fTimer_SuffEff <= float(0))
        {
            // End:0x41
            if(iSoundChannel_SuffEff != 0)
            {
                StopMusic(iSoundChannel_SuffEff, 0.0000000);
            }
        }
    }
    // End:0x57
    if(int(Role) == int(ROLE_Authority))
    {
        CheckEntryVehicle();
    }
    // End:0x93
    if(EAXEffectTime > 0.0000000)
    {
        EAXEffectTime -= Delta;
        // End:0x93
        if(EAXEffectTime <= 0.0000000)
        {
            EAXEffectTime = 0.0000000;
            curEAXEffect = none;
        }
    }
    // End:0xB2
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.PlayerHealth = Health;
    }
    //return;    
}

simulated function SetEaxEffect(I3DL2Listener EAXEffect, float fTime)
{
    curEAXEffect = EAXEffect;
    EAXEffectTime = fTime;
    //return;    
}

simulated function MakeFireNoise()
{
    vFormerFireNoisePos = vLastFireNoisePos;
    vLastFireNoisePos = Location;
    // End:0x34
    if(vFormerFireNoisePos == vLastFireNoisePos)
    {
        vLastFireNoisePos.Y += float(1);
    }
    CalcFireNoiseTime();
    //return;    
}

simulated event CalcFireNoiseTime()
{
    fLastFireNoiseTime = Level.TimeSeconds;
    // End:0xC0
    if((Level.GetLocalPlayerController().Pawn != none) && !Level.GetLocalPlayerController().Pawn.IsInState('Dying'))
    {
        // End:0xC0
        if(VSize(Level.GetLocalPlayerController().Pawn.Location - vLastFireNoisePos) < FireNoiseDistance)
        {
            // End:0xC0
            if((Level.TimeSeconds - LastKnownTime) > 0.2000000)
            {
                UpdateLastKnownPosAndTime(vLastFireNoisePos, fLastFireNoiseTime);
            }
        }
    }
    //return;    
}

simulated function MakeRadioMessage()
{
    vFormerRadioMessagePos = vLastRadioMessagePos;
    vLastRadioMessagePos = Location;
    // End:0x34
    if(vFormerRadioMessagePos == vLastRadioMessagePos)
    {
        vLastRadioMessagePos.Y += float(1);
    }
    CalcRadioMessageTime();
    //return;    
}

simulated function CalcRadioMessageTime()
{
    fLastRadioMessageTime = Level.TimeSeconds;
    // End:0xC0
    if((Level.GetLocalPlayerController().Pawn != none) && !Level.GetLocalPlayerController().Pawn.IsInState('Dying'))
    {
        // End:0xC0
        if(VSize(Level.GetLocalPlayerController().Pawn.Location - vLastRadioMessagePos) < RadioMessageDistance)
        {
            // End:0xC0
            if((Level.TimeSeconds - LastKnownTime) > 0.2000000)
            {
                UpdateLastKnownPosAndTime(vLastRadioMessagePos, fLastRadioMessageTime);
            }
        }
    }
    //return;    
}

simulated event UpdateLastKnownPosAndTime(Vector loc, float Time)
{
    LastKnownPos = loc;
    LastKnownTime = Time;
    //return;    
}

simulated function float GetMaxHealth()
{
    return HealthMax;
    //return;    
}

simulated function int GetCurHealth()
{
    return Health;
    //return;    
}

simulated function UAVScan()
{
    UAVLastScannedPos = Location;
    UAVScannedTime = Level.TimeSeconds;
    UpdateLastKnownPosAndTime(UAVLastScannedPos, UAVScannedTime);
    //return;    
}

function ServerAddWeapon(BtrDouble iUniqueID, int iWeaponID)
{
    Log((((("[Pawn::ServerAddWeapon] name=" $ LoginName) $ " iUniqueID=") $ __NFUN_918__(iUniqueID)) $ " iWeaponID=") $ string(iWeaponID));
    AddWeapon(iUniqueID, iWeaponID, 0, false);
    //return;    
}

function AddWeaponFromSkill(BtrDouble iUniqueID, int iWeaponID)
{
    local Inventory Inv;
    local wWeapon W;

    Inv = Inventory;
    J0x0B:

    // End:0x89 [Loop If]
    if(Inv != none)
    {
        // End:0x72
        if(Inv.InventoryClassNumber == iWeaponID)
        {
            Log(("Pawn::AddWeaponFromSkill() Already exist Weapon[" $ string(iWeaponID)) $ "]");
            return;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x0B;
    }
    W = AddWeapon(iUniqueID, iWeaponID, 0, false);
    // End:0xD5
    if(int(W.InventoryGroup) == 5)
    {
        PlayerController(Controller).ClientChangeSlot5(W, true);        
    }
    else
    {
        // End:0x105
        if(int(W.InventoryGroup) == 6)
        {
            PlayerController(Controller).ClientChangeSlot6(W);
        }
    }
    //return;    
}

function wWeapon AddWeapon(BtrDouble iUniqueID, int iWeaponID, int iAddPartsID, optional bool bPickupChange, optional int iPainting_Item_ID)
{
    local wWeapon W;
    local wWeaponBaseParams WBP;
    local string strName;
    local bool bUniqueID;
    local PlayerController PC;
    local float MaxAmmoPrimary, CurAmmoPrimary;

    Log(string(self) $ " =================  [Pawn::AddWeapon] =================== ");
    // End:0x50
    if(iWeaponID == 0)
    {
        return none;
    }
    W = none;
    WBP = Level.WeaponMgr.GetBaseParam(iWeaponID);
    // End:0x87
    if(WBP == none)
    {
        return none;
    }
    switch(WBP.eType)
    {
        // End:0x9C
        case 1:
        // End:0xA1
        case 2:
        // End:0xA6
        case 3:
        // End:0xAB
        case 4:
        // End:0xB0
        case 6:
        // End:0xB5
        case 13:
        // End:0xDB
        case 9:
            W = wWeapon(CreateInventory("Engine.wGun"));
            // End:0x2CF
            break;
        // End:0x10E
        case 5:
            W = wWeapon(CreateInventory("WWeapons.wThrowingWeapon"));
            // End:0x2CF
            break;
        // End:0x141
        case 7:
            W = wWeapon(CreateInventory("WWeapons.wRocketLauncher"));
            // End:0x2CF
            break;
        // End:0x172
        case 8:
            W = wWeapon(CreateInventory("WWeapons.wFlameThrower"));
            // End:0x2CF
            break;
        // End:0x19F
        case 10:
            W = wWeapon(CreateInventory("WWeapons.wDemoPack"));
            // End:0x2CF
            break;
        // End:0x1CD
        case 11:
            W = wWeapon(CreateInventory("WWeapons.wAirStrike"));
            // End:0x2CF
            break;
        // End:0x209
        case 14:
            W = wWeapon(CreateInventory("WWeapons.wTelegraphPack_AirStrike"));
            // End:0x2CF
            break;
        // End:0x237
        case 12:
            W = wWeapon(CreateInventory("Engine.wMeleeWeapon"));
            // End:0x2CF
            break;
        // End:0x26D
        case 16:
            W = wWeapon(CreateInventory("WWeapons.wTelegraphPack_UAV"));
            // End:0x2CF
            break;
        // End:0x2A4
        case 15:
            W = wWeapon(CreateInventory("WWeapons.wTelegraphPack_Heli"));
            // End:0x2CF
            break;
        // End:0x2CC
        case 17:
            W = wWeapon(CreateInventory("Engine.wKnife"));
            // End:0x2CF
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x2DC
    if(W == none)
    {
        return none;
    }
    W.bPickupChange = bPickupChange;
    W.iPainting_Item_ID = iPainting_Item_ID;
    W.InventoryClassNumber = iWeaponID;
    W.InventoryClassAddPartsID = iAddPartsID;
    W.wLoadOut_Server(iWeaponID, iAddPartsID);
    // End:0x3C6
    if(W != none)
    {
        W.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
        Log((((((string(self) $ "    [Pawn::AddWeapon] ") $ string(W)) $ " / maxAmmo=") $ string(MaxAmmoPrimary)) $ " / curAmmo=") $ string(CurAmmoPrimary));        
    }
    else
    {
        Log((((string(self) $ "    [Pawn::AddWeapon] == None ") $ string(W)) $ " / iWeaponID=") $ string(iWeaponID));
    }
    Controller.ClientTestWeapon(W, iWeaponID);
    // End:0x469
    if(__NFUN_919__(iUniqueID, 0))
    {
        W.InventoryUniqueNumber = EmptyBtrDouble();
        strName = WBP.strName;
        bUniqueID = false;        
    }
    else
    {
        W.InventoryUniqueNumber = iUniqueID;
        strName = __NFUN_918__(iUniqueID);
        bUniqueID = true;
    }
    PC = PlayerController(Owner);
    // End:0x4F6
    if((PC != none) && PC.GSSS != none)
    {
        PC.GSSS.SetToStorage_AddWeapon(strName, iWeaponID, iAddPartsID, bUniqueID, iPainting_Item_ID);
    }
    return W;
    //return;    
}

function ServerRefreshCollisionHash()
{
    RefreshCollisionHash();
    //return;    
}

function SetDesiredRotationCheck(bool Yaw, optional bool Pitch, optional bool Roll)
{
    DesiredRotationCheck_Yaw = Yaw;
    DesiredRotationCheck_Pitch = Pitch;
    DesiredRotationCheck_Roll = Roll;
    //return;    
}

simulated function QuickTurn()
{
    //return;    
}

simulated function GetWeaponAttachmentInfo(out byte byFlashCount, out byte byFiringMode)
{
    //return;    
}

simulated function bool IsEnableBombSetting()
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x54
    if((InStr(string(Anim), "_Putdown") != -1) || InStr(string(Anim), "_PutDown") != -1)
    {
        return false;
    }
    return true;
    //return;    
}

function AddWeaponMagazine()
{
    //return;    
}

function SetWeaponQuickAimZoom(bool bOn)
{
    //return;    
}

function SetWeaponQuickReload(bool bOn)
{
    //return;    
}

function SetWeaponQuickChange(bool bOn)
{
    //return;    
}

function SetRemoveWeaponSkill(wWeapon W)
{
    //return;    
}

function bool CanQuickWeaponChange()
{
    return bCanQuickWeaponChange;
    //return;    
}

function SetInfiniteAmmoTutorial(optional bool bDeleteGranade, optional int iGranadeCount)
{
    //return;    
}

exec function Set1stFov(float f)
{
    self.Weapon.DisplayFOV = f;
    //return;    
}

function float GetBaseStaminaTime()
{
    // End:0x66
    if(((Controller != none) && Controller.SkillBase != none) && Controller.SkillBase.bAddStamina)
    {
        return Level.CharMgr.MyPlayer.Stm_MaxTime * 1.3000000;
    }
    return Level.CharMgr.MyPlayer.Stm_MaxTime;
    //return;    
}

simulated state ThirdViewReloadState
{    stop;    
}

state Dying
{
    ignores BeginState, TakeDamage, BaseChange, LieStill, AnimEnd, LandThump, 
	    ReduceCylinder, Landed, Timer, FellOutOfWorld, Died, 
	    PlayNextAnimation, PlayTakeHit, PlayWeaponSwitch, PlayFiring, StopPlayFiring, 
	    ChangeAnimation;

    event ChangeAnimation()
    {
        //return;        
    }

    event StopPlayFiring()
    {
        //return;        
    }

    function PlayFiring(float Rate, name FiringMode)
    {
        //return;        
    }

    function PlayWeaponSwitch(wWeapon newWeapon)
    {
        //return;        
    }

    function PlayTakeHit(Vector HitLoc, int Damage, Class<DamageType> DamageType)
    {
        //return;        
    }

    simulated function PlayNextAnimation()
    {
        //return;        
    }

    function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }

    event FellOutOfWorld(Actor.eKillZType KillType)
    {
        // End:0x24
        if((int(KillType) == int(1)) || int(KillType) == int(2))
        {
            return;
        }
        Destroy();
        //return;        
    }

    function Timer()
    {
        // End:0x0E
        if(!PlayerCanSeeMe())
        {
            Destroy();            
        }
        else
        {
            SetTimer(2.0000000, false);
        }
        //return;        
    }

    function Landed(Vector HitNormal)
    {
        local Rotator finalRot;

        // End:0x4F
        if(Velocity.Z < float(-500))
        {
            TakeDamage(int(float(1) - (Velocity.Z / float(30))), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine_Decompressed.Crushed');
        }
        finalRot = Rotation;
        finalRot.Roll = 0;
        finalRot.Pitch = 0;
        SetRotation(finalRot);
        SetPhysics(0);
        SetCollision(true, false);
        // End:0x93
        if(!IsAnimating(0))
        {
            LieStill();
        }
        //return;        
    }

    function ReduceCylinder()
    {
        SetCollision(false, false);
        //return;        
    }

    function LandThump()
    {
        // End:0x18
        if(int(Physics) == int(0))
        {
            bThumped = true;
        }
        //return;        
    }

    event AnimEnd(int Channel)
    {
        // End:0x0D
        if(Channel != 0)
        {
            return;
        }
        // End:0x26
        if(int(Physics) == int(0))
        {
            LieStill();            
        }
        else
        {
            // End:0x46
            if(PhysicsVolume.bWaterVolume)
            {
                bThumped = true;
                LieStill();
            }
        }
        //return;        
    }

    function LieStill()
    {
        // End:0x11
        if(!bThumped)
        {
            LandThump();
        }
        ReduceCylinder();
        //return;        
    }

    singular function BaseChange()
    {
        // End:0x13
        if(Base == none)
        {
            SetPhysics(2);            
        }
        else
        {
            // End:0x33
            if(Pawn(Base) != none)
            {
                ChunkUp(Rotation, 1.0000000);
            }
        }
        //return;        
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        SetPhysics(2);
        // End:0x3C
        if((int(Physics) == int(0)) && Momentum.Z < float(0))
        {
            Momentum.Z *= float(-1);
        }
        Velocity += ((float(3) * Momentum) / (Mass + float(200)));
        // End:0x66
        if(bInvulnerableBody)
        {
            return;
        }
        Damage *= DamageType.default.GibModifier;
        Health -= Damage;
        // End:0xC7
        if(((Damage > 30) || !IsAnimating()) && Health < -80)
        {
            ChunkUp(Rotation, DamageType.default.GibPerterbation);
        }
        //return;        
    }

    function BeginState()
    {
        local int i;

        // End:0x32
        if(bTearOff && int(Level.NetMode) == int(NM_DedicatedServer))
        {
            LifeSpan = 1.0000000;            
        }
        else
        {
            SetTimer(12.0000000, false);
        }
        SetPhysics(2);
        bInvulnerableBody = true;
        // End:0x84
        if(Controller != none)
        {
            // End:0x78
            if(Controller.bIsPlayer)
            {
                Controller.PawnDied(self);                
            }
            else
            {
                Controller.Destroy();
            }
        }
        i = 0;
        J0x8B:

        // End:0xCB [Loop If]
        if(i < Attached.Length)
        {
            // End:0xC1
            if(Attached[i] != none)
            {
                Attached[i].PawnBaseDied();
            }
            i++;
            // [Loop Continue]
            goto J0x8B;
        }
        //return;        
    }
Begin:

    Sleep(0.2000000);
    bInvulnerableBody = false;
    PlayDyingSound();
    stop;        
}

auto state WatingForStart
{
    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }
Begin:

    // End:0x105
    if(((false && PlayerReplicationInfo != none) && PlayerReplicationInfo.IsIntervented) && PlayerReplicationInfo.NumLives <= 1)
    {
        switch(Level.GetMatchMaker().kGame_GameMode)
        {
            // End:0x67
            case Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_SD():
            // End:0x79
            case Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DOA():
            // End:0xF5
            case Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Sabotage():
                // End:0xF5
                if(float(PlayerReplicationInfo.RoundWhenIntervented) < ((Level.GRI.Teams[0].Score + Level.GRI.Teams[1].Score) + float(1)))
                {
                    GotoState('InvulnerableTime');
                    // End:0x102
                    break;
                }
            // End:0xFFFF
            default:
                GotoState('Intervented');
                // End:0x102
                break;
                break;
        }        
    }
    else
    {
        GotoState('InvulnerableTime');
    }
    stop;                
}

state InvulnerableTime
{
    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }
Begin:

    // End:0x2D
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.IsInvulnerable = true;
        PlayerReplicationInfo.IsWaitingForStart = false;
    }
    // End:0x146
    if(bInvulnerableOnRespawn)
    {
        Log(("Pawn" $ OwnerName) @ "is invulnerable");
        // End:0x7F
        if(Level.GetMatchMaker().BeginnerMode)
        {
            Sleep(fRespawnInvulnerableTimeBeginner);            
        }
        else
        {
            // End:0xB6
            if(Level.GetMatchMaker().kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_SD())
            {
                Sleep(fRespawnInvulnerableTime_SDMode);                
            }
            else
            {
                // End:0xE5
                if(Level.GetMatchMaker().kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DOA())
                {                    
                }
                else
                {
                    // End:0x11E
                    if(Level.GetMatchMaker().BotTutorial && self.IsA('wAIPawn'))
                    {
                        Sleep(1.3300000);                        
                    }
                    else
                    {
                        Sleep(fRespawnInvulnerableTime);
                    }
                }
            }
        }
        Log(("Pawn" $ OwnerName) @ "is vulnerable");
    }
    // End:0x162
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.IsInvulnerable = false;
    }
    GotoState('None');
    stop;            
}

state Intervented
{
    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }

    function EndState()
    {
        bHidden = false;
        // End:0x35
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.IsInvulnerable = true;
            PlayerReplicationInfo.IsWaitingForStart = false;
        }
        Controller.ClientOnEndIntervented();
        Controller.GotoState('PlayerWalking');
        //return;        
    }
Begin:

    bHidden = true;
    Controller.ClientOnBeginIntervented();
    Controller.GotoState('WaitingForStart');
    Sleep(6.0000000);
    GotoState('InvulnerableTime');
    stop;        
}

defaultproperties
{
    bDrawNameTag=true
    ProneHeight=40.0000000
    ProneRadius=34.0000000
    bJumpCapable=true
    bCanJump=true
    bCanWalk=true
    bCanDoubleJump=true
    bSimulateGravity=true
    bServerMoveSetPawnRot=true
    bNoCoronas=true
    bAutoActivate=true
    bLOSHearing=true
    fWallHearingFactor=4.0000000
    bUseCompressedPosition=true
    bCanUse=true
    Visibility=128
    DesiredSpeed=1.0000000
    MaxDesiredSpeed=1.0000000
    HearingThreshold=2800.0000000
    SightRadius=5000.0000000
    AvgPhysicsTime=0.1000000
    GroundSpeed=440.0000000
    WaterSpeed=300.0000000
    AirSpeed=440.0000000
    LadderSpeed=200.0000000
    AccelRate=2048.0000000
    JumpZ=420.0000000
    AirControl=0.0500000
    SprintSpeed=660.0000000
    CrouchedSpeed=270.0000000
    PronedSpeed=100.0000000
    AimedGroundSpeed=170.0000000
    AimedCrouchedSpeed=110.0000000
    F_DiagmoveRatio=0.9000000
    SideMoveRatio=0.8000000
    B_DiagmoveRatio=0.7000000
    BackMoveRatio=0.7000000
    WalkZDamp=0.2500000
    MaxFallSpeed=1200.0000000
    PitchUpLimit=18000
    PitchDownLimit=49153
    BaseEyeHeight=64.0000000
    BaseEyeHeightCroucned=40.0000000
    BaseEyeHeightProned=18.0000000
    EyeHeight=54.0000000
    CrouchHeight=40.0000000
    CrouchRadius=34.0000000
    DrivingHeight=20.0000000
    DrivingRadius=22.0000000
    HealthMax=100.0000000
    SuperHealthMax=199.0000000
    Health=100
    HeadRadius=9.0000000
    HeadHeight=6.0000000
    HeadScale=1.0000000
    bSetPCRotOnPossess=true
    noise1time=-10.0000000
    noise2time=-10.0000000
    Bob=0.0007000
    BobMagicValue1=8.0000000
    BobMagicValue2=8.0000000
    BobMagicValue3=16.0000000
    BobMagicValue4=16.0000000
    SoundDampening=1.0000000
    DamageScaling=1.0000000
    AmbientSoundScaling=0.8000000
    ControllerClass=Class'Engine_Decompressed.AIController'
    LandMovementState="PlayerWalking"
    WaterMovementState="PlayerSwimming"
    BlendChangeTime=0.2500000
    bIsNeedUpdateAnim=true
    RepPawnPositionTime=0.2500000
    FireNoiseDistance=6000.0000000
    RadioMessageDistance=6000.0000000
    UAVScannedTime=-999.0000000
    LastKnownTime=-999.0000000
    DealDamageRatio_Default=1.0000000
    DealDamageRatio_Explosive=1.0000000
    DealDamageRatio_Melee=1.0000000
    bInvulnerableOnRespawn=true
    fRespawnInvulnerableTime=3.2000000
    fRespawnInvulnerableTime_SDMode=7.6999998
    fRespawnInvulnerableTimeBeginner=5.3299999
    fReduceVelRate=1.2000000
    DrawType=2
    bUseDynamicLights=true
    bStasis=true
    bDisableSorting=true
    bAlwaysRelevant=true
    bUpdateSimulatedPosition=true
    RemoteRole=2
    NetPriority=2.0000000
    Texture=Texture'Engine_Decompressed.S_Pawn'
    bSyncCollsionSizeHK=false
    bShadowMap=true
    bTravel=true
    bCanBeDamaged=true
    bShouldBaseAtStartup=true
    bOwnerNoSee=true
    bCanTeleport=true
    bDisturbFluidSurface=true
    bForceSkelUpdate=true
    SoundVolume=255
    SoundRadius=160.0000000
    CollisionRadius=34.0000000
    CollisionHeight=78.0000000
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    bRotateToDesired=true
    RotationRate=(Pitch=4096,Yaw=20000,Roll=3072)
    bNoRepMesh=true
    bDirectional=true
}