#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class UnrealGame.UnrealPawn
// 0x01D8 (0x11D8 - 0x1000)
class AUnrealPawn : public APawn
{
public:
	unsigned long                                      bNoDefaultInventory : 1;                                  // 0x1000(0x0004) (Edit)
	unsigned long                                      bAcceptAllInventory : 1;                                  // 0x1000(0x0004)
	unsigned long                                      bIsSquadLeader : 1;                                       // 0x1000(0x0004) (Edit)
	unsigned long                                      bSoakDebug : 1;                                           // 0x1000(0x0004)
	unsigned long                                      bKeepTaunting : 1;                                        // 0x1000(0x0004)
	unsigned long                                      bPlayOwnFootsteps : 1;                                    // 0x1000(0x0004)
	unsigned char                                      LoadOut;                                                  // 0x1004(0x0001)
	unsigned char                                      SelectedEquipment[0x10];                                  // 0x1005(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x1015(0x0003) MISSED OFFSET
	struct FString                                     RequiredEquipment[0x10];                                  // 0x1018(0x000C) (Edit, NeedCtorLink)
	struct FString                                     OptionalEquipment[0x10];                                  // 0x10D8(0x000C) (NeedCtorLink)
	float                                              AttackSuitability;                                        // 0x1198(0x0004)
	float                                              LastFootStepTime;                                         // 0x119C(0x0004)
	TEnumAsByte<EDoubleClickDir>                       CurrentDir;                                               // 0x11A0(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x11A1(0x0003) MISSED OFFSET
	struct FVector                                     GameObjOffset;                                            // 0x11A4(0x000C)
	struct FRotator                                    GameObjRot;                                               // 0x11B0(0x000C)
	struct FName                                       SquadName;                                                // 0x11BC(0x0004) (Edit)
	struct FString                                     VoiceType;                                                // 0x11C0(0x000C) (NeedCtorLink)
	unsigned long                                      bPlayerShadows : 1;                                       // 0x11CC(0x0004)
	unsigned long                                      bBlobShadow : 1;                                          // 0x11CC(0x0004)
	int                                                Spree;                                                    // 0x11D0(0x0004)
	int                                                iCheckBreath;                                             // 0x11D4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealPawn");
		return ptr;
	}


	void SpawnGibs(const struct FRotator& HitRotation, float ChunkPerterbation);
	void ChunkUp(const struct FRotator& HitRotation, float ChunkPerterbation);
	void PlayFootStep(int side);
	void IncrementSpree();
	int GetSpree();
	void TakeDrowningDamage();
	void SetMovementPhysics();
	class URosterEntry* GetPlacedRoster();
	void PostNetBeginPlay();
	void PostBeginPlay();
	bool Dodge(TEnumAsByte<EDoubleClickDir> DoubleClickMove);
	bool PerformDodge(TEnumAsByte<EDoubleClickDir> DoubleClickMove, const struct FVector& Dir, const struct FVector& Cross);
	class AInventory* CreateInventory(const struct FString& InventoryClassName);
	class AInventory* CustomCreateInventory(const struct FString& WeaponClassName);
	void AddDefaultInventory(bool bQuickslotChange);
	void AddDefaultInventoryDOA(bool bQuickslotChange);
	bool IsInLoadout(class UClass* InventoryClass);
	void CheckBob(float DeltaTime, const struct FVector& Y);
	struct FName GetWeaponBoneFor(class AInventory* i);
	struct FString GetDebugName();
	void SetAnimAction(const struct FName& NewAction);
	void ShouldUnCrouch();
	void EndJump();
	void HoldGameObject(class AGameObject* gameObj, const struct FName& GameObjBone);
	void HoldFlag(class AActor* FlagActor);
	struct FVector BotDodge(const struct FVector& Dir);
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void gibbedBy(class AActor* Other);
	bool FindValidTaunt(struct FName* Sequence);
	void DropFlag(const struct FString& sReason);
};


// Class UnrealGame.RosterEntry
// 0x0060 (0x008C - 0x002C)
class URosterEntry : public UObject
{
public:
	class UClass*                                      PawnClass;                                                // 0x002C(0x0004) (Edit)
	struct FString                                     PawnClassName;                                            // 0x0030(0x000C) (Edit, NeedCtorLink)
	struct FString                                     PlayerName;                                               // 0x003C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     ModifiedPlayerName;                                       // 0x0048(0x000C) (Edit, NeedCtorLink)
	struct FString                                     VoiceTypeName;                                            // 0x0054(0x000C) (Edit, NeedCtorLink)
	TEnumAsByte<EOrders>                               Orders;                                                   // 0x0060(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0061(0x0003) MISSED OFFSET
	unsigned long                                      bTaken : 1;                                               // 0x0064(0x0004) (Edit)
	class UClass*                                      FavoriteWeapon;                                           // 0x0068(0x0004) (Edit)
	float                                              Aggressiveness;                                           // 0x006C(0x0004) (Edit)
	float                                              Accuracy;                                                 // 0x0070(0x0004) (Edit)
	float                                              CombatStyle;                                              // 0x0074(0x0004) (Edit)
	float                                              StrafingAbility;                                          // 0x0078(0x0004) (Edit)
	float                                              Tactics;                                                  // 0x007C(0x0004) (Edit)
	float                                              ReactionTime;                                             // 0x0080(0x0004) (Edit)
	float                                              Jumpiness;                                                // 0x0084(0x0004) (Edit)
	unsigned long                                      bJumpy : 1;                                               // 0x0088(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.RosterEntry");
		return ptr;
	}


	void InitBot(class ABot* B);
	bool RecommendAttack();
	bool RecommendFreelance();
	bool RecommendDefense();
	bool NoRecommendation();
	bool RecommendSupport();
	void SetOrders(TEnumAsByte<EPlayerPos> Position);
	void PrecacheRosterFor(class AUnrealTeamInfo* t);
	void Init();
};


// Class UnrealGame.UnrealMPGameInfo
// 0x0110 (0x0AC8 - 0x09B8)
class AUnrealMPGameInfo : public AGameInfo
{
public:
	unsigned char                                      BotMode;                                                  // 0x09B8(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x09B9(0x0003) MISSED OFFSET
	int                                                MinPlayers;                                               // 0x09BC(0x0004)
	float                                              EndTimeDelay;                                             // 0x09C0(0x0004)
	float                                              BotRatio;                                                 // 0x09C4(0x0004)
	unsigned long                                      bPreloadAllSkins : 1;                                     // 0x09C8(0x0004)
	struct FString                                     DefaultVoiceChannel;                                      // 0x09CC(0x000C) (NeedCtorLink)
	unsigned long                                      bAllowPrivateChat : 1;                                    // 0x09D8(0x0004)
	unsigned long                                      bTeamScoreRounds : 1;                                     // 0x09D8(0x0004)
	unsigned long                                      bSoaking : 1;                                             // 0x09D8(0x0004)
	unsigned long                                      bPlayersVsBots : 1;                                       // 0x09D8(0x0004)
	float                                              EndTime;                                                  // 0x09DC(0x0004)
	class ASpecialVehicleObjective*                    SpecialVehicleObjectives;                                 // 0x09E0(0x0004)
	class UClass*                                      LocalStatsScreenClass;                                    // 0x09E4(0x0004)
	struct FString                                     VoiceReplicationInfoType;                                 // 0x09E8(0x000C) (Edit, NeedCtorLink)
	struct FString                                     MPGIPropsDisplayText[0x4];                                // 0x09F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MPGIPropDescText[0x4];                                    // 0x0A24(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BotModeText;                                              // 0x0A54(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SPBotText;                                                // 0x0A60(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MPBotText;                                                // 0x0A6C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SPBotDesc;                                                // 0x0A78(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MPBotDesc;                                                // 0x0A84(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BotOptions[0x4];                                          // 0x0A90(0x000C) (Localized, NeedCtorLink)
	class AMasterServerUplink*                         MSUplink;                                                 // 0x0AC0(0x0004)
	unsigned long                                      bMSUplinkSet : 1;                                         // 0x0AC4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealMPGameInfo");
		return ptr;
	}


	int MultiMinPlayers();
	struct FString STATIC_GetDescriptionText(const struct FString& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	struct FString STATIC_GenerateBotOptions(bool bSinglePlayer);
	void STATIC_AdjustBotInterface(bool bSinglePlayer);
	void GetServerDetails(struct FServerResponseLine* ServerState);
	void InitPlacedBot(class AController* C, class URosterEntry* R);
	bool PickupQuery(class APawn* Other, class APickup* Item);
	bool CanDisableObjective(class AGameObjective* Go);
	int AdjustDestroyObjectiveDamage(int Damage, class AController* instigatedBy, class AGameObjective* Go);
	void ShowPathTo(class APlayerController* P, int TeamNum);
	bool CanShowPathTo(class APlayerController* P, int TeamNum);
	void ForceAddBot();
	void ChangeLoadOut(class APlayerController* P, const struct FString& LoadoutName);
	void ScoreGameObject(class AController* C, class AGameObject* Go);
	class AGameObject* GetGameObject(const struct FName& GameObjectName);
	void FindNewObjectives(class AGameObjective* DisabledObjective);
	void ObjectiveDisabled(class AGameObjective* DisabledObjective);
	class UTexture* STATIC_GetRandomTeamSymbol(int Base);
	void RestartGame();
	bool TooManyBots(class AController* botToRemove);
	float SpawnWait(class AAIController* B);
	bool ShouldRespawn(class APickup* Other);
	int GetNumPlayers();
	void TeamScoreEvent(int Team, float Points, const struct FString& Desc);
	void ScoreEvent(class APlayerReplicationInfo* Who, float Points, const struct FString& Desc);
	void GameEvent(const struct FString& GEvent, const struct FString& Desc, class APlayerReplicationInfo* Who);
	void KillEvent(const struct FString& KillType, class APlayerReplicationInfo* Killer, class APlayerReplicationInfo* Victim, class UClass* Damage);
	void SpecialEvent(class APlayerReplicationInfo* Who, const struct FString& Desc);
	void ChangeVoiceChannel(class APlayerReplicationInfo* PRI, int NewChannelIndex, int OldChannelIndex);
	void InitMaplistHandler();
	void InitVoiceReplicationInfo();
	class APlayerController* Login(const struct FString& Portal, const struct FString& Options, struct FString* Error);
	void PreLogin(const struct FString& Options, const struct FString& Address, const struct FString& PlayerID, struct FString* Error, struct FString* FailCode);
};


