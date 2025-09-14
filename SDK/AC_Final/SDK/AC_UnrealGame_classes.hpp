#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class UnrealGame.UnrealPawn
// 0x01D8 (0x1254 - 0x107C)
class AUnrealPawn : public APawn
{
public:
	bool                                               bNoDefaultInventory;                                      // 0x107C(0x0004) (Edit)
	bool                                               bAcceptAllInventory;                                      // 0x107C(0x0004)
	bool                                               bIsSquadLeader;                                           // 0x107C(0x0004) (Edit)
	bool                                               bSoakDebug;                                               // 0x107C(0x0004)
	bool                                               bKeepTaunting;                                            // 0x107C(0x0004)
	bool                                               bPlayOwnFootsteps;                                        // 0x107C(0x0004)
	byte                                               LoadOut;                                                  // 0x1080(0x0001)
	byte                                               SelectedEquipment[0x10];                                  // 0x1081(0x0001)
	byte                                               Padding00[0x3];                                           // 0x1091(0x0003) MISSED OFFSET
	string                                             RequiredEquipment[0x10];                                  // 0x1094(0x000C) (Edit, NeedCtorLink)
	string                                             OptionalEquipment[0x10];                                  // 0x1154(0x000C) (NeedCtorLink)
	float                                              AttackSuitability;                                        // 0x1214(0x0004)
	float                                              LastFootStepTime;                                         // 0x1218(0x0004)
	EDoubleClickDir                                    CurrentDir;                                               // 0x121C(0x0001)
	byte                                               Padding01[0x3];                                           // 0x121D(0x0003) MISSED OFFSET
	struct FVector                                     GameObjOffset;                                            // 0x1220(0x000C)
	struct FRotator                                    GameObjRot;                                               // 0x122C(0x000C)
	FName                                              SquadName;                                                // 0x1238(0x0004) (Edit)
	string                                             VoiceType;                                                // 0x123C(0x000C) (NeedCtorLink)
	bool                                               bPlayerShadows;                                           // 0x1248(0x0004)
	bool                                               bBlobShadow;                                              // 0x1248(0x0004)
	int                                                Spree;                                                    // 0x124C(0x0004)
	int                                                iCheckBreath;                                             // 0x1250(0x0004)

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
	bool Dodge(EDoubleClickDir DoubleClickMove);
	bool PerformDodge(EDoubleClickDir DoubleClickMove, const struct FVector& Dir, const struct FVector& Cross);
	class AInventory* CreateInventory(const string& InventoryClassName);
	class AInventory* CustomCreateInventory(const string& WeaponClassName);
	void AddDefaultInventory(bool bQuickslotChange);
	void AddDefaultInventoryDOA(bool bQuickslotChange);
	bool IsInLoadout(class UClass* InventoryClass);
	void CheckBob(float DeltaTime, const struct FVector& Y);
	FName GetWeaponBoneFor(class AInventory* i);
	string GetDebugName();
	void SetAnimAction(const FName& NewAction, bool bNoBlendAnim);
	void ShouldUnCrouch();
	void EndJump();
	void HoldGameObject(class AGameObject* gameObj, const FName& GameObjBone);
	void HoldFlag(class AActor* FlagActor);
	struct FVector BotDodge(const struct FVector& Dir);
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void gibbedBy(class AActor* Other);
	bool FindValidTaunt(FName* Sequence);
	void DropFlag(const string& sReason);
};


// Class UnrealGame.RosterEntry
// 0x0060 (0x008C - 0x002C)
class URosterEntry : public UObject
{
public:
	class UClass*                                      PawnClass;                                                // 0x002C(0x0004) (Edit)
	string                                             PawnClassName;                                            // 0x0030(0x000C) (Edit, NeedCtorLink)
	string                                             PlayerName;                                               // 0x003C(0x000C) (Edit, NeedCtorLink)
	string                                             ModifiedPlayerName;                                       // 0x0048(0x000C) (Edit, NeedCtorLink)
	string                                             VoiceTypeName;                                            // 0x0054(0x000C) (Edit, NeedCtorLink)
	EOrders                                            Orders;                                                   // 0x0060(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0061(0x0003) MISSED OFFSET
	bool                                               bTaken;                                                   // 0x0064(0x0004) (Edit)
	class UClass*                                      FavoriteWeapon;                                           // 0x0068(0x0004) (Edit)
	float                                              Aggressiveness;                                           // 0x006C(0x0004) (Edit)
	float                                              Accuracy;                                                 // 0x0070(0x0004) (Edit)
	float                                              CombatStyle;                                              // 0x0074(0x0004) (Edit)
	float                                              StrafingAbility;                                          // 0x0078(0x0004) (Edit)
	float                                              Tactics;                                                  // 0x007C(0x0004) (Edit)
	float                                              ReactionTime;                                             // 0x0080(0x0004) (Edit)
	float                                              Jumpiness;                                                // 0x0084(0x0004) (Edit)
	bool                                               bJumpy;                                                   // 0x0088(0x0004)

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
	void SetOrders(EPlayerPos Position);
	void PrecacheRosterFor(class AUnrealTeamInfo* t);
	void Init();
};


// Class UnrealGame.UnrealMPGameInfo
// 0x0110 (0x0AC0 - 0x09B0)
class AUnrealMPGameInfo : public AGameInfo
{
public:
	byte                                               BotMode;                                                  // 0x09B0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x09B1(0x0003) MISSED OFFSET
	int                                                MinPlayers;                                               // 0x09B4(0x0004)
	float                                              EndTimeDelay;                                             // 0x09B8(0x0004)
	float                                              BotRatio;                                                 // 0x09BC(0x0004)
	bool                                               bPreloadAllSkins;                                         // 0x09C0(0x0004)
	string                                             DefaultVoiceChannel;                                      // 0x09C4(0x000C) (NeedCtorLink)
	bool                                               bAllowPrivateChat;                                        // 0x09D0(0x0004)
	bool                                               bTeamScoreRounds;                                         // 0x09D0(0x0004)
	bool                                               bSoaking;                                                 // 0x09D0(0x0004)
	bool                                               bPlayersVsBots;                                           // 0x09D0(0x0004)
	float                                              EndTime;                                                  // 0x09D4(0x0004)
	class ASpecialVehicleObjective*                    SpecialVehicleObjectives;                                 // 0x09D8(0x0004)
	class UClass*                                      LocalStatsScreenClass;                                    // 0x09DC(0x0004)
	string                                             VoiceReplicationInfoType;                                 // 0x09E0(0x000C) (Edit, NeedCtorLink)
	string                                             MPGIPropsDisplayText[0x4];                                // 0x09EC(0x000C) (Localized, NeedCtorLink)
	string                                             MPGIPropDescText[0x4];                                    // 0x0A1C(0x000C) (Localized, NeedCtorLink)
	string                                             BotModeText;                                              // 0x0A4C(0x000C) (Localized, NeedCtorLink)
	string                                             SPBotText;                                                // 0x0A58(0x000C) (Localized, NeedCtorLink)
	string                                             MPBotText;                                                // 0x0A64(0x000C) (Localized, NeedCtorLink)
	string                                             SPBotDesc;                                                // 0x0A70(0x000C) (Localized, NeedCtorLink)
	string                                             MPBotDesc;                                                // 0x0A7C(0x000C) (Localized, NeedCtorLink)
	string                                             BotOptions[0x4];                                          // 0x0A88(0x000C) (Localized, NeedCtorLink)
	class AMasterServerUplink*                         MSUplink;                                                 // 0x0AB8(0x0004)
	bool                                               bMSUplinkSet;                                             // 0x0ABC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealMPGameInfo");
		return ptr;
	}


	int MultiMinPlayers();
	string STATIC_GetDescriptionText(const string& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	string STATIC_GenerateBotOptions(bool bSinglePlayer);
	void STATIC_AdjustBotInterface(bool bSinglePlayer);
	void GetServerDetails(struct FServerResponseLine* ServerState);
	void InitPlacedBot(class AController* C, class URosterEntry* R);
	bool PickupQuery(class APawn* Other, class APickup* Item);
	bool CanDisableObjective(class AGameObjective* Go);
	int AdjustDestroyObjectiveDamage(int Damage, class AController* instigatedBy, class AGameObjective* Go);
	void ShowPathTo(class APlayerController* P, int TeamNum);
	bool CanShowPathTo(class APlayerController* P, int TeamNum);
	void ForceAddBot();
	void ChangeLoadOut(class APlayerController* P, const string& LoadoutName);
	void ScoreGameObject(class AController* C, class AGameObject* Go);
	class AGameObject* GetGameObject(const FName& GameObjectName);
	void FindNewObjectives(class AGameObjective* DisabledObjective);
	void ObjectiveDisabled(class AGameObjective* DisabledObjective);
	class UTexture* STATIC_GetRandomTeamSymbol(int Base);
	void RestartGame();
	bool TooManyBots(class AController* botToRemove);
	float SpawnWait(class AAIController* B);
	bool ShouldRespawn(class APickup* Other);
	int GetNumPlayers();
	void TeamScoreEvent(int Team, float Points, const string& Desc);
	void ScoreEvent(class APlayerReplicationInfo* Who, float Points, const string& Desc);
	void GameEvent(const string& GEvent, const string& Desc, class APlayerReplicationInfo* Who);
	void KillEvent(const string& KillType, class APlayerReplicationInfo* Killer, class APlayerReplicationInfo* Victim, class UClass* Damage);
	void SpecialEvent(class APlayerReplicationInfo* Who, const string& Desc);
	void ChangeVoiceChannel(class APlayerReplicationInfo* PRI, int NewChannelIndex, int OldChannelIndex);
	void InitMaplistHandler();
	void InitVoiceReplicationInfo();
	class APlayerController* Login(const string& Portal, const string& Options, string* Error);
	void PreLogin(const string& Options, const string& Address, const string& PlayerID, string* Error, string* FailCode);
};


