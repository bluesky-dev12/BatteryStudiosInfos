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

// Class WGame.wUtil
// 0x0064 (0x0090 - 0x002C)
class UwUtil : public UObject
{
public:
	struct FString                                     SectionName;                                              // 0x002C(0x000C) (Edit, Const, NeedCtorLink)
	struct FString                                     FileExtension;                                            // 0x0038(0x000C) (Edit, Const, NeedCtorLink)
	class UCachePlayers*                               CachedPlayerList;                                         // 0x0044(0x0004) (Edit, Const, Transient)
	struct FString                                     NoPreference;                                             // 0x0048(0x000C) (Localized, NeedCtorLink)
	struct FString                                     FavoriteWeapon;                                           // 0x0054(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AgilityString;                                            // 0x0060(0x000C) (Localized, NeedCtorLink)
	struct FString                                     TacticsString;                                            // 0x006C(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AccuracyString;                                           // 0x0078(0x000C) (Localized, NeedCtorLink)
	struct FString                                     AggressivenessString;                                     // 0x0084(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wUtil");
		return ptr;
	}


	TArray<class UClass*> STATIC_GetMutatorClasses(TArray<struct FString> MutClassNames);
	int STATIC_GetTeamInfoSalaryFor(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_GetTeamSalaryFor(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayTacticsRating(TArray<struct FString> Players);
	int STATIC_TeamInfoTacticsRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamTacticsRating(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayAgilityRating(TArray<struct FString> Players);
	int STATIC_TeamInfoAgilityRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamAgilityRating(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayAggressivenessRating(TArray<struct FString> Players);
	int STATIC_TeamInfoAggressivenessRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamAggressivenessRating(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayAccuracyRating(TArray<struct FString> Players);
	int STATIC_TeamInfoAccuracyRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamAccuracyRating(class UGameProfile* GP, int lineupsize);
	int STATIC_AggressivenessRating(const struct FPlayerRecord& PRE);
	int STATIC_TacticsRating(const struct FPlayerRecord& PRE);
	int STATIC_AgilityRating(const struct FPlayerRecord& PRE);
	int STATIC_AccuracyRating(const struct FPlayerRecord& PRE);
	int STATIC_RatingModifier(const struct FString& CharacterName);
	struct FString STATIC_GetFavoriteWeaponFor(const struct FPlayerRecord& PRE);
	int STATIC_GetSalaryFor(const struct FPlayerRecord& PRE);
	struct FPlayerRecord STATIC_FindPlayerRecord(const struct FString& CharName);
	void STATIC_GetMutatorList(TArray<struct UwUtil_FMutatorRecord> MutatorRecords);
	class UDecoText* STATIC_LoadDecoText(const struct FString& PackageName, const struct FString& DecoTextName, int ColumnCount);
	struct FPlayerRecord STATIC_FindUPLPlayerRecord(const struct FString& CharName);
	struct FPlayerRecord STATIC_GetPlayerRecord(int Index);
	void STATIC_GetPlayerList(TArray<struct FPlayerRecord>* PlayerRecords);
};


// Class WGame.wTeamRoster
// 0x0000 (0x0554 - 0x0554)
class AwTeamRoster : public AUnrealTeamInfo
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTeamRoster");
		return ptr;
	}


	bool BelongsOnTeam(class UClass* PawnClass);
	bool AlreadyExistsEntry(const struct FString& CharacterName, bool bNoRecursion);
	bool AvailableRecord(const struct FString& MenuString);
	class URosterEntry* GetRandomPlayer();
	void FillPlayerTeam(class UGameProfile* G);
	void Initialize(int TeamBots);
	class URosterEntry* GetNamedBot(const struct FString& botname);
	void PostBeginPlay();
};


// Class WGame.wKillerMessagePlus
// 0x0018 (0x0468 - 0x0450)
class AwKillerMessagePlus : public ALocalMessage
{
public:
	struct FString                                     YouKilled;                                                // 0x0450(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     YouKilledTrailer;                                         // 0x045C(0x000C) (Edit, Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wKillerMessagePlus");
		return ptr;
	}


	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class WGame.wDeathMessage
// 0x001C (0x046C - 0x0450)
class AwDeathMessage : public ALocalMessage
{
public:
	struct FString                                     KilledString;                                             // 0x0450(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     SomeoneString;                                            // 0x045C(0x000C) (Edit, Localized, NeedCtorLink)
	unsigned long                                      bNoConsoleDeathMessages : 1;                              // 0x0468(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDeathMessage");
		return ptr;
	}


	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FColor STATIC_GetConsoleColor(class APlayerReplicationInfo* RelatedPRI_1);
};


// Class WGame.wPurpose
// 0x0024 (0x0050 - 0x002C)
class UwPurpose : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	struct FString                                     PlanName;                                                 // 0x0030(0x000C) (NeedCtorLink)
	float                                              ActionMinTime;                                            // 0x003C(0x0004)
	float                                              ActionMaxTime;                                            // 0x0040(0x0004)
	float                                              PlanLength;                                               // 0x0044(0x0004)
	float                                              _TEMP_SCORE;                                              // 0x0048(0x0004)
	float                                              _TEMP_COUNT;                                              // 0x004C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPurpose");
		return ptr;
	}


	float GetActivationScore();
	float Evaluate(class UwStateData** S);
	class UwPurpose* STATIC_Create(class AwAIBotBase* inOwner);
};


// Class WGame.wPurposeAttackTarget
// 0x0000 (0x0050 - 0x0050)
class UwPurposeAttackTarget : public UwPurpose
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPurposeAttackTarget");
		return ptr;
	}


	float GetActivationScore();
	float Evaluate(class UwStateData** S);
};


// Class WGame.wAILevel
// 0x0088 (0x0460 - 0x03D8)
class AwAILevel : public AwAILevelBase
{
public:
	class UwMatchMaker*                                MM;                                                       // 0x03D8(0x0004)
	TArray<class ANavigationPoint*>                    FrontLineTeam0;                                           // 0x03DC(0x000C) (NeedCtorLink)
	TArray<class ANavigationPoint*>                    FrontLineTeam1;                                           // 0x03E8(0x000C) (NeedCtorLink)
	int                                                Influence0Length;                                         // 0x03F4(0x0004)
	int                                                Influence1Length;                                         // 0x03F8(0x0004)
	int                                                InfluenceNLength;                                         // 0x03FC(0x0004)
	int                                                AllNavsLength;                                            // 0x0400(0x0004)
	TArray<class ANavigationPoint*>                    Influence0;                                               // 0x0404(0x000C) (NeedCtorLink)
	TArray<class ANavigationPoint*>                    Influence1;                                               // 0x0410(0x000C) (NeedCtorLink)
	TArray<class ANavigationPoint*>                    InfluenceN;                                               // 0x041C(0x000C) (NeedCtorLink)
	TArray<class ANavigationPoint*>                    AllNavs;                                                  // 0x0428(0x000C) (NeedCtorLink)
	int                                                NumTypeAR;                                                // 0x0434(0x0004)
	int                                                NumTypeSMG;                                               // 0x0438(0x0004)
	TArray<class AwAIBotBase*>                         Bots;                                                     // 0x043C(0x000C) (NeedCtorLink)
	class UObjectPool*                                 PoolAction;                                               // 0x0448(0x0004)
	class UObjectPool*                                 PoolActionContainer;                                      // 0x044C(0x0004)
	class UObjectPool*                                 PoolActionLayer;                                          // 0x0450(0x0004)
	class UObjectPool*                                 PoolGoal;                                                 // 0x0454(0x0004)
	class UwPlanMaster*                                PlanMaster;                                               // 0x0458(0x0004)
	unsigned long                                      bInitialized : 1;                                         // 0x045C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAILevel");
		return ptr;
	}


	void ClearReferences();
	void BotsLovePeace();
	void ResetNames();
	class UwNPCItemGroupParam* GetItemParamByGroupID(int GroupID);
	struct FString GetName(int NameGroupID);
	void KillBot(class AAIController* Bot);
	void KillBots(int Num);
	void KillBotsTeam(int Num, int inTeam);
	void RegisterBot(class AwAIBotBase* Bot);
	class UwNPCActions* GetNPCAction(int ActionGroupID);
	bool ActionExists(int ActionGroupID, const struct FString& Action);
	class UwNPCParam* GetNPCParam(int Grade);
	class UwNPCParam* GetNPCParamByNPCID(int NPCID);
	void UpdateInfluenceListScript();
	void UpdateInfluenceList();
	void UpdateInfluenceListNative();
	void UpdateAllNavs();
	class ANavigationPoint* GetRandomDestFromInfluence(unsigned char inTeam);
	class ANavigationPoint* GetRandomDestFromFrontLine(unsigned char inTeam);
	void InitFrontLine();
	void Tick(float dt);
	void InitInfluenceList();
	void Initialize();
	void PreBeginPlay();
};


// Class WGame.wStateData
// 0x007C (0x00A8 - 0x002C)
class UwStateData : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	int                                                Ammo;                                                     // 0x0030(0x0004)
	int                                                MaxAmmo;                                                  // 0x0034(0x0004)
	int                                                Magazine;                                                 // 0x0038(0x0004)
	int                                                NumFragGrenade;                                           // 0x003C(0x0004)
	int                                                NumStunGrenade;                                           // 0x0040(0x0004)
	int                                                NumSmokeGrenade;                                          // 0x0044(0x0004)
	class UwWeaponBaseParams*                          CurrentWeapon;                                            // 0x0048(0x0004)
	TArray<class UwWeaponBaseParams*>                  Weapons;                                                  // 0x004C(0x000C) (NeedCtorLink)
	int                                                SwitchWeaponCount;                                        // 0x0058(0x0004)
	unsigned long                                      IsFlashed : 1;                                            // 0x005C(0x0004)
	unsigned long                                      IsStopAction : 1;                                         // 0x005C(0x0004)
	unsigned long                                      IsStopTargeting : 1;                                      // 0x005C(0x0004)
	unsigned long                                      IsStopGotoFlag1 : 1;                                      // 0x005C(0x0004)
	unsigned long                                      IsStopGotoFlag2 : 1;                                      // 0x005C(0x0004)
	unsigned long                                      IsCrouch : 1;                                             // 0x005C(0x0004)
	unsigned long                                      IsStand : 1;                                              // 0x005C(0x0004)
	unsigned long                                      IsProne : 1;                                              // 0x005C(0x0004)
	unsigned long                                      FreeHead : 1;                                             // 0x005C(0x0004)
	unsigned long                                      FreeHands : 1;                                            // 0x005C(0x0004)
	unsigned long                                      FreeLegs : 1;                                             // 0x005C(0x0004)
	unsigned long                                      CannotFindPath : 1;                                       // 0x005C(0x0004)
	int                                                Health;                                                   // 0x0060(0x0004)
	int                                                PropsectDealtDamage;                                      // 0x0064(0x0004)
	int                                                ProspectTakenDamage;                                      // 0x0068(0x0004)
	unsigned long                                      HasSupplyHelicopter : 1;                                  // 0x006C(0x0004)
	unsigned long                                      HasSupplyUAV : 1;                                         // 0x006C(0x0004)
	unsigned long                                      HasSupplyAirstrike : 1;                                   // 0x006C(0x0004)
	struct FVector                                     Location;                                                 // 0x0070(0x000C)
	class UMemoryItem*                                 Target;                                                   // 0x007C(0x0004)
	unsigned long                                      TargetVisible : 1;                                        // 0x0080(0x0004)
	unsigned long                                      TargetReachable : 1;                                      // 0x0080(0x0004)
	int                                                TargetChangeCount;                                        // 0x0084(0x0004)
	unsigned long                                      CanMeleeTarget : 1;                                       // 0x0088(0x0004)
	unsigned long                                      bUseAiming : 1;                                           // 0x0088(0x0004)
	unsigned long                                      bAimingTarget : 1;                                        // 0x0088(0x0004)
	float                                              MeetNewEnemyProbabilty;                                   // 0x008C(0x0004)
	float                                              Time;                                                     // 0x0090(0x0004)
	int                                                NumCapturedFlags;                                         // 0x0094(0x0004)
	class AwFlagObjectiveBase*                         FlagIamOn;                                                // 0x0098(0x0004)
	int                                                World_NumAllies;                                          // 0x009C(0x0004)
	int                                                World_NumEnemies;                                         // 0x00A0(0x0004)
	unsigned long                                      World_IsSDRespawnTime : 1;                                // 0x00A4(0x0004)
	unsigned long                                      World_TeamGame : 1;                                       // 0x00A4(0x0004)
	unsigned long                                      World_Helicopter : 1;                                     // 0x00A4(0x0004)
	unsigned long                                      World_Airstrike : 1;                                      // 0x00A4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wStateData");
		return ptr;
	}


	class UwStateData* STATIC_Create();
};


// Class WGame.ShortMemory
// 0x0040 (0x006C - 0x002C)
class UShortMemory : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	class ALevelInfo*                                  Level;                                                    // 0x0030(0x0004)
	TArray<class UMemoryItem*>                         Memories;                                                 // 0x0034(0x000C) (NeedCtorLink)
	int                                                NumVisibleMemories;                                       // 0x0040(0x0004)
	float                                              RetentionTIme;                                            // 0x0044(0x0004)
	float                                              ResponseTime;                                             // 0x0048(0x0004)
	float                                              MemoryItemUpdateInterval;                                 // 0x004C(0x0004)
	int                                                ResponseQueueHead;                                        // 0x0050(0x0004)
	TArray<float>                                      ResponseQueueTime;                                        // 0x0054(0x000C) (NeedCtorLink)
	TArray<class APawn*>                               ResponseQueuePawn;                                        // 0x0060(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.ShortMemory");
		return ptr;
	}


	void DisplayDebug(class UCanvas* C, float* YL, float* YPos);
	void SetOffsetCrouchHeight(float fHeight);
	void SetOffsetStandHeight(float fHeight);
	class UMemoryItem* GetByPawn(class APawn* P, bool createIfNotFound);
	class UMemoryItem* GetByPawn2(class APawn* P);
	void RemoveByPawn(class APawn* P);
	void RemoveAll();
	void ClearReferences();
	void RemoveMemoriesOverRetentionTime();
	bool RememberByVision(class APawn* P);
	bool RememberBySound(class APawn* P, float Loudness);
	void NotifyDestroyed(class AActor* A);
	void Update(float dt);
	class UShortMemory* STATIC_Create(class AwAIBotBase* inOwner, float inResponseTime);
};


// Class WGame.MemoryItem
// 0x0040 (0x006C - 0x002C)
class UMemoryItem : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	float                                              LastTime;                                                 // 0x0030(0x0004)
	struct FVector                                     LastPosition;                                             // 0x0034(0x000C)
	float                                              LastTargetedTime;                                         // 0x0040(0x0004)
	class APawn*                                       Pawn;                                                     // 0x0044(0x0004)
	class APlayerReplicationInfo*                      PRI;                                                      // 0x0048(0x0004)
	int                                                MaxPositions;                                             // 0x004C(0x0004)
	unsigned long                                      IsVisible : 1;                                            // 0x0050(0x0004)
	unsigned long                                      IsVisibleOld : 1;                                         // 0x0050(0x0004)
	unsigned long                                      InSight : 1;                                              // 0x0050(0x0004)
	unsigned long                                      InSightOld : 1;                                           // 0x0050(0x0004)
	struct FVector                                     OffsetStandHeight;                                        // 0x0054(0x000C)
	struct FVector                                     OffsetCrouchHeight;                                       // 0x0060(0x000C)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.MemoryItem");
		return ptr;
	}


	void SetOffsetCrouchHeight(float fHeight);
	void SetOffsetStandHeight(float fHeight);
	void ClearReferences();
	void Update();
	void AddKnownPosition(const struct FVector& V, float t);
	void NotifyDestroyed(class AActor* A);
	class UMemoryItem* STATIC_Create(class AwAIBotBase* inOwner, class APawn* P);
};


// Class WGame.wAIBotBase
// 0x0074 (0x0690 - 0x061C)
class AwAIBotBase : public AAIController
{
public:
	class UGoal*                                       Goal;                                                     // 0x061C(0x0004)
	class UwFutureState*                               FutureState;                                              // 0x0620(0x0004)
	class UShortMemory*                                Memory;                                                   // 0x0624(0x0004)
	class UTargetingSystem*                            TargetSystem;                                             // 0x0628(0x0004)
	class UwActionPlanner*                             Planner;                                                  // 0x062C(0x0004)
	class UwPlanMaster*                                PlanMaster;                                               // 0x0630(0x0004)
	class AwAILevel*                                   AILevel;                                                  // 0x0634(0x0004)
	class UwNPCActions*                                npcActions;                                               // 0x0638(0x0004)
	float                                              UpdateElapsed;                                            // 0x063C(0x0004)
	float                                              UpdateInterval;                                           // 0x0640(0x0004)
	unsigned long                                      TrySprint : 1;                                            // 0x0644(0x0004)
	float                                              DeadTime;                                                 // 0x0648(0x0004)
	float                                              LastRestartRequestTime;                                   // 0x064C(0x0004)
	unsigned long                                      bDrawPath : 1;                                            // 0x0650(0x0004)
	TArray<float>                                      NavExtraCosts;                                            // 0x0654(0x000C) (NeedCtorLink)
	TArray<float>                                      NavDetourExtraCosts;                                      // 0x0660(0x000C) (NeedCtorLink)
	float                                              NavExtraCostFactor_VisCount;                              // 0x066C(0x0004)
	float                                              NavExtraCostFactor_DetourScore;                           // 0x0670(0x0004)
	float                                              NavExtraCostFactor_DetourMaxDistFactor;                   // 0x0674(0x0004)
	class AwFlagObjectiveBase*                         LastTargetFlag;                                           // 0x0678(0x0004)
	struct FName                                       StateOnPossess;                                           // 0x067C(0x0004)
	struct FVector                                     UpVector;                                                 // 0x0680(0x000C)
	unsigned long                                      IsStopAction : 1;                                         // 0x068C(0x0004)
	unsigned long                                      IsStopTargeting : 1;                                      // 0x068C(0x0004)
	unsigned long                                      IsStopGotoFlag1 : 1;                                      // 0x068C(0x0004)
	unsigned long                                      IsStopGotoFlag2 : 1;                                      // 0x068C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAIBotBase");
		return ptr;
	}


	void DisplayDebug_Path(class UCanvas* C, float* YL, float* YPos);
	void DisplayDebug(class UCanvas* C, float* YL, float* YPos);
	int SetFireYaw(int FireYaw);
	struct FRotator AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError);
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	void HearNoise(float Loudness, class AActor* NoiseMaker);
	void SeePlayer(class APawn* SeenPlayer);
	void NotifyVehicle(class AVehicle* V);
	void OnMemoryVisibleChanged();
	void HandleMessage(const struct FString& Msg);
	void wClientFlash(float fTime);
	bool IsProning();
	void TryProne();
	bool IsCrouching();
	void TryCrouch();
	bool IsStandingUp();
	void TryStandUp();
	bool IsSprinting();
	void SetSprint(bool Value);
	void PawnDied(class APawn* P);
	void ClientOnEndWaitingForStart();
	void ZeroExtraCost();
	void CopyNavExtraCost();
	void UpdateNavDetourExtraCostScript(const struct FVector& S, const struct FVector& E);
	void UpdateNavDetourExtraCost(const struct FVector& S, const struct FVector& E);
	void UpdateNavDetourExtraCostNative(const struct FVector& S, const struct FVector& E);
	void InitNavExtraCost();
	void Cmd(const struct FString& P1, const struct FString& P2, const struct FString& p3, const struct FString& p4, const struct FString& p5);
	float EvaluateState(class UwStateData* S);
	void SetupWStateNative(class UwStateData** S);
	void NotifyAddDefaultInventory();
	void NotifyAddInventory(class AInventory* NewItem);
	void SetupWeapons(class APawn* aPawn);
	void SetPawnClass(const struct FString& inClass, const struct FString& InCharacter);
	void SetName(class UwNPCParam* Param);
	void InitBot(int Grade);
	void ClearReferences();
	bool WeaponFireAgain(float RefireRate, bool bFinishedFire);
	bool ReadyToMeleeAttack();
};


// Class WGame.wPlayerInfo
// 0x0000 (0x002C - 0x002C)
class UwPlayerInfo : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPlayerInfo");
		return ptr;
	}


	bool STATIC_Setup(class AwPawn* P, const struct FPlayerRecord& Rec);
	bool STATIC_SetupPawn(class AwPawn* P, int iBodyItemID, int iHelmetItemID, int iAcceItemID, int iBackPackID, int iPouchID, int iCamouflageID, int iTeamIndex);
};


