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

// Class Gameplay.AnimNotify_EjectShell
// 0x0000 (0x0030 - 0x0030)
class UAnimNotify_EjectShell : public UAnimNotify_Scripted
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.AnimNotify_EjectShell");
		return ptr;
	}


	void Notify(class AActor* Owner);
};


// Class Gameplay.AnimNotify_ReloadWeapon
// 0x0000 (0x0030 - 0x0030)
class UAnimNotify_ReloadWeapon : public UAnimNotify_Scripted
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.AnimNotify_ReloadWeapon");
		return ptr;
	}


	void Notify(class AActor* Owner);
};


// Class Gameplay.AnimNotify_EjectShell_3rd
// 0x0000 (0x0030 - 0x0030)
class UAnimNotify_EjectShell_3rd : public UAnimNotify_Scripted
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.AnimNotify_EjectShell_3rd");
		return ptr;
	}


	void Notify(class AActor* Owner);
};


// Class Gameplay.AnimNotify_EjectShell_Recham
// 0x0000 (0x0030 - 0x0030)
class UAnimNotify_EjectShell_Recham : public UAnimNotify_Scripted
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.AnimNotify_EjectShell_Recham");
		return ptr;
	}


	void Notify(class AActor* Owner);
};


// Class Gameplay.Drowned
// 0x0000 (0x04A4 - 0x04A4)
class ADrowned : public ADamageType
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Drowned");
		return ptr;
	}


	class UClass* STATIC_GetPawnDamageEffect(const struct FVector& HitLocation, float Damage, const struct FVector& Momentum, class APawn* Victim, bool bLowDetail);
};


// Class Gameplay.ScriptedController
// 0x0034 (0x0650 - 0x061C)
class AScriptedController : public AAIController
{
public:
	class AController*                                 PendingController;                                        // 0x061C(0x0004)
	int                                                ActionNum;                                                // 0x0620(0x0004)
	int                                                AnimsRemaining;                                           // 0x0624(0x0004)
	class AScriptedSequence*                           SequenceScript;                                           // 0x0628(0x0004)
	class ULatentScriptedAction*                       CurrentAction;                                            // 0x062C(0x0004)
	class UAction_PLAYANIM*                            CurrentAnimation;                                         // 0x0630(0x0004)
	unsigned long                                      bBroken : 1;                                              // 0x0634(0x0004)
	unsigned long                                      bShootTarget : 1;                                         // 0x0634(0x0004)
	unsigned long                                      bShootSpray : 1;                                          // 0x0634(0x0004)
	unsigned long                                      bPendingShoot : 1;                                        // 0x0634(0x0004)
	unsigned long                                      bFakeShot : 1;                                            // 0x0634(0x0004)
	unsigned long                                      bUseScriptFacing : 1;                                     // 0x0634(0x0004)
	unsigned long                                      bPendingDoubleJump : 1;                                   // 0x0634(0x0004)
	unsigned long                                      bFineWeaponControl : 1;                                   // 0x0634(0x0004)
	unsigned long                                      bChangingPawns : 1;                                       // 0x0634(0x0004)
	class AActor*                                      ScriptedFocus;                                            // 0x0638(0x0004)
	class APlayerController*                           MyPlayerController;                                       // 0x063C(0x0004)
	int                                                NumShots;                                                 // 0x0640(0x0004)
	struct FName                                       FiringMode;                                               // 0x0644(0x0004)
	int                                                IterationCounter;                                         // 0x0648(0x0004)
	int                                                IterationSectionStart;                                    // 0x064C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ScriptedController");
		return ptr;
	}


	void LeaveScripting();
	struct FRotator AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError);
	int SetFireYaw(int FireYaw);
	void ClearAnimation();
	void SetNewScript(class AScriptedSequence* NewScript);
	void ClearScript();
	bool CheckIfNearPlayer(float Distance);
	class AActor* GetSoundSource();
	class APawn* GetInstigator();
	class APawn* GetMyPlayer();
	void DestroyPawn();
	void SetEnemyReaction(int AlertnessLevel);
	void TakeControlOf(class APawn* aPawn);
	void NotifyJumpApex();
	void SetDoubleJump();
	bool WeaponFireAgain(float RefireRate, bool bFinishedFire);
};


// Class Gameplay.ScriptedSequence
// 0x0010 (0x03F4 - 0x03E4)
class AScriptedSequence : public AAIScript
{
public:
	TArray<class UScriptedAction*>                     Actions;                                                  // 0x03E4(0x000C) (Edit, ExportObject, NeedCtorLink, EditInline)
	class UClass*                                      ScriptControllerClass;                                    // 0x03F0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ScriptedSequence");
		return ptr;
	}


	void SetActions(class AScriptedController* C);
	bool ValidAction(int N);
	void TakeOver(class APawn* P);
	bool CheckForErrors();
	void SpawnControllerFor(class APawn* P);
	void Reset();
	void PostBeginPlay();
};