// Class UnrealGame.Bot
// 0x0190 (0x07E4 - 0x0654)
class ABot : public AScriptedController
{
public:
	bool                                               bTacticalDoubleJump;                                      // 0x0654(0x0004)
	bool                                               bJustLanded;                                              // 0x0654(0x0004)
	bool                                               bSingleTestSection;                                       // 0x0654(0x0004)
	bool                                               bRecommendFastMove;                                       // 0x0654(0x0004)
	bool                                               bDodgingForward;                                          // 0x0654(0x0004)
	bool                                               bHasImpactHammer;                                         // 0x0654(0x0004)
	bool                                               bInstantAck;                                              // 0x0654(0x0004)
	bool                                               bShieldSelf;                                              // 0x0654(0x0004)
	bool                                               bJumpy;                                                   // 0x0654(0x0004)
	bool                                               bHasTranslocator;                                         // 0x0654(0x0004)
	bool                                               bIgnoreEnemyChange;                                       // 0x0654(0x0004)
	bool                                               bPursuingFlag;                                            // 0x0654(0x0004)
	bool                                               bWasNearObjective;                                        // 0x0654(0x0004)
	bool                                               bPlannedShot;                                             // 0x0654(0x0004)
	bool                                               bHasFired;                                                // 0x0654(0x0004)
	bool                                               bForcedDirection;                                         // 0x0654(0x0004)
	bool                                               bFireSuccess;                                             // 0x0654(0x0004)
	bool                                               bStoppedFiring;                                           // 0x0654(0x0004)
	bool                                               bEnemyIsVisible;                                          // 0x0654(0x0004)
	bool                                               bTranslocatorHop;                                         // 0x0654(0x0004)
	bool                                               bEnemyEngaged;                                            // 0x0654(0x0004)
	bool                                               bMustCharge;                                              // 0x0654(0x0004)
	bool                                               bHasSuperWeapon;                                          // 0x0654(0x0004)
	bool                                               bCanFire;                                                 // 0x0654(0x0004)
	bool                                               bStrafeDir;                                               // 0x0654(0x0004)
	bool                                               bLeadTarget;                                              // 0x0654(0x0004)
	bool                                               bChangeDir;                                               // 0x0654(0x0004)
	bool                                               bFrustrated;                                              // 0x0654(0x0004)
	bool                                               bInitLifeMessage;                                         // 0x0654(0x0004)
	bool                                               bReachedGatherPoint;                                      // 0x0654(0x0004)
	bool                                               bFinalStretch;                                            // 0x0654(0x0004)
	class AActor*                                      TranslocationTarget;                                      // 0x0658(0x0004)
	class AActor*                                      RealTranslocationTarget;                                  // 0x065C(0x0004)
	class AActor*                                      ImpactTarget;                                             // 0x0660(0x0004)
	float                                              TranslocFreq;                                             // 0x0664(0x0004)
	float                                              NextTranslocTime;                                         // 0x0668(0x0004)
	FName                                              OldMessageType;                                           // 0x066C(0x0004)
	int                                                OldMessageID;                                             // 0x0670(0x0004)
	struct FVector                                     HidingSpot;                                               // 0x0674(0x000C)
	float                                              Aggressiveness;                                           // 0x0680(0x0004)
	float                                              LastAttractCheck;                                         // 0x0684(0x0004)
	class ANavigationPoint*                            BlockedPath;                                              // 0x0688(0x0004)
	float                                              AcquireTime;                                              // 0x068C(0x0004)
	float                                              Aggression;                                               // 0x0690(0x0004)
	float                                              LoseEnemyCheckTime;                                       // 0x0694(0x0004)
	class AActor*                                      StartleActor;                                             // 0x0698(0x0004)
	float                                              StartTacticalTime;                                        // 0x069C(0x0004)
	float                                              LastUnderFire;                                            // 0x06A0(0x0004)
	float                                              BaseAlertness;                                            // 0x06A4(0x0004)
	float                                              Accuracy;                                                 // 0x06A8(0x0004)
	float                                              BaseAggressiveness;                                       // 0x06AC(0x0004)
	float                                              StrafingAbility;                                          // 0x06B0(0x0004)
	float                                              CombatStyle;                                              // 0x06B4(0x0004)
	float                                              Tactics;                                                  // 0x06B8(0x0004)
	float                                              TranslocUse;                                              // 0x06BC(0x0004)
	float                                              ReactionTime;                                             // 0x06C0(0x0004)
	float                                              Jumpiness;                                                // 0x06C4(0x0004)
	class UClass*                                      FavoriteWeapon;                                           // 0x06C8(0x0004)
	string                                             GoalString;                                               // 0x06CC(0x000C) (NeedCtorLink)
	string                                             SoakString;                                               // 0x06D8(0x000C) (NeedCtorLink)
	class ASquadAI*                                    Squad;                                                    // 0x06E4(0x0004)
	class ABot*                                        NextSquadMember;                                          // 0x06E8(0x0004)
	float                                              ReTaskTime;                                               // 0x06EC(0x0004)
	class AUnrealScriptedSequence*                     GoalScript;                                               // 0x06F0(0x0004)
	class AUnrealScriptedSequence*                     EnemyAcquisitionScript;                                   // 0x06F4(0x0004)
	class AVehicle*                                    FormerVehicle;                                            // 0x06F8(0x0004)
	EScriptFollow                                      ScriptedCombat;                                           // 0x06FC(0x0001)
	byte                                               Padding00[0x3];                                           // 0x06FD(0x0003) MISSED OFFSET
	int                                                FormationPosition;                                        // 0x0700(0x0004)
	int                                                ChoosingAttackLevel;                                      // 0x0704(0x0004)
	float                                              ChooseAttackTime;                                         // 0x0708(0x0004)
	int                                                ChooseAttackCounter;                                      // 0x070C(0x0004)
	float                                              EnemyVisibilityTime;                                      // 0x0710(0x0004)
	class APawn*                                       VisibleEnemy;                                             // 0x0714(0x0004)
	class APawn*                                       OldEnemy;                                                 // 0x0718(0x0004)
	float                                              StopStartTime;                                            // 0x071C(0x0004)
	float                                              LastRespawnTime;                                          // 0x0720(0x0004)
	float                                              FailedHuntTime;                                           // 0x0724(0x0004)
	class APawn*                                       FailedHuntEnemy;                                          // 0x0728(0x0004)
	float                                              LastSearchTime;                                           // 0x072C(0x0004)
	float                                              LastSearchWeight;                                         // 0x0730(0x0004)
	float                                              CampTime;                                                 // 0x0734(0x0004)
	int                                                LastTaunt;                                                // 0x0738(0x0004)
	int                                                NumRandomJumps;                                           // 0x073C(0x0004)
	string                                             ComboNames[0x4];                                          // 0x0740(0x000C) (NeedCtorLink)
	float                                              LastFireAttempt;                                          // 0x0770(0x0004)
	float                                              GatherTime;                                               // 0x0774(0x0004)
	FName                                              OrderNames[0x10];                                         // 0x0778(0x0004) (Edit)
	FName                                              OldOrders;                                                // 0x07B8(0x0004)
	class AController*                                 OldOrderGiver;                                            // 0x07BC(0x0004)
	struct FVector                                     LastKnownPosition;                                        // 0x07C0(0x000C)
	struct FVector                                     LastKillerPosition;                                       // 0x07CC(0x000C)
	class ANavigationPoint*                            TestStart;                                                // 0x07D8(0x0004)
	int                                                TestPath;                                                 // 0x07DC(0x0004)
	FName                                              TestLabel;                                                // 0x07E0(0x0004)

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
	void SoakStop(const string& problem);
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
	string GetEnemyName();
	string GetOldEnemyName();
	void WhatToDoNext(byte CallingByte);
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
	void BotVoiceMessage(const FName& MessageType, byte MessageID, class AController* Sender);
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
	void SetTemporaryOrders(const FName& NewOrders, class AController* OrderGiver);
	void SetOrders(const FName& NewOrders, class AController* OrderGiver);
	void SendMessage(class APlayerReplicationInfo* Recipient, const FName& MessageType, byte MessageID, float wait, const FName& BroadcastType);
	byte GetMessageIndex(const FName& PhraseName);
	void YellAt(class APawn* Moron);
	class AActor* GetOrderObject();
	FName GetOrders();
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
	void TryCombo(const string& ComboName);
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
	FName                                              AlternatePathTag;                                         // 0x0448(0x0004)
	class ABot*                                        SquadMembers;                                             // 0x044C(0x0004)
	float                                              GatherThreshold;                                          // 0x0450(0x0004)
	string                                             SupportString;                                            // 0x0454(0x000C) (Localized, NeedCtorLink)
	string                                             DefendString;                                             // 0x0460(0x000C) (Localized, NeedCtorLink)
	string                                             AttackString;                                             // 0x046C(0x000C) (Localized, NeedCtorLink)
	string                                             HoldString;                                               // 0x0478(0x000C) (Localized, NeedCtorLink)
	string                                             FreelanceString;                                          // 0x0484(0x000C) (Localized, NeedCtorLink)
	string                                             SupportStringTrailer;                                     // 0x0490(0x000C) (Localized, NeedCtorLink)
	FName                                              CurrentOrders;                                            // 0x049C(0x0004) (Net)
	class APawn*                                       enemies[0x8];                                             // 0x04A0(0x0004)
	int                                                MaxSquadSize;                                             // 0x04C0(0x0004)
	bool                                               bFreelance;                                               // 0x04C4(0x0004) (Net)
	bool                                               bFreelanceAttack;                                         // 0x04C4(0x0004)
	bool                                               bFreelanceDefend;                                         // 0x04C4(0x0004)
	bool                                               bRoamingSquad;                                            // 0x04C4(0x0004)
	bool                                               bAddTransientCosts;                                       // 0x04C4(0x0004)
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
	string GetShortOrderStringFor(class ATeamPlayerReplicationInfo* PRI);
	string GetOrderStringFor(class ATeamPlayerReplicationInfo* PRI);
	FName GetOrders();
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
	byte PriorityObjective(class ABot* B);
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
	bool                                               bHome;                                                    // 0x0424(0x0004) (Net)
	bool                                               bHeld;                                                    // 0x0424(0x0004) (Net)
	bool                                               bDisabled;                                                // 0x0424(0x0004)
	bool                                               bLastSecondSave;                                          // 0x0424(0x0004)
	class AUnrealPawn*                                 Holder;                                                   // 0x0428(0x0004)
	class ATeamPlayerReplicationInfo*                  HolderPRI;                                                // 0x042C(0x0004) (Net)
	class AGameObjective*                              HomeBase;                                                 // 0x0430(0x0004)
	float                                              TakenTime;                                                // 0x0434(0x0004)
	float                                              MaxDropTime;                                              // 0x0438(0x0004)
	class AController*                                 FirstTouch;                                               // 0x043C(0x0004)
	class AController*[]                               Assists;                                                  // 0x0440(0x000C) (NeedCtorLink)
	FName                                              GameObjBone;                                              // 0x044C(0x0004)
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
	void FellOutOfWorld(EeKillZType KillType);
	void Touch(class AActor* Other);
	bool ValidHolder(class AActor* Other);
	bool IsHome();
	class AActor* Position();
	void SetDisable(bool Disable);
	void ClearHolder();
	void CalcSetHome();
	void SendHomeDisabled(float TimeOut);
	void SendHome();
	void Drop(const struct FVector& NewVel, const string& sReason);
	void Score();
	void SetHolder(class AController* C);
	bool CanBePickedUpBy(class APawn* P);
	bool CanBeThrownBy(class APawn* P);
	void ForceBegin();
	void PostBeginPlay();
};