// Class WGame.SpeciesType
// 0x01B0 (0x01DC - 0x002C)
class USpeciesType : public UObject
{
public:
	struct FString                                     MaleVoice;                                                // 0x002C(0x000C) (NeedCtorLink)
	struct FString                                     FemaleVoice;                                              // 0x0038(0x000C) (NeedCtorLink)
	struct FString                                     GibGroup;                                                 // 0x0044(0x000C) (NeedCtorLink)
	struct FString                                     MaleRagSkelName;                                          // 0x0050(0x000C) (NeedCtorLink)
	struct FString                                     FemaleRagSkelName;                                        // 0x005C(0x000C) (NeedCtorLink)
	struct FString                                     FemaleSkeleton;                                           // 0x0068(0x000C) (NeedCtorLink)
	struct FString                                     MaleSkeleton;                                             // 0x0074(0x000C) (NeedCtorLink)
	struct FString                                     MaleSoundGroup;                                           // 0x0080(0x000C) (NeedCtorLink)
	struct FString                                     FemaleSoundGroup;                                         // 0x008C(0x000C) (NeedCtorLink)
	struct FString                                     PawnClassName;                                            // 0x0098(0x000C) (NeedCtorLink)
	struct FString                                     SpeciesName;                                              // 0x00A4(0x000C) (Localized, NeedCtorLink)
	int                                                RaceNum;                                                  // 0x00B0(0x0004)
	int                                                DMTeam;                                                   // 0x00B4(0x0004)
	struct FName                                       TauntAnims[0x10];                                         // 0x00B8(0x0004)
	struct FString                                     TauntAnimNames[0x10];                                     // 0x00F8(0x000C) (Localized, NeedCtorLink)
	float                                              AirControl;                                               // 0x01B8(0x0004)
	float                                              GroundSpeed;                                              // 0x01BC(0x0004)
	float                                              WaterSpeed;                                               // 0x01C0(0x0004)
	float                                              JumpZ;                                                    // 0x01C4(0x0004)
	float                                              ReceivedDamageScaling;                                    // 0x01C8(0x0004)
	float                                              DamageScaling;                                            // 0x01CC(0x0004)
	float                                              AccelRate;                                                // 0x01D0(0x0004)
	float                                              DodgeSpeedFactor;                                         // 0x01D4(0x0004)
	float                                              DodgeSpeedZ;                                              // 0x01D8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.SpeciesType");
		return ptr;
	}


	int STATIC_GetOffsetForSequence(const struct FName& Sequence);
	bool STATIC_Setup(class AwPawn* P, const struct FPlayerRecord& Rec);
	void STATIC_SetTeamSkin(class AwPawn* P, const struct FPlayerRecord& Rec, int TeamNum);
	struct FString STATIC_GetRagSkelName(const struct FString& MeshName);
	void STATIC_ModifyPawn(class APawn* P);
	int STATIC_ModifyImpartedDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType);
	int STATIC_ModifyReceivedDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType);
	void STATIC_LoadResources(const struct FPlayerRecord& Rec, class ALevelInfo* Level, class APlayerReplicationInfo* PRI, int TeamNum);
	struct FString STATIC_GetVoiceType(bool bIsFemale, class ALevelInfo* Level);
};


// Class WGame.AimedAttachment
// 0x001C (0x03F4 - 0x03D8)
class AAimedAttachment : public AActor
{
public:
	unsigned char                                      UnknownData00[0x1C];                                      // 0x03D8(0x001C) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.AimedAttachment");
		return ptr;
	}

};


// Class WGame.CachePlayers
// 0x000C (0x009C - 0x0090)
class UCachePlayers : public UwUtil
{
public:
	TArray<struct FPlayerRecord>                       Records;                                                  // 0x0090(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.CachePlayers");
		return ptr;
	}

};


// Class WGame.DecoText
// 0x0018 (0x0044 - 0x002C)
class UDecoText : public UObject
{
public:
	struct FString                                     TextName;                                                 // 0x002C(0x000C) (Edit, NeedCtorLink)
	TArray<struct FString>                             Rows;                                                     // 0x0038(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DecoText");
		return ptr;
	}

};


// Class WGame.AnimNotify_Nemesis_BeamPrepare
// 0x0000 (0x0030 - 0x0030)
class UAnimNotify_Nemesis_BeamPrepare : public UAnimNotify_Scripted
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.AnimNotify_Nemesis_BeamPrepare");
		return ptr;
	}


	void Notify(class AActor* Owner);
};


// Class WGame.wPawn
// 0x0678 (0x1850 - 0x11D8)
class AwPawn : public AUnrealPawn
{
public:
	int                                                RepeaterDeathCount;                                       // 0x11D8(0x0004)
	class ACombo*                                      CurrentCombo;                                             // 0x11DC(0x0004)
	unsigned long                                      bBerserk : 1;                                             // 0x11E0(0x0004)
	unsigned long                                      bInvis : 1;                                               // 0x11E0(0x0004)
	unsigned long                                      bOldInvis : 1;                                            // 0x11E0(0x0004)
	unsigned long                                      bGibbed : 1;                                              // 0x11E0(0x0004)
	unsigned long                                      bCanDodgeDoubleJump : 1;                                  // 0x11E0(0x0004)
	unsigned long                                      bCanBoostDodge : 1;                                       // 0x11E0(0x0004)
	unsigned long                                      bAlreadySetup : 1;                                        // 0x11E0(0x0004)
	unsigned long                                      bSpawnIn : 1;                                             // 0x11E0(0x0004)
	unsigned long                                      bSpawnDone : 1;                                           // 0x11E0(0x0004)
	unsigned long                                      bFrozenBody : 1;                                          // 0x11E0(0x0004)
	unsigned long                                      bFlaming : 1;                                             // 0x11E0(0x0004)
	unsigned long                                      bRubbery : 1;                                             // 0x11E0(0x0004)
	unsigned long                                      bClearWeaponOffsets : 1;                                  // 0x11E0(0x0004)
	float                                              ShieldStrengthMax;                                        // 0x11E4(0x0004) (Edit)
	float                                              SmallShieldStrength;                                      // 0x11E8(0x0004)
	class UClass*                                      Species;                                                  // 0x11EC(0x0004)
	float                                              GruntVolume;                                              // 0x11F0(0x0004) (Edit)
	float                                              FootstepVolume;                                           // 0x11F4(0x0004) (Edit)
	int                                                SimHitFxTicker;                                           // 0x11F8(0x0004) (Transient)
	class UClass*                                      GibGroupClass;                                            // 0x11FC(0x0004) (Edit)
	int                                                GibCountCalf;                                             // 0x1200(0x0004) (Edit)
	int                                                GibCountForearm;                                          // 0x1204(0x0004) (Edit)
	int                                                GibCountHead;                                             // 0x1208(0x0004) (Edit)
	int                                                GibCountTorso;                                            // 0x120C(0x0004) (Edit)
	int                                                GibCountUpperArm;                                         // 0x1210(0x0004) (Edit)
	float                                              MinTimeBetweenPainSounds;                                 // 0x1214(0x0004)
	struct FString                                     HeadShotMessage;                                          // 0x1218(0x000C) (Localized, NeedCtorLink)
	struct FString                                     SoundFootsteps[0x1E];                                     // 0x1224(0x000C) (NeedCtorLink)
	struct FString                                     SoundFootsteps_3rd[0x1E];                                 // 0x138C(0x000C) (NeedCtorLink)
	class UClass*                                      SoundGroupClass;                                          // 0x14F4(0x0004) (Edit)
	struct FString                                     sndScream;                                                // 0x14F8(0x000C) (NeedCtorLink)
	struct FString                                     sndDie;                                                   // 0x1504(0x000C) (NeedCtorLink)
	class AwWeaponAttachment*                          WeaponAttachment;                                         // 0x1510(0x0004)
	class AwFPWeaponAttachment*                        FPWeaponAttachment;                                       // 0x1514(0x0004)
	class AShadowProjector*                            PlayerShadow;                                             // 0x1518(0x0004)
	class AEffect_ShadowController*                    RealtimeShadow;                                           // 0x151C(0x0004)
	unsigned long                                      bRealtimeShadows : 1;                                     // 0x1520(0x0004)
	int                                                iShadowType;                                              // 0x1524(0x0004)
	int                                                MultiJumpRemaining;                                       // 0x1528(0x0004)
	int                                                MaxMultiJump;                                             // 0x152C(0x0004)
	int                                                MultiJumpBoost;                                           // 0x1530(0x0004)
	struct FName                                       WallDodgeAnims[0x4];                                      // 0x1534(0x0004)
	struct FName                                       IdleHeavyAnim;                                            // 0x1544(0x0004)
	struct FName                                       FireHeavyRapidAnim;                                       // 0x1548(0x0004)
	struct FName                                       FireHeavyBurstAnim;                                       // 0x154C(0x0004)
	struct FName                                       FireRootBone;                                             // 0x1550(0x0004)
	struct FName                                       Pistol_FireRifleRapidAnim;                                // 0x1554(0x0004)
	struct FName                                       TelegraphPack_PutdownAnim;                                // 0x1558(0x0004)
	struct FName                                       TelegraphPack_SelectAnim;                                 // 0x155C(0x0004)
	struct FName                                       Pistol_FireAimCrouchRifleRapidAnim;                       // 0x1560(0x0004)
	TEnumAsByte<EFireAnimState>                        FireState;                                                // 0x1564(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x1565(0x0003) MISSED OFFSET
	class UMesh*                                       SkeletonMesh;                                             // 0x1568(0x0004)
	unsigned long                                      bSkeletized : 1;                                          // 0x156C(0x0004)
	unsigned long                                      bDeRes : 1;                                               // 0x156C(0x0004)
	float                                              DeResTime;                                                // 0x1570(0x0004)
	class AEmitter*                                    DeResFX;                                                  // 0x1574(0x0004)
	struct FInterpCurve                                DeResLiftVel;                                             // 0x1578(0x000C) (Edit, NeedCtorLink)
	struct FInterpCurve                                DeResLiftSoftness;                                        // 0x1584(0x000C) (Edit, NeedCtorLink)
	float                                              DeResGravScale;                                           // 0x1590(0x0004) (Edit)
	float                                              DeResLateralFriction;                                     // 0x1594(0x0004) (Edit)
	float                                              RagdollLifeSpan;                                          // 0x1598(0x0004) (Edit)
	float                                              RagInvInertia;                                            // 0x159C(0x0004) (Edit)
	float                                              RagDeathVel;                                              // 0x15A0(0x0004) (Edit)
	float                                              RagShootStrength;                                         // 0x15A4(0x0004) (Edit)
	float                                              RagSpinScale;                                             // 0x15A8(0x0004) (Edit)
	float                                              RagDeathUpKick;                                           // 0x15AC(0x0004) (Edit)
	float                                              RagGravScale;                                             // 0x15B0(0x0004) (Edit)
	class UMaterial*                                   RagConvulseMaterial;                                      // 0x15B4(0x0004) (Edit)
	TArray<class USound*>                              RagImpactSounds;                                          // 0x15B8(0x000C) (Edit, NeedCtorLink)
	float                                              RagImpactSoundInterval;                                   // 0x15C4(0x0004) (Edit)
	float                                              RagImpactVolume;                                          // 0x15C8(0x0004) (Edit)
	float                                              RagLastSoundTime;                                         // 0x15CC(0x0004) (Transient)
	struct FString                                     RagdollOverride;                                          // 0x15D0(0x000C) (NeedCtorLink)
	class AController*                                 OldController;                                            // 0x15DC(0x0004)
	class UMaterial*                                   RealSkins[0x4];                                           // 0x15E0(0x0004)
	struct FString                                     PlacedCharacterName;                                      // 0x15F0(0x000C) (Edit, NeedCtorLink)
	struct FString                                     PlacedFemaleCharacterName;                                // 0x15FC(0x000C) (NeedCtorLink)
	unsigned char                                      TeamSkin;                                                 // 0x1608(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x1609(0x0003) MISSED OFFSET
	class AwSkinShell*                                 wParts[0x4];                                              // 0x160C(0x0004)
	int                                                MyCamouFlageID;                                           // 0x161C(0x0004)
	int                                                MyTeamIdx;                                                // 0x1620(0x0004)
	class AwSkinShell*                                 wGoreParts[0x5];                                          // 0x1624(0x0004)
	int                                                iDiedCollisionPart;                                       // 0x1638(0x0004)
	int                                                iBackupTeamNum;                                           // 0x163C(0x0004)
	int                                                iWarpCount;                                               // 0x1640(0x0004)
	struct FString                                     strGoreMeshName;                                          // 0x1644(0x000C) (NeedCtorLink)
	struct FString                                     strGoreStaticMeshName;                                    // 0x1650(0x000C) (NeedCtorLink)
	int                                                AddedSkillList[0x16];                                     // 0x165C(0x0004)
	int                                                iStartQSlotIndex;                                         // 0x16B4(0x0004)
	unsigned long                                      bBurning : 1;                                             // 0x16B8(0x0004)
	float                                              fLastBurningTime;                                         // 0x16BC(0x0004)
	class AwProjectile*                                BurningProj;                                              // 0x16C0(0x0004)
	unsigned long                                      bProximityFuze : 1;                                       // 0x16C4(0x0004)
	float                                              fProximityFuzeTime;                                       // 0x16C8(0x0004)
	class AwPawn*                                      ProximityBot;                                             // 0x16CC(0x0004)
	class AEmitter*                                    allyEffect;                                               // 0x16D0(0x0004)
	struct FName                                       Hit_Stun;                                                 // 0x16D4(0x0004)
	struct FName                                       Hit_Stun_Cr;                                              // 0x16D8(0x0004)
	struct FName                                       Hit_Stun_Pr;                                              // 0x16DC(0x0004)
	struct FName                                       Hit_PS[0x4];                                              // 0x16E0(0x0004)
	struct FName                                       Hit_PS_Head;                                              // 0x16F0(0x0004)
	struct FName                                       Hit_PS_Cr[0x4];                                           // 0x16F4(0x0004)
	struct FName                                       Hit_PS_Pr;                                                // 0x1704(0x0004)
	struct FName                                       Hit_PS_Stun;                                              // 0x1708(0x0004)
	struct FName                                       Hit_PS_Stun_Cr;                                           // 0x170C(0x0004)
	struct FName                                       Hit_PS_Stun_Pr;                                           // 0x1710(0x0004)
	struct FName                                       Hit_FR[0x4];                                              // 0x1714(0x0004)
	struct FName                                       Hit_FR_Head;                                              // 0x1724(0x0004)
	struct FName                                       Hit_FR_Cr[0x4];                                           // 0x1728(0x0004)
	struct FName                                       Hit_FR_Pr;                                                // 0x1738(0x0004)
	struct FName                                       Hit_FR_Stun;                                              // 0x173C(0x0004)
	struct FName                                       Hit_FR_Stun_Cr;                                           // 0x1740(0x0004)
	struct FName                                       Hit_FR_Stun_Pr;                                           // 0x1744(0x0004)
	struct FName                                       Hit_RPG[0x4];                                             // 0x1748(0x0004)
	struct FName                                       Hit_RPG_Head;                                             // 0x1758(0x0004)
	struct FName                                       Hit_RPG_Cr[0x4];                                          // 0x175C(0x0004)
	struct FName                                       Hit_RPG_Pr;                                               // 0x176C(0x0004)
	struct FName                                       Hit_RPG_Stun;                                             // 0x1770(0x0004)
	struct FName                                       Hit_RPG_Stun_Cr;                                          // 0x1774(0x0004)
	struct FName                                       Hit_RPG_Stun_Pr;                                          // 0x1778(0x0004)
	struct FName                                       Meele_Rifle_Fail;                                         // 0x177C(0x0004)
	struct FName                                       Meele_Rifle_Cr_Fail;                                      // 0x1780(0x0004)
	struct FName                                       Meele_Rifle_Pr_Fail;                                      // 0x1784(0x0004)
	struct FName                                       Meele_Knife_Fail;                                         // 0x1788(0x0004)
	struct FName                                       Meele_Knife_Cr_Fail;                                      // 0x178C(0x0004)
	struct FName                                       Meele_Knife_Pr_Fail;                                      // 0x1790(0x0004)
	struct FName                                       Knife_Fire;                                               // 0x1794(0x0004)
	struct FName                                       Knife_Fire_Cr;                                            // 0x1798(0x0004)
	struct FName                                       Knife_Fire_Pr;                                            // 0x179C(0x0004)
	struct FName                                       Rifle_Crouch_BoltLeverAnim;                               // 0x17A0(0x0004)
	struct FName                                       Reload_Rifle_2nd_Anim;                                    // 0x17A4(0x0004)
	struct FName                                       Reload_Crouch_Rifle_Anim;                                 // 0x17A8(0x0004)
	struct FName                                       Reload_Crouch_Rifle_2nd_Anim;                             // 0x17AC(0x0004)
	struct FName                                       Reload_Prone_Rifle_2nd_Anim;                              // 0x17B0(0x0004)
	struct FName                                       Pistol_Reload_Rifle_2nd_Anim;                             // 0x17B4(0x0004)
	struct FName                                       Pistol_CrouchReload;                                      // 0x17B8(0x0004)
	struct FName                                       Pistol_CrouchReload_2nd;                                  // 0x17BC(0x0004)
	struct FName                                       Pistol_ProneReload_2nd;                                   // 0x17C0(0x0004)
	struct FName                                       Rpg_Reload_2nd_Anim;                                      // 0x17C4(0x0004)
	struct FName                                       Rpg_CrouchReload;                                         // 0x17C8(0x0004)
	struct FName                                       Rpg_CrouchReload_2nd;                                     // 0x17CC(0x0004)
	struct FName                                       Rpg_ProneReload_2nd;                                      // 0x17D0(0x0004)
	struct FName                                       Putdown_Crouch_Rifle_Anim;                                // 0x17D4(0x0004)
	struct FName                                       PutdownQuick_Crouch_Rifle_Anim;                           // 0x17D8(0x0004)
	struct FName                                       Pistol_CrouchPutdown;                                     // 0x17DC(0x0004)
	struct FName                                       Pistol_CrouchPutdownQuick;                                // 0x17E0(0x0004)
	struct FName                                       Frag_CrouchPutdown;                                       // 0x17E4(0x0004)
	struct FName                                       Frag_CrouchPutdownQuick;                                  // 0x17E8(0x0004)
	struct FName                                       Rpg_CrouchPutdown;                                        // 0x17EC(0x0004)
	struct FName                                       Rpg_CrouchPutdownQuick;                                   // 0x17F0(0x0004)
	struct FName                                       Select_Crouch_Rifle_Anim;                                 // 0x17F4(0x0004)
	struct FName                                       SelectNew_Crouch_Rifle_Anim;                              // 0x17F8(0x0004)
	struct FName                                       Pistol_CrouchSelect;                                      // 0x17FC(0x0004)
	struct FName                                       Frag_CrouchSelect;                                        // 0x1800(0x0004)
	struct FName                                       Rpg_CrouchSelect;                                         // 0x1804(0x0004)
	unsigned long                                      bEndProned : 1;                                           // 0x1808(0x0004)
	unsigned long                                      bEndCrouched : 1;                                         // 0x1808(0x0004)
	TArray<int>                                        wRequiredEquipment;                                       // 0x180C(0x000C) (Edit, NeedCtorLink)
	TArray<int>                                        wRequiredParts;                                           // 0x1818(0x000C) (NeedCtorLink)
	unsigned long                                      bAimed : 1;                                               // 0x1824(0x0004)
	unsigned long                                      bIsMeleeAttacking : 1;                                    // 0x1824(0x0004)
	struct FVector                                     GrenadeFireLocation;                                      // 0x1828(0x000C)
	struct FRotator                                    GrenadeFireRotation;                                      // 0x1834(0x000C)
	struct FVector                                     GrenadeExplodeLocation;                                   // 0x1840(0x000C)
	class UClass*                                      FPWeaponAttachmentClass;                                  // 0x184C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPawn");
		return ptr;
	}


	void SkillInit(bool bQuickslotChange);
	void ClientSkillDeadPlayer();
	void AddAllyEffect();
	void reset_weapon();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void SetBurning(bool bBurn, class AwProjectile* proj);
	void GetWeaponAttachmentInfo(unsigned char* byFlashCount, unsigned char* byFiringMode);
	void SetWeaponQuickChange(bool bOn);
	void SetWeaponQuickReload(bool bOn);
	void SetWeaponQuickAimZoom(bool bOn);
	bool AddWeaponFillAmmoAndMagazine();
	bool AddWeaponMagazine();
	void SetRemoveWeaponSkill(class AwWeapon* W);
	void SetAddWeaponSkill(class AwWeapon* W, int iaWeaponID, int iPartsID);
	void RenderFPWeaponAttachment(class UCanvas* C);
	void MakeShellEffect_Rechamber();
	void MakeShellEffect();
	void ServerCallNoWeaponMessage(unsigned char bySlot);
	void AddNoWeaponChangeMessage(unsigned char bySlot);
	void HandlePickup(class APickup* pick);
	void PlayReload();
	void PlayRechamber();
	void PlayMelee(bool bMeleeKnifeOrButt);
	void PostRender2D(class UCanvas* C, float ScreenLocX, float ScreenLocY);
	int SpawnSupplyItem();
	int SpawnBlackbox();
	void SpawnMedals();
	void ClientSwitchToLastWeapon(unsigned char defuseSwitch);
	void SetSpecialState(unsigned char byState);
	void ServerQSlotChangeCheck();
	void ClientQSlotChangeCheck();
	void AddBaseInvenWeapon(class UwMatchUserInfo* kUser, int iPos);
	void SetSelectedQuickSlotInventory(class UwMatchUserInfo* kUser, bool bQuickslotChange);
	void AddWeaponByWeaponLimited(int iWeaponID, int iPartsID, const struct FBtrDouble& UniqueID);
	void SetInfiniteAmmoTutorial(bool bDeleteGranade, int iGranadeCount);
	void SetInfiniteAmmo(int ammoCount);
	void DoSortEquipedItems(class UwMatchUserInfo* kUserInfo);
	bool CheckWeaponBySubGameMode(class UwMatchUserInfo* kUser);
	void AddDefaultInventoryDOA(bool bQuickslotChange);
	void SetGrenadlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetFlameThrowerlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetMGlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetShotGunlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetPistolInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void AddDefaultInventory(bool bQuickslotChange);
	void RemoveInventoryByDamageType(TEnumAsByte<EeWeaponType> removeWeaponType);
	void RemoveAllInventory();
	void ChangeInventoryByQSlot();
	int GetSlotPosbySkillID(class UwMatchUserInfo* kUser, int iSkillID);
	int GetInvenSkillIDbyPos(class UwMatchUserInfo* kUser, int iPos);
	void AddBaseInvenSkill(class UwMatchUserInfo* kUser, int iPos);
	void SetSelectedQuickSlotSkills(class UwMatchUserInfo* kUser);
	void AddWeaponFromSkill(const struct FBtrDouble& iUniqueID, int iaWeaponID);
	void AddSkillByInventory(class UwMatchUserInfo* kUser);
	void AddDefaultSkills(bool bQuickslotChange);
	TEnumAsByte<EGibType> GetGibParts(int iCollisionPart);
	void SpawnGoreGiblet(int iIndex);
	void MakeGorePawn(int iPart);
	void EndCrouch(float HeightAdjust);
	void EndProne(float HeightAdjust);
	void SetParts(TEnumAsByte<EePlayerParts> iPartsIndex, class UMesh* resMesh, class UStaticMesh* resStaticMesh);
	class UMaterial* GetCamouflage(int iItemID, unsigned char byTeam);
	void SetCamouflage(int iItemID, unsigned char byTeam);
	void ResetAllParts();
	void Died(class AController* Killer, class UClass* DamageType, const struct FVector& HitLocation, int CollisionPart, int WeaponType, bool bWallShot);
	void DoDerezEffect();
	class UClass* GetGibClass(TEnumAsByte<EGibType> gibType);
	struct FString GetSound(TEnumAsByte<ESoundType> soundType);
	void ResetPhysicsBasedAnim();
	bool IsTeamGame();
	void Setup(const struct FPlayerRecord& Rec, bool bLoadNow);
	struct FString GetDefaultCharacter();
	bool ForceDefaultCharacter();
	bool CheckValidMaleDefault();
	bool CheckValidFemaleDefault();
	void ClientReStart();
	void PostNetReceive();
	void NotifyTeamChanged();
	bool DoJump(bool bUpdating);
	bool CanMultiJump();
	bool CanDoubleJump();
	void DoDoubleJump(bool bUpdating);
	bool PerformDodge(TEnumAsByte<EDoubleClickDir> DoubleClickMove, const struct FVector& Dir, const struct FVector& Cross);
	bool Dodge(TEnumAsByte<EDoubleClickDir> DoubleClickMove);
	struct FVector BotDodge(const struct FVector& Dir);
	void SetInvisibility(float Time);
	void ServerChangedWeapon(class AwWeapon* OldWeapon, class AwWeapon* newWeapon);
	void ChangedWeapon();
	void SetWeaponOverlay(class UMaterial* mat, float Time, bool override);
	void DisableUDamage();
	void EnableUDamage(float Amount);
	bool HasUDamage();
	void DoCombo(class UClass* ComboClass);
	void DoComboName(const struct FString& ComboClassName);
	bool InCurrentCombo();
	bool AddShieldStrength(int ShieldAmount);
	int CanUseShield(int ShieldAmount);
	float GetShieldStrength();
	float GetShieldStrengthMax();
	void TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer);
	void PlayFootStepRight();
	void PlayFootStepLeft();
	void FootStepping(int side);
	void PlayEquipHitSound();
	void PlayBreathSound();
	void PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange);
	void PlayDirectionalDeath(const struct FVector& HitLoc);
	void KImpact(class AActor* Other, const struct FVector& pos, const struct FVector& impactVel, const struct FVector& impactNorm);
	void PlayTakeHit(const struct FVector& HitLocation, int Damage, class UClass* DamageType);
	void ClientDying(class UClass* DamageType, const struct FVector& HitLocation);
	void SpawnGibs(const struct FRotator& HitRotation, float ChunkPerterbation);
	void PlayDyingAnimation(class UClass* DamageType, const struct FVector& HitLoc);
	void PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart);
	void RandSpin(float spinRate);
	void KSkelConvulse();
	void SetWeaponAttachment(class AwWeaponAttachment* NewAtt);
	void PlayVictoryAnimation();
	void CheckProneAni(bool bGoProne);
	void ServerThrowsWeaponAnim(bool bQuick);
	void ServerPlayPutdownWeaponAnim(bool bQuick);
	void PlayWeaponSwitch(class AwWeapon* newWeapon);
	void AnimEnd(int Channel);
	void ScriptPlayIdle(int Channel);
	void InitialPlayer();
	bool GetIsFiring();
	void StopFiring();
	void StartFiring(bool bHeavy, bool bRapid);
	void SetAnimAction(const struct FName& NewAction);
	bool FindValidTaunt(struct FName* Sequence);
	void PlayDoubleJump();
	struct FName GetAnimSequence();
	void Landed(const struct FVector& HitNormal);
	void PlayLandedSound(int SurfType);
	struct FName GetOffhandBoneFor(class AInventory* i);
	struct FName GetWeaponBoneFor(class AInventory* i);
	bool CheckReflect(const struct FVector& HitLocation, int Damage, struct FVector* RefNormal);
	void PlayHit(float Damage, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void PostNetBeginPlay();
	void InitMyParam();
	void PostBeginPlay();
	void WithinRadius();
	void SetProximityFuze(bool bProximity, class AwPawn* aiBot);
	void TickDamageWithinRadius(float DeltaTime);
	void Tick(float DeltaTime);
	void TestVersion_SetParameters();
	void TickDeRes(float DeltaTime);
	void SetOverlayMaterial(class UMaterial* mat, float Time, bool bOverride);
	void StartDeRes();
	void DoDamageFX(const struct FName& BoneName, int Damage, class UClass* DamageType, const struct FRotator& R, const struct FVector& HitLoc, int CollisionPart);
	void GetBoneNameByCollisionID(int CollisionID, struct FName* BoneName);
	void CalcHitLoc(const struct FVector& HitLoc, const struct FVector& hitRay, struct FName* BoneName, float* dist);
	void HideBone(const struct FName& BoneName);
	class UClass* GetBloodHitClass(bool bHeadShot);
	void ProcessHitFX();
	void SpawnGiblet(class UClass* GibClass, const struct FVector& Location, const struct FRotator& Rotation, float GibPerterbation, const struct FVector& GibVelocity);
	void SetHeadScale(float NewScale);
	void AttachEffect(class UClass* EmitterClass, const struct FName& BoneName, const struct FVector& Location, const struct FRotator& Rotation);
	void StopDriving(class AVehicle* V);
	void StartDriving(class AVehicle* V);
	void TickDamage(float DeltaTime);
	void TickFX(float DeltaTime);
	void RemovePowerups();
	class ATeamInfo* GetTeam();
	int GetTeamNum();
	class AController* GetKillerController();
	void Gasp();
	void PlayDyingSound();
	void PlayMoverHitSound();
	void PlayTeleportEffect(bool bOut, bool bSound);
	void DeactivateSpawnProtection();
	float AdjustedStrength();
	void PhysicsVolumeChange(class APhysicsVolume* NewVolume);
	void RemoveFlamingEffects();
	void Destroyed();
	void AssignInitialPose();
	void DoTranslocateOut(const struct FVector& PrevLocation);
	bool WasPlayerPawn();
	void UnPossessed();
	void PossessedBy(class AController* C);
	class URosterEntry* GetPlacedRoster();
	void PlayWaiting();
	void AltFire(float f);
	void Fire(float f);
	void ClientWeaponReset();
	void SimulatedSetRotation(const struct FRotator& R);
	void PlayTurretIdleAnim(bool UpDown);
};


