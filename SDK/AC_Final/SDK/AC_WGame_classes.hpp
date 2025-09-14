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

// Class WGame.wAILevel
// 0x0088 (0x0460 - 0x03D8)
class AwAILevel : public AwAILevelBase
{
public:
	class UwMatchMaker*                                MM;                                                       // 0x03D8(0x0004)
	class ANavigationPoint*[]                          FrontLineTeam0;                                           // 0x03DC(0x000C) (NeedCtorLink)
	class ANavigationPoint*[]                          FrontLineTeam1;                                           // 0x03E8(0x000C) (NeedCtorLink)
	int                                                Influence0Length;                                         // 0x03F4(0x0004)
	int                                                Influence1Length;                                         // 0x03F8(0x0004)
	int                                                InfluenceNLength;                                         // 0x03FC(0x0004)
	int                                                AllNavsLength;                                            // 0x0400(0x0004)
	class ANavigationPoint*[]                          Influence0;                                               // 0x0404(0x000C) (NeedCtorLink)
	class ANavigationPoint*[]                          Influence1;                                               // 0x0410(0x000C) (NeedCtorLink)
	class ANavigationPoint*[]                          InfluenceN;                                               // 0x041C(0x000C) (NeedCtorLink)
	class ANavigationPoint*[]                          AllNavs;                                                  // 0x0428(0x000C) (NeedCtorLink)
	int                                                NumTypeAR;                                                // 0x0434(0x0004)
	int                                                NumTypeSMG;                                               // 0x0438(0x0004)
	class AwAIBotBase*[]                               Bots;                                                     // 0x043C(0x000C) (NeedCtorLink)
	class UObjectPool*                                 PoolAction;                                               // 0x0448(0x0004)
	class UObjectPool*                                 PoolActionContainer;                                      // 0x044C(0x0004)
	class UObjectPool*                                 PoolActionLayer;                                          // 0x0450(0x0004)
	class UObjectPool*                                 PoolGoal;                                                 // 0x0454(0x0004)
	class UwPlanMaster*                                PlanMaster;                                               // 0x0458(0x0004)
	bool                                               bInitialized;                                             // 0x045C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAILevel");
		return ptr;
	}


	void ClearReferences();
	void BotsLovePeace();
	void ResetNames();
	class UwNPCItemGroupParam* GetItemParamByGroupID(int GroupID);
	string GetName(int NameGroupID);
	void KillBot(class AAIController* Bot);
	void KillBots(int Num);
	void KillBotsTeam(int Num, int inTeam);
	void RegisterBot(class AwAIBotBase* Bot);
	class UwNPCActions* GetNPCAction(int ActionGroupID);
	bool ActionExists(int ActionGroupID, const string& Action);
	class UwNPCParam* GetNPCParam(int Grade);
	class UwNPCParam* GetNPCParamByNPCID(int NPCID);
	void UpdateInfluenceListScript();
	void UpdateInfluenceList();
	void UpdateInfluenceListNative();
	void UpdateAllNavs();
	class ANavigationPoint* GetRandomDestFromInfluence(byte inTeam);
	class ANavigationPoint* GetRandomDestFromFrontLine(byte inTeam);
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
	class UwWeaponBaseParams*[]                        Weapons;                                                  // 0x004C(0x000C) (NeedCtorLink)
	int                                                SwitchWeaponCount;                                        // 0x0058(0x0004)
	bool                                               FreeHead;                                                 // 0x005C(0x0004)
	bool                                               FreeHands;                                                // 0x005C(0x0004)
	bool                                               FreeLegs;                                                 // 0x005C(0x0004)
	bool                                               CannotFindPath;                                           // 0x005C(0x0004)
	bool                                               IsFlashed;                                                // 0x005C(0x0004)
	bool                                               IsStopAction;                                             // 0x005C(0x0004)
	bool                                               IsStopTargeting;                                          // 0x005C(0x0004)
	bool                                               IsStopGotoFlag1;                                          // 0x005C(0x0004)
	bool                                               IsStopGotoFlag2;                                          // 0x005C(0x0004)
	bool                                               IsCrouch;                                                 // 0x005C(0x0004)
	bool                                               IsStand;                                                  // 0x005C(0x0004)
	bool                                               IsProne;                                                  // 0x005C(0x0004)
	int                                                Health;                                                   // 0x0060(0x0004)
	int                                                PropsectDealtDamage;                                      // 0x0064(0x0004)
	int                                                ProspectTakenDamage;                                      // 0x0068(0x0004)
	bool                                               HasSupplyHelicopter;                                      // 0x006C(0x0004)
	bool                                               HasSupplyUAV;                                             // 0x006C(0x0004)
	bool                                               HasSupplyAirstrike;                                       // 0x006C(0x0004)
	struct FVector                                     Location;                                                 // 0x0070(0x000C)
	class UMemoryItem*                                 Target;                                                   // 0x007C(0x0004)
	bool                                               TargetVisible;                                            // 0x0080(0x0004)
	bool                                               TargetReachable;                                          // 0x0080(0x0004)
	int                                                TargetChangeCount;                                        // 0x0084(0x0004)
	bool                                               CanMeleeTarget;                                           // 0x0088(0x0004)
	bool                                               bUseAiming;                                               // 0x0088(0x0004)
	bool                                               bAimingTarget;                                            // 0x0088(0x0004)
	float                                              MeetNewEnemyProbabilty;                                   // 0x008C(0x0004)
	float                                              Time;                                                     // 0x0090(0x0004)
	int                                                NumCapturedFlags;                                         // 0x0094(0x0004)
	class AwFlagObjectiveBase*                         FlagIamOn;                                                // 0x0098(0x0004)
	int                                                World_NumAllies;                                          // 0x009C(0x0004)
	int                                                World_NumEnemies;                                         // 0x00A0(0x0004)
	bool                                               World_IsSDRespawnTime;                                    // 0x00A4(0x0004)
	bool                                               World_TeamGame;                                           // 0x00A4(0x0004)
	bool                                               World_Helicopter;                                         // 0x00A4(0x0004)
	bool                                               World_Airstrike;                                          // 0x00A4(0x0004)
	bool                                               bFireNotInflueceAmmo;                                     // 0x00A4(0x0004)

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
	class UMemoryItem*[]                               Memories;                                                 // 0x0034(0x000C) (NeedCtorLink)
	int                                                NumVisibleMemories;                                       // 0x0040(0x0004)
	float                                              RetentionTIme;                                            // 0x0044(0x0004)
	float                                              ResponseTime;                                             // 0x0048(0x0004)
	float                                              MemoryItemUpdateInterval;                                 // 0x004C(0x0004)
	int                                                ResponseQueueHead;                                        // 0x0050(0x0004)
	float[]                                            ResponseQueueTime;                                        // 0x0054(0x000C) (NeedCtorLink)
	class APawn*[]                                     ResponseQueuePawn;                                        // 0x0060(0x000C) (NeedCtorLink)

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
	bool                                               IsVisible;                                                // 0x0050(0x0004)
	bool                                               IsVisibleOld;                                             // 0x0050(0x0004)
	bool                                               InSight;                                                  // 0x0050(0x0004)
	bool                                               InSightOld;                                               // 0x0050(0x0004)
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
// 0x0074 (0x0694 - 0x0620)
class AwAIBotBase : public AAIController
{
public:
	class UGoal*                                       Goal;                                                     // 0x0620(0x0004)
	class UwFutureState*                               FutureState;                                              // 0x0624(0x0004)
	class UShortMemory*                                Memory;                                                   // 0x0628(0x0004)
	class UTargetingSystem*                            TargetSystem;                                             // 0x062C(0x0004)
	class UwActionPlanner*                             Planner;                                                  // 0x0630(0x0004)
	class UwPlanMaster*                                PlanMaster;                                               // 0x0634(0x0004)
	class AwAILevel*                                   AILevel;                                                  // 0x0638(0x0004)
	class UwNPCActions*                                npcActions;                                               // 0x063C(0x0004)
	float                                              UpdateElapsed;                                            // 0x0640(0x0004)
	float                                              UpdateInterval;                                           // 0x0644(0x0004)
	bool                                               TrySprint;                                                // 0x0648(0x0004)
	float                                              DeadTime;                                                 // 0x064C(0x0004)
	float                                              LastRestartRequestTime;                                   // 0x0650(0x0004)
	bool                                               bDrawPath;                                                // 0x0654(0x0004)
	float[]                                            NavExtraCosts;                                            // 0x0658(0x000C) (NeedCtorLink)
	float[]                                            NavDetourExtraCosts;                                      // 0x0664(0x000C) (NeedCtorLink)
	float                                              NavExtraCostFactor_VisCount;                              // 0x0670(0x0004)
	float                                              NavExtraCostFactor_DetourScore;                           // 0x0674(0x0004)
	float                                              NavExtraCostFactor_DetourMaxDistFactor;                   // 0x0678(0x0004)
	class AwFlagObjectiveBase*                         LastTargetFlag;                                           // 0x067C(0x0004)
	FName                                              StateOnPossess;                                           // 0x0680(0x0004)
	struct FVector                                     UpVector;                                                 // 0x0684(0x000C)
	bool                                               IsStopAction;                                             // 0x0690(0x0004)
	bool                                               IsStopTargeting;                                          // 0x0690(0x0004)
	bool                                               IsStopGotoFlag1;                                          // 0x0690(0x0004)
	bool                                               IsStopGotoFlag2;                                          // 0x0690(0x0004)

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
	void SeeMonster(class APawn* SeenPlayer);
	void SeePlayer(class APawn* SeenPlayer);
	void NotifyVehicle(class AVehicle* V);
	void OnMemoryVisibleChanged();
	void HandleMessage(const string& Msg);
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
	void Cmd(const string& P1, const string& P2, const string& p3, const string& p4, const string& p5);
	float EvaluateState(class UwStateData* S);
	void SetupWStateNative(class UwStateData** S);
	void NotifyAddDefaultInventory();
	void NotifyAddInventory(class AInventory* NewItem);
	void SetupWeapons(class APawn* aPawn);
	void SetPawnClass(const string& inClass, const string& InCharacter);
	void SetName(class UwNPCParam* Param);
	void InitBot(int Grade);
	void ClearReferences();
	bool WeaponFireAgain(float RefireRate, bool bFinishedFire);
	bool ReadyToMeleeAttack();
};