// Class UnrealGame.Bot
// 0x0190 (0x07E0 - 0x0650)
class ABot : public AScriptedController
{
public:
	unsigned long                                      bCanFire : 1;                                             // 0x0650(0x0004)
	unsigned long                                      bStrafeDir : 1;                                           // 0x0650(0x0004)
	unsigned long                                      bLeadTarget : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bChangeDir : 1;                                           // 0x0650(0x0004)
	unsigned long                                      bFrustrated : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bInitLifeMessage : 1;                                     // 0x0650(0x0004)
	unsigned long                                      bReachedGatherPoint : 1;                                  // 0x0650(0x0004)
	unsigned long                                      bFinalStretch : 1;                                        // 0x0650(0x0004)
	unsigned long                                      bJumpy : 1;                                               // 0x0650(0x0004)
	unsigned long                                      bHasTranslocator : 1;                                     // 0x0650(0x0004)
	unsigned long                                      bHasImpactHammer : 1;                                     // 0x0650(0x0004)
	unsigned long                                      bTacticalDoubleJump : 1;                                  // 0x0650(0x0004)
	unsigned long                                      bWasNearObjective : 1;                                    // 0x0650(0x0004)
	unsigned long                                      bPlannedShot : 1;                                         // 0x0650(0x0004)
	unsigned long                                      bHasFired : 1;                                            // 0x0650(0x0004)
	unsigned long                                      bForcedDirection : 1;                                     // 0x0650(0x0004)
	unsigned long                                      bFireSuccess : 1;                                         // 0x0650(0x0004)
	unsigned long                                      bStoppedFiring : 1;                                       // 0x0650(0x0004)
	unsigned long                                      bEnemyIsVisible : 1;                                      // 0x0650(0x0004)
	unsigned long                                      bTranslocatorHop : 1;                                     // 0x0650(0x0004)
	unsigned long                                      bEnemyEngaged : 1;                                        // 0x0650(0x0004)
	unsigned long                                      bMustCharge : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bPursuingFlag : 1;                                        // 0x0650(0x0004)
	unsigned long                                      bJustLanded : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bSingleTestSection : 1;                                   // 0x0650(0x0004)
	unsigned long                                      bRecommendFastMove : 1;                                   // 0x0650(0x0004)
	unsigned long                                      bDodgingForward : 1;                                      // 0x0650(0x0004)
	unsigned long                                      bInstantAck : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bShieldSelf : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bIgnoreEnemyChange : 1;                                   // 0x0650(0x0004)
	unsigned long                                      bHasSuperWeapon : 1;                                      // 0x0650(0x0004)
	class AActor*                                      TranslocationTarget;                                      // 0x0654(0x0004)
	class AActor*                                      RealTranslocationTarget;                                  // 0x0658(0x0004)
	class AActor*                                      ImpactTarget;                                             // 0x065C(0x0004)
	float                                              TranslocFreq;                                             // 0x0660(0x0004)
	float                                              NextTranslocTime;                                         // 0x0664(0x0004)
	struct FName                                       OldMessageType;                                           // 0x0668(0x0004)
	int                                                OldMessageID;                                             // 0x066C(0x0004)
	struct FVector                                     HidingSpot;                                               // 0x0670(0x000C)
	float                                              Aggressiveness;                                           // 0x067C(0x0004)
	float                                              LastAttractCheck;                                         // 0x0680(0x0004)
	class ANavigationPoint*                            BlockedPath;                                              // 0x0684(0x0004)
	float                                              AcquireTime;                                              // 0x0688(0x0004)
	float                                              Aggression;                                               // 0x068C(0x0004)
	float                                              LoseEnemyCheckTime;                                       // 0x0690(0x0004)
	class AActor*                                      StartleActor;                                             // 0x0694(0x0004)
	float                                              StartTacticalTime;                                        // 0x0698(0x0004)
	float                                              LastUnderFire;                                            // 0x069C(0x0004)
	float                                              BaseAlertness;                                            // 0x06A0(0x0004)
	float                                              Accuracy;                                                 // 0x06A4(0x0004)
	float                                              BaseAggressiveness;                                       // 0x06A8(0x0004)
	float                                              StrafingAbility;                                          // 0x06AC(0x0004)
	float                                              CombatStyle;                                              // 0x06B0(0x0004)
	float                                              Tactics;                                                  // 0x06B4(0x0004)
	float                                              TranslocUse;                                              // 0x06B8(0x0004)
	float                                              ReactionTime;                                             // 0x06BC(0x0004)
	float                                              Jumpiness;                                                // 0x06C0(0x0004)
	class UClass*                                      FavoriteWeapon;                                           // 0x06C4(0x0004)
	struct FString                                     GoalString;                                               // 0x06C8(0x000C) (NeedCtorLink)
	struct FString                                     SoakString;                                               // 0x06D4(0x000C) (NeedCtorLink)
	class ASquadAI*                                    Squad;                                                    // 0x06E0(0x0004)
	class ABot*                                        NextSquadMember;                                          // 0x06E4(0x0004)
	float                                              ReTaskTime;                                               // 0x06E8(0x0004)
	class AUnrealScriptedSequence*                     GoalScript;                                               // 0x06EC(0x0004)
	class AUnrealScriptedSequence*                     EnemyAcquisitionScript;                                   // 0x06F0(0x0004)
	class AVehicle*                                    FormerVehicle;                                            // 0x06F4(0x0004)
	TEnumAsByte<EScriptFollow>                         ScriptedCombat;                                           // 0x06F8(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x06F9(0x0003) MISSED OFFSET
	int                                                FormationPosition;                                        // 0x06FC(0x0004)
	int                                                ChoosingAttackLevel;                                      // 0x0700(0x0004)
	float                                              ChooseAttackTime;                                         // 0x0704(0x0004)
	int                                                ChooseAttackCounter;                                      // 0x0708(0x0004)
	float                                              EnemyVisibilityTime;                                      // 0x070C(0x0004)
	class APawn*                                       VisibleEnemy;                                             // 0x0710(0x0004)
	class APawn*                                       OldEnemy;                                                 // 0x0714(0x0004)
	float                                              StopStartTime;                                            // 0x0718(0x0004)
	float                                              LastRespawnTime;                                          // 0x071C(0x0004)
	float                                              FailedHuntTime;                                           // 0x0720(0x0004)
	class APawn*                                       FailedHuntEnemy;                                          // 0x0724(0x0004)
	float                                              LastSearchTime;                                           // 0x0728(0x0004)
	float                                              LastSearchWeight;                                         // 0x072C(0x0004)
	float                                              CampTime;                                                 // 0x0730(0x0004)
	int                                                LastTaunt;                                                // 0x0734(0x0004)
	int                                                NumRandomJumps;                                           // 0x0738(0x0004)
	struct FString                                     ComboNames[0x4];                                          // 0x073C(0x000C) (NeedCtorLink)
	float                                              LastFireAttempt;                                          // 0x076C(0x0004)
	float                                              GatherTime;                                               // 0x0770(0x0004)
	struct FName                                       OrderNames[0x10];                                         // 0x0774(0x0004) (Edit)
	struct FName                                       OldOrders;                                                // 0x07B4(0x0004)
	class AController*                                 OldOrderGiver;                                            // 0x07B8(0x0004)
	struct FVector                                     LastKnownPosition;                                        // 0x07BC(0x000C)
	struct FVector                                     LastKillerPosition;                                       // 0x07C8(0x000C)
	class ANavigationPoint*                            TestStart;                                                // 0x07D4(0x0004)
	int                                                TestPath;                                                 // 0x07D8(0x0004)
	struct FName                                       TestLabel;                                                // 0x07DC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.Bot");
		return ptr;
	}


	bool ShouldPerformScript();
	bool ScriptingOverridesAI();
	void SetNewScript(class AScriptedSequence* NewScript);
	void SetEnemyReaction(int AlertnessLevel);
	bool IsShootingObjective();
	bool Stopped();
	bool FindViewSpot();
	bool IsHunting();
	bool IsStrafing();
	bool DefendMelee(float dist);
	void DoRetreat();
	void DoTacticalMove();
	void DoCharge();
	void DoStakeOut();
	bool LoseEnemy();
	bool LostContact(float MaxTime);
	float GetDesiredOffset();
	void ForceCelebrate();
	void ForceGiveWeapon();
	void Celebrate();
	void RecoverFromBadStateCode();
	bool Formation();
	bool IsRetreating();
	void damageAttitudeTo(class APawn* Other, float Damage);
	bool SuperPickupNotSpokenFor(class APickup* P);
	float SuperDesireability(class APickup* P);
	float Desireability(class APickup* P);
	bool NeedWeapon();
	void WanderOrCamp(bool bMayCrouch);
	class AActor* FaceActor(float StrafingModifier);
	class AActor* AlternateTranslocDest();
	bool ShouldStrafeTo(class AActor* WayPoint);
	class AActor* FaceMoveTarget();
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	bool TryToDuck(const struct FVector& duckDir, bool bReversed);
	void ChangeStrafe();
	bool TryWallDodge(const struct FVector& HitNormal, class AActor* HitActor);
	void MissedDodge();
	void NotifyFallingHitWall(const struct FVector& HitNormal, class AActor* HitActor);
	void ReceiveWarning(class APawn* shooter, float projSpeed, const struct FVector& FireDir);
	void NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void ReceiveProjectileWarning(class AProjectile* proj);
	void DelayedWarning();
	struct FRotator AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError);
	float AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow);
	bool CheckFutureSight(float DeltaTime);
	bool NearWall(float walldist);
	bool NeedToTurn(const struct FVector& targ);
	bool FindBestPathToward(class AActor* A, bool bCheckedReach, bool bAllowDetour);
	bool AllowDetourTo(class ANavigationPoint* N);
	bool SetRouteToGoal(class AActor* A);
	bool StartMoveToward(class AActor* o);
	void NotifyPostLanded();
	bool NotifyLanded(const struct FVector& HitNormal);
	void SetFall();
	bool PriorityObjective();
	bool NotifyBump(class AActor* Other);
	void DirectedWander(const struct FVector& WanderDir);
	bool AdjustAround(class APawn* Other);
	void ClearPathFor(class AController* C);
	void CancelCampFor(class AController* C);
	bool CheckPathToGoalAround(class APawn* P);
	void Restart();
	bool TestDirection(const struct FVector& Dir, struct FVector* pick);
	bool FindRoamDest();
	void SoakStop(const struct FString& problem);
	bool PickRetreatDestination();
	bool FindInventoryGoal(float BestWeight);
	bool FindSuperPickup(float MaxDist);
	void ChooseAttackMode();
	void DoRangedAttackOn(class AActor* A);
	void FightEnemy(bool bCanCharge, float EnemyStrength);
	void VehicleFightEnemy(bool bCanCharge, float EnemyStrength);
	bool EnemyVisible();
	bool DoWaitForLanding();
	void ExecuteWhatToDoNext();
	struct FString GetEnemyName();
	struct FString GetOldEnemyName();
	void WhatToDoNext(unsigned char CallingByte);
	void WasKilledBy(class AController* Other);
	void SetAlertness(float NewAlertness);
	void SetPeripheralVision();
	void SetMaxDesiredSpeed();
	void ResetSkill();
	void InitializeSkill(float InSkill);
	void Possess(class APawn* aPawn);
	void Reset();
	void NotifyMissedJump();
	void NotifyJumpApex();
	void MayDodgeToMoveTarget();
	bool NotifyPhysicsVolumeChange(class APhysicsVolume* NewVolume);
	bool StrafeFromDamage(float Damage, class UClass* DamageType, bool bFindDest);
	void BotVoiceMessage(const struct FName& MessageType, unsigned char MessageID, class AController* Sender);
	void EnemyChanged(bool bNewEnemyVisible);
	void SetEnemyInfo(bool bNewEnemyVisible);
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	float RelativeStrength(class APawn* Other);
	bool AssignSquadResponsibility();
	void FreeScript();
	bool IsSniping();
	void CheckIfShouldCrouch(const struct FVector& StartPosition, const struct FVector& TargetPosition, float Probability);
	bool CanStakeOut();
	bool ClearShot(const struct FVector& TargetLoc, bool bImmediateFire);
	void SetAttractionState();
	void SeePlayer(class APawn* SeenPlayer);
	void HearNoise(float Loudness, class AActor* NoiseMaker);
	void ClearTemporaryOrders();
	void SetTemporaryOrders(const struct FName& NewOrders, class AController* OrderGiver);
	void SetOrders(const struct FName& NewOrders, class AController* OrderGiver);
	void SendMessage(class APlayerReplicationInfo* Recipient, const struct FName& MessageType, unsigned char MessageID, float wait, const struct FName& BroadcastType);
	unsigned char GetMessageIndex(const struct FName& PhraseName);
	void YellAt(class APawn* Moron);
	class AActor* GetOrderObject();
	struct FName GetOrders();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	bool CanCombo();
	bool CanComboMoving();
	bool ProficientWithWeapon();
	float WeaponPreference(class AwWeapon* W);
	void ChangedWeapon();
	void StopFiring();
	bool CanAttack(class AActor* Other);
	bool FireWeaponAt(class AActor* A);
	void TimedFireWeaponAtEnemy();
	bool ShouldFireAgain(float RefireRate);
	bool WeaponFireAgain(float RefireRate, bool bFinishedFire);
	void WaitForMover(class AMover* M);
	void ImpactJump();
	bool CanUseTranslocator();
	bool CanImpactJump();
	float RateWeapon(class AwWeapon* W);
	void UpdatePawnViewPitch();
	class APawn* GetMyPlayer();
	void InitPlayerReplicationInfo();
	bool DontReuseTaunt(int t);
	bool AutoTaunt();
	void SetCombatTimer();
	void Startle(class AActor* Feared);
	void FearThisSpot(class AAvoidMarker* aSpot);
	void TryCombo(const struct FString& ComboName);
	bool CanDoubleJump(class APawn* Other);
	void GetOutOfVehicle();
	bool NotifyHitWall(const struct FVector& HitNormal, class AActor* Wall);
	void SetupSpecialPathAbilities();
	bool ShouldKeepShielding();
	void NotifyAddInventory(class AInventory* NewItem);
	class AwWeapon* HasSuperWeapon();
	void PostBeginPlay();
	void Destroyed();
};


// Class UnrealGame.SquadAI
// 0x00A8 (0x04D4 - 0x042C)
class ASquadAI : public AReplicationInfo
{
public:
	class AUnrealTeamInfo*                             Team;                                                     // 0x042C(0x0004)
	class AController*                                 SquadLeader;                                              // 0x0430(0x0004)
	class ATeamPlayerReplicationInfo*                  LeaderPRI;                                                // 0x0434(0x0004) (Net)
	class ASquadAI*                                    NextSquad;                                                // 0x0438(0x0004)
	class AGameObjective*                              SquadObjective;                                           // 0x043C(0x0004) (Net)
	int                                                Size;                                                     // 0x0440(0x0004)
	class AAssaultPath*                                AlternatePath;                                            // 0x0444(0x0004)
	struct FName                                       AlternatePathTag;                                         // 0x0448(0x0004)
	class ABot*                                        SquadMembers;                                             // 0x044C(0x0004)
	float                                              GatherThreshold;                                          // 0x0450(0x0004)
	struct FString                                     SupportString;                                            // 0x0454(0x000C) (Localized, NeedCtorLink)
	struct FString                                     DefendString;                                             // 0x0460(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AttackString;                                             // 0x046C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     HoldString;                                               // 0x0478(0x000C) (Localized, NeedCtorLink)
	struct FString                                     FreelanceString;                                          // 0x0484(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SupportStringTrailer;                                     // 0x0490(0x000C) (Localized, NeedCtorLink)
	struct FName                                       CurrentOrders;                                            // 0x049C(0x0004) (Net)
	class APawn*                                       enemies[0x8];                                             // 0x04A0(0x0004)
	int                                                MaxSquadSize;                                             // 0x04C0(0x0004)
	unsigned long                                      bFreelance : 1;                                           // 0x04C4(0x0004) (Net)
	unsigned long                                      bFreelanceAttack : 1;                                     // 0x04C4(0x0004)
	unsigned long                                      bFreelanceDefend : 1;                                     // 0x04C4(0x0004)
	unsigned long                                      bRoamingSquad : 1;                                        // 0x04C4(0x0004)
	unsigned long                                      bAddTransientCosts : 1;                                   // 0x04C4(0x0004)
	class AUnrealScriptedSequence*                     FreelanceScripts;                                         // 0x04C8(0x0004)
	class ARestingFormation*                           RestingFormation;                                         // 0x04CC(0x0004)
	class UClass*                                      RestingFormationClass;                                    // 0x04D0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.SquadAI");
		return ptr;
	}


	bool FriendlyToward(class APawn* Other);
	bool CautiousAdvance(class ABot* B);
	bool IsDefending(class ABot* B);
	bool ClearPathFor(class AController* C);
	bool PickRetreatDestination(class ABot* B);
	bool BeDevious();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	class ABot* PickBotToReassign();
	float BotSuitability(class ABot* B);
	bool ShouldDestroyTranslocator(class ABot* B);
	bool CheckSquadObjectives(class ABot* B);
	bool OverrideFollowPlayer(class ABot* B);
	bool CheckSpecialVehicleObjectives(class ABot* B);
	float VehicleDesireability(class AVehicle* V, class ABot* B);
	bool CheckVehicle(class ABot* B);
	void BotEnteredVehicle(class ABot* B);
	bool NeverBail(class APawn* P);
	float MaxVehicleDist(class APawn* P);
	bool AssignSquadResponsibility(class ABot* B);
	void AddTransientCosts(class ABot* B, float f);
	bool AllowTaunt(class ABot* B);
	bool TellBotToFollow(class ABot* B, class AController* C);
	void PickNewLeader();
	int GetSize();
	struct FString GetShortOrderStringFor(class ATeamPlayerReplicationInfo* PRI);
	struct FString GetOrderStringFor(class ATeamPlayerReplicationInfo* PRI);
	struct FName GetOrders();
	void Retask(class ABot* B);
	void SetObjective(class AGameObjective* o, bool bForceUpdate);
	void SetFreelanceScriptFor(class ABot* B);
	void SetDefenseScriptFor(class ABot* B);
	void SwitchBots(class ABot* MyBot, class ABot* OtherBot);
	void AddBot(class ABot* B);
	void RemoveBot(class ABot* B);
	void RemovePlayer(class APlayerController* P);
	void SetLeader(class AController* C);
	void SetFinalStretch(bool bValue);
	bool FindPathToObjective(class ABot* B, class AActor* o);
	bool TryToIntercept(class ABot* B, class APawn* P, class AActor* RouteGoal);
	void SetAlternatePath(bool bResetSquad);
	void Initialize(class AUnrealTeamInfo* t, class AGameObjective* o, class AController* C);
	void MergeWith(class ASquadAI* S);
	bool CloseToLeader(class APawn* P);
	bool NearFormationCenter(class APawn* P);
	bool WanderNearLeader(class ABot* B);
	bool WaitAtThisPosition(class APawn* P);
	bool ShouldDeferTo(class AController* C);
	float AssessThreat(class ABot* B, class APawn* NewThreat, bool bThreatVisible);
	bool UnderFire(class APawn* NewThreat, class ABot* Ignored);
	float ModifyThreat(float current, class APawn* NewThreat, bool bThreatVisible, class ABot* B);
	bool FindNewEnemyFor(class ABot* B, bool bSeeEnemy);
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	void RemoveEnemy(class APawn* E);
	bool IsOnSquad(class AController* C);
	unsigned char PriorityObjective(class ABot* B);
	bool SetEnemy(class ABot* B, class APawn* NewEnemy);
	bool ValidEnemy(class APawn* NewEnemy);
	bool AddEnemy(class APawn* NewEnemy);
	bool MustKeepEnemy(class APawn* E);
	bool LostEnemy(class ABot* B);
	bool MergeEnemiesFrom(class ASquadAI* S);
	class AActor* FormationCenter();
	struct FRotator GetFacingRotation();
	class AVehicle* GetLinkVehicle(class ABot* B);
	class AVehicle* GetKeyVehicle(class ABot* B);
	class AActor* SetFacingActor(class ABot* B);
	bool AllowImpactJumpBy(class ABot* B);
	bool AllowTranslocationBy(class ABot* B);
	void Destroyed();
	class ARestingFormation* GetRestingFormation();
	bool AllowDetourTo(class ABot* B, class ANavigationPoint* N);
	bool ShouldSuppressEnemy(class ABot* B);
	void CriticalObjectiveWarning(class APawn* NewEnemy);
	void AssignCombo(class ABot* B);
	void Reset();
};