// Class WGame.wMonster
// 0x0064 (0x18B4 - 0x1850)
class AwMonster : public AwPawn
{
public:
	unsigned long                                      bMeleeFighter : 1;                                        // 0x1850(0x0004)
	unsigned long                                      bShotAnim : 1;                                            // 0x1850(0x0004)
	unsigned long                                      bCanDodge : 1;                                            // 0x1850(0x0004)
	unsigned long                                      bVictoryNext : 1;                                         // 0x1850(0x0004)
	unsigned long                                      bTryToWalk : 1;                                           // 0x1850(0x0004)
	unsigned long                                      bBoss : 1;                                                // 0x1850(0x0004)
	unsigned long                                      bAlwaysStrafe : 1;                                        // 0x1850(0x0004)
	float                                              DodgeSkillAdjust;                                         // 0x1854(0x0004)
	class USound*                                      HitSound[0x4];                                            // 0x1858(0x0004)
	class USound*                                      DeathSound[0x4];                                          // 0x1868(0x0004)
	class USound*                                      ChallengeSound[0x4];                                      // 0x1878(0x0004)
	class USound*                                      FireSound;                                                // 0x1888(0x0004)
	class UClass*                                      AmmunitionClass;                                          // 0x188C(0x0004)
	class AwAmmunition*                                MyAmmo;                                                   // 0x1890(0x0004)
	int                                                ScoringValue;                                             // 0x1894(0x0004)
	struct FFireProperties                             SavedFireProperties;                                      // 0x1898(0x0014)
	int                                                MeshItemID;                                               // 0x18AC(0x0004) (Net)
	int                                                iNpcID;                                                   // 0x18B0(0x0004) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wMonster");
		return ptr;
	}


	void StartDeRes();
	void ProcessHitFX();
	void CreateGib(const struct FName& BoneName, class UClass* DamageType, const struct FRotator& R);
	void SetAnimAction(const struct FName& NewAction);
	void PlayVictoryAnimation();
	bool MeleeDamageTarget(int hitdamage, const struct FVector& pushdir);
	void PlayDyingSound();
	void PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart);
	void PlayTakeHit(const struct FVector& HitLocation, int Damage, class UClass* DamageType);
	bool IsPlayerPawn();
	void SetMovementPhysics();
	void AnimEnd(int Channel);
	void PlayVictory();
	void Destroyed();
	void PlayChallengeSound();
	void AssignInitialPose();
	bool SameSpeciesAs(class APawn* P);
	void LandThump();
	void PostBeginPlay();
	void FireProjectile();
	struct FVector GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z);
	float RangedAttackTime();
	bool HasRangedAttack();
	bool PreferMelee();
	void Fire(float f);
	bool IsHeadShot(const struct FVector& loc, const struct FVector& ray, float AdditionalScale);
	bool ForceDefaultCharacter();
	void TurnOff();
	float GetChargingDist();
	bool RecommendSplashDamage();
	float GetDamageRadius();
	bool SplashDamage();
	void StopFiring();
	bool CanAttack(class AActor* A);
	void RangedAttack(class AActor* A);
	void PostNetBeginPlay();
	void SetBotMesh();
};


// Class WGame.wDefenceBoss
// 0x00B4 (0x1968 - 0x18B4)
class AwDefenceBoss : public AwMonster
{
public:
	unsigned long                                      bStinging : 1;                                            // 0x18B4(0x0004)
	struct FFireProperties                             SavedFireProperties_2;                                    // 0x18B8(0x0014)
	class UClass*                                      AmmunitionClass_2;                                        // 0x18CC(0x0004)
	class AwAmmunition*                                MyAmmo_2;                                                 // 0x18D0(0x0004)
	struct FFireProperties                             SavedFireProperties_3;                                    // 0x18D4(0x0014)
	class UClass*                                      AmmunitionClass_3;                                        // 0x18E8(0x0004)
	class AwAmmunition*                                MyAmmo_3;                                                 // 0x18EC(0x0004)
	int                                                iRocketFireCount;                                         // 0x18F0(0x0004) (Edit, Config)
	float                                              fRocketFireTime;                                          // 0x18F4(0x0004)
	float                                              fBeamFireTime;                                            // 0x18F8(0x0004)
	float                                              fRocketFireDelay;                                         // 0x18FC(0x0004) (Edit, Config)
	float                                              fBeamFireDelay;                                           // 0x1900(0x0004) (Edit, Config)
	int                                                iMeleeDamage;                                             // 0x1904(0x0004) (Edit, Config)
	int                                                iLastMeleeDamage;                                         // 0x1908(0x0004) (Edit, Config)
	float                                              fLastChargingSpeed;                                       // 0x190C(0x0004) (Edit, Config)
	float                                              fTryChargingDist;                                         // 0x1910(0x0004)
	float                                              fChangeAttackTypeTime;                                    // 0x1914(0x0004)
	unsigned long                                      bReadySeekingRocket : 1;                                  // 0x1918(0x0004)
	float                                              fPrevHPPercent;                                           // 0x191C(0x0004)
	float                                              fNextActivePercent;                                       // 0x1920(0x0004)
	class UClass*                                      SpawnEffectExplosion;                                     // 0x1924(0x0004)
	class AEmitter*                                    PrepareBeamEffect;                                        // 0x1928(0x0004)
	class AEmitter*                                    LastChagingEffect;                                        // 0x192C(0x0004)
	class AEmitter*                                    RocketFireEffect;                                         // 0x1930(0x0004)
	unsigned long                                      bFinalAttackMode : 1;                                     // 0x1934(0x0004) (Net)
	struct FString                                     SoundBeamAction;                                          // 0x1938(0x000C) (NeedCtorLink)
	struct FString                                     SoundRocketAction;                                        // 0x1944(0x000C) (NeedCtorLink)
	struct FString                                     SoundMeleeAction;                                         // 0x1950(0x000C) (NeedCtorLink)
	struct FName                                       BeamAnim;                                                 // 0x195C(0x0004)
	struct FName                                       RocketAnim;                                               // 0x1960(0x0004)
	struct FName                                       MeleeAnim;                                                // 0x1964(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDefenceBoss");
		return ptr;
	}


	void Process_TossWeapon_When_Dying(class ALevelInfo* levenInfo, class APawn* Pawn, class AwWeapon* Weapon);
	void FootStepping(int side);
	void EffectExplosion();
	void PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart);
	void SetAnimAction(const struct FName& NewAction);
	void SpawnLastAttackEffect();
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void Tick(float DeltaTime);
	void ServerTick(float DeltaTime);
	void PatternTick(float DeltaTime);
	void Bump(class AActor* Other);
	void FinalMeleeAttack(class AActor* A);
	void RangedAttack(class AActor* A);
	void LastMeleeAttack(class AActor* A);
	void StartCharging();
	float RangedAttackTime();
	struct FVector GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z);
	struct FVector GetFireBack(const struct FVector& X, const struct FVector& Y, const struct FVector& Z);
	void PlayVictory();
	void PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange);
	void PlayDirectionalDeath(const struct FVector& HitLoc);
	void AnimEnd(int Channel);
	void WingBeat();
	void SetMovementPhysics();
	void PostBeginPlay();
	void FireProjectile();
	bool FireProjectile_Beam();
	void FireBeam();
	void StopPrepareBeamEffect();
	void SpawnPrepareBeamEffect();
	struct FVector GetRandDirection(const struct FRotator& InRotation, int iDegreeX, int iDegreeY, int iDegreeZ);
	bool FireProjectile_Rocket();
	bool FireProjectile_Rocket2();
	bool ReadyToRocket();
	bool ReadyToBeam();
	float RemainTimeRangedAttack();
	bool ReadyToRangedAttack();
	float GetChargingDist();
	void Destroyed();
	class AwDefenceBoss* STATIC_Create(class ALevelInfo* Level, unsigned char TeamNum, int Grade, int RegenLoc);
	class ANavigationPoint* STATIC_GetFlyingPathNode(class ALevelInfo* Level, int idx, int RegenLoc);
};


// Class WGame.AnimNotify_Nemesis_BeamFire
// 0x0000 (0x0030 - 0x0030)
class UAnimNotify_Nemesis_BeamFire : public UAnimNotify_Scripted
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.AnimNotify_Nemesis_BeamFire");
		return ptr;
	}


	void Notify(class AActor* Owner);
};