// Class WGame.wUtil
// 0x0064 (0x0090 - 0x002C)
class UwUtil : public UObject
{
public:
	string                                             SectionName;                                              // 0x002C(0x000C) (Edit, Const, NeedCtorLink)
	string                                             FileExtension;                                            // 0x0038(0x000C) (Edit, Const, NeedCtorLink)
	class UCachePlayers*                               CachedPlayerList;                                         // 0x0044(0x0004) (Edit, Const, Transient)
	string                                             NoPreference;                                             // 0x0048(0x000C) (Localized, NeedCtorLink)
	string                                             FavoriteWeapon;                                           // 0x0054(0x000C) (Localized, NeedCtorLink)
	string                                             AgilityString;                                            // 0x0060(0x000C) (Localized, NeedCtorLink)
	string                                             TacticsString;                                            // 0x006C(0x000C) (Localized, NeedCtorLink)
	string                                             AccuracyString;                                           // 0x0078(0x000C) (Localized, NeedCtorLink)
	string                                             AggressivenessString;                                     // 0x0084(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wUtil");
		return ptr;
	}


	class UClass*[] STATIC_GetMutatorClasses(string[] MutClassNames);
	int STATIC_GetTeamInfoSalaryFor(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_GetTeamSalaryFor(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayTacticsRating(string[] Players);
	int STATIC_TeamInfoTacticsRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamTacticsRating(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayAgilityRating(string[] Players);
	int STATIC_TeamInfoAgilityRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamAgilityRating(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayAggressivenessRating(string[] Players);
	int STATIC_TeamInfoAggressivenessRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamAggressivenessRating(class UGameProfile* GP, int lineupsize);
	int STATIC_TeamArrayAccuracyRating(string[] Players);
	int STATIC_TeamInfoAccuracyRating(class AUnrealTeamInfo* UT, int lineupsize);
	int STATIC_TeamAccuracyRating(class UGameProfile* GP, int lineupsize);
	int STATIC_AggressivenessRating(const struct FPlayerRecord& PRE);
	int STATIC_TacticsRating(const struct FPlayerRecord& PRE);
	int STATIC_AgilityRating(const struct FPlayerRecord& PRE);
	int STATIC_AccuracyRating(const struct FPlayerRecord& PRE);
	int STATIC_RatingModifier(const string& CharacterName);
	string STATIC_GetFavoriteWeaponFor(const struct FPlayerRecord& PRE);
	int STATIC_GetSalaryFor(const struct FPlayerRecord& PRE);
	struct FPlayerRecord STATIC_FindPlayerRecord(const string& CharName);
	void STATIC_GetMutatorList(struct UwUtil_FMutatorRecord[] MutatorRecords);
	class UDecoText* STATIC_LoadDecoText(const string& PackageName, const string& DecoTextName, int ColumnCount);
	struct FPlayerRecord STATIC_FindUPLPlayerRecord(const string& CharName);
	struct FPlayerRecord STATIC_GetPlayerRecord(int Index);
	void STATIC_GetPlayerList(struct FPlayerRecord[]* PlayerRecords);
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
	string                                             MaleVoice;                                                // 0x002C(0x000C) (NeedCtorLink)
	string                                             FemaleVoice;                                              // 0x0038(0x000C) (NeedCtorLink)
	string                                             GibGroup;                                                 // 0x0044(0x000C) (NeedCtorLink)
	string                                             MaleRagSkelName;                                          // 0x0050(0x000C) (NeedCtorLink)
	string                                             FemaleRagSkelName;                                        // 0x005C(0x000C) (NeedCtorLink)
	string                                             FemaleSkeleton;                                           // 0x0068(0x000C) (NeedCtorLink)
	string                                             MaleSkeleton;                                             // 0x0074(0x000C) (NeedCtorLink)
	string                                             MaleSoundGroup;                                           // 0x0080(0x000C) (NeedCtorLink)
	string                                             FemaleSoundGroup;                                         // 0x008C(0x000C) (NeedCtorLink)
	string                                             PawnClassName;                                            // 0x0098(0x000C) (NeedCtorLink)
	string                                             SpeciesName;                                              // 0x00A4(0x000C) (Localized, NeedCtorLink)
	int                                                RaceNum;                                                  // 0x00B0(0x0004)
	int                                                DMTeam;                                                   // 0x00B4(0x0004)
	FName                                              TauntAnims[0x10];                                         // 0x00B8(0x0004)
	string                                             TauntAnimNames[0x10];                                     // 0x00F8(0x000C) (Localized, NeedCtorLink)
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


	int STATIC_GetOffsetForSequence(const FName& Sequence);
	bool STATIC_Setup(class AwPawn* P, const struct FPlayerRecord& Rec);
	void STATIC_SetTeamSkin(class AwPawn* P, const struct FPlayerRecord& Rec, int TeamNum);
	string STATIC_GetRagSkelName(const string& MeshName);
	void STATIC_ModifyPawn(class APawn* P);
	int STATIC_ModifyImpartedDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType);
	int STATIC_ModifyReceivedDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType);
	void STATIC_LoadResources(const struct FPlayerRecord& Rec, class ALevelInfo* Level, class APlayerReplicationInfo* PRI, int TeamNum);
	string STATIC_GetVoiceType(bool bIsFemale, class ALevelInfo* Level);
};


// Class WGame.AimedAttachment
// 0x001C (0x03F4 - 0x03D8)
class AAimedAttachment : public AActor
{
public:
	byte                                               Padding00[0x1C];                                          // 0x03D8(0x001C) MISSED OFFSET

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
	struct FPlayerRecord[]                             Records;                                                  // 0x0090(0x000C) (NeedCtorLink)

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
	string                                             TextName;                                                 // 0x002C(0x000C) (Edit, NeedCtorLink)
	string[]                                           Rows;                                                     // 0x0038(0x000C) (Edit, NeedCtorLink)

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
// 0x0678 (0x18CC - 0x1254)
class AwPawn : public AUnrealPawn
{
public:
	int                                                RepeaterDeathCount;                                       // 0x1254(0x0004)
	class ACombo*                                      CurrentCombo;                                             // 0x1258(0x0004)
	bool                                               bSpawnDone;                                               // 0x125C(0x0004)
	bool                                               bFrozenBody;                                              // 0x125C(0x0004)
	bool                                               bFlaming;                                                 // 0x125C(0x0004)
	bool                                               bRubbery;                                                 // 0x125C(0x0004)
	bool                                               bClearWeaponOffsets;                                      // 0x125C(0x0004)
	bool                                               bBerserk;                                                 // 0x125C(0x0004)
	bool                                               bInvis;                                                   // 0x125C(0x0004)
	bool                                               bOldInvis;                                                // 0x125C(0x0004)
	bool                                               bGibbed;                                                  // 0x125C(0x0004)
	bool                                               bCanDodgeDoubleJump;                                      // 0x125C(0x0004)
	bool                                               bCanBoostDodge;                                           // 0x125C(0x0004)
	bool                                               bAlreadySetup;                                            // 0x125C(0x0004)
	bool                                               bSpawnIn;                                                 // 0x125C(0x0004)
	float                                              ShieldStrengthMax;                                        // 0x1260(0x0004) (Edit)
	float                                              SmallShieldStrength;                                      // 0x1264(0x0004)
	class UClass*                                      Species;                                                  // 0x1268(0x0004)
	float                                              GruntVolume;                                              // 0x126C(0x0004) (Edit)
	float                                              FootstepVolume;                                           // 0x1270(0x0004) (Edit)
	int                                                SimHitFxTicker;                                           // 0x1274(0x0004) (Transient)
	class UClass*                                      GibGroupClass;                                            // 0x1278(0x0004) (Edit)
	int                                                GibCountCalf;                                             // 0x127C(0x0004) (Edit)
	int                                                GibCountForearm;                                          // 0x1280(0x0004) (Edit)
	int                                                GibCountHead;                                             // 0x1284(0x0004) (Edit)
	int                                                GibCountTorso;                                            // 0x1288(0x0004) (Edit)
	int                                                GibCountUpperArm;                                         // 0x128C(0x0004) (Edit)
	float                                              MinTimeBetweenPainSounds;                                 // 0x1290(0x0004)
	string                                             HeadShotMessage;                                          // 0x1294(0x000C) (Localized, NeedCtorLink)
	string                                             SoundFootsteps[0x1E];                                     // 0x12A0(0x000C) (NeedCtorLink)
	string                                             SoundFootsteps_3rd[0x1E];                                 // 0x1408(0x000C) (NeedCtorLink)
	class UClass*                                      SoundGroupClass;                                          // 0x1570(0x0004) (Edit)
	string                                             sndScream;                                                // 0x1574(0x000C) (NeedCtorLink)
	string                                             sndDie;                                                   // 0x1580(0x000C) (NeedCtorLink)
	class AwWeaponAttachment*                          WeaponAttachment;                                         // 0x158C(0x0004)
	class AwFPWeaponAttachment*                        FPWeaponAttachment;                                       // 0x1590(0x0004)
	class AShadowProjector*                            PlayerShadow;                                             // 0x1594(0x0004)
	class AEffect_ShadowController*                    RealtimeShadow;                                           // 0x1598(0x0004)
	bool                                               bRealtimeShadows;                                         // 0x159C(0x0004)
	int                                                iShadowType;                                              // 0x15A0(0x0004)
	int                                                MultiJumpRemaining;                                       // 0x15A4(0x0004)
	int                                                MaxMultiJump;                                             // 0x15A8(0x0004)
	int                                                MultiJumpBoost;                                           // 0x15AC(0x0004)
	FName                                              WallDodgeAnims[0x4];                                      // 0x15B0(0x0004)
	FName                                              IdleHeavyAnim;                                            // 0x15C0(0x0004)
	FName                                              FireHeavyRapidAnim;                                       // 0x15C4(0x0004)
	FName                                              FireHeavyBurstAnim;                                       // 0x15C8(0x0004)
	FName                                              FireRootBone;                                             // 0x15CC(0x0004)
	FName                                              Pistol_FireRifleRapidAnim;                                // 0x15D0(0x0004)
	FName                                              TelegraphPack_PutdownAnim;                                // 0x15D4(0x0004)
	FName                                              TelegraphPack_SelectAnim;                                 // 0x15D8(0x0004)
	FName                                              Pistol_FireAimCrouchRifleRapidAnim;                       // 0x15DC(0x0004)
	EFireAnimState                                     FireState;                                                // 0x15E0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x15E1(0x0003) MISSED OFFSET
	class UMesh*                                       SkeletonMesh;                                             // 0x15E4(0x0004)
	bool                                               bSkeletized;                                              // 0x15E8(0x0004)
	bool                                               bDeRes;                                                   // 0x15E8(0x0004)
	float                                              DeResTime;                                                // 0x15EC(0x0004)
	class AEmitter*                                    DeResFX;                                                  // 0x15F0(0x0004)
	struct FInterpCurve                                DeResLiftVel;                                             // 0x15F4(0x000C) (Edit, NeedCtorLink)
	struct FInterpCurve                                DeResLiftSoftness;                                        // 0x1600(0x000C) (Edit, NeedCtorLink)
	float                                              DeResGravScale;                                           // 0x160C(0x0004) (Edit)
	float                                              DeResLateralFriction;                                     // 0x1610(0x0004) (Edit)
	float                                              RagdollLifeSpan;                                          // 0x1614(0x0004) (Edit)
	float                                              RagInvInertia;                                            // 0x1618(0x0004) (Edit)
	float                                              RagDeathVel;                                              // 0x161C(0x0004) (Edit)
	float                                              RagShootStrength;                                         // 0x1620(0x0004) (Edit)
	float                                              RagSpinScale;                                             // 0x1624(0x0004) (Edit)
	float                                              RagDeathUpKick;                                           // 0x1628(0x0004) (Edit)
	float                                              RagGravScale;                                             // 0x162C(0x0004) (Edit)
	class UMaterial*                                   RagConvulseMaterial;                                      // 0x1630(0x0004) (Edit)
	class USound*[]                                    RagImpactSounds;                                          // 0x1634(0x000C) (Edit, NeedCtorLink)
	float                                              RagImpactSoundInterval;                                   // 0x1640(0x0004) (Edit)
	float                                              RagImpactVolume;                                          // 0x1644(0x0004) (Edit)
	float                                              RagLastSoundTime;                                         // 0x1648(0x0004) (Transient)
	string                                             RagdollOverride;                                          // 0x164C(0x000C) (NeedCtorLink)
	class AController*                                 OldController;                                            // 0x1658(0x0004)
	class UMaterial*                                   RealSkins[0x4];                                           // 0x165C(0x0004)
	string                                             PlacedCharacterName;                                      // 0x166C(0x000C) (Edit, NeedCtorLink)
	string                                             PlacedFemaleCharacterName;                                // 0x1678(0x000C) (NeedCtorLink)
	byte                                               TeamSkin;                                                 // 0x1684(0x0001)
	byte                                               Padding01[0x3];                                           // 0x1685(0x0003) MISSED OFFSET
	class AwSkinShell*                                 wParts[0x4];                                              // 0x1688(0x0004)
	int                                                MyCamouFlageID;                                           // 0x1698(0x0004)
	int                                                MyTeamIdx;                                                // 0x169C(0x0004)
	class AwSkinShell*                                 wGoreParts[0x5];                                          // 0x16A0(0x0004)
	int                                                iDiedCollisionPart;                                       // 0x16B4(0x0004)
	int                                                iBackupTeamNum;                                           // 0x16B8(0x0004)
	int                                                iWarpCount;                                               // 0x16BC(0x0004)
	string                                             strGoreMeshName;                                          // 0x16C0(0x000C) (NeedCtorLink)
	string                                             strGoreStaticMeshName;                                    // 0x16CC(0x000C) (NeedCtorLink)
	int                                                AddedSkillList[0x16];                                     // 0x16D8(0x0004)
	int                                                iStartQSlotIndex;                                         // 0x1730(0x0004)
	bool                                               bBurning;                                                 // 0x1734(0x0004)
	float                                              fLastBurningTime;                                         // 0x1738(0x0004)
	class AwProjectile*                                BurningProj;                                              // 0x173C(0x0004)
	bool                                               bProximityFuze;                                           // 0x1740(0x0004)
	float                                              fProximityFuzeTime;                                       // 0x1744(0x0004)
	class AwPawn*                                      ProximityBot;                                             // 0x1748(0x0004)
	class AEmitter*                                    allyEffect;                                               // 0x174C(0x0004)
	FName                                              Hit_Stun;                                                 // 0x1750(0x0004)
	FName                                              Hit_Stun_Cr;                                              // 0x1754(0x0004)
	FName                                              Hit_Stun_Pr;                                              // 0x1758(0x0004)
	FName                                              Hit_PS[0x4];                                              // 0x175C(0x0004)
	FName                                              Hit_PS_Head;                                              // 0x176C(0x0004)
	FName                                              Hit_PS_Cr[0x4];                                           // 0x1770(0x0004)
	FName                                              Hit_PS_Pr;                                                // 0x1780(0x0004)
	FName                                              Hit_PS_Stun;                                              // 0x1784(0x0004)
	FName                                              Hit_PS_Stun_Cr;                                           // 0x1788(0x0004)
	FName                                              Hit_PS_Stun_Pr;                                           // 0x178C(0x0004)
	FName                                              Hit_FR[0x4];                                              // 0x1790(0x0004)
	FName                                              Hit_FR_Head;                                              // 0x17A0(0x0004)
	FName                                              Hit_FR_Cr[0x4];                                           // 0x17A4(0x0004)
	FName                                              Hit_FR_Pr;                                                // 0x17B4(0x0004)
	FName                                              Hit_FR_Stun;                                              // 0x17B8(0x0004)
	FName                                              Hit_FR_Stun_Cr;                                           // 0x17BC(0x0004)
	FName                                              Hit_FR_Stun_Pr;                                           // 0x17C0(0x0004)
	FName                                              Hit_RPG[0x4];                                             // 0x17C4(0x0004)
	FName                                              Hit_RPG_Head;                                             // 0x17D4(0x0004)
	FName                                              Hit_RPG_Cr[0x4];                                          // 0x17D8(0x0004)
	FName                                              Hit_RPG_Pr;                                               // 0x17E8(0x0004)
	FName                                              Hit_RPG_Stun;                                             // 0x17EC(0x0004)
	FName                                              Hit_RPG_Stun_Cr;                                          // 0x17F0(0x0004)
	FName                                              Hit_RPG_Stun_Pr;                                          // 0x17F4(0x0004)
	FName                                              Meele_Rifle_Fail;                                         // 0x17F8(0x0004)
	FName                                              Meele_Rifle_Cr_Fail;                                      // 0x17FC(0x0004)
	FName                                              Meele_Rifle_Pr_Fail;                                      // 0x1800(0x0004)
	FName                                              Meele_Knife_Fail;                                         // 0x1804(0x0004)
	FName                                              Meele_Knife_Cr_Fail;                                      // 0x1808(0x0004)
	FName                                              Meele_Knife_Pr_Fail;                                      // 0x180C(0x0004)
	FName                                              Knife_Fire;                                               // 0x1810(0x0004)
	FName                                              Knife_Fire_Cr;                                            // 0x1814(0x0004)
	FName                                              Knife_Fire_Pr;                                            // 0x1818(0x0004)
	FName                                              Rifle_Crouch_BoltLeverAnim;                               // 0x181C(0x0004)
	FName                                              Reload_Rifle_2nd_Anim;                                    // 0x1820(0x0004)
	FName                                              Reload_Crouch_Rifle_Anim;                                 // 0x1824(0x0004)
	FName                                              Reload_Crouch_Rifle_2nd_Anim;                             // 0x1828(0x0004)
	FName                                              Reload_Prone_Rifle_2nd_Anim;                              // 0x182C(0x0004)
	FName                                              Pistol_Reload_Rifle_2nd_Anim;                             // 0x1830(0x0004)
	FName                                              Pistol_CrouchReload;                                      // 0x1834(0x0004)
	FName                                              Pistol_CrouchReload_2nd;                                  // 0x1838(0x0004)
	FName                                              Pistol_ProneReload_2nd;                                   // 0x183C(0x0004)
	FName                                              Rpg_Reload_2nd_Anim;                                      // 0x1840(0x0004)
	FName                                              Rpg_CrouchReload;                                         // 0x1844(0x0004)
	FName                                              Rpg_CrouchReload_2nd;                                     // 0x1848(0x0004)
	FName                                              Rpg_ProneReload_2nd;                                      // 0x184C(0x0004)
	FName                                              Putdown_Crouch_Rifle_Anim;                                // 0x1850(0x0004)
	FName                                              PutdownQuick_Crouch_Rifle_Anim;                           // 0x1854(0x0004)
	FName                                              Pistol_CrouchPutdown;                                     // 0x1858(0x0004)
	FName                                              Pistol_CrouchPutdownQuick;                                // 0x185C(0x0004)
	FName                                              Frag_CrouchPutdown;                                       // 0x1860(0x0004)
	FName                                              Frag_CrouchPutdownQuick;                                  // 0x1864(0x0004)
	FName                                              Rpg_CrouchPutdown;                                        // 0x1868(0x0004)
	FName                                              Rpg_CrouchPutdownQuick;                                   // 0x186C(0x0004)
	FName                                              Select_Crouch_Rifle_Anim;                                 // 0x1870(0x0004)
	FName                                              SelectNew_Crouch_Rifle_Anim;                              // 0x1874(0x0004)
	FName                                              Pistol_CrouchSelect;                                      // 0x1878(0x0004)
	FName                                              Frag_CrouchSelect;                                        // 0x187C(0x0004)
	FName                                              Rpg_CrouchSelect;                                         // 0x1880(0x0004)
	bool                                               bEndProned;                                               // 0x1884(0x0004)
	bool                                               bEndCrouched;                                             // 0x1884(0x0004)
	int[]                                              wRequiredEquipment;                                       // 0x1888(0x000C) (Edit, NeedCtorLink)
	int[]                                              wRequiredParts;                                           // 0x1894(0x000C) (NeedCtorLink)
	bool                                               bAimed;                                                   // 0x18A0(0x0004)
	bool                                               bIsMeleeAttacking;                                        // 0x18A0(0x0004)
	struct FVector                                     GrenadeFireLocation;                                      // 0x18A4(0x000C)
	struct FRotator                                    GrenadeFireRotation;                                      // 0x18B0(0x000C)
	struct FVector                                     GrenadeExplodeLocation;                                   // 0x18BC(0x000C)
	class UClass*                                      FPWeaponAttachmentClass;                                  // 0x18C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPawn");
		return ptr;
	}


	void SpawnDSentry();
	void SpawnSentry(const string& strCheatTeamID);
	void SkillInit(bool bQuickslotChange);
	void ClientSkillDeadPlayer();
	void AddAllyEffect(int iSideIndex);
	void reset_weapon();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void SetBurning(bool bBurn, class AwProjectile* proj);
	void GetWeaponAttachmentInfo(byte* byFlashCount, byte* byFiringMode);
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
	void ServerCallNoWeaponMessage(byte bySlot);
	void AddNoWeaponChangeMessage(byte bySlot);
	void HandlePickup(class APickup* pick);
	void PlayReload();
	void PlayRechamber();
	void PlayMelee(bool bMeleeKnifeOrButt);
	void PostRender2D(class UCanvas* C, float ScreenLocX, float ScreenLocY);
	int SpawnSupplyItem();
	int SpawnBlackbox();
	void SpawnMedals();
	void ClientSwitchToLastWeapon(byte defuseSwitch);
	void ServerQSlotChangeCheck();
	void ClientQSlotChangeCheck();
	void AddBaseInvenWeapon(class UwMatchUserInfo* kUser, int iPos);
	void SetSelectedQuickSlotInventory(class UwMatchUserInfo* kUser, bool bQuickslotChange);
	void AddWeaponByWeaponLimited(int iWeaponID, int iPartsID, const struct FBtrDouble& UniqueID);
	void SetInfiniteAmmoTutorial(bool bDeleteGranade, int iGranadeCount);
	void SetInfiniteAmmo(int ammoCount);
	bool CheckWeaponBySubGameMode(class UwMatchUserInfo* kUser);
	void AddDefaultInventoryDOA(bool bQuickslotChange);
	void SetGrenadlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetFlameThrowerlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetMGlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetShotGunlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void SetPistolInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick);
	void AddDefaultInventory(bool bQuickslotChange);
	void RemoveInventoryByDamageType(EeWeaponType removeWeaponType);
	void RemoveAllInventory();
	void ChangeInventoryByQSlot();
	int GetSlotPosbySkillID(class UwMatchUserInfo* kUser, int iSkillID);
	void AddBaseInvenSkill(class UwMatchUserInfo* kUser, int iPos);
	void SetSelectedQuickSlotSkills(class UwMatchUserInfo* kUser);
	void AddWeaponFromSkill(const struct FBtrDouble& iUniqueID, int iaWeaponID);
	void AddSkillByInventory(class UwMatchUserInfo* kUser);
	void AddDefaultSkills(bool bQuickslotChange);
	EGibType GetGibParts(int iCollisionPart);
	void SpawnGoreGiblet(int iIndex);
	void MakeGorePawn(int iPart);
	void EndCrouch(float HeightAdjust);
	void EndProne(float HeightAdjust);
	void SetParts(EePlayerParts iPartsIndex, class UMesh* resMesh, class UStaticMesh* resStaticMesh);
	class UMaterial* GetCamouflage(int iItemID, byte byTeam);
	void SetCamouflage(int iItemID, byte byTeam);
	void ResetAllParts();
	void Died(class AController* Killer, class UClass* DamageType, const struct FVector& HitLocation, int CollisionPart, int WeaponType, bool bWallShot);
	void DoDerezEffect();
	class UClass* GetGibClass(EGibType gibType);
	string GetSound(ESoundType soundType);
	void ClientResetPhysicsBasedAnim();
	void ResetPhysicsBasedAnim();
	void Setup(const struct FPlayerRecord& Rec, bool bLoadNow);
	string GetDefaultCharacter();
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
	bool PerformDodge(EDoubleClickDir DoubleClickMove, const struct FVector& Dir, const struct FVector& Cross);
	bool Dodge(EDoubleClickDir DoubleClickMove);
	struct FVector BotDodge(const struct FVector& Dir);
	void SetInvisibility(float Time);
	void ServerChangedWeapon(class AwWeapon* OldWeapon, class AwWeapon* newWeapon);
	void ChangedWeapon();
	void SetWeaponOverlay(class UMaterial* mat, float Time, bool override);
	void DisableUDamage();
	void EnableUDamage(float Amount);
	bool HasUDamage();
	void DoCombo(class UClass* ComboClass);
	void DoComboName(const string& ComboClassName);
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
	void SetAnimAction(const FName& NewAction, bool bNoBlendAnim);
	bool FindValidTaunt(FName* Sequence);
	void PlayDoubleJump();
	FName GetAnimSequence();
	void Landed(const struct FVector& HitNormal);
	void PlayLandedSound(int SurfType);
	FName GetOffhandBoneFor(class AInventory* i);
	FName GetWeaponBoneFor(class AInventory* i);
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
	void DoDamageFX(const FName& BoneName, int Damage, class UClass* DamageType, const struct FRotator& R, const struct FVector& HitLoc, int CollisionPart);
	void CalcHitLoc(const struct FVector& HitLoc, const struct FVector& hitRay, FName* BoneName, float* dist);
	void HideBone(const FName& BoneName);
	class UClass* GetBloodHitClass(ECollisionPartsType collisionParts);
	void ProcessHitFX();
	void SpawnGiblet(class UClass* GibClass, const struct FVector& Location, const struct FRotator& Rotation, float GibPerterbation, const struct FVector& GibVelocity);
	void SetHeadScale(float NewScale);
	void AttachEffect(class UClass* EmitterClass, const FName& BoneName, const struct FVector& Location, const struct FRotator& Rotation);
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
// 0x0064 (0x1930 - 0x18CC)
class AwMonster : public AwPawn
{
public:
	bool                                               bMeleeFighter;                                            // 0x18CC(0x0004)
	bool                                               bShotAnim;                                                // 0x18CC(0x0004)
	bool                                               bCanDodge;                                                // 0x18CC(0x0004)
	bool                                               bVictoryNext;                                             // 0x18CC(0x0004)
	bool                                               bTryToWalk;                                               // 0x18CC(0x0004)
	bool                                               bBoss;                                                    // 0x18CC(0x0004)
	bool                                               bAlwaysStrafe;                                            // 0x18CC(0x0004)
	float                                              DodgeSkillAdjust;                                         // 0x18D0(0x0004)
	class USound*                                      HitSound[0x4];                                            // 0x18D4(0x0004)
	class USound*                                      DeathSound[0x4];                                          // 0x18E4(0x0004)
	class USound*                                      ChallengeSound[0x4];                                      // 0x18F4(0x0004)
	class USound*                                      FireSound;                                                // 0x1904(0x0004)
	class UClass*                                      AmmunitionClass;                                          // 0x1908(0x0004)
	class AwAmmunition*                                MyAmmo;                                                   // 0x190C(0x0004)
	int                                                ScoringValue;                                             // 0x1910(0x0004)
	struct FFireProperties                             SavedFireProperties;                                      // 0x1914(0x0014)
	int                                                MeshItemID;                                               // 0x1928(0x0004) (Net)
	int                                                iNpcID;                                                   // 0x192C(0x0004) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wMonster");
		return ptr;
	}


	void StartDeRes();
	void ProcessHitFX();
	void CreateGib(const FName& BoneName, class UClass* DamageType, const struct FRotator& R);
	void SetAnimAction(const FName& NewAction, bool bNoBlendAnim);
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
// 0x00B4 (0x19E4 - 0x1930)
class AwDefenceBoss : public AwMonster
{
public:
	bool                                               bStinging;                                                // 0x1930(0x0004)
	struct FFireProperties                             SavedFireProperties_2;                                    // 0x1934(0x0014)
	class UClass*                                      AmmunitionClass_2;                                        // 0x1948(0x0004)
	class AwAmmunition*                                MyAmmo_2;                                                 // 0x194C(0x0004)
	struct FFireProperties                             SavedFireProperties_3;                                    // 0x1950(0x0014)
	class UClass*                                      AmmunitionClass_3;                                        // 0x1964(0x0004)
	class AwAmmunition*                                MyAmmo_3;                                                 // 0x1968(0x0004)
	int                                                iRocketFireCount;                                         // 0x196C(0x0004) (Edit, Config)
	float                                              fRocketFireTime;                                          // 0x1970(0x0004)
	float                                              fBeamFireTime;                                            // 0x1974(0x0004)
	float                                              fRocketFireDelay;                                         // 0x1978(0x0004) (Edit, Config)
	float                                              fBeamFireDelay;                                           // 0x197C(0x0004) (Edit, Config)
	int                                                iMeleeDamage;                                             // 0x1980(0x0004) (Edit, Config)
	int                                                iLastMeleeDamage;                                         // 0x1984(0x0004) (Edit, Config)
	float                                              fLastChargingSpeed;                                       // 0x1988(0x0004) (Edit, Config)
	float                                              fTryChargingDist;                                         // 0x198C(0x0004)
	float                                              fChangeAttackTypeTime;                                    // 0x1990(0x0004)
	bool                                               bReadySeekingRocket;                                      // 0x1994(0x0004)
	float                                              fPrevHPPercent;                                           // 0x1998(0x0004)
	float                                              fNextActivePercent;                                       // 0x199C(0x0004)
	class UClass*                                      SpawnEffectExplosion;                                     // 0x19A0(0x0004)
	class AEmitter*                                    PrepareBeamEffect;                                        // 0x19A4(0x0004)
	class AEmitter*                                    LastChagingEffect;                                        // 0x19A8(0x0004)
	class AEmitter*                                    RocketFireEffect;                                         // 0x19AC(0x0004)
	bool                                               bFinalAttackMode;                                         // 0x19B0(0x0004) (Net)
	string                                             SoundBeamAction;                                          // 0x19B4(0x000C) (NeedCtorLink)
	string                                             SoundRocketAction;                                        // 0x19C0(0x000C) (NeedCtorLink)
	string                                             SoundMeleeAction;                                         // 0x19CC(0x000C) (NeedCtorLink)
	FName                                              BeamAnim;                                                 // 0x19D8(0x0004)
	FName                                              RocketAnim;                                               // 0x19DC(0x0004)
	FName                                              MeleeAnim;                                                // 0x19E0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDefenceBoss");
		return ptr;
	}


	void Process_TossWeapon_When_Dying(class ALevelInfo* levenInfo, class APawn* Pawn, class AwWeapon* Weapon);
	void FootStepping(int side);
	void EffectExplosion();
	void PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart);
	void SetAnimAction(const FName& NewAction, bool bNoBlendAnim);
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
	class AwDefenceBoss* STATIC_Create(class ALevelInfo* Level, byte TeamNum, int Grade, int RegenLoc);
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
// 0x02F0 (0x1134 - 0x0E44)
class AwPlayer : public AUnrealPlayer
{
public:
	class AAttractCamera*                              camlist[0x14];                                            // 0x0E44(0x0004)
	int                                                numcams;                                                  // 0x0E94(0x0004)
	int                                                curcam;                                                   // 0x0E98(0x0004)
	class APawn*                                       attracttarget;                                            // 0x0E9C(0x0004)
	class APawn*                                       attracttarget2;                                           // 0x0EA0(0x0004)
	float                                              camtime;                                                  // 0x0EA4(0x0004)
	float                                              targettime;                                               // 0x0EA8(0x0004)
	float                                              gibwatchtime;                                             // 0x0EAC(0x0004)
	struct FVector                                     focuspoint;                                               // 0x0EB0(0x000C)
	int                                                InputHistory[0x4];                                        // 0x0EBC(0x0004) (Transient)
	float                                              LastKeyTime;                                              // 0x0ECC(0x0004) (Transient)
	int                                                OldKey;                                                   // 0x0ED0(0x0004) (Transient)
	float                                              MinAdrenalineCost;                                        // 0x0ED4(0x0004)
	string                                             ComboNameList[0x10];                                      // 0x0ED8(0x000C) (NeedCtorLink)
	class UClass*                                      ComboList[0x10];                                          // 0x0F98(0x0004)
	struct FPlayerRecord                               PawnSetupRecord;                                          // 0x0FD8(0x00FC) (NeedCtorLink)
	float                                              LastRulesRequestTime;                                     // 0x10D4(0x0004)
	float                                              LastMapListRequestTime;                                   // 0x10D8(0x0004)
	bool                                               bMusicStarted;                                            // 0x10DC(0x0004)
	bool                                               autozoom;                                                 // 0x10DC(0x0004)
	bool                                               bClassicTrans;                                            // 0x10DC(0x0004)
	bool                                               bHighBeaconTrajectory;                                    // 0x10DC(0x0004)
	bool                                               bWaitingForPRI;                                           // 0x10DC(0x0004)
	bool                                               bWaitingForVRI;                                           // 0x10DC(0x0004)
	bool                                               bDebuggingVoiceChat;                                      // 0x10DC(0x0004)
	bool                                               bAutoDemoRec;                                             // 0x10DC(0x0004)
	bool                                               bIsFirstTick;                                             // 0x10DC(0x0004)
	float                                              bPrevDeltaTime;                                           // 0x10E0(0x0004)
	int                                                nRandomSound;                                             // 0x10E4(0x0004)
	byte                                               bOldQuickGrenade;                                         // 0x10E8(0x0001)
	byte                                               bOldQuickSubGrenade;                                      // 0x10E9(0x0001)
	byte                                               Padding00[0x2];                                           // 0x10EA(0x0002) MISSED OFFSET
	string                                             ResultMenuClass;                                          // 0x10EC(0x000C) (NeedCtorLink)
	int                                                wPawnCounts;                                              // 0x10F8(0x0004)
	class AwWeapon*[]                                  InventoryRebuildSkipList;                                 // 0x10FC(0x000C) (NeedCtorLink)
	class AController*                                 CmdTarget;                                                // 0x1108(0x0004)
	float                                              fShakeFovSpeed;                                           // 0x110C(0x0004)
	class AwFPWeaponAttachment*                        FPTest;                                                   // 0x1110(0x0004)
	class AActor*                                      OldViewTarget;                                            // 0x1114(0x0004)
	float                                              BombSettingDelayTime;                                     // 0x1118(0x0004)
	bool                                               bReqAcitveRespawn;                                        // 0x111C(0x0004) (Net)
	bool                                               bActiveNowRespawn;                                        // 0x111C(0x0004)
	float                                              fReqLastTime;                                             // 0x1120(0x0004)
	struct FScriptDelegate                             __ProcessRule__Delegate;                                  // 0x1124(0x0090) (NeedCtorLink)
	struct FScriptDelegate                             __ProcessMapName__Delegate;                               // 0x112C(0x0090) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPlayer");
		return ptr;
	}


	struct FBtrDouble GetUniqueID(int iItemID);
	void SetItemCount(int iItemID, int RemainCount);
	int GetItemCount(int iItemID);
	void ServerReqNowRespawn(const struct FBtrDouble& iUniqueID);
	void ServerReqUsingItem(int iItemID, const struct FBtrDouble& iUniqueID);
	bool UsingItem_Slot8();
	bool UsingItem_Slot7();
	bool ReqUsingItem(byte byKey);
	void MakeItemBox(const string& t);
	void AnimRate(float fAnimRate);
	void UseRagdoll(bool bUse);
	void BodyRot_BR(float fR);
	void BodyRot_BL(float fR);
	void BodyRot_FR(float fR);
	void BodyRot_FL(float fR);
	void Rot_CBR(const string& fX, const string& fY, const string& fZ);
	void Rot_CBL(const string& fX, const string& fY, const string& fZ);
	void Rot_CFR(const string& fX, const string& fY, const string& fZ);
	void Rot_CFL(const string& fX, const string& fY, const string& fZ);
	void Rot_BR(const string& fX, const string& fY, const string& fZ);
	void Rot_BL(const string& fX, const string& fY, const string& fZ);
	void Rot_FR(const string& fX, const string& fY, const string& fZ);
	void Rot_FL(const string& fX, const string& fY, const string& fZ);
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
	bool ActivateSupplyItem(class AController* callingController, ESUPPLY_ITEM_TYPE eSupplyItemType);
	bool CanUseActivateSupplyItem(class AController* callingController, ESUPPLY_ITEM_TYPE eSupplyItemType, bool bShowMessage);
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
	void ClientReceiveBan(const string& BanInfo);
	void ServerRequestBanInfo(int PlayerID);
	void ServerSpecViewGoal();
	void SpecViewGoal();
	void ServerRequestPlayerInfo();
	void AdminMenu(const string& CommandLine);
	void PostNetReceive();
	bool NeedNetNotify();
	void ChangeCharacter(const string& newCharacter);
	void Possess(class APawn* aPawn);
	void SetPawnFemale();
	void SetPlayerEquipInfo();
	void SetPawnClass(const string& inClass, const string& InCharacter);
	void PawnDied(class APawn* P);
	struct FRotator CameraTrack(class APawn* Target, float DeltaTime);
	bool LineOfSight(int C, class APawn* Target);
	class APawn* PickNextBot(class APawn* current);
	struct FVector FindFloatingCam(class APawn* Target);
	bool FindFixedCam(class APawn* Target, int* newcam);
	void FillCameraList();
	void ServerDoCombo(class UClass* ComboClass);
	void DoCombo(class UClass* ComboClass);
	void ServerPlayWeaponNullSound(class AwWeapon* Wpn, ESoundSlot Slot, bool UseStereo);
	void ProcessQuickGrenadeKey2();
	void ProcessQuickGrenadeKey();
	void ProcessSwitchDemoPack(bool hasBomb, bool bSettingBomb, byte* byUsed);
	bool ProcessSetObjective();
	void ProcessUseKey();
	void PlayerTick(float DeltaTime);
	void NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart);
	void ClientReceiveCombo(const string& NewCombo);
	void ServerSetClassicTrans(bool B);
	void PostNetBeginPlay();
	void PostBeginPlay();
	void L33TPhrase(int phraseNum);
	float RateWeapon(class AwWeapon* W);
	void PlayBeepSound();
	void StopFiring();
	void ClientReceiveMapName(const string& NewMap);
	void ServerRequestMapList();
	void ClientReceiveResultMenu(const string& MenuClass);
	void ClientReceiveRule(const string& NewRule);
	void ServerRequestRules();
	string GetPhysicsString();
	string GetRoleString();
	void DebugMessage(const string& DebugString, const FName& Type);
	void CheckPriority();
	bool InInventoryRebuildSkipList(class AwWeapon* W);
	void ServerRequestWeapon(int iWeaponID);
	void SetSpeed(float factor);
	void ResetNames();
	void setcmd(const string& targetName);
	void Cmd(const string& P1, const string& P2, const string& p3, const string& p4, const string& p5);
	void SetDoTraceNativeInstant(bool val);
	void SetFovSpeed(float V);
	float GetFovSpeed();
	void ShowPathToActor(class AActor* A);
	void ProcessMapName(const string& NewMap);
	void ProcessRule(const string& NewRule);
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
	string                                             SoundPickUP;                                              // 0x0440(0x000C) (NeedCtorLink)
	string                                             StrSoundPickup;                                           // 0x044C(0x000C) (NeedCtorLink)
	string                                             strSoundStandby;                                          // 0x0458(0x000C) (NeedCtorLink)
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
	string                                             SoundPickUP;                                              // 0x0440(0x000C) (NeedCtorLink)
	string                                             StrSoundPickup;                                           // 0x044C(0x000C) (NeedCtorLink)
	string                                             strSoundStandby;                                          // 0x0458(0x000C) (NeedCtorLink)
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
	string                                             SoundPickUP;                                              // 0x0444(0x000C) (NeedCtorLink)
	string                                             strSoundStandby;                                          // 0x0450(0x000C) (NeedCtorLink)

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
	string                                             m_soundPickUP;                                            // 0x043C(0x000C) (NeedCtorLink)
	string                                             m_strSoundStandby;                                        // 0x0448(0x000C) (NeedCtorLink)

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
// 0x0078 (0x06CC - 0x0654)
class AwBotVehicleController : public AScriptedController
{
public:
	bool                                               bHasFired;                                                // 0x0654(0x0004)
	bool                                               bForcedDirection;                                         // 0x0654(0x0004)
	bool                                               bCanFire;                                                 // 0x0654(0x0004)
	bool                                               bStrafeDir;                                               // 0x0654(0x0004)
	bool                                               bLeadTarget;                                              // 0x0654(0x0004)
	bool                                               bChangeDir;                                               // 0x0654(0x0004)
	bool                                               bEnemyIsVisible;                                          // 0x0654(0x0004)
	bool                                               bMustCharge;                                              // 0x0654(0x0004)
	bool                                               bJustLanded;                                              // 0x0654(0x0004)
	bool                                               bRecommendFastMove;                                       // 0x0654(0x0004)
	float                                              AcquireTime;                                              // 0x0658(0x0004)
	float                                              LoseEnemyCheckTime;                                       // 0x065C(0x0004)
	float                                              StartTacticalTime;                                        // 0x0660(0x0004)
	struct FVector                                     HidingSpot;                                               // 0x0664(0x000C)
	float                                              ChallengeTime;                                            // 0x0670(0x0004)
	float                                              Accuracy;                                                 // 0x0674(0x0004)
	float                                              StrafingAbility;                                          // 0x0678(0x0004)
	float                                              CombatStyle;                                              // 0x067C(0x0004)
	float                                              ReactionTime;                                             // 0x0680(0x0004)
	string                                             GoalString;                                               // 0x0684(0x000C) (NeedCtorLink)
	string                                             SoakString;                                               // 0x0690(0x000C) (NeedCtorLink)
	int                                                ChoosingAttackLevel;                                      // 0x069C(0x0004)
	float                                              ChooseAttackTime;                                         // 0x06A0(0x0004)
	int                                                ChooseAttackCounter;                                      // 0x06A4(0x0004)
	float                                              EnemyVisibilityTime;                                      // 0x06A8(0x0004)
	class APawn*                                       VisibleEnemy;                                             // 0x06AC(0x0004)
	class APawn*                                       OldEnemy;                                                 // 0x06B0(0x0004)
	float                                              StopStartTime;                                            // 0x06B4(0x0004)
	float                                              LastRespawnTime;                                          // 0x06B8(0x0004)
	float                                              FailedHuntTime;                                           // 0x06BC(0x0004)
	class APawn*                                       FailedHuntEnemy;                                          // 0x06C0(0x0004)
	int                                                NumRandomJumps;                                           // 0x06C4(0x0004)
	int                                                iAttackerTeam;                                            // 0x06C8(0x0004)

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
	void SoakStop(const string& problem);
	void DoRangedAttackOn(class AActor* A);
	bool EnemyVisible();
	bool DoWaitForLanding();
	void ExecuteWhatToDoNext();
	string GetEnemyName();
	string GetOldEnemyName();
	void TryToWalk();
	void WhatToDoNext(byte CallingByte);
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
	string                                             BreathSound;                                              // 0x002C(0x000C) (Edit, NeedCtorLink)
	string                                             EquipHitSound;                                            // 0x0038(0x000C) (Edit, NeedCtorLink)
	string[]                                           Sounds;                                                   // 0x0044(0x000C) (Edit, NeedCtorLink)
	string[]                                           LandedSounds;                                             // 0x0050(0x000C) (Edit, NeedCtorLink)
	string[]                                           LandedSounds_3rd;                                         // 0x005C(0x000C) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPawnSoundGroup");
		return ptr;
	}


	string STATIC_GetEquipHitSound();
	string STATIC_GetBreathSound();
	string STATIC_GetSound(ESoundType soundType);
	string STATIC_GetLandedSound3d(int SurfType);
	string STATIC_GetLandedSound2D(int SurfType);
	class USound* STATIC_GetDeathSound();
	class USound* STATIC_GetHitSound();
};