// Class UnrealGame.DeathMatch
// 0x0778 (0x1238 - 0x0AC0)
class ADeathMatch : public AUnrealMPGameInfo
{
public:
	struct FAddBotInfo[]                               AddBotQueue;                                              // 0x0AC0(0x000C) (NeedCtorLink)
	int                                                NetWait;                                                  // 0x0ACC(0x0004) (Config)
	int                                                NetWaitClan;                                              // 0x0AD0(0x0004) (Config)
	int                                                MinNetPlayers;                                            // 0x0AD4(0x0004)
	int                                                RestartWait;                                              // 0x0AD8(0x0004)
	bool                                               bForceNoPlayerLights;                                     // 0x0ADC(0x0004)
	bool                                               GiveBotsFakeUID;                                          // 0x0ADC(0x0004)
	bool                                               bAlwaysShowLoginMenu;                                     // 0x0ADC(0x0004) (Edit)
	bool                                               bAllowPlayerLights;                                       // 0x0ADC(0x0004)
	bool                                               bReviewingJumpSpots;                                      // 0x0ADC(0x0004)
	bool                                               bCustomBots;                                              // 0x0ADC(0x0004)
	bool                                               bEpicNames;                                               // 0x0ADC(0x0004)
	bool                                               bKillBots;                                                // 0x0ADC(0x0004)
	bool                                               bDefaultTranslocator;                                     // 0x0ADC(0x0004)
	bool                                               bOverrideTranslocator;                                    // 0x0ADC(0x0004)
	bool                                               bWaitForNetPlayers;                                       // 0x0ADC(0x0004)
	bool                                               bFirstBlood;                                              // 0x0ADC(0x0004)
	bool                                               bQuickStart;                                              // 0x0ADC(0x0004)
	bool                                               bSkipPlaySound;                                           // 0x0ADC(0x0004)
	bool                                               bStartedCountDown;                                        // 0x0ADC(0x0004)
	bool                                               bFinalStartup;                                            // 0x0ADC(0x0004)
	bool                                               bOverTimeBroadcast;                                       // 0x0ADC(0x0004)
	bool                                               bTournament;                                              // 0x0ADC(0x0004)
	bool                                               bAutoNumBots;                                             // 0x0ADC(0x0004)
	bool                                               bColoredDMSkins;                                          // 0x0ADC(0x0004)
	bool                                               bPlayersMustBeReady;                                      // 0x0ADC(0x0004)
	bool                                               bForceRespawn;                                            // 0x0ADC(0x0004)
	bool                                               bAdjustSkill;                                             // 0x0ADC(0x0004)
	bool                                               bAllowTaunts;                                             // 0x0ADC(0x0004)
	bool                                               bAllowTrans;                                              // 0x0ADC(0x0004)
	class AVehicle*[]                                  Vehicles;                                                 // 0x0AE0(0x000C) (NeedCtorLink)
	bool                                               bForceDefaultCharacter;                                   // 0x0AEC(0x0004)
	bool                                               bPlayerBecameActive;                                      // 0x0AEC(0x0004)
	bool                                               bMustHaveMultiplePlayers;                                 // 0x0AEC(0x0004)
	byte                                               StartupStage;                                             // 0x0AF0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0AF1(0x0003) MISSED OFFSET
	int                                                NumRounds;                                                // 0x0AF4(0x0004)
	float                                              SpawnProtectionTime;                                      // 0x0AF8(0x0004)
	int                                                DefaultMaxLives;                                          // 0x0AFC(0x0004)
	int                                                LateEntryLives;                                           // 0x0B00(0x0004)
	int                                                RemainingTime;                                            // 0x0B04(0x0004)
	int                                                ElapsedTime;                                              // 0x0B08(0x0004)
	int                                                CountDown;                                                // 0x0B0C(0x0004)
	float                                              AdjustedDifficulty;                                       // 0x0B10(0x0004)
	int                                                PlayerKills;                                              // 0x0B14(0x0004)
	int                                                PlayerDeaths;                                             // 0x0B18(0x0004)
	class UClass*                                      DMSquadClass;                                             // 0x0B1C(0x0004)
	class UClass*                                      LevelRulesClass;                                          // 0x0B20(0x0004)
	class ALevelGameRules*                             LevelRules;                                               // 0x0B24(0x0004)
	class AUnrealTeamInfo*                             EnemyRoster;                                              // 0x0B28(0x0004)
	string                                             EnemyRosterName;                                          // 0x0B2C(0x000C) (NeedCtorLink)
	string                                             DefaultEnemyRosterClass;                                  // 0x0B38(0x000C) (NeedCtorLink)
	int                                                RemainingBots;                                            // 0x0B44(0x0004)
	int                                                InitialBots;                                              // 0x0B48(0x0004)
	class ANavigationPoint*                            LastPlayerStartSpot;                                      // 0x0B4C(0x0004)
	class ANavigationPoint*                            LastStartSpot;                                            // 0x0B50(0x0004)
	int                                                NameNumber;                                               // 0x0B54(0x0004)
	int                                                EndMessageWait;                                           // 0x0B58(0x0004)
	int                                                EndMessageCounter;                                        // 0x0B5C(0x0004) (Transient)
	FName                                              AltEndGameSoundName[0x2];                                 // 0x0B60(0x0004)
	int                                                SinglePlayerWait;                                         // 0x0B68(0x0004)
	string                                             NamePrefixes[0xA];                                        // 0x0B6C(0x000C) (NeedCtorLink)
	string                                             NameSuffixes[0xA];                                        // 0x0BE4(0x000C) (NeedCtorLink)
	class AActor*                                      EndGameFocus;                                             // 0x0C5C(0x0004)
	class APlayerController*                           StandalonePlayer;                                         // 0x0C60(0x0004)
	string                                             DMPropsDisplayText[0xE];                                  // 0x0C64(0x000C) (Localized, NeedCtorLink)
	string                                             DMPropDescText[0xE];                                      // 0x0D0C(0x000C) (Localized, NeedCtorLink)
	string                                             YouDestroyed;                                             // 0x0DB4(0x000C) (Localized, NeedCtorLink)
	string                                             YouDestroyedTrailer;                                      // 0x0DC0(0x000C) (Localized, NeedCtorLink)
	float                                              ADR_Kill;                                                 // 0x0DCC(0x0004) (Edit)
	float                                              ADR_MajorKill;                                            // 0x0DD0(0x0004) (Edit)
	float                                              ADR_MinorError;                                           // 0x0DD4(0x0004) (Edit)
	float                                              ADR_MinorBonus;                                           // 0x0DD8(0x0004) (Edit)
	float                                              ADR_KillTeamMate;                                         // 0x0DDC(0x0004) (Edit)
	string                                             EpicNames[0x15];                                          // 0x0DE0(0x000C) (NeedCtorLink)
	string                                             MaleBackupNames[0x20];                                    // 0x0EDC(0x000C) (NeedCtorLink)
	string                                             FemaleBackupNames[0x20];                                  // 0x105C(0x000C) (NeedCtorLink)
	int                                                EpicOffset;                                               // 0x11DC(0x0004)
	int                                                TotalEpic;                                                // 0x11E0(0x0004)
	int                                                MaleBackupNameOffset;                                     // 0x11E4(0x0004)
	int                                                FemaleBackupNameOffset;                                   // 0x11E8(0x0004)
	string                                             LoginMenuClass;                                           // 0x11EC(0x000C) (Edit, Config, NeedCtorLink)
	string[]                                           DMHints;                                                  // 0x11F8(0x000C) (Edit, Localized, NeedCtorLink)
	float                                              InventoryListLastTime;                                    // 0x1204(0x0004)
	int                                                StartPlayerNum;                                           // 0x1208(0x0004)
	FName                                              VoiceTimesUp;                                             // 0x120C(0x0004)
	string                                             sndModeName;                                              // 0x1210(0x000C) (NeedCtorLink)
	string                                             sndModeExplain;                                           // 0x121C(0x000C) (NeedCtorLink)
	class APawn*[]                                     InventoryList;                                            // 0x1228(0x000C) (NeedCtorLink)
	bool                                               SendMatchOverEndState;                                    // 0x1234(0x0004)
	bool                                               SendMatchOverState;                                       // 0x1234(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.DeathMatch");
		return ptr;
	}


	void PermitWeaponChangeInSpecialMode();
	void AnnounceSentryGun_Destory(int iTeamIndex);
	void AnnounceSentryGun_Spawn(class AController* Caller);
	void AnnounceUAV(class AController* Caller);
	void AnnounceHelicopter(class AController* Caller);
	void AnnounceArtillery(class AController* Caller);
	string[] STATIC_GetAllLoadHints(bool bThisClassOnly);
	string STATIC_GetNextLoadHint(const string& MapName);
	void SetGrammar();
	void STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds);
	bool WantsPickups(class ABot* B);
	void EndSpree(class AController* Killer, class AController* Other);
	void NotifySpree(class AController* Other, int Num);
	string STATIC_GetDescriptionText(const string& PropName);
	string STATIC_GetDisplayText(const string& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	bool STATIC_AcceptPlayInfoProperty(const string& PropertyName);
	void ReviewJumpSpots(const FName& TestLabel);
	void addaistrike(int Num);
	void addaifire(const string& Num, const string& Team);
	void addai(const string& Num, const string& Team);
	void addaibot(const string& Num, const string& Team, const string& Grade, const string& NPCID);
	void AddwAIBot(const string& strNum, const string& strTeam, const string& aiClass, const string& strGrade, const string& strNPCID, const string& strRegenLocationIndex, class AController* callerController, bool bUseDynamicRegenLocation, const struct FVector& v3DynamicRegenLocation, float fDynamicRegenPitch, bool bUseFakeID);
	bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, int[] AFBotID, int[] RSABotID);
	void HandleGetBotID(int Team, int[] BotID);
	void EnqueueAddBot(class UClass* BotClass, class AController* callerController, int Team, int Grade, int NPCID, int iRegenLocationIndex, bool bUseDynamicRegenLocation, const struct FVector& v3DynamicRegenLocation, float fDynamicRegenPitch);
	void Killaibots(int Num);
	void Kill(class AController* C);
	void KillBots(int Num);
	void AddBots(int Num);
	void AddNamedBot(const string& botname);
	void dobalancebots();
	void setFakeUID();
	int ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum);
	void AdjustSkill(class AAIController* B, class APlayerController* P, bool bWinner);
	void ScoreKill(class AController* Killer, class AController* Other);
	void ScoreObjective(class APlayerReplicationInfo* Scorer, float Score);
	void CheckScore(class APlayerReplicationInfo* Scorer);
	bool CheckMaxLives(class APlayerReplicationInfo* Scorer);
	float RatePlayerStart(class ANavigationPoint* N, byte Team, class AController* Player);
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
	class ANavigationPoint* FindPlayerStart_TU(class AController* Player, byte inTeam, const string& incomingName);
	class ANavigationPoint* FindPlayerStart(class AController* Player, byte inTeam, const string& incomingName);
	void SetGameEndType(const string& Reason);
	void EndGame(class APlayerReplicationInfo* Winner, const string& Reason);
	void AnnounceMatchInfo();
	void BalanceBots();
	void StartMatch();
	class AUnrealTeamInfo* FindTeamFor(class AController* C);
	void InitPlacedBot(class AController* C, class URosterEntry* R);
	void InitializeBot(class ABot* NewBot, class AUnrealTeamInfo* BotTeam, class URosterEntry* Chosen);
	class ABot* SpawnBot(const string& botname);
	void PreLoadBot();
	void PreLoadNamedBot(const string& botname);
	class AUnrealTeamInfo* GetBotTeam2(bool forceTeam, int Team);
	class AUnrealTeamInfo* GetBotTeam(int TeamBots);
	void InitTeamSymbols();
	void InitGameReplicationInfo();
	void GetServerDetails(struct FServerResponseLine* ServerState);
	bool NeedPlayers();
	void Logout(class AController* Exiting);
	bool AllowBecomeActivePlayer(class APlayerController* P);
	bool BecomeSpectator(class APlayerController* P);
	void ChangeName(class AController* Other, const string& S, bool bNameChange);
	bool ShouldRespawn(class APickup* Other);
	bool CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget);
	void Proccess_AddDefaultInventory(class APawn* PlayerPawn);
	void AddDefaultInventory(class APawn* PlayerPawn);
	bool AddBot(const string& botname);
	void ForceAddBot();
	bool TooManyBots(class AController* botToRemove);
	void RestartPlayer(class AController* aPlayer);
	void ChangeLoadOut(class APlayerController* P, const string& LoadoutName);
	void PostLogin(class APlayerController* NewPlayer);
	class APlayerController* Login(const string& Portal, const string& Options, string* Error);
	bool AtCapacity(bool bSpectator);
	void PlayWinMessage(class APlayerController* Player, bool bWinner);
	bool CheckEndGame(class APlayerReplicationInfo* Winner, const string& Reason);
	bool CheckEndGameCondition();
	void AcceptInventory(class APawn* PlayerPawn);
	int GetMinPlayers();
	void TweakSkill(class ABot* B);
	void InitGame(const string& Options, string* Error);
	void AddGameSpecificInventory(class APawn* P);
	bool AllowTransloc();
	bool STATIC_NeverAllowTransloc();
	void InitLogging();
	int VehicleScoreKill(class AController* Killer, class AController* Killed, class AVehicle* DestroyedVehicle, string* KillInfo);
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