// Class WGame.wPlayer
// 0x02E8 (0x1128 - 0x0E40)
class AwPlayer : public AUnrealPlayer
{
public:
	class AAttractCamera*                              camlist[0x14];                                            // 0x0E40(0x0004)
	int                                                numcams;                                                  // 0x0E90(0x0004)
	int                                                curcam;                                                   // 0x0E94(0x0004)
	class APawn*                                       attracttarget;                                            // 0x0E98(0x0004)
	class APawn*                                       attracttarget2;                                           // 0x0E9C(0x0004)
	float                                              camtime;                                                  // 0x0EA0(0x0004)
	float                                              targettime;                                               // 0x0EA4(0x0004)
	float                                              gibwatchtime;                                             // 0x0EA8(0x0004)
	struct FVector                                     focuspoint;                                               // 0x0EAC(0x000C)
	int                                                InputHistory[0x4];                                        // 0x0EB8(0x0004) (Transient)
	float                                              LastKeyTime;                                              // 0x0EC8(0x0004) (Transient)
	int                                                OldKey;                                                   // 0x0ECC(0x0004) (Transient)
	float                                              MinAdrenalineCost;                                        // 0x0ED0(0x0004)
	struct FString                                     ComboNameList[0x10];                                      // 0x0ED4(0x000C) (NeedCtorLink)
	class UClass*                                      ComboList[0x10];                                          // 0x0F94(0x0004)
	struct FPlayerRecord                               PawnSetupRecord;                                          // 0x0FD4(0x00FC) (NeedCtorLink)
	float                                              LastRulesRequestTime;                                     // 0x10D0(0x0004)
	float                                              LastMapListRequestTime;                                   // 0x10D4(0x0004)
	unsigned long                                      autozoom : 1;                                             // 0x10D8(0x0004)
	unsigned long                                      bClassicTrans : 1;                                        // 0x10D8(0x0004)
	unsigned long                                      bHighBeaconTrajectory : 1;                                // 0x10D8(0x0004)
	unsigned long                                      bWaitingForPRI : 1;                                       // 0x10D8(0x0004)
	unsigned long                                      bWaitingForVRI : 1;                                       // 0x10D8(0x0004)
	unsigned long                                      bDebuggingVoiceChat : 1;                                  // 0x10D8(0x0004)
	unsigned long                                      bAutoDemoRec : 1;                                         // 0x10D8(0x0004)
	unsigned long                                      bIsFirstTick : 1;                                         // 0x10D8(0x0004)
	unsigned long                                      bMusicStarted : 1;                                        // 0x10D8(0x0004)
	float                                              bPrevDeltaTime;                                           // 0x10DC(0x0004)
	int                                                nRandomSound;                                             // 0x10E0(0x0004)
	unsigned char                                      bOldQuickGrenade;                                         // 0x10E4(0x0001)
	unsigned char                                      bOldQuickSubGrenade;                                      // 0x10E5(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x10E6(0x0002) MISSED OFFSET
	struct FString                                     ResultMenuClass;                                          // 0x10E8(0x000C) (NeedCtorLink)
	int                                                wPawnCounts;                                              // 0x10F4(0x0004)
	TArray<class AwWeapon*>                            InventoryRebuildSkipList;                                 // 0x10F8(0x000C) (NeedCtorLink)
	class AController*                                 CmdTarget;                                                // 0x1104(0x0004)
	float                                              fShakeFovSpeed;                                           // 0x1108(0x0004)
	class AwFPWeaponAttachment*                        FPTest;                                                   // 0x110C(0x0004)
	class AActor*                                      OldViewTarget;                                            // 0x1110(0x0004)
	float                                              BombSettingDelayTime;                                     // 0x1114(0x0004)
	struct FScriptDelegate                             __ProcessRule__Delegate;                                  // 0x1118(0x000C) (NeedCtorLink)
	struct FScriptDelegate                             __ProcessMapName__Delegate;                               // 0x1120(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPlayer");
		return ptr;
	}


	void MakeItemBox(const struct FString& t);
	void AnimRate(float fAnimRate);
	void UseRagdoll(bool bUse);
	void BodyRot_BR(float fR);
	void BodyRot_BL(float fR);
	void BodyRot_FR(float fR);
	void BodyRot_FL(float fR);
	void Rot_CBR(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void Rot_CBL(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void Rot_CFR(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void Rot_CFL(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void Rot_BR(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void Rot_BL(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void Rot_FR(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void Rot_FL(const struct FString& fX, const struct FString& fY, const struct FString& fZ);
	void ShowRot();
	void RenderSpectatorFPWeapon(class UCanvas* Canvas, bool bClearedZBuffer);
	void ChangeMouseSenseAim(float dt);
	void ChangeMouseSense(float dt);
	void MouseSenseDownAim();
	void MouseSenseUpAim();
	void MouseSenseDown();
	void MouseSenseUp();
	void RemoveSkill_Client(int iSkillID);
	void RemoveSkill(int iSkillID);
	void ClientReStart(class APawn* NewPawn);
	void ApplySkill_Client(int iSkillID);
	void AddSkill_Client(int iSkillID);
	void SkillInit_Server(bool bQuickslotChange);
	void AddSkill(int iSkillID);
	void ShowResultMenu();
	void HIJTest00();
	void PartsTest();
	void tT(float fRate);
	void TTT();
	void HIJ();
	void ServerWarp();
	void Warp();
	bool ActivateSupplyItem(class AController* callingController, TEnumAsByte<ESUPPLY_ITEM_TYPE> eSupplyItemType);
	bool CanUseActivateSupplyItem(class AController* callingController, TEnumAsByte<ESUPPLY_ITEM_TYPE> eSupplyItemType, bool bShowMessage);
	void UAV();
	void DoAirStrikeFire(const struct FVector& HitLocation);
	bool IsActiveMyTeamSentryGun();
	bool IsActiveUAV();
	bool IsActiveHelicopter();
	bool IsActiveAirFire();
	void heli();
	void c4();
	void art();
	void ServerCallSentryGunInstall(class AController* callingController);
	void ServerCallAirStrike(class AController* Caller);
	void ServerCallHelicopter(class APawn* lastHeliPawn, class AController* Caller);
	void Check();
	void ShowBindings();
	void ShowAliases();
	void InitializeVoiceChat();
	void ClientReceiveBan(const struct FString& BanInfo);
	void ServerRequestBanInfo(int PlayerID);
	void ServerSpecViewGoal();
	void SpecViewGoal();
	void ServerRequestPlayerInfo();
	void AdminMenu(const struct FString& CommandLine);
	void PostNetReceive();
	bool NeedNetNotify();
	void ChangeCharacter(const struct FString& newCharacter);
	void Possess(class APawn* aPawn);
	void SetPawnFemale();
	void UpdateModeItem_SkinCharacter(class UwMatchMaker* MM, unsigned char byModeItem, int ItemID, int* BodyItemID);
	void SetPlayerEquipInfo();
	void SetPawnClass(const struct FString& inClass, const struct FString& InCharacter);
	void PawnDied(class APawn* P);
	struct FRotator CameraTrack(class APawn* Target, float DeltaTime);
	bool LineOfSight(int C, class APawn* Target);
	class APawn* PickNextBot(class APawn* current);
	struct FVector FindFloatingCam(class APawn* Target);
	bool FindFixedCam(class APawn* Target, int* newcam);
	void FillCameraList();
	void ServerDoCombo(class UClass* ComboClass);
	void DoCombo(class UClass* ComboClass);
	void ServerPlayWeaponNullSound(class AwWeapon* Wpn, TEnumAsByte<ESoundSlot> Slot, bool UseStereo);
	void ProcessQuickGrenadeKey2();
	void ProcessQuickGrenadeKey();
	void ProcessSwitchDemoPack(bool hasBomb, bool bSettingBomb, unsigned char* byUsed);
	bool ProcessSetObjective();
	void ProcessUseKey();
	void PlayerTick(float DeltaTime);
	void NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void ClientReceiveCombo(const struct FString& NewCombo);
	void ServerSetClassicTrans(bool B);
	void PostNetBeginPlay();
	void PostBeginPlay();
	void L33TPhrase(int phraseNum);
	float RateWeapon(class AwWeapon* W);
	void PlayBeepSound();
	void StopFiring();
	void ClientReceiveMapName(const struct FString& NewMap);
	void ServerRequestMapList();
	void ClientReceiveResultMenu(const struct FString& MenuClass);
	void ClientReceiveRule(const struct FString& NewRule);
	void ServerRequestRules();
	struct FString GetPhysicsString();
	struct FString GetRoleString();
	void DebugMessage(const struct FString& DebugString, const struct FName& Type);
	void CheckPriority();
	bool InInventoryRebuildSkipList(class AwWeapon* W);
	void ServerRequestWeapon(int iWeaponID);
	void SetSpeed(float factor);
	void ResetNames();
	void setcmd(const struct FString& targetName);
	void Cmd(const struct FString& P1, const struct FString& P2, const struct FString& p3, const struct FString& p4, const struct FString& p5);
	void SetDoTraceNativeInstant(bool val);
	void SetFovSpeed(float V);
	float GetFovSpeed();
	void ShowPathToActor(class AActor* A);
	void ProcessMapName(const struct FString& NewMap);
	void ProcessRule(const struct FString& NewRule);
};


// Class WGame.wSupplyPack
// 0x0000 (0x043C - 0x043C)
class AwSupplyPack : public APickup
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wSupplyPack");
		return ptr;
	}


	bool CanPickUp(class APawn* Pawn);
	void Landed(const struct FVector& HitNormal);
};


// Class WGame.wHealthPack
// 0x0008 (0x0444 - 0x043C)
class AwHealthPack : public AwSupplyPack
{
public:
	int                                                HealingAmount;                                            // 0x043C(0x0004)
	float                                              fStayTime;                                                // 0x0440(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wHealthPack");
		return ptr;
	}


	int GetHealMax(class APawn* P);
	void Reset();
	void DisplayEvent(class APawn* P);
	void DeleteSuppliesPositions();
	void PostNetBeginPlay();
	void STATIC_UpdateHUD(class AHUD* H);
};


// Class WGame.wUAVPack
// 0x002C (0x0468 - 0x043C)
class AwUAVPack : public AwSupplyPack
{
public:
	float                                              fStayTime;                                                // 0x043C(0x0004)
	struct FString                                     SoundPickUP;                                              // 0x0440(0x000C) (NeedCtorLink)
	struct FString                                     StrSoundPickup;                                           // 0x044C(0x000C) (NeedCtorLink)
	struct FString                                     strSoundStandby;                                          // 0x0458(0x000C) (NeedCtorLink)
	int                                                weaponID;                                                 // 0x0464(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wUAVPack");
		return ptr;
	}


	bool CanPickUp(class APawn* Pawn);
	void AnnouncePickup(class APawn* Receiver);
	void Reset();
	void DeleteSuppliesPositions();
	void PostNetBeginPlay();
	void DisplayEvent(class APawn* P);
	void STATIC_UpdateHUD(class AHUD* H);
};


// Class WGame.wHeliPack
// 0x002C (0x0468 - 0x043C)
class AwHeliPack : public AwSupplyPack
{
public:
	float                                              fStayTime;                                                // 0x043C(0x0004)
	struct FString                                     SoundPickUP;                                              // 0x0440(0x000C) (NeedCtorLink)
	struct FString                                     StrSoundPickup;                                           // 0x044C(0x000C) (NeedCtorLink)
	struct FString                                     strSoundStandby;                                          // 0x0458(0x000C) (NeedCtorLink)
	int                                                weaponID;                                                 // 0x0464(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wHeliPack");
		return ptr;
	}


	bool CanPickUp(class APawn* Pawn);
	void AnnouncePickup(class APawn* Receiver);
	void Reset();
	void DeleteSuppliesPositions();
	void PostNetBeginPlay();
	void DisplayEvent(class APawn* P);
	void STATIC_UpdateHUD(class AHUD* H);
};


// Class WGame.wBombingPack
// 0x0020 (0x045C - 0x043C)
class AwBombingPack : public AwSupplyPack
{
public:
	float                                              fStayTime;                                                // 0x043C(0x0004)
	int                                                iAddWeaponID;                                             // 0x0440(0x0004)
	struct FString                                     SoundPickUP;                                              // 0x0444(0x000C) (NeedCtorLink)
	struct FString                                     strSoundStandby;                                          // 0x0450(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBombingPack");
		return ptr;
	}


	bool STATIC_CanPickUpPack(class APawn* Pawn);
	void AnnouncePickup(class APawn* Receiver);
	void Reset();
	void DeleteSuppliesPositions();
	void PostNetBeginPlay();
	void STATIC_UpdateHUD(class AHUD* H);
};


// Class WGame.wSentryGunPack
// 0x0018 (0x0454 - 0x043C)
class AwSentryGunPack : public AwSupplyPack
{
public:
	struct FString                                     m_soundPickUP;                                            // 0x043C(0x000C) (NeedCtorLink)
	struct FString                                     m_strSoundStandby;                                        // 0x0448(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wSentryGunPack");
		return ptr;
	}


	bool CanPickUp(class APawn* Pawn);
	void AnnouncePickup(class APawn* Receiver);
	void Reset();
	void DeleteSuppliesPositions();
	void PostNetBeginPlay();
	void DisplayEvent(class APawn* P);
	void STATIC_UpdateHUD(class AHUD* H);
};


// Class WGame.wMedalPack
// 0x0000 (0x043C - 0x043C)
class AwMedalPack : public AwSupplyPack
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wMedalPack");
		return ptr;
	}


	void Reset();
	void DisplayEvent(class APawn* P);
	void DeleteSuppliesPositions();
	void PostNetBeginPlay();
	void STATIC_UpdateHUD(class AHUD* H);
};


// Class WGame.wBotVehicleController
// 0x0078 (0x06C8 - 0x0650)
class AwBotVehicleController : public AScriptedController
{
public:
	unsigned long                                      bCanFire : 1;                                             // 0x0650(0x0004)
	unsigned long                                      bStrafeDir : 1;                                           // 0x0650(0x0004)
	unsigned long                                      bLeadTarget : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bChangeDir : 1;                                           // 0x0650(0x0004)
	unsigned long                                      bEnemyIsVisible : 1;                                      // 0x0650(0x0004)
	unsigned long                                      bMustCharge : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bJustLanded : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bRecommendFastMove : 1;                                   // 0x0650(0x0004)
	unsigned long                                      bHasFired : 1;                                            // 0x0650(0x0004)
	unsigned long                                      bForcedDirection : 1;                                     // 0x0650(0x0004)
	float                                              AcquireTime;                                              // 0x0654(0x0004)
	float                                              LoseEnemyCheckTime;                                       // 0x0658(0x0004)
	float                                              StartTacticalTime;                                        // 0x065C(0x0004)
	struct FVector                                     HidingSpot;                                               // 0x0660(0x000C)
	float                                              ChallengeTime;                                            // 0x066C(0x0004)
	float                                              Accuracy;                                                 // 0x0670(0x0004)
	float                                              StrafingAbility;                                          // 0x0674(0x0004)
	float                                              CombatStyle;                                              // 0x0678(0x0004)
	float                                              ReactionTime;                                             // 0x067C(0x0004)
	struct FString                                     GoalString;                                               // 0x0680(0x000C) (NeedCtorLink)
	struct FString                                     SoakString;                                               // 0x068C(0x000C) (NeedCtorLink)
	int                                                ChoosingAttackLevel;                                      // 0x0698(0x0004)
	float                                              ChooseAttackTime;                                         // 0x069C(0x0004)
	int                                                ChooseAttackCounter;                                      // 0x06A0(0x0004)
	float                                              EnemyVisibilityTime;                                      // 0x06A4(0x0004)
	class APawn*                                       VisibleEnemy;                                             // 0x06A8(0x0004)
	class APawn*                                       OldEnemy;                                                 // 0x06AC(0x0004)
	float                                              StopStartTime;                                            // 0x06B0(0x0004)
	float                                              LastRespawnTime;                                          // 0x06B4(0x0004)
	float                                              FailedHuntTime;                                           // 0x06B8(0x0004)
	class APawn*                                       FailedHuntEnemy;                                          // 0x06BC(0x0004)
	int                                                NumRandomJumps;                                           // 0x06C0(0x0004)
	int                                                iAttackerTeam;                                            // 0x06C4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBotVehicleController");
		return ptr;
	}


	void GameHasEnded();
	bool Stopped();
	bool IsHunting();
	bool IsStrafing();
	bool DefendMelee(float dist);
	void DoTacticalMove();
	void DoCharge();
	void DoStakeOut();
	void Celebrate();
	bool Formation();
	void NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	int GetTeamNum();
	void GetNextPathForMoveTarget();
	class AwHelicopter* GetHeli();
	void damageAttitudeTo(class APawn* Other, float Damage);
	float Desireability(class APickup* P);
	class AActor* FaceActor(float StrafingModifier);
	bool ShouldStrafeTo(class AActor* WayPoint);
	class AActor* FaceMoveTarget();
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	bool TryToDuck(const struct FVector& duckDir, bool bReversed);
	void ReceiveWarning(class APawn* shooter, float projSpeed, const struct FVector& FireDir);
	struct FRotator AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError);
	float AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow);
	bool CheckFutureSight(float DeltaTime);
	bool NearWall(float walldist);
	bool NeedToTurn(const struct FVector& targ);
	bool FindBestPathToward(class AActor* A, bool bCheckedReach, bool bAllowDetour);
	bool NotifyLanded(const struct FVector& HitNormal);
	void SetFall();
	bool NotifyBump(class AActor* Other);
	bool AdjustAround(class APawn* Other);
	void CancelCampFor(class AController* C);
	void Restart();
	bool TestDirection(const struct FVector& Dir, struct FVector* pick);
	bool FindRoamDest();
	void SoakStop(const struct FString& problem);
	void DoRangedAttackOn(class AActor* A);
	bool EnemyVisible();
	bool DoWaitForLanding();
	void ExecuteWhatToDoNext();
	struct FString GetEnemyName();
	struct FString GetOldEnemyName();
	void TryToWalk();
	void WhatToDoNext(unsigned char CallingByte);
	void SetPeripheralVision();
	void SetMaxDesiredSpeed();
	void ResetSkill();
	void InitializeSkill(float InSkill);
	void Possess(class APawn* aPawn);
	void NotifyMissedJump();
	bool NotifyPhysicsVolumeChange(class APhysicsVolume* NewVolume);
	bool StrafeFromDamage(float Damage, class UClass* DamageType, bool bFindDest);
	void EnemyChanged(bool bNewEnemyVisible);
	void SetEnemyInfo(bool bNewEnemyVisible);
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void CheckIfShouldCrouch(const struct FVector& StartPosition, const struct FVector& TargetPosition, float Probability);
	bool ClearShot(const struct FVector& TargetLoc, bool bImmediateFire);
	void SeePlayer(class APawn* SeenPlayer);
	void HearNoise(float Loudness, class AActor* NoiseMaker);
	bool SetEnemy(class APawn* NewEnemy, bool bHateMonster);
	void ChangeEnemy(class APawn* NewEnemy, bool bCanSeeNewEnemy);
	bool FindNewEnemy();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void StopFiring();
	bool CanAttack(class AActor* Other);
	bool FireWeaponAt(class AActor* A);
	void TimedFireWeaponAtEnemy();
	void WaitForMover(class AMover* M);
	void SetCombatTimer();
	void FearThisSpot(class AAvoidMarker* aSpot);
	void PostBeginPlay();
};


// Class WGame.wPawnSoundGroup
// 0x003C (0x0068 - 0x002C)
class UwPawnSoundGroup : public UObject
{
public:
	struct FString                                     BreathSound;                                              // 0x002C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     EquipHitSound;                                            // 0x0038(0x000C) (Edit, NeedCtorLink)
	TArray<struct FString>                             Sounds;                                                   // 0x0044(0x000C) (Edit, NeedCtorLink)
	TArray<struct FString>                             LandedSounds;                                             // 0x0050(0x000C) (Edit, NeedCtorLink)
	TArray<struct FString>                             LandedSounds_3rd;                                         // 0x005C(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPawnSoundGroup");
		return ptr;
	}


	struct FString STATIC_GetEquipHitSound();
	struct FString STATIC_GetBreathSound();
	struct FString STATIC_GetSound(TEnumAsByte<ESoundType> soundType);
	struct FString STATIC_GetLandedSound3d(int SurfType);
	struct FString STATIC_GetLandedSound2D(int SurfType);
	class USound* STATIC_GetDeathSound();
	class USound* STATIC_GetHitSound();
};


// Class WGame.Combo
// 0x0038 (0x0464 - 0x042C)
class ACombo : public AInfo
{
public:
	struct FString                                     ExecMessage;                                              // 0x042C(0x000C) (Localized, NeedCtorLink)
	float                                              AdrenalineCost;                                           // 0x0438(0x0004)
	float                                              Duration;                                                 // 0x043C(0x0004)
	class USound*                                      ActivateSound;                                            // 0x0440(0x0004)
	class UMaterial*                                   Icon;                                                     // 0x0444(0x0004)
	class USound*                                      ComboAnnouncement;                                        // 0x0448(0x0004)
	struct FName                                       ComboAnnouncementName;                                    // 0x044C(0x0004)
	int                                                keys[0x4];                                                // 0x0450(0x0004)
	class UClass*                                      Species;                                                  // 0x0460(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Combo");
		return ptr;
	}


	void Tick(float DeltaTime);
	void StopEffect(class AwPawn* P);
	void StartEffect(class AwPawn* P);
	void Destroyed();
	void AdrenalineEmpty();
	void PostBeginPlay();
};


// Class WGame.wWeaponAttachment
// 0x000C (0x10E0 - 0x10D4)
class AwWeaponAttachment : public AWeaponAttachment
{
public:
	unsigned long                                      bHeavy : 1;                                               // 0x10D4(0x0004) (Edit)
	unsigned long                                      bRapidFire : 1;                                           // 0x10D4(0x0004) (Edit)
	unsigned long                                      bAltRapidFire : 1;                                        // 0x10D4(0x0004) (Edit)
	class AwWeapon*                                    LitWeapon;                                                // 0x10D8(0x0004)
	unsigned char                                      OldSpawnHitCount;                                         // 0x10DC(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x10DD(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wWeaponAttachment");
		return ptr;
	}


	void MakeMeleeHitEffect();
	void Timer();
	void InitFor(class AInventory* i);
	void WeaponLight();
	struct FVector GetTipLocation();
	void PostNetBeginPlay();
	void ThirdPersonEffects();
	void UpdateHit(class AActor* HitActor, const struct FVector& HitLocation, const struct FVector& HitNormal, class UMaterial* HitMaterial);
	void UpdatePenetrateHit(class AActor* mHitActor, const struct FVector& mHitLocation, const struct FVector& mHitNormal, class UMaterial* mHitMaterial, int mLastHitIdx);
	void Hide(bool NewbHidden);
	void GetHitInfo(int nIndex, int i);
	void MakeSpawnShell(bool bRechamber);
};


// Class WGame.wAIPawn
// 0x0000 (0x1850 - 0x1850)
class AwAIPawn : public AwPawn
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAIPawn");
		return ptr;
	}


	void PlayLandedSound(int SurfType);
	void CheckEntryVehicle();
	void Tick(float dt);
	void UpdateCannotFindPath();
	void LogCannotFindPath(class AActor* Dest);
	void SetCannotFIndPath(class AActor* Dest);
	void NotifyAddDefaultInventory();
	void AddDefaultInventory(bool bQuickslotChange);
};


// Class WGame.wRosterEntry
// 0x00FC (0x0188 - 0x008C)
class UwRosterEntry : public URosterEntry
{
public:
	struct FPlayerRecord                               PlrProfile;                                               // 0x008C(0x00FC) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wRosterEntry");
		return ptr;
	}


	void InitBot(class ABot* B);
	void PrecacheRosterFor(class AUnrealTeamInfo* t);
	class UwRosterEntry* STATIC_CreateRosterEntryCharacter(const struct FString& CharName);
	class UwRosterEntry* STATIC_CreateRosterEntry(int prIdx);
};


// Class WGame.SPECIES_Human
// 0x0000 (0x01DC - 0x01DC)
class USPECIES_Human : public USpeciesType
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.SPECIES_Human");
		return ptr;
	}

};


// Class WGame.SPECIES_Merc
// 0x0000 (0x01DC - 0x01DC)
class USPECIES_Merc : public USPECIES_Human
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.SPECIES_Merc");
		return ptr;
	}


	struct FString STATIC_GetRagSkelName(const struct FString& MeshName);
};