// Class WGame.Combo
// 0x0038 (0x0464 - 0x042C)
class ACombo : public AInfo
{
public:
	string                                             ExecMessage;                                              // 0x042C(0x000C) (Localized, NeedCtorLink)
	float                                              AdrenalineCost;                                           // 0x0438(0x0004)
	float                                              Duration;                                                 // 0x043C(0x0004)
	class USound*                                      ActivateSound;                                            // 0x0440(0x0004)
	class UMaterial*                                   Icon;                                                     // 0x0444(0x0004)
	class USound*                                      ComboAnnouncement;                                        // 0x0448(0x0004)
	FName                                              ComboAnnouncementName;                                    // 0x044C(0x0004)
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
// 0x000C (0x1108 - 0x10FC)
class AwWeaponAttachment : public AWeaponAttachment
{
public:
	bool                                               bHeavy;                                                   // 0x10FC(0x0004) (Edit)
	bool                                               bRapidFire;                                               // 0x10FC(0x0004) (Edit)
	bool                                               bAltRapidFire;                                            // 0x10FC(0x0004) (Edit)
	class AwWeapon*                                    LitWeapon;                                                // 0x1100(0x0004)
	byte                                               OldSpawnHitCount;                                         // 0x1104(0x0001)
	byte                                               Padding00[0x3];                                           // 0x1105(0x0003) MISSED OFFSET

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
// 0x0000 (0x18CC - 0x18CC)
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
	class UwRosterEntry* STATIC_CreateRosterEntryCharacter(const string& CharName);
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