// Class UnrealGame.UnrealPlayer
// 0x009C (0x0E44 - 0x0DA8)
class AUnrealPlayer : public APlayerController
{
public:
	bool                                               bRising;                                                  // 0x0DA8(0x0004)
	bool                                               bLatecomer;                                               // 0x0DA8(0x0004)
	bool                                               bDisplayLoser;                                            // 0x0DA8(0x0004)
	bool                                               bDisplayWinner;                                           // 0x0DA8(0x0004)
	int                                                LastTaunt;                                                // 0x0DAC(0x0004)
	float                                              LastWhispTime;                                            // 0x0DB0(0x0004)
	float                                              LastKillTime;                                             // 0x0DB4(0x0004) (Edit)
	float                                              LastTauntAnimTime;                                        // 0x0DB8(0x0004)
	float                                              LastAutoTauntTime;                                        // 0x0DBC(0x0004)
	string                                             CustomizedAnnouncerPack;                                  // 0x0DC0(0x000C) (NeedCtorLink)
	string                                             CustomStatusAnnouncerPack;                                // 0x0DCC(0x000C) (NeedCtorLink)
	string                                             CustomRewardAnnouncerPack;                                // 0x0DD8(0x000C) (NeedCtorLink)
	string[]                                           RejoinChannels;                                           // 0x0DE4(0x000C) (Transient, Config, GlobalConfig, NeedCtorLink)
	string[]                                           RecentServers;                                            // 0x0DF0(0x000C) (NeedCtorLink)
	int                                                MaxRecentServers;                                         // 0x0DFC(0x0004)
	bool                                               bDontShowLoginMenu;                                       // 0x0E00(0x0004)
	bool                                               bReadyToStart;                                            // 0x0E00(0x0004)
	string                                             LoginMenuClass;                                           // 0x0E04(0x000C) (NeedCtorLink)
	bool                                               bForceLoginMenu;                                          // 0x0E10(0x0004)
	float                                              LastKickWarningTime;                                      // 0x0E14(0x0004)
	string                                             NetBotDebugString;                                        // 0x0E18(0x000C) (NeedCtorLink)
	FName                                              DirName;                                                  // 0x0E24(0x0004)
	struct FRotator                                    rAttackedZoomCameraS;                                     // 0x0E28(0x000C)
	float                                              fAttackedCamera3DZoomRatioS;                              // 0x0E34(0x0004)
	float                                              fAttackedWeapon3DZoomRatioS;                              // 0x0E38(0x0004)
	float                                              fAttacked3DZoomSpeed;                                     // 0x0E3C(0x0004)
	float                                              fAttacked3DZoomDecayAcc;                                  // 0x0E40(0x0004)

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
	void ClientReceiveBotDebugString(const string& DebugString);
	void ServerSendBotDebugString();
	void NetDebugBot();
	void ServerChatDebug();
	void ClientGameEnded();
	void AutoJoinVoiceChat();
	void PostNetBeginPlay();
	bool NeedNetNotify();
	void SetCustomRewardAnnouncerClass(const string& NewAnnouncerClass);
	string GetCustomRewardAnnouncerClass();
	void SetCustomStatusAnnouncerClass(const string& NewAnnouncerClass);
	string GetCustomStatusAnnouncerClass();
	void ShowMidGameMenu(bool bPause);
	void ServerDropFlag();
	void DropFlag();
	void PlayWinMessage(bool bWinner);
	void ClientPlayTakeHit(const struct FVector& HitLoc, byte Damage, class UClass* DamageType, int CollisionPart);
	void HitSound();
	void NewClientPlayTakeHit(const struct FVector& AttackLoc, const struct FVector& HitLoc, byte Damage, class UClass* DamageType, int iWeaponID, float fHitGunKick, int CollisionPart);
	void NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void ShowLoginMenu();
	void ClientReceiveLoginMenu(const string& MenuClass, bool bForce);
	void ServerSetReadyToStart();
	void InitInputSystem();
	void PostNetReceive();
	void PlayStartupMessage(byte StartupStage);
	void KickWarning();
	void PlayAnnouncement(class USound* ASound, byte AnnouncementLevel, bool bForce);
	void PlayRewardAnnouncement(const FName& AName, byte AnnouncementLevel, bool bForce, ESoundSlot Slot, bool isWomanVoice);
	void PlayStatusAnnouncement(const string& AName, byte AnnouncementLevel, bool bForce);
	void ServerPlayVehicleHorn(int HornIndex);
	void PlayVehicleHorn(int HornIndex);
	void ServerTaunt(const FName& AnimName);
	void TAUNT(const FName& Sequence);
	void RandomTaunt();
	byte GetMessageIndex(const FName& PhraseName);
	void ServerShowPathToBase(int TeamNum);
	void BasePath(byte Num);
	void SoakPause(class APawn* P);
	void SoakBots();
	bool DontReuseTaunt(int t);
	bool AutoTaunt();
	void Possess(class APawn* aPawn);
	void ShowAI();
	void LogMultiKills(float Reward, bool bEnemyKill);
	void ClientDelayedAnnouncement(class USound* AnnouncementSound, byte Delay);
	void ClientDelayedAnnouncementNamed(const FName& Announcement, byte Delay);
	void AwardAdrenaline(float Amount);
	void PostBeginPlay();
	void ClientSendStats(class ATeamPlayerReplicationInfo* PRI, int newgoals, bool bNewFirstBlood, int newKills, int newsuicides, int newFlagTouches, int newFlagReturns, int newFlakCount, int newComboCount, int newHeadCount, int newRanOverCount, int newDaredevilPoints);
	void ClientSendCombos(class ATeamPlayerReplicationInfo* PRI, byte Combos0, byte Combos1, byte Combos2, byte Combos3, byte Combos4);
	void ClientSendMultiKills(class ATeamPlayerReplicationInfo* PRI, byte MultiKills0, byte MultiKills1, byte MultiKills2, byte MultiKills3, byte MultiKills4, byte MultiKills5, byte MultiKills6);
	void ClientSendSprees(class ATeamPlayerReplicationInfo* PRI, byte Spree0, byte Spree1, byte Spree2, byte Spree3, byte Spree4, byte Spree5);
	void ClientSendVehicle(class ATeamPlayerReplicationInfo* PRI, class UClass* V, int Kills, int Deaths, int DeathsDriving, int i);
	void ClientSendWeapon(class ATeamPlayerReplicationInfo* PRI, class UClass* W, int Kills, int Deaths, int deathsholding, int i);
	void ServerGetNextVehicleStats(class ATeamPlayerReplicationInfo* PRI, int i);
	void ServerGetNextWeaponStats(class ATeamPlayerReplicationInfo* PRI, int i);
	void ServerUpdateStatArrays(class ATeamPlayerReplicationInfo* PRI);
	void ServerUpdateStats(class ATeamPlayerReplicationInfo* PRI);
};