// Class Gameplay.ScriptedAction
// 0x0010 (0x003C - 0x002C)
class UScriptedAction : public UObject
{
public:
	struct FString                                     ActionString;                                             // 0x002C(0x000C) (Localized, NeedCtorLink)
	unsigned long                                      bValidForTrigger : 1;                                     // 0x0038(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ScriptedAction");
		return ptr;
	}


	struct FString GetActionString();
	void ProceedToSectionEnd(class AScriptedController* C);
	void ProceedToNextAction(class AScriptedController* C);
	class AScriptedSequence* GetScript(class AScriptedSequence* S);
	bool StartsSection();
	bool EndsSection();
	bool InitActionFor(class AScriptedController* C);
	void Reset();
	void PostBeginPlay(class AScriptedSequence* ss);
	void ActionCompleted();
};


// Class Gameplay.LatentScriptedAction
// 0x0000 (0x003C - 0x003C)
class ULatentScriptedAction : public UScriptedAction
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.LatentScriptedAction");
		return ptr;
	}


	float GetDistance();
	class AActor* GetMoveTargetFor(class AScriptedController* C);
	bool TurnToGoal();
	bool MoveToGoal();
	bool StillTicking(class AScriptedController* C, float DeltaTime);
	bool TickedAction();
	bool WaitForPlayer();
	bool CompleteWhenTimer();
	bool CompleteOnLIPSincAnim();
	bool CompleteOnAnim(int Channel);
	bool CompleteWhenTriggered();
	bool InitActionFor(class AScriptedController* C);
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
};


// Class Gameplay.Action_PLAYANIM
// 0x001C (0x0058 - 0x003C)
class UAction_PLAYANIM : public UScriptedAction
{
public:
	struct FName                                       BaseAnim;                                                 // 0x003C(0x0004) (Edit)
	float                                              BlendInTime;                                              // 0x0040(0x0004) (Edit)
	float                                              BlendOutTime;                                             // 0x0044(0x0004) (Edit)
	float                                              AnimRate;                                                 // 0x0048(0x0004) (Edit)
	unsigned char                                      AnimIterations;                                           // 0x004C(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x004D(0x0003) MISSED OFFSET
	unsigned long                                      bLoopAnim : 1;                                            // 0x0050(0x0004) (Edit)
	float                                              StartFrame;                                               // 0x0054(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Action_PLAYANIM");
		return ptr;
	}


	struct FString GetActionString();
	bool PawnPlayBaseAnim(class AScriptedController* C, bool bFirstPlay);
	void SetCurrentAnimationFor(class AScriptedController* C);
	bool InitActionFor(class AScriptedController* C);
};


// Class Gameplay.CriticalEventPlus
// 0x0000 (0x0450 - 0x0450)
class ACriticalEventPlus : public ALocalMessage
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.CriticalEventPlus");
		return ptr;
	}

};


// Class Gameplay.Action_MOVETOPOINT
// 0x0008 (0x0044 - 0x003C)
class UAction_MOVETOPOINT : public ULatentScriptedAction
{
public:
	struct FName                                       DestinationTag;                                           // 0x003C(0x0004) (Edit)
	class AActor*                                      MoveTarget;                                               // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Action_MOVETOPOINT");
		return ptr;
	}


	struct FString GetActionString();
	class AActor* GetMoveTargetFor(class AScriptedController* C);
	bool MoveToGoal();
};


// Class Gameplay.Action_WAITFORTIMER
// 0x0004 (0x0040 - 0x003C)
class UAction_WAITFORTIMER : public ULatentScriptedAction
{
public:
	float                                              PauseTime;                                                // 0x003C(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Action_WAITFORTIMER");
		return ptr;
	}


	struct FString GetActionString();
	bool CompleteWhenTimer();
	bool CompleteWhenTriggered();
	bool InitActionFor(class AScriptedController* C);
};


// Class Gameplay.Sunlight
// 0x0000 (0x03EC - 0x03EC)
class ASunlight : public ALight
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Sunlight");
		return ptr;
	}

};


// Class Gameplay.Counter
// 0x0030 (0x0408 - 0x03D8)
class ACounter : public ATriggers
{
public:
	unsigned char                                      NumToCount;                                               // 0x03D8(0x0001) (Edit)
	unsigned char                                      UnknownData00[0x3];                                       // 0x03D9(0x0003) MISSED OFFSET
	unsigned long                                      bShowMessage : 1;                                         // 0x03DC(0x0004) (Edit)
	struct FString                                     CountMessage;                                             // 0x03E0(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     CompleteMessage;                                          // 0x03EC(0x000C) (Edit, Localized, NeedCtorLink)
	unsigned char                                      OriginalNum;                                              // 0x03F8(0x0001)
	unsigned char                                      UnknownData01[0x3];                                       // 0x03F9(0x0003) MISSED OFFSET
	class USound*                                      CountSound;                                               // 0x03FC(0x0004) (Edit)
	class USound*                                      CountAmbientSound;                                        // 0x0400(0x0004) (Edit)
	class USound*                                      LoopSound;                                                // 0x0404(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Counter");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void Reset();
	void BeginPlay();
};


// Class Gameplay.ActionMessage
// 0x0180 (0x05D0 - 0x0450)
class AActionMessage : public ACriticalEventPlus
{
public:
	struct FString                                     Messages[0x20];                                           // 0x0450(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ActionMessage");
		return ptr;
	}


	struct FString STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