// Class UnrealGame.GameObject
// 0x0048 (0x046C - 0x0424)
class AGameObject : public ADecoration
{
public:
	unsigned long                                      bHome : 1;                                                // 0x0424(0x0004) (Net)
	unsigned long                                      bHeld : 1;                                                // 0x0424(0x0004) (Net)
	unsigned long                                      bDisabled : 1;                                            // 0x0424(0x0004)
	unsigned long                                      bLastSecondSave : 1;                                      // 0x0424(0x0004)
	class AUnrealPawn*                                 Holder;                                                   // 0x0428(0x0004)
	class ATeamPlayerReplicationInfo*                  HolderPRI;                                                // 0x042C(0x0004) (Net)
	class AGameObjective*                              HomeBase;                                                 // 0x0430(0x0004)
	float                                              TakenTime;                                                // 0x0434(0x0004)
	float                                              MaxDropTime;                                              // 0x0438(0x0004)
	class AController*                                 FirstTouch;                                               // 0x043C(0x0004)
	TArray<class AController*>                         Assists;                                                  // 0x0440(0x000C) (NeedCtorLink)
	struct FName                                       GameObjBone;                                              // 0x044C(0x0004)
	struct FVector                                     GameObjOffset;                                            // 0x0450(0x000C)
	struct FRotator                                    GameObjRot;                                               // 0x045C(0x000C)
	class ATeamInfo*                                   OldTeam;                                                  // 0x0468(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.GameObject");
		return ptr;
	}


	void LogReturned();
	void LogDropped();
	void LogTaken(class AController* C);
	void BaseChange();
	void Landed(const struct FVector& HitNormall);
	void NotReachableBy(class APawn* P);
	void FellOutOfWorld(TEnumAsByte<EeKillZType> KillType);
	void Touch(class AActor* Other);
	bool ValidHolder(class AActor* Other);
	bool IsHome();
	class AActor* Position();
	void SetDisable(bool Disable);
	void ClearHolder();
	void CalcSetHome();
	void SendHomeDisabled(float TimeOut);
	void SendHome();
	void Drop(const struct FVector& NewVel, const struct FString& sReason);
	void Score();
	void SetHolder(class AController* C);
	bool CanBePickedUpBy(class APawn* P);
	bool CanBeThrownBy(class APawn* P);
	void ForceBegin();
	void PostBeginPlay();
};


// Class UnrealGame.UnrealPlayer
// 0x009C (0x0E40 - 0x0DA4)
class AUnrealPlayer : public APlayerController
{
public:
	unsigned long                                      bRising : 1;                                              // 0x0DA4(0x0004)
	unsigned long                                      bLatecomer : 1;                                           // 0x0DA4(0x0004)
	unsigned long                                      bDisplayLoser : 1;                                        // 0x0DA4(0x0004)
	unsigned long                                      bDisplayWinner : 1;                                       // 0x0DA4(0x0004)
	int                                                LastTaunt;                                                // 0x0DA8(0x0004)
	float                                              LastWhispTime;                                            // 0x0DAC(0x0004)
	float                                              LastKillTime;                                             // 0x0DB0(0x0004) (Edit)
	float                                              LastTauntAnimTime;                                        // 0x0DB4(0x0004)
	float                                              LastAutoTauntTime;                                        // 0x0DB8(0x0004)
	struct FString                                     CustomizedAnnouncerPack;                                  // 0x0DBC(0x000C) (NeedCtorLink)
	struct FString                                     CustomStatusAnnouncerPack;                                // 0x0DC8(0x000C) (NeedCtorLink)
	struct FString                                     CustomRewardAnnouncerPack;                                // 0x0DD4(0x000C) (NeedCtorLink)
	TArray<struct FString>                             RejoinChannels;                                           // 0x0DE0(0x000C) (Transient, Config, GlobalConfig, NeedCtorLink)
	TArray<struct FString>                             RecentServers;                                            // 0x0DEC(0x000C) (NeedCtorLink)
	int                                                MaxRecentServers;                                         // 0x0DF8(0x0004)
	unsigned long                                      bDontShowLoginMenu : 1;                                   // 0x0DFC(0x0004)
	unsigned long                                      bReadyToStart : 1;                                        // 0x0DFC(0x0004)
	struct FString                                     LoginMenuClass;                                           // 0x0E00(0x000C) (NeedCtorLink)
	unsigned long                                      bForceLoginMenu : 1;                                      // 0x0E0C(0x0004)
	float                                              LastKickWarningTime;                                      // 0x0E10(0x0004)
	struct FString                                     NetBotDebugString;                                        // 0x0E14(0x000C) (NeedCtorLink)
	struct FName                                       DirName;                                                  // 0x0E20(0x0004)
	struct FRotator                                    rAttackedZoomCameraS;                                     // 0x0E24(0x000C)
	float                                              fAttackedCamera3DZoomRatioS;                              // 0x0E30(0x0004)
	float                                              fAttackedWeapon3DZoomRatioS;                              // 0x0E34(0x0004)
	float                                              fAttacked3DZoomSpeed;                                     // 0x0E38(0x0004)
	float                                              fAttacked3DZoomDecayAcc;                                  // 0x0E3C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealPlayer");
		return ptr;
	}


	void wViewAttacked(float DeltaTime);
	void wAttackedView(int iPitch, int iYaw, int iRoll);
	void AttackedView(int iWeaponID, float fHitGunKick, const struct FVector& vAttacked);
	void RotateByAttacked(struct FVector* CameraLocation, struct FRotator* CameraRotation);
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void ClientReceiveBotDebugString(const struct FString& DebugString);
	void ServerSendBotDebugString();
	void NetDebugBot();
	void ServerChatDebug();
	void ClientGameEnded();
	void AutoJoinVoiceChat();
	void PostNetBeginPlay();
	bool NeedNetNotify();
	void SetCustomRewardAnnouncerClass(const struct FString& NewAnnouncerClass);
	struct FString GetCustomRewardAnnouncerClass();
	void SetCustomStatusAnnouncerClass(const struct FString& NewAnnouncerClass);
	struct FString GetCustomStatusAnnouncerClass();
	void ShowMidGameMenu(bool bPause);
	void ServerDropFlag();
	void DropFlag();
	void PlayWinMessage(bool bWinner);
	void ClientPlayTakeHit(const struct FVector& HitLoc, unsigned char Damage, class UClass* DamageType, int CollisionPart);
	void HitSound();
	void NewClientPlayTakeHit(const struct FVector& AttackLoc, const struct FVector& HitLoc, unsigned char Damage, class UClass* DamageType, int iWeaponID, float fHitGunKick, int CollisionPart);
	void NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void ShowLoginMenu();
	void ClientReceiveLoginMenu(const struct FString& MenuClass, bool bForce);
	void ServerSetReadyToStart();
	void InitInputSystem();
	void PostNetReceive();
	void PlayStartupMessage(unsigned char StartupStage);
	void KickWarning();
	void PlayAnnouncement(class USound* ASound, unsigned char AnnouncementLevel, bool bForce);
	void PlayRewardAnnouncement(const struct FName& AName, unsigned char AnnouncementLevel, bool bForce, TEnumAsByte<ESoundSlot> Slot, bool isWomanVoice);
	void PlayStatusAnnouncement(const struct FString& AName, unsigned char AnnouncementLevel, bool bForce);
	void ServerPlayVehicleHorn(int HornIndex);
	void PlayVehicleHorn(int HornIndex);
	void ServerTaunt(const struct FName& AnimName);
	void TAUNT(const struct FName& Sequence);
	void RandomTaunt();
	unsigned char GetMessageIndex(const struct FName& PhraseName);
	void ServerShowPathToBase(int TeamNum);
	void BasePath(unsigned char Num);
	void SoakPause(class APawn* P);
	void SoakBots();
	bool DontReuseTaunt(int t);
	bool AutoTaunt();
	void Possess(class APawn* aPawn);
	void ShowAI();
	void LogMultiKills(float Reward, bool bEnemyKill);
	void ClientDelayedAnnouncement(class USound* AnnouncementSound, unsigned char Delay);
	void ClientDelayedAnnouncementNamed(const struct FName& Announcement, unsigned char Delay);
	void AwardAdrenaline(float Amount);
	void PostBeginPlay();
	void ClientSendStats(class ATeamPlayerReplicationInfo* PRI, int newgoals, bool bNewFirstBlood, int newKills, int newsuicides, int newFlagTouches, int newFlagReturns, int newFlakCount, int newComboCount, int newHeadCount, int newRanOverCount, int newDaredevilPoints);
	void ClientSendCombos(class ATeamPlayerReplicationInfo* PRI, unsigned char Combos0, unsigned char Combos1, unsigned char Combos2, unsigned char Combos3, unsigned char Combos4);
	void ClientSendMultiKills(class ATeamPlayerReplicationInfo* PRI, unsigned char MultiKills0, unsigned char MultiKills1, unsigned char MultiKills2, unsigned char MultiKills3, unsigned char MultiKills4, unsigned char MultiKills5, unsigned char MultiKills6);
	void ClientSendSprees(class ATeamPlayerReplicationInfo* PRI, unsigned char Spree0, unsigned char Spree1, unsigned char Spree2, unsigned char Spree3, unsigned char Spree4, unsigned char Spree5);
	void ClientSendVehicle(class ATeamPlayerReplicationInfo* PRI, class UClass* V, int Kills, int Deaths, int DeathsDriving, int i);
	void ClientSendWeapon(class ATeamPlayerReplicationInfo* PRI, class UClass* W, int Kills, int Deaths, int deathsholding, int i);
	void ServerGetNextVehicleStats(class ATeamPlayerReplicationInfo* PRI, int i);
	void ServerGetNextWeaponStats(class ATeamPlayerReplicationInfo* PRI, int i);
	void ServerUpdateStatArrays(class ATeamPlayerReplicationInfo* PRI);
	void ServerUpdateStats(class ATeamPlayerReplicationInfo* PRI);
};


