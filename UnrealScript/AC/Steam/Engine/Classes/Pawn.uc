/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Pawn.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:3
 *	Properties:518
 *	Functions:316
 *	States:5
 *
 *******************************************************************************/
class Pawn extends Actor
    dependson(Actor)
    dependson(Controller)
    dependson(wSkillBase)
    dependson(LevelInfo)
    dependson(wCharacterManager)
    dependson(wMyPlayerStatus)
    dependson(wWeapon)
    dependson(PlayerReplicationInfo)
    dependson(wMatchMaker)
    dependson(wGameSettings)
    dependson(GameReplicationInfo)
    dependson(TeamInfo)
    dependson(wWeaponManager)
    dependson(wWeaponBaseParams)
    dependson(PlayerController)
    dependson(wGameStateStorageSender)
    dependson(Inventory)
    dependson(DamageType)
    dependson(PhysicsVolume)
    dependson(GameInfo)
    dependson(GameInfoScriptPart)
    dependson(wWeaponAcce)
    dependson(Vehicle)
    dependson(wGameManager)
    dependson(wItemBaseParam)
    dependson(Trigger)
    dependson(NavigationPoint)
    dependson(wMatchUserInfo)
    dependson(wMessage_Score)
    dependson(AIScript)
    dependson(AIController)
    dependson(Projector)
    dependson(Decoration)
    dependson(Powerups)
    dependson(wMessage_Game_ImpSystem)
    dependson(HUD)
    dependson(wWeaponPickup)
    dependson(wWeaponFire)
    dependson(wGun)
    dependson(Canvas)
    native
    nativereplication
    exportstructs
    abstract
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
    var() class<DamageType> damtype;
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
var class<DamageType> ReducedDamageType;
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
var class<Effects> BloodEffect;
var class<Effects> LowGoreBlood;
var class<AIController> ControllerClass;
var PlayerReplicationInfo PlayerReplicationInfo;
var LadderVolume OnLadder;
var name LandMovementState;
var name WaterMovementState;
var PlayerStart LastStartSpot;
var float LastStartTime;
var name AnimAction;
var Vector TakeHitLocation;
var class<DamageType> HitDamageType;
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
var delegate<OnReachedDestination> __OnReachedDestination__Delegate;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        HitCollisionPart, OwnerName,
        HitDamageType, TeamIndex,
        HeadScale, PlayerReplicationInfo,
        bSpecialHUD, DrivenVehicle,
        AnimAction, AttackerLoc,
        byUseKey, bIsProned,
        bIsCrouched, TakeHitLocation,
        bIsSprinting, bSimulateGravity;

    // Pos:0x18
    reliable if(Role == 4)
        bWasReloading, TypeOfWeapon,
        LoginName, DriverUpDownFrame,
        bIsTurreting, IDNum,
        bCanQuickReload, bCanQuickWeaponChange,
        bIsAiming, DriverCurrentFrame,
        bWaitingPreAnim;

    // Pos:0x25
    reliable if(bTearOff && bNetDirty && Role == 4)
        TearOffMomentum;

    // Pos:0x48
    reliable if(bNetDirty && !bNetOwner && Role == 4)
        ViewPitch, bSteadyFiring;

    // Pos:0x6d
    reliable if(bNetDirty && bNetOwner && Role == 4)
        Controller, AccelRate,
        bCanWallDodge, GroundSpeed,
        WaterSpeed, SelectedItem,
        AirSpeed, PitchDownLimit,
        PitchUpLimit, JumpZ,
        AirControl;

    // Pos:0x90
    reliable if(bNetDirty && Role == 4)
        Health, HealthMax;

    // Pos:0xa8
    reliable if(!bNetOwner && Role == 4)
        PawnPosition;

    // Pos:0xc2
    reliable if(Role == 4)
        kPendingWPick, HitFxTicker,
        HitFx, ShieldStrength,
        EntryVehicle;

    // Pos:0xcf
    reliable if(Role < 4)
        ServerPickupWeapon, ServerPlayPutdownWeaponAnim,
        ServerSetAnimAction, ServerThrowsWeaponAnim,
        ServerChangedWeapon, NextItem,
        ServerNoTranslocator, ServerStanceChanged,
        ServerRefreshCollisionHash, ServerAddWeapon;

    // Pos:0xdc
    reliable if(Role < 4)
        ServerSetUseKeyState, ServerSetTypeOfWeapon,
        ServerSetWaitingPreAnimMode, ServerSetWasReloadMode,
        SetAimMode, ServerSetTurretingMode,
        ServerSetReloadMode;

    // Pos:0xe9
    reliable if(Role < 4)
        ServerSetWeaponInfo, ServerSetPlayerScoreInfo;

    // Pos:0xf6
    reliable if(Role == 4)
        ClientSetPlayerScoreInfo, ClientSetWeaponInfo,
        ClientForceChangedWeapon;

    // Pos:0x103
    reliable if(Role == 4)
        LastDamageDealtTime, LastDamageCollisionPart;

    // Pos:0x110
    reliable if(Role < 4)
        ServerPlaySound, ServerStopAllSoundByActor,
        ServerStopLoopSoundByActor;

}

delegate bool OnReachedDestination(Vector Dir, Actor GoalActor);
function ServerPlaySound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate, optional bool Loop, optional int SellectTeam, optional bool bExceptOwner)
{
    PlaySound(Sound, Slot, Volume, bNoOverride, Radius, Pitch, Attenuate, Loop, SellectTeam, bExceptOwner);
}

function ServerStopAllSoundByActor()
{
    local Controller C, NextC;

    C = Level.ControllerList;
    J0x14:
    // End:0x66 [While If]
    if(C != none)
    {
        NextC = C.nextController;
        // End:0x58
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientStopAllSoundByActor(self);
        }
        C = NextC;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function ServerStopLoopSoundByActor()
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x5b [While If]
    if(C != none)
    {
        // End:0x44
        if(PlayerController(C) != none)
        {
            PlayerController(C).ClientStopLoopSoundByActor(self);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

// Export UPawn::execHasChannel(FFrame&, void* const)
native function string HasChannel();
// Export UPawn::execCheckRelevantTimeOut(FFrame&, void* const)
native function string CheckRelevantTimeOut();
// Export UPawn::execIsNetReady(FFrame&, void* const)
native function string IsNetReady();
// Export UPawn::execCanSee(FFrame&, void* const)
native function string CanSee();
simulated function FootStepping(int side);
simulated function PlayBreathSound();
simulated function PlayBreathSounds();
simulated function PlayEquipHitSound();
event StoreWeaponInfo();
event ClientSetWeaponInfo();
event ServerSetWeaponInfo(int WeaponClassNumber, int WeaponAddPartsID, int WeaponTotalAmmo, int WeaponCurrentAmmo);
event StorePlayerScoreInfo();
event ClientSetPlayerScoreInfo();
event ServerSetPlayerScoreInfo(int TeamIndex, int Kills, int Assists, int Deaths, int EXPs, int Points, int Scores);
function ServerStanceChanged(wWeaponFire.ESpreadStance ss)
{
    Weapon.GetFireMode(0).SetSpreadStance(ss);
}

static function StaticPrecache(LevelInfo L);
// Export UPawn::execSetViewPitch(FFrame&, void* const)
native simulated function SetViewPitch(int NewPitch);
// Export UPawn::execSetTwistLook(FFrame&, void* const)
native simulated function SetTwistLook(int twist, int look);
// Export UPawn::execGet4WayDirection(FFrame&, void* const)
native simulated function int Get4WayDirection();
// Export UPawn::execGetIsEnableProne(FFrame&, void* const)
native simulated function bool GetIsEnableProne();
simulated event SetHeadScale(float NewScale);
simulated function AddNoWeaponChangeMessage(byte bySlot);
// Export UPawn::execGetDetailOffset(FFrame&, void* const)
native simulated function Vector GetDetailOffset(Vector vLoc, Rotator rRot);
simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY)
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x5e
    if(PC != none && PC.myHUD != none)
    {
        PC.myHUD.DrawCustomBeacon(C, self, ScreenLocX, ScreenLocY);
    }
}

// Export UPawn::execReachedDestination(FFrame&, void* const)
native function bool ReachedDestination(Actor Goal);
// Export UPawn::execForceCrouch(FFrame&, void* const)
native function ForceCrouch();
// Export UPawn::execRefreshCollisionHash(FFrame&, void* const)
native function RefreshCollisionHash();
// Export UPawn::execCheckProneRotate(FFrame&, void* const)
native function bool CheckProneRotate(int CurYaw, int NewYaw);
// Export UPawn::execForcePlayIdle(FFrame&, void* const)
native function ForcePlayIdle();
simulated function MakeShellEffect();
simulated function MakeShellEffect_Rechamber();
function int SpawnSupplyItem();
function SpawnMedals();
function int GetPostureIndex()
{
    // End:0x0f
    if(bIsProned)
    {
        return 2;
    }
    // End:0x1f
    else
    {
        // End:0x1d
        if(bIsCrouched)
        {
            return 1;
        }
        // End:0x1f
        else
        {
            return 0;
        }
    }
}

simulated function wWeapon GetDemoRecordingWeapon()
{
    local Inventory Inv;
    local int i;

    Inv = Inventory;
    J0x0b:
    // End:0x9a [While If]
    if(Inv != none)
    {
        // End:0x6b
        if(wWeapon(Inv) != none && Inv.ThirdPersonActor != none)
        {
            Weapon = wWeapon(Inv);
            PendingWeapon = Weapon;
            Weapon.bSpectated = true;
        }
        // End:0x9a
        else
        {
            ++ i;
            // End:0x83
            if(i > 500)
            {
                return none;
            }
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x0b;
        }
    }
    return Weapon;
}

simulated function SetBaseEyeheight()
{
    // End:0x19
    if(!bIsCrouched)
    {
        BaseEyeHeight = default.BaseEyeHeight;
    }
    // End:0x24
    else
    {
        BaseEyeHeight = default.BaseEyeHeightCroucned;
    }
    EyeHeight = BaseEyeHeight;
}

simulated function bool GetIsFiring()
{
    return false;
}

function Pawn GetAimTarget()
{
    return self;
}

function DeactivateSpawnProtection()
{
    SpawnTime = -100000.0;
}

function Actor GetPathTo(Actor Dest)
{
    // End:0x16
    if(PlayerController(Controller) == none)
    {
        return Dest;
    }
    return PlayerController(Controller).GetPathTo(Dest);
}

function PlayerChangedTeam()
{
    Died(none, class'DamageType', Location);
}

function Reset()
{
    // End:0x40
    if(Controller == none || Controller.bIsPlayer)
    {
        // End:0x3a
        if(Controller != none)
        {
            Controller.PawnDied(self);
        }
        Destroy();
    }
    // End:0x46
    else
    {
        super.Reset();
    }
    DamageInfo.Length = 0;
}

function bool HasWeapon()
{
    return Weapon != none;
}

function bool HasWeaponByWeaponID(int weaponID)
{
    local Inventory i;
    local wWeapon W;

    i = Inventory;
    J0x0b:
    // End:0x6b [While If]
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
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return false;
}

function wWeapon GetWeaponByInvenGroup(int nInvenGroupID)
{
    local Inventory i;
    local wWeapon W;

    i = Inventory;
    J0x0b:
    // End:0x6f [While If]
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
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    return none;
}

function ChooseFireAt(Actor A)
{
    Fire(0.0);
}

function bool StopWeaponFiring()
{
    // End:0x54
    if(Weapon != none && Weapon.IsFiring())
    {
        Weapon.ServerStopFire(0);
        Weapon.ServerStopFire(1);
        Weapon.ServerStopFire(2);
        return true;
    }
    return false;
}

simulated function Fire(optional float f)
{
    // End:0x1f
    if(Weapon != none)
    {
        Weapon.Fire(f);
    }
}

simulated function AltFire(optional float f)
{
    // End:0x1f
    if(Weapon != none)
    {
        Weapon.AltFire(f);
    }
}

function bool RecommendLongRangedAttack()
{
    // End:0x1b
    if(Weapon != none)
    {
        return Weapon.RecommendLongRangedAttack();
    }
    return false;
}

function bool CanAttack(Actor Other)
{
    // End:0x0d
    if(Weapon == none)
    {
        return false;
    }
    return Weapon.CanAttack(Other);
}

function bool TooCloseToAttack(Actor Other)
{
    return false;
}

function float RefireRate()
{
    // End:0x1b
    if(Weapon != none)
    {
        return Weapon.RefireRate();
    }
    return 0.0;
}

function bool IsFiring()
{
    // End:0x1b
    if(Weapon != none)
    {
        return Weapon.IsFiring();
    }
    return false;
}

function bool IsWeaponSingleFire()
{
    // End:0x1b
    if(Weapon != none)
    {
        return Weapon.IsSingleFire();
    }
    return false;
}

function bool FireOnRelease()
{
    // End:0x1b
    if(Weapon != none)
    {
        return Weapon.FireOnRelease();
    }
    return false;
}

function bool NeedToTurn(Vector targ)
{
    local Vector LookDir, AimDir;

    LookDir = vector(Rotation);
    LookDir.Z = 0.0;
    LookDir = Normal(LookDir);
    AimDir = targ - Location;
    AimDir.Z = 0.0;
    AimDir = Normal(AimDir);
    return LookDir Dot AimDir < 0.930;
}

function float ModifyThreat(float Current, Pawn Threat)
{
    return Current;
}

function DrawHUD(Canvas Canvas);
simulated function SpecialDrawCrosshair(Canvas C);
function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation);
function bool SpectatorSpecialCalcView(PlayerController Viewer, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation);
simulated function string GetHumanReadableName()
{
    // End:0x1a
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;
    }
    return MenuName;
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
    MakeNoise(1.0);
}

function HoldFlag(Actor FlagActor);
function DropFlag(optional string sReason);
function bool PerformDodge(Actor.EDoubleClickDir DoubleClickMove, Vector Dir, Vector Cross);
function NotifyTeamChanged();
function AddDefaultSkills(optional bool bQuickslotChange);
function ChangeInventoryByQSlot();
function PossessedBy(Controller C)
{
    Controller = C;
    NetPriority = 3.0;
    NetUpdateFrequency = C.BtrUpdateFrequency;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x7f
    if(C.PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo = C.PlayerReplicationInfo;
        OwnerName = PlayerReplicationInfo.PlayerName;
    }
    // End:0xd7
    if(C.IsA('PlayerController'))
    {
        // End:0xad
        if(bSetPCRotOnPossess)
        {
            C.SetRotation(Rotation);
        }
        // End:0xce
        if(Level.NetMode != 0)
        {
            RemoteRole = 3;
        }
        BecomeViewTarget();
    }
    // End:0xe2
    else
    {
        RemoteRole = default.RemoteRole;
    }
    SetOwner(Controller);
    EyeHeight = BaseEyeHeight;
    ChangeAnimation();
    TeamIndex = GetTeamNum();
}

function UnPossessed()
{
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x2f
    if(DrivenVehicle != none)
    {
        NetUpdateFrequency = 5.0;
    }
    PlayerReplicationInfo = none;
    SetOwner(none);
    Controller = none;
}

simulated function bool PointOfView()
{
    return false;
}

function BecomeViewTarget()
{
    bUpdateEyeheight = true;
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
}

function bool CanGrabLadder()
{
    return bCanClimbLadders && Controller != none && Physics != 11 && Physics != 2 || Abs(Velocity.Z) <= JumpZ;
}

event SetSprinting(bool bNewIsSprinting)
{
    // End:0x24
    if(bNewIsSprinting != bIsSprinting)
    {
        bIsSprinting = bNewIsSprinting;
        ChangeAnimation();
    }
}