	string STATIC_GetRagSkelName(const string& MeshName);
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
// 0x00FC (0x08E0 - 0x07E4)
class AwBot : public ABot
{
public:
	struct FPlayerRecord                               PawnSetupRecord;                                          // 0x07E4(0x00FC) (Edit, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBot");
		return ptr;
	}


	void Possess(class APawn* aPawn);
	void SetPawnClass(const string& inClass, const string& InCharacter);
};


// Class WGame.wMonsterController
// 0x0074 (0x06C8 - 0x0654)
class AwMonsterController : public AScriptedController
{
public:
	bool                                               bHasFired;                                                // 0x0654(0x0004)
	bool                                               bForcedDirection;                                         // 0x0654(0x0004)
	bool                                               bCanFire;                                                 // 0x0654(0x0004)
	bool                                               bStrafeDir;                                               // 0x0654(0x0004)
	bool                                               bLeadTarget;                                              // 0x0654(0x0004)
	bool                                               bChangeDir;                                               // 0x0654(0x0004)
	bool                                               bEnemyIsVisible;                                          // 0x0654(0x0004)
	bool                                               bMustCharge;                                              // 0x0654(0x0004)
	bool                                               bJustLanded;                                              // 0x0654(0x0004)
	bool                                               bRecommendFastMove;                                       // 0x0654(0x0004)
	float                                              AcquireTime;                                              // 0x0658(0x0004)
	float                                              LoseEnemyCheckTime;                                       // 0x065C(0x0004)
	float                                              StartTacticalTime;                                        // 0x0660(0x0004)
	struct FVector                                     HidingSpot;                                               // 0x0664(0x000C)
	float                                              ChallengeTime;                                            // 0x0670(0x0004)
	float                                              Accuracy;                                                 // 0x0674(0x0004)
	float                                              StrafingAbility;                                          // 0x0678(0x0004)
	float                                              CombatStyle;                                              // 0x067C(0x0004)
	float                                              ReactionTime;                                             // 0x0680(0x0004)
	string                                             GoalString;                                               // 0x0684(0x000C) (NeedCtorLink)
	string                                             SoakString;                                               // 0x0690(0x000C) (NeedCtorLink)
	int                                                ChoosingAttackLevel;                                      // 0x069C(0x0004)
	float                                              ChooseAttackTime;                                         // 0x06A0(0x0004)
	int                                                ChooseAttackCounter;                                      // 0x06A4(0x0004)
	float                                              EnemyVisibilityTime;                                      // 0x06A8(0x0004)
	class APawn*                                       VisibleEnemy;                                             // 0x06AC(0x0004)
	class APawn*                                       OldEnemy;                                                 // 0x06B0(0x0004)
	float                                              StopStartTime;                                            // 0x06B4(0x0004)
	float                                              LastRespawnTime;                                          // 0x06B8(0x0004)
	float                                              FailedHuntTime;                                           // 0x06BC(0x0004)
	class APawn*                                       FailedHuntEnemy;                                          // 0x06C0(0x0004)
	int                                                NumRandomJumps;                                           // 0x06C4(0x0004)

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
	void SoakStop(const string& problem);
	void ChooseAttackMode();
	void DoRangedAttackOn(class AActor* A);
	void FightEnemy(bool bCanCharge);
	bool EnemyVisible();
	bool DoWaitForLanding();
	void ExecuteWhatToDoNext();
	string GetEnemyName();
	string GetOldEnemyName();
	void TryToWalk();
	void WhatToDoNext(byte CallingByte);
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
// 0x0000 (0x06C8 - 0x06C8)
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
// 0x0010 (0x04F8 - 0x04E8)
class AwSeekingRocket : public AwRocket
{
public:
	class AActor*                                      Seeking;                                                  // 0x04E8(0x0004) (Net)
	struct FVector                                     InitialDir;                                               // 0x04EC(0x000C) (Net)

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
	string                                             ActionName;                                               // 0x0034(0x000C) (NeedCtorLink)

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
	class UwActionContainer*[]                         SubActionContainers;                                      // 0x0034(0x000C) (NeedCtorLink)
	int                                                SubActionContainersLength;                                // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wActionContainer");
		return ptr;
	}