// Class UnrealGame.DeathMatch
// 0x0778 (0x1240 - 0x0AC8)
class ADeathMatch : public AUnrealMPGameInfo
{
public:
	TArray<struct FAddBotInfo>                         AddBotQueue;                                              // 0x0AC8(0x000C) (NeedCtorLink)
	int                                                NetWait;                                                  // 0x0AD4(0x0004) (Config)
	int                                                NetWaitClan;                                              // 0x0AD8(0x0004) (Config)
	int                                                MinNetPlayers;                                            // 0x0ADC(0x0004)
	int                                                RestartWait;                                              // 0x0AE0(0x0004)
	unsigned long                                      bTournament : 1;                                          // 0x0AE4(0x0004)
	unsigned long                                      bAutoNumBots : 1;                                         // 0x0AE4(0x0004)
	unsigned long                                      bColoredDMSkins : 1;                                      // 0x0AE4(0x0004)
	unsigned long                                      bPlayersMustBeReady : 1;                                  // 0x0AE4(0x0004)
	unsigned long                                      bForceRespawn : 1;                                        // 0x0AE4(0x0004)
	unsigned long                                      bAdjustSkill : 1;                                         // 0x0AE4(0x0004)
	unsigned long                                      bAllowTaunts : 1;                                         // 0x0AE4(0x0004)
	unsigned long                                      bAllowTrans : 1;                                          // 0x0AE4(0x0004)
	unsigned long                                      bDefaultTranslocator : 1;                                 // 0x0AE4(0x0004)
	unsigned long                                      bOverrideTranslocator : 1;                                // 0x0AE4(0x0004)
	unsigned long                                      bWaitForNetPlayers : 1;                                   // 0x0AE4(0x0004)
	unsigned long                                      bFirstBlood : 1;                                          // 0x0AE4(0x0004)
	unsigned long                                      bQuickStart : 1;                                          // 0x0AE4(0x0004)
	unsigned long                                      bSkipPlaySound : 1;                                       // 0x0AE4(0x0004)
	unsigned long                                      bStartedCountDown : 1;                                    // 0x0AE4(0x0004)
	unsigned long                                      bFinalStartup : 1;                                        // 0x0AE4(0x0004)
	unsigned long                                      bOverTimeBroadcast : 1;                                   // 0x0AE4(0x0004)
	unsigned long                                      bEpicNames : 1;                                           // 0x0AE4(0x0004)
	unsigned long                                      bKillBots : 1;                                            // 0x0AE4(0x0004)
	unsigned long                                      bCustomBots : 1;                                          // 0x0AE4(0x0004)
	unsigned long                                      bReviewingJumpSpots : 1;                                  // 0x0AE4(0x0004)
	unsigned long                                      bAllowPlayerLights : 1;                                   // 0x0AE4(0x0004)
	unsigned long                                      bForceNoPlayerLights : 1;                                 // 0x0AE4(0x0004)
	unsigned long                                      bAlwaysShowLoginMenu : 1;                                 // 0x0AE4(0x0004) (Edit)
	unsigned long                                      GiveBotsFakeUID : 1;                                      // 0x0AE4(0x0004)
	TArray<class AVehicle*>                            Vehicles;                                                 // 0x0AE8(0x000C) (NeedCtorLink)
	unsigned long                                      bForceDefaultCharacter : 1;                               // 0x0AF4(0x0004)
	unsigned long                                      bPlayerBecameActive : 1;                                  // 0x0AF4(0x0004)
	unsigned long                                      bMustHaveMultiplePlayers : 1;                             // 0x0AF4(0x0004)
	unsigned char                                      StartupStage;                                             // 0x0AF8(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0AF9(0x0003) MISSED OFFSET
	int                                                NumRounds;                                                // 0x0AFC(0x0004)
	float                                              SpawnProtectionTime;                                      // 0x0B00(0x0004)
	int                                                DefaultMaxLives;                                          // 0x0B04(0x0004)
	int                                                LateEntryLives;                                           // 0x0B08(0x0004)
	int                                                RemainingTime;                                            // 0x0B0C(0x0004)
	int                                                ElapsedTime;                                              // 0x0B10(0x0004)
	int                                                CountDown;                                                // 0x0B14(0x0004)
	float                                              AdjustedDifficulty;                                       // 0x0B18(0x0004)
	int                                                PlayerKills;                                              // 0x0B1C(0x0004)
	int                                                PlayerDeaths;                                             // 0x0B20(0x0004)
	class UClass*                                      DMSquadClass;                                             // 0x0B24(0x0004)
	class UClass*                                      LevelRulesClass;                                          // 0x0B28(0x0004)
	class ALevelGameRules*                             LevelRules;                                               // 0x0B2C(0x0004)
	class AUnrealTeamInfo*                             EnemyRoster;                                              // 0x0B30(0x0004)
	struct FString                                     EnemyRosterName;                                          // 0x0B34(0x000C) (NeedCtorLink)
	struct FString                                     DefaultEnemyRosterClass;                                  // 0x0B40(0x000C) (NeedCtorLink)
	int                                                RemainingBots;                                            // 0x0B4C(0x0004)
	int                                                InitialBots;                                              // 0x0B50(0x0004)
	class ANavigationPoint*                            LastPlayerStartSpot;                                      // 0x0B54(0x0004)
	class ANavigationPoint*                            LastStartSpot;                                            // 0x0B58(0x0004)
	int                                                NameNumber;                                               // 0x0B5C(0x0004)
	int                                                EndMessageWait;                                           // 0x0B60(0x0004)
	int                                                EndMessageCounter;                                        // 0x0B64(0x0004) (Transient)
	struct FName                                       AltEndGameSoundName[0x2];                                 // 0x0B68(0x0004)
	int                                                SinglePlayerWait;                                         // 0x0B70(0x0004)
	struct FString                                     NamePrefixes[0xA];                                        // 0x0B74(0x000C) (NeedCtorLink)
	struct FString                                     NameSuffixes[0xA];                                        // 0x0BEC(0x000C) (NeedCtorLink)
	class AActor*                                      EndGameFocus;                                             // 0x0C64(0x0004)
	class APlayerController*                           StandalonePlayer;                                         // 0x0C68(0x0004)
	struct FString                                     DMPropsDisplayText[0xE];                                  // 0x0C6C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     DMPropDescText[0xE];                                      // 0x0D14(0x000C) (Localized, NeedCtorLink)
	struct FString                                     YouDestroyed;                                             // 0x0DBC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     YouDestroyedTrailer;                                      // 0x0DC8(0x000C) (Localized, NeedCtorLink)
	float                                              ADR_Kill;                                                 // 0x0DD4(0x0004) (Edit)
	float                                              ADR_MajorKill;                                            // 0x0DD8(0x0004) (Edit)
	float                                              ADR_MinorError;                                           // 0x0DDC(0x0004) (Edit)
	float                                              ADR_MinorBonus;                                           // 0x0DE0(0x0004) (Edit)
	float                                              ADR_KillTeamMate;                                         // 0x0DE4(0x0004) (Edit)
	struct FString                                     EpicNames[0x15];                                          // 0x0DE8(0x000C) (NeedCtorLink)
	struct FString                                     MaleBackupNames[0x20];                                    // 0x0EE4(0x000C) (NeedCtorLink)
	struct FString                                     FemaleBackupNames[0x20];                                  // 0x1064(0x000C) (NeedCtorLink)
	int                                                EpicOffset;                                               // 0x11E4(0x0004)
	int                                                TotalEpic;                                                // 0x11E8(0x0004)
	int                                                MaleBackupNameOffset;                                     // 0x11EC(0x0004)
	int                                                FemaleBackupNameOffset;                                   // 0x11F0(0x0004)
	struct FString                                     LoginMenuClass;                                           // 0x11F4(0x000C) (Edit, Config, NeedCtorLink)
	TArray<struct FString>                             DMHints;                                                  // 0x1200(0x000C) (Edit, Localized, NeedCtorLink)
	float                                              InventoryListLastTime;                                    // 0x120C(0x0004)
	int                                                StartPlayerNum;                                           // 0x1210(0x0004)
	struct FName                                       VoiceTimesUp;                                             // 0x1214(0x0004)
	struct FString                                     sndModeName;                                              // 0x1218(0x000C) (NeedCtorLink)
	struct FString                                     sndModeExplain;                                           // 0x1224(0x000C) (NeedCtorLink)
	TArray<class APawn*>                               InventoryList;                                            // 0x1230(0x000C) (NeedCtorLink)
	unsigned long                                      SendMatchOverEndState : 1;                                // 0x123C(0x0004)
	unsigned long                                      SendMatchOverState : 1;                                   // 0x123C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.DeathMatch");
		return ptr;
	}


	void PermitWeaponChangeInSpecialMode();
	void AnnounceSentryGun(class AController* Caller);
	void AnnounceUAV(class AController* Caller);
	void AnnounceHelicopter(class AController* Caller);
	void AnnounceArtillery(class AController* Caller);
	TArray<struct FString> STATIC_GetAllLoadHints(bool bThisClassOnly);
	struct FString STATIC_GetNextLoadHint(const struct FString& MapName);
	void SetGrammar();
	void STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds);
	bool WantsPickups(class ABot* B);
	void EndSpree(class AController* Killer, class AController* Other);
	void NotifySpree(class AController* Other, int Num);
	struct FString STATIC_GetDescriptionText(const struct FString& PropName);
	struct FString STATIC_GetDisplayText(const struct FString& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	bool STATIC_AcceptPlayInfoProperty(const struct FString& PropertyName);
	void ReviewJumpSpots(const struct FName& TestLabel);
	void addaistrike(int Num);
	void addaifire(const struct FString& Num, const struct FString& Team);
	void addai(const struct FString& Num, const struct FString& Team);
	void addaibot(const struct FString& Num, const struct FString& Team, const struct FString& Grade, const struct FString& NPCID);
	void AddwAIBot(const struct FString& strNum, const struct FString& strTeam, const struct FString& aiClass, const struct FString& strGrade, const struct FString& strNPCID, const struct FString& strRegenLocationIndex, class AController* callerController, bool bUseDynamicRegenLocation, const struct FVector& v3DynamicRegenLocation, bool bUseFakeID);
	bool rfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID);
	void HandleGetBotID(int Team, TArray<int> BotID);
	void EnqueueAddBot(class UClass* BotClass, class AController* callerController, int Team, int Grade, int NPCID, int iRegenLocationIndex, bool bUseDynamicRegenLocation, const struct FVector& v3DynamicRegenLocation);
	void Killaibots(int Num);
	void Kill(class AController* C);
	void KillBots(int Num);
	void AddBots(int Num);
	void AddNamedBot(const struct FString& botname);
	void dobalancebots();
	void setFakeUID();
	int ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum);
	void AdjustSkill(class AAIController* B, class APlayerController* P, bool bWinner);
	void ScoreKill(class AController* Killer, class AController* Other);
	void ScoreObjective(class APlayerReplicationInfo* Scorer, float Score);
	void CheckScore(class APlayerReplicationInfo* Scorer);
	bool CheckMaxLives(class APlayerReplicationInfo* Scorer);
	float RatePlayerStart(class ANavigationPoint* N, unsigned char Team, class AController* Player);
	bool CheckLives(class APlayerReplicationInfo* Scorer);
	void ChangeHostExtraWork();
	void GetUserBackToVehicle();
	void ContinueMatch();
	void RecoverHelicopter(class APawn* P);
	void OnKillingDropOut(class APawn* P);
	void CalcItemUsedTimeAll();
	void ForcedStartMatch();
	void UpdateVehicles();
	void ProcessDefaultInv();
	void GameAddDefaultInventory(class APawn* P);
	void AnnounceTimesUp();
	int GetNetWait();
	void PlayStartupMessage();
	void PlayEndOfMatchMessage();
	class ANavigationPoint* FindPlayerStart_TU(class AController* Player, unsigned char inTeam, const struct FString& incomingName);
	class ANavigationPoint* FindPlayerStart(class AController* Player, unsigned char inTeam, const struct FString& incomingName);
	void SetGameEndType(const struct FString& Reason);
	void EndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason);
	void AnnounceMatchInfo();
	void BalanceBots();
	void StartMatch();
	class AUnrealTeamInfo* FindTeamFor(class AController* C);
	void InitPlacedBot(class AController* C, class URosterEntry* R);
	void InitializeBot(class ABot* NewBot, class AUnrealTeamInfo* BotTeam, class URosterEntry* Chosen);
	class ABot* SpawnBot(const struct FString& botname);
	void PreLoadBot();
	void PreLoadNamedBot(const struct FString& botname);
	class AUnrealTeamInfo* GetBotTeam2(bool forceTeam, int Team);
	class AUnrealTeamInfo* GetBotTeam(int TeamBots);
	void InitTeamSymbols();
	void InitGameReplicationInfo();
	void GetServerDetails(struct FServerResponseLine* ServerState);
	bool NeedPlayers();
	void Logout(class AController* Exiting);
	bool AllowBecomeActivePlayer(class APlayerController* P);
	bool BecomeSpectator(class APlayerController* P);
	void ChangeName(class AController* Other, const struct FString& S, bool bNameChange);
	bool ShouldRespawn(class APickup* Other);
	bool CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget);
	void AddDefaultInventory(class APawn* PlayerPawn);
	bool AddBot(const struct FString& botname);
	void ForceAddBot();
	bool TooManyBots(class AController* botToRemove);
	void RestartPlayer(class AController* aPlayer);
	void ChangeLoadOut(class APlayerController* P, const struct FString& LoadoutName);
	void PostLogin(class APlayerController* NewPlayer);
	class APlayerController* Login(const struct FString& Portal, const struct FString& Options, struct FString* Error);
	bool AtCapacity(bool bSpectator);
	void PlayWinMessage(class APlayerController* Player, bool bWinner);
	bool CheckEndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason);
	bool CheckEndGameCondition();
	void AcceptInventory(class APawn* PlayerPawn);
	int GetMinPlayers();
	void TweakSkill(class ABot* B);
	void InitGame(const struct FString& Options, struct FString* Error);
	void AddGameSpecificInventory(class APawn* P);
	bool AllowTransloc();
	bool STATIC_NeverAllowTransloc();
	void InitLogging();
	int VehicleScoreKill(class AController* Killer, class AController* Killed, class AVehicle* DestroyedVehicle, struct FString* KillInfo);
	void Killed(class AController* Killer, class AController* Killed, class APawn* KilledPawn, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void CheckReady();
	bool JustStarted(float t);
	void Reset();
	void OverrideInitialBots();
	void PostBeginPlay();
	void PreBeginPlay();
	int GetTimeSecondsLeft();
	void SendBgmMessageBeginMatch();
};


// Class UnrealGame.JumpSpot
// 0x0070 (0x05B8 - 0x0548)
class AJumpSpot : public AJumpDest
{
public:
	unsigned long                                      bOnlyTranslocator : 1;                                    // 0x0548(0x0004) (Edit)
	unsigned long                                      bRealOnlyTranslocator : 1;                                // 0x0548(0x0004)
	unsigned long                                      bNeverImpactJump : 1;                                     // 0x0548(0x0004) (Edit)
	unsigned long                                      bNoLowGrav : 1;                                           // 0x0548(0x0004) (Edit)
	unsigned long                                      bForceAllowDoubleJumping : 1;                             // 0x0548(0x0004) (Edit)
	unsigned long                                      bDodgeUp : 1;                                             // 0x0548(0x0004) (Edit)
	struct FName                                       TranslocTargetTag;                                        // 0x054C(0x0004) (Edit)
	float                                              TranslocZOffset;                                          // 0x0550(0x0004) (Edit)
	class AActor*                                      TranslocTarget;                                           // 0x0554(0x0004)
	struct FVector                                     CachedSpeed[0x8];                                         // 0x0558(0x000C)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.JumpSpot");
		return ptr;
	}


	bool TryTranslocator(class APawn* Other);
	bool SuggestMovePreparation(class APawn* Other);
	int SpecialCost(class APawn* Other, class UReachSpec* Path);
	float EffectiveDoubleJump(class UReachSpec* Path);
	bool CanDoubleJump(class APawn* Other);
	bool CanMakeJump(class APawn* Other, float JumpHeight, float GroundSpeed, int Num, class AActor* Start, bool bForceCheck);
	void PostBeginPlay();
};


// Class UnrealGame.UnrealScriptedSequence
// 0x0028 (0x041C - 0x03F4)
class AUnrealScriptedSequence : public AScriptedSequence
{
public:
	class AUnrealScriptedSequence*                     EnemyAcquisitionScript;                                   // 0x03F4(0x0004)
	class AController*                                 CurrentUser;                                              // 0x03F8(0x0004)
	class AUnrealScriptedSequence*                     NextScript;                                               // 0x03FC(0x0004)
	unsigned long                                      bFirstScript : 1;                                         // 0x0400(0x0004)
	unsigned long                                      bSniping : 1;                                             // 0x0400(0x0004) (Edit)
	unsigned long                                      bDontChangeScripts : 1;                                   // 0x0400(0x0004) (Edit)
	unsigned long                                      bFreelance : 1;                                           // 0x0400(0x0004)
	unsigned long                                      bRoamingScript : 1;                                       // 0x0400(0x0004) (Edit)
	unsigned long                                      bAvoid : 1;                                               // 0x0400(0x0004)
	unsigned long                                      bDisabled : 1;                                            // 0x0400(0x0004)
	unsigned long                                      bNotInVehicle : 1;                                        // 0x0400(0x0004) (Edit)
	unsigned char                                      Priority;                                                 // 0x0404(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0405(0x0003) MISSED OFFSET
	struct FName                                       EnemyAcquisitionScriptTag;                                // 0x0408(0x0004) (Edit)
	float                                              EnemyAcquisitionScriptProbability;                        // 0x040C(0x0004) (Edit)
	struct FName                                       SnipingVolumeTag;                                         // 0x0410(0x0004) (Edit)
	class UClass*                                      WeaponPreference;                                         // 0x0414(0x0004) (Edit)
	float                                              NumChecked;                                               // 0x0418(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealScriptedSequence");
		return ptr;
	}


	bool HigherPriorityThan(class AUnrealScriptedSequence* S, class ABot* B);
	void BeginPlay();
	bool CheckForErrors();
	void FreeScript();
	void Reset();
};