// Class UnrealGame.JumpSpot
// 0x0070 (0x05B8 - 0x0548)
class AJumpSpot : public AJumpDest
{
public:
	bool                                               bOnlyTranslocator;                                        // 0x0548(0x0004) (Edit)
	bool                                               bRealOnlyTranslocator;                                    // 0x0548(0x0004)
	bool                                               bNeverImpactJump;                                         // 0x0548(0x0004) (Edit)
	bool                                               bNoLowGrav;                                               // 0x0548(0x0004) (Edit)
	bool                                               bForceAllowDoubleJumping;                                 // 0x0548(0x0004) (Edit)
	bool                                               bDodgeUp;                                                 // 0x0548(0x0004) (Edit)
	FName                                              TranslocTargetTag;                                        // 0x054C(0x0004) (Edit)
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
	bool                                               bFirstScript;                                             // 0x0400(0x0004)
	bool                                               bSniping;                                                 // 0x0400(0x0004) (Edit)
	bool                                               bDontChangeScripts;                                       // 0x0400(0x0004) (Edit)
	bool                                               bFreelance;                                               // 0x0400(0x0004)
	bool                                               bRoamingScript;                                           // 0x0400(0x0004) (Edit)
	bool                                               bAvoid;                                                   // 0x0400(0x0004)
	bool                                               bDisabled;                                                // 0x0400(0x0004)
	bool                                               bNotInVehicle;                                            // 0x0400(0x0004) (Edit)
	byte                                               Priority;                                                 // 0x0404(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0405(0x0003) MISSED OFFSET
	FName                                              EnemyAcquisitionScriptTag;                                // 0x0408(0x0004) (Edit)
	float                                              EnemyAcquisitionScriptProbability;                        // 0x040C(0x0004) (Edit)
	FName                                              SnipingVolumeTag;                                         // 0x0410(0x0004) (Edit)
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
// 0x039C (0x15D4 - 0x1238)
class ATeamGame : public ADeathMatch
{
public:
	bool                                               bBalanceTeams;                                            // 0x1238(0x0004)
	bool                                               bPlayersBalanceTeams;                                     // 0x1238(0x0004)
	bool                                               bAllowNonTeamChat;                                        // 0x1238(0x0004)
	bool                                               bScoreTeamKills;                                          // 0x1238(0x0004)
	bool                                               bSpawnInTeamArea;                                         // 0x1238(0x0004)
	bool                                               bScoreVictimsTarget;                                      // 0x1238(0x0004)
	float                                              FriendlyFireScale;                                        // 0x123C(0x0004)
	int                                                MaxTeamSize;                                              // 0x1240(0x0004)
	float                                              TeammateBoost;                                            // 0x1244(0x0004)
	class AUnrealTeamInfo*                             Teams[0x2];                                               // 0x1248(0x0004)
	string                                             BlueTeamName;                                             // 0x1250(0x000C) (NeedCtorLink)
	string                                             RedTeamName;                                              // 0x125C(0x000C) (NeedCtorLink)
	class UClass*                                      TeamAIType[0x2];                                          // 0x1268(0x0004)
	string                                             PathWhisps[0x2];                                          // 0x1270(0x000C) (NeedCtorLink)
	string                                             NearString;                                               // 0x1288(0x000C) (Localized, NeedCtorLink)
	string                                             BareHanded;                                               // 0x1294(0x000C) (Localized, NeedCtorLink)
	FName                                              CaptureSoundName[0x2];                                    // 0x12A0(0x0004)
	FName                                              TakeLeadName[0x2];                                        // 0x12A8(0x0004)
	FName                                              IncreaseLeadName[0x2];                                    // 0x12B0(0x0004)
	string                                             TGPropsDisplayText[0x5];                                  // 0x12B8(0x000C) (Localized, NeedCtorLink)
	string                                             TGPropDescText[0x5];                                      // 0x12F4(0x000C) (Localized, NeedCtorLink)
	string[]                                           TGHints;                                                  // 0x1330(0x000C) (Edit, Localized, NeedCtorLink)
	float                                              ADR_Goal;                                                 // 0x133C(0x0004) (Edit)
	float                                              ADR_Return;                                               // 0x1340(0x0004) (Edit)
	float                                              ADR_Control;                                              // 0x1344(0x0004) (Edit)
	class UTexture*                                    TempSymbols[0x2];                                         // 0x1348(0x0004)
	float                                              LastEndGameTauntTime;                                     // 0x1350(0x0004)
	string                                             EndGameComments[0xA];                                     // 0x1354(0x000C) (Localized, NeedCtorLink)
	string                                             EndGameTaunts[0xA];                                       // 0x13CC(0x000C) (Localized, NeedCtorLink)
	string                                             EndGameVictoryRemarks[0xA];                               // 0x1444(0x000C) (Localized, NeedCtorLink)
	string                                             EndGameLossRemarks[0xA];                                  // 0x14BC(0x000C) (Localized, NeedCtorLink)
	string                                             EndGameResponses[0xA];                                    // 0x1534(0x000C) (Localized, NeedCtorLink)
	byte                                               EndGameCommented[0xA];                                    // 0x15AC(0x0001)
	byte                                               EndGameRemark[0xA];                                       // 0x15B6(0x0001)
	int                                                LastEndGameComment;                                       // 0x15C0(0x0004)
	int                                                LastEndGameRemark;                                        // 0x15C4(0x0004)
	int                                                LastEndGameResponse;                                      // 0x15C8(0x0004)
	int                                                iCurWinningTeam;                                          // 0x15CC(0x0004)
	bool                                               bAnnouncedAlmostWinningTeam;                              // 0x15D0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamGame");
		return ptr;
	}


	void EndGameTauntFor(class ABot* B);
	void EndGameCommentFor(class ABot* B);
	bool PickEndGameTauntFor(class ABot* B);
	void WeakObjectives();
	string[] STATIC_GetAllLoadHints(bool bThisClassOnly);
	void PostLogin(class APlayerController* NewPlayer);
	void InitVoiceReplicationInfo();
	void AnnounceScore(int ScoringTeam);
	bool STATIC_AcceptPlayInfoProperty(const string& PropertyName);
	string STATIC_GetDescriptionText(const string& PropName);
	void STATIC_FillPlayInfo(class UPlayInfo* PlayInfo);
	void FindNewObjectives(class AGameObjective* DisabledObjective);
	string STATIC_ParseMessageString(class AMutator* BaseMutator, class AController* Who, const string& Message);
	string STATIC_FindTeamDesignation(class AGameReplicationInfo* GRI, class AActor* A);
	string STATIC_ParseChatPercVar(class AMutator* BaseMutator, class AController* Who, const string& Cmd);
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
	float RatePlayerStart(class ANavigationPoint* N, byte Team, class AController* Player);
	bool ChangeTeam(class AController* Other, int iTeamID, bool bNewTeam);
	int GetTeamID_by_Balancing(int iTeamID, class AController* C);
	class AUnrealTeamInfo* FindTeamFor(class AController* C);
	class AUnrealTeamInfo* GetBotTeam2(bool forceTeam, int Team);
	class AUnrealTeamInfo* GetBotTeam(int TeamBots);
	void GetServerDetails(struct FServerResponseLine* ServerState);
	bool CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget);
	void SetEndGameFocus(class APlayerReplicationInfo* Winner);
	bool CheckEndGame(class APlayerReplicationInfo* Winner, const string& Reason);
	void IncrementGoalsScored(class APlayerReplicationInfo* PRI);
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	void RestartPlayer(class AController* aPlayer);
	void ShowPathTo(class APlayerController* P, int TeamNum);
	bool CanShowPathTo(class APlayerController* P, int TeamNum);
	int GetMinPlayers();
	void InitTeamSymbols();
	void InitGame(const string& Options, string* Error);
	class AUnrealTeamInfo* GetRedTeam(int TeamBots);
	class AUnrealTeamInfo* GetBlueTeam(int TeamBots);
	void PreLoadBot();
	void PreLoadNamedBot(const string& botname);
	void OverrideInitialBots();
	class ATeamInfo* OtherTeam(class ATeamInfo* Requester);
	bool CheckMaxLives(class APlayerReplicationInfo* Scorer);
	void UpdateAnnouncements();
	void STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds);
	int BallCarrierMessage();
	int GetStatus(class APlayerController* Sender, class ABot* B);
	void ParseVoiceCommand(class APlayerController* Sender, const string& RecognizedString);
	void ParseRecipients(int* RecipientIDs, int* NumRecipients, string* OrderString);
	int ParseRecipient(const string& Recipient);
	bool ApplyOrder(class APlayerController* Sender, int RecipientID, int OrderID);
	int ParseOrder(const string& OrderString);
	void StartMatch();
	int[] GetTeamScores();
	class UClass* GetWaitViewClass(byte Team);
	void SetGrammar();
	void PostBeginPlay();
};