	string ToString();
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
	string                                             GoalName;                                                 // 0x0030(0x000C) (NeedCtorLink)
	class UGoal*[]                                     Subgoals;                                                 // 0x003C(0x000C) (NeedCtorLink)
	EGoalStatus                                        GoalStatus;                                               // 0x0048(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0049(0x0003) MISSED OFFSET
	string                                             MessageNotifyKilled;                                      // 0x004C(0x000C) (NeedCtorLink)
	string                                             MessageMemoryVisibleChanged;                              // 0x0058(0x000C) (NeedCtorLink)
	string                                             MessageFlashed;                                           // 0x0064(0x000C) (NeedCtorLink)
	string                                             MessageBePeaceful;                                        // 0x0070(0x000C) (NeedCtorLink)
	string                                             MessageNotifyDied;                                        // 0x007C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal");
		return ptr;
	}


	bool SetFocus();
	bool SetFocusValue();
	bool SetFocusValueToTarget();
	string ToString();
	void DisplayDebug(class UCanvas* C, int Level, float* YL, float* YPos);
	void HandleMessage(const string& Msg);
	void End();
	EGoalStatus ProcessSubGoals(float dt);
	EGoalStatus ActualWork(float dt);
	EGoalStatus Process(float dt);
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
// 0x00B8 (0x1984 - 0x18CC)
class AwBotVehicle : public AwPawn
{
public:
	bool                                               bMeleeFighter;                                            // 0x18CC(0x0004)
	bool                                               bShotAnim;                                                // 0x18CC(0x0004)
	bool                                               bCanDodge;                                                // 0x18CC(0x0004)
	bool                                               bVictoryNext;                                             // 0x18CC(0x0004)
	bool                                               bTryToWalk;                                               // 0x18CC(0x0004)
	bool                                               bBoss;                                                    // 0x18CC(0x0004)
	bool                                               bAlwaysStrafe;                                            // 0x18CC(0x0004)
	float                                              DodgeSkillAdjust;                                         // 0x18D0(0x0004)
	class USound*                                      HitSound[0x4];                                            // 0x18D4(0x0004)
	class USound*                                      DeathSound[0x4];                                          // 0x18E4(0x0004)
	class USound*                                      ChallengeSound[0x4];                                      // 0x18F4(0x0004)
	class USound*                                      FireSound;                                                // 0x1904(0x0004)
	class UClass*                                      AmmunitionClass;                                          // 0x1908(0x0004)
	class AwAmmunition*                                MyAmmo;                                                   // 0x190C(0x0004)
	class UClass*                                      ProjectileClass;                                          // 0x1910(0x0004)
	class AwProjectile*                                MyProj;                                                   // 0x1914(0x0004)
	int                                                ScoringValue;                                             // 0x1918(0x0004)
	struct FFireProperties                             SavedFireProperties;                                      // 0x191C(0x0014)
	string                                             StaySound;                                                // 0x1930(0x000C) (NeedCtorLink)
	string                                             MoveSound;                                                // 0x193C(0x000C) (NeedCtorLink)
	string                                             MoveDamagedSound;                                         // 0x1948(0x000C) (NeedCtorLink)
	string                                             SpindownSound;                                            // 0x1954(0x000C) (NeedCtorLink)
	string                                             ExplosionSoundWhenDying;                                  // 0x1960(0x000C) (NeedCtorLink)
	string                                             NullSound;                                                // 0x196C(0x000C) (NeedCtorLink)
	bool                                               bTestCheck;                                               // 0x1978(0x0004)
	float                                              CONFIG_SPINDOWN_SOUND_VOLUME;                             // 0x197C(0x0004)
	float                                              CONFIG_SPINDOWN_SOUND_RADIUS;                             // 0x1980(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBotVehicle");
		return ptr;
	}