// Class WGame.wMercMaleSoundGroup
// 0x0000 (0x0068 - 0x0068)
class UwMercMaleSoundGroup : public UwPawnSoundGroup
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wMercMaleSoundGroup");
		return ptr;
	}

};


// Class WGame.wBot
// 0x00FC (0x08DC - 0x07E0)
class AwBot : public ABot
{
public:
	struct FPlayerRecord                               PawnSetupRecord;                                          // 0x07E0(0x00FC) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBot");
		return ptr;
	}


	void Possess(class APawn* aPawn);
	void SetPawnClass(const struct FString& inClass, const struct FString& InCharacter);
};


// Class WGame.wMonsterController
// 0x0074 (0x06C4 - 0x0650)
class AwMonsterController : public AScriptedController
{
public:
	unsigned long                                      bCanFire : 1;                                             // 0x0650(0x0004)
	unsigned long                                      bStrafeDir : 1;                                           // 0x0650(0x0004)
	unsigned long                                      bLeadTarget : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bChangeDir : 1;                                           // 0x0650(0x0004)
	unsigned long                                      bEnemyIsVisible : 1;                                      // 0x0650(0x0004)
	unsigned long                                      bMustCharge : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bJustLanded : 1;                                          // 0x0650(0x0004)
	unsigned long                                      bRecommendFastMove : 1;                                   // 0x0650(0x0004)
	unsigned long                                      bHasFired : 1;                                            // 0x0650(0x0004)
	unsigned long                                      bForcedDirection : 1;                                     // 0x0650(0x0004)
	float                                              AcquireTime;                                              // 0x0654(0x0004)
	float                                              LoseEnemyCheckTime;                                       // 0x0658(0x0004)
	float                                              StartTacticalTime;                                        // 0x065C(0x0004)
	struct FVector                                     HidingSpot;                                               // 0x0660(0x000C)
	float                                              ChallengeTime;                                            // 0x066C(0x0004)
	float                                              Accuracy;                                                 // 0x0670(0x0004)
	float                                              StrafingAbility;                                          // 0x0674(0x0004)
	float                                              CombatStyle;                                              // 0x0678(0x0004)
	float                                              ReactionTime;                                             // 0x067C(0x0004)
	struct FString                                     GoalString;                                               // 0x0680(0x000C) (NeedCtorLink)
	struct FString                                     SoakString;                                               // 0x068C(0x000C) (NeedCtorLink)
	int                                                ChoosingAttackLevel;                                      // 0x0698(0x0004)
	float                                              ChooseAttackTime;                                         // 0x069C(0x0004)
	int                                                ChooseAttackCounter;                                      // 0x06A0(0x0004)
	float                                              EnemyVisibilityTime;                                      // 0x06A4(0x0004)
	class APawn*                                       VisibleEnemy;                                             // 0x06A8(0x0004)
	class APawn*                                       OldEnemy;                                                 // 0x06AC(0x0004)
	float                                              StopStartTime;                                            // 0x06B0(0x0004)
	float                                              LastRespawnTime;                                          // 0x06B4(0x0004)
	float                                              FailedHuntTime;                                           // 0x06B8(0x0004)
	class APawn*                                       FailedHuntEnemy;                                          // 0x06BC(0x0004)
	int                                                NumRandomJumps;                                           // 0x06C0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wMonsterController");
		return ptr;
	}


	void GameHasEnded();
	bool Stopped();
	bool IsHunting();
	bool IsStrafing();
	bool DefendMelee(float dist);
	void DoTacticalMove();
	void DoCharge();
	void DoStakeOut();
	void Celebrate();
	bool Formation();
	void damageAttitudeTo(class APawn* Other, float Damage);
	float Desireability(class APickup* P);
	void WanderOrCamp(bool bMayCrouch);
	class AActor* FaceActor(float StrafingModifier);
	bool ShouldStrafeTo(class AActor* WayPoint);
	class AActor* FaceMoveTarget();
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	bool TryToDuck(const struct FVector& duckDir, bool bReversed);
	void ReceiveWarning(class APawn* shooter, float projSpeed, const struct FVector& FireDir);
	struct FRotator AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError);
	float AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow);
	bool CheckFutureSight(float DeltaTime);
	bool NearWall(float walldist);
	bool NeedToTurn(const struct FVector& targ);
	bool FindBestPathToward(class AActor* A, bool bCheckedReach, bool bAllowDetour);
	bool NotifyLanded(const struct FVector& HitNormal);
	void SetFall();
	bool NotifyBump(class AActor* Other);
	void DirectedWander(const struct FVector& WanderDir);
	bool AdjustAround(class APawn* Other);
	void CancelCampFor(class AController* C);
	void Restart();
	bool TestDirection(const struct FVector& Dir, struct FVector* pick);
	bool FindRoamDest();
	void SoakStop(const struct FString& problem);
	void ChooseAttackMode();
	void DoRangedAttackOn(class AActor* A);
	void FightEnemy(bool bCanCharge);
	bool EnemyVisible();
	bool DoWaitForLanding();
	void ExecuteWhatToDoNext();
	struct FString GetEnemyName();
	struct FString GetOldEnemyName();
	void TryToWalk();
	void WhatToDoNext(unsigned char CallingByte);
	void SetPeripheralVision();
	void SetMaxDesiredSpeed();
	void ResetSkill();
	void InitializeSkill(float InSkill);
	void Possess(class APawn* aPawn);
	void NotifyMissedJump();
	bool NotifyPhysicsVolumeChange(class APhysicsVolume* NewVolume);
	bool StrafeFromDamage(float Damage, class UClass* DamageType, bool bFindDest);
	void EnemyChanged(bool bNewEnemyVisible);
	void SetEnemyInfo(bool bNewEnemyVisible);
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void CheckIfShouldCrouch(const struct FVector& StartPosition, const struct FVector& TargetPosition, float Probability);
	bool ClearShot(const struct FVector& TargetLoc, bool bImmediateFire);
	void SeePlayer(class APawn* SeenPlayer);
	void HearNoise(float Loudness, class AActor* NoiseMaker);
	bool SetEnemy(class APawn* NewEnemy, bool bHateMonster);
	void ChangeEnemy(class APawn* NewEnemy, bool bCanSeeNewEnemy);
	bool FindNewEnemy();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void StopFiring();
	bool CanAttack(class AActor* Other);
	bool FireWeaponAt(class AActor* A);
	void TimedFireWeaponAtEnemy();
	void WaitForMover(class AMover* M);
	void SetCombatTimer();
	void FearThisSpot(class AAvoidMarker* aSpot);
	void PostBeginPlay();
};


// Class WGame.wDefenceBossController
// 0x0000 (0x06C4 - 0x06C4)
class AwDefenceBossController : public AwMonsterController
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDefenceBossController");
		return ptr;
	}


	class AActor* FindRandEnemy();
	void FightEnemy(bool bCanCharge);
	void WanderOrCamp(bool bMayCrouch);
	void TimedFireWeaponAtTarget();
	void DoCharge();
	int GetTeamNum();
	void InitBot(int Grade);
	void ResetSkill();
	void OnBeginRound();
};


// Class WGame.wSeekingRocket
// 0x0010 (0x04F4 - 0x04E4)
class AwSeekingRocket : public AwRocket
{
public:
	class AActor*                                      Seeking;                                                  // 0x04E4(0x0004) (Net)
	struct FVector                                     InitialDir;                                               // 0x04E8(0x000C) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wSeekingRocket");
		return ptr;
	}


	void PostBeginPlay();
	void Timer();
};


// Class WGame.wDefenceBossAmmo_Beam
// 0x0000 (0x047C - 0x047C)
class AwDefenceBossAmmo_Beam : public AwAmmunition
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDefenceBossAmmo_Beam");
		return ptr;
	}

};


// Class WGame.wDefenceBossAmmo2
// 0x0000 (0x047C - 0x047C)
class AwDefenceBossAmmo2 : public AwAmmunition
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDefenceBossAmmo2");
		return ptr;
	}

};


// Class WGame.wDefenceBossAmmo
// 0x0000 (0x047C - 0x047C)
class AwDefenceBossAmmo : public AwAmmunition
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDefenceBossAmmo");
		return ptr;
	}

};


// Class WGame.wAction
// 0x0014 (0x0040 - 0x002C)
class UwAction : public UObject
{
public:
	int                                                Layer;                                                    // 0x002C(0x0004)
	float                                              MinTimeSegment;                                           // 0x0030(0x0004)
	struct FString                                     ActionName;                                               // 0x0034(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction");
		return ptr;
	}


	void ClearReferences();
	void WriteFutureState(class UwFutureState** fs);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UGoal* GetGoal(class AwAIBotBase* Owner);
};


// Class WGame.wActionContainer
// 0x0018 (0x0044 - 0x002C)
class UwActionContainer : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	class UwAction*                                    Action;                                                   // 0x0030(0x0004)
	TArray<class UwActionContainer*>                   SubActionContainers;                                      // 0x0034(0x000C) (NeedCtorLink)
	int                                                SubActionContainersLength;                                // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wActionContainer");
		return ptr;
	}


	struct FString ToString();
	void FreeActionContainers();
	void FreeActions();
	void FreeAll();
	void WriteFutureState(class UwFutureState** fs);
	bool Includes(class UwAction* testAction);
	class UwActionContainer* AddSubContainer(class UwAction* inAction);
	void ClearReferences();
	class UwActionContainer* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal
// 0x005C (0x0088 - 0x002C)
class UGoal : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	struct FString                                     GoalName;                                                 // 0x0030(0x000C) (NeedCtorLink)
	TArray<class UGoal*>                               Subgoals;                                                 // 0x003C(0x000C) (NeedCtorLink)
	TEnumAsByte<EGoalStatus>                           GoalStatus;                                               // 0x0048(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0049(0x0003) MISSED OFFSET
	struct FString                                     MessageNotifyKilled;                                      // 0x004C(0x000C) (NeedCtorLink)
	struct FString                                     MessageMemoryVisibleChanged;                              // 0x0058(0x000C) (NeedCtorLink)
	struct FString                                     MessageFlashed;                                           // 0x0064(0x000C) (NeedCtorLink)
	struct FString                                     MessageBePeaceful;                                        // 0x0070(0x000C) (NeedCtorLink)
	struct FString                                     MessageNotifyDied;                                        // 0x007C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal");
		return ptr;
	}


	bool SetFocus();
	bool SetFocusValue();
	bool SetFocusValueToTarget();
	struct FString ToString();
	void DisplayDebug(class UCanvas* C, int Level, float* YL, float* YPos);
	void HandleMessage(const struct FString& Msg);
	void End();
	TEnumAsByte<EGoalStatus> ProcessSubGoals(float dt);
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	TEnumAsByte<EGoalStatus> Process(float dt);
	void StartIfNotStarted();
	void Start();
	void ClearSubgoals(bool free);
	void AddSubgoal(class UGoal* inGoal);
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	void InitBase(class AwAIBotBase* inOwner);
};


// Class WGame.wPlanMaster
// 0x001C (0x0048 - 0x002C)
class UwPlanMaster : public UObject
{
public:
	int                                                MaxItr;                                                   // 0x002C(0x0004)
	int                                                ItrPerFrame;                                              // 0x0030(0x0004)
	int                                                CurItr;                                                   // 0x0034(0x0004)
	int                                                Planner_MinItr;                                           // 0x0038(0x0004)
	int                                                Planner_MaxItr;                                           // 0x003C(0x0004)
	int                                                Planner_UpdateItr;                                        // 0x0040(0x0004)
	class AwAILevel*                                   AILevel;                                                  // 0x0044(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPlanMaster");
		return ptr;
	}


	int _request(int i);
	int RequestItr();
	int RequestUpdateItr();
	void Update(float dt);
	class UwPlanMaster* STATIC_Create(class AwAILevel* inLevel);
};


// Class WGame.wBotVehicle
// 0x00B8 (0x1908 - 0x1850)
class AwBotVehicle : public AwPawn
{
public:
	unsigned long                                      bMeleeFighter : 1;                                        // 0x1850(0x0004)
	unsigned long                                      bShotAnim : 1;                                            // 0x1850(0x0004)
	unsigned long                                      bCanDodge : 1;                                            // 0x1850(0x0004)
	unsigned long                                      bVictoryNext : 1;                                         // 0x1850(0x0004)
	unsigned long                                      bTryToWalk : 1;                                           // 0x1850(0x0004)
	unsigned long                                      bBoss : 1;                                                // 0x1850(0x0004)
	unsigned long                                      bAlwaysStrafe : 1;                                        // 0x1850(0x0004)
	float                                              DodgeSkillAdjust;                                         // 0x1854(0x0004)
	class USound*                                      HitSound[0x4];                                            // 0x1858(0x0004)
	class USound*                                      DeathSound[0x4];                                          // 0x1868(0x0004)
	class USound*                                      ChallengeSound[0x4];                                      // 0x1878(0x0004)
	class USound*                                      FireSound;                                                // 0x1888(0x0004)
	class UClass*                                      AmmunitionClass;                                          // 0x188C(0x0004)
	class AwAmmunition*                                MyAmmo;                                                   // 0x1890(0x0004)
	class UClass*                                      ProjectileClass;                                          // 0x1894(0x0004)
	class AwProjectile*                                MyProj;                                                   // 0x1898(0x0004)
	int                                                ScoringValue;                                             // 0x189C(0x0004)
	struct FFireProperties                             SavedFireProperties;                                      // 0x18A0(0x0014)
	struct FString                                     StaySound;                                                // 0x18B4(0x000C) (NeedCtorLink)
	struct FString                                     MoveSound;                                                // 0x18C0(0x000C) (NeedCtorLink)
	struct FString                                     MoveDamagedSound;                                         // 0x18CC(0x000C) (NeedCtorLink)
	struct FString                                     SpindownSound;                                            // 0x18D8(0x000C) (NeedCtorLink)
	struct FString                                     ExplosionSoundWhenDying;                                  // 0x18E4(0x000C) (NeedCtorLink)
	struct FString                                     NullSound;                                                // 0x18F0(0x000C) (NeedCtorLink)
	unsigned long                                      bTestCheck : 1;                                           // 0x18FC(0x0004)
	float                                              CONFIG_SPINDOWN_SOUND_VOLUME;                             // 0x1900(0x0004)
	float                                              CONFIG_SPINDOWN_SOUND_RADIUS;                             // 0x1904(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBotVehicle");
		return ptr;
	}


	void StartDeRes();
	void CreateGib(const struct FName& BoneName, class UClass* DamageType, const struct FRotator& R);
	void SetAnimAction(const struct FName& NewAction);
	void PlayVictoryAnimation();
	bool MeleeDamageTarget(int hitdamage, const struct FVector& pushdir);
	void PlayDyingSound();
	void PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart);
	void PlayTakeHit(const struct FVector& HitLocation, int Damage, class UClass* DamageType);
	bool IsPlayerPawn();
	void SetMovementPhysics();
	void AnimEnd(int Channel);
	void PlayVictory();
	void Destroyed();
	void PlayChallengeSound();
	void AssignInitialPose();
	bool SameSpeciesAs(class APawn* P);
	void LandThump();
	void SpawnGiblet(class UClass* GibClass, const struct FVector& Location, const struct FRotator& Rotation, float GibPerterbation, const struct FVector& GibVelocity);
	void PostBeginPlay();
	void FireProjectile();
	struct FVector GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z);
	float RangedAttackTime();
	bool HasRangedAttack();
	bool PreferMelee();
	void Fire(float f);
	bool IsHeadShot(const struct FVector& loc, const struct FVector& ray, float AdditionalScale);
	bool ForceDefaultCharacter();
	void TurnOff();
	bool RecommendSplashDamage();
	float GetDamageRadius();
	bool SplashDamage();
	void StopFiring();
	bool CanAttack(class AActor* A);
	void RangedAttack(class AActor* A);
};


// Class WGame.wSentryGunPawn
// 0x0000 (0x1908 - 0x1908)
class AwSentryGunPawn : public AwBotVehicle
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wSentryGunPawn");
		return ptr;
	}


	void Destroyed();
	void PostBeginPlay();
};


// Class WGame.wHelicopter
// 0x00BC (0x19C4 - 0x1908)
class AwHelicopter : public AwBotVehicle
{
public:
	int                                                BehaviorState;                                            // 0x1908(0x0004) (Net)
	int                                                iCurrentPoint;                                            // 0x190C(0x0004) (Net)
	float                                              HelicopterDestinationFactor;                              // 0x1910(0x0004)
	float                                              CumulatedDyingTime;                                       // 0x1914(0x0004)
	float                                              CONFIG_DyingLifeSpan;                                     // 0x1918(0x0004)
	float                                              CONFIG_DyingRotationFactor;                               // 0x191C(0x0004)
	float                                              CONFIG_DyingRotationRate;                                 // 0x1920(0x0004)
	float                                              CONFIG_DyingEffectInterval;                               // 0x1924(0x0004)
	float                                              CONFIG_DyingImpluse;                                      // 0x1928(0x0004)
	float                                              CONFIG_DyingImpluseFactor;                                // 0x192C(0x0004)
	struct FString                                     CONFIG_FinalExplosionSoundExplosion;                      // 0x1930(0x000C) (NeedCtorLink)
	float                                              CONFIG_FinalExlosionSoundRadius;                          // 0x193C(0x0004)
	unsigned long                                      bBombExplosion : 1;                                       // 0x1940(0x0004)
	struct FSpriteWidget                               MinimapIconAlly;                                          // 0x1944(0x0040)
	struct FSpriteWidget                               MinimapIconEnemy;                                         // 0x1984(0x0040)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wHelicopter");
		return ptr;
	}


	bool STATIC_SpawnHeli(class ALevelInfo* Level, class AwHelicopter* lastHeli, class AController* Caller);
	class ANavigationPoint* STATIC_GetFlyingPathNode(class ALevelInfo* Level, int idx, int RegenLoc);
	class UClass* GetBloodHitClass(bool bHeadShot);
	bool deleOnReachedDestination(const struct FVector& Dir, class AActor* GoalActor);
	struct FName GetWeaponBoneFor(class AInventory* i);
	void PoundDamageTarget();
	void PunchDamageTarget();
	struct FVector GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z);
	void SpawnBelch();
	void PlayVictory();
	void PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange);
	void PlayDirectionalDeath(const struct FVector& HitLoc);
	void Falling();
	void SetMovementPhysics();
	bool Dodge(TEnumAsByte<EDoubleClickDir> DoubleClickMove);
	void RangedAttack(class AActor* A);
	void PostBeginPlay();
	void ClientPlayStaySound();
	void ClientPlayMoveSound();
	void ClientStopAllHeliSound();
	void StopAllHeliSound();
	void HeliExplosionWhenDestroyed();
	void Destroyed();
	void RemoveLevelHelicopter();
};


// Class WGame.AttractCamera
// 0x000C (0x03E4 - 0x03D8)
class AAttractCamera : public AKeypoint
{
public:
	float                                              ViewAngle;                                                // 0x03D8(0x0004) (Edit)
	float                                              MinZoomDist;                                              // 0x03DC(0x0004) (Edit)
	float                                              MaxZoomDist;                                              // 0x03E0(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.AttractCamera");
		return ptr;
	}

};


// Class WGame.ComboMessage
// 0x0000 (0x0450 - 0x0450)
class AComboMessage : public ALocalMessage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.ComboMessage");
		return ptr;
	}


	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class WGame.wPlayerReplicationInfo
// 0x010C (0x0738 - 0x062C)
class AwPlayerReplicationInfo : public ATeamPlayerReplicationInfo
{
public:
	struct FPlayerRecord                               Rec;                                                      // 0x062C(0x00FC) (NeedCtorLink)
	unsigned long                                      bForceNoPlayerLights : 1;                                 // 0x0728(0x0004)
	unsigned long                                      bNoTeamSkins : 1;                                         // 0x0728(0x0004)
	struct FString                                     PawnOverrideClass;                                        // 0x072C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPlayerReplicationInfo");
		return ptr;
	}


	class UMaterial* GetPortrait();
	void UpdateCharacter();
	void SetCharacterName(const struct FString& S);
	void UpdatePrecacheMaterials();
};


// Class WGame.PlayerRecordClass
// 0x0078 (0x00A4 - 0x002C)
class UPlayerRecordClass : public UObject
{
public:
	class UClass*                                      Species;                                                  // 0x002C(0x0004) (Edit)
	struct FString                                     MeshName;                                                 // 0x0030(0x000C) (Edit, NeedCtorLink)
	struct FString                                     BodySkinName;                                             // 0x003C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     FaceSkinName;                                             // 0x0048(0x000C) (Edit, NeedCtorLink)
	class UMaterial*                                   Portrait;                                                 // 0x0054(0x0004) (Edit)
	struct FString                                     TextName;                                                 // 0x0058(0x000C) (Edit, NeedCtorLink)
	struct FString                                     VoiceClassName;                                           // 0x0064(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Sex;                                                      // 0x0070(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Menu;                                                     // 0x007C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Skeleton;                                                 // 0x0088(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Ragdoll;                                                  // 0x0094(0x000C) (Edit, NeedCtorLink)
	class UClass*                                      PlayerInfo;                                               // 0x00A0(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.PlayerRecordClass");
		return ptr;
	}


	struct FPlayerRecord STATIC_FillPlayerRecord();
};