// Class UnrealGame.GameObjective
// 0x0118 (0x06D0 - 0x05B8)
class AGameObjective : public AJumpSpot
{
public:
	float                                              DrawDistThresHold;                                        // 0x05B8(0x0004) (Edit)
	bool                                               bSoundsPrecached;                                         // 0x05BC(0x0004)
	bool                                               bIsCritical;                                              // 0x05BC(0x0004) (Net)
	bool                                               bHighlightPhysicalObjective;                              // 0x05BC(0x0004) (Net)
	bool                                               bOldHighlightPhysicalObjective;                           // 0x05BC(0x0004)
	bool                                               bIsBeingAttacked;                                         // 0x05BC(0x0004)
	bool                                               bClearInstigator;                                         // 0x05BC(0x0004)
	bool                                               bOldCritical;                                             // 0x05BC(0x0004)
	bool                                               bTeamControlled;                                          // 0x05BC(0x0004) (Edit)
	bool                                               bActive;                                                  // 0x05BC(0x0004) (Net)
	bool                                               bTriggerOnceOnly;                                         // 0x05BC(0x0004) (Edit)
	bool                                               bOptionalObjective;                                       // 0x05BC(0x0004) (Edit)
	bool                                               bIgnoredObjective;                                        // 0x05BC(0x0004)
	bool                                               bDisabled;                                                // 0x05BC(0x0004) (Net)
	bool                                               bOldDisabled;                                             // 0x05BC(0x0004)
	bool                                               bFirstObjective;                                          // 0x05BC(0x0004)
	bool                                               bPlayCriticalAssaultAlarm;                                // 0x05BC(0x0004) (Edit)
	bool                                               bAccruePoints;                                            // 0x05BC(0x0004) (Edit)
	bool                                               bHasShootSpots;                                           // 0x05BC(0x0004)
	bool                                               bUsePriorityOnHUD;                                        // 0x05BC(0x0004) (Edit)
	bool                                               bOverrideZoneCheck;                                       // 0x05BC(0x0004) (Edit)
	bool                                               bOverrideVisibilityCheck;                                 // 0x05BC(0x0004) (Edit)
	bool                                               bReplicateObjective;                                      // 0x05BC(0x0004) (Edit)
	bool                                               bAnnounceNextObjective;                                   // 0x05BC(0x0004) (Edit)
	bool                                               bMustBoardVehicleFirst;                                   // 0x05BC(0x0004) (Edit)
	bool                                               bBotOnlyObjective;                                        // 0x05BC(0x0004) (Edit)
	bool                                               bInitiallyActive;                                         // 0x05BC(0x0004) (Edit)
	byte                                               DefenderTeamIndex;                                        // 0x05C0(0x0001) (Edit, Net)
	byte                                               StartTeam;                                                // 0x05C1(0x0001)
	byte                                               DefensePriority;                                          // 0x05C2(0x0001) (Edit)
	byte                                               Padding00[0x1];                                           // 0x05C3(0x0001) MISSED OFFSET
	int                                                Score;                                                    // 0x05C4(0x0004) (Edit)
	FName                                              DefenseScriptTags;                                        // 0x05C8(0x0004) (Edit)
	class AUnrealScriptedSequence*                     DefenseScripts;                                           // 0x05CC(0x0004)
	string                                             ObjectiveName;                                            // 0x05D0(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             DestructionMessage;                                       // 0x05DC(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             LocationPrefix;                                           // 0x05E8(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             LocationPostfix;                                          // 0x05F4(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             ObjectiveStringPrefix;                                    // 0x0600(0x000C) (Localized, NeedCtorLink)
	string                                             ObjectiveStringSuffix;                                    // 0x060C(0x000C) (Localized, NeedCtorLink)
	class AGameObjective*                              NextObjective;                                            // 0x0618(0x0004)
	class ASquadAI*                                    DefenseSquad;                                             // 0x061C(0x0004)
	class AAssaultPath*                                AlternatePaths;                                           // 0x0620(0x0004)
	FName                                              AreaVolumeTag;                                            // 0x0624(0x0004) (Edit)
	class AVolume*                                     MyBaseVolume;                                             // 0x0628(0x0004)
	float                                              BaseExitTime;                                             // 0x062C(0x0004) (Edit)
	float                                              BaseRadius;                                               // 0x0630(0x0004) (Edit)
	float                                              BotDamageScaling;                                         // 0x0634(0x0004) (Edit)
	FName                                              CriticalObjectiveVolumeTag;                               // 0x0638(0x0004) (Edit)
	class UMaterial*                                   ObjectiveTypeIcon;                                        // 0x063C(0x0004) (Edit)
	byte                                               ObjectivePriority;                                        // 0x0640(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0641(0x0003) MISSED OFFSET
	float                                              LastDrawTime;                                             // 0x0644(0x0004)
	float                                              DrawTime;                                                 // 0x0648(0x0004)
	string                                             ObjectiveDescription;                                     // 0x064C(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             Objective_Info_Attacker;                                  // 0x0658(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             Objective_Info_Defender;                                  // 0x0664(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             UseDescription;                                           // 0x0670(0x000C) (Localized, NeedCtorLink)
	class APlayerReplicationInfo*                      DisabledBy;                                               // 0x067C(0x0004)
	class UMaterial*                                   HighlightOverlay[0x2];                                    // 0x0680(0x0004)
	class AActor*[]                                    PhysicalObjectiveActors;                                  // 0x0688(0x000C) (NeedCtorLink)
	FName                                              PhysicalObjectiveActorsTag;                               // 0x0694(0x0004) (Edit)
	FName                                              EndCameraTag;                                             // 0x0698(0x0004) (Edit)
	class AActor*                                      EndCamera;                                                // 0x069C(0x0004)
	class AController*                                 DelayedDamageInstigatorController;                        // 0x06A0(0x0004)
	FName                                              VehiclePathName;                                          // 0x06A4(0x0004) (Edit)
	class ANavigationPoint*                            VehiclePath;                                              // 0x06A8(0x0004)
	int                                                ObjectiveDisabledTime;                                    // 0x06AC(0x0004) (Net)
	float                                              SavedObjectiveProgress;                                   // 0x06B0(0x0004) (Net)
	struct FScorerRecord[]                             Scorers;                                                  // 0x06B4(0x000C) (NeedCtorLink)
	string                                             ApplyGameInfo;                                            // 0x06C0(0x000C) (NeedCtorLink)
	bool                                               bCanActive;                                               // 0x06CC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.GameObjective");
		return ptr;
	}


	void SetTeam(byte TeamIndex);
	void AwardAssaultScore(int Score);
	void ShareScore(int Score, const string& EventDesc);
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
	bool BetterObjectiveThan(class AGameObjective* Best, byte DesiredTeamNum, byte RequesterTeamNum);
	void PlayDestructionMessage();
	void DisableObjective(class APawn* Instigator);
	void CompleteObjective(class APawn* Instigator);
	int GetNumDefenders();
	bool TellBotHowToDisable(class ABot* B);
	string GetHumanReadableName();
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
	EConstraintInstigator                              ConstraintInstigator;                                     // 0x06D0(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x06D1(0x0003) MISSED OFFSET
	class UClass*                                      ConstraintPawnClass;                                      // 0x06D4(0x0004) (Edit)
	int                                                DamageCapacity;                                           // 0x06D8(0x0004) (Edit)
	FName                                              TakeDamageEvent;                                          // 0x06DC(0x0004) (Edit)
	int                                                DamageEventThreshold;                                     // 0x06E0(0x0004) (Edit)
	int                                                AccumulatedDamage;                                        // 0x06E4(0x0004)
	int                                                Health;                                                   // 0x06E8(0x0004) (Net)
	float                                              LinkHealMult;                                             // 0x06EC(0x0004)
	float                                              VehicleDamageScaling;                                     // 0x06F0(0x0004) (Edit)
	struct FVector                                     AIShootOffset;                                            // 0x06F4(0x000C) (Edit)
	class AShootTarget*                                ShootTarget;                                              // 0x0700(0x0004)
	bool                                               bCanDefenderDamage;                                       // 0x0704(0x0004) (Edit)
	bool                                               bReplicateHealth;                                         // 0x0704(0x0004)
	bool                                               bMonitorUnderAttack;                                      // 0x0704(0x0004)
	bool                                               bIsUnderAttack;                                           // 0x0704(0x0004) (Net)
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
	class URosterEntry*[]                              Roster;                                                   // 0x0494(0x000C) (Edit, ExportObject, NeedCtorLink, EditInline)
	class UClass*                                      AllowedTeamMembers[0x20];                                 // 0x04A0(0x0004) (Edit)
	byte                                               TeamAlliance;                                             // 0x0520(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x0521(0x0003) MISSED OFFSET
	int                                                DesiredTeamSize;                                          // 0x0524(0x0004)
	class ATeamAI*                                     AI;                                                       // 0x0528(0x0004)
	struct FColor                                      HudTeamColor;                                             // 0x052C(0x0004)
	string                                             TeamSymbolName;                                           // 0x0530(0x000C) (NeedCtorLink)
	string[]                                           RosterNames;                                              // 0x053C(0x000C) (NeedCtorLink)
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
	class URosterEntry* GetNamedBot(const string& botname);
	class URosterEntry* GetNextBot(const string& botname);
	void AddNamedBot(const string& botname);
	void AddRandomPlayer();
	bool AlreadyExistsEntry(const string& CharacterName, bool bNoRecursion);
	class URosterEntry* GetRandomPlayer();
	class URosterEntry* ChooseBotClass(const string& botname);
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
	string                                             FmodOnTargetSound;                                        // 0x03D8(0x000C) (Edit, NeedCtorLink)
	class USound*                                      OnTargetSound;                                            // 0x03E4(0x0004) (Edit)
	bool                                               bEnabled;                                                 // 0x03E8(0x0004)
	bool                                               bTriggered;                                               // 0x03E8(0x0004)

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
	FName                                              MoverTag;                                                 // 0x06D4(0x0004) (Edit)
	class AMover*[]                                    LinkedMover;                                              // 0x06D8(0x000C) (NeedCtorLink)
	struct FTouchingPlayer[]                           TouchingPlayers;                                          // 0x06E4(0x000C) (NeedCtorLink)
	class AController*                                 LastPlayerTouching;                                       // 0x06F0(0x0004)
	class AActor*[]                                    Touchers;                                                 // 0x06F4(0x000C) (NeedCtorLink)
	float                                              TotalHeldTime;                                            // 0x0700(0x0004)
	bool                                               bIsHeld;                                                  // 0x0704(0x0004) (Net)
	bool                                               bIsTriggerControl;                                        // 0x0704(0x0004)
	bool                                               bLocationFX;                                              // 0x0704(0x0004) (Edit)
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
	FName                                              OrderList[0x8];                                           // 0x0454(0x0004)
	class APickup*                                     SuperPickups[0x10];                                       // 0x0474(0x0004)
	int                                                NumSuperPickups;                                          // 0x04B4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamAI");
		return ptr;
	}


	void RemoveFromTeam(class AController* Other);
	void CallForHelp(class ABot* B);
	void SetOrders(class ABot* B, const FName& NewOrders, class AController* OrderGiver);
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
	bool                                               bHolding;                                                 // 0x05D8(0x0004) (Net)
	bool                                               bFirstBlood;                                              // 0x05D8(0x0004)
	struct FWeaponStats[]                              WeaponStatsArray;                                         // 0x05DC(0x000C) (NeedCtorLink)
	struct FVehicleStats[]                             VehicleStatsArray;                                        // 0x05E8(0x000C) (NeedCtorLink)
	int                                                FlagTouches;                                              // 0x05F4(0x0004)
	int                                                FlagReturns;                                              // 0x05F8(0x0004)
	byte                                               Spree[0x6];                                               // 0x05FC(0x0001)
	byte                                               MultiKills[0x7];                                          // 0x0602(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0609(0x0003) MISSED OFFSET
	int                                                Suicides;                                                 // 0x060C(0x0004)
	int                                                flakcount;                                                // 0x0610(0x0004)
	int                                                combocount;                                               // 0x0614(0x0004)
	int                                                headcount;                                                // 0x0618(0x0004)
	int                                                ranovercount;                                             // 0x061C(0x0004)
	int                                                DaredevilPoints;                                          // 0x0620(0x0004)
	byte                                               Combos[0x5];                                              // 0x0624(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0629(0x0003) MISSED OFFSET

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
	class UClass*[]                                    AccessibleVehicleClasses;                                 // 0x04A4(0x000C) (Edit, NeedCtorLink)
	FName                                              AssociatedActorTag;                                       // 0x04B0(0x0004) (Edit)
	float                                              MaxDist;                                                  // 0x04B4(0x0004) (Edit)
	class AActor*                                      AssociatedActor;                                          // 0x04B8(0x0004)
	bool                                               bEnabled;                                                 // 0x04BC(0x0004)
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
	FName                                              ObjectiveTag;                                             // 0x04AC(0x0004) (Edit)
	FName                                              PathTag[0x4];                                             // 0x04B0(0x0004) (Edit)
	bool                                               bEnabled;                                                 // 0x04C0(0x0004) (Edit)
	bool                                               bNoReturn;                                                // 0x04C0(0x0004) (Edit)
	bool                                               bReturnOnly;                                              // 0x04C0(0x0004) (Edit)
	bool                                               bFirstPath;                                               // 0x04C0(0x0004)
	bool                                               bLastPath;                                                // 0x04C0(0x0004)
	bool                                               bNoGrouping;                                              // 0x04C0(0x0004) (Edit)
	float                                              Priority;                                                 // 0x04C4(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.AssaultPath");
		return ptr;
	}


	class AAssaultPath* FindPreviousPath(const FName& AlternatePathTag);
	class AAssaultPath* FindNextPath(const FName& AlternatePathTag);
	bool HasPathTag(const FName& aPathTag);
	FName PickTag();
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
	string                                             StatsString;                                              // 0x0444(0x000C) (Localized, NeedCtorLink)
	string                                             AwardsString;                                             // 0x0450(0x000C) (Localized, NeedCtorLink)
	string                                             FirstBloodString;                                         // 0x045C(0x000C) (Localized, NeedCtorLink)
	string                                             SuicidesString;                                           // 0x0468(0x000C) (Localized, NeedCtorLink)
	string                                             LongestSpreeString;                                       // 0x0474(0x000C) (Localized, NeedCtorLink)
	string                                             FlakMonkey;                                               // 0x0480(0x000C) (Localized, NeedCtorLink)
	string                                             ComboWhore;                                               // 0x048C(0x000C) (Localized, NeedCtorLink)
	string                                             HeadHunter;                                               // 0x0498(0x000C) (Localized, NeedCtorLink)
	string                                             RoadRampage;                                              // 0x04A4(0x000C) (Localized, NeedCtorLink)
	string                                             DaredevilString;                                          // 0x04B0(0x000C) (Localized, NeedCtorLink)
	string                                             FlagTouches;                                              // 0x04BC(0x000C) (Localized, NeedCtorLink)
	string                                             FlagReturns;                                              // 0x04C8(0x000C) (Localized, NeedCtorLink)
	string                                             GoalsScored;                                              // 0x04D4(0x000C) (Localized, NeedCtorLink)
	string                                             HatTrick;                                                 // 0x04E0(0x000C) (Localized, NeedCtorLink)
	string                                             KillString[0x7];                                          // 0x04EC(0x000C) (Localized, NeedCtorLink)
	string                                             AdrenalineCombos;                                         // 0x0540(0x000C) (Localized, NeedCtorLink)
	string                                             ComboNames[0x5];                                          // 0x054C(0x000C) (Localized, NeedCtorLink)
	string                                             KillsByWeapon;                                            // 0x0588(0x000C) (Localized, NeedCtorLink)
	string                                             CombatResults;                                            // 0x0594(0x000C) (Localized, NeedCtorLink)
	string                                             Kills;                                                    // 0x05A0(0x000C) (Localized, NeedCtorLink)
	string                                             Deaths;                                                   // 0x05AC(0x000C) (Localized, NeedCtorLink)
	string                                             Suicides;                                                 // 0x05B8(0x000C) (Localized, NeedCtorLink)
	string                                             NextStatsString;                                          // 0x05C4(0x000C) (Localized, NeedCtorLink)
	string                                             WeaponString;                                             // 0x05D0(0x000C) (Localized, NeedCtorLink)
	string                                             DeathsBy;                                                 // 0x05DC(0x000C) (Localized, NeedCtorLink)
	string                                             deathsholding;                                            // 0x05E8(0x000C) (Localized, NeedCtorLink)
	string                                             EfficiencyString;                                         // 0x05F4(0x000C) (Localized, NeedCtorLink)
	string                                             WaitingForStats;                                          // 0x0600(0x000C) (Localized, NeedCtorLink)
	string                                             KillsByVehicle;                                           // 0x060C(0x000C) (Localized, NeedCtorLink)
	string                                             VehicleString;                                            // 0x0618(0x000C) (Localized, NeedCtorLink)
	float                                              LastUpdateTime;                                           // 0x0624(0x0004)
	class UMaterial*                                   BoxMaterial;                                              // 0x0628(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.DMStatsScreen");
		return ptr;
	}


	void NextStats();
	void DrawScoreboard(class UCanvas* C);
	string STATIC_MakeColorCode(const struct FColor& NewColor);
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
	class AVoiceChatRoom*[] GetPlayerChannels();
	class AVoiceChatRoom*[] GetPublicChannels();
	int GetChannelIndex(const string& ChannelTitle, int TeamIndex);
	int GetChannelCount();
	class AVoiceChatRoom*[] GetChannels();
	int[] GetMemberChannels(class APlayerReplicationInfo* PRI);
	int[] GetChannelMembersAt(int Index);
	int[] GetChannelMembers(const string& ChatRoomName, int TeamIndex);
	class AVoiceChatRoom* GetChannelAt(int Index);
	class AVoiceChatRoom* GetChannel(const string& ChatRoomName, int TeamIndex);
	bool RemoveVoiceChannel(class APlayerReplicationInfo* PRI);
	class AVoiceChatRoom* AddVoiceChannel(class APlayerReplicationInfo* PRI);
	bool LeaveChannel(const string& ChannelTitle, class APlayerReplicationInfo* PRI);
	EJoinChatResult JoinChannelAt(int ChannelIndex, class APlayerReplicationInfo* PRI, const string& Password);
	EJoinChatResult JoinChannel(const string& ChannelTitle, class APlayerReplicationInfo* PRI, const string& Password);
	bool CanJoinChannel(const string& ChannelTitle, class APlayerReplicationInfo* PRI);
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
	bool                                               bDebug;                                                   // 0x046C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealChatHandler");
		return ptr;
	}


	bool AcceptBroadcastVoice(class APlayerController* Receiver, class APlayerReplicationInfo* Sender);
	bool AcceptBroadcastSpeech(class APlayerController* Receiver, class APlayerReplicationInfo* SenderPRI);
	bool AcceptBroadcastLocalized(class APlayerController* Receiver, class AActor* Sender, class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* obj);
	bool AcceptBroadcastText(class APlayerController* Receiver, class APlayerReplicationInfo* SenderPRI, const FName& Type, string* Msg);
	void DoChatDebug();
	void ToggleChatDebug();
};