simulated function bool CanSplash()
{
    // End:0x70
    if(Level.TimeSeconds - SplashTime > 0.150 && Physics == 2 || Physics == 4 && Abs(Velocity.Z) > float(100))
    {
        SplashTime = Level.TimeSeconds;
        return true;
    }
    return false;
}

function EndClimbLadder(LadderVolume OldLadder)
{
    // End:0x1a
    if(Controller != none)
    {
        Controller.EndClimbLadder();
    }
    // End:0x2f
    if(Physics == 11)
    {
        SetPhysics(2);
    }
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
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("CamLoc: " $ string(camLoc) $ " / CamRot: " $ string(camRot) $ " / DrivenVehicle : " $ string(DrivenVehicle));
    GetAnimParams(1, Anim, frame, Rate);
    t = "HIJ - CH 1 AnimSequence " $ string(Anim) $ " Frame " $ string(frame) $ " Rate " $ string(Rate) $ " // Physics : " $ string(Physics);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText(t);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("Animation Action " $ string(AnimAction) $ " Health " $ string(Health));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("Anchor " $ string(Anchor) $ " Serpentine Dist " $ string(SerpentineDist) $ " Time " $ string(SerpentineTime));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    t = "Floor " $ string(Floor) $ " DesiredSpeed " $ string(DesiredSpeed) $ " Crouched " $ string(bIsCrouched) $ " Try to uncrouch " $ string(UncrouchTime);
    // End:0x31f
    if(OnLadder != none || Physics == 11)
    {
        t = t $ " on ladder " $ string(OnLadder);
    }
    Canvas.DrawText(t);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("EyeHeight " $ string(EyeHeight) $ " BaseEyeHeight " $ string(BaseEyeHeight) $ " Physics Anim " $ string(bPhysicsAnimUpdate));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("[WalkBob] " $ string(WalkBob) $ " / [WalkBobCamera] " $ string(WalkBobCamera));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    GetAxes(Rotation, AxisX, AxisY, AxisZ);
    Canvas.DrawText("[AxisX] " $ string(AxisX) $ " / [AxisY] " $ string(AxisY) $ "/ [AxisZ] " $ string(AxisZ));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("[BobTimeX] " $ string(bobTimeX) $ " / [BobTimeY] " $ string(bobTimeY) $ "/ [BobTimeZ] " $ string(bobTimeZ));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("[AppliedBob] " $ string(AppliedBob));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x5ec
    if(Controller == none)
    {
        Canvas.SetDrawColor(byte(255), 0, 0);
        Canvas.DrawText("NO CONTROLLER");
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
    }
    // End:0x6f9
    else
    {
        // End:0x6b6
        if(Controller.PlayerReplicationInfo != none)
        {
            Canvas.SetDrawColor(byte(255), 0, 0);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
            Canvas.DrawText("Owned by " $ Controller.PlayerReplicationInfo.PlayerName);
            YPos += YL;
            Canvas.SetPos(4.0, YPos);
        }
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
        Controller.DisplayDebug(Canvas, YL, YPos);
    }
    // End:0x75a
    if(Weapon == none)
    {
        Canvas.SetDrawColor(0, byte(255), 0);
        Canvas.DrawText("NO WEAPON");
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
    }
    // End:0x79d
    else
    {
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
        Weapon.DisplayDebug(Canvas, YL, YPos);
    }
}

simulated function Vector CalcDrawOffset(Inventory Inv)
{
    local Vector DrawOffset;

    // End:0x38
    if(Controller == none)
    {
        return Inv.PlayerViewOffset >> Rotation + BaseEyeHeight * vect(0.0, 0.0, 1.0);
    }
    DrawOffset = GetDetailOffset(0.90 / Weapon.DisplayFOV * float(100) * ModifiedPlayerViewOffset(Inv), GetViewRotation());
    // End:0x91
    if(!IsLocallyControlled())
    {
        DrawOffset.Z += BaseEyeHeight;
    }
    // End:0xd3
    else
    {
        DrawOffset.Z += EyeHeight;
        // End:0xc6
        if(bWeaponBob)
        {
            DrawOffset += WeaponBob(Inv.BobDamping);
        }
        DrawOffset += CameraShake();
    }
    return DrawOffset;
}

simulated function Vector CalcFPSpectatorDrawOffset(Vector VOffset, Rotator rRotation, Vector vBobOffset)
{
    local Vector DrawOffset;

    DrawOffset = GetDetailOffset(0.90 / float(60) * float(100) * VOffset, rRotation);
    DrawOffset.Z += EyeHeight;
    // End:0x55
    if(bWeaponBob)
    {
        DrawOffset += WeaponBob(0.960);
    }
    DrawOffset = DrawOffset + vBobOffset + CameraShake();
    return DrawOffset;
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
    shakevect = PC.ShakeOffset.X * X + PC.ShakeOffset.Y * Y + PC.ShakeOffset.Z * Z;
    return shakevect;
}

simulated function Vector ModifiedPlayerViewOffset(Inventory Inv)
{
    return Inv.PlayerViewOffset;
}

simulated function Vector WeaponBob(float BobDamping)
{
    local Vector WBob;

    WBob = BobDamping * WalkBob;
    WBob.Z = 0.450 + 0.550 * BobDamping * WalkBob.Z;
    WBob.Z += LandBob;
    WBob += WalkBobCamera;
    return WBob;
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
        // End:0x31
        else
        {
            MaxSpeed = CrouchedSpeed;
        }
    }
    // End:0x73
    else
    {
        // End:0x4e
        if(bIsProned == true)
        {
            MaxSpeed = PronedSpeed;
        }
        // End:0x73
        else
        {
            // End:0x68
            if(bIsAiming == true)
            {
                MaxSpeed = AimedGroundSpeed;
            }
            // End:0x73
            else
            {
                MaxSpeed = GroundSpeed;
            }
        }
    }
    return MaxSpeed;
}

function GetBobParam(out float Bob, out float BobCamera, out float fBobZ, out float fBobCameraZ)
{
    local float fSprintIntensity;

    // End:0x3a
    if(Weapon == none)
    {
        Bob = 0.0;
        BobCamera = 0.0;
        fBobZ = 0.40;
        fBobCameraZ = 0.40;
    }
    // End:0x2db
    else
    {
        // End:0x234
        if(!bIsSprinting)
        {
            // End:0xc5
            if(bIsCrouched)
            {
                Bob = Weapon.BaseParams.fBobWeapon_Ducked_Move;
                BobCamera = Weapon.BaseParams.fBobScreen_Ducked_Move;
                fBobZ = Weapon.BaseParams.fBobWeapon_ducked_move_y;
                fBobCameraZ = Weapon.BaseParams.fBobScreen_ducked_move_y;
            }
            // End:0x1a7
            else
            {
                // End:0x133
                if(bIsProned)
                {
                    Bob = 0.0;
                    BobCamera = Weapon.BaseParams.fBobScreen_Prone_Move;
                    fBobZ = Weapon.BaseParams.fBobScreen_Prone_Move;
                    fBobCameraZ = Weapon.BaseParams.fBobScreen_Prone_Move;
                }
                // End:0x1a7
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
        // End:0x2db
        else
        {
            Bob = Weapon.BaseParams.fBobWeapon_Sprint_Move;
            BobCamera = Weapon.BaseParams.fBobScreen_Sprint_Move;
            fBobZ = Weapon.BaseParams.fBobWeapon_sprint_y;
            fBobCameraZ = Weapon.BaseParams.fBobScreen_sprint_y;
            fSprintIntensity = FClamp(Controller.fSprintPassTime / 5.0, 0.0, 1.0);
            BobCamera *= fSprintIntensity;
        }
    }
}

function CheckBob(float DeltaTime, Vector Y)
{
    local float Speed2D, BobCamera, MaxSpeed, fRatioSpeed;
    local Rotator rotTemp;
    local bool bWeaponBobZ;
    local float fBobAdd, fBobZ, fBobCameraZ, fBobRot;

    fBobAdd = 1.0;
    fBobZ = 0.40;
    fBobCameraZ = 0.40;
    fBobRot = 150.0;
    // End:0x46
    if(float(0) < VSize(Velocity))
    {
        bWeaponBob = true;
    }
    // End:0x4e
    else
    {
        bWeaponBob = false;
    }
    // End:0xe6
    if(none == Weapon || !bWeaponBob || bWeaponBobZ)
    {
        bobtime = 0.0;
        WalkBob = vect(0.0, 0.0, 0.0);
        WalkBobCamera = vect(0.0, 0.0, 0.0);
        // End:0xe4
        if(wGun(Weapon) != none && bIsAiming)
        {
            wGun(Weapon).SetWalkingSwayRot(Normalize(rot(0, 0, 0)));
        }
        return;
    }
    GetBobParam(Bob, BobCamera, fBobZ, fBobCameraZ);
    // End:0x148
    if(!bIsProned && !bIsAiming && Bob == float(0))
    {
        Bob = default.Bob;
        // End:0x148
        if(!bIsSprinting)
        {
            Bob = 0.00050;
        }
    }
    Bob = FClamp(Bob, -0.010, 0.010);
    BobCamera = FClamp(BobCamera, -0.040, 0.040);
    // End:0x436
    if(Physics == 1)
    {
        Speed2D = VSize(Velocity);
        // End:0x1b7
        if(Speed2D < float(10))
        {
            bobtime += 0.20 * DeltaTime;
        }
        // End:0x1eb
        else
        {
            MaxSpeed = GetMaxSpeed();
            bobtime += DeltaTime * 0.30 + 0.70 * Speed2D / MaxSpeed;
        }
        WalkBob = Y * Bob * Speed2D * Sin(8.0 * bobtime);
        WalkBobCamera = Y * BobCamera * Speed2D * Sin(8.0 * bobtime);
        AppliedBob = AppliedBob * float(1) - FMin(1.0, 16.0 * DeltaTime);
        WalkBob.Z = AppliedBob;
        WalkBobCamera.Z = AppliedBob;
        fRatioSpeed = Speed2D / GetMaxSpeed();
        WalkBob.Z = Sqrt(Sin(8.0 * bobtime) * Sin(8.0 * bobtime)) * fBobZ * fRatioSpeed;
        // End:0x319
        if(Level.GetIsUseAdvCamShake())
        {
            WalkBobCamera.Z = Sqrt(Sin(8.0 * bobtime) * Sin(8.0 * bobtime)) * fBobCameraZ * fRatioSpeed;
        }
        rotTemp.Yaw = int(Sin(8.0 * bobtime) * fBobRot * fRatioSpeed);
        // End:0x3a6
        if(wGun(Weapon) != none)
        {
            // End:0x37f
            if(!bIsAiming)
            {
                wGun(Weapon).SetWalkingSwayRot(Normalize(rotTemp));
            }
            // End:0x3a6
            else
            {
                wGun(Weapon).SetWalkingSwayRot(Normalize(rot(0, 0, 0)));
            }
        }
        bobTimeZ = 0.0;
        // End:0x433
        if(Speed2D > float(10))
        {
            WalkBob.Z = WalkBob.Z + WalkZDamp * Bob * Speed2D * Sin(16.0 * bobtime);
            WalkBobCamera.Z = WalkBobCamera.Z + WalkZDamp * BobCamera * Speed2D * Sin(16.0 * bobtime);
        }
    }
    // End:0x53e
    else
    {
        // End:0x4e9
        if(Physics == 3)
        {
            bobtime += DeltaTime;
            Speed2D = Sqrt(Velocity.X * Velocity.X + Velocity.Y * Velocity.Y);
            WalkBob = Y * Bob * 0.50 * Speed2D * Sin(4.0 * bobtime);
            WalkBob.Z = Bob * 1.50 * Speed2D * Sin(8.0 * bobtime);
        }
        // End:0x53e
        else
        {
            bobtime = 0.0;
            WalkBob = WalkBob * float(1) - FMin(1.0, 8.0 * DeltaTime);
            WalkBobCamera = WalkBobCamera * float(1) - FMin(1.0, 8.0 * DeltaTime);
        }
    }
}

simulated function InitialPlayer();
// Export UPawn::execForceStandup(FFrame&, void* const)
native simulated function ForceStandup();
simulated event StartDriving(Vehicle V)
{
    local Controller VehicleController;

    ForceStandup();
    InitialPlayer();
    // End:0x26
    if(Role == 4)
    {
        ClientSetTurretingMode(true);
    }
    // End:0x3d
    else
    {
        // End:0x3d
        if(Role < 4)
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
    Velocity = vect(0.0, 0.0, 0.0);
    Acceleration = vect(0.0, 0.0, 0.0);
    bCanTeleport = false;
    // End:0x1be
    if(!V.bRemoteControlled || V.bHideRemoteDriver)
    {
        V.AttachDriver(self);
        // End:0x187
        if(V.bDrawDriverInTP)
        {
            CullDistance = 5000.0;
        }
        // End:0x1be
        else
        {
            // End:0x1ae
            if(V.IsA('wTurret_FNM240'))
            {
                bHidden = false;
                bNotDrawSelf = true;
            }
            // End:0x1be
            else
            {
                bHidden = true;
                bNotDrawSelf = false;
            }
        }
    }
    bWaitForAnim = false;
    // End:0x1e4
    if(Role == 4)
    {
        VehicleController = Controller;
    }
    // End:0x208
    else
    {
        // End:0x208
        if(Role < 4)
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
        // End:0x258
        else
        {
            bHidden = true;
            bNotDrawSelf = false;
        }
    }
}

simulated event StopDriving(Vehicle V)
{
    InitialPlayer();
    // End:0x4b
    if(Role == 4 && PlayerController(Controller) != none)
    {
        V.PlayerStartTime = Level.TimeSeconds + float(12);
    }
    CullDistance = default.CullDistance;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0xa8
    if(V != none && V.Weapon != none)
    {
        V.Weapon.ImmediateStopFire();
    }
    // End:0xba
    if(Physics == 13)
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
    if(Role == 4 && Health > 0)
    {
        // End:0x185
        if(!V.bRemoteControlled || V.bHideRemoteDriver)
        {
            Acceleration = vect(0.0, 0.0, 24000.0);
            // End:0x174
            if(PhysicsVolume.bWaterVolume)
            {
                SetPhysics(3);
            }
            // End:0x179
            else
            {
                SetPhysics(2);
            }
            SetBase(none);
            bHidden = false;
        }
    }
    bOwnerNoSee = default.bOwnerNoSee;
    // End:0x1c3
    if(Weapon != none)
    {
        PendingWeapon = none;
        Weapon.AttachToPawn(self);
        Weapon.BringUp();
    }
    // End:0x1dd
    if(Role == 4)
    {
        ClientSetTurretingMode(false);
    }
    // End:0x1fc
    else
    {
        // End:0x1fc
        if(Role < 4)
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
}

simulated function bool FindValidTaunt(out name Sequence)
{
    return true;
}

simulated function bool CheckTauntValid(name Sequence)
{
    return FindValidTaunt(Sequence);
}

simulated function bool IsPlayerPawn()
{
    return Controller != none && Controller.bIsPlayer;
}

simulated function bool WasPlayerPawn()
{
    return false;
}

simulated function bool IsHumanControlled()
{
    return PlayerController(Controller) != none;
}

simulated function bool IsLocallyControlled()
{
    // End:0x1b
    if(Level.NetMode == 0)
    {
        return true;
    }
    // End:0x28
    if(Controller == none)
    {
        return false;
    }
    // End:0x3a
    if(PlayerController(Controller) == none)
    {
        return true;
    }
    return Viewport(PlayerController(Controller).Player) != none;
}

simulated function bool IsFirstPerson()
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    return PC != none && !PC.bBehindView && Viewport(PC.Player) != none;
}

simulated function bool IsLocalPlayerViewtarget()
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    return PC.ViewTarget == self;
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
    // End:0x14d
    if(PC != none)
    {
        rReturn = Controller.GetViewRotation() + PC.ShakeRot + PC.wShakeRot + PC.wShockRot;
        // End:0x144
        if(Weapon != none && Weapon.IsA('wGun'))
        {
            // End:0x10a
            if(wGun(Weapon).AimState == 2 && Weapon.GetFireMode(1) != none && Weapon.GetFireMode(1).IsA('wZoomFire3D'))
            {
                rReturn = rReturn + PC.wBreathRot;
            }
            // End:0x144
            if(wGun(Weapon).AimState == 2)
            {
                rReturn = rReturn + PC.wAttackedRot;
            }
        }
        return rReturn;
    }
    // End:0x15d
    else
    {
        return Controller.GetViewRotation();
    }
}

simulated function Rotator GetViewRotationForFP()
{
    return Controller.GetViewRotation();
}

simulated function SetViewRotation(Rotator NewRotation)
{
    // End:0x1c
    if(Controller != none)
    {
        Controller.SetRotation(NewRotation);
    }
}

final function bool InGodMode()
{
    return Controller != none && Controller.bGodMode;
}

function bool NearMoveTarget()
{
    // End:0x23
    if(Controller == none || Controller.MoveTarget == none)
    {
        return false;
    }
    return ReachedDestination(Controller.MoveTarget);
}

final simulated function bool PressingFire()
{
    return Controller != none && Controller.bFire != 0;
}

final simulated function bool PressingAltFire()
{
    return Controller != none && Controller.bAltFire != 0;
}

function Actor GetMoveTarget()
{
    // End:0x0d
    if(Controller == none)
    {
        return none;
    }
    return Controller.MoveTarget;
}

function SetMoveTarget(Actor NewTarget)
{
    // End:0x1f
    if(Controller != none)
    {
        Controller.MoveTarget = NewTarget;
    }
}

function bool LineOfSightTo(Actor Other)
{
    return Controller != none && Controller.LineOfSightTo(Other);
}

final simulated function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    // End:0x11
    if(Controller == none)
    {
        return Rotation;
    }
    return Controller.AdjustAim(FiredAmmunition, projStart, AimError);
}

function Actor ShootSpecial(Actor A)
{
    // End:0x23
    if(!Controller.bCanDoSpecial || Weapon == none)
    {
        return none;
    }
    SetRotation(rotator(A.Location - Location));
    Controller.Focus = A;
    Controller.FireWeaponAt(A);
    return A;
}

function float AdjustedStrength()
{
    return 0.0;
}

function HandlePickup(Pickup pick)
{
    MakeNoise(0.20);
    // End:0x27
    if(Controller != none)
    {
        Controller.HandlePickup(pick);
    }
}

function ReceiveLocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x3d
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
}