// Class WGame.wAIBot
// 0x0104 (0x0794 - 0x0690)
class AwAIBot : public AwAIBotBase
{
public:
	struct FPlayerRecord                               PawnSetupRecord;                                          // 0x0690(0x00FC) (Edit, NeedCtorLink)
	class UClass*                                      ShortMemoryClass;                                         // 0x078C(0x0004)
	class UClass*                                      TargetingSystemClass;                                     // 0x0790(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAIBot");
		return ptr;
	}


	void Possess(class APawn* aPawn);
	void SetPawnClass(const struct FString& inClass, const struct FString& InCharacter);
};


// Class WGame.wSeekingRocket_Nemesis
// 0x0000 (0x04F4 - 0x04F4)
class AwSeekingRocket_Nemesis : public AwSeekingRocket
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wSeekingRocket_Nemesis");
		return ptr;
	}


	void wLoadOut_SetStaticMesh(class UStaticMesh* stMesh);
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void SetSpawnEmitter();
	void SetSpeed(float fSpeed);
	void Timer();
	void HurtRadius(float DamageAmount, float DamageRadius, class UClass* DamageType, float Momentum, const struct FVector& HitLocation);
	void Touch(class AActor* Other);
};


// Class WGame.wSeekingIncenRocket_Nemesis
// 0x0000 (0x04F4 - 0x04F4)
class AwSeekingIncenRocket_Nemesis : public AwSeekingRocket_Nemesis
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wSeekingIncenRocket_Nemesis");
		return ptr;
	}


	void Explode(const struct FVector& HitLocation, const struct FVector& HitNormal);
	void SplashGrenades(const struct FVector& HitLocation);
};


// Class WGame.wIncendiaryRocket
// 0x0004 (0x04E8 - 0x04E4)
class AwIncendiaryRocket : public AwRocket
{
public:
	class AwEmitter*                                   Trail;                                                    // 0x04E4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wIncendiaryRocket");
		return ptr;
	}


	void Explode(const struct FVector& HitLocation, const struct FVector& HitNormal);
	void Destroyed();
	void SpawnTrail();
	void SetSpawnEmitter();
	void SplashGrenades(const struct FVector& HitLocation);
	void HurtRadius(float DamageAmount, float DamageRadius, class UClass* DamageType, float Momentum, const struct FVector& HitLocation);
};


// Class WGame.Goal_PlanAndExec
// 0x002C (0x00B4 - 0x0088)
class UGoal_PlanAndExec : public UGoal
{
public:
	TArray<class UwPurpose*>                           purposes;                                                 // 0x0088(0x000C) (NeedCtorLink)
	class UwPurpose*                                   CurrentPurpose;                                           // 0x0094(0x0004)
	class UwActionPlanner*                             Planner;                                                  // 0x0098(0x0004)
	unsigned long                                      NeedReplaning : 1;                                        // 0x009C(0x0004)
	float                                              CurrentPlanScore;                                         // 0x00A0(0x0004)
	int                                                CheckReplanCount;                                         // 0x00A4(0x0004)
	struct FString                                     targetName;                                               // 0x00A8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_PlanAndExec");
		return ptr;
	}


	struct FString ToString();
	void HandleMessage(const struct FString& Msg);
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void LogFlag();
	void LogPlan(int tries, float planScore, class UwActionContainer** Plan);
	void LookForBetterPlan(int tries);
	void Replan();
	void DecidePurposeToActivate();
	void InitPurposes();
	void ClearReferences();
	class UGoal_PlanAndExec* Init(class AwAIBotBase* inOwner, class UwActionPlanner* inPlaner);
};


// Class WGame.Goal_Fire
// 0x0048 (0x00D0 - 0x0088)
class UGoal_Fire : public UGoal
{
public:
	class AActor*                                      Target;                                                   // 0x0088(0x0004)
	float                                              FireCheckInterval;                                        // 0x008C(0x0004)
	float                                              elapsed;                                                  // 0x0090(0x0004)
	unsigned long                                      StartStopSwitch : 1;                                      // 0x0094(0x0004)
	float                                              LastAmmo;                                                 // 0x0098(0x0004)
	float                                              LastAmmoMax;                                              // 0x009C(0x0004)
	float                                              Ammo;                                                     // 0x00A0(0x0004)
	float                                              StartAmmo;                                                // 0x00A4(0x0004)
	float                                              StartAmmoMax;                                             // 0x00A8(0x0004)
	float                                              CurrentAmmo;                                              // 0x00AC(0x0004)
	float                                              CurrentAmmoMax;                                           // 0x00B0(0x0004)
	int                                                FireCount;                                                // 0x00B4(0x0004)
	unsigned long                                      DoAim : 1;                                                // 0x00B8(0x0004)
	unsigned long                                      AimAvailable : 1;                                         // 0x00B8(0x0004)
	unsigned long                                      WeaponFireModeSingle : 1;                                 // 0x00B8(0x0004)
	float                                              FailTime;                                                 // 0x00BC(0x0004)
	struct FString                                     StartWeaponName;                                          // 0x00C0(0x000C) (NeedCtorLink)
	unsigned long                                      StartedWithTarget : 1;                                    // 0x00CC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Fire");
		return ptr;
	}


	struct FString ToString();
	void End();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	bool SetFocusValue();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_Fire* Init(class AwAIBotBase* inOwner, class AActor* inTarget, bool inDoAim, int inFireCount);
};


// Class WGame.Goal_MovePathToward
// 0x0010 (0x0098 - 0x0088)
class UGoal_MovePathToward : public UGoal
{
public:
	class AActor*                                      Destination;                                              // 0x0088(0x0004)
	int                                                RouteCacheIdx;                                            // 0x008C(0x0004)
	float                                              ReachRadius;                                              // 0x0090(0x0004)
	unsigned long                                      Sprint : 1;                                               // 0x0094(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_MovePathToward");
		return ptr;
	}


	void NotifyDestroyed(class AActor* A);
	struct FString ToString();
	bool AddGoalMoveToward(int stackLevel);
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_MovePathToward* Init(class AwAIBotBase* inOwner, class AActor* inDestination, float inReachRadius);
};


// Class WGame.Goal_Roam
// 0x0000 (0x0088 - 0x0088)
class UGoal_Roam : public UGoal
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Roam");
		return ptr;
	}


	struct FString ToString();
	void AddGoalMovePathToward();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_Roam* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_Shoot
// 0x0020 (0x00A8 - 0x0088)
class UGoal_Shoot : public UGoal
{
public:
	class AActor*                                      Target;                                                   // 0x0088(0x0004)
	float                                              FireCheckInterval;                                        // 0x008C(0x0004)
	float                                              elapsed;                                                  // 0x0090(0x0004)
	unsigned long                                      StartStopSwitch : 1;                                      // 0x0094(0x0004)
	float                                              LastAmmo;                                                 // 0x0098(0x0004)
	float                                              LastAmmoMax;                                              // 0x009C(0x0004)
	float                                              Ammo;                                                     // 0x00A0(0x0004)
	unsigned long                                      DoAim : 1;                                                // 0x00A4(0x0004)
	unsigned long                                      AimAvailable : 1;                                         // 0x00A4(0x0004)
	unsigned long                                      WeaponFireModeSingle : 1;                                 // 0x00A4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Shoot");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_Shoot* Init(class AwAIBotBase* inOwner, class AActor* inTarget, bool inDoAim);
};


// Class WGame.Goal_Test
// 0x0000 (0x0088 - 0x0088)
class UGoal_Test : public UGoal
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Test");
		return ptr;
	}


	struct FString ToString();
	void AddGoal();
	class ANavigationPoint* GetReachableRandomTarget();
	void End();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_Test* Init(class AwAIBotBase* inOwner);
};


// Class WGame.wPurposeExplore
// 0x0000 (0x0050 - 0x0050)
class UwPurposeExplore : public UwPurpose
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPurposeExplore");
		return ptr;
	}


	float GetActivationScore();
	float Evaluate(class UwStateData** S);
};


// Class WGame.wActionPlanner
// 0x0014 (0x0040 - 0x002C)
class UwActionPlanner : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	unsigned long                                      Peaceful : 1;                                             // 0x0030(0x0004)
	int                                                MaxActionLayers;                                          // 0x0034(0x0004)
	class UwStateData*                                 WorkingState;                                             // 0x0038(0x0004)
	class UwNPCActions*                                npcActions;                                               // 0x003C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wActionPlanner");
		return ptr;
	}


	class UwActionContainer* Plan(class UwPurpose* purpose, int tries, float* bestPlanScore);
	void SubPlan(int Layer, class UwPurpose* purpose, float parentActionTime, class UwActionContainer** acon, class UwStateData** S, TArray<class UwActionLayer*>* Actions);
	void GetActionCandidatesByLayer(TArray<class UwAction*>* rawActions, TArray<class UwActionLayer*>* actionsByLayer);
	void GetActionCandidates(TArray<class UwAction*>* Actions);
	void GetActionCandidates_Pick(TArray<class UwAction*>* Actions);
	void GetActionCandidates_SwitchWeapon(TArray<class UwAction*>* Actions);
	void ClearReferences();
	class UwActionPlanner* STATIC_Create(class AwAIBotBase* inOwner, class UwNPCActions* Actions);
};


// Class WGame.wFutureState
// 0x0008 (0x0034 - 0x002C)
class UwFutureState : public UObject
{
public:
	class AwFlagObjectiveBase*                         FlagDest;                                                 // 0x002C(0x0004)
	class AwFlagObjectiveBase*                         FlagCapturing;                                            // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wFutureState");
		return ptr;
	}


	void Init();
	class UwFutureState* STATIC_Create();
};


// Class WGame.TargetingSystem
// 0x0010 (0x003C - 0x002C)
class UTargetingSystem : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	class ALevelInfo*                                  Level;                                                    // 0x0030(0x0004)
	class UDAE_Multiple*                               Evaluator;                                                // 0x0034(0x0004)
	class UMemoryItem*                                 Target;                                                   // 0x0038(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.TargetingSystem");
		return ptr;
	}


	void ClearReferences();
	void DisplayDebug(class UCanvas* C, float* YL, float* YPos);
	void Update(float dt);
	class UMemoryItem* GetTarget();
	void InitEvaluator();
	class UTargetingSystem* STATIC_Create(class AwAIBotBase* inOwner);
};


// Class WGame.wHelicopterRSA
// 0x0000 (0x19C4 - 0x19C4)
class AwHelicopterRSA : public AwHelicopter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wHelicopterRSA");
		return ptr;
	}

};


// Class WGame.wHelicopterController
// 0x0084 (0x06D4 - 0x0650)
class AwHelicopterController : public AScriptedController
{
public:
	class AActor*                                      CurrentPathNode;                                          // 0x0650(0x0004)
	unsigned long                                      bFirstFollowPath : 1;                                     // 0x0654(0x0004)
	unsigned long                                      bAttacking : 1;                                           // 0x0654(0x0004)
	float                                              AttackStartTime;                                          // 0x0658(0x0004)
	int                                                AttackPhase;                                              // 0x065C(0x0004)
	int                                                LastAttackPhase;                                          // 0x0660(0x0004)
	float                                              FireCheckInterval;                                        // 0x0664(0x0004)
	int                                                AttackPendingWeaponID;                                    // 0x0668(0x0004)
	float                                              AttackPendingWeaponAmmo;                                  // 0x066C(0x0004)
	float                                              TempAmmo;                                                 // 0x0670(0x0004)
	float                                              TempAmmoMax;                                              // 0x0674(0x0004)
	float                                              CONFIG_MinSpeed;                                          // 0x0678(0x0004)
	float                                              CONFIG_MaxSpeed;                                          // 0x067C(0x0004)
	float                                              CONFIG_Acceleration;                                      // 0x0680(0x0004)
	float                                              CONFIG_Deceleration;                                      // 0x0684(0x0004)
	TArray<int>                                        CONFIG_AttackSlot;                                        // 0x0688(0x000C) (NeedCtorLink)
	TArray<float>                                      CONFIG_AttackTime;                                        // 0x0694(0x000C) (NeedCtorLink)
	TArray<int>                                        CONFIG_AttackAimMinError;                                 // 0x06A0(0x000C) (NeedCtorLink)
	TArray<int>                                        CONFIG_AttackAimMaxError;                                 // 0x06AC(0x000C) (NeedCtorLink)
	float                                              CONFIG_AttackMoveMomentumFactor;                          // 0x06B8(0x0004)
	float                                              CONFIG_AttackOneMoveFactor;                               // 0x06BC(0x0004)
	float                                              CONFIG_FireStartAngleInDot;                               // 0x06C0(0x0004)
	float                                              CONFIG_MinAngleAgainstGround;                             // 0x06C4(0x0004)
	float                                              CONFIG_MoveMaxSlope;                                      // 0x06C8(0x0004)
	float                                              CONFIG_SoundVolume;                                       // 0x06CC(0x0004)
	float                                              CONFIG_SoundRadius;                                       // 0x06D0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wHelicopterController");
		return ptr;
	}


	void OnEndRound();
	void PawnDied(class APawn* P);
	void ClientOnEndWaitingForStart();
	void Disappear();
	void ServerStopAllSoundByHeli(class APawn* P);
	void PlayStaySound();
	void PlayMoveSound();
	void Decelerate(float dt);
	void Accelerate(float dt);
	class APawn* GetEnemy();
	float GetDotAgainstGround(class APawn* P);
	float GetDot(class APawn* P);
	struct FVector GetMomentousRandomDest();
	void ProgressFlyingPathNode();
	class ANavigationPoint* GetNextFlyingPathNode();
	int Degree2Unreal(float Angle);
	int GetSignedRandom(int Min, int Max);
	struct FRotator AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError);
	class APlayerReplicationInfo* GetPRI();
	void GameHasEnded();
	int GetTeamNum();
	class AwHelicopter* GetHeli();
	void NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn);
	void Possess(class APawn* aPawn);
	void DisplayDebug(class UCanvas* C, float* YL, float* YPos);
	void IncY(class UCanvas* C, float* YL, float* YPos);
	struct FString Rotator2String(const struct FRotator& R);
	struct FString Vector2String(const struct FVector& V);
	bool FireWeaponAt(class AActor* A);
	void CancelCampFor(class AController* C);
};


// Class WGame.wAISentryGunController
// 0x0004 (0x0798 - 0x0794)
class AwAISentryGunController : public AwAIBot
{
public:
	unsigned long                                      m_bAimingTarget : 1;                                      // 0x0794(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAISentryGunController");
		return ptr;
	}


	struct FRotator GetViewRotation();
	bool IsFinishSpecificBoneRotate();
	void ExecuteWhatToDoNext();
};


// Class WGame.DECO_Barricade
// 0x0034 (0x0458 - 0x0424)
class ADECO_Barricade : public ADecoration
{
public:
	int                                                Backup_Health;                                            // 0x0424(0x0004)
	class AVolumeTimer*                                VT;                                                       // 0x0428(0x0004)
	class AController*                                 DelayedDamageInstigatorController;                        // 0x042C(0x0004)
	float                                              RadiusDamage;                                             // 0x0430(0x0004)
	unsigned long                                      bCheckForStackedBarrels : 1;                              // 0x0434(0x0004)
	unsigned long                                      bBurning : 1;                                             // 0x0434(0x0004)
	float                                              fLastBurningTime;                                         // 0x0438(0x0004)
	class AwProjectile*                                BurningProj;                                              // 0x043C(0x0004)
	struct FString                                     SoundWarning;                                             // 0x0440(0x000C) (NeedCtorLink)
	struct FString                                     SoundDestroy;                                             // 0x044C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DECO_Barricade");
		return ptr;
	}


	bool EncroachingOn(class AActor* Other);
	void EncroachedBy(class AActor* Other);
	void Bump(class AActor* Other);
	void Reset();
	bool IsNearbyBarrel(class AActor* A);
	void HurtRadius(float DamageAmount, float DamageRadius, class UClass* DamageType, float Momentum, const struct FVector& HitLocation);
	void TimerPop(class AVolumeTimer* t);
	void CheckNearbyBarrels();
	void TakeDamage(int NDamage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void SetDelayedDamageInstigatorController(class AController* C);
	void PostNetBeginPlay();
	void PostBeginPlay();
	void TickDamage();
	void SetBurning(bool bBurn, class AwProjectile* proj);
	void BaseChange();
	void PhysicsVolumeChange(class APhysicsVolume* NewVolume);
	void HitWall(const struct FVector& HitNormal, class AActor* Wall, class UMaterial* HitMaterial);
	void Landed(const struct FVector& HitNormal);
};


// Class WGame.Goal_MoveToward
// 0x0024 (0x00AC - 0x0088)
class UGoal_MoveToward : public UGoal
{
public:
	class AActor*                                      Destination;                                              // 0x0088(0x0004)
	class AActor*                                      Focus;                                                    // 0x008C(0x0004)
	unsigned long                                      bSprint : 1;                                              // 0x0090(0x0004)
	unsigned long                                      bCrouch : 1;                                              // 0x0090(0x0004)
	unsigned long                                      bProne : 1;                                               // 0x0090(0x0004)
	float                                              ReachRadius;                                              // 0x0094(0x0004)
	float                                              LostStartTime;                                            // 0x0098(0x0004)
	struct FVector                                     checkpoint;                                               // 0x009C(0x000C)
	float                                              CheckPointTime;                                           // 0x00A8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_MoveToward");
		return ptr;
	}


	struct FString ToString();
	void NotifyDestroyed(class AActor* A);
	bool SetFocusValue();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	bool doSprint();
	void Start();
	bool PassedCheckPoint();
	void ClearReferences();
	class UGoal_MoveToward* Init(class AwAIBotBase* inOwner, class AActor* inDestination, class AActor* inFocus, float inReachRadius, bool inSprint, bool inCrouch, bool inProne);
};


// Class WGame.DAE
// 0x0000 (0x002C - 0x002C)
class UDAE : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
};


// Class WGame.DAE_Multiple
// 0x001C (0x0048 - 0x002C)
class UDAE_Multiple : public UDAE
{
public:
	TArray<class UDAE*>                                DAEs;                                                     // 0x002C(0x000C) (NeedCtorLink)
	TArray<float>                                      Factors;                                                  // 0x0038(0x000C) (NeedCtorLink)
	float                                              TotalFactors;                                             // 0x0044(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_Multiple");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	void Add(float factor, class UDAE* inDAE);
	class UDAE_Multiple* STATIC_Create();
};


// Class WGame.DAE_InSight
// 0x0004 (0x0030 - 0x002C)
class UDAE_InSight : public UDAE
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_InSight");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_InSight* STATIC_Create(class AwAIBotBase* inOwner);
};


// Class WGame.DAE_Visibility
// 0x0004 (0x0030 - 0x002C)
class UDAE_Visibility : public UDAE
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_Visibility");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_Visibility* STATIC_Create(class AwAIBotBase* inOwner);
};


// Class WGame.DAE_Proximity
// 0x0008 (0x0034 - 0x002C)
class UDAE_Proximity : public UDAE
{
public:
	float                                              MaxDistance;                                              // 0x002C(0x0004)
	class AwAIBotBase*                                 Owner;                                                    // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_Proximity");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_Proximity* STATIC_Create(class AwAIBotBase* inOwner, float inMaxDistance);
};


// Class WGame.DAE_IsTurret
// 0x0000 (0x002C - 0x002C)
class UDAE_IsTurret : public UDAE
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_IsTurret");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_IsTurret* STATIC_Create();
};


// Class WGame.DAE_RecentTarget
// 0x0008 (0x0034 - 0x002C)
class UDAE_RecentTarget : public UDAE
{
public:
	float                                              Time;                                                     // 0x002C(0x0004)
	class AwAIBotBase*                                 Owner;                                                    // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_RecentTarget");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_RecentTarget* STATIC_Create(class AwAIBotBase* inOwner, float InTime);
};


// Class WGame.wAction_Empty
// 0x0000 (0x0040 - 0x0040)
class UwAction_Empty : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_Empty");
		return ptr;
	}


	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_Empty* Init();
};


// Class WGame.wActionLayer
// 0x000C (0x0038 - 0x002C)
class UwActionLayer : public UObject
{
public:
	TArray<class UwAction*>                            Actions;                                                  // 0x002C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wActionLayer");
		return ptr;
	}


	class UwActionLayer* Init();
};