// Class UnrealGame.StartupMessage
// 0x04CC (0x091C - 0x0450)
class AStartupMessage : public ACriticalEventPlus
{
public:
	string                                             Stage[0x64];                                              // 0x0450(0x000C) (Localized, NeedCtorLink)
	string                                             NotReady;                                                 // 0x0900(0x000C) (Localized, NeedCtorLink)
	string                                             SinglePlayer;                                             // 0x090C(0x000C) (Localized, NeedCtorLink)
	class USound*                                      Riff;                                                     // 0x0918(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.StartupMessage");
		return ptr;
	}


	bool STATIC_GotoHud(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
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


	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class UnrealGame.AnnounceAdrenaline
// 0x0008 (0x0434 - 0x042C)
class AAnnounceAdrenaline : public AInfo
{
public:
	class USound*                                      AnnounceSound;                                            // 0x042C(0x0004)
	FName                                              Announcement;                                             // 0x0430(0x0004)

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
	string                                             FavoriteWeapon;                                           // 0x002C(0x000C) (Localized, NeedCtorLink)
	string                                             NoPreference;                                             // 0x0038(0x000C) (Localized, NeedCtorLink)
	struct FCustomConfiguration[]                      ConfigArray;                                              // 0x0044(0x000C) (Config, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.CustomBotConfig");
		return ptr;
	}


	int STATIC_IndexFor(const string& PlayerName);
	int STATIC_AggressivenessRating(const struct FCustomConfiguration& cc);
	int STATIC_TacticsRating(const struct FCustomConfiguration& cc);
	int STATIC_AgilityRating(const struct FCustomConfiguration& cc);
	int STATIC_AccuracyRating(const struct FCustomConfiguration& cc);
	int STATIC_RatingModifier(const string& CharacterName);
	string STATIC_GetFavoriteWeaponFor(const struct FCustomConfiguration& cc);
	void STATIC_Customize(class URosterEntry* R);
};