	void StartDeRes();
	void CreateGib(const FName& BoneName, class UClass* DamageType, const struct FRotator& R);
	void SetAnimAction(const FName& NewAction, bool bNoBlendAnim);
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


// Class WGame.wHelicopter
// 0x00BC (0x1A40 - 0x1984)
class AwHelicopter : public AwBotVehicle
{
public:
	int                                                BehaviorState;                                            // 0x1984(0x0004) (Net)
	int                                                iCurrentPoint;                                            // 0x1988(0x0004) (Net)
	float                                              HelicopterDestinationFactor;                              // 0x198C(0x0004)
	float                                              CumulatedDyingTime;                                       // 0x1990(0x0004)
	float                                              CONFIG_DyingLifeSpan;                                     // 0x1994(0x0004)
	float                                              CONFIG_DyingRotationFactor;                               // 0x1998(0x0004)
	float                                              CONFIG_DyingRotationRate;                                 // 0x199C(0x0004)
	float                                              CONFIG_DyingEffectInterval;                               // 0x19A0(0x0004)
	float                                              CONFIG_DyingImpluse;                                      // 0x19A4(0x0004)
	float                                              CONFIG_DyingImpluseFactor;                                // 0x19A8(0x0004)
	string                                             CONFIG_FinalExplosionSoundExplosion;                      // 0x19AC(0x000C) (NeedCtorLink)
	float                                              CONFIG_FinalExlosionSoundRadius;                          // 0x19B8(0x0004)
	bool                                               bBombExplosion;                                           // 0x19BC(0x0004)
	struct FSpriteWidget                               MinimapIconAlly;                                          // 0x19C0(0x0040)
	struct FSpriteWidget                               MinimapIconEnemy;                                         // 0x1A00(0x0040)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wHelicopter");
		return ptr;
	}


	bool STATIC_SpawnHeli(class ALevelInfo* Level, class AwHelicopter* lastHeli, class AController* Caller);
	class ANavigationPoint* STATIC_GetFlyingPathNode(class ALevelInfo* Level, int idx, int RegenLoc);
	class UClass* GetBloodHitClass(ECollisionPartsType collisionParts);
	bool deleOnReachedDestination(const struct FVector& Dir, class AActor* GoalActor);
	FName GetWeaponBoneFor(class AInventory* i);
	void PoundDamageTarget();
	void PunchDamageTarget();
	struct FVector GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z);
	void SpawnBelch();
	void PlayVictory();
	void PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange);
	void PlayDirectionalDeath(const struct FVector& HitLoc);
	void Falling();
	void SetMovementPhysics();
	bool Dodge(EDoubleClickDir DoubleClickMove);
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
	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


// Class WGame.wPlayerReplicationInfo
// 0x010C (0x0738 - 0x062C)
class AwPlayerReplicationInfo : public ATeamPlayerReplicationInfo
{
public:
	struct FPlayerRecord                               Rec;                                                      // 0x062C(0x00FC) (NeedCtorLink)
	bool                                               bForceNoPlayerLights;                                     // 0x0728(0x0004)
	bool                                               bNoTeamSkins;                                             // 0x0728(0x0004)
	string                                             PawnOverrideClass;                                        // 0x072C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wPlayerReplicationInfo");
		return ptr;
	}


	class UMaterial* GetPortrait();
	void UpdateCharacter();
	void SetCharacterName(const string& S);
	void UpdatePrecacheMaterials();
};


// Class WGame.PlayerRecordClass
// 0x0078 (0x00A4 - 0x002C)
class UPlayerRecordClass : public UObject
{
public:
	class UClass*                                      Species;                                                  // 0x002C(0x0004) (Edit)
	string                                             MeshName;                                                 // 0x0030(0x000C) (Edit, NeedCtorLink)
	string                                             BodySkinName;                                             // 0x003C(0x000C) (Edit, NeedCtorLink)
	string                                             FaceSkinName;                                             // 0x0048(0x000C) (Edit, NeedCtorLink)
	class UMaterial*                                   Portrait;                                                 // 0x0054(0x0004) (Edit)
	string                                             TextName;                                                 // 0x0058(0x000C) (Edit, NeedCtorLink)
	string                                             VoiceClassName;                                           // 0x0064(0x000C) (Edit, NeedCtorLink)
	string                                             Sex;                                                      // 0x0070(0x000C) (Edit, NeedCtorLink)
	string                                             Menu;                                                     // 0x007C(0x000C) (Edit, NeedCtorLink)
	string                                             Skeleton;                                                 // 0x0088(0x000C) (Edit, NeedCtorLink)
	string                                             Ragdoll;                                                  // 0x0094(0x000C) (Edit, NeedCtorLink)
	class UClass*                                      PlayerInfo;                                               // 0x00A0(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.PlayerRecordClass");
		return ptr;
	}


	struct FPlayerRecord STATIC_FillPlayerRecord();
};


// Class WGame.wAIBot
// 0x0104 (0x0798 - 0x0694)
class AwAIBot : public AwAIBotBase
{
public:
	struct FPlayerRecord                               PawnSetupRecord;                                          // 0x0694(0x00FC) (Edit, NeedCtorLink)
	class UClass*                                      ShortMemoryClass;                                         // 0x0790(0x0004)
	class UClass*                                      TargetingSystemClass;                                     // 0x0794(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAIBot");
		return ptr;
	}


	void Possess(class APawn* aPawn);
	void SetPawnClass(const string& inClass, const string& InCharacter);
};


// Class WGame.wSeekingRocket_Nemesis
// 0x0000 (0x04F8 - 0x04F8)
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
// 0x0000 (0x04F8 - 0x04F8)
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
// 0x0004 (0x04EC - 0x04E8)
class AwIncendiaryRocket : public AwRocket
{
public:
	class AwEmitter*                                   Trail;                                                    // 0x04E8(0x0004)

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
	class UwPurpose*[]                                 purposes;                                                 // 0x0088(0x000C) (NeedCtorLink)
	class UwPurpose*                                   CurrentPurpose;                                           // 0x0094(0x0004)
	class UwActionPlanner*                             Planner;                                                  // 0x0098(0x0004)
	bool                                               NeedReplaning;                                            // 0x009C(0x0004)
	float                                              CurrentPlanScore;                                         // 0x00A0(0x0004)
	int                                                CheckReplanCount;                                         // 0x00A4(0x0004)
	string                                             targetName;                                               // 0x00A8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_PlanAndExec");
		return ptr;
	}


	string ToString();
	void HandleMessage(const string& Msg);
	EGoalStatus ActualWork(float dt);
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
// 0x004C (0x00D4 - 0x0088)
class UGoal_Fire : public UGoal
{
public:
	class AActor*                                      Target;                                                   // 0x0088(0x0004)
	float                                              FireCheckInterval;                                        // 0x008C(0x0004)
	float                                              elapsed;                                                  // 0x0090(0x0004)
	bool                                               StartStopSwitch;                                          // 0x0094(0x0004)
	float                                              LastAmmo;                                                 // 0x0098(0x0004)
	float                                              LastAmmoMax;                                              // 0x009C(0x0004)
	float                                              Ammo;                                                     // 0x00A0(0x0004)
	float                                              StartAmmo;                                                // 0x00A4(0x0004)
	float                                              StartAmmoMax;                                             // 0x00A8(0x0004)
	float                                              CurrentAmmo;                                              // 0x00AC(0x0004)
	float                                              CurrentAmmoMax;                                           // 0x00B0(0x0004)
	int                                                FireCount;                                                // 0x00B4(0x0004)
	bool                                               DoAim;                                                    // 0x00B8(0x0004)
	bool                                               AimAvailable;                                             // 0x00B8(0x0004)
	bool                                               WeaponFireModeSingle;                                     // 0x00B8(0x0004)
	float                                              FailTime;                                                 // 0x00BC(0x0004)
	float                                              fSentryGunFailTime;                                       // 0x00C0(0x0004)
	string                                             StartWeaponName;                                          // 0x00C4(0x000C) (NeedCtorLink)
	bool                                               StartedWithTarget;                                        // 0x00D0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Fire");
		return ptr;
	}


	string ToString();
	void End();
	EGoalStatus ActualWork(float dt);
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
	bool                                               Sprint;                                                   // 0x0094(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_MovePathToward");
		return ptr;
	}


	void NotifyDestroyed(class AActor* A);
	string ToString();
	bool AddGoalMoveToward(int stackLevel);
	EGoalStatus ActualWork(float dt);
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


	string ToString();
	void AddGoalMovePathToward();
	EGoalStatus ActualWork(float dt);
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
	bool                                               StartStopSwitch;                                          // 0x0094(0x0004)
	float                                              LastAmmo;                                                 // 0x0098(0x0004)
	float                                              LastAmmoMax;                                              // 0x009C(0x0004)
	float                                              Ammo;                                                     // 0x00A0(0x0004)
	bool                                               DoAim;                                                    // 0x00A4(0x0004)
	bool                                               AimAvailable;                                             // 0x00A4(0x0004)
	bool                                               WeaponFireModeSingle;                                     // 0x00A4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Shoot");
		return ptr;
	}


	string ToString();
	EGoalStatus ActualWork(float dt);
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


	string ToString();
	void AddGoal();
	class ANavigationPoint* GetReachableRandomTarget();
	void End();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_Test* Init(class AwAIBotBase* inOwner);
};


// Class WGame.wPurpose
// 0x0024 (0x0050 - 0x002C)
class UwPurpose : public UObject
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x002C(0x0004)
	string                                             PlanName;                                                 // 0x0030(0x000C) (NeedCtorLink)
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
	bool                                               Peaceful;                                                 // 0x0030(0x0004)
	int                                                MaxActionLayers;                                          // 0x0034(0x0004)
	class UwStateData*                                 WorkingState;                                             // 0x0038(0x0004)
	class UwNPCActions*                                npcActions;                                               // 0x003C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wActionPlanner");
		return ptr;
	}


	class UwActionContainer* Plan(class UwPurpose* purpose, int tries, float* bestPlanScore);
	void SubPlan(int Layer, class UwPurpose* purpose, float parentActionTime, class UwActionContainer** acon, class UwStateData** S, class UwActionLayer*[]* Actions);
	void GetActionCandidatesByLayer(class UwAction*[]* rawActions, class UwActionLayer*[]* actionsByLayer);
	void GetActionCandidates(class UwAction*[]* Actions);
	void GetActionCandidates_Pick(class UwAction*[]* Actions);
	void GetActionCandidates_SwitchWeapon(class UwAction*[]* Actions);
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
// 0x0000 (0x1A40 - 0x1A40)
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
// 0x0084 (0x06D8 - 0x0654)
class AwHelicopterController : public AScriptedController
{
public:
	class AActor*                                      CurrentPathNode;                                          // 0x0654(0x0004)
	bool                                               bFirstFollowPath;                                         // 0x0658(0x0004)
	bool                                               bAttacking;                                               // 0x0658(0x0004)
	float                                              AttackStartTime;                                          // 0x065C(0x0004)
	int                                                AttackPhase;                                              // 0x0660(0x0004)
	int                                                LastAttackPhase;                                          // 0x0664(0x0004)
	float                                              FireCheckInterval;                                        // 0x0668(0x0004)
	int                                                AttackPendingWeaponID;                                    // 0x066C(0x0004)
	float                                              AttackPendingWeaponAmmo;                                  // 0x0670(0x0004)
	float                                              TempAmmo;                                                 // 0x0674(0x0004)
	float                                              TempAmmoMax;                                              // 0x0678(0x0004)
	float                                              CONFIG_MinSpeed;                                          // 0x067C(0x0004)
	float                                              CONFIG_MaxSpeed;                                          // 0x0680(0x0004)
	float                                              CONFIG_Acceleration;                                      // 0x0684(0x0004)
	float                                              CONFIG_Deceleration;                                      // 0x0688(0x0004)
	int[]                                              CONFIG_AttackSlot;                                        // 0x068C(0x000C) (NeedCtorLink)
	float[]                                            CONFIG_AttackTime;                                        // 0x0698(0x000C) (NeedCtorLink)
	int[]                                              CONFIG_AttackAimMinError;                                 // 0x06A4(0x000C) (NeedCtorLink)
	int[]                                              CONFIG_AttackAimMaxError;                                 // 0x06B0(0x000C) (NeedCtorLink)
	float                                              CONFIG_AttackMoveMomentumFactor;                          // 0x06BC(0x0004)
	float                                              CONFIG_AttackOneMoveFactor;                               // 0x06C0(0x0004)
	float                                              CONFIG_FireStartAngleInDot;                               // 0x06C4(0x0004)
	float                                              CONFIG_MinAngleAgainstGround;                             // 0x06C8(0x0004)
	float                                              CONFIG_MoveMaxSlope;                                      // 0x06CC(0x0004)
	float                                              CONFIG_SoundVolume;                                       // 0x06D0(0x0004)
	float                                              CONFIG_SoundRadius;                                       // 0x06D4(0x0004)

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
	string Rotator2String(const struct FRotator& R);
	string Vector2String(const struct FVector& V);
	bool FireWeaponAt(class AActor* A);
	void CancelCampFor(class AController* C);
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
	bool                                               bCheckForStackedBarrels;                                  // 0x0434(0x0004)
	bool                                               bBurning;                                                 // 0x0434(0x0004)
	float                                              fLastBurningTime;                                         // 0x0438(0x0004)
	class AwProjectile*                                BurningProj;                                              // 0x043C(0x0004)
	string                                             SoundWarning;                                             // 0x0440(0x000C) (NeedCtorLink)
	string                                             SoundDestroy;                                             // 0x044C(0x000C) (NeedCtorLink)

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
	bool                                               bSprint;                                                  // 0x0090(0x0004)
	bool                                               bCrouch;                                                  // 0x0090(0x0004)
	bool                                               bProne;                                                   // 0x0090(0x0004)
	float                                              ReachRadius;                                              // 0x0094(0x0004)
	float                                              LostStartTime;                                            // 0x0098(0x0004)
	struct FVector                                     checkpoint;                                               // 0x009C(0x000C)
	float                                              CheckPointTime;                                           // 0x00A8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_MoveToward");
		return ptr;
	}


	string ToString();
	void NotifyDestroyed(class AActor* A);
	bool SetFocusValue();
	EGoalStatus ActualWork(float dt);
	bool doSprint();
	void Start();
	bool PassedCheckPoint();
	void ClearReferences();
	class UGoal_MoveToward* Init(class AwAIBotBase* inOwner, class AActor* inDestination, class AActor* inFocus, float inReachRadius, bool inSprint, bool inCrouch, bool inProne);
};