// Class WGame.wAction_Fire
// 0x0000 (0x0040 - 0x0040)
class UwAction_Fire : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_Fire");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	int GetWeaponMultiplier(class UwStateData* ws);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float CalcDamage(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_Fire* Init();
};


// Class WGame.wAction_Reload
// 0x0000 (0x0040 - 0x0040)
class UwAction_Reload : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_Reload");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_Reload* Init();
};


// Class WGame.wAction_Explore
// 0x0000 (0x0040 - 0x0040)
class UwAction_Explore : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_Explore");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	float STATIC_CalcMeetNewEnemyProbability(class UwStateData* ws);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_Explore* Init();
};


// Class WGame.wAction_ExploreTutorial
// 0x0000 (0x0040 - 0x0040)
class UwAction_ExploreTutorial : public UwAction_Explore
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_ExploreTutorial");
		return ptr;
	}


	float STATIC_CalcMeetNewEnemyProbability(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
};


// Class WGame.wAction_IdleHands
// 0x0004 (0x0044 - 0x0040)
class UwAction_IdleHands : public UwAction
{
public:
	float                                              IdleTime;                                                 // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_IdleHands");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_IdleHands* Init(float inIdleTime);
};


// Class WGame.wAction_ApproachAndMelee
// 0x0000 (0x0040 - 0x0040)
class UwAction_ApproachAndMelee : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_ApproachAndMelee");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_ApproachAndMelee* Init();
};


// Class WGame.wAction_MoveToEnemyInfluence
// 0x0000 (0x0040 - 0x0040)
class UwAction_MoveToEnemyInfluence : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_MoveToEnemyInfluence");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_MoveToEnemyInfluence* Init();
};


// Class WGame.wAction_MoveToSeeTarget
// 0x0000 (0x0040 - 0x0040)
class UwAction_MoveToSeeTarget : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_MoveToSeeTarget");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_MoveToSeeTarget* Init();
};


// Class WGame.wAction_LookAround
// 0x0004 (0x0044 - 0x0040)
class UwAction_LookAround : public UwAction
{
public:
	float                                              Duration;                                                 // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_LookAround");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_LookAround* Init(float inDuration);
};


// Class WGame.wAction_UseHelicopter
// 0x0000 (0x0040 - 0x0040)
class UwAction_UseHelicopter : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_UseHelicopter");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_UseHelicopter* Init();
};


// Class WGame.wAction_UseAIrstrikeRealTime
// 0x0000 (0x0040 - 0x0040)
class UwAction_UseAIrstrikeRealTime : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_UseAIrstrikeRealTime");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_UseAIrstrikeRealTime* Init();
};


// Class WGame.wAction_UseUAV
// 0x0000 (0x0040 - 0x0040)
class UwAction_UseUAV : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_UseUAV");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_UseUAV* Init();
};


// Class WGame.wAction_MeleeNoTarget
// 0x0000 (0x0040 - 0x0040)
class UwAction_MeleeNoTarget : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_MeleeNoTarget");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_MeleeNoTarget* Init();
};


// Class WGame.wAction_AimSpecificParts
// 0x0000 (0x0040 - 0x0040)
class UwAction_AimSpecificParts : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_AimSpecificParts");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_AimSpecificParts* Init();
};


// Class WGame.wAction_FireSpecialTarget
// 0x0008 (0x0048 - 0x0040)
class UwAction_FireSpecialTarget : public UwAction_Fire
{
public:
	class AActor*                                      Target;                                                   // 0x0040(0x0004)
	float                                              DmgFactor;                                                // 0x0044(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_FireSpecialTarget");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	float CalcDamage(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	void NotifyDestroyed(class AActor* A);
	class UwAction_FireSpecialTarget* Init2(class AActor* inTarget, float inDmgFactor);
};


// Class WGame.wAction_PickTarget
// 0x0004 (0x0044 - 0x0040)
class UwAction_PickTarget : public UwAction
{
public:
	class UMemoryItem*                                 TargetMemoryItem;                                         // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_PickTarget");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	void ClearReferences();
	class UwAction_PickTarget* Init(class UMemoryItem* inTarget);
};


// Class WGame.wAction_ThrowGrenadeRealTime
// 0x0000 (0x0040 - 0x0040)
class UwAction_ThrowGrenadeRealTime : public UwAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_ThrowGrenadeRealTime");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	class UwAction_ThrowGrenadeRealTime* Init();
};


// Class WGame.wAction_PickHealth
// 0x0004 (0x0044 - 0x0040)
class UwAction_PickHealth : public UwAction
{
public:
	class APickup*                                     Pack;                                                     // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_PickHealth");
		return ptr;
	}


	void NotifyDestroyed(class AActor* A);
	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	void ClearReferences();
	class UwAction_PickHealth* Init(class APickup* inPack);
};


// Class WGame.wAction_PickHelicopter
// 0x0004 (0x0044 - 0x0040)
class UwAction_PickHelicopter : public UwAction
{
public:
	class APickup*                                     Pack;                                                     // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_PickHelicopter");
		return ptr;
	}


	void NotifyDestroyed(class AActor* A);
	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	void ClearReferences();
	class UwAction_PickHelicopter* Init(class APickup* inPack);
};


// Class WGame.wAction_PickAirstrike
// 0x0004 (0x0044 - 0x0040)
class UwAction_PickAirstrike : public UwAction
{
public:
	class APickup*                                     Pack;                                                     // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_PickAirstrike");
		return ptr;
	}


	void NotifyDestroyed(class AActor* A);
	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	void ClearReferences();
	class UwAction_PickAirstrike* Init(class APickup* inPack);
};


// Class WGame.wAction_PickUAV
// 0x0004 (0x0044 - 0x0040)
class UwAction_PickUAV : public UwAction
{
public:
	class APickup*                                     Pack;                                                     // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_PickUAV");
		return ptr;
	}


	void NotifyDestroyed(class AActor* A);
	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	void ClearReferences();
	class UwAction_PickUAV* Init(class APickup* inPack);
};


// Class WGame.wAction_SwitchWeapon
// 0x0004 (0x0044 - 0x0040)
class UwAction_SwitchWeapon : public UwAction
{
public:
	class AwWeapon*                                    Weapon;                                                   // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAction_SwitchWeapon");
		return ptr;
	}


	class UGoal* GetGoal(class AwAIBotBase* Owner);
	void Sim_PostEffect(class UwStateData* ws);
	void Sim_PreEffect(class UwStateData* ws);
	float Sim_GetTime(class UwStateData* ws);
	bool CheckRequirement(class UwStateData* ws);
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UwAction_SwitchWeapon* Init(class AwWeapon* inWeapon);
};


// Class WGame.Goal_ExecPlan
// 0x0004 (0x008C - 0x0088)
class UGoal_ExecPlan : public UGoal
{
public:
	class UwActionContainer*                           Plan;                                                     // 0x0088(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_ExecPlan");
		return ptr;
	}


	struct FString ToString();
	bool SetFocusValue();
	void End();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	float GetProgress();
	void InitSubGoals();
	void Start();
	void ClearReferences();
	class UGoal_ExecPlan* Init(class AwAIBotBase* inOwner, class UwActionContainer* inPlan);
};


// Class WGame.Goal_Stay
// 0x0004 (0x008C - 0x0088)
class UGoal_Stay : public UGoal
{
public:
	float                                              StayLength;                                               // 0x0088(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Stay");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_Stay* Init(class AwAIBotBase* inOwner, float inStayLength);
};


// Class WGame.Goal_SwitchWeapon
// 0x0004 (0x008C - 0x0088)
class UGoal_SwitchWeapon : public UGoal
{
public:
	unsigned char                                      Group;                                                    // 0x0088(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0089(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_SwitchWeapon");
		return ptr;
	}


	struct FString ToString();
	bool SetFocusValue();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_SwitchWeapon* Init(class AwAIBotBase* inOwner, unsigned char InGroup);
};


// Class WGame.Goal_Reload
// 0x0008 (0x0090 - 0x0088)
class UGoal_Reload : public UGoal
{
public:
	class AwGun*                                       Gun;                                                      // 0x0088(0x0004)
	unsigned long                                      ReloadAttempted : 1;                                      // 0x008C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Reload");
		return ptr;
	}


	struct FString ToString();
	bool SetFocusValue();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void NotifyDestroyed(class AActor* A);
	void Start();
	void ClearReferences();
	class UGoal_Reload* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_ExecPartialPlan
// 0x0014 (0x009C - 0x0088)
class UGoal_ExecPartialPlan : public UGoal
{
public:
	class UwActionContainer*                           PartialPlan;                                              // 0x0088(0x0004)
	class UGoal*                                       GoalMain;                                                 // 0x008C(0x0004)
	class UGoal_ExecPartialPlan*                       GoalSub;                                                  // 0x0090(0x0004)
	int                                                GoalSubIndex;                                             // 0x0094(0x0004)
	float                                              Progress;                                                 // 0x0098(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_ExecPartialPlan");
		return ptr;
	}


	struct FString ToString();
	void DisplayDebug(class UCanvas* C, int Level, float* YL, float* YPos);
	bool SetFocus();
	void ClearSubgoals(bool free);
	void End();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	class UGoal_ExecPartialPlan* GetNextSubGoal();
	float GetProgress(float Min, float Size);
	void Start();
	void ClearReferences();
	class UGoal_ExecPartialPlan* Init(class AwAIBotBase* inOwner, class UwActionContainer* inPartialPlan);
};


// Class WGame.Goal_MoveToSeeTarget
// 0x0000 (0x0088 - 0x0088)
class UGoal_MoveToSeeTarget : public UGoal
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_MoveToSeeTarget");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_MoveToSeeTarget* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_PickTarget
// 0x0004 (0x008C - 0x0088)
class UGoal_PickTarget : public UGoal
{
public:
	class UMemoryItem*                                 mi;                                                       // 0x0088(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_PickTarget");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_PickTarget* Init(class AwAIBotBase* inOwner, class UMemoryItem* inMI);
};


// Class WGame.Goal_AimSpecificParts
// 0x0000 (0x0088 - 0x0088)
class UGoal_AimSpecificParts : public UGoal
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_AimSpecificParts");
		return ptr;
	}


	struct FString ToString();
	void End();
	bool SetFocusValue();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_AimSpecificParts* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_ThrowGrenadeRealTime
// 0x000C (0x0094 - 0x0088)
class UGoal_ThrowGrenadeRealTime : public UGoal
{
public:
	class ANavigationPoint*                            Target;                                                   // 0x0088(0x0004)
	class UGoal*                                       Goal1;                                                    // 0x008C(0x0004)
	class UGoal*                                       Goal2;                                                    // 0x0090(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_ThrowGrenadeRealTime");
		return ptr;
	}


	struct FString ToString();
	class ANavigationPoint* GetTarget();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_ThrowGrenadeRealTime* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_SwitchAndUse
// 0x0004 (0x008C - 0x0088)
class UGoal_SwitchAndUse : public UGoal
{
public:
	int                                                Group;                                                    // 0x0088(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_SwitchAndUse");
		return ptr;
	}


	struct FString ToString();
	void End();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_SwitchAndUse* Init(class AwAIBotBase* inOwner, int InGroup);
};


// Class WGame.Goal_LookAround
// 0x0018 (0x00A0 - 0x0088)
class UGoal_LookAround : public UGoal
{
public:
	float                                              LastFocusTime;                                            // 0x0088(0x0004)
	float                                              Duration;                                                 // 0x008C(0x0004)
	float                                              StartTime;                                                // 0x0090(0x0004)
	struct FVector                                     FocalPoint;                                               // 0x0094(0x000C)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_LookAround");
		return ptr;
	}


	struct FString ToString();
	void End();
	bool SetFocusValue();
	void NextFocusTarget();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_LookAround* Init(class AwAIBotBase* inOwner, float inDuration);
};


// Class WGame.Goal_MeleeNoTarget
// 0x0010 (0x0098 - 0x0088)
class UGoal_MeleeNoTarget : public UGoal
{
public:
	float                                              FireCheckInterval;                                        // 0x0088(0x0004)
	float                                              elapsed;                                                  // 0x008C(0x0004)
	float                                              FailTime;                                                 // 0x0090(0x0004)
	int                                                MeleeCount;                                               // 0x0094(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_MeleeNoTarget");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void NotifyDestroyed(class AActor* A);
	class UGoal_MeleeNoTarget* Init(class AwAIBotBase* inOwner, int inMeleeCount);
};


// Class WGame.Goal_MoveToEnemyInfluence
// 0x0000 (0x0088 - 0x0088)
class UGoal_MoveToEnemyInfluence : public UGoal
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_MoveToEnemyInfluence");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_MoveToEnemyInfluence* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_Fail
// 0x0000 (0x0088 - 0x0088)
class UGoal_Fail : public UGoal
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Fail");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_Fail* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_UseAirstrikeRealTime
// 0x000C (0x0094 - 0x0088)
class UGoal_UseAirstrikeRealTime : public UGoal
{
public:
	class ANavigationPoint*                            Target;                                                   // 0x0088(0x0004)
	class UGoal*                                       Goal1;                                                    // 0x008C(0x0004)
	class UGoal*                                       Goal2;                                                    // 0x0090(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_UseAirstrikeRealTime");
		return ptr;
	}


	struct FString ToString();
	class ANavigationPoint* GetTarget();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_UseAirstrikeRealTime* Init(class AwAIBotBase* inOwner);
};


// Class WGame.Goal_ApproachAndMelee
// 0x0004 (0x008C - 0x0088)
class UGoal_ApproachAndMelee : public UGoal
{
public:
	class APawn*                                       Target;                                                   // 0x0088(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_ApproachAndMelee");
		return ptr;
	}


	struct FString ToString();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_ApproachAndMelee* Init(class AwAIBotBase* inOwner, class APawn* inTarget);
};


// Class WGame.Goal_SwitchAndFire
// 0x0008 (0x0090 - 0x0088)
class UGoal_SwitchAndFire : public UGoal
{
public:
	int                                                Group;                                                    // 0x0088(0x0004)
	class AActor*                                      Target;                                                   // 0x008C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_SwitchAndFire");
		return ptr;
	}


	struct FString ToString();
	void End();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_SwitchAndFire* Init(class AwAIBotBase* inOwner, int InGroup, class AActor* inTarget);
};


// Class WGame.Goal_Throw
// 0x0024 (0x00AC - 0x0088)
class UGoal_Throw : public UGoal
{
public:
	class AActor*                                      Target;                                                   // 0x0088(0x0004)
	float                                              minDist;                                                  // 0x008C(0x0004)
	float                                              MaxDist;                                                  // 0x0090(0x0004)
	float                                              MinAngle;                                                 // 0x0094(0x0004)
	float                                              MaxAngle;                                                 // 0x0098(0x0004)
	class UGoal_Look*                                  GoalLook;                                                 // 0x009C(0x0004)
	struct FVector                                     ViewLocation;                                             // 0x00A0(0x000C)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Throw");
		return ptr;
	}


	struct FString ToString();
	void End();
	bool SetFocusValue();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	bool STATIC_GetViewLocation(const struct FVector& curLocation, const struct FVector& fallLocation, struct FVector* ViewLocation);
	bool STATIC_CanThrowTo(class ALevelInfo* Level, const struct FVector& From, const struct FVector& to, bool checkUp, bool checkDown, struct FVector* View);
	void SpawnTrail(const struct FVector& ViewLocation);
	void Start();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_Throw* Init(class AwAIBotBase* inOwner, class AActor* inTarget);
};


// Class WGame.Goal_SwitchAndThrow
// 0x0008 (0x0090 - 0x0088)
class UGoal_SwitchAndThrow : public UGoal
{
public:
	class AActor*                                      Target;                                                   // 0x0088(0x0004)
	int                                                Group;                                                    // 0x008C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_SwitchAndThrow");
		return ptr;
	}


	struct FString ToString();
	void End();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_SwitchAndThrow* Init(class AwAIBotBase* inOwner, class AActor* inTarget, int InGroup);
};


// Class WGame.Goal_Melee
// 0x0014 (0x009C - 0x0088)
class UGoal_Melee : public UGoal
{
public:
	class AActor*                                      Target;                                                   // 0x0088(0x0004)
	float                                              FireCheckInterval;                                        // 0x008C(0x0004)
	float                                              elapsed;                                                  // 0x0090(0x0004)
	unsigned long                                      DidMelee : 1;                                             // 0x0094(0x0004)
	float                                              FailTime;                                                 // 0x0098(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Melee");
		return ptr;
	}


	struct FString ToString();
	bool SetFocusValue();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_Melee* Init(class AwAIBotBase* inOwner, class AActor* inTarget);
};


// Class WGame.Goal_Look
// 0x0014 (0x009C - 0x0088)
class UGoal_Look : public UGoal
{
public:
	struct FVector                                     LookLocation;                                             // 0x0088(0x000C)
	unsigned char                                      old;                                                      // 0x0094(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0095(0x0003) MISSED OFFSET
	unsigned long                                      pitchSet : 1;                                             // 0x0098(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Look");
		return ptr;
	}


	struct FString ToString();
	void End();
	bool SetFocusValue();
	TEnumAsByte<EGoalStatus> ActualWork(float dt);
	void Start();
	class UGoal_Look* Init(class AwAIBotBase* inOwner, const struct FVector& inLookLocation);
};


// Class WGame.wEntryGameInfo
// 0x0004 (0x09BC - 0x09B8)
class AwEntryGameInfo : public AGameInfo
{
public:
	unsigned long                                      bLoadedGameTextures : 1;                                  // 0x09B8(0x0004)
	unsigned long                                      bLoadedGameStaticMeshes : 1;                              // 0x09B8(0x0004)
	unsigned long                                      bLoadedGameSkeletalMeshes : 1;                            // 0x09B8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wEntryGameInfo");
		return ptr;
	}


	void STATIC_PrecacheGameSkeletalMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameStaticMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameTextures(class ALevelInfo* myLevel);
	void PostLogin(class APlayerController* NewPlayer);
};


// Class WGame.wWeaponPickup_Location
// 0x000C (0x0484 - 0x0478)
class AwWeaponPickup_Location : public AwWeaponPickup
{
public:
	struct FName                                       ClassName;                                                // 0x0478(0x0004)
	int                                                RespawnLimit;                                             // 0x047C(0x0004) (Edit)
	int                                                RespawnCount;                                             // 0x0480(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wWeaponPickup_Location");
		return ptr;
	}


	void Reset();
	void PickWeapon(class AActor* Other);
	void PostNetBeginPlay();
	void PreBeginPlay();
};


// Class WGame.wWeaponPickup_RPG7
// 0x0000 (0x0484 - 0x0484)
class AwWeaponPickup_RPG7 : public AwWeaponPickup_Location
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wWeaponPickup_RPG7");
		return ptr;
	}


	void PreBeginPlay();
};


// Class WGame.wTeamGame
// 0x000C (0x15E8 - 0x15DC)
class AwTeamGame : public ATeamGame
{
public:
	struct FString                                     ResultMenuClass;                                          // 0x15DC(0x000C) (Edit, Config, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTeamGame");
		return ptr;
	}


	void RespawnPlayer(class AController* C, bool bClearSpecials);
	void PossessPawn(class AController* C, class APawn* P);
	bool SpawnAndPossessPawn(class AController* C, const struct FString& PawnClassName);
	class ANavigationPoint* FindPlayerStart(class AController* Player, unsigned char inTeam, const struct FString& incomingName);
	void GetGameSpecificPurposes(class AController* Owner, TArray<class UObject*>* purposes);
	void EndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason);
	void statai();
	void SetOldTeamInfo(class AGameReplicationInfo* OldGRI);
	int GetBootySeedValue();
	void StartMatch();
	void CalcResultPoints();
	void InitGame(const struct FString& Options, struct FString* Error);
	void PostLogin(class APlayerController* NewPlayer);
	void STATIC_PrecacheGameSkeletalMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameStaticMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameTextures(class ALevelInfo* myLevel);
};


// Class WGame.wWeaponPickup_M2B
// 0x0000 (0x0484 - 0x0484)
class AwWeaponPickup_M2B : public AwWeaponPickup_Location
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wWeaponPickup_M2B");
		return ptr;
	}


	void PreBeginPlay();
};


// Class WGame.wVehicle
// 0x0070 (0x1270 - 0x1200)
class AwVehicle : public AVehicle
{
public:
	struct FString                                     DefaultWeaponClassName;                                   // 0x1200(0x000C) (Edit, NeedCtorLink)
	struct FVector                                     VehicleProjSpawnOffset;                                   // 0x120C(0x000C) (Edit)
	class APawn*                                       DamLastInstigator;                                        // 0x1218(0x0004)
	float                                              DamLastDamageTime;                                        // 0x121C(0x0004)
	class UMaterial*                                   DefaultCrosshair;                                         // 0x1220(0x0004)
	class UMaterial*                                   CrosshairHitFeedbackTex;                                  // 0x1224(0x0004)
	float                                              CrosshairScale;                                           // 0x1228(0x0004)
	unsigned long                                      bCHZeroYOffset : 1;                                       // 0x122C(0x0004)
	unsigned long                                      bCustomHealthDisplay : 1;                                 // 0x122C(0x0004)
	float                                              LastCalcWeaponFire;                                       // 0x1230(0x0004)
	class AActor*                                      LastCalcHA;                                               // 0x1234(0x0004)
	struct FVector                                     LastCalcHL;                                               // 0x1238(0x000C)
	struct FVector                                     LastCalcHN;                                               // 0x1244(0x000C)
	class USound*                                      LockedOnSound;                                            // 0x1250(0x0004) (Edit)
	class AController*                                 DestroyPrevController;                                    // 0x1254(0x0004)
	class AEmitter*                                    ExplosionEffect;                                          // 0x1258(0x0004)
	class AEmitter*                                    DebugFX;                                                  // 0x125C(0x0004)
	struct FVector                                     BotError;                                                 // 0x1260(0x000C)
	class AActor*                                      OldTarget;                                                // 0x126C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wVehicle");
		return ptr;
	}


	void UpdatePrecacheMaterials();
	void STATIC_StaticPrecache(class ALevelInfo* L);
	class AActor* PerformTrace(const struct FVector& End, const struct FVector& Start, struct FVector* HitLocation, struct FVector* HitNormal);
	class AActor* CalcWeaponFire(struct FVector* HitLocation, struct FVector* HitNormal);
	struct FVector GetBotError(const struct FVector& StartLocation);
	struct FVector GetFireStart(float XOffset);
	struct FVector GetCrosshairWorldLocation();
	void NotifyEnemyLockedOn();
	void DrawCrosshairAlignment(class UCanvas* C, const struct FVector& ScreenPos);
	bool WeaponHitsCrosshairsHL();
	bool DrawCrosshair(class UCanvas* C, struct FVector* ScreenPos);
	void DrawHealthInfo(class UCanvas* C, class APlayerController* PC);
	void DrawWeaponInfo(class UCanvas* C, class AHUD* H);
	void DrawVehicleHUD(class UCanvas* C, class APlayerController* PC);
	void SpecialDrawCrosshair(class UCanvas* C);
	void DrawHUD(class UCanvas* C);
	struct FName GetWeaponBoneFor(class AInventory* i);
	void PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart);
	float CalcInertia(float DeltaTime, float FrictionFactor, float OldValue, float NewValue);
	void Explode(const struct FVector& HitLocation, const struct FVector& HitNormal);
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	bool StopWeaponFiring();
	void ClientKDriverLeave(class APlayerController* PC);
	void ClientKDriverEnter(class APlayerController* PC);
	bool KDriverLeave(bool bForceLeave);
	void UnPossessed();
	void PossessedBy(class AController* C);
	void AddDefaultInventory();
	void Destroyed();
	void PostBeginPlay();
	void Tick(float DeltaTime);
	void ClientDying(class UClass* DamageType, const struct FVector& HitLocation);
	void PlayHit(float Damage, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
};


// Class WGame.wTurret
// 0x010C (0x137C - 0x1270)
class AwTurret : public AwVehicle
{
public:
	class UClass*                                      TurretBaseClass;                                          // 0x1270(0x0004)
	class AwTurret_Base*                               TurretBase;                                               // 0x1274(0x0004)
	struct FRotator                                    OriginalRotation;                                         // 0x1278(0x000C) (Net)
	struct FVector                                     OriginalLocation;                                         // 0x1284(0x000C) (Net)
	struct FVector                                     OriginalDirection;                                        // 0x1290(0x000C) (Net)
	struct FRotator                                    EnterRotation;                                            // 0x129C(0x000C) (Net)
	float                                              TurretFOV;                                                // 0x12A8(0x0004)
	struct FVector                                     DriverEnteredLocation;                                    // 0x12AC(0x000C)
	class UClass*                                      TurretSwivelClass;                                        // 0x12B8(0x0004)
	class AwTurret_Base*                               TurretSwivel;                                             // 0x12BC(0x0004)
	float                                              YawAccel;                                                 // 0x12C0(0x0004)
	float                                              PitchAccel;                                               // 0x12C4(0x0004)
	float                                              RotationInertia;                                          // 0x12C8(0x0004) (Edit, Const)
	float                                              RotationSpeed;                                            // 0x12CC(0x0004) (Edit, Const)
	struct FVector                                     CamAbsLocation;                                           // 0x12D0(0x000C) (Edit)
	struct FVector                                     CamRelLocation;                                           // 0x12DC(0x000C) (Edit)
	struct FVector                                     CamDistance;                                              // 0x12E8(0x000C) (Edit)
	float                                              RotYawConstrant_Left;                                     // 0x12F4(0x0004) (Net)
	float                                              RotYawConstrant_Right;                                    // 0x12F8(0x0004) (Net)
	float                                              RotPitchConstant_Up;                                      // 0x12FC(0x0004) (Net)
	float                                              RotPitchConstant_Down;                                    // 0x1300(0x0004) (Net)
	float                                              RotSpeed_Yaw;                                             // 0x1304(0x0004) (Net)
	float                                              RotSpeed_Pitch;                                           // 0x1308(0x0004) (Net)
	struct FRotator                                    LastCamRot;                                               // 0x130C(0x000C)
	float                                              LastTimeSeconds;                                          // 0x1318(0x0004)
	float                                              CamRotationInertia;                                       // 0x131C(0x0004) (Edit)
	unsigned long                                      bZooming : 1;                                             // 0x1320(0x0004)
	float                                              DesiredPlayerFOV;                                         // 0x1324(0x0004) (Edit)
	float                                              MinPlayerFOV;                                             // 0x1328(0x0004) (Edit)
	float                                              OldFOV;                                                   // 0x132C(0x0004) (Edit)
	float                                              ZoomSpeed;                                                // 0x1330(0x0004) (Edit)
	float                                              ZoomWeaponOffsetAdjust;                                   // 0x1334(0x0004) (Edit)
	class UMaterial*                                   ZoomTick;                                                 // 0x1338(0x0004)
	class UMaterial*                                   ZoomTickTex;                                              // 0x133C(0x0004)
	class UTexture*                                    WeaponInfoTexture;                                        // 0x1340(0x0004)
	struct FName                                       ObjectiveTag[0x6];                                        // 0x1344(0x0004) (Edit)
	TArray<class ASVehicleTrigger*>                    EntryTriggers;                                            // 0x135C(0x000C) (NeedCtorLink)
	int                                                AnimRotBase;                                              // 0x1368(0x0004)
	struct FVector                                     vDriverAttachPos;                                         // 0x136C(0x000C)
	float                                              NotifyElapsed;                                            // 0x1378(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTurret");
		return ptr;
	}


	void MakeFireNoise();
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void InitBaseRotation();
	bool PlaceExitingDriver();
	bool PointOfView();
	void UpdatePrecacheMaterials();
	void STATIC_StaticPrecache(class ALevelInfo* L);
	bool KDriverLeave(bool bForceLeave);
	void KDriverEnter(class APawn* P);
	void ClientKDriverEnter(class APlayerController* PC);
	void AttachDriver(class APawn* P);
	void PostZoomAdjust(float ZoomPct);
	bool DrawCrosshair(class UCanvas* C, struct FVector* ScreenPos);
	class AActor* PerformTrace(const struct FVector& End, const struct FVector& Start, struct FVector* HitLocation, struct FVector* HitNormal);
	void DrawHealthInfo(class UCanvas* C, class APlayerController* PC);
	void Explode(const struct FVector& HitLocation, const struct FVector& HitNormal);
	void PlayFiring(float Rate, const struct FName& FiringMode);
	struct FRotator GetViewRotation();
	void SpecialCalcFirstPersonView(class APlayerController* PC, class AActor** ViewActor, struct FVector* CameraLocation, struct FRotator* CameraRotation);
	bool SpecialCalcView(class AActor** ViewActor, struct FVector* CameraLocation, struct FRotator* CameraRotation);
	void TestSetDriverFrame(float frame, float UpDownFrame);
	void Tick(float DeltaTime);
	void NotifyAllControllers(float dt);
	void UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange);
	void Destroyed();
	void SetRotateForPlayerView(const struct FRotator& PCRot);
	bool HasAmmo();
	void PostNetBeginPlay();
	void UnPossessed();
	void PossessedBy(class AController* C);
	void PostBeginPlay();
	void ServerSwitchTurret(bool bNextTurret);
	void NextWeapon();
	void PrevWeapon();
	float BotDesireability(class AActor* S, int TeamIndex, class AActor* Objective);
	bool StronglyRecommended(class AActor* S, int TeamIndex, class AActor* Objective);
	bool RecommendLongRangedAttack();
};


// Class WGame.wTurret_FNM240
// 0x000C (0x1388 - 0x137C)
class AwTurret_FNM240 : public AwTurret
{
public:
	struct FRotator                                    rOriginalRot;                                             // 0x137C(0x000C)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTurret_FNM240");
		return ptr;
	}


	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	struct FRotator GetViewRotation();
	void TZ(int iZ);
	void ty(int iY);
	void TX(int iX);
	void t(int iType);
	void UpdatePrecacheMaterials();
	void UpdatePrecacheStaticMeshes();
	void STATIC_StaticPrecache(class ALevelInfo* L);
	void SetExitViewRotation(class APawn* Driver);
	void MakeFireNoise();
	void ClientKDriverLeave(class APlayerController* PC);
	void ClientKDriverEnter(class APlayerController* PC);
	void PostBeginPlay();
};


// Class WGame.wAmmoSupplyObjective
// 0x0020 (0x06F0 - 0x06D0)
class AwAmmoSupplyObjective : public AGameObjective
{
public:
	int                                                MagazineSkillID;                                          // 0x06D0(0x0004) (Edit)
	TArray<int>                                        WeaponGroups;                                             // 0x06D4(0x000C) (Edit, NeedCtorLink)
	int                                                SupplyCount;                                              // 0x06E0(0x0004) (Edit)
	struct FString                                     ChargeSound;                                              // 0x06E4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAmmoSupplyObjective");
		return ptr;
	}


	bool ChargeAmmo(class AwPawn* P);
	void Touch(class AActor* Other);
	void PostBeginPlay();
};


// Class WGame.wAIDefencePawn
// 0x0020 (0x1870 - 0x1850)
class AwAIDefencePawn : public AwAIPawn
{
public:
	unsigned long                                      bReached : 1;                                             // 0x1850(0x0004)
	float                                              ReacheRadius;                                             // 0x1854(0x0004)
	class AwFlagObjectiveBase*                         AttackFlag;                                               // 0x1858(0x0004)
	class UClass*                                      SpawnEffectExplosion;                                     // 0x185C(0x0004)
	class UClass*                                      SpawnEffectAttack;                                        // 0x1860(0x0004)
	struct FName                                       AttackMotion;                                             // 0x1864(0x0004)
	int                                                MeshItemID;                                               // 0x1868(0x0004) (Net)
	int                                                iNpcID;                                                   // 0x186C(0x0004) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAIDefencePawn");
		return ptr;
	}


	void TakeFallingDamage();
	void SetCollisionSizeEx(float fRadius, float fHeight);
	void SetCollisionRadius();
	void AdjustCollisionSize();
	void EffectExplosion();
	void CheckDamageWithinRadius();
	void Tick(float dt);
	bool deleOnReachedDestination(const struct FVector& Dir, class AActor* GoalActor);
	bool CheckUpdateAnimation();
	void PlayLandedSound(int SurfType);
	void FootStepping(int side);
	int SpawnSupplyItem();
	void SpawnGibs(const struct FRotator& HitRotation, float ChunkPerterbation);
	void SpawnGoreGiblet(int iIndex);
	void PlayMelee(bool bMeleeKnifeOrButt);
	class UClass* GetBloodHitClass(bool bHeadShot);
	void AddDefaultSkills(bool bQuickslotChange);
	class AwWeapon* AddWeapon(const struct FBtrDouble& iUniqueID, int iWeaponID, int iAddPartsID, bool bPickupChange, int iPainting_Item_ID);
	void ChangedWeapon();
	void AddDefaultInventory(bool bQuickslotChange);
	void PlayDyingAnimation(class UClass* DamageType, const struct FVector& HitLoc);
	void Process_TossWeapon_When_Dying(class ALevelInfo* levenInfo, class APawn* Pawn, class AwWeapon* Weapon);
	void PostBeginPlay();
	void PostNetReceive();
	void Setup(const struct FPlayerRecord& Rec, bool bLoadNow);
	void InitDefencePawn(class ALevelInfo* Level, int Grade, int RegenLoc);
	class AwAIDefencePawn* STATIC_Create(class ALevelInfo* Level, const struct FVector& Location, const struct FRotator& Rotation);
	void PostNetBeginPlay();
	void SetBotMesh();
};


// Class WGame.wBTR_ArrangeTurret
// 0x0070 (0x0458 - 0x03E8)
class AwBTR_ArrangeTurret : public AwArrangeTurret
{
public:
	unsigned long                                      bEnabled : 1;                                             // 0x03E8(0x0004) (Edit)
	unsigned long                                      bVehicleTeamLock : 1;                                     // 0x03E8(0x0004) (Edit)
	unsigned long                                      bEnter_TeamUnlocks : 1;                                   // 0x03E8(0x0004) (Edit)
	unsigned long                                      bHUDTrackVehicle : 1;                                     // 0x03E8(0x0004) (Edit)
	unsigned long                                      bRespawnWhenDestroyed : 1;                                // 0x03E8(0x0004) (Edit)
	unsigned long                                      bSpawnProtected : 1;                                      // 0x03E8(0x0004) (Edit)
	unsigned long                                      bHighScoreKill : 1;                                       // 0x03E8(0x0004) (Edit)
	unsigned long                                      bKeyVehicle : 1;                                          // 0x03E8(0x0004) (Edit)
	unsigned long                                      bSpawnBuildEffect : 1;                                    // 0x03E8(0x0004) (Edit)
	unsigned long                                      BACKUP_bEnabled : 1;                                      // 0x03E8(0x0004)
	unsigned long                                      bSoundsPrecached : 1;                                     // 0x03E8(0x0004)
	unsigned long                                      bResetting : 1;                                           // 0x03E8(0x0004)
	unsigned char                                      VehicleTeam;                                              // 0x03EC(0x0001) (Edit)
	TEnumAsByte<EASVF_TriggeredFunction>               TriggeredFunction;                                        // 0x03ED(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x2];                                       // 0x03EE(0x0002) MISSED OFFSET
	struct FName                                       VehicleTag;                                               // 0x03F0(0x0004) (Edit)
	struct FName                                       VehicleEvent;                                             // 0x03F4(0x0004) (Edit)
	struct FName                                       VehiclePossessedEvent;                                    // 0x03F8(0x0004) (Edit)
	struct FString                                     VehicleClassStr;                                          // 0x03FC(0x000C) (Edit, NeedCtorLink)
	float                                              RespawnDelay;                                             // 0x0408(0x0004) (Edit)
	int                                                VehicleHealth;                                            // 0x040C(0x0004) (Edit)
	float                                              VehicleDriverDamageMult;                                  // 0x0410(0x0004) (Edit)
	float                                              VehicleDamageMomentumScale;                               // 0x0414(0x0004) (Edit)
	float                                              VehicleLinkHealMult;                                      // 0x0418(0x0004) (Edit)
	class USound*                                      Announcement_Destroyed;                                   // 0x041C(0x0004) (Edit)
	unsigned char                                      VehicleAmbientGlow;                                       // 0x0420(0x0001) (Edit)
	unsigned char                                      UnknownData01[0x3];                                       // 0x0421(0x0003) MISSED OFFSET
	float                                              AIVisibilityDist;                                         // 0x0424(0x0004) (Edit)
	class AVehicle*                                    Child;                                                    // 0x0428(0x0004)
	float                                              SpawnDelay;                                               // 0x042C(0x0004)
	int                                                MaxSpawnBlockCount;                                       // 0x0430(0x0004) (Edit)
	int                                                BlockCount;                                               // 0x0434(0x0004)
	class AEmitter*                                    BuildEffect;                                              // 0x0438(0x0004)
	class UClass*                                      BuildEffectClass;                                         // 0x043C(0x0004)
	float                                              RotYawConstrant_Left;                                     // 0x0440(0x0004) (Edit)
	float                                              RotYawConstrant_Right;                                    // 0x0444(0x0004) (Edit)
	float                                              RotPitchConstant_Up;                                      // 0x0448(0x0004) (Edit)
	float                                              RotPitchConstant_Down;                                    // 0x044C(0x0004) (Edit)
	float                                              RotSpeed_Yaw;                                             // 0x0450(0x0004) (Edit)
	float                                              RotSpeed_Pitch;                                           // 0x0454(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBTR_ArrangeTurret");
		return ptr;
	}


	void ForceSpawnVehicle();
	void ForceDestroyVehicle();
	void PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds);
	void VehicleDestroyed(class AVehicle* V);
	void VehiclePossessed(class AVehicle* V);
	void Timer();
	void Reset();
	unsigned char SetVehicleTeam();
	void VehicleSpawned();
	void SpawnBuildEffect();
	void SpawnVehicle(bool noCollisionFail);
	void Shutdown();
	void SetEnabled(bool bNewEnabled);
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	bool SelfTriggered();
	void UpdatePrecacheStaticMeshes();
	void UpdatePrecacheMaterials();
	void PostBeginPlay();
};


// Class WGame.wBTR_Turret_FNM240
// 0x0018 (0x0470 - 0x0458)
class AwBTR_Turret_FNM240 : public AwBTR_ArrangeTurret
{
public:
	struct FName                                       ObjectiveTag[0x6];                                        // 0x0458(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBTR_Turret_FNM240");
		return ptr;
	}


	void VehicleSpawned();
};


// Class WGame.wTurret_Base
// 0x0004 (0x03DC - 0x03D8)
class AwTurret_Base : public AActor
{
public:
	float                                              LastUpdateFreq;                                           // 0x03D8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTurret_Base");
		return ptr;
	}


	void UpdateOverlay();
	void Timer();
	void TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot);
	void UpdateSwivelRotation(const struct FRotator& TurretRotation);
	void UpdateBaseRotation(const struct FRotator& TurretRotation);
	void PostBeginPlay();
};


// Class WGame.wTurret_FNM240_Base
// 0x0000 (0x03DC - 0x03DC)
class AwTurret_FNM240_Base : public AwTurret_Base
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTurret_FNM240_Base");
		return ptr;
	}


	void UpdateBaseRotation(const struct FRotator& TurretRotation);
};


// Class WGame.wTurret_FNM240_Swivel
// 0x0000 (0x03DC - 0x03DC)
class AwTurret_FNM240_Swivel : public AwTurret_Base
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTurret_FNM240_Swivel");
		return ptr;
	}


	void UpdateSwivelRotation(const struct FRotator& TurretRotation);
};


// Class WGame.BulletSplash
// 0x0000 (0x0468 - 0x0468)
class ABulletSplash : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.BulletSplash");
		return ptr;
	}

};


// Class WGame.wAIDefenceBot
// 0x0004 (0x0798 - 0x0794)
class AwAIDefenceBot : public AwAIBot
{
public:
	float                                              fLastTimeMeleeAttack;                                     // 0x0794(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAIDefenceBot");
		return ptr;
	}


	int GetTeamNum();
	void Possess(class APawn* aPawn);
	void InitBot(int Grade);
	void TickStance(float DeltaTime);
	void TryProne();
	void TryCrouch();
	void SetupWeapons(class APawn* aPawn);
	void SetPawnClass(const struct FString& inClass, const struct FString& InCharacter);
	void NotifyAddDefaultInventory();
	void CallAirStrike(class AController* Caller);
	bool ReadyToMeleeAttack();
};


// Class WGame.wAIDefenceBot_Alpha
// 0x0000 (0x0798 - 0x0798)
class AwAIDefenceBot_Alpha : public AwAIDefenceBot
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAIDefenceBot_Alpha");
		return ptr;
	}


	void NotifyAddDefaultInventory();
};


// Class WGame.wAlienMaleSoundGroup
// 0x0018 (0x0080 - 0x0068)
class UwAlienMaleSoundGroup : public UwPawnSoundGroup
{
public:
	struct FString                                     SndAlienHitSound;                                         // 0x0068(0x000C) (NeedCtorLink)
	struct FString                                     SndAlienMoveHeartBreathSound;                             // 0x0074(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAlienMaleSoundGroup");
		return ptr;
	}

};


// Class WGame.PrecacheGameClient
// 0x0000 (0x002C - 0x002C)
class UPrecacheGameClient : public UPrecacheInterface
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.PrecacheGameClient");
		return ptr;
	}


	void STATIC_PrecacheGameSkeletalMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameStaticMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameTextures(class ALevelInfo* myLevel);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