// Class UnrealGame.KillingSpreeMessage
// 0x017C (0x05CC - 0x0450)
class AKillingSpreeMessage : public ACriticalEventPlus
{
public:
	string                                             EndSpreeNote;                                             // 0x0450(0x000C) (Localized, NeedCtorLink)
	string                                             EndSelfSpree;                                             // 0x045C(0x000C) (Localized, NeedCtorLink)
	string                                             EndFemaleSpree;                                           // 0x0468(0x000C) (Localized, NeedCtorLink)
	string                                             MultiKillString;                                          // 0x0474(0x000C) (Localized, NeedCtorLink)
	string                                             SpreeNote[0xA];                                           // 0x0480(0x000C) (Localized, NeedCtorLink)
	string                                             SelfSpreeNote[0xA];                                       // 0x04F8(0x000C) (Localized, NeedCtorLink)
	class USound*                                      SpreeSound[0xA];                                          // 0x0570(0x0004)
	FName                                              SpreeSoundName[0xA];                                      // 0x0598(0x0004)
	string                                             EndSpreeNoteTrailer;                                      // 0x05C0(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.KillingSpreeMessage");
		return ptr;
	}


	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	string STATIC_GetRelatedString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
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
	FName GetOrders();
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


	string STATIC_GetWeaponClass();
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
	class UClass*[]                                    MapMutator;                                               // 0x042C(0x000C) (Edit, NeedCtorLink)

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
	struct FStoredChatBan[]                            StoredChatRestrictions;                                   // 0x0430(0x000C) (Config, GlobalConfig, NeedCtorLink)
	struct AUnrealPlayerChatManager_FChatBan[]         ChatRestrictions;                                         // 0x043C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.UnrealPlayerChatManager");
		return ptr;
	}


	int Count();
	bool IsLocal();
	bool IsValid(int i);
	int GetHashIndex(const string& PlayerHash);
	int GetIDIndex(int PlayerID);
	string GetPlayerHash(int PlayerID);
	bool ClientIsBanned(const string& PlayerHash);
	byte GetPlayerRestriction(int PlayerID);
	bool UnMergeRestriction(int Index, byte NewType);
	bool MergeRestriction(int Index, byte NewType);
	bool ClearRestrictionID(int PlayerID, byte Type);
	bool ClearRestriction(const string& PlayerHash, byte Type);
	bool AddRestrictionID(int PlayerID, byte Type);
	bool AddRestriction(const string& PlayerHash, byte Type);
	bool SetRestrictionID(int PlayerID, byte Type);
	bool SetRestriction(const string& PlayerHash, byte Type);
	bool IsBanned(class APlayerReplicationInfo* PRI);
	bool AcceptVoice(class APlayerReplicationInfo* SenderPRI);
	bool AcceptSpeech(class APlayerReplicationInfo* SenderPRI);
	bool AcceptText(class APlayerReplicationInfo* Sender, const FName& Type, string* Msg);
	void UnTrackPlayer(int PlayerID);
	void TrackNewPlayer(int PlayerID, const string& PlayerHash, const string& PlayerAddress);
	void ReceiveBanInfo(const string& S);
	void StoreChatBan(const string& PlayerHash, byte Restriction);
	bool LoadChatBan(const string& PlayerHash, byte* OutRestriction);
	void LogChatRestriction(int i);
	void ChatDebug();
};


// Class UnrealGame.UseObjective
// 0x000C (0x06E0 - 0x06D4)
class AUseObjective : public AProximityObjective
{
public:
	string                                             strPlayerName;                                            // 0x06D4(0x000C) (Net, NeedCtorLink)

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
	bool                                               bHeadedRight;                                             // 0x0660(0x0004)
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
	bool                                               bMegaSpeed;                                               // 0x0480(0x0004) (Edit, Config, GlobalConfig)
	float                                              AirControl;                                               // 0x0484(0x0004) (Edit, Config, GlobalConfig)
	bool                                               bBrightSkins;                                             // 0x0488(0x0004) (Edit, Config, GlobalConfig)
	string                                             DMMutPropsDisplayText[0x2];                               // 0x048C(0x000C) (Localized, NeedCtorLink)
	string                                             DMMutDescText[0x2];                                       // 0x04A4(0x000C) (Localized, NeedCtorLink)

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
	bool                                               bTeamChatOnly;                                            // 0x0534(0x0004) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.TeamVoiceReplicationInfo");
		return ptr;
	}


	int GetOpposingTeamChannel(int ChannelIndex);
	string GetTitle(class AVoiceChatRoom* Room);
	void NotifyTeamChange(class APlayerReplicationInfo* PRI, int TeamIndex);
	EJoinChatResult JoinChannelAt(int ChannelIndex, class APlayerReplicationInfo* PRI, const string& Password);
	EJoinChatResult JoinChannel(const string& ChannelTitle, class APlayerReplicationInfo* PRI, const string& Password);
	class AVoiceChatRoom* GetChannel(const string& ChatRoomName, int TeamIndex);
	int GetChannelIndex(const string& ChannelTitle, int TeamIndex);
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
	EJoinChatResult JoinChannel(class APlayerReplicationInfo* NewPRI, const string& InPassword);
	bool CanJoinChannel(class APlayerReplicationInfo* PRI);
	bool IsMember(class APlayerReplicationInfo* PRI, bool bNoCascade);
	bool IsFull();
	int Count();
	bool IsPrivateChannel();
	bool IsPublicChannel();
	class APlayerReplicationInfo*[] GetMembers();
	string GetPassword();
	int GetTeam();
	string GetTitle();
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
	byte                                               byGetProgress;                                            // 0x070C(0x0001)
	byte                                               Padding00[0x3];                                           // 0x070D(0x0003) MISSED OFFSET
	float                                              fOldLevelTime;                                            // 0x0710(0x0004)
	class APawn*[]                                     LinkedTeam_A;                                             // 0x0714(0x000C) (NeedCtorLink)
	class APawn*[]                                     LinkedTeam_B;                                             // 0x0720(0x000C) (NeedCtorLink)
	int                                                iActiveTeam;                                              // 0x072C(0x0004) (Net)
	int                                                iOldActiveTeam;                                           // 0x0730(0x0004)
	int                                                iCapturingTeam;                                           // 0x0734(0x0004) (Net)
	float                                              ReachRadius;                                              // 0x0738(0x0004) (Edit)
	class UMaterial*                                   texGreen;                                                 // 0x073C(0x0004)
	class UMaterial*                                   texRed;                                                   // 0x0740(0x0004)
	class UMaterial*                                   texNormal;                                                // 0x0744(0x0004)
	struct FScriptDelegate                             __OnTouch__Delegate;                                      // 0x0748(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __OnUnTouch__Delegate;                                    // 0x0750(0x0090) (NeedCtorLink)

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
	bool                                               bHeadedRight;                                             // 0x0660(0x0004)
	float                                              LifeLeft;                                                 // 0x0664(0x0004)
	bool                                               bRepeat;                                                  // 0x0668(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.WillowWhispPath");
		return ptr;
	}


	void StartNextPath();
	void PostNetBeginPlay();
	void PostBeginPlay();
};


// Class UnrealGame.ACTION_GotoMenu
// 0x0010 (0x004C - 0x003C)
class UACTION_GotoMenu : public UScriptedAction
{
public:
	string                                             MenuName;                                                 // 0x003C(0x000C) (Edit, Config, NeedCtorLink)
	bool                                               bDisconnect;                                              // 0x0048(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class UnrealGame.ACTION_GotoMenu");
		return ptr;
	}


	string GetActionString();
	string GetMenuName();
	bool InitActionFor(class AScriptedController* C);
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


	string STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const string& MessageString);
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
	string STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const string& MessageString);
	void STATIC_RenderComplexMessage(class UCanvas* Canvas, const string& MessageString, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, float* XL, float* YL);
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


	string STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const string& MessageString);
	void STATIC_RenderComplexMessage(class UCanvas* Canvas, const string& MessageString, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, float* XL, float* YL);
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


	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class UnrealGame.TurretController
// 0x0000 (0x0620 - 0x0620)
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


	void ServerCallback(int SecType, const string& Data);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