event ClientMessage(coerce string S, optional name Type)
{
    // End:0x2e
    if(PlayerController(Controller) != none)
    {
        PlayerController(Controller).ClientMessage(S, Type);
    }
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x24
    if(Controller != none)
    {
        Controller.Trigger(Other, EventInstigator);
    }
}

function bool CanTrigger(Trigger t)
{
    return true;
}

function Inventory CreateInventory(string InventoryClassName)
{
    return none;
}

function GiveWeapon(string aClassName)
{
    local class<wWeapon> WeaponClass;
    local wWeapon newWeapon;

    WeaponClass = class<wWeapon>(DynamicLoadObject(aClassName, class'Class'));
    // End:0x2e
    if(FindInventoryType(WeaponClass) != none)
    {
        return;
    }
    newWeapon = Spawn(WeaponClass);
    // End:0x57
    if(newWeapon != none)
    {
        newWeapon.GiveTo(self);
    }
}

function SetDisplayProperties(Actor.ERenderStyle NewStyle, Material NewTexture, bool bLighting)
{
    Style = NewStyle;
    Texture = NewTexture;
    bUnlit = bLighting;
    // End:0x4d
    if(Weapon != none)
    {
        Weapon.SetDisplayProperties(Style, Texture, bUnlit);
    }
    // End:0x7c
    if(!bUpdatingDisplay && Inventory != none)
    {
        bUpdatingDisplay = true;
        Inventory.SetOwnerDisplay();
    }
    bUpdatingDisplay = false;
}

function SetDefaultDisplayProperties()
{
    Style = default.Style;
    Texture = default.Texture;
    bUnlit = default.bUnlit;
    // End:0x3d
    if(Weapon != none)
    {
        Weapon.SetDefaultDisplayProperties();
    }
    // End:0x6c
    if(!bUpdatingDisplay && Inventory != none)
    {
        bUpdatingDisplay = true;
        Inventory.SetOwnerDisplay();
    }
    bUpdatingDisplay = false;
}

function FinishedInterpolation()
{
    DropToGround();
}

function JumpOutOfWater(Vector jumpDir)
{
    Falling();
    Velocity = jumpDir * WaterSpeed;
    Acceleration = jumpDir * AccelRate;
    Velocity.Z = FMax(380.0, JumpZ);
    bUpAndOut = true;
}

simulated event ModifyVelocity(float DeltaTime, Vector OldVelocity);
event FellOutOfWorld(Actor.eKillZType KillType)
{
    // End:0x1b
    if(Level.NetMode == 3)
    {
        return;
    }
    // End:0x3c
    if(Controller != none && Controller.AvoidCertainDeath())
    {
        return;
    }
    Health = -1;
    // End:0x6b
    if(KillType == 1)
    {
        Died(none, class'FellLava', Location);
    }
    // End:0xb5
    else
    {
        // End:0x8f
        if(KillType == 2)
        {
            Died(none, class'fell', Location);
        }
        // End:0xb5
        else
        {
            // End:0xa4
            if(Physics != 13)
            {
                SetPhysics(0);
            }
            Died(none, class'fell', Location);
        }
    }
}

function ShouldCrouch(bool crouch)
{
    // End:0x1e
    if(bWantsToCrouch != crouch)
    {
        bWantsToCrouch = crouch;
    }
}

function ShouldProne(bool Prone)
{
    // End:0x1e
    if(bWantsToProne != Prone)
    {
        bWantsToProne = Prone;
    }
}

simulated function ServerSetUseKeyState(byte byKey)
{
    byUseKey = byKey;
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
        PlayerController(Controller).fStandingTimeCount = 0.0;
    }
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
        PlayerController(Controller).fCrouchingTimeCount = 0.0;
        PlayerController(Controller).fStandingTimeCount = 0.0;
    }
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
        PlayerController(Controller).fCrouchingTimeCount = 0.0;
    }
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
        PlayerController(Controller).fProningTimeCount = 0.0;
    }
}

function RestartPlayer();
function AddVelocity(Vector NewVelocity)
{
    // End:0x24
    if(bIgnoreForces || NewVelocity == vect(0.0, 0.0, 0.0))
    {
        return;
    }
    // End:0x52
    if(Physics == 2 && AIController(Controller) != none)
    {
        ImpactVelocity += NewVelocity;
    }
    // End:0xa1
    if(Physics == 1 || Physics == 11 || Physics == 9 && NewVelocity.Z > default.JumpZ)
    {
        SetPhysics(2);
    }
    // End:0xdc
    if(Velocity.Z > float(380) && NewVelocity.Z > float(0))
    {
        NewVelocity.Z *= 0.50;
    }
    Velocity += NewVelocity;
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
    Died(Killer, class'Suicided', Location);
}

function TakeFallingDamage()
{
    local float Shake, EffectiveSpeed;

    // End:0x128
    if(Velocity.Z < -0.50 * MaxFallSpeed)
    {
        // End:0xdf
        if(Role == 4)
        {
            MakeNoise(1.0);
            // End:0xdf
            if(Velocity.Z < float(-1) * MaxFallSpeed)
            {
                EffectiveSpeed = Velocity.Z;
                // End:0x81
                if(TouchingWaterVolume())
                {
                    EffectiveSpeed = FMin(0.0, EffectiveSpeed + float(100));
                }
                // End:0xdf
                if(EffectiveSpeed < float(-1) * MaxFallSpeed)
                {
                    TakeDamage(int(FClamp(-100.0 * EffectiveSpeed + MaxFallSpeed / MaxFallSpeed, 0.0, 20.0)), none, Location, vect(0.0, 0.0, 0.0), class'fell');
                }
            }
        }
        // End:0x125
        if(Controller != none)
        {
            Shake = FMin(1.0, -1.0 * Velocity.Z / MaxFallSpeed);
            Controller.DamageShake(int(Shake));
        }
    }
    // End:0x14b
    else
    {
        // End:0x14b
        if(Velocity.Z < -1.40 * JumpZ)
        {
            MakeNoise(0.50);
        }
    }
}

function ClientReStart()
{
    Velocity = vect(0.0, 0.0, 0.0);
    Acceleration = vect(0.0, 0.0, 0.0);
    BaseEyeHeight = default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
    PlayWaiting();
}

function ClientSetLocation(Vector NewLocation, Rotator NewRotation)
{
    // End:0x24
    if(Controller != none)
    {
        Controller.ClientSetLocation(NewLocation, NewRotation);
    }
}

function ClientSetRotation(Rotator NewRotation)
{
    // End:0x1f
    if(Controller != none)
    {
        Controller.ClientSetRotation(NewRotation);
    }
}

simulated function FaceRotation(Rotator NewRotation, float DeltaTime)
{
    // End:0x2b
    if(Physics == 11)
    {
        NewRotation.Pitch = 0;
        NewRotation.Roll = 0;
    }
    // End:0x59
    else
    {
        // End:0x59
        if(Physics == 1 || Physics == 2)
        {
            NewRotation.Pitch = 0;
        }
    }
    SetRotation(NewRotation);
}

function int LimitPitch(int Pitch)
{
    Pitch = Pitch & 65535;
    // End:0x68
    if(Pitch > PitchUpLimit && Pitch < PitchDownLimit)
    {
        // End:0x5d
        if(Pitch - PitchUpLimit < PitchDownLimit - Pitch)
        {
            Pitch = PitchUpLimit;
        }
        // End:0x68
        else
        {
            Pitch = PitchDownLimit;
        }
    }
    return Pitch;
}

function ClientDying(class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x24
    if(Controller != none)
    {
        Controller.ClientDying(DamageType, HitLocation);
    }
}

function DoComboName(string ComboClassName);
function bool InCurrentCombo()
{
    return false;
}

function EnableUDamage(float Amount);
function DisableUDamage();
function float GetShieldStrengthMax();
function float GetShieldStrength();
function bool AddShieldStrength(int Amount);
function int CanUseShield(int Amount);
simulated function bool CanThrowWeapon()
{
    return Weapon != none && Weapon.CanThrow() && Level.Game.bAllowWeaponThrowing;
}

function TossWeapon(Vector TossVel)
{
    local Rotator rToss;

    Weapon.Velocity = TossVel;
    rToss = Rotation;
    rToss.Roll = 16384;
    Weapon.DropFrom(Location, rToss);
}

function CheckTouchWeaponPickup()
{
    local wWeaponPickup WPick;

    // End:0x1705
    foreach TouchingActors(class'wWeaponPickup', WPick)
    {
        )
        kPendingWPick = WPick;
        WPick.AddTouchingPawn(self);        
    }
    return;        
    kPendingWPick = none;
    return;
}

function CheckEntryVehicle()
{
    local Vehicle V;
    local int lp1;

    EntryVehicle = none;
    // End:0xd0
    if(Physics == 1)
    {
        lp1 = 0;
        J0x1e:
        // End:0xd0 [While If]
        if(lp1 < Level.Vehicles.Length)
        {
            V = Level.Vehicles[lp1];
            // End:0xc6
            if(V != none && VSize(Location - V.Location) < float(200) && Level.FastTrace(Location, V.Location))
            {
                EntryVehicle = V.FindEntryVehicle(self);
                // End:0xc6
                if(EntryVehicle != none)
                {
                }
                // End:0xd0
                else
                {
                }
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x1e;
            }
        }
    }
}

function ServerPickupWeapon()
{
    // End:0x0d
    if(kPendingWPick == none)
    {
        return;
    }
    kPendingWPick.PickWeapon(self);
}

simulated function ClientPickupWeapon()
{
    local PlayerController PC;

    // End:0x0d
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
}

exec function SwitchToLastWeapon()
{
    // End:0x1cb
    if(Weapon != none)
    {
        // End:0x7a
        if(Weapon.OldWeapon != none && Weapon.OldWeapon.HasAmmo())
        {
            PendingWeapon = Weapon.OldWeapon;
            // End:0x77
            if(Weapon.PutDown())
            {
                ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);
            }
        }
        // End:0x1cb
        else
        {
            // End:0x1cb
            if(Weapon.IsA('wDemopack') && Weapon.OldWeapon == none || Weapon.OldWeapon.IsA('wDemopack'))
            {
                Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(1);
                // End:0x121
                if(Weapon.OldWeapon == none)
                {
                    Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(2);
                }
                // End:0x190
                if(Level.GetMatchMaker().3 == Level.GetMatchMaker().eWeaponLimit)
                {
                    // End:0x190
                    if(Weapon.OldWeapon == none)
                    {
                        Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(3);
                    }
                }
                PendingWeapon = Weapon.OldWeapon;
                // End:0x1cb
                if(Weapon.PutDown())
                {
                    ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);
                }
            }
        }
    }
}

simulated function SwitchToLastWeapon_ThrowsWeapon()
{
    // End:0x17e
    if(Weapon != none)
    {
        // End:0x8b
        if(Weapon.OldWeapon != none && Weapon.OldWeapon.HasAmmo())
        {
            PendingWeapon = Weapon.OldWeapon;
            // End:0x88
            if(Weapon.PutDown())
            {
                ServerThrowsWeaponAnim(Weapon.bQuickDropAnim);
                Weapon.byActionThrowsWeapon = 2;
            }
        }
        // End:0x17e
        else
        {
            // End:0x17e
            if(Weapon.IsA('wDemopack') && Weapon.OldWeapon == none || Weapon.OldWeapon.IsA('wDemopack'))
            {
                Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(1);
                // End:0x132
                if(Weapon.OldWeapon == none)
                {
                    Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(2);
                }
                PendingWeapon = Weapon.OldWeapon;
                // End:0x17e
                if(Weapon.PutDown())
                {
                    ServerThrowsWeaponAnim(Weapon.bQuickDropAnim);
                    Weapon.byActionThrowsWeapon = 2;
                }
            }
        }
    }
}

simulated function PrevWeapon()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x3f
    if(Weapon == none && Controller != none)
    {
        Controller.SwitchToBestWeapon();
        return;
    }
    // End:0x7c
    if(PendingWeapon != none)
    {
        // End:0x5e
        if(PendingWeapon.bForceSwitch)
        {
            return;
        }
        PendingWeapon = Inventory.PrevWeapon(none, PendingWeapon);
    }
    // End:0x97
    else
    {
        PendingWeapon = Inventory.PrevWeapon(none, Weapon);
    }
    // End:0xb1
    if(PendingWeapon != none)
    {
        Weapon.PutDown();
    }
}

simulated function NextWeapon()
{
    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    // End:0x3f
    if(Weapon == none && Controller != none)
    {
        Controller.SwitchToBestWeapon();
        return;
    }
    // End:0x7c
    if(PendingWeapon != none)
    {
        // End:0x5e
        if(PendingWeapon.bForceSwitch)
        {
            return;
        }
        PendingWeapon = Inventory.NextWeapon(none, PendingWeapon);
    }
    // End:0x97
    else
    {
        PendingWeapon = Inventory.NextWeapon(none, Weapon);
    }
    // End:0xb1
    if(PendingWeapon != none)
    {
        Weapon.PutDown();
    }
}

