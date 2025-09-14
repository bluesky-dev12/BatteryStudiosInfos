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
// 0x0034 (0x0654 - 0x0620)
class AScriptedController : public AAIController
{
public:
	class AController*                                 PendingController;                                        // 0x0620(0x0004)
	int                                                ActionNum;                                                // 0x0624(0x0004)
	int                                                AnimsRemaining;                                           // 0x0628(0x0004)
	class AScriptedSequence*                           SequenceScript;                                           // 0x062C(0x0004)
	class ULatentScriptedAction*                       CurrentAction;                                            // 0x0630(0x0004)
	class UAction_PLAYANIM*                            CurrentAnimation;                                         // 0x0634(0x0004)
	bool                                               bChangingPawns;                                           // 0x0638(0x0004)
	bool                                               bBroken;                                                  // 0x0638(0x0004)
	bool                                               bShootTarget;                                             // 0x0638(0x0004)
	bool                                               bShootSpray;                                              // 0x0638(0x0004)
	bool                                               bPendingShoot;                                            // 0x0638(0x0004)
	bool                                               bFakeShot;                                                // 0x0638(0x0004)
	bool                                               bUseScriptFacing;                                         // 0x0638(0x0004)
	bool                                               bPendingDoubleJump;                                       // 0x0638(0x0004)
	bool                                               bFineWeaponControl;                                       // 0x0638(0x0004)
	class AActor*                                      ScriptedFocus;                                            // 0x063C(0x0004)
	class APlayerController*                           MyPlayerController;                                       // 0x0640(0x0004)
	int                                                NumShots;                                                 // 0x0644(0x0004)
	FName                                              FiringMode;                                               // 0x0648(0x0004)
	int                                                IterationCounter;                                         // 0x064C(0x0004)
	int                                                IterationSectionStart;                                    // 0x0650(0x0004)

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
	class UScriptedAction*[]                           Actions;                                                  // 0x03E4(0x000C) (Edit, ExportObject, NeedCtorLink, EditInline)
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
	string                                             ActionString;                                             // 0x002C(0x000C) (Localized, NeedCtorLink)
	bool                                               bValidForTrigger;                                         // 0x0038(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ScriptedAction");
		return ptr;
	}


	string GetActionString();
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
	FName                                              BaseAnim;                                                 // 0x003C(0x0004) (Edit)
	float                                              BlendInTime;                                              // 0x0040(0x0004) (Edit)
	float                                              BlendOutTime;                                             // 0x0044(0x0004) (Edit)
	float                                              AnimRate;                                                 // 0x0048(0x0004) (Edit)
	byte                                               AnimIterations;                                           // 0x004C(0x0001) (Edit)
	byte                                               Padding00[0x3];                                           // 0x004D(0x0003) MISSED OFFSET
	bool                                               bLoopAnim;                                                // 0x0050(0x0004) (Edit)
	float                                              StartFrame;                                               // 0x0054(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Action_PLAYANIM");
		return ptr;
	}


	string GetActionString();
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
	FName                                              DestinationTag;                                           // 0x003C(0x0004) (Edit)
	class AActor*                                      MoveTarget;                                               // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Action_MOVETOPOINT");
		return ptr;
	}


	string GetActionString();
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


	string GetActionString();
	bool CompleteWhenTimer();
	bool CompleteWhenTriggered();
	bool InitActionFor(class AScriptedController* C);
};


// Class Gameplay.ScriptedTrigger
// 0x0004 (0x03F8 - 0x03F4)
class AScriptedTrigger : public AScriptedSequence
{
public:
	class AScriptedTriggerController*                  TriggerController;                                        // 0x03F4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ScriptedTrigger");
		return ptr;
	}


	void Reset();
	bool ValidAction(int N);
	bool TriggersEvent(const FName& E);
	FName NextNeededEvent();
	void PostBeginPlay();
};


// Class Gameplay.ScriptedTriggerController
// 0x0000 (0x0654 - 0x0654)
class AScriptedTriggerController : public AScriptedController
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ScriptedTriggerController");
		return ptr;
	}


	void SetNewScript(class AScriptedSequence* NewScript);
	void ClearAnimation();
	void DestroyPawn();
	void ClientRoundEnded();
	void RoundHasEnded();
	void ClientGameEnded();
	void GameHasEnded();
	void InitializeFor(class AScriptedTrigger* t);
};


// Class Gameplay.Action_TRIGGEREVENT
// 0x0004 (0x0040 - 0x003C)
class UAction_TRIGGEREVENT : public UScriptedAction
{
public:
	FName                                              Event;                                                    // 0x003C(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Action_TRIGGEREVENT");
		return ptr;
	}


	string GetActionString();
	bool InitActionFor(class AScriptedController* C);
};


// Class Gameplay.Action_WAITFOREVENT
// 0x0008 (0x0044 - 0x003C)
class UAction_WAITFOREVENT : public ULatentScriptedAction
{
public:
	FName                                              ExternalEvent;                                            // 0x003C(0x0004) (Edit)
	class ATriggeredCondition*                         t;                                                        // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.Action_WAITFOREVENT");
		return ptr;
	}


	string GetActionString();
	bool CompleteWhenTriggered();
	bool InitActionFor(class AScriptedController* C);
};


// Class Gameplay.TriggeredCondition
// 0x0004 (0x03DC - 0x03D8)
class ATriggeredCondition : public ATriggers
{
public:
	bool                                               bToggled;                                                 // 0x03D8(0x0004) (Edit)
	bool                                               bEnabled;                                                 // 0x03D8(0x0004) (Edit)
	bool                                               bTriggerControlled;                                       // 0x03D8(0x0004) (Edit)
	bool                                               bInitialValue;                                            // 0x03D8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.TriggeredCondition");
		return ptr;
	}


	void UnTrigger(class AActor* Other, class APawn* EventInstigator);
	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void Reset();
	void PostBeginPlay();
};


// Class Gameplay.ActionMessage
// 0x0180 (0x05D0 - 0x0450)
class AActionMessage : public ACriticalEventPlus
{
public:
	string                                             Messages[0x20];                                           // 0x0450(0x000C) (Localized, NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class Gameplay.ActionMessage");
		return ptr;
	}


	string STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