// Class UnrealGame.HoldSpot
// 0x0004 (0x0420 - 0x041C)
class AHoldSpot : public AUnrealScriptedSequence
{
public:
	class AVehicle*                                    HoldVehicle;                                              // 0x041C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.HoldSpot");
		return ptr;
	}


	void FreeScript();
	class AActor* GetMoveTarget();
};


// Class UnrealGame.TeamGame
// 0x039C (0x15DC - 0x1240)
class ATeamGame : public ADeathMatch
{
public:
	unsigned long                                      bBalanceTeams : 1;                                        // 0x1240(0x0004)
	unsigned long                                      bPlayersBalanceTeams : 1;                                 // 0x1240(0x0004)
	unsigned long                                      bAllowNonTeamChat : 1;                                    // 0x1240(0x0004)
	unsigned long                                      bScoreTeamKills : 1;                                      // 0x1240(0x0004)
	unsigned long                                      bSpawnInTeamArea : 1;                                     // 0x1240(0x0004)
	unsigned long                                      bScoreVictimsTarget : 1;                                  // 0x1240(0x0004)
	float                                              FriendlyFireScale;                                        // 0x1244(0x0004)
	int                                                MaxTeamSize;                                              // 0x1248(0x0004)
	float                                              TeammateBoost;                                            // 0x124C(0x0004)
	class AUnrealTeamInfo*                             Teams[0x2];                                               // 0x1250(0x0004)
	struct FString                                     BlueTeamName;                                             // 0x1258(0x000C) (NeedCtorLink)
	struct FString                                     RedTeamName;                                              // 0x1264(0x000C) (NeedCtorLink)
	class UClass*                                      TeamAIType[0x2];                                          // 0x1270(0x0004)
	struct FString                                     PathWhisps[0x2];                                          // 0x1278(0x000C) (NeedCtorLink)
	struct FString                                     NearString;                                               // 0x1290(0x000C) (Localized, NeedCtorLink)
	struct FString                                     BareHanded;                                               // 0x129C(0x000C) (Localized, NeedCtorLink)
	struct FName                                       CaptureSoundName[0x2];                                    // 0x12A8(0x0004)
	struct FName                                       TakeLeadName[0x2];                                        // 0x12B0(0x0004)
	struct FName                                       IncreaseLeadName[0x2];                                    // 0x12B8(0x0004)
	struct FString                                     TGPropsDisplayText[0x5];                                  // 0x12C0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TGPropDescText[0x5];                                      // 0x12FC(0x000C) (Localized, NeedCtorLink)
	TArray<struct FString>                             TGHints;                                                  // 0x1338(0x000C) (Edit, Localized, NeedCtorLink)
	float                                              ADR_Goal;                                                 // 0x1344(0x0004) (Edit)
	float                                              ADR_Return;                                               // 0x1348(0x0004) (Edit)
	float                                              ADR_Control;                                              // 0x134C(0x0004) (Edit)
	class UTexture*                                    TempSymbols[0x2];                                         // 0x1350(0x0004)
	float                                              LastEndGameTauntTime;                                     // 0x1358(0x0004)
	struct FString                                     EndGameComments[0xA];                                     // 0x135C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EndGameTaunts[0xA];                                       // 0x13D4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EndGameVictoryRemarks[0xA];                               // 0x144C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EndGameLossRemarks[0xA];                                  // 0x14C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EndGameResponses[0xA];                                    // 0x153C(0x000C) (Localized, NeedCtorLink)
	unsigned char                                      EndGameCommented[0xA];                                    // 0x15B4(0x0001)
	unsigned char                                      EndGameRemark[0xA];                                       // 0x15BE(0x0001)
	int                                                LastEndGameComment;                                       // 0x15C8(0x0004)
	int                                                LastEndGameRemark;                                        // 0x15CC(0x0004)
	int                                                LastEndGameResponse;                                      // 0x15D0(0x0004)
	int                                                iCurWinningTeam;                                          // 0x15D4(0x0004)
	unsigned long                                      bAnnouncedAlmostWinningTeam : 1;                          // 0x15D8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamGame");
		return ptr;
	}


	void EndGameTauntFor(class ABot* B);
	void EndGameCommentFor(class ABot* B);
	bool PickEndGameTauntFor(class ABot* B);
	void WeakObjectives();
	TArray<struct FString> STATIC_GetAllLoadHints(bool bThisClassOnly);
	void PostLogin(class APlayerController* NewPlayer);
	void InitVoiceReplicationInfo();
	void AnnounceScore(int ScoringTeam);
	bool STATIC_AcceptPlayInfoProperty(const struct FString& PropertyName);
	struct FString STATIC_GetDescriptionText(const struct FString& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	void FindNewObjectives(class AGameObjective* DisabledObjective);
	struct FString STATIC_ParseMessageString(class AMutator* BaseMutator, class AController* Who, const struct FString& Message);
	struct FString STATIC_FindTeamDesignation(class AGameReplicationInfo* GRI, class AActor* A);
	struct FString STATIC_ParseChatPercVar(class AMutator* BaseMutator, class AController* Who, const struct FString& Cmd);
	void PlayEndOfMatchMessage();
	bool TooManyBots(class AController* botToRemove);
	bool SameTeam(class AController* A, class AController* B);
	int ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum);
	void SetTeamAssistPoint(class AController* Killer, class AController* Other);
	void ScoreKill(class AController* Killer, class AController* Other);
	bool NearGoal(class AController* C);
	class APawn* FindVictimsTarget(class AController* Other);
	bool CriticalPlayer(class AController* Other);
	void AnnounceAlmostWinningTeam();
	void AnnounceEndingWinningTeam();
	void AnnounceWinningTeam();
	void CheckScore(class APlayerReplicationInfo* Scorer);
	float RatePlayerStart(class ANavigationPoint* N, unsigned char Team, class AController* Player);
	bool ChangeTeam(class AController* Other, int iTeamID, bool bNewTeam);
	int GetTeamID_by_Balancing(int iTeamID, class AController* C);
	class AUnrealTeamInfo* FindTeamFor(class AController* C);
	class AUnrealTeamInfo* GetBotTeam2(bool forceTeam, int Team);
	class AUnrealTeamInfo* GetBotTeam(int TeamBots);
	void GetServerDetails(struct FServerResponseLine* ServerState);
	bool CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget);
	void SetEndGameFocus(class APlayerReplicationInfo* Winner);
	bool CheckEndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason);
	void IncrementGoalsScored(class APlayerReplicationInfo* PRI);
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	void RestartPlayer(class AController* aPlayer);
	void ShowPathTo(class APlayerController* P, int TeamNum);
	bool CanShowPathTo(class APlayerController* P, int TeamNum);
	int GetMinPlayers();
	void InitTeamSymbols();
	void InitGame(const struct FString& Options, struct FString* Error);
	class AUnrealTeamInfo* GetRedTeam(int TeamBots);
	class AUnrealTeamInfo* GetBlueTeam(int TeamBots);
	void PreLoadBot();
	void PreLoadNamedBot(const struct FString& botname);
	void OverrideInitialBots();
	class ATeamInfo* OtherTeam(class ATeamInfo* Requester);
	bool CheckMaxLives(class APlayerReplicationInfo* Scorer);
	void UpdateAnnouncements();
	void STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds);
	int BallCarrierMessage();
	int GetStatus(class APlayerController* Sender, class ABot* B);
	void ParseVoiceCommand(class APlayerController* Sender, const struct FString& RecognizedString);
	void ParseRecipients(int* RecipientIDs, int* NumRecipients, struct FString* OrderString);
	int ParseRecipient(const struct FString& Recipient);
	bool ApplyOrder(class APlayerController* Sender, int RecipientID, int OrderID);
	int ParseOrder(const struct FString& OrderString);
	void StartMatch();
	TArray<int> GetTeamScores();
	class UClass* GetWaitViewClass(unsigned char Team);
	void SetGrammar();
	void PostBeginPlay();
};


// Class UnrealGame.GameObjective
// 0x0118 (0x06D0 - 0x05B8)
class AGameObjective : public AJumpSpot
{
public:
	float                                              DrawDistThresHold;                                        // 0x05B8(0x0004) (Edit)
	unsigned long                                      bUsePriorityOnHUD : 1;                                    // 0x05BC(0x0004) (Edit)
	unsigned long                                      bOverrideZoneCheck : 1;                                   // 0x05BC(0x0004) (Edit)
	unsigned long                                      bOverrideVisibilityCheck : 1;                             // 0x05BC(0x0004) (Edit)
	unsigned long                                      bReplicateObjective : 1;                                  // 0x05BC(0x0004) (Edit)
	unsigned long                                      bAnnounceNextObjective : 1;                               // 0x05BC(0x0004) (Edit)
	unsigned long                                      bMustBoardVehicleFirst : 1;                               // 0x05BC(0x0004) (Edit)
	unsigned long                                      bBotOnlyObjective : 1;                                    // 0x05BC(0x0004) (Edit)
	unsigned long                                      bInitiallyActive : 1;                                     // 0x05BC(0x0004) (Edit)
	unsigned long                                      bActive : 1;                                              // 0x05BC(0x0004) (Net)
	unsigned long                                      bTriggerOnceOnly : 1;                                     // 0x05BC(0x0004) (Edit)
	unsigned long                                      bOptionalObjective : 1;                                   // 0x05BC(0x0004) (Edit)
	unsigned long                                      bIgnoredObjective : 1;                                    // 0x05BC(0x0004)
	unsigned long                                      bDisabled : 1;                                            // 0x05BC(0x0004) (Net)
	unsigned long                                      bOldDisabled : 1;                                         // 0x05BC(0x0004)
	unsigned long                                      bFirstObjective : 1;                                      // 0x05BC(0x0004)
	unsigned long                                      bTeamControlled : 1;                                      // 0x05BC(0x0004) (Edit)
	unsigned long                                      bAccruePoints : 1;                                        // 0x05BC(0x0004) (Edit)
	unsigned long                                      bHasShootSpots : 1;                                       // 0x05BC(0x0004)
	unsigned long                                      bSoundsPrecached : 1;                                     // 0x05BC(0x0004)
	unsigned long                                      bIsCritical : 1;                                          // 0x05BC(0x0004) (Net)
	unsigned long                                      bHighlightPhysicalObjective : 1;                          // 0x05BC(0x0004) (Net)
	unsigned long                                      bOldHighlightPhysicalObjective : 1;                       // 0x05BC(0x0004)
	unsigned long                                      bIsBeingAttacked : 1;                                     // 0x05BC(0x0004)
	unsigned long                                      bClearInstigator : 1;                                     // 0x05BC(0x0004)
	unsigned long                                      bOldCritical : 1;                                         // 0x05BC(0x0004)
	unsigned long                                      bPlayCriticalAssaultAlarm : 1;                            // 0x05BC(0x0004) (Edit)
	unsigned char                                      DefenderTeamIndex;                                        // 0x05C0(0x0001) (Edit, Net)
	unsigned char                                      StartTeam;                                                // 0x05C1(0x0001)
	unsigned char                                      DefensePriority;                                          // 0x05C2(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x1];                                       // 0x05C3(0x0001) MISSED OFFSET
	int                                                Score;                                                    // 0x05C4(0x0004) (Edit)
	struct FName                                       DefenseScriptTags;                                        // 0x05C8(0x0004) (Edit)
	class AUnrealScriptedSequence*                     DefenseScripts;                                           // 0x05CC(0x0004)
	struct FString                                     ObjectiveName;                                            // 0x05D0(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     DestructionMessage;                                       // 0x05DC(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     LocationPrefix;                                           // 0x05E8(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     LocationPostfix;                                          // 0x05F4(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     ObjectiveStringPrefix;                                    // 0x0600(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ObjectiveStringSuffix;                                    // 0x060C(0x000C) (Localized, NeedCtorLink)
	class AGameObjective*                              NextObjective;                                            // 0x0618(0x0004)
	class ASquadAI*                                    DefenseSquad;                                             // 0x061C(0x0004)
	class AAssaultPath*                                AlternatePaths;                                           // 0x0620(0x0004)
	struct FName                                       AreaVolumeTag;                                            // 0x0624(0x0004) (Edit)
	class AVolume*                                     MyBaseVolume;                                             // 0x0628(0x0004)
	float                                              BaseExitTime;                                             // 0x062C(0x0004) (Edit)
	float                                              BaseRadius;                                               // 0x0630(0x0004) (Edit)
	float                                              BotDamageScaling;                                         // 0x0634(0x0004) (Edit)
	struct FName                                       CriticalObjectiveVolumeTag;                               // 0x0638(0x0004) (Edit)
	class UMaterial*                                   ObjectiveTypeIcon;                                        // 0x063C(0x0004) (Edit)
	unsigned char                                      ObjectivePriority;                                        // 0x0640(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0641(0x0003) MISSED OFFSET
	float                                              LastDrawTime;                                             // 0x0644(0x0004)
	float                                              DrawTime;                                                 // 0x0648(0x0004)
	struct FString                                     ObjectiveDescription;                                     // 0x064C(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Objective_Info_Attacker;                                  // 0x0658(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Objective_Info_Defender;                                  // 0x0664(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     UseDescription;                                           // 0x0670(0x000C) (Localized, NeedCtorLink)
	class APlayerReplicationInfo*                      DisabledBy;                                               // 0x067C(0x0004)
	class UMaterial*                                   HighlightOverlay[0x2];                                    // 0x0680(0x0004)
	TArray<class AActor*>                              PhysicalObjectiveActors;                                  // 0x0688(0x000C) (NeedCtorLink)
	struct FName                                       PhysicalObjectiveActorsTag;                               // 0x0694(0x0004) (Edit)
	struct FName                                       EndCameraTag;                                             // 0x0698(0x0004) (Edit)
	class AActor*                                      EndCamera;                                                // 0x069C(0x0004)
	class AController*                                 DelayedDamageInstigatorController;                        // 0x06A0(0x0004)
	struct FName                                       VehiclePathName;                                          // 0x06A4(0x0004) (Edit)
	class ANavigationPoint*                            VehiclePath;                                              // 0x06A8(0x0004)
	int                                                ObjectiveDisabledTime;                                    // 0x06AC(0x0004) (Net)
	float                                              SavedObjectiveProgress;                                   // 0x06B0(0x0004) (Net)
	TArray<struct FScorerRecord>                       Scorers;                                                  // 0x06B4(0x000C) (NeedCtorLink)
	struct FString                                     ApplyGameInfo;                                            // 0x06C0(0x000C) (NeedCtorLink)
	unsigned long                                      bCanActive : 1;                                           // 0x06CC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.GameObjective");
		return ptr;
	}


	void SetTeam(unsigned char TeamIndex);
	void AwardAssaultScore(int Score);
	void ShareScore(int Score, const struct FString& EventDesc);
	void AddScorer(class AController* C, float Pct);
	void UpdatePrecacheMaterials();
	float GetObjectiveProgress();
	void SetObjectiveOverlay(bool bShow);
	void PostNetReceive();
	void HighlightPhysicalObjective(bool bShow);
	void PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds);
	void Trigger(class AActor* Other, class APawn* Instigator);
	void CheckPlayCriticalAlarm();
	void SetCriticalStatus(bool bNewCriticalStatus);
	bool IsCritical();
	bool IsActive();
	void SetActive(bool bActiveStatus);
	void Reset();
	bool BetterObjectiveThan(class AGameObjective* Best, unsigned char DesiredTeamNum, unsigned char RequesterTeamNum);
	void PlayDestructionMessage();
	void DisableObjective(class APawn* Instigator);
	void CompleteObjective(class APawn* Instigator);
	int GetNumDefenders();
	bool TellBotHowToDisable(class ABot* B);
	struct FString GetHumanReadableName();
	bool OwnsDefenseScript(class AUnrealScriptedSequence* S);
	void Timer();
	bool NearObjective(class APawn* P);
	bool BotNearObjective(class ABot* B);
	void PlayAlarm();
	void UpdateLocationName();
	void ForceBegin();
	void PostBeginPlay();
	void PreBeginPlay();
	bool CanDoubleJump(class APawn* Other);
	float GetDifficulty();
};


// Class UnrealGame.DestroyableObjective
// 0x0044 (0x0714 - 0x06D0)
class ADestroyableObjective : public AGameObjective
{
public:
	TEnumAsByte<EConstraintInstigator>                 ConstraintInstigator;                                     // 0x06D0(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x06D1(0x0003) MISSED OFFSET
	class UClass*                                      ConstraintPawnClass;                                      // 0x06D4(0x0004) (Edit)
	int                                                DamageCapacity;                                           // 0x06D8(0x0004) (Edit)
	struct FName                                       TakeDamageEvent;                                          // 0x06DC(0x0004) (Edit)
	int                                                DamageEventThreshold;                                     // 0x06E0(0x0004) (Edit)
	int                                                AccumulatedDamage;                                        // 0x06E4(0x0004)
	int                                                Health;                                                   // 0x06E8(0x0004) (Net)
	float                                              LinkHealMult;                                             // 0x06EC(0x0004)
	float                                              VehicleDamageScaling;                                     // 0x06F0(0x0004) (Edit)
	struct FVector                                     AIShootOffset;                                            // 0x06F4(0x000C) (Edit)
	class AShootTarget*                                ShootTarget;                                              // 0x0700(0x0004)
	unsigned long                                      bCanDefenderDamage : 1;                                   // 0x0704(0x0004) (Edit)
	unsigned long                                      bReplicateHealth : 1;                                     // 0x0704(0x0004)
	unsigned long                                      bMonitorUnderAttack : 1;                                  // 0x0704(0x0004)
	unsigned long                                      bIsUnderAttack : 1;                                       // 0x0704(0x0004) (Net)
	class AVolumeTimer*                                UnderAttackTimer;                                         // 0x0708(0x0004)
	float                                              LastDamageTime;                                           // 0x070C(0x0004)
	float                                              LastWarnTime;                                             // 0x0710(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.DestroyableObjective");
		return ptr;
	}


	float GetObjectiveProgress();
	bool IsCritical();
	void TimerPop(class AVolumeTimer* t);
	void DisableObjective(class APawn* Instigator);
	bool HealDamage(int Amount, class AController* Healer, class UClass* DamageType);
	void AwardAssaultScore(int Score);
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void Reset();
	bool TellBotHowToHeal(class ABot* B);
	bool NearObjective(class APawn* P);
	bool TellBotHowToDisable(class ABot* B);
	bool LegitimateTargetOf(class ABot* B);
	bool KillEnemyFirst(class ABot* B);
	class AActor* GetShootTarget();
	bool TeamLink(int TeamNum);
	void Destroyed();
	void SetDelayedDamageInstigatorController(class AController* C);
	int SpecialCost(class APawn* Other, class UReachSpec* Path);
	void PostBeginPlay();
};


// Class UnrealGame.RestingFormation
// 0x01C4 (0x05F0 - 0x042C)
class ARestingFormation : public AInfo
{
public:
	class ABot*                                        Occupant[0x10];                                           // 0x042C(0x0004)
	struct FVector                                     offset[0x10];                                             // 0x046C(0x000C)
	struct FVector                                     LookDir[0x10];                                            // 0x052C(0x000C)
	float                                              FormationSize;                                            // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.RestingFormation");
		return ptr;
	}


	struct FVector GetViewPointFor(class ABot* B, int pos);
	struct FVector GetLocationFor(int pos, class ABot* B);
	int RecommendPositionFor(class ABot* B);
	bool SetFormation(class ABot* B, int pos, bool bFullCheck);
	void LeaveFormation(class ABot* B);
};


// Class UnrealGame.UnrealTeamInfo
// 0x00C4 (0x0554 - 0x0490)
class AUnrealTeamInfo : public ATeamInfo
{
public:
	class URosterEntry*                                DefaultRosterEntry;                                       // 0x0490(0x0004) (Edit)
	TArray<class URosterEntry*>                        Roster;                                                   // 0x0494(0x000C) (Edit, ExportObject, NeedCtorLink, EditInline)
	class UClass*                                      AllowedTeamMembers[0x20];                                 // 0x04A0(0x0004) (Edit)
	unsigned char                                      TeamAlliance;                                             // 0x0520(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0521(0x0003) MISSED OFFSET
	int                                                DesiredTeamSize;                                          // 0x0524(0x0004)
	class ATeamAI*                                     AI;                                                       // 0x0528(0x0004)
	struct FColor                                      HudTeamColor;                                             // 0x052C(0x0004)
	struct FString                                     TeamSymbolName;                                           // 0x0530(0x000C) (NeedCtorLink)
	TArray<struct FString>                             RosterNames;                                              // 0x053C(0x000C) (NeedCtorLink)
	float                                              CurrentObjectiveProgress;                                 // 0x0548(0x0004)
	int                                                LastObjectiveTime;                                        // 0x054C(0x0004)
	int                                                ObjectivesDisabledCount;                                  // 0x0550(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealTeamInfo");
		return ptr;
	}


	void RemoveFromTeam(class AController* Other);
	void SetBotOrders(class ABot* NewBot, class URosterEntry* R);
	bool BelongsOnTeam(class UClass* PawnClass);
	bool AddToTeam(class AController* Other);
	class URosterEntry* GetNamedBot(const struct FString& botname);
	class URosterEntry* GetNextBot(const struct FString& botname);
	void AddNamedBot(const struct FString& botname);
	void AddRandomPlayer();
	bool AlreadyExistsEntry(const struct FString& CharacterName, bool bNoRecursion);
	class URosterEntry* GetRandomPlayer();
	class URosterEntry* ChooseBotClass(const struct FString& botname);
	bool NeedsBotMoreThan(class AUnrealTeamInfo* t);
	class UClass* NextLoadOut(class UClass* CurrentLoadout);
	void FillPlayerTeam(class UGameProfile* G);
	void Initialize(int TeamBots);
	bool AllBotsSpawned();
	int OverrideInitialBots(int N, class AUnrealTeamInfo* t);
	void Reset();
};


// Class UnrealGame.ShootTarget
// 0x0014 (0x03EC - 0x03D8)
class AShootTarget : public ALookTarget
{
public:
	struct FString                                     FmodOnTargetSound;                                        // 0x03D8(0x000C) (Edit, NeedCtorLink)
	class USound*                                      OnTargetSound;                                            // 0x03E4(0x0004) (Edit)
	unsigned long                                      bEnabled : 1;                                             // 0x03E8(0x0004)
	unsigned long                                      bTriggered : 1;                                           // 0x03E8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.ShootTarget");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
};


// Class UnrealGame.ProximityObjective
// 0x0004 (0x06D4 - 0x06D0)
class AProximityObjective : public AGameObjective
{
public:
	class UClass*                                      ConstraintPawnClass;                                      // 0x06D0(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.ProximityObjective");
		return ptr;
	}


	bool TellBotHowToDisable(class ABot* B);
	void SetActive(bool bActiveStatus);
	class APawn* FindInstigator(class APawn* Other);
	bool IsRelevant(class APawn* P, bool bAliveCheck);
	void Touch(class AActor* Other);
};


// Class UnrealGame.HoldObjective
// 0x0038 (0x070C - 0x06D4)
class AHoldObjective : public AProximityObjective
{
public:
	struct FName                                       MoverTag;                                                 // 0x06D4(0x0004) (Edit)
	TArray<class AMover*>                              LinkedMover;                                              // 0x06D8(0x000C) (NeedCtorLink)
	TArray<struct FTouchingPlayer>                     TouchingPlayers;                                          // 0x06E4(0x000C) (NeedCtorLink)
	class AController*                                 LastPlayerTouching;                                       // 0x06F0(0x0004)
	TArray<class AActor*>                              Touchers;                                                 // 0x06F4(0x000C) (NeedCtorLink)
	float                                              TotalHeldTime;                                            // 0x0700(0x0004)
	unsigned long                                      bIsHeld : 1;                                              // 0x0704(0x0004) (Net)
	unsigned long                                      bIsTriggerControl : 1;                                    // 0x0704(0x0004)
	unsigned long                                      bLocationFX : 1;                                          // 0x0704(0x0004) (Edit)
	class AEmitter*                                    LocationFX;                                               // 0x0708(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.HoldObjective");
		return ptr;
	}


	void UpdatePrecacheMaterials();
	void SetObjectiveOverlay(bool bShow);
	bool IsCritical();
	float GetObjectiveProgress();
	void Reset();
	void CompleteObjective(class APawn* Instigator);
	void Trigger(class AActor* Other, class APawn* Instigator);
	void AwardAssaultScore(int Score);
	void RemoveTouchingPlayer(class AController* C);
	void AddNewTouchingPlayer(class AController* C);
	void PlayerToucherDied(class APawn* P);
	void UnTouch(class AActor* Other);
	void Touch(class AActor* Other);
	bool TellBotHowToDisable(class ABot* B);
	void PostBeginPlay();
};


// Class UnrealGame.TeamAI
// 0x008C (0x04B8 - 0x042C)
class ATeamAI : public AInfo
{
public:
	class AUnrealTeamInfo*                             Team;                                                     // 0x042C(0x0004)
	class AUnrealTeamInfo*                             EnemyTeam;                                                // 0x0430(0x0004)
	int                                                NumSupportingPlayer;                                      // 0x0434(0x0004)
	class AGameObjective*                              Objectives;                                               // 0x0438(0x0004)
	class AGameObjective*                              PickedObjective;                                          // 0x043C(0x0004)
	class ASquadAI*                                    Squads;                                                   // 0x0440(0x0004)
	class ASquadAI*                                    AttackSquad;                                              // 0x0444(0x0004)
	class ASquadAI*                                    FreelanceSquad;                                           // 0x0448(0x0004)
	class UClass*                                      SquadType;                                                // 0x044C(0x0004)
	int                                                OrderOffset;                                              // 0x0450(0x0004)
	struct FName                                       OrderList[0x8];                                           // 0x0454(0x0004)
	class APickup*                                     SuperPickups[0x10];                                       // 0x0474(0x0004)
	int                                                NumSuperPickups;                                          // 0x04B4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamAI");
		return ptr;
	}


	void RemoveFromTeam(class AController* Other);
	void CallForHelp(class ABot* B);
	void SetOrders(class ABot* B, const struct FName& NewOrders, class AController* OrderGiver);
	void SetBotOrders(class ABot* NewBot, class URosterEntry* R);
	void PutOnFreelance(class ABot* B);
	void PutOnOffense(class ABot* B);
	bool PutOnDefense(class ABot* B);
	class AGameObjective* GetPriorityFreelanceObjective();
	class AGameObjective* GetPriorityAttackObjectiveFor(class ASquadAI* AttackSquad);
	class AGameObjective* GetPriorityAttackObjective();
	class AGameObjective* GetMostDefendedObjective();
	class AGameObjective* GetLeastDefendedObjective();
	class ASquadAI* AddSquadWithLeader(class AController* C, class AGameObjective* o);
	void PutBotOnSquadLedBy(class AController* C, class ABot* B);
	class ASquadAI* AddHumanSquad();
	class ASquadAI* FindHumanSquad();
	void SetObjectiveLists();
	bool FriendlyToward(class APawn* Other);
	class ASquadAI* FindSquadOf(class AController* C);
	bool OnThisTeam(class APawn* Other);
	void RemoveSquad(class ASquadAI* Squad);
	void FindNewObjectiveFor(class ASquadAI* S, bool bForceUpdate);
	void FindNewObjectives(class AGameObjective* DisabledObjective);
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	void ReAssessStrategy();
	class ASquadAI* GetSquadLedBy(class AController* C);
	void ClearEnemies();
	void Reset();
	bool SuperPickupAvailable(class ABot* B);
	void CallForBall(class APawn* Recipient);
	void CriticalObjectiveWarning(class AGameObjective* G, class APawn* NewEnemy);
	void Timer();
	void PostBeginPlay();
};


// Class UnrealGame.TeamPlayerReplicationInfo
// 0x005C (0x062C - 0x05D0)
class ATeamPlayerReplicationInfo : public APlayerReplicationInfo
{
public:
	class UClass*                                      LocalStatsScreenClass;                                    // 0x05D0(0x0004) (Net)
	class ASquadAI*                                    Squad;                                                    // 0x05D4(0x0004) (Net)
	unsigned long                                      bHolding : 1;                                             // 0x05D8(0x0004) (Net)
	unsigned long                                      bFirstBlood : 1;                                          // 0x05D8(0x0004)
	TArray<struct FWeaponStats>                        WeaponStatsArray;                                         // 0x05DC(0x000C) (NeedCtorLink)
	TArray<struct FVehicleStats>                       VehicleStatsArray;                                        // 0x05E8(0x000C) (NeedCtorLink)
	int                                                FlagTouches;                                              // 0x05F4(0x0004)
	int                                                FlagReturns;                                              // 0x05F8(0x0004)
	unsigned char                                      Spree[0x6];                                               // 0x05FC(0x0001)
	unsigned char                                      MultiKills[0x7];                                          // 0x0602(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0609(0x0003) MISSED OFFSET
	int                                                Suicides;                                                 // 0x060C(0x0004)
	int                                                flakcount;                                                // 0x0610(0x0004)
	int                                                combocount;                                               // 0x0614(0x0004)
	int                                                headcount;                                                // 0x0618(0x0004)
	int                                                ranovercount;                                             // 0x061C(0x0004)
	int                                                DaredevilPoints;                                          // 0x0620(0x0004)
	unsigned char                                      Combos[0x5];                                              // 0x0624(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0629(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamPlayerReplicationInfo");
		return ptr;
	}


	void AddVehicleDeathDriving(class UClass* V);
	void AddVehicleDeath(class UClass* D);
	void AddVehicleKill(class UClass* D);
	void UpdateVehicleStats(class ATeamPlayerReplicationInfo* PRI, class UClass* V, int newKills, int newDeaths, int newDeathsDriving);
	void AddWeaponDeathHolding(class UClass* W);
	void AddWeaponDeath(class UClass* D);
	void AddWeaponKill(class UClass* D);
	void UpdateWeaponStats(class ATeamPlayerReplicationInfo* PRI, class UClass* W, int newKills, int newDeaths, int newDeathsHolding);
	void PostBeginPlay();
};


// Class UnrealGame.SpecialVehicleObjective
// 0x0030 (0x04D4 - 0x04A4)
class ASpecialVehicleObjective : public ARoadPathNode
{
public:
	TArray<class UClass*>                              AccessibleVehicleClasses;                                 // 0x04A4(0x000C) (Edit, NeedCtorLink)
	struct FName                                       AssociatedActorTag;                                       // 0x04B0(0x0004) (Edit)
	float                                              MaxDist;                                                  // 0x04B4(0x0004) (Edit)
	class AActor*                                      AssociatedActor;                                          // 0x04B8(0x0004)
	unsigned long                                      bEnabled : 1;                                             // 0x04BC(0x0004)
	class ASpecialVehicleObjective*                    NextSpecialVehicleObjective;                              // 0x04C0(0x0004)
	class APawn*                                       TeamOwner[0x4];                                           // 0x04C4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.SpecialVehicleObjective");
		return ptr;
	}


	void Reset();
	void UnTrigger(class AActor* Other, class APawn* EventInstigator);
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	bool IsAccessibleTo(class APawn* BotPawn);
	void PostBeginPlay();
};


// Class UnrealGame.AssaultPath
// 0x0028 (0x04C8 - 0x04A0)
class AAssaultPath : public ANavigationPoint
{
public:
	class AGameObjective*                              AssociatedObjective;                                      // 0x04A0(0x0004)
	class AAssaultPath*                                NextPath;                                                 // 0x04A4(0x0004)
	int                                                Position;                                                 // 0x04A8(0x0004) (Edit)
	struct FName                                       ObjectiveTag;                                             // 0x04AC(0x0004) (Edit)
	struct FName                                       PathTag[0x4];                                             // 0x04B0(0x0004) (Edit)
	unsigned long                                      bEnabled : 1;                                             // 0x04C0(0x0004) (Edit)
	unsigned long                                      bNoReturn : 1;                                            // 0x04C0(0x0004) (Edit)
	unsigned long                                      bReturnOnly : 1;                                          // 0x04C0(0x0004) (Edit)
	unsigned long                                      bFirstPath : 1;                                           // 0x04C0(0x0004)
	unsigned long                                      bLastPath : 1;                                            // 0x04C0(0x0004)
	unsigned long                                      bNoGrouping : 1;                                          // 0x04C0(0x0004) (Edit)
	float                                              Priority;                                                 // 0x04C4(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.AssaultPath");
		return ptr;
	}


	class AAssaultPath* FindPreviousPath(const struct FName& AlternatePathTag);
	class AAssaultPath* FindNextPath(const struct FName& AlternatePathTag);
	bool HasPathTag(const struct FName& aPathTag);
	struct FName PickTag();
	void AddTo(class AGameObjective* o);
	void ValidatePathTags();
	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class UnrealGame.DMStatsScreen
// 0x01F0 (0x062C - 0x043C)
class ADMStatsScreen : public AScoreBoard
{
public:
	class AUnrealPlayer*                               PlayerOwner;                                              // 0x043C(0x0004)
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // 0x0440(0x0004)
	struct FString                                     StatsString;                                              // 0x0444(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AwardsString;                                             // 0x0450(0x000C) (Localized, NeedCtorLink)
	struct FString                                     FirstBloodString;                                         // 0x045C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SuicidesString;                                           // 0x0468(0x000C) (Localized, NeedCtorLink)
	struct FString                                     LongestSpreeString;                                       // 0x0474(0x000C) (Localized, NeedCtorLink)
	struct FString                                     FlakMonkey;                                               // 0x0480(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ComboWhore;                                               // 0x048C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     HeadHunter;                                               // 0x0498(0x000C) (Localized, NeedCtorLink)
	struct FString                                     RoadRampage;                                              // 0x04A4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     DaredevilString;                                          // 0x04B0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     FlagTouches;                                              // 0x04BC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     FlagReturns;                                              // 0x04C8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     GoalsScored;                                              // 0x04D4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     HatTrick;                                                 // 0x04E0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     KillString[0x7];                                          // 0x04EC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AdrenalineCombos;                                         // 0x0540(0x000C) (Localized, NeedCtorLink)
	struct FString                                     ComboNames[0x5];                                          // 0x054C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     KillsByWeapon;                                            // 0x0588(0x000C) (Localized, NeedCtorLink)
	struct FString                                     CombatResults;                                            // 0x0594(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Kills;                                                    // 0x05A0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Deaths;                                                   // 0x05AC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     Suicides;                                                 // 0x05B8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NextStatsString;                                          // 0x05C4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WeaponString;                                             // 0x05D0(0x000C) (Localized, NeedCtorLink)
	struct FString                                     DeathsBy;                                                 // 0x05DC(0x000C) (Localized, NeedCtorLink)
	struct FString                                     deathsholding;                                            // 0x05E8(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EfficiencyString;                                         // 0x05F4(0x000C) (Localized, NeedCtorLink)
	struct FString                                     WaitingForStats;                                          // 0x0600(0x000C) (Localized, NeedCtorLink)
	struct FString                                     KillsByVehicle;                                           // 0x060C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     VehicleString;                                            // 0x0618(0x000C) (Localized, NeedCtorLink)
	float                                              LastUpdateTime;                                           // 0x0624(0x0004)
	class UMaterial*                                   BoxMaterial;                                              // 0x0628(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.DMStatsScreen");
		return ptr;
	}


	void NextStats();
	void DrawScoreboard(class UCanvas* C);
	struct FString STATIC_MakeColorCode(const struct FColor& NewColor);
};


// Class UnrealGame.UnrealVoiceReplicationInfo
// 0x0008 (0x052C - 0x0524)
class AUnrealVoiceReplicationInfo : public AVoiceChatReplicationInfo
{
public:
	class UClass*                                      ChatBroadcastClass;                                       // 0x0524(0x0004) (Edit)
	class AUnrealChatHandler*                          ChatBroadcastHandler;                                     // 0x0528(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealVoiceReplicationInfo");
		return ptr;
	}


	void DestroyVoiceChannel(class AVoiceChatRoom* Channel);
	class AVoiceChatRoom* CreateNewVoiceChannel(class APlayerReplicationInfo* PRI);
	bool IsMember(class APlayerReplicationInfo* TestPRI, int ChannelIndex, bool bNoCascade);
	int GetPlayerChannelCount();
	int GetPublicChannelCount(bool bSingleTeam);
	TArray<class AVoiceChatRoom*> GetPlayerChannels();
	TArray<class AVoiceChatRoom*> GetPublicChannels();
	int GetChannelIndex(const struct FString& ChannelTitle, int TeamIndex);
	int GetChannelCount();
	TArray<class AVoiceChatRoom*> GetChannels();
	TArray<int> GetMemberChannels(class APlayerReplicationInfo* PRI);
	TArray<int> GetChannelMembersAt(int Index);
	TArray<int> GetChannelMembers(const struct FString& ChatRoomName, int TeamIndex);
	class AVoiceChatRoom* GetChannelAt(int Index);
	class AVoiceChatRoom* GetChannel(const struct FString& ChatRoomName, int TeamIndex);
	bool RemoveVoiceChannel(class APlayerReplicationInfo* PRI);
	class AVoiceChatRoom* AddVoiceChannel(class APlayerReplicationInfo* PRI);
	bool LeaveChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI);
	TEnumAsByte<EJoinChatResult> JoinChannelAt(int ChannelIndex, class APlayerReplicationInfo* PRI, const struct FString& Password);
	TEnumAsByte<EJoinChatResult> JoinChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI, const struct FString& Password);
	bool CanJoinChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI);
	void RemoveVoiceChatter(class APlayerReplicationInfo* PRI);
	void AddVoiceChatter(class APlayerReplicationInfo* NewPRI);
	void InitChannels();
	void SetGRI(class AGameReplicationInfo* NewGRI);
	void PostNetBeginPlay();
	void PostBeginPlay();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
};


// Class UnrealGame.UnrealChatHandler
// 0x0004 (0x0470 - 0x046C)
class AUnrealChatHandler : public ABroadcastHandler
{
public:
	unsigned long                                      bDebug : 1;                                               // 0x046C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealChatHandler");
		return ptr;
	}


	bool AcceptBroadcastVoice(class APlayerController* Receiver, class APlayerReplicationInfo* Sender);
	bool AcceptBroadcastSpeech(class APlayerController* Receiver, class APlayerReplicationInfo* SenderPRI);
	bool AcceptBroadcastLocalized(class APlayerController* Receiver, class AActor* Sender, class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* obj);
	bool AcceptBroadcastText(class APlayerController* Receiver, class APlayerReplicationInfo* SenderPRI, const struct FName& Type, struct FString* Msg);
	void DoChatDebug();
	void ToggleChatDebug();
};


// Class UnrealGame.StartupMessage
// 0x04CC (0x091C - 0x0450)
class AStartupMessage : public ACriticalEventPlus
{
public:
	struct FString                                     Stage[0x64];                                              // 0x0450(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NotReady;                                                 // 0x0900(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SinglePlayer;                                             // 0x090C(0x000C) (Localized, NeedCtorLink)
	class USound*                                      Riff;                                                     // 0x0918(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.StartupMessage");
		return ptr;
	}


	bool STATIC_GotoHud(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class UnrealGame.IdleKickWarningMessage
// 0x0000 (0x0450 - 0x0450)
class AIdleKickWarningMessage : public ALocalMessage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.IdleKickWarningMessage");
		return ptr;
	}


	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class UnrealGame.AnnounceAdrenaline
// 0x0008 (0x0434 - 0x042C)
class AAnnounceAdrenaline : public AInfo
{
public:
	class USound*                                      AnnounceSound;                                            // 0x042C(0x0004)
	struct FName                                       Announcement;                                             // 0x0430(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.AnnounceAdrenaline");
		return ptr;
	}


	void Timer();
};


// Class UnrealGame.CustomBotConfig
// 0x0024 (0x0050 - 0x002C)
class UCustomBotConfig : public UObject
{
public:
	struct FString                                     FavoriteWeapon;                                           // 0x002C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     NoPreference;                                             // 0x0038(0x000C) (Localized, NeedCtorLink)
	TArray<struct FCustomConfiguration>                ConfigArray;                                              // 0x0044(0x000C) (Config, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.CustomBotConfig");
		return ptr;
	}


	int STATIC_IndexFor(const struct FString& PlayerName);
	int STATIC_AggressivenessRating(const struct FCustomConfiguration& cc);
	int STATIC_TacticsRating(const struct FCustomConfiguration& cc);
	int STATIC_AgilityRating(const struct FCustomConfiguration& cc);
	int STATIC_AccuracyRating(const struct FCustomConfiguration& cc);
	int STATIC_RatingModifier(const struct FString& CharacterName);
	struct FString STATIC_GetFavoriteWeaponFor(const struct FCustomConfiguration& cc);
	void STATIC_Customize(class URosterEntry* R);
};


// Class UnrealGame.KillingSpreeMessage
// 0x017C (0x05CC - 0x0450)
class AKillingSpreeMessage : public ACriticalEventPlus
{
public:
	struct FString                                     EndSpreeNote;                                             // 0x0450(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EndSelfSpree;                                             // 0x045C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     EndFemaleSpree;                                           // 0x0468(0x000C) (Localized, NeedCtorLink)
	struct FString                                     MultiKillString;                                          // 0x0474(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SpreeNote[0xA];                                           // 0x0480(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SelfSpreeNote[0xA];                                       // 0x04F8(0x000C) (Localized, NeedCtorLink)
	class USound*                                      SpreeSound[0xA];                                          // 0x0570(0x0004)
	struct FName                                       SpreeSoundName[0xA];                                      // 0x0598(0x0004)
	struct FString                                     EndSpreeNoteTrailer;                                      // 0x05C0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.KillingSpreeMessage");
		return ptr;
	}


	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FString STATIC_GetRelatedString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	int STATIC_GetFontSize(int Switch, class APlayerReplicationInfo* RelatedPRI1, class APlayerReplicationInfo* RelatedPRI2, class APlayerReplicationInfo* LocalPlayer);
};


// Class UnrealGame.DMSquad
// 0x0000 (0x04D4 - 0x04D4)
class ADMSquad : public ASquadAI
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.DMSquad");
		return ptr;
	}


	bool AssignSquadResponsibility(class ABot* B);
	bool FriendlyToward(class APawn* Other);
	bool SetEnemy(class ABot* B, class APawn* NewEnemy);
	struct FName GetOrders();
	bool BeDevious();
	bool NearFormationCenter(class APawn* P);
	bool WaitAtThisPosition(class APawn* P);
	bool CheckSquadObjectives(class ABot* B);
	bool ShouldDeferTo(class AController* C);
	void RemoveBot(class ABot* B);
	void AddBot(class ABot* B);
	bool IsDefending(class ABot* B);
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void AssignCombo(class ABot* B);
};


// Class UnrealGame.WeaponDamageType
// 0x0004 (0x04A8 - 0x04A4)
class AWeaponDamageType : public ADamageType
{
public:
	class UClass*                                      WeaponClass;                                              // 0x04A4(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.WeaponDamageType");
		return ptr;
	}


	struct FString STATIC_GetWeaponClass();
};


// Class UnrealGame.VehicleDamageType
// 0x0004 (0x04A8 - 0x04A4)
class AVehicleDamageType : public ADamageType
{
public:
	class UClass*                                      VehicleClass;                                             // 0x04A4(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.VehicleDamageType");
		return ptr;
	}

};


// Class UnrealGame.LevelGameRules
// 0x000C (0x0438 - 0x042C)
class ALevelGameRules : public AInfo
{
public:
	TArray<class UClass*>                              MapMutator;                                               // 0x042C(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.LevelGameRules");
		return ptr;
	}


	void UpdateGame(class AGameInfo* G);
	void PreBeginPlay();
};


// Class UnrealGame.UnrealPlayerChatManager
// 0x0018 (0x0448 - 0x0430)
class AUnrealPlayerChatManager : public APlayerChatManager
{
public:
	TArray<struct FStoredChatBan>                      StoredChatRestrictions;                                   // 0x0430(0x000C) (Config, GlobalConfig, NeedCtorLink)
	TArray<struct AUnrealPlayerChatManager_FChatBan>   ChatRestrictions;                                         // 0x043C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealPlayerChatManager");
		return ptr;
	}


	int Count();
	bool IsLocal();
	bool IsValid(int i);
	int GetHashIndex(const struct FString& PlayerHash);
	int GetIDIndex(int PlayerID);
	struct FString GetPlayerHash(int PlayerID);
	bool ClientIsBanned(const struct FString& PlayerHash);
	unsigned char GetPlayerRestriction(int PlayerID);
	bool UnMergeRestriction(int Index, unsigned char NewType);
	bool MergeRestriction(int Index, unsigned char NewType);
	bool ClearRestrictionID(int PlayerID, unsigned char Type);
	bool ClearRestriction(const struct FString& PlayerHash, unsigned char Type);
	bool AddRestrictionID(int PlayerID, unsigned char Type);
	bool AddRestriction(const struct FString& PlayerHash, unsigned char Type);
	bool SetRestrictionID(int PlayerID, unsigned char Type);
	bool SetRestriction(const struct FString& PlayerHash, unsigned char Type);
	bool IsBanned(class APlayerReplicationInfo* PRI);
	bool AcceptVoice(class APlayerReplicationInfo* SenderPRI);
	bool AcceptSpeech(class APlayerReplicationInfo* SenderPRI);
	bool AcceptText(class APlayerReplicationInfo* Sender, const struct FName& Type, struct FString* Msg);
	void UnTrackPlayer(int PlayerID);
	void TrackNewPlayer(int PlayerID, const struct FString& PlayerHash, const struct FString& PlayerAddress);
	void ReceiveBanInfo(const struct FString& S);
	void StoreChatBan(const struct FString& PlayerHash, unsigned char Restriction);
	bool LoadChatBan(const struct FString& PlayerHash, unsigned char* OutRestriction);
	void LogChatRestriction(int i);
	void ChatDebug();
};


// Class UnrealGame.UseObjective
// 0x000C (0x06E0 - 0x06D4)
class AUseObjective : public AProximityObjective
{
public:
	struct FString                                     strPlayerName;                                            // 0x06D4(0x000C) (Net, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UseObjective");
		return ptr;
	}


	bool TellBotHowToDisable(class ABot* B);
	void Touch(class AActor* Other);
	void UsedBy(class APawn* User);
};


// Class UnrealGame.WillowWhisp
// 0x00A0 (0x0668 - 0x05C8)
class AWillowWhisp : public AwEmitter
{
public:
	struct FVector                                     WayPoints[0xB];                                           // 0x05C8(0x000C) (Net)
	int                                                NumPoints;                                                // 0x064C(0x0004) (Net)
	int                                                Position;                                                 // 0x0650(0x0004)
	struct FVector                                     Destination;                                              // 0x0654(0x000C)
	unsigned long                                      bHeadedRight : 1;                                         // 0x0660(0x0004)
	float                                              LifeLeft;                                                 // 0x0664(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.WillowWhisp");
		return ptr;
	}


	void StartNextPath();
	void PostNetBeginPlay();
	void PostBeginPlay();
};


// Class UnrealGame.DMMutator
// 0x003C (0x04BC - 0x0480)
class ADMMutator : public AMutator
{
public:
	unsigned long                                      bMegaSpeed : 1;                                           // 0x0480(0x0004) (Edit, Config, GlobalConfig)
	float                                              AirControl;                                               // 0x0484(0x0004) (Edit, Config, GlobalConfig)
	unsigned long                                      bBrightSkins : 1;                                         // 0x0488(0x0004) (Edit, Config, GlobalConfig)
	struct FString                                     DMMutPropsDisplayText[0x2];                               // 0x048C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     DMMutDescText[0x2];                                       // 0x04A4(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.DMMutator");
		return ptr;
	}


	void GetServerDetails(struct FServerResponseLine* ServerState);
	bool AlwaysKeep(class AActor* Other);
	bool MutatorIsAllowed();
};


// Class UnrealGame.PickupMessagePlus
// 0x0000 (0x0450 - 0x0450)
class APickupMessagePlus : public ALocalMessage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.PickupMessagePlus");
		return ptr;
	}


	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class UnrealGame.SnipingVolume
// 0x0040 (0x0490 - 0x0450)
class ASnipingVolume : public AVolume
{
public:
	class AUnrealScriptedSequence*                     SnipingPoints[0x10];                                      // 0x0450(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.SnipingVolume");
		return ptr;
	}


	void Touch(class AActor* Other);
	void AddDefensePoint(class AUnrealScriptedSequence* S);
};


// Class UnrealGame.TeamVoiceReplicationInfo
// 0x000C (0x0538 - 0x052C)
class ATeamVoiceReplicationInfo : public AUnrealVoiceReplicationInfo
{
public:
	int                                                RedTeamMask;                                              // 0x052C(0x0004) (Net)
	int                                                BlueTeamMask;                                             // 0x0530(0x0004) (Net)
	unsigned long                                      bTeamChatOnly : 1;                                        // 0x0534(0x0004) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamVoiceReplicationInfo");
		return ptr;
	}


	int GetOpposingTeamChannel(int ChannelIndex);
	struct FString GetTitle(class AVoiceChatRoom* Room);
	void NotifyTeamChange(class APlayerReplicationInfo* PRI, int TeamIndex);
	TEnumAsByte<EJoinChatResult> JoinChannelAt(int ChannelIndex, class APlayerReplicationInfo* PRI, const struct FString& Password);
	TEnumAsByte<EJoinChatResult> JoinChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI, const struct FString& Password);
	class AVoiceChatRoom* GetChannel(const struct FString& ChatRoomName, int TeamIndex);
	int GetChannelIndex(const struct FString& ChannelTitle, int TeamIndex);
	int GetMask(class AVoiceChatRoom* Room);
	void SetMask(class AVoiceChatRoom* Room, int NewMask);
	bool ValidRoom(class AVoiceChatRoom* Room);
	void InitChannels();
};


// Class UnrealGame.UnrealChatRoom
// 0x0000 (0x045C - 0x045C)
class AUnrealChatRoom : public AVoiceChatRoom
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealChatRoom");
		return ptr;
	}


	bool RemoveChild(class AVoiceChatRoom* Child);
	bool AddChild(class AVoiceChatRoom* NewChild);
	void SetMask(int NewMask);
	void SetTeam(int NewTeam);
	bool IsBanned(class APlayerReplicationInfo* PRI);
	void RemoveMember(class APlayerReplicationInfo* PRI);
	void AddMember(class APlayerReplicationInfo* PRI);
	bool LeaveChannel(class APlayerReplicationInfo* LeavingPRI);
	TEnumAsByte<EJoinChatResult> JoinChannel(class APlayerReplicationInfo* NewPRI, const struct FString& InPassword);
	bool CanJoinChannel(class APlayerReplicationInfo* PRI);
	bool IsMember(class APlayerReplicationInfo* PRI, bool bNoCascade);
	bool IsFull();
	int Count();
	bool IsPrivateChannel();
	bool IsPublicChannel();
	TArray<class APlayerReplicationInfo*> GetMembers();
	struct FString GetPassword();
	int GetTeam();
	struct FString GetTitle();
	int GetMask();
	void PostNetBeginPlay();
	void Timer();
	void SetGRI(class AGameReplicationInfo* InGRI);
};


// Class UnrealGame.wFlagObjectiveBase
// 0x0078 (0x0758 - 0x06E0)
class AwFlagObjectiveBase : public AUseObjective
{
public:
	float                                              fStartCaptureTime;                                        // 0x06E0(0x0004)
	float                                              fCaptureProgress;                                         // 0x06E4(0x0004) (Net)
	float                                              fCaptureLength;                                           // 0x06E8(0x0004)
	float                                              fActiveStartTime;                                         // 0x06EC(0x0004)
	int                                                iActiveScore;                                             // 0x06F0(0x0004)
	float                                              fNeutrallTime;                                            // 0x06F4(0x0004)
	int                                                CaptureScore;                                             // 0x06F8(0x0004)
	int                                                CaptureExp;                                               // 0x06FC(0x0004)
	int                                                CapturePoint;                                             // 0x0700(0x0004)
	int                                                iRepCaptureTeam;                                          // 0x0704(0x0004) (Net)
	float                                              fAddMount;                                                // 0x0708(0x0004) (Net)
	unsigned char                                      byGetProgress;                                            // 0x070C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x070D(0x0003) MISSED OFFSET
	float                                              fOldLevelTime;                                            // 0x0710(0x0004)
	TArray<class APawn*>                               LinkedTeam_A;                                             // 0x0714(0x000C) (NeedCtorLink)
	TArray<class APawn*>                               LinkedTeam_B;                                             // 0x0720(0x000C) (NeedCtorLink)
	int                                                iActiveTeam;                                              // 0x072C(0x0004) (Net)
	int                                                iOldActiveTeam;                                           // 0x0730(0x0004)
	int                                                iCapturingTeam;                                           // 0x0734(0x0004) (Net)
	float                                              ReachRadius;                                              // 0x0738(0x0004) (Edit)
	class UMaterial*                                   texGreen;                                                 // 0x073C(0x0004)
	class UMaterial*                                   texRed;                                                   // 0x0740(0x0004)
	class UMaterial*                                   texNormal;                                                // 0x0744(0x0004)
	struct FScriptDelegate                             __OnTouch__Delegate;                                      // 0x0748(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __OnUnTouch__Delegate;                                    // 0x0750(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.wFlagObjectiveBase");
		return ptr;
	}


	void RemoveTouchingPlayer(class APawn* P);
	void AddNewTouchingPlayer(class APawn* P);
	void PlayerToucherDied(class APawn* P);
	void CheckObjectiveProgress(int iTeamIndex);
	void ResetCapture();
	void Reset();
	void UnTouch(class AActor* Other);
	void Touch(class AActor* Other);
	void RecoverCapturing();
	void SetActiveTeam(int iTeam);
	void BeginPlay();
	void OnUnTouch(class AActor* Other);
	void OnTouch(class AActor* Other);
};


// Class UnrealGame.UnrealTeamChatRoom
// 0x0000 (0x045C - 0x045C)
class AUnrealTeamChatRoom : public AUnrealChatRoom
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealTeamChatRoom");
		return ptr;
	}


	bool NotifyTeamChange(class APlayerReplicationInfo* PRI, int NewTeamIndex);
	bool CanJoinChannel(class APlayerReplicationInfo* PRI);
	bool IsTeamChannel();
};


// Class UnrealGame.WillowWhispPath
// 0x00A4 (0x066C - 0x05C8)
class AWillowWhispPath : public AwEmitter
{
public:
	struct FVector                                     WayPoints[0xB];                                           // 0x05C8(0x000C) (Net)
	int                                                NumPoints;                                                // 0x064C(0x0004) (Net)
	int                                                Position;                                                 // 0x0650(0x0004)
	struct FVector                                     Destination;                                              // 0x0654(0x000C)
	unsigned long                                      bHeadedRight : 1;                                         // 0x0660(0x0004)
	float                                              LifeLeft;                                                 // 0x0664(0x0004)
	unsigned long                                      bRepeat : 1;                                              // 0x0668(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.WillowWhispPath");
		return ptr;
	}


	void StartNextPath();
	void PostNetBeginPlay();
	void PostBeginPlay();
};


// Class UnrealGame.StringMessagePlus
// 0x0000 (0x0450 - 0x0450)
class AStringMessagePlus : public ALocalMessage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.StringMessagePlus");
		return ptr;
	}


	struct FString STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const struct FString& MessageString);
};


// Class UnrealGame.SayMessagePlus
// 0x0008 (0x0458 - 0x0450)
class ASayMessagePlus : public AStringMessagePlus
{
public:
	struct FColor                                      RedTeamColor;                                             // 0x0450(0x0004)
	struct FColor                                      BlueTeamColor;                                            // 0x0454(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.SayMessagePlus");
		return ptr;
	}


	struct FColor STATIC_GetConsoleColor(class APlayerReplicationInfo* RelatedPRI_1);
	struct FString STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const struct FString& MessageString);
	void STATIC_RenderComplexMessage(class UCanvas* Canvas, const struct FString& MessageString, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, float* XL, float* YL);
};


// Class UnrealGame.TeamSayMessagePlus
// 0x0000 (0x0450 - 0x0450)
class ATeamSayMessagePlus : public AStringMessagePlus
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamSayMessagePlus");
		return ptr;
	}


	struct FString STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const struct FString& MessageString);
	void STATIC_RenderComplexMessage(class UCanvas* Canvas, const struct FString& MessageString, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, float* XL, float* YL);
};


// Class UnrealGame.PlayerNameMessage
// 0x0000 (0x0450 - 0x0450)
class APlayerNameMessage : public ALocalMessage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.PlayerNameMessage");
		return ptr;
	}


	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class UnrealGame.TurretController
// 0x0000 (0x061C - 0x061C)
class ATurretController : public AAIController
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TurretController");
		return ptr;
	}


	float GetWaitForTargetTime();
	bool IsTurretFiring();
	bool IsTargetRelevant(class APawn* Target);
	int GetTeamNum();
	void Possess(class APawn* aPawn);
	struct FRotator AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError);
};


// Class UnrealGame.FemaleAnnouncer
// 0x0000 (0x046C - 0x046C)
class AFemaleAnnouncer : public AAnnouncerVoice
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.FemaleAnnouncer");
		return ptr;
	}

};


// Class UnrealGame.MaleAnnouncer
// 0x0000 (0x046C - 0x046C)
class AMaleAnnouncer : public AAnnouncerVoice
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.MaleAnnouncer");
		return ptr;
	}

};


// Class UnrealGame.UnrealSecurity
// 0x0000 (0x0448 - 0x0448)
class AUnrealSecurity : public ASecurity
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealSecurity");
		return ptr;
	}


	void ServerCallback(int SecType, const struct FString& Data);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