simulated function SelectPrevWeapon()
{
    // End:0x0d
    if(Weapon == none)
    {
        return;
    }
    // End:0xbe
    if(Weapon.OldWeapon == none || Weapon.OldWeapon.WeaponType == 10 && Controller.IsA('PlayerController'))
    {
        // End:0x99
        if(Weapon.InventoryGroup == 1)
        {
            Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(2);
        }
        // End:0xbe
        else
        {
            Weapon.OldWeapon = PlayerController(Controller).GetWeaponByInventoryGroup(1);
        }
    }
    // End:0xef
    if(Weapon.OldWeapon != none)
    {
        SwitchWeapon(Weapon.OldWeapon.InventoryGroup);
    }
}

simulated function bool SwitchWeapon(byte f, optional bool bQuickGr)
{
    local wWeapon newWeapon;
    local wMatchMaker kMM;

    // End:0x23
    if(Level.Pauser != none || Inventory == none)
    {
        return false;
    }
    // End:0x9f
    if(Weapon != none && Weapon.Inventory != none)
    {
        // End:0x78
        if(f == 250)
        {
            newWeapon = Weapon.Inventory.WeaponChangeWClass('wDemopack');
        }
        // End:0x9c
        else
        {
            newWeapon = Weapon.Inventory.WeaponChange(f, false);
        }
    }
    // End:0xa6
    else
    {
        newWeapon = none;
    }
    // End:0xf7
    if(newWeapon == none)
    {
        // End:0xdc
        if(f == 250)
        {
            newWeapon = Inventory.WeaponChangeWClass('wDemopack');
        }
        // End:0xf7
        else
        {
            newWeapon = Inventory.WeaponChange(f, true);
        }
    }
    // End:0x12b
    if(newWeapon == none)
    {
        switch(f)
        {
            // End:0x10e
            case 3:
            // End:0x113
            case 4:
            // End:0x126
            case 5:
                AddNoWeaponChangeMessage(f);
                // End:0x129
                break;
            // End:0xffff
            default:
                return false;
            }
    }
    kMM = Level.GetMatchMaker();
    // End:0x1f9
    if(kMM.eWeaponLimit != kMM.0)
    {
        // End:0x1f9
        if(!Controller.IsPermitSpecialMode(true, newWeapon.InventoryGroup, newWeapon.WeaponType, f))
        {
            // End:0x1f7
            if(PlayerController(Controller) != none && kMM.eWeaponLimit == kMM.5)
            {
                PlayerController(Controller).ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', class'wMessage_Game_ImpSystem'.default.Code_HoldWeapon);
            }
            return false;
        }
    }
    // End:0x252
    if(newWeapon.WeaponType == 15)
    {
        // End:0x24f
        if(self.Controller.IsActiveHelicopter() == true)
        {
            PlayerController(Controller).myHUD.CallSkill(6, true, false);
            return true;
        }
    }
    // End:0x2a8
    else
    {
        // End:0x2a8
        if(newWeapon.WeaponType == 14)
        {
            // End:0x2a8
            if(self.Controller.IsActiveAirFire() == true)
            {
                PlayerController(Controller).myHUD.CallSkill(6, true, false);
                return true;
            }
        }
    }
    // End:0x2c9
    if(PendingWeapon != none && PendingWeapon.bForceSwitch)
    {
        return false;
    }
    // End:0x2fc
    if(bQuickGr == true && newWeapon.IsA('wThrowingWeapon'))
    {
        newWeapon.bQuickThrow = true;
    }
    // End:0x31b
    if(Weapon == none)
    {
        PendingWeapon = newWeapon;
        ChangedWeapon();
    }
    // End:0x38f
    else
    {
        // End:0x371
        if(Weapon != newWeapon || PendingWeapon != none)
        {
            PendingWeapon = newWeapon;
            // End:0x359
            if(false == Weapon.PutDown())
            {
                return false;
            }
            ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);
        }
        // End:0x38f
        else
        {
            // End:0x38f
            if(Weapon == newWeapon)
            {
                Weapon.Reselect();
            }
        }
    }
    Weapon.wt_index = 0;
    return true;
}

simulated function bool SwitchWeaponByWeaponItem(wWeapon wSwitchWeapon, optional bool bQuickGr)
{
    local wWeapon newWeapon;

    // End:0x0d
    if(wSwitchWeapon == none)
    {
        return false;
    }
    newWeapon = wSwitchWeapon;
    // End:0x39
    if(PendingWeapon != none && PendingWeapon.bForceSwitch)
    {
        return false;
    }
    // End:0x6c
    if(bQuickGr == true && newWeapon.IsA('wThrowingWeapon'))
    {
        newWeapon.bQuickThrow = true;
    }
    // End:0x8b
    if(Weapon == none)
    {
        PendingWeapon = newWeapon;
        ChangedWeapon();
    }
    // End:0xff
    else
    {
        // End:0xe1
        if(Weapon != newWeapon || PendingWeapon != none)
        {
            PendingWeapon = newWeapon;
            // End:0xc9
            if(false == Weapon.PutDown())
            {
                return false;
            }
            ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);
        }
        // End:0xff
        else
        {
            // End:0xff
            if(Weapon == newWeapon)
            {
                Weapon.Reselect();
            }
        }
    }
    return true;
}

simulated function SwitchWeaponWClass(name ClassName, optional string sReason)
{
    local wWeapon newWeapon;

    // End:0x23
    if(Level.Pauser != none || Inventory == none)
    {
        return;
    }
    // End:0x6a
    if(Weapon != none && Weapon.Inventory != none)
    {
        newWeapon = Weapon.Inventory.WeaponChangeWClass(ClassName);
    }
    // End:0x71
    else
    {
        newWeapon = none;
    }
    // End:0x96
    if(newWeapon == none)
    {
        newWeapon = Inventory.WeaponChangeWClass(ClassName);
    }
    // End:0xa3
    if(newWeapon == none)
    {
        return;
    }
    // End:0xc4
    if(PendingWeapon != none && PendingWeapon.bForceSwitch)
    {
        return;
    }
    // End:0xfb
    if(sReason ~= "ThrowsTheWeapon")
    {
        // End:0xfb
        if(newWeapon != none)
        {
            newWeapon.byActionThrowsWeapon = 1;
        }
    }
    // End:0x11a
    if(Weapon == none)
    {
        PendingWeapon = newWeapon;
        ChangedWeapon();
    }
    // End:0x186
    else
    {
        // End:0x168
        if(Weapon != newWeapon || PendingWeapon != none)
        {
            PendingWeapon = newWeapon;
            Weapon.PutDown();
            ServerPlayPutdownWeaponAnim(Weapon.bQuickDropAnim);
        }
        // End:0x186
        else
        {
            // End:0x186
            if(Weapon == newWeapon)
            {
                Weapon.Reselect();
            }
        }
    }
}

function ServerNoTranslocator()
{
    // End:0x36
    if(Level.Game != none)
    {
        Level.Game.NoTranslocatorKeyPressed(PlayerController(Controller));
    }
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
    // End:0x6c
    else
    {
        SelectedItem = Inventory.SelectNext();
    }
    // End:0x8c
    if(SelectedItem == none)
    {
        SelectedItem = Inventory.SelectNext();
    }
}