// Class WGame.DAE
// 0x0004 (0x0030 - 0x002C)
class UDAE : public UObject
{
public:
	bool                                               bFailAllEvaluation;                                       // 0x002C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
};


// Class WGame.DAE_Multiple
// 0x001C (0x004C - 0x0030)
class UDAE_Multiple : public UDAE
{
public:
	class UDAE*[]                                      DAEs;                                                     // 0x0030(0x000C) (NeedCtorLink)
	float[]                                            Factors;                                                  // 0x003C(0x000C) (NeedCtorLink)
	float                                              TotalFactors;                                             // 0x0048(0x0004)

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
// 0x0004 (0x0034 - 0x0030)
class UDAE_InSight : public UDAE
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_InSight");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_InSight* STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner);
};


// Class WGame.DAE_Visibility
// 0x0004 (0x0034 - 0x0030)
class UDAE_Visibility : public UDAE
{
public:
	class AwAIBotBase*                                 Owner;                                                    // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_Visibility");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_Visibility* STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner);
};


// Class WGame.DAE_Proximity
// 0x0008 (0x0038 - 0x0030)
class UDAE_Proximity : public UDAE
{
public:
	float                                              MaxDistance;                                              // 0x0030(0x0004)
	class AwAIBotBase*                                 Owner;                                                    // 0x0034(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_Proximity");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_Proximity* STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner, float inMaxDistance);
};


// Class WGame.DAE_IsTurret
// 0x0000 (0x0030 - 0x0030)
class UDAE_IsTurret : public UDAE
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_IsTurret");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_IsTurret* STATIC_Create(bool bFailAllEvaluation);
};


// Class WGame.DAE_RecentTarget
// 0x0008 (0x0038 - 0x0030)
class UDAE_RecentTarget : public UDAE
{
public:
	float                                              Time;                                                     // 0x0030(0x0004)
	class AwAIBotBase*                                 Owner;                                                    // 0x0034(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.DAE_RecentTarget");
		return ptr;
	}


	float Evaluate(class UMemoryItem* mi);
	class UDAE_RecentTarget* STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner, float InTime);
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
	class UwAction*[]                                  Actions;                                                  // 0x002C(0x000C) (NeedCtorLink)

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


	string ToString();
	bool SetFocusValue();
	void End();
	EGoalStatus ActualWork(float dt);
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


	string ToString();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_Stay* Init(class AwAIBotBase* inOwner, float inStayLength);
};


// Class WGame.Goal_SwitchWeapon
// 0x0004 (0x008C - 0x0088)
class UGoal_SwitchWeapon : public UGoal
{
public:
	byte                                               Group;                                                    // 0x0088(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0089(0x0003) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_SwitchWeapon");
		return ptr;
	}


	string ToString();
	bool SetFocusValue();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_SwitchWeapon* Init(class AwAIBotBase* inOwner, byte InGroup);
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


	string ToString();
	EGoalStatus ActualWork(float dt);
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


	string ToString();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_MoveToEnemyInfluence* Init(class AwAIBotBase* inOwner);
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


	string ToString();
	void End();
	bool SetFocusValue();
	void NextFocusTarget();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_LookAround* Init(class AwAIBotBase* inOwner, float inDuration);
};


// Class WGame.Goal_Reload
// 0x0008 (0x0090 - 0x0088)
class UGoal_Reload : public UGoal
{
public:
	class AwGun*                                       Gun;                                                      // 0x0088(0x0004)
	bool                                               ReloadAttempted;                                          // 0x008C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Reload");
		return ptr;
	}


	string ToString();
	bool SetFocusValue();
	EGoalStatus ActualWork(float dt);
	void NotifyDestroyed(class AActor* A);
	void Start();
	void ClearReferences();
	class UGoal_Reload* Init(class AwAIBotBase* inOwner);
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


	string ToString();
	class ANavigationPoint* GetTarget();
	EGoalStatus ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_UseAirstrikeRealTime* Init(class AwAIBotBase* inOwner);
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


	string ToString();
	void End();
	bool SetFocusValue();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_AimSpecificParts* Init(class AwAIBotBase* inOwner);
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


	string ToString();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_MoveToSeeTarget* Init(class AwAIBotBase* inOwner);
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


	string ToString();
	void End();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_SwitchAndUse* Init(class AwAIBotBase* inOwner, int InGroup);
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


	string ToString();
	EGoalStatus ActualWork(float dt);
	void Start();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_ApproachAndMelee* Init(class AwAIBotBase* inOwner, class APawn* inTarget);
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


	string ToString();
	EGoalStatus ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_PickTarget* Init(class AwAIBotBase* inOwner, class UMemoryItem* inMI);
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


	string ToString();
	class ANavigationPoint* GetTarget();
	EGoalStatus ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_ThrowGrenadeRealTime* Init(class AwAIBotBase* inOwner);
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


	string ToString();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_Fail* Init(class AwAIBotBase* inOwner);
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


	string ToString();
	void DisplayDebug(class UCanvas* C, int Level, float* YL, float* YPos);
	bool SetFocus();
	void ClearSubgoals(bool free);
	void End();
	EGoalStatus ActualWork(float dt);
	class UGoal_ExecPartialPlan* GetNextSubGoal();
	float GetProgress(float Min, float Size);
	void Start();
	void ClearReferences();
	class UGoal_ExecPartialPlan* Init(class AwAIBotBase* inOwner, class UwActionContainer* inPartialPlan);
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


	string ToString();
	void End();
	EGoalStatus ActualWork(float dt);
	void Start();
	void ClearReferences();
	class UGoal_SwitchAndFire* Init(class AwAIBotBase* inOwner, int InGroup, class AActor* inTarget);
};


// Class WGame.Goal_Melee
// 0x0014 (0x009C - 0x0088)
class UGoal_Melee : public UGoal
{
public:
	class AActor*                                      Target;                                                   // 0x0088(0x0004)
	float                                              FireCheckInterval;                                        // 0x008C(0x0004)
	float                                              elapsed;                                                  // 0x0090(0x0004)
	bool                                               DidMelee;                                                 // 0x0094(0x0004)
	float                                              FailTime;                                                 // 0x0098(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Melee");
		return ptr;
	}


	string ToString();
	bool SetFocusValue();
	EGoalStatus ActualWork(float dt);
	void Start();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_Melee* Init(class AwAIBotBase* inOwner, class AActor* inTarget);
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


	string ToString();
	void End();
	bool SetFocusValue();
	EGoalStatus ActualWork(float dt);
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


	string ToString();
	void End();
	EGoalStatus ActualWork(float dt);
	void Start();
	void NotifyDestroyed(class AActor* A);
	void ClearReferences();
	class UGoal_SwitchAndThrow* Init(class AwAIBotBase* inOwner, class AActor* inTarget, int InGroup);
};


// Class WGame.Goal_Look
// 0x0014 (0x009C - 0x0088)
class UGoal_Look : public UGoal
{
public:
	struct FVector                                     LookLocation;                                             // 0x0088(0x000C)
	byte                                               old;                                                      // 0x0094(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0095(0x0003) MISSED OFFSET
	bool                                               pitchSet;                                                 // 0x0098(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.Goal_Look");
		return ptr;
	}


	string ToString();
	void End();
	bool SetFocusValue();
	EGoalStatus ActualWork(float dt);
	void Start();
	class UGoal_Look* Init(class AwAIBotBase* inOwner, const struct FVector& inLookLocation);
};


// Class WGame.wEntryGameInfo
// 0x0004 (0x09B4 - 0x09B0)
class AwEntryGameInfo : public AGameInfo
{
public:
	bool                                               bLoadedGameTextures;                                      // 0x09B0(0x0004)
	bool                                               bLoadedGameStaticMeshes;                                  // 0x09B0(0x0004)
	bool                                               bLoadedGameSkeletalMeshes;                                // 0x09B0(0x0004)

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


// Class WGame.wDeathMessage
// 0x001C (0x046C - 0x0450)
class AwDeathMessage : public ALocalMessage
{
public:
	string                                             KilledString;                                             // 0x0450(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             SomeoneString;                                            // 0x045C(0x000C) (Edit, Localized, NeedCtorLink)
	bool                                               bNoConsoleDeathMessages;                                  // 0x0468(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wDeathMessage");
		return ptr;
	}


	void STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
	struct FColor STATIC_GetConsoleColor(class APlayerReplicationInfo* RelatedPRI_1);
};


// Class WGame.wWeaponPickup_Location
// 0x000C (0x0484 - 0x0478)
class AwWeaponPickup_Location : public AwWeaponPickup
{
public:
	FName                                              ClassName;                                                // 0x0478(0x0004)
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


// Class WGame.wVehicle
// 0x0070 (0x12EC - 0x127C)
class AwVehicle : public AVehicle
{
public:
	string                                             DefaultWeaponClassName;                                   // 0x127C(0x000C) (Edit, NeedCtorLink)
	struct FVector                                     VehicleProjSpawnOffset;                                   // 0x1288(0x000C) (Edit)
	class APawn*                                       DamLastInstigator;                                        // 0x1294(0x0004)
	float                                              DamLastDamageTime;                                        // 0x1298(0x0004)
	class UMaterial*                                   DefaultCrosshair;                                         // 0x129C(0x0004)
	class UMaterial*                                   CrosshairHitFeedbackTex;                                  // 0x12A0(0x0004)
	float                                              CrosshairScale;                                           // 0x12A4(0x0004)
	bool                                               bCHZeroYOffset;                                           // 0x12A8(0x0004)
	bool                                               bCustomHealthDisplay;                                     // 0x12A8(0x0004)
	float                                              LastCalcWeaponFire;                                       // 0x12AC(0x0004)
	class AActor*                                      LastCalcHA;                                               // 0x12B0(0x0004)
	struct FVector                                     LastCalcHL;                                               // 0x12B4(0x000C)
	struct FVector                                     LastCalcHN;                                               // 0x12C0(0x000C)
	class USound*                                      LockedOnSound;                                            // 0x12CC(0x0004) (Edit)
	class AController*                                 DestroyPrevController;                                    // 0x12D0(0x0004)
	class AEmitter*                                    ExplosionEffect;                                          // 0x12D4(0x0004)
	class AEmitter*                                    DebugFX;                                                  // 0x12D8(0x0004)
	struct FVector                                     BotError;                                                 // 0x12DC(0x000C)
	class AActor*                                      OldTarget;                                                // 0x12E8(0x0004)

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
	FName GetWeaponBoneFor(class AInventory* i);
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
// 0x010C (0x13F8 - 0x12EC)
class AwTurret : public AwVehicle
{
public:
	class UClass*                                      TurretBaseClass;                                          // 0x12EC(0x0004)
	class AwTurret_Base*                               TurretBase;                                               // 0x12F0(0x0004)
	struct FRotator                                    OriginalRotation;                                         // 0x12F4(0x000C) (Net)
	struct FVector                                     OriginalLocation;                                         // 0x1300(0x000C) (Net)
	struct FVector                                     OriginalDirection;                                        // 0x130C(0x000C) (Net)
	struct FRotator                                    EnterRotation;                                            // 0x1318(0x000C) (Net)
	float                                              TurretFOV;                                                // 0x1324(0x0004)
	struct FVector                                     DriverEnteredLocation;                                    // 0x1328(0x000C)
	class UClass*                                      TurretSwivelClass;                                        // 0x1334(0x0004)
	class AwTurret_Base*                               TurretSwivel;                                             // 0x1338(0x0004)
	float                                              YawAccel;                                                 // 0x133C(0x0004)
	float                                              PitchAccel;                                               // 0x1340(0x0004)
	float                                              RotationInertia;                                          // 0x1344(0x0004) (Edit, Const)
	float                                              RotationSpeed;                                            // 0x1348(0x0004) (Edit, Const)
	struct FVector                                     CamAbsLocation;                                           // 0x134C(0x000C) (Edit)
	struct FVector                                     CamRelLocation;                                           // 0x1358(0x000C) (Edit)
	struct FVector                                     CamDistance;                                              // 0x1364(0x000C) (Edit)
	float                                              RotYawConstrant_Left;                                     // 0x1370(0x0004) (Net)
	float                                              RotYawConstrant_Right;                                    // 0x1374(0x0004) (Net)
	float                                              RotPitchConstant_Up;                                      // 0x1378(0x0004) (Net)
	float                                              RotPitchConstant_Down;                                    // 0x137C(0x0004) (Net)
	float                                              RotSpeed_Yaw;                                             // 0x1380(0x0004) (Net)
	float                                              RotSpeed_Pitch;                                           // 0x1384(0x0004) (Net)
	struct FRotator                                    LastCamRot;                                               // 0x1388(0x000C)
	float                                              LastTimeSeconds;                                          // 0x1394(0x0004)
	float                                              CamRotationInertia;                                       // 0x1398(0x0004) (Edit)
	bool                                               bZooming;                                                 // 0x139C(0x0004)
	float                                              DesiredPlayerFOV;                                         // 0x13A0(0x0004) (Edit)
	float                                              MinPlayerFOV;                                             // 0x13A4(0x0004) (Edit)
	float                                              OldFOV;                                                   // 0x13A8(0x0004) (Edit)
	float                                              ZoomSpeed;                                                // 0x13AC(0x0004) (Edit)
	float                                              ZoomWeaponOffsetAdjust;                                   // 0x13B0(0x0004) (Edit)
	class UMaterial*                                   ZoomTick;                                                 // 0x13B4(0x0004)
	class UMaterial*                                   ZoomTickTex;                                              // 0x13B8(0x0004)
	class UTexture*                                    WeaponInfoTexture;                                        // 0x13BC(0x0004)
	FName                                              ObjectiveTag[0x6];                                        // 0x13C0(0x0004) (Edit)
	class ASVehicleTrigger*[]                          EntryTriggers;                                            // 0x13D8(0x000C) (NeedCtorLink)
	int                                                AnimRotBase;                                              // 0x13E4(0x0004)
	struct FVector                                     vDriverAttachPos;                                         // 0x13E8(0x000C)
	float                                              NotifyElapsed;                                            // 0x13F4(0x0004)

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
	void PlayFiring(float Rate, const FName& FiringMode);
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
// 0x000C (0x1404 - 0x13F8)
class AwTurret_FNM240 : public AwTurret
{
public:
	struct FRotator                                    rOriginalRot;                                             // 0x13F8(0x000C)

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
	int[]                                              WeaponGroups;                                             // 0x06D4(0x000C) (Edit, NeedCtorLink)
	int                                                SupplyCount;                                              // 0x06E0(0x0004) (Edit)
	string                                             ChargeSound;                                              // 0x06E4(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAmmoSupplyObjective");
		return ptr;
	}


	bool CheckFillAmmoToWeapon(EeWeaponType eType);
	bool ChargeAmmo(class AwPawn* P);
	void Touch(class AActor* Other);
	void PostBeginPlay();
};


// Class WGame.wTeamGame
// 0x000C (0x15E0 - 0x15D4)
class AwTeamGame : public ATeamGame
{
public:
	string                                             ResultMenuClass;                                          // 0x15D4(0x000C) (Edit, Config, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wTeamGame");
		return ptr;
	}


	void RespawnPlayer(class AController* C, bool bClearSpecials);
	void PossessPawn(class AController* C, class APawn* P);
	bool SpawnAndPossessPawn(class AController* C, const string& PawnClassName);
	class ANavigationPoint* FindPlayerStart(class AController* Player, byte inTeam, const string& incomingName);
	void GetGameSpecificPurposes(class AController* Owner, class UObject*[]* purposes);
	void EndGame(class APlayerReplicationInfo* Winner, const string& Reason);
	void statai();
	void SetOldTeamInfo(class AGameReplicationInfo* OldGRI);
	int GetBootySeedValue();
	void StartMatch();
	void CalcResultPoints();
	void InitGame(const string& Options, string* Error);
	void PostLogin(class APlayerController* NewPlayer);
	void STATIC_PrecacheGameSkeletalMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameStaticMeshes(class ALevelInfo* myLevel);
	void STATIC_PrecacheGameTextures(class ALevelInfo* myLevel);
};


// Class WGame.wAlienMaleSoundGroup
// 0x00A8 (0x0110 - 0x0068)
class UwAlienMaleSoundGroup : public UwPawnSoundGroup
{
public:
	string                                             SndAlienHitSound[0x2];                                    // 0x0068(0x000C) (NeedCtorLink)
	string                                             SndAlienMoveHeartBreathSound[0x2];                        // 0x0080(0x000C) (NeedCtorLink)
	string                                             SndAlienHeartBeatDanagerSound[0x2];                       // 0x0098(0x000C) (NeedCtorLink)
	string                                             SndHeartBeatEmergencySound[0x2];                          // 0x00B0(0x000C) (NeedCtorLink)
	string                                             SndFallDanagerSound[0x2];                                 // 0x00C8(0x000C) (NeedCtorLink)
	string                                             SndInfectionTransfer[0x2];                                // 0x00E0(0x000C) (NeedCtorLink)
	string                                             SndUseCoolTimeSkill[0x2];                                 // 0x00F8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAlienMaleSoundGroup");
		return ptr;
	}

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


// Class WGame.wKillerMessagePlus
// 0x0018 (0x0468 - 0x0450)
class AwKillerMessagePlus : public ALocalMessage
{
public:
	string                                             YouKilled;                                                // 0x0450(0x000C) (Edit, Localized, NeedCtorLink)
	string                                             YouKilledTrailer;                                         // 0x045C(0x000C) (Edit, Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wKillerMessagePlus");
		return ptr;
	}


	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
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


// Class WGame.wAIDefencePawn
// 0x0020 (0x18EC - 0x18CC)
class AwAIDefencePawn : public AwAIPawn
{
public:
	bool                                               bReached;                                                 // 0x18CC(0x0004)
	float                                              ReacheRadius;                                             // 0x18D0(0x0004)
	class AwFlagObjectiveBase*                         AttackFlag;                                               // 0x18D4(0x0004)
	class UClass*                                      SpawnEffectExplosion;                                     // 0x18D8(0x0004)
	class UClass*                                      SpawnEffectAttack;                                        // 0x18DC(0x0004)
	FName                                              AttackMotion;                                             // 0x18E0(0x0004)
	int                                                MeshItemID;                                               // 0x18E4(0x0004) (Net)
	int                                                iNpcID;                                                   // 0x18E8(0x0004) (Net)

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
	class UClass* GetBloodHitClass(ECollisionPartsType collisionParts);
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


// Class WGame.wSentryGunPawn
// 0x00B4 (0x1A38 - 0x1984)
class AwSentryGunPawn : public AwBotVehicle
{
public:
	float                                              m_fIdleElapsedTime;                                       // 0x1984(0x0004)
	int                                                m_iHorizontalPositiveAngleRUU;                            // 0x1988(0x0004)
	int                                                m_iHorizontalNagativeAngleRUU;                            // 0x198C(0x0004)
	int                                                m_iVerticalPositiveAngleRUU;                              // 0x1990(0x0004)
	int                                                m_iVerticalNagativeAngleRUU;                              // 0x1994(0x0004)
	bool                                               m_bIdleHorizontalPositiveTurning;                         // 0x1998(0x0004) (Net)
	bool                                               m_bInitSentryGun;                                         // 0x1998(0x0004) (Net)
	bool                                               m_bCalledFunction_InitSentryZuzzleRotationParam;          // 0x1998(0x0004)
	bool                                               m_bCanSeeTarget;                                          // 0x1998(0x0004) (Net)
	FName                                              m_naWeaponIdle;                                           // 0x199C(0x0004)
	FName                                              m_naWeaponDestroy;                                        // 0x19A0(0x0004)
	struct FVector                                     m_vExplosionEffectLocation;                               // 0x19A4(0x000C) (Net)
	struct FSpriteWidget                               MinimapIconAlly;                                          // 0x19B0(0x0040)
	struct FSpriteWidget                               MinimapIconEnemy;                                         // 0x19F0(0x0040)
	class AEmitter*                                    m_BreakDownEmitter;                                       // 0x1A30(0x0004)
	class APawn*                                       m_TargetPawn;                                             // 0x1A34(0x0004) (Net)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wSentryGunPawn");
		return ptr;
	}


	void PlayDyingSound();
	void TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer);
	void SpawnDebris();
	void PlayDirectionalDeath(const struct FVector& HitLoc);
	void StopFiring();
	class UClass* GetBloodHitClass(ECollisionPartsType collisionParts);
	bool UpdateIdleMuzzle(float dt, bool bYaw);
	EMUZZLE_ROTATION_RESULT_TYPE UpdateMuzzleBoneRotation(float dt, class APawn* targetPawn, bool bYaw);
	void Tick_Activate(float dt);
	void InitSentryZuzzleRotationParam();
	void Tick(float Delta);
	void RemoveLevelSentryGun();
	void Destroyed();
	void UnPossessed();
	void AddAllyEffect(int iSideIndex);
	void AddDefaultInventory(bool bQuickslotChange);
	void PostBeginPlay();
};


// Class WGame.wBTR_ArrangeTurret
// 0x0070 (0x0458 - 0x03E8)
class AwBTR_ArrangeTurret : public AwArrangeTurret
{
public:
	bool                                               bSpawnBuildEffect;                                        // 0x03E8(0x0004) (Edit)
	bool                                               BACKUP_bEnabled;                                          // 0x03E8(0x0004)
	bool                                               bSoundsPrecached;                                         // 0x03E8(0x0004)
	bool                                               bResetting;                                               // 0x03E8(0x0004)
	bool                                               bEnabled;                                                 // 0x03E8(0x0004) (Edit)
	bool                                               bVehicleTeamLock;                                         // 0x03E8(0x0004) (Edit)
	bool                                               bEnter_TeamUnlocks;                                       // 0x03E8(0x0004) (Edit)
	bool                                               bHUDTrackVehicle;                                         // 0x03E8(0x0004) (Edit)
	bool                                               bRespawnWhenDestroyed;                                    // 0x03E8(0x0004) (Edit)
	bool                                               bSpawnProtected;                                          // 0x03E8(0x0004) (Edit)
	bool                                               bHighScoreKill;                                           // 0x03E8(0x0004) (Edit)
	bool                                               bKeyVehicle;                                              // 0x03E8(0x0004) (Edit)
	byte                                               VehicleTeam;                                              // 0x03EC(0x0001) (Edit)
	EASVF_TriggeredFunction                            TriggeredFunction;                                        // 0x03ED(0x0001) (Edit)
	byte                                               Padding00[0x2];                                           // 0x03EE(0x0002) MISSED OFFSET
	FName                                              VehicleTag;                                               // 0x03F0(0x0004) (Edit)
	FName                                              VehicleEvent;                                             // 0x03F4(0x0004) (Edit)
	FName                                              VehiclePossessedEvent;                                    // 0x03F8(0x0004) (Edit)
	string                                             VehicleClassStr;                                          // 0x03FC(0x000C) (Edit, NeedCtorLink)
	float                                              RespawnDelay;                                             // 0x0408(0x0004) (Edit)
	int                                                VehicleHealth;                                            // 0x040C(0x0004) (Edit)
	float                                              VehicleDriverDamageMult;                                  // 0x0410(0x0004) (Edit)
	float                                              VehicleDamageMomentumScale;                               // 0x0414(0x0004) (Edit)
	float                                              VehicleLinkHealMult;                                      // 0x0418(0x0004) (Edit)
	class USound*                                      Announcement_Destroyed;                                   // 0x041C(0x0004) (Edit)
	byte                                               VehicleAmbientGlow;                                       // 0x0420(0x0001) (Edit)
	byte                                               Padding01[0x3];                                           // 0x0421(0x0003) MISSED OFFSET
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
	byte SetVehicleTeam();
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
	FName                                              ObjectiveTag[0x6];                                        // 0x0458(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wBTR_Turret_FNM240");
		return ptr;
	}


	void VehicleSpawned();
};


// Class WGame.wAIDefenceBot
// 0x0004 (0x079C - 0x0798)
class AwAIDefenceBot : public AwAIBot
{
public:
	float                                              fLastTimeMeleeAttack;                                     // 0x0798(0x0004)

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
	void SetPawnClass(const string& inClass, const string& InCharacter);
	void NotifyAddDefaultInventory();
	void CallAirStrike(class AController* Caller);
	bool ReadyToMeleeAttack();
};


// Class WGame.wAIDefenceBot_Alpha
// 0x0000 (0x079C - 0x079C)
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


// Class WGame.wAISentryGunController
// 0x0000 (0x0798 - 0x0798)
class AwAISentryGunController : public AwAIBot
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WGame.wAISentryGunController");
		return ptr;
	}


	void Tick(float dt);
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