function Inventory FindInventoryType(Class DesiredClass)
{
    local Inventory Inv;
    local int Count;

    Inv = Inventory;
    J0x0b:
    // End:0x63 [While If]
    if(Inv != none && Count < 1000)
    {
        // End:0x45
        if(Inv.Class == DesiredClass)
        {
            return Inv;
        }
        ++ Count;
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    Count = 0;
    Inv = Inventory;
    J0x75:
    // End:0xce [While If]
    if(Inv != none && Count < 1000)
    {
        // End:0xb0
        if(ClassIsChildOf(Inv.Class, DesiredClass))
        {
            return Inv;
        }
        ++ Count;
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x75;
    }
    return none;
}

function bool AddInventory(Inventory NewItem)
{
    local Inventory Inv;
    local Actor Last, Prev;
    local bool bAddedInOrder;

    Last = self;
    // End:0x3a
    if(NewItem == none)
    {
        Log("tried to add none inventory to " $ string(self));
    }
    NewItem.SetOwner(self);
    NewItem.NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x11f
    if(wWeapon(NewItem) != none)
    {
        Prev = self;
        Inv = Inventory;
        J0x8b:
        // End:0xc3 [While If]
        if(Inv != none)
        {
            // End:0xac
            if(!bAddedInOrder)
            {
                Prev = Inv;
            }
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x8b;
        }
        // End:0x11f
        if(bAddedInOrder)
        {
            NewItem.Inventory = Prev.Inventory;
            Prev.Inventory = NewItem;
            Prev.NetUpdateTime = Level.TimeSeconds - float(1);
        }
    }
    // End:0x1b9
    if(!bAddedInOrder)
    {
        Inv = Inventory;
        J0x135:
        // End:0x173 [While If]
        if(Inv != none)
        {
            // End:0x151
            if(Inv == NewItem)
            {
                return false;
            }
            Last = Inv;
            Inv = Inv.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x135;
        }
        NewItem.Inventory = none;
        Last.Inventory = NewItem;
        Last.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    // End:0x1d8
    if(Controller != none)
    {
        Controller.NotifyAddInventory(NewItem);
    }
    return true;
}

function DeleteInventoriesFromStorage()
{
    local Inventory Item;

    Item = Inventory;
    J0x0b:
    // End:0x38 [While If]
    if(Item != none)
    {
        DeleteInventoryFromStorage(Item);
        Item = Item.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
}

function DeleteInventoryFromStorage(Inventory Item)
{
    local PlayerController PC;
    local string sWeapon;

    PC = PlayerController(Controller);
    // End:0x2b
    if(PC == none)
    {
        PC = PlayerController(Owner);
    }
    // End:0x11f
    if(PC != none && PC.GSSS != none)
    {
        // End:0x7b
        if(UnresolvedNativeFunction_99(Item.InventoryUniqueNumber, 0))
        {
            sWeapon = UnresolvedNativeFunction_99(Item.InventoryUniqueNumber);
        }
        // End:0xb0
        else
        {
            sWeapon = Level.WeaponMgr.GetBaseParam(Item.InventoryClassNumber).strName;
        }
        PC.GSSS.DeleteFromStorage_Weapon(sWeapon);
        Log("DeleteFromStorage - Weapon=" $ sWeapon $ " owner name=" $ PC.PlayerReplicationInfo.PlayerName);
    }
    // End:0x163
    else
    {
        Log("DeleteFromStorage is skipped owner=" $ string(Owner) $ " ctrlr=" $ string(Controller));
    }
}

function DeleteInventory(Inventory Item)
{
    local Actor Link;
    local int Count;

    Log("Pawn::DeleteInventory() Name:" $ LoginName $ "  Item:" $ Item.InventoryClassName);
    // End:0x59
    if(Item == Weapon)
    {
        Weapon = none;
    }
    // End:0x6f
    if(Item == SelectedItem)
    {
        SelectedItem = none;
    }
    Link = self;
    J0x76:
    // End:0x156 [While If]
    if(Link != none)
    {
        // End:0x10d
        if(Link.Inventory == Item)
        {
            Link.Inventory = Item.Inventory;
            Item.Inventory = none;
            Link.NetUpdateTime = Level.TimeSeconds - float(1);
            Item.NetUpdateTime = Level.TimeSeconds - float(1);
        }
        // End:0x156
        else
        {
            // End:0x13f
            if(Level.NetMode == 3)
            {
                ++ Count;
                // End:0x13f
                if(Count > 1000)
                {
                }
                // End:0x156
                else
                {
                }
                Link = Link.Inventory;
                // This is an implied JumpToken; Continue!
                goto J0x76;
            }
        }
    }
    Item.SetOwner(none);
    DeleteInventoryFromStorage(Item);
    // End:0x192
    if(Item.IsA('wWeapon'))
    {
        SetRemoveWeaponSkill(wWeapon(Item));
    }
    // End:0x1d5
    if(wWeapon(Item) != none && wWeapon(Item).InventoryGroup == 5)
    {
        PlayerController(Controller).ClientChangeSlot5(none);
    }
}

simulated function ClientForceChangedWeapon(wWeapon newWeapon)
{
    PendingWeapon = newWeapon;
    ChangedWeapon();
}

simulated function ChangedWeapon()
{
    local wWeapon OldWeapon;

    // End:0x1a
    if(Weapon != none)
    {
        Weapon.StopAnimating();
    }
    ServerChangedWeapon(Weapon, PendingWeapon);
    // End:0x90
    if(Role < 4)
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
}

function name GetOffhandBoneFor(Inventory i)
{
    return 'None';
}

function name GetWeaponBoneFor(Inventory i)
{
    return 'righthand';
}

function ServerChangedWeapon(wWeapon OldWeapon, wWeapon newWeapon)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x116
    if(PC != none && PC.GSSS != none)
    {
        // End:0xae
        if(!OldWeapon.IsA('wMeleeWeapon') && newWeapon.IsA('wMeleeWeapon'))
        {
            Log(string(self) $ " !OldWeapon.IsA( 'wMeleeWeapon' ) && NewWeapon.IsA( 'wMeleeWeapon' ) ");
        }
        // End:0x116
        else
        {
            PC.GSSS.SetToStorage_CurrentWeapon(newWeapon.BaseParams.iWeaponID);
            Log(string(self) $ " OldWeapon : " $ string(OldWeapon) $ " / NewWeapon:" $ string(newWeapon));
        }
    }
    Weapon = newWeapon;
    TypeOfWeapon = newWeapon.WeaponType;
    // End:0x14f
    if(Controller != none)
    {
        Controller.ChangedWeapon();
    }
    PendingWeapon = none;
    // End:0x1f4
    if(OldWeapon != none)
    {
        // End:0x1b1
        if(PC != none && PC.GSSS != none)
        {
            PC.GSSS.SetToStorage_OldWeapon(OldWeapon.BaseParams.iWeaponID);
        }
        OldWeapon.SetDefaultDisplayProperties();
        OldWeapon.DetachFromPawn(self);
        OldWeapon.GotoState('Hidden');
        OldWeapon.NetUpdateFrequency = 2.0;
    }
    // End:0x284
    if(Controller != none && Weapon != none)
    {
        Weapon.NetUpdateFrequency = 2.0;
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
    // End:0x2b5
    if(Weapon != none)
    {
        PlayerReplicationInfo.iCurrentWeaponID = Weapon.BaseParams.iWeaponID;
    }
    // End:0x2d4
    if(Inventory != none)
    {
        Inventory.OwnerEvent('ChangedWeapon');
    }
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
    // End:0x16e
    if(Level.NetMode == 1)
    {
        // End:0x51
        if(Physics == 2)
        {
            PlayAnim(AirAnims[0], 1.0, 0.0);
        }
        // End:0x163
        else
        {
            // End:0x13f
            if(Physics == 1)
            {
                // End:0xa4
                if(bIsCrouched)
                {
                    // End:0x8f
                    if(TypeOfWeapon == 4)
                    {
                        PlayAnim(Pistol_IdleCrouchAnim, 1.0, 0.0);
                    }
                    // End:0xa1
                    else
                    {
                        PlayAnim(IdleCrouchAnim, 1.0, 0.0);
                    }
                }
                // End:0xd4
                else
                {
                    // End:0xc2
                    if(bIsProned)
                    {
                        PlayAnim(IdleProneAnim, 1.0, 0.0);
                    }
                    // End:0xd4
                    else
                    {
                        PlayAnim(IdleWeaponAnim, 1.0, 0.0);
                    }
                }
                // End:0x13c
                if(bDoTorsoTwist)
                {
                    SmoothViewYaw = Rotation.Yaw;
                    SmoothViewPitch = ViewPitch;
                    look = 256 * ViewPitch & 65535;
                    // End:0x130
                    if(look > 32768)
                    {
                        look -= 65536;
                    }
                    SetTwistLook(0, look);
                }
            }
            // End:0x163
            else
            {
                // End:0x163
                if(Physics == 3)
                {
                    PlayAnim(SwimAnims[0], 1.0, 0.0);
                }
            }
        }
        SetAnimFrame(0.50);
    }
    C = GetBoneCoords(HeadBone);
    HeadLoc = C.Origin + HeadHeight * HeadScale * AdditionalScale * C.XAxis;
    B = loc;
    M = ray * 2.0 * CollisionHeight + 2.0 * CollisionRadius;
    diff = HeadLoc - B;
    t = M Dot diff;
    // End:0x27c
    if(t > float(0))
    {
        DotMM = M Dot M;
        // End:0x262
        if(t < DotMM)
        {
            t = t / DotMM;
            diff = diff - t * M;
        }
        // End:0x279
        else
        {
            t = 1.0;
            diff -= M;
        }
    }
    // End:0x287
    else
    {
        t = 0.0;
    }
    Distance = Sqrt(diff Dot diff);
    return Distance < HeadRadius * HeadScale * AdditionalScale;
}

event bool EncroachingOn(Actor Other)
{
    // End:0x28
    if(Other.bWorldGeometry || Other.bBlocksTeleport)
    {
        return true;
    }
    // End:0x5d
    if(Vehicle(Other) != none && Weapon != none && Weapon.IsA('Translauncher'))
    {
        return true;
    }
    // End:0x9d
    if(Controller == none || !Controller.bIsPlayer || bWarping && Pawn(Other) != none)
    {
        return true;
    }
    return false;
}

event EncroachedBy(Actor Other);
function gibbedBy(Actor Other)
{
    // End:0x12
    if(Role < 4)
    {
        return;
    }
    // End:0x48
    if(Pawn(Other) != none)
    {
        Died(Pawn(Other).Controller, class'DamTypeTelefragged', Location);
    }
    // End:0x59
    else
    {
        Died(none, class'Gibbed', Location);
    }
}

function JumpOffPawn()
{
    Velocity += float(100) + CollisionRadius * VRand();
    Velocity.Z = 200.0 + CollisionHeight;
    SetPhysics(2);
    bNoJumpAdjust = true;
    // End:0x54
    if(Controller != none)
    {
        Controller.SetFall();
    }
}

singular event BaseChange()
{
    local float decorMass;
    local int footdamage;

    // End:0x0b
    if(bInterpolating)
    {
        return;
    }
    // End:0x30
    if(Base == none && Physics == 0)
    {
        SetPhysics(2);
    }
    // End:0x140
    else
    {
        // End:0xa6
        if(Pawn(Base) != none && Base != DrivenVehicle)
        {
            // End:0xa3
            if(!Pawn(Base).bCanBeBaseForPawns)
            {
                footdamage = 100;
                Base.TakeDamage(footdamage, self, Location, 0.50 * Velocity, class'wDamageStepOn');
                JumpOffPawn();
            }
        }
        // End:0x140
        else
        {
            // End:0x140
            if(Decoration(Base) != none && Velocity.Z < float(-400))
            {
                decorMass = FMax(Decoration(Base).Mass, 1.0);
                Base.TakeDamage(int(float(-2) * Mass / decorMass * Velocity.Z / float(400)), self, Location, 0.50 * Velocity, class'Crushed');
            }
        }
    }
}

// Export UPawn::execUpdateEyeHeightNative(FFrame&, void* const)
native function UpdateEyeHeightNative(float DeltaTime);
event UpdateEyeHeight(float DeltaTime)
{
    UpdateEyeHeightScript(DeltaTime);
}

function UpdateEyeHeightScript(float DeltaTime)
{
    local float smooth, MaxEyeHeight, OldEyeHeight;
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    // End:0x18
    if(Controller == none)
    {
        EyeHeight = 0.0;
        return;
    }
    // End:0x3e
    if(Level.NetMode == 1)
    {
        EyeHeight = BaseEyeHeight;
        return;
    }
    // End:0x5c
    if(bTearOff)
    {
        EyeHeight = default.BaseEyeHeight;
        bUpdateEyeheight = false;
        return;
    }
    HitActor = Trace(HitLocation, HitNormal, Location + CollisionHeight + 35.0 + float(14) * vect(0.0, 0.0, 1.0), Location + CollisionHeight * vect(0.0, 0.0, 1.0), true);
    // End:0xd3
    if(HitActor == none)
    {
        MaxEyeHeight = CollisionHeight + 35.0;
    }
    // End:0xf5
    else
    {
        MaxEyeHeight = HitLocation.Z - Location.Z - float(14);
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
        smooth = FMin(0.90, 10.0 * DeltaTime / Level.TimeDilation);
        LandBob *= float(1) - smooth;
        // End:0x1d1
        if(Controller.WantsSmoothedView())
        {
            OldEyeHeight = EyeHeight;
            EyeHeight = FClamp(EyeHeight - Location.Z + OldZ * float(1) - smooth + BaseEyeHeight * smooth, -0.50 * CollisionHeight, MaxEyeHeight);
        }
        // End:0x1fd
        else
        {
            EyeHeight = FMin(EyeHeight * float(1) - smooth + BaseEyeHeight * smooth, MaxEyeHeight);
        }
    }
    // End:0x357
    else
    {
        // End:0x2aa
        if(bLandRecovery)
        {
            smooth = FMin(0.90, 10.0 * DeltaTime);
            OldEyeHeight = EyeHeight;
            EyeHeight = FMin(EyeHeight * float(1) - 0.60 * smooth + BaseEyeHeight * 0.60 * smooth, BaseEyeHeight);
            LandBob *= float(1) - smooth;
            // End:0x2a7
            if(EyeHeight >= BaseEyeHeight - float(1))
            {
                bJustLanded = false;
                bLandRecovery = false;
                EyeHeight = BaseEyeHeight;
            }
        }
        // End:0x357
        else
        {
            smooth = FMin(0.650, 10.0 * DeltaTime);
            OldEyeHeight = EyeHeight;
            EyeHeight = FMin(EyeHeight * float(1) - 1.50 * smooth, MaxEyeHeight);
            LandBob += 0.030 * OldEyeHeight - EyeHeight;
            // End:0x357
            if(EyeHeight < 0.450 * BaseEyeHeight + float(1) || LandBob > float(3))
            {
                bLandRecovery = true;
                EyeHeight = 0.450 * BaseEyeHeight + float(1);
            }
        }
    }
    Controller.AdjustView(DeltaTime);
}

simulated function Vector EyePosition()
{
    return EyeHeight * vect(0.0, 0.0, 1.0) + WalkBob;
}

simulated event Destroyed()
{
    local int lp1;

    StopLoopSoundByActor();
    // End:0x6b
    if(bAddToLevelPawnList)
    {
        lp1 = Level.PawnList.Length - 1;
        J0x27:
        // End:0x6b [While If]
        if(lp1 >= 0)
        {
            // End:0x61
            if(Level.PawnList[lp1] == self)
            {
                Level.PawnList.Remove(lp1, 1);
            }
            -- lp1;
            // This is an implied JumpToken; Continue!
            goto J0x27;
        }
    }
    // End:0x82
    if(Shadow != none)
    {
        Shadow.Destroy();
    }
    // End:0x9d
    if(Controller != none)
    {
        Controller.PawnDied(self);
    }
    // End:0xb8
    if(Level.NetMode == 3)
    {
        return;
    }
    J0xb8:
    // End:0xd2 [While If]
    if(Inventory != none)
    {
        Inventory.Destroy();
        // This is an implied JumpToken; Continue!
        goto J0xb8;
    }
    Weapon = none;
    super.Destroyed();
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
        BaseEyeHeight = 0.80 * CollisionHeight;
    }
    EyeHeight = BaseEyeHeight;
    // End:0x6c
    if(MenuName == "")
    {
        MenuName = GetItemName(string(Class));
    }
}

event PostBeginPlay()
{
    local AIScript A;

    super.PostBeginPlay();
    SplashTime = 0.0;
    SpawnTime = Level.TimeSeconds;
    EyeHeight = BaseEyeHeight;
    OldRotYaw = float(Rotation.Yaw);
    bIsAiming = false;
    bWasAimMode = false;
    SetTimer(30.0, true);
    // End:0x133
    if(Level.bStartup && Health > 0 && !bDontPossess)
    {
        // End:0xd8
        if(AIScriptTag != 'None')
        {
            // End:0xaf
            foreach AllActors(class'AIScript', A, AIScriptTag)
            {
                // End:0xaf
                break;                                
            }
            // End:0xd8
            if(A != none)
            {
                A.SpawnControllerFor(self);
                // End:0xd8
                if(Controller != none)
                {
                    return;
                }
            }
        }
        // End:0xfe
        if(ControllerClass != none && Controller == none)
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
    if(Level.bDropDetail || Level.DetailMode == 0)
    {
        MaxLights = byte(Min(4, MaxLights));
    }
    // End:0x7b
    if(Role == 4)
    {
        return;
    }
    // End:0xf0
    if(Controller != none && Controller.Pawn == none)
    {
        Controller.Pawn = self;
        // End:0xf0
        if(PlayerController(Controller) != none && PlayerController(Controller).ViewTarget == Controller)
        {
            PlayerController(Controller).SetViewTarget(self);
        }
    }
    // End:0x108
    if(Role == 3)
    {
        bUpdateEyeheight = true;
    }
    // End:0x1ab
    if(PlayerReplicationInfo != none && PlayerReplicationInfo.Owner == none)
    {
        PlayerReplicationInfo.SetOwner(Controller);
        // End:0x1ab
        if(Left(PlayerReplicationInfo.PlayerName, 5) ~= "PRESS")
        {
            P = Level.GetLocalPlayerController();
            // End:0x1ab
            if(P.PlayerReplicationInfo != none && !Left(PlayerReplicationInfo.PlayerName, 5) ~= "PRESS")
            {
                bScriptPostRender = true;
            }
        }
    }
    PlayWaiting();
    RespawnLocation = Location;
    PlayerReplicationInfo.PlayerHealth = Health;
}

simulated event SetShadowLight(Vector vLightDir);
simulated function SetMesh()
{
    // End:0x0d
    if(Mesh != none)
    {
        return;
    }
    LinkMesh(default.Mesh);
}

function Gasp();
function SetMovementPhysics();
function bool GiveHealth(int HealAmount, int HealMax)
{
    // End:0x2a
    if(Health < HealMax)
    {
        Health = Min(HealMax, Health + HealAmount);
        return true;
    }
    return false;
}

function bool HasUDamage()
{
    return false;
}

function int ShieldAbsorb(int Damage)
{
    return Damage;
}

function TakeHeadRoundBullet(Vector HitLocation, int WeaponType)
{
    local Vector loctohit;

    loctohit = HitLocation - PlayerController(Controller).ViewTarget.Location;
    loctohit = Normal(loctohit);
    loctohit = loctohit * float(100) + PlayerController(Controller).ViewTarget.Location;
    PlaySoundHK2(Sound(DynamicLoadObject("Warfare_Sound_Char.whizby.char_whizby", class'Sound')), 0, 1.0,, 50.0,, true,,, false, HitLocation);
}

function TakeDamageSound(int LeftHealth, int ActualDamage, Vector HitLocation, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional Controller Killer);
function Controller GetDelayedInstigatorController(Pawn instigatedBy)
{
    local Controller Killer, C;

    Killer = DelayedDamageInstigatorController;
    // End:0xc9
    if(instigatedBy.OwnerName != "")
    {
        Log("[Pawn::GetDelayedInstigatorController] " $ instigatedBy.OwnerName);
        C = Level.ControllerList;
        J0x6f:
        // End:0xc9 [While If]
        if(C != none)
        {
            // End:0xb2
            if(C.PlayerReplicationInfo.PlayerName == instigatedBy.OwnerName)
            {
                Killer = C;
            }
            // End:0xc9
            else
            {
                C = C.nextController;
                // This is an implied JumpToken; Continue!
                goto J0x6f;
            }
        }
    }
    return Killer;
}

function ApplyDealDamageRatio(Pawn instigatedBy, class<DamageType> DamageType, int WeaponType, out int ActualDamage)
{
    // End:0xb1
    if(instigatedBy != none)
    {
        switch(WeaponType)
        {
            // End:0x58
            case 0:
                // End:0x40
                if(DamageType == class'wDamageMelee')
                {
                    ActualDamage *= instigatedBy.DealDamageRatio_Melee;
                }
                // End:0x55
                else
                {
                    ActualDamage *= instigatedBy.DealDamageRatio_Default;
                }
                // End:0xb1
                break;
            // End:0x5f
            case 1:
            // End:0x66
            case 2:
            // End:0x6d
            case 3:
            // End:0x8c
            case 4:
                ActualDamage *= instigatedBy.DealDamageRatio_Default;
                // End:0xb1
                break;
            // End:0xab
            case 5:
                ActualDamage *= instigatedBy.DealDamageRatio_Explosive;
                // End:0xb1
                break;
            // End:0xffff
            default:
                // End:0xb1 Break;
                break;
            }
    }
}

function Controller GetDamagedByKiller(class<DamageType> DamageType, Pawn instigatedBy)
{
    local Controller Killer;

    // End:0x19
    if(Health - 25 <= 0)
    {
        Killer = none;
    }
    // End:0x20
    else
    {
        Killer = none;
    }
    // End:0x6d
    if(DamageType.default.bCausedByWorld && instigatedBy == none || instigatedBy == self && LastHitBy != none)
    {
        Killer = self.GetKillerController();
    }
    // End:0x8d
    else
    {
        // End:0x8d
        if(instigatedBy != none)
        {
            Killer = instigatedBy.GetKillerController();
        }
    }
    // End:0xd7
    if(Killer == none && DamageType.default.bCausedByWorld && instigatedBy == none && LastHitBy == none)
    {
        Killer = self.GetKillerController();
    }
    // End:0x107
    if(Killer == none && DamageType.default.bDelayedDamage)
    {
        Killer = GetDelayedInstigatorController(instigatedBy);
    }
    // End:0x13c
    if(Killer != none && Killer.IsA('wHelicopterController'))
    {
        Killer = Killer.Caller;
    }
    return Killer;
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int ActualDamage;
    local Controller Killer;

    // End:0x6d
    if(DamageType == none)
    {
        // End:0x62
        if(instigatedBy != none)
        {
            Warn("No damagetype for damage by " $ string(instigatedBy) $ " with weapon " $ string(instigatedBy.Weapon));
        }
        DamageType = class'DamageType';
    }
    // End:0xb6
    if(Role < 4)
    {
        Log(string(self) $ " client damage type " $ string(DamageType) $ " by " $ string(instigatedBy));
        return;
    }
    // End:0xe2
    if(Health <= 0 || !Level.Game.CanPawnTakeDamage())
    {
        return;
    }
    // End:0x138
    if(instigatedBy == none || instigatedBy.Controller == none && DamageType.default.bDelayedDamage && DelayedDamageInstigatorController != none)
    {
        instigatedBy = DelayedDamageInstigatorController.Pawn;
    }
    // End:0x15b
    if(Physics == 0 && DrivenVehicle == none)
    {
        SetMovementPhysics();
    }
    // End:0x1a4
    if(Physics == 1 && DamageType.default.bExtraMomentumZ)
    {
        Momentum.Z = FMax(Momentum.Z, 0.40 * VSize(Momentum));
    }
    // End:0x1bb
    if(instigatedBy == self)
    {
        Momentum *= 0.60;
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
    // End:0x25d
    if(instigatedBy != none && instigatedBy.HasUDamage())
    {
        Damage *= float(2);
    }
    ActualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
    // End:0x2ca
    if(DamageType.default.bArmorStops && ActualDamage > 0)
    {
        ActualDamage = ShieldAbsorb(ActualDamage);
    }
    ApplyDealDamageRatio(instigatedBy, DamageType, WeaponType, ActualDamage);
    // End:0x306
    if(HitLocation == vect(0.0, 0.0, 0.0))
    {
        HitLocation = Location;
    }
    AddDamageInfo(instigatedBy, ActualDamage, DamageType);
    // End:0x36b
    if(ActualDamage > 0)
    {
        instigatedBy.LastDamageDealtTime = Level.TimeSeconds;
        instigatedBy.LastDamageCollisionPart = CollisionPart;
        LastDamageReceiveTime = Level.TimeSeconds;
    }
    PlayHit(float(ActualDamage), instigatedBy, HitLocation, DamageType, Momentum, CollisionPart);
    Killer = GetDamagedByKiller(DamageType, instigatedBy);
    // End:0x46d
    if(Health - ActualDamage <= 0)
    {
        // End:0x3cd
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
    // End:0x572
    else
    {
        AttackerLoc = instigatedBy.Location;
        // End:0x4d9
        if(DrivenVehicle != none)
        {
            // End:0x4d6
            if(DrivenVehicle.Controller != none)
            {
                DrivenVehicle.Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
            }
        }
        // End:0x511
        else
        {
            // End:0x511
            if(Controller != none)
            {
                Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
            }
        }
        // End:0x53d
        if(instigatedBy != none && instigatedBy != self)
        {
            LastHitBy = instigatedBy.Controller;
        }
        Health -= ActualDamage;
        TakeDamageSound(Health, ActualDamage, HitLocation, DamageType, CollisionPart, WeaponType, Killer);
    }
    MakeNoise(1.0);
}

function AddDamageInfo(Pawn instigatedBy, int Damage, class<DamageType> DamageType)
{
    local PlayerDamageInfo DInfo;
    local string strDamageType;

    DInfo.Attacker = instigatedBy;
    // End:0xb1
    if(Level.GetMatchMaker().IsFixedAssistPoint)
    {
        DInfo.ac = instigatedBy.Controller;
        DInfo.AttackerUID = instigatedBy.PlayerReplicationInfo.GetUID();
        strDamageType = string(DamageType);
        // End:0xb1
        if(strDamageType ~= "WWeapons_Res.wWeaponRes_StunGrenade")
        {
            DInfo.DamageStun = true;
        }
    }
    DInfo.DamageAmount = float(Damage);
    DInfo.DamageTime = Level.TimeSeconds;
    DamageInfo[DamageInfo.Length] = DInfo;
}

function int GetAssistScore(int UID)
{
    local PlayerDamageInfo tmSrcInfo;
    local int i;
    local bool bFindStun;

    i = 0;
    J0x07:
    // End:0xa4 [While If]
    if(i < DamageInfo.Length)
    {
        // End:0x48
        if(DamageInfo[i].AttackerUID <= 0 || DamageInfo[i].Attacker == self)
        {
        }
        // End:0x9a
        else
        {
            // End:0x9a
            if(DamageInfo[i].AttackerUID == UID)
            {
                tmSrcInfo.DamageAmount += DamageInfo[i].DamageAmount;
                // End:0x9a
                if(DamageInfo[i].DamageStun)
                {
                    bFindStun = true;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Log(string(self) $ " Assist PlayerName " $ tmSrcInfo.ac.PlayerReplicationInfo.PlayerName $ "/  DamageAmount: " $ string(tmSrcInfo.DamageAmount));
    // End:0x12e
    if(tmSrcInfo.DamageAmount < float(20) && bFindStun)
    {
        return class'wMessage_Score'.default.Code_MessageScore_Assist;
    }
    // End:0x153
    if(tmSrcInfo.DamageAmount < float(51))
    {
        return class'wMessage_Score'.default.Code_MessageScore_Assist;
    }
    // End:0x187
    else
    {
        // End:0x178
        if(tmSrcInfo.DamageAmount < float(81))
        {
            return class'wMessage_Score'.default.Code_MessageScore_Assist4;
        }
        // End:0x187
        else
        {
            return class'wMessage_Score'.default.Code_MessageScore_Assist5;
        }
    }
    return 0;
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
    // End:0x69
    else
    {
        AssistGainTime = 8;
        AssistMinDamage = 29;
    }
    i = 0;
    J0x70:
    // End:0x38b [While If]
    if(i < DamageInfo.Length)
    {
        tmSrcInfo = DamageInfo[i];
        Log(string(self) $ " tmSrcInfo.AC :  " $ tmSrcInfo.ac.PlayerReplicationInfo.PlayerName);
        // End:0x123
        if(Level.GetMatchMaker().IsFixedAssistPoint)
        {
            // End:0x120
            if(tmSrcInfo.ac == none || tmSrcInfo.Attacker == Killer || tmSrcInfo.Attacker == self)
            {
            }
            // End:0x381
            else
            {
                // This is an implied JumpToken;
                goto J0x15e;
            }
            // End:0x15e
            if(tmSrcInfo.Attacker == none || tmSrcInfo.Attacker == Killer || tmSrcInfo.Attacker == self)
            {
            }
            // End:0x381
            else
            {
                J0x15e:
                bFind = false;
                j = 0;
                J0x16d:
                // End:0x363 [While If]
                if(j < ADmInfo.Length)
                {
                    // End:0x259
                    if(Level.GetMatchMaker().IsFixedAssistPoint)
                    {
                        // End:0x1b2
                        if(ADmInfo[j].ac == none)
                        {
                        }
                        // End:0x359
                        else
                        {
                            // End:0x256
                            if(ADmInfo[j].ac == tmSrcInfo.ac)
                            {
                                // End:0x218
                                if(tmSrcInfo.DamageTime - ADmInfo[j].DamageTime <= float(AssistGainTime))
                                {
                                    ADmInfo[j].DamageAmount += tmSrcInfo.DamageAmount;
                                }
                                // End:0x233
                                else
                                {
                                    ADmInfo[j].DamageAmount = tmSrcInfo.DamageAmount;
                                }
                                ADmInfo[j].DamageTime = tmSrcInfo.DamageTime;
                                bFind = true;
                            }
                            // This is an implied JumpToken;
                            goto J0x2fd;
                        }
                        // End:0x2fd
                        if(ADmInfo[j].Attacker == tmSrcInfo.Attacker)
                        {
                            // End:0x2bf
                            if(tmSrcInfo.DamageTime - ADmInfo[j].DamageTime <= float(AssistGainTime))
                            {
                                ADmInfo[j].DamageAmount += tmSrcInfo.DamageAmount;
                            }
                            // End:0x2da
                            else
                            {
                                ADmInfo[j].DamageAmount = tmSrcInfo.DamageAmount;
                            }
                            ADmInfo[j].DamageTime = tmSrcInfo.DamageTime;
                            bFind = true;
                        }
                        J0x2fd:
                        Log(string(self) $ " Name " $ ADmInfo[j].ac.PlayerReplicationInfo.PlayerName $ " / DamageAmount  " $ string(ADmInfo[j].DamageAmount));
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x16d;
                }
                // End:0x381
                if(bFind == false)
                {
                    ADmInfo[ADmInfo.Length] = tmSrcInfo;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x70;
    }
    i = 0;
    J0x392:
    // End:0x522 [While If]
    if(i < ADmInfo.Length)
    {
        // End:0x45f
        if(Level.GetMatchMaker().IsFixedAssistPoint)
        {
            // End:0x45c
            if(ADmInfo[i].ac != none && ADmInfo[i].ac.bIsPlayer && ADmInfo[i].DamageAmount > float(AssistMinDamage) && Level.TimeSeconds - ADmInfo[i].DamageTime <= float(AssistGainTime))
            {
                AssistList[AssistList.Length] = ADmInfo[i].ac;
            }
        }
        // End:0x518
        else
        {
            // End:0x518
            if(ADmInfo[i].Attacker.Controller != none && ADmInfo[i].Attacker.Controller.bIsPlayer && ADmInfo[i].DamageAmount > float(AssistMinDamage) && Level.TimeSeconds - ADmInfo[i].DamageTime <= float(AssistGainTime))
            {
                AssistList[AssistList.Length] = ADmInfo[i].Attacker.Controller;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x392;
    }
    return AssistList;
}

function SetDelayedDamageInstigatorController(Controller C)
{
    DelayedDamageInstigatorController = C;
}

// Export UPawn::execGetTeamNum(FFrame&, void* const)
native simulated function int GetTeamNum();
function TeamInfo GetTeam()
{
    // End:0x1a
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.Team;
    }
    // End:0x53
    if(DrivenVehicle != none && DrivenVehicle.PlayerReplicationInfo != none)
    {
        return DrivenVehicle.PlayerReplicationInfo.Team;
    }
    return none;
}

function Controller GetKillerController()
{
    return Controller;
}

function CalcItemUsedTimeSelf()
{
    CalcItemUsedTime(Level.GetMatchMaker().GetUserInfoByUserName(PlayerReplicationInfo.PlayerName));
}

function CalcItemUsedTime(wMatchUserInfo kUser)
{
    local int i, j;
    local float Time;

    // End:0x0d
    if(kUser == none)
    {
        return;
    }
    Time = float(Level.Game.GameReplicationInfo.ElapsedTime) - PlayerReplicationInfo.fSpawnedTime;
    i = 0;
    J0x4c:
    // End:0x88 [While If]
    if(i < kUser.EquippedItems.Length)
    {
        kUser.ResetItemUse(i, Time);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    i = 0;
    J0x8f:
    // End:0xe0 [While If]
    if(i < 5)
    {
        j = 0;
        J0xa2:
        // End:0xd6 [While If]
        if(j < 4)
        {
            kUser.ResetQSlotItemUse(i, j, Time);
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xa2;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8f;
    }
}

function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local Vector TossVel;
    local Trigger t;
    local NavigationPoint N;
    local bool bTossWeapon, bSkillWeapon;
    local wItemBaseParam ItemParam;

    // End:0x41
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.bySupply_Helipack = 0;
        PlayerReplicationInfo.bySupply_UAV = 0;
        PlayerReplicationInfo.bySupply_AirStrike = 0;
    }
    // End:0x7d
    else
    {
        Log(string(self) $ "PlayerReplicationInfo is None" $ "/ Killer:" $ string(Killer));
    }
    // End:0xb2
    if(bDeleteMe || Level.bLevelChange || Level.Game == none)
    {
        return;
    }
    // End:0x100
    if(DamageType.default.bCausedByWorld && Killer == none || Killer == Controller && LastHitBy != none)
    {
        Killer = self.GetKillerController();
    }
    // End:0x13b
    if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
    {
        Health = Max(Health, 1);
        return;
    }
    Health = Min(0, Health);
    // End:0x383
    if(Weapon != none)
    {
        Level.Game.SC.KDLog.DeathWeapon = Weapon.BaseParams.iWeaponID;
        Level.Game.SC.KDLog.DeathWeaponPart = Weapon.Parts[0].PartsGroupID;
        // End:0x383
        if(DrivenVehicle == none || DrivenVehicle.bAllowWeaponToss)
        {
            // End:0x217
            if(Controller != none)
            {
                Controller.LastPawnWeapon = Weapon.Class;
            }
            Weapon.HolderDied();
            bSkillWeapon = false;
            // End:0x2f7
            if(Weapon.InventoryGroup == 5)
            {
                ItemParam = Level.GameMgr.GetItemParam(Weapon.BaseParams.iWeaponID);
                // End:0x2b1
                if(ItemParam.iItemID >= 0 && ItemParam.eGrade == 11)
                {
                    bSkillWeapon = true;
                }
                // End:0x2ec
                if(bSkillWeapon == false && TypeOfWeapon == 7 || TypeOfWeapon == 8)
                {
                    bTossWeapon = true;
                }
                // End:0x2f4
                else
                {
                    bTossWeapon = false;
                }
            }
            // End:0x2ff
            else
            {
                bTossWeapon = false;
            }
            // End:0x383
            if(Weapon.InventoryGroup == 1 || Weapon.InventoryGroup == 2 || bTossWeapon)
            {
                TossVel = vector(GetViewRotation());
                TossVel = TossVel * Velocity Dot TossVel + float(500) + vect(0.0, 0.0, 200.0);
                TossWeapon(TossVel);
            }
        }
    }
    // End:0x3b1
    if(DrivenVehicle != none)
    {
        Velocity = DrivenVehicle.Velocity;
        DrivenVehicle.DriverDied();
    }
    // End:0x40b
    if(Controller != none)
    {
        Controller.WasKilledBy(Killer);
        Level.Game.Killed(Killer, Controller, self, DamageType, CollisionPart, WeaponType, bWallShot);
    }
    // End:0x448
    else
    {
        Level.Game.Killed(Killer, Controller(Owner), self, DamageType, CollisionPart, WeaponType, bWallShot);
    }
    DrivenVehicle = none;
    // End:0x477
    if(Killer != none)
    {
        TriggerEvent(Event, self, Killer.Pawn);
    }
    // End:0x484
    else
    {
        TriggerEvent(Event, self, none);
    }
    // End:0x4fe
    if(IsPlayerPawn() || WasPlayerPawn())
    {
        PhysicsVolume.PlayerPawnDiedInVolume(self);
        // End:0x4c9
        foreach TouchingActors(class'Trigger', t)
        {
            t.PlayerToucherDied(self);                        
        }
        // End:0x4fd
        foreach TouchingActors(class'NavigationPoint', N)
        {
            // End:0x4fc
            if(N.bReceivePlayerToucherDiedNotify)
            {
                N.PlayerToucherDied(self);
            }                        
        }
    }
    RemovePowerups();
    Velocity.Z *= 1.30;
    // End:0x532
    if(IsHumanControlled())
    {
        PlayerController(Controller).ForceDeathUpdate();
    }
    // End:0x56d
    if(DamageType != none && DamageType.default.bAlwaysGibs)
    {
        ChunkUp(Rotation, DamageType.default.GibPerterbation);
    }
    // End:0x5d2
    else
    {
        NetUpdateFrequency = default.NetUpdateFrequency;
        PlayDying(DamageType, HitLocation, CollisionPart);
        // End:0x5aa
        if(Level.Game.bGameEnded)
        {
            return;
        }
        // End:0x5d2
        if(!bPhysicsAnimUpdate && !IsLocallyControlled())
        {
            ClientDying(DamageType, HitLocation);
        }
    }
}

function RemovePowerups();
event Falling()
{
    // End:0x1a
    if(Controller != none)
    {
        Controller.SetFall();
    }
}

event HitWall(Vector HitNormal, Actor Wall, Material HitMaterial);
event PlayLandedSound(int SurfType);
event Landed(Vector HitNormal)
{
    ImpactVelocity = vect(0.0, 0.0, 0.0);
    TakeFallingDamage();
    // End:0x34
    if(Health > 0)
    {
        PlayLanded(Velocity.Z);
    }
    // End:0x87
    if(Velocity.Z < float(-200) && PlayerController(Controller) != none)
    {
        bJustLanded = PlayerController(Controller).bLandingShake;
        OldZ = Location.Z;
    }
    LastHitBy = none;
}

event HeadVolumeChange(PhysicsVolume newHeadVolume)
{
    // End:0x28
    if(Level.NetMode == 3 || Controller == none)
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
            if(Controller.bIsPlayer && BreathTime > float(0) && BreathTime < float(8))
            {
                Gasp();
            }
            BreathTime = -1.0;
        }
    }
    // End:0xb0
    else
    {
        // End:0xb0
        if(newHeadVolume.bWaterVolume)
        {
            BreathTime = UnderWaterTime;
        }
    }
}

function bool TouchingWaterVolume()
{
    local PhysicsVolume V;

    // End:0x26
    foreach TouchingActors(class'PhysicsVolume', V)
    {
        // End:0x25
        if(V.bWaterVolume)
        {
            break;
            return true;
        }                
    }
    return false;
}

function bool IsInPain()
{
    local PhysicsVolume V;

    // End:0x58
    foreach TouchingActors(class'PhysicsVolume', V)
    {
        // End:0x57
        if(V.bPainCausing && V.DamageType != ReducedDamageType && V.DamagePerSec > float(0))
        {
            break;
            return true;
        }                
    }
    return false;
}

event BreathTimer()
{
    // End:0x35
    if(Health < 0 || Level.NetMode == 3 || DrivenVehicle != none)
    {
        return;
    }
    TakeDrowningDamage();
    // End:0x51
    if(Health > 0)
    {
        BreathTime = 2.0;
    }
}

function TakeDrowningDamage();
function bool CheckWaterJump(out Vector WallNormal)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, checkpoint, Start, checkNorm;

    // End:0x2b
    if(AIController(Controller) != none)
    {
        checkpoint = Acceleration;
        checkpoint.Z = 0.0;
    }
    // End:0x4f
    if(checkpoint == vect(0.0, 0.0, 0.0))
    {
        checkpoint = vector(Rotation);
    }
    checkpoint.Z = 0.0;
    checkNorm = Normal(checkpoint);
    checkpoint = Location + 1.20 * CollisionRadius * checkNorm;
    HitActor = Trace(HitLocation, HitNormal, checkpoint, Location, true, GetCollisionExtent());
    // End:0x164
    if(HitActor != none && Pawn(HitActor) == none)
    {
        WallNormal = float(-1) * HitNormal;
        Start = Location;
        Start.Z += 1.10 * 35.0;
        checkpoint = Start + float(2) * CollisionRadius * checkNorm;
        HitActor = Trace(HitLocation, HitNormal, checkpoint, Start, true);
        // End:0x164
        if(HitActor == none || HitNormal.Z > 0.70)
        {
            return true;
        }
    }
    return false;
}

function DoDoubleJump(bool bUpdating);
function bool CanDoubleJump();
function bool CanMultiJump();
function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange);
function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot);
function bool Dodge(Actor.EDoubleClickDir DoubleClickMove)
{
    return false;
}

function bool DoJump(bool bUpdating)
{
    // End:0x1dd
    if(!bIsCrouched && !bWantsToCrouch && !bIsProned && !bWantsToProne && Physics == 1 || Physics == 11 || Physics == 9)
    {
        // End:0x91
        if(PlayerController(Controller) != none && PlayerController(Controller).bAimMode)
        {
        }
        // End:0x122
        if(Role == 4)
        {
            // End:0xf8
            if(Level.Game != none && Level.Game.GameDifficulty > float(2))
            {
                MakeNoise(0.10 * Level.Game.GameDifficulty);
            }
            // End:0x122
            if(bCountJumps && Inventory != none)
            {
                Inventory.OwnerEvent('Jumped');
            }
        }
        // End:0x147
        if(Physics == 9)
        {
            Velocity = JumpZ * Floor;
        }
        // End:0x196
        else
        {
            // End:0x16a
            if(Physics == 11)
            {
                Velocity.Z = 0.0;
            }
            // End:0x196
            else
            {
                // End:0x186
                if(bIsSprinting)
                {
                    Velocity.Z = default.JumpZ;
                }
                // End:0x196
                else
                {
                    Velocity.Z = JumpZ;
                }
            }
        }
        // End:0x1d6
        if(Base != none && !Base.bWorldGeometry)
        {
            Velocity.Z += Base.Velocity.Z;
        }
        SetPhysics(2);
        return true;
    }
    return false;
}

function PlayMoverHitSound();
function PlayDyingSound();
function PlayHit(float Damage, Pawn instigatedBy, Vector HitLocation, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local Vector BloodOffset, Mo, HitNormal;
    local class<Effects> DesiredEffect;
    local class<Emitter> DesiredEmitter;
    local PlayerController Hearer;

    // End:0x0d
    if(DamageType == none)
    {
        return;
    }
    // End:0x3f
    if(Damage <= float(0) && Controller == none || !Controller.bGodMode)
    {
        return;
    }
    // End:0x1cd
    if(Damage > float(DamageType.default.DamageThreshold))
    {
        HitNormal = Normal(HitLocation - Location);
        // End:0x1cd
        if(EffectIsRelevant(Location, true))
        {
            DesiredEffect = DamageType.static.GetPawnDamageEffect(HitLocation, Damage, Momentum, self, Level.bDropDetail || Level.DetailMode == 0);
            // End:0x156
            if(DesiredEffect != none)
            {
                BloodOffset = 0.20 * CollisionRadius * HitNormal;
                BloodOffset.Z = BloodOffset.Z * 0.50;
                Mo = Momentum;
                // End:0x139
                if(Mo.Z > float(0))
                {
                    Mo.Z *= 0.50;
                }
                Spawn(DesiredEffect, self,, HitLocation + BloodOffset, rotator(Mo));
            }
            DesiredEmitter = DamageType.static.GetPawnDamageEmitter(HitLocation, Damage, Momentum, self, Level.bDropDetail || Level.DetailMode == 0);
            // End:0x1cd
            if(DesiredEmitter != none)
            {
                Spawn(DesiredEmitter,,, HitLocation + HitNormal, rotator(HitNormal));
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
    // End:0x2da
    if(Level.TimeSeconds - LastPainTime > 0.10)
    {
        // End:0x277
        if(instigatedBy != none && DamageType != none && DamageType.default.bDirectDamage)
        {
            Hearer = PlayerController(instigatedBy.Controller);
        }
        // End:0x293
        if(Hearer != none)
        {
            Hearer.bAcuteHearing = true;
        }
        PlayTakeHit(HitLocation, int(Damage), DamageType);
        // End:0x2c6
        if(Hearer != none)
        {
            Hearer.bAcuteHearing = false;
        }
        LastPainTime = Level.TimeSeconds;
    }
}

simulated function ChunkUp(Rotator HitRotation, float ChunkPerterbation)
{
    // End:0x57
    if(Level.NetMode != 3 && Controller != none)
    {
        // End:0x4b
        if(Controller.bIsPlayer)
        {
            Controller.PawnDied(self);
        }
        // End:0x57
        else
        {
            Controller.Destroy();
        }
    }
    Destroy();
}

simulated function TurnOff()
{
    SetCollision(true, false);
    AmbientSound = none;
    bNoWeaponFiring = true;
    Velocity = vect(0.0, 0.0, 0.0);
    SetPhysics(0);
    bPhysicsAnimUpdate = false;
    bIsIdle = true;
    bWaitForAnim = false;
    StopAnimating();
    bIgnoreForces = true;
}

function bool IsInLoadout(class<Inventory> InventoryClass)
{
    return true;
}

function ServerSetAnimAction(name NewAction)
{
    SetAnimAction(NewAction);
}

simulated event SetAnimAction(name NewAction)
{
    Log("Pawn::SetAnimAction called");
    AnimBlendParams(1, 0.0);
    PlayAnim(NewAction,, 0.10, 0);
}

simulated event PlayDying(class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
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
}

simulated function PlayFiring(optional float Rate, optional name FiringMode);
function PlayWeaponSwitch(wWeapon newWeapon);
simulated function ServerPlayPutdownWeaponAnim(bool bQuick);
simulated function ServerThrowsWeaponAnim(bool bQuick);
simulated event StopPlayFiring()
{
    bSteadyFiring = false;
}

function PlayTakeHit(Vector HitLoc, int Damage, class<DamageType> DamageType)
{
    local Sound DesiredSound;

    // End:0x0d
    if(Damage == 0)
    {
        return;
    }
    DesiredSound = DamageType.static.GetPawnDamageSound();
    // End:0x3a
    if(DesiredSound != none)
    {
        PlayOwnedSound(DesiredSound, 1);
    }
}

simulated event ChangeAnimation()
{
    // End:0x21
    if(Controller != none && Controller.bControlAnimations)
    {
        return;
    }
    PlayWaiting();
    PlayMoving();
}

simulated event AnimEnd(int Channel)
{
    // End:0x11
    if(Channel == 0)
    {
        PlayWaiting();
    }
}

function bool CannotJumpNow()
{
    return false;
}

simulated event PlayJump();
simulated event PlayFalling();
simulated function PlayMoving();
simulated function PlayWaiting();
simulated function PlayReload();
simulated function PlayRechamber();
simulated event CheckProneAni(bool bGoProne);
function PlayLanded(float impactVel)
{
    // End:0x16
    if(!bPhysicsAnimUpdate)
    {
        PlayLandingAnimation(impactVel);
    }
}

simulated event PlayLandingAnimation(float impactVel);
function PlayVictoryAnimation();
function Vehicle GetVehicleBase()
{
    return Vehicle(Base);
}

function int GetSpree()
{
    return 0;
}

function IncrementSpree();
simulated function RawInput(float DeltaTime, float aBaseX, float aBaseY, float aBaseZ, float aMouseX, float aMouseY, float aForward, float aTurn, float aStrafe, float aUp, float aLookUp);
function Suicide()
{
    KilledBy(self);
}

function bool CheatWalk()
{
    UnderWaterTime = default.UnderWaterTime;
    SetCollision(true, true, true);
    SetPhysics(1);
    bCollideWorld = true;
    return true;
}

function bool CheatGhost()
{
    UnderWaterTime = -1.0;
    SetCollision(false, false, false);
    bCollideWorld = false;
    return true;
}

function bool CheatFly()
{
    UnderWaterTime = default.UnderWaterTime;
    SetCollision(true, true, true);
    bCollideWorld = true;
    return true;
}

function float RangedAttackTime()
{
    return 0.0;
}

simulated function Vector GetTargetLocation()
{
    return Location;
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
    AnimBlendParams(1, 0.0);
    // End:0x1b5
    if(bIsIdle == true)
    {
        // End:0x105
        if(bIsCrouched == true)
        {
            // End:0x5a
            if(bWaitForAnim == true)
            {
                return;
            }
            // End:0x92
            if(bIsAiming == false)
            {
                // End:0x84
                if(TypeOfWeapon == 4)
                {
                    IdleWeaponAnim = Pistol_IdleCrouchAnim;
                }
                // End:0x8f
                else
                {
                    IdleWeaponAnim = IdleCrouchAnim;
                }
            }
            // End:0xbb
            else
            {
                // End:0xb0
                if(TypeOfWeapon == 4)
                {
                    IdleWeaponAnim = Pistol_IdleCrouchAnim;
                }
                // End:0xbb
                else
                {
                    IdleWeaponAnim = IdleAimCrouchAnim;
                }
            }
            Log("SetAimMode:AnimAction set");
            AnimAction = IdleWeaponAnim;
            AnimBlendParams(1, 0.0);
            PlayAnim(IdleWeaponAnim, 1.0, 1.0, 0);
        }
        // End:0x1b5
        else
        {
            // End:0x1b5
            if(bIsProned == false)
            {
                // End:0x149
                if(bIsAiming == false)
                {
                    // End:0x13b
                    if(TypeOfWeapon == 4)
                    {
                        IdleWeaponAnim = Pistol_IdleRifleAnim;
                    }
                    // End:0x146
                    else
                    {
                        IdleWeaponAnim = IdleRifleAnim;
                    }
                }
                // End:0x172
                else
                {
                    // End:0x167
                    if(TypeOfWeapon == 4)
                    {
                        IdleWeaponAnim = Pistol_IdleRifleAnim;
                    }
                    // End:0x172
                    else
                    {
                        IdleWeaponAnim = IdleAimAnim;
                    }
                }
                Log("SetAimMode:AnimAction set");
                AnimAction = IdleWeaponAnim;
                AnimBlendParams(1, 0.0);
                PlayAnim(IdleWeaponAnim,, 0.10, 0);
            }
        }
    }
}

simulated function SetAimModeValueOnly(bool bToggle)
{
    bIsAiming = bToggle;
}

simulated function SetDriverFrame(float frame, optional float UpDownFrame)
{
    DriverCurrentFrame = frame;
    DriverUpDownFrame = UpDownFrame;
}

simulated event PlayTurretIdleAnim(optional bool UpDown)
{
    // End:0x20
    if(UpDown)
    {
        PlayAnim(TurretIdleUpDown, 1.0, 0.10, 2);
    }
    // End:0x33
    else
    {
        PlayAnim(TurretIdle, 1.0, 0.10, 0);
    }
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
    // End:0x7d
    if(CurrentAnim != TurretIdle)
    {
        PlayTurretIdleAnim();
    }
    SetAnimFrame(frame, 0, 1);
    FreezeAnimAt(frame, 0);
}

simulated function ServerSetTurretingMode(bool bTurret)
{
    bIsTurreting = bTurret;
    RefreshCollisionHash();
}

function ClientSetTurretingMode(bool bTurret)
{
    bIsTurreting = bTurret;
}

simulated function ServerSetReloadMode(bool bReload)
{
    bReloading = bReload;
}

function ClientSetReloadMode(bool bReload)
{
    bReloading = bReload;
}

simulated function ServerSetWasReloadMode(bool bReload)
{
    bWasReloading = bReload;
}

function ClientSetWasReloadMode(bool bReload)
{
    bWasReloading = bReload;
}

simulated function ServerSetWaitingPreAnimMode(bool bWaiting)
{
    bWaitingPreAnim = bWaiting;
}

function ClientSetWaitingPreAnimMode(bool bWaiting)
{
    bWaitingPreAnim = bWaiting;
}

simulated function ServerSetTypeOfWeapon(byte ty)
{
    TypeOfWeapon = ty;
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
                StopMusic(iSoundChannel_SuffEff, 0.0);
            }
        }
    }
    // End:0x57
    if(Role == 4)
    {
        CheckEntryVehicle();
    }
    // End:0x93
    if(EAXEffectTime > 0.0)
    {
        EAXEffectTime -= Delta;
        // End:0x93
        if(EAXEffectTime <= 0.0)
        {
            EAXEffectTime = 0.0;
            curEAXEffect = none;
        }
    }
    // End:0xb2
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.PlayerHealth = Health;
    }
}

simulated function SetEaxEffect(I3DL2Listener EAXEffect, float fTime)
{
    curEAXEffect = EAXEffect;
    EAXEffectTime = fTime;
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
}

simulated event CalcFireNoiseTime()
{
    fLastFireNoiseTime = Level.TimeSeconds;
    // End:0xc0
    if(Level.GetLocalPlayerController().Pawn != none && !Level.GetLocalPlayerController().Pawn.IsInState('Dying'))
    {
        // End:0xc0
        if(VSize(Level.GetLocalPlayerController().Pawn.Location - vLastFireNoisePos) < FireNoiseDistance)
        {
            // End:0xc0
            if(Level.TimeSeconds - LastKnownTime > 0.20)
            {
                UpdateLastKnownPosAndTime(vLastFireNoisePos, fLastFireNoiseTime);
            }
        }
    }
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
}

simulated function CalcRadioMessageTime()
{
    fLastRadioMessageTime = Level.TimeSeconds;
    // End:0xc0
    if(Level.GetLocalPlayerController().Pawn != none && !Level.GetLocalPlayerController().Pawn.IsInState('Dying'))
    {
        // End:0xc0
        if(VSize(Level.GetLocalPlayerController().Pawn.Location - vLastRadioMessagePos) < RadioMessageDistance)
        {
            // End:0xc0
            if(Level.TimeSeconds - LastKnownTime > 0.20)
            {
                UpdateLastKnownPosAndTime(vLastRadioMessagePos, fLastRadioMessageTime);
            }
        }
    }
}

simulated event UpdateLastKnownPosAndTime(Vector loc, float Time)
{
    LastKnownPos = loc;
    LastKnownTime = Time;
}

simulated function float GetMaxHealth()
{
    return HealthMax;
}

simulated function int GetCurHealth()
{
    return Health;
}

simulated function UAVScan()
{
    UAVLastScannedPos = Location;
    UAVScannedTime = Level.TimeSeconds;
    UpdateLastKnownPosAndTime(UAVLastScannedPos, UAVScannedTime);
}

function ServerAddWeapon(BtrDouble iUniqueID, int iWeaponID)
{
    Log("[Pawn::ServerAddWeapon] name=" $ LoginName $ " iUniqueID=" $ UnresolvedNativeFunction_99(iUniqueID) $ " iWeaponID=" $ string(iWeaponID));
    AddWeapon(iUniqueID, iWeaponID, 0, false);
}

function AddWeaponFromSkill(BtrDouble iUniqueID, int iWeaponID)
{
    local Inventory Inv;
    local wWeapon W;

    Inv = Inventory;
    J0x0b:
    // End:0x89 [While If]
    if(Inv != none)
    {
        // End:0x72
        if(Inv.InventoryClassNumber == iWeaponID)
        {
            Log("Pawn::AddWeaponFromSkill() Already exist Weapon[" $ string(iWeaponID) $ "]");
            return;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    W = AddWeapon(iUniqueID, iWeaponID, 0, false);
    // End:0xd5
    if(W.InventoryGroup == 5)
    {
        PlayerController(Controller).ClientChangeSlot5(W, true);
    }
    // End:0x105
    else
    {
        // End:0x105
        if(W.InventoryGroup == 6)
        {
            PlayerController(Controller).ClientChangeSlot6(W);
        }
    }
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
        // End:0x9c
        case 1:
        // End:0xa1
        case 2:
        // End:0xa6
        case 3:
        // End:0xab
        case 4:
        // End:0xb0
        case 6:
        // End:0xb5
        case 13:
        // End:0xdb
        case 9:
            W = wWeapon(CreateInventory("Engine.wGun"));
            // End:0x2cf
            break;
        // End:0x10e
        case 5:
            W = wWeapon(CreateInventory("WWeapons.wThrowingWeapon"));
            // End:0x2cf
            break;
        // End:0x141
        case 7:
            W = wWeapon(CreateInventory("WWeapons.wRocketLauncher"));
            // End:0x2cf
            break;
        // End:0x172
        case 8:
            W = wWeapon(CreateInventory("WWeapons.wFlameThrower"));
            // End:0x2cf
            break;
        // End:0x19f
        case 10:
            W = wWeapon(CreateInventory("WWeapons.wDemoPack"));
            // End:0x2cf
            break;
        // End:0x1cd
        case 11:
            W = wWeapon(CreateInventory("WWeapons.wAirStrike"));
            // End:0x2cf
            break;
        // End:0x209
        case 14:
            W = wWeapon(CreateInventory("WWeapons.wTelegraphPack_AirStrike"));
            // End:0x2cf
            break;
        // End:0x237
        case 12:
            W = wWeapon(CreateInventory("Engine.wMeleeWeapon"));
            // End:0x2cf
            break;
        // End:0x26d
        case 16:
            W = wWeapon(CreateInventory("WWeapons.wTelegraphPack_UAV"));
            // End:0x2cf
            break;
        // End:0x2a4
        case 15:
            W = wWeapon(CreateInventory("WWeapons.wTelegraphPack_Heli"));
            // End:0x2cf
            break;
        // End:0x2cc
        case 17:
            W = wWeapon(CreateInventory("Engine.wKnife"));
            // End:0x2cf
            break;
        // End:0xffff
        default:
            // End:0x2dc
            if(W == none)
            {
                return none;
            }
            W.bPickupChange = bPickupChange;
            W.iPainting_Item_ID = iPainting_Item_ID;
            W.InventoryClassNumber = iWeaponID;
            W.InventoryClassAddPartsID = iAddPartsID;
            W.wLoadOut_Server(iWeaponID, iAddPartsID);
            // End:0x3c6
            if(W != none)
            {
                W.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
                Log(string(self) $ "    [Pawn::AddWeapon] " $ string(W) $ " / maxAmmo=" $ string(MaxAmmoPrimary) $ " / curAmmo=" $ string(CurAmmoPrimary));
            }
            // End:0x410
            else
            {
                Log(string(self) $ "    [Pawn::AddWeapon] == None " $ string(W) $ " / iWeaponID=" $ string(iWeaponID));
            }
            Controller.ClientTestWeapon(W, iWeaponID);
            // End:0x469
            if(UnresolvedNativeFunction_99(iUniqueID, 0))
            {
                W.InventoryUniqueNumber = EmptyBtrDouble();
                strName = WBP.strName;
                bUniqueID = false;
            }
            // End:0x493
            else
            {
                W.InventoryUniqueNumber = iUniqueID;
                strName = UnresolvedNativeFunction_99(iUniqueID);
                bUniqueID = true;
            }
            PC = PlayerController(Owner);
            // End:0x4f6
            if(PC != none && PC.GSSS != none)
            {
                PC.GSSS.SetToStorage_AddWeapon(strName, iWeaponID, iAddPartsID, bUniqueID, iPainting_Item_ID);
            }
            return W;
    }
}

function ServerRefreshCollisionHash()
{
    RefreshCollisionHash();
}

function SetDesiredRotationCheck(bool Yaw, optional bool Pitch, optional bool Roll)
{
    DesiredRotationCheck_Yaw = Yaw;
    DesiredRotationCheck_Pitch = Pitch;
    DesiredRotationCheck_Roll = Roll;
}

simulated function QuickTurn();
simulated function GetWeaponAttachmentInfo(out byte byFlashCount, out byte byFiringMode);
simulated function bool IsEnableBombSetting()
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x54
    if(InStr(string(Anim), "_Putdown") != -1 || InStr(string(Anim), "_PutDown") != -1)
    {
        return false;
    }
    return true;
}

function AddWeaponMagazine();
function SetWeaponQuickAimZoom(bool bOn);
function SetWeaponQuickReload(bool bOn);
function SetWeaponQuickChange(bool bOn);
function SetRemoveWeaponSkill(wWeapon W);
function bool CanQuickWeaponChange()
{
    return bCanQuickWeaponChange;
}

function SetInfiniteAmmoTutorial(optional bool bDeleteGranade, optional int iGranadeCount);
exec function Set1stFov(float f)
{
    self.Weapon.DisplayFOV = f;
}

function float GetBaseStaminaTime()
{
    // End:0x66
    if(Controller != none && Controller.SkillBase != none && Controller.SkillBase.bAddStamina)
    {
        return Level.CharMgr.MyPlayer.Stm_MaxTime * 1.30;
    }
    return Level.CharMgr.MyPlayer.Stm_MaxTime;
}

simulated state ThirdViewReloadState
{

}

state Dying
{
    ignores BreathTimer;

    event ChangeAnimation();
    event StopPlayFiring();
    function PlayFiring(float Rate, name FiringMode);
    function PlayWeaponSwitch(wWeapon newWeapon);
    function PlayTakeHit(Vector HitLoc, int Damage, class<DamageType> DamageType);
    simulated function PlayNextAnimation();
    function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
    event FellOutOfWorld(Actor.eKillZType KillType)
    {
        // End:0x24
        if(KillType == 1 || KillType == 2)
        {
            return;
        }
        Destroy();
    }

    function Timer()
    {
        // End:0x0e
        if(!PlayerCanSeeMe())
        {
            Destroy();
        }
        // End:0x17
        else
        {
            SetTimer(2.0, false);
        }
    }

    function Landed(Vector HitNormal)
    {
        local Rotator finalRot;

        // End:0x4f
        if(Velocity.Z < float(-500))
        {
            TakeDamage(int(float(1) - Velocity.Z / float(30)), Instigator, Location, vect(0.0, 0.0, 0.0), class'Crushed');
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
    }

    function ReduceCylinder()
    {
        SetCollision(false, false);
    }

    function LandThump()
    {
        // End:0x18
        if(Physics == 0)
        {
            bThumped = true;
        }
    }

    event AnimEnd(int Channel)
    {
        // End:0x0d
        if(Channel != 0)
        {
            return;
        }
        // End:0x26
        if(Physics == 0)
        {
            LieStill();
        }
        // End:0x46
        else
        {
            // End:0x46
            if(PhysicsVolume.bWaterVolume)
            {
                bThumped = true;
                LieStill();
            }
        }
    }

    function LieStill()
    {
        // End:0x11
        if(!bThumped)
        {
            LandThump();
        }
        ReduceCylinder();
    }

    singular function BaseChange()
    {
        // End:0x13
        if(Base == none)
        {
            SetPhysics(2);
        }
        // End:0x33
        else
        {
            // End:0x33
            if(Pawn(Base) != none)
            {
                ChunkUp(Rotation, 1.0);
            }
        }
    }

    function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        SetPhysics(2);
        // End:0x3c
        if(Physics == 0 && Momentum.Z < float(0))
        {
            Momentum.Z *= float(-1);
        }
        Velocity += float(3) * Momentum / Mass + float(200);
        // End:0x66
        if(bInvulnerableBody)
        {
            return;
        }
        Damage *= DamageType.default.GibModifier;
        Health -= Damage;
        // End:0xc7
        if(Damage > 30 || !IsAnimating() && Health < -80)
        {
            ChunkUp(Rotation, DamageType.default.GibPerterbation);
        }
    }

    function BeginState()
    {
        local int i;

        // End:0x32
        if(bTearOff && Level.NetMode == 1)
        {
            LifeSpan = 1.0;
        }
        // End:0x3b
        else
        {
            SetTimer(12.0, false);
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
            // End:0x84
            else
            {
                Controller.Destroy();
            }
        }
        i = 0;
        J0x8b:
        // End:0xcb [While If]
        if(i < Attached.Length)
        {
            // End:0xc1
            if(Attached[i] != none)
            {
                Attached[i].PawnBaseDied();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8b;
        }
    }

Begin:
    Sleep(0.20);
    bInvulnerableBody = false;
    PlayDyingSound();
}

auto state WatingForStart
{
    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);

Begin:
    // End:0x105
    if(false && PlayerReplicationInfo != none && PlayerReplicationInfo.IsIntervented && PlayerReplicationInfo.NumLives <= 1)
    {
        switch(Level.GetMatchMaker().kGame_GameMode)
        {
            // End:0x67
            case class'wGameSettings'.static.GetModeIndex_SD():
            // End:0x79
            case class'wGameSettings'.static.GetModeIndex_DOA():
            // End:0xf5
            case class'wGameSettings'.static.GetModeIndex_Sabotage():
                // End:0xf5
                if(float(PlayerReplicationInfo.RoundWhenIntervented) < Level.GRI.Teams[0].Score + Level.GRI.Teams[1].Score + float(1))
                {
                    GotoState('InvulnerableTime');
                }
                // End:0x102
                else
                {
            // End:0xffff
            default:
            GotoState('Intervented');
            // End:0x102
            break;
        }
        // This is an implied JumpToken;
        goto J0x10c;
    }
    GotoState('InvulnerableTime');
    J0x10c:
    stop;    
}

state InvulnerableTime
{
    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);

Begin:
    // End:0x2d
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.IsInvulnerable = true;
        PlayerReplicationInfo.IsWaitingForStart = false;
    }
    // End:0x146
    if(bInvulnerableOnRespawn)
    {
        Log("Pawn" $ OwnerName @ "is invulnerable");
        // End:0x7f
        if(Level.GetMatchMaker().BeginnerMode)
        {
            Sleep(fRespawnInvulnerableTimeBeginner);
        }
        // End:0x126
        else
        {
            // End:0xb6
            if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_SD())
            {
                Sleep(fRespawnInvulnerableTime_SDMode);
            }
            // End:0x126
            else
            {
                // End:0xe5
                if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
                {
                }
                // End:0x126
                else
                {
                    // End:0x11e
                    if(Level.GetMatchMaker().BotTutorial && self.IsA('wAIPawn'))
                    {
                        Sleep(1.330);
                    }
                    // End:0x126
                    else
                    {
                        Sleep(fRespawnInvulnerableTime);
                    }
                }
            }
        }
        Log("Pawn" $ OwnerName @ "is vulnerable");
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
    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
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
    }

Begin:
    bHidden = true;
    Controller.ClientOnBeginIntervented();
    Controller.GotoState('WaitingForStart');
    Sleep(6.0);
    GotoState('InvulnerableTime');
}

defaultproperties
{
    bDrawNameTag=true
    ProneHeight=40.0
    ProneRadius=34.0
    bJumpCapable=true
    bCanJump=true
    bCanWalk=true
    bCanDoubleJump=true
    bSimulateGravity=true
    bServerMoveSetPawnRot=true
    bNoCoronas=true
    bAutoActivate=true
    bLOSHearing=true
    fWallHearingFactor=4.0
    bUseCompressedPosition=true
    bCanUse=true
    Visibility=128
    DesiredSpeed=1.0
    MaxDesiredSpeed=1.0
    HearingThreshold=2800.0
    SightRadius=5000.0
    AvgPhysicsTime=0.10
    GroundSpeed=440.0
    WaterSpeed=300.0
    AirSpeed=440.0
    LadderSpeed=200.0
    AccelRate=2048.0
    JumpZ=420.0
    AirControl=0.050
    SprintSpeed=660.0
    CrouchedSpeed=270.0
    PronedSpeed=100.0
    AimedGroundSpeed=170.0
    AimedCrouchedSpeed=110.0
    F_DiagmoveRatio=0.90
    SideMoveRatio=0.80
    B_DiagmoveRatio=0.70
    BackMoveRatio=0.70
    WalkZDamp=0.250
    MaxFallSpeed=1200.0
    PitchUpLimit=18000
    PitchDownLimit=49153
    BaseEyeHeight=64.0
    BaseEyeHeightCroucned=40.0
    BaseEyeHeightProned=18.0
    EyeHeight=54.0
    CrouchHeight=40.0
    CrouchRadius=34.0
    DrivingHeight=20.0
    DrivingRadius=22.0
    HealthMax=100.0
    SuperHealthMax=199.0
    Health=100
    HeadRadius=9.0
    HeadHeight=6.0
    HeadScale=1.0
    bSetPCRotOnPossess=true
    noise1time=-10.0
    noise2time=-10.0
    Bob=0.00070
    BobMagicValue1=8.0
    BobMagicValue2=8.0
    BobMagicValue3=16.0
    BobMagicValue4=16.0
    SoundDampening=1.0
    DamageScaling=1.0
    AmbientSoundScaling=0.80
    ControllerClass=class'AIController'
    LandMovementState=PlayerWalking
    WaterMovementState=PlayerSwimming
    BlendChangeTime=0.250
    bIsNeedUpdateAnim=true
    RepPawnPositionTime=0.250
    FireNoiseDistance=6000.0
    RadioMessageDistance=6000.0
    UAVScannedTime=-999.0
    LastKnownTime=-999.0
    DealDamageRatio_Default=1.0
    DealDamageRatio_Explosive=1.0
    DealDamageRatio_Melee=1.0
    bInvulnerableOnRespawn=true
    fRespawnInvulnerableTime=3.20
    fRespawnInvulnerableTime_SDMode=7.70
    fRespawnInvulnerableTimeBeginner=5.330
    fReduceVelRate=1.20
    DrawType=2
    bUseDynamicLights=true
    bStasis=true
    bDisableSorting=true
    bAlwaysRelevant=true
    bUpdateSimulatedPosition=true
    RemoteRole=2
    NetPriority=2.0
    Texture=Texture'S_Pawn'
    bSyncCollsionSizeHK=true
    bShadowMap=true
    bTravel=true
    bCanBeDamaged=true
    bShouldBaseAtStartup=true
    bOwnerNoSee=true
    bCanTeleport=true
    bDisturbFluidSurface=true
    bForceSkelUpdate=true
    SoundVolume=255
    SoundRadius=160.0
    CollisionRadius=34.0
    CollisionHeight=78.0
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    bRotateToDesired=true
    RotationRate=(Pitch=4096,Yaw=20000,Roll=3072)
    bNoRepMesh=true
    bDirectional=true
}