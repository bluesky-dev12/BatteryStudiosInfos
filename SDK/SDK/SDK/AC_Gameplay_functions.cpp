// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function Gameplay.AnimNotify_EjectShell.Notify
// (Defined, Simulated, Event, Public)
// Parameters:
// class AActor*                  Owner                          (Parm)

void UAnimNotify_EjectShell::Notify(class AActor* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.AnimNotify_EjectShell.Notify");

	UAnimNotify_EjectShell_Notify_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.AnimNotify_ReloadWeapon.Notify
// (Defined, Simulated, Event, Public)
// Parameters:
// class AActor*                  Owner                          (Parm)

void UAnimNotify_ReloadWeapon::Notify(class AActor* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.AnimNotify_ReloadWeapon.Notify");

	UAnimNotify_ReloadWeapon_Notify_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.AnimNotify_EjectShell_3rd.Notify
// (Defined, Simulated, Event, Public)
// Parameters:
// class AActor*                  Owner                          (Parm)

void UAnimNotify_EjectShell_3rd::Notify(class AActor* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.AnimNotify_EjectShell_3rd.Notify");

	UAnimNotify_EjectShell_3rd_Notify_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.AnimNotify_EjectShell_Recham.Notify
// (Defined, Simulated, Event, Public)
// Parameters:
// class AActor*                  Owner                          (Parm)

void UAnimNotify_EjectShell_Recham::Notify(class AActor* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.AnimNotify_EjectShell_Recham.Notify");

	UAnimNotify_EjectShell_Recham_Notify_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.Drowned.GetPawnDamageEffect
// (Defined, Static, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// float                          Damage                         (Parm)
// struct FVector                 Momentum                       (Parm)
// class APawn*                   Victim                         (Parm)
// bool                           bLowDetail                     (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* ADrowned::STATIC_GetPawnDamageEffect(const struct FVector& HitLocation, float Damage, const struct FVector& Momentum, class APawn* Victim, bool bLowDetail)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Drowned.GetPawnDamageEffect");

	ADrowned_GetPawnDamageEffect_Params params;
	params.HitLocation = HitLocation;
	params.Damage = Damage;
	params.Momentum = Momentum;
	params.Victim = Victim;
	params.bLowDetail = bLowDetail;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedController.LeaveScripting
// (Public)

void AScriptedController::LeaveScripting()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.LeaveScripting");

	AScriptedController_LeaveScripting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.AdjustAim
// (Defined, Public)
// Parameters:
// struct FFireProperties         FiredAmmunition                (Parm)
// struct FVector                 projStart                      (Parm)
// int                            AimError                       (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AScriptedController::AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.AdjustAim");

	AScriptedController_AdjustAim_Params params;
	params.FiredAmmunition = FiredAmmunition;
	params.projStart = projStart;
	params.AimError = AimError;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedController.SetFireYaw
// (Defined, Public)
// Parameters:
// int                            FireYaw                        (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AScriptedController::SetFireYaw(int FireYaw)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.SetFireYaw");

	AScriptedController_SetFireYaw_Params params;
	params.FireYaw = FireYaw;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedController.ClearAnimation
// (Defined, Public)

void AScriptedController::ClearAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.ClearAnimation");

	AScriptedController_ClearAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.SetNewScript
// (Defined, Public)
// Parameters:
// class AScriptedSequence*       NewScript                      (Parm)

void AScriptedController::SetNewScript(class AScriptedSequence* NewScript)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.SetNewScript");

	AScriptedController_SetNewScript_Params params;
	params.NewScript = NewScript;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.ClearScript
// (Defined, Public)

void AScriptedController::ClearScript()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.ClearScript");

	AScriptedController_ClearScript_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.CheckIfNearPlayer
// (Defined, Public)
// Parameters:
// float                          Distance                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AScriptedController::CheckIfNearPlayer(float Distance)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.CheckIfNearPlayer");

	AScriptedController_CheckIfNearPlayer_Params params;
	params.Distance = Distance;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedController.GetSoundSource
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AScriptedController::GetSoundSource()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.GetSoundSource");

	AScriptedController_GetSoundSource_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedController.GetInstigator
// (Defined, Public)
// Parameters:
// class APawn*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class APawn* AScriptedController::GetInstigator()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.GetInstigator");

	AScriptedController_GetInstigator_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedController.GetMyPlayer
// (Defined, Public)
// Parameters:
// class APawn*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class APawn* AScriptedController::GetMyPlayer()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.GetMyPlayer");

	AScriptedController_GetMyPlayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedController.DestroyPawn
// (Defined, Public)

void AScriptedController::DestroyPawn()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.DestroyPawn");

	AScriptedController_DestroyPawn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.SetEnemyReaction
// (Public)
// Parameters:
// int                            AlertnessLevel                 (Parm)

void AScriptedController::SetEnemyReaction(int AlertnessLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.SetEnemyReaction");

	AScriptedController_SetEnemyReaction_Params params;
	params.AlertnessLevel = AlertnessLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.TakeControlOf
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AScriptedController::TakeControlOf(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.TakeControlOf");

	AScriptedController_TakeControlOf_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.NotifyJumpApex
// (Defined, Event, Public)

void AScriptedController::NotifyJumpApex()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.NotifyJumpApex");

	AScriptedController_NotifyJumpApex_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.SetDoubleJump
// (Defined, Public)

void AScriptedController::SetDoubleJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.SetDoubleJump");

	AScriptedController_SetDoubleJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedController.WeaponFireAgain
// (Defined, Public)
// Parameters:
// float                          RefireRate                     (Parm)
// bool                           bFinishedFire                  (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AScriptedController::WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedController.WeaponFireAgain");

	AScriptedController_WeaponFireAgain_Params params;
	params.RefireRate = RefireRate;
	params.bFinishedFire = bFinishedFire;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedSequence.SetActions
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)

void AScriptedSequence::SetActions(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedSequence.SetActions");

	AScriptedSequence_SetActions_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedSequence.ValidAction
// (Defined, Public)
// Parameters:
// int                            N                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AScriptedSequence::ValidAction(int N)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedSequence.ValidAction");

	AScriptedSequence_ValidAction_Params params;
	params.N = N;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedSequence.TakeOver
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AScriptedSequence::TakeOver(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedSequence.TakeOver");

	AScriptedSequence_TakeOver_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedSequence.CheckForErrors
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AScriptedSequence::CheckForErrors()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedSequence.CheckForErrors");

	AScriptedSequence_CheckForErrors_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedSequence.SpawnControllerFor
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AScriptedSequence::SpawnControllerFor(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedSequence.SpawnControllerFor");

	AScriptedSequence_SpawnControllerFor_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedSequence.Reset
// (Defined, Event, Public)

void AScriptedSequence::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedSequence.Reset");

	AScriptedSequence_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedSequence.PostBeginPlay
// (Defined, Public)

void AScriptedSequence::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedSequence.PostBeginPlay");

	AScriptedSequence_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedAction.GetActionString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UScriptedAction::GetActionString()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.GetActionString");

	UScriptedAction_GetActionString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedAction.ProceedToSectionEnd
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)

void UScriptedAction::ProceedToSectionEnd(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.ProceedToSectionEnd");

	UScriptedAction_ProceedToSectionEnd_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedAction.ProceedToNextAction
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)

void UScriptedAction::ProceedToNextAction(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.ProceedToNextAction");

	UScriptedAction_ProceedToNextAction_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedAction.GetScript
// (Defined, Public)
// Parameters:
// class AScriptedSequence*       S                              (Parm)
// class AScriptedSequence*       ReturnValue                    (Parm, OutParm, ReturnParm)

class AScriptedSequence* UScriptedAction::GetScript(class AScriptedSequence* S)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.GetScript");

	UScriptedAction_GetScript_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedAction.StartsSection
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UScriptedAction::StartsSection()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.StartsSection");

	UScriptedAction_StartsSection_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedAction.EndsSection
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UScriptedAction::EndsSection()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.EndsSection");

	UScriptedAction_EndsSection_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedAction.InitActionFor
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UScriptedAction::InitActionFor(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.InitActionFor");

	UScriptedAction_InitActionFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.ScriptedAction.Reset
// (Event, Public)

void UScriptedAction::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.Reset");

	UScriptedAction_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedAction.PostBeginPlay
// (Event, Public)
// Parameters:
// class AScriptedSequence*       ss                             (Parm)

void UScriptedAction::PostBeginPlay(class AScriptedSequence* ss)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.PostBeginPlay");

	UScriptedAction_PostBeginPlay_Params params;
	params.ss = ss;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ScriptedAction.ActionCompleted
// (Event, Public)

void UScriptedAction::ActionCompleted()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ScriptedAction.ActionCompleted");

	UScriptedAction_ActionCompleted_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.LatentScriptedAction.GetDistance
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ULatentScriptedAction::GetDistance()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.GetDistance");

	ULatentScriptedAction_GetDistance_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.GetMoveTargetFor
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ULatentScriptedAction::GetMoveTargetFor(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.GetMoveTargetFor");

	ULatentScriptedAction_GetMoveTargetFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.TurnToGoal
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::TurnToGoal()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.TurnToGoal");

	ULatentScriptedAction_TurnToGoal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.MoveToGoal
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::MoveToGoal()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.MoveToGoal");

	ULatentScriptedAction_MoveToGoal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.StillTicking
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// float                          DeltaTime                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::StillTicking(class AScriptedController* C, float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.StillTicking");

	ULatentScriptedAction_StillTicking_Params params;
	params.C = C;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.TickedAction
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::TickedAction()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.TickedAction");

	ULatentScriptedAction_TickedAction_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.WaitForPlayer
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::WaitForPlayer()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.WaitForPlayer");

	ULatentScriptedAction_WaitForPlayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.CompleteWhenTimer
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::CompleteWhenTimer()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.CompleteWhenTimer");

	ULatentScriptedAction_CompleteWhenTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.CompleteOnLIPSincAnim
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::CompleteOnLIPSincAnim()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.CompleteOnLIPSincAnim");

	ULatentScriptedAction_CompleteOnLIPSincAnim_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.CompleteOnAnim
// (Defined, Public)
// Parameters:
// int                            Channel                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::CompleteOnAnim(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.CompleteOnAnim");

	ULatentScriptedAction_CompleteOnAnim_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.CompleteWhenTriggered
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::CompleteWhenTriggered()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.CompleteWhenTriggered");

	ULatentScriptedAction_CompleteWhenTriggered_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.InitActionFor
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ULatentScriptedAction::InitActionFor(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.InitActionFor");

	ULatentScriptedAction_InitActionFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.LatentScriptedAction.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void ULatentScriptedAction::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.LatentScriptedAction.DisplayDebug");

	ULatentScriptedAction_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function Gameplay.Action_PLAYANIM.GetActionString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UAction_PLAYANIM::GetActionString()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_PLAYANIM.GetActionString");

	UAction_PLAYANIM_GetActionString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_PLAYANIM.PawnPlayBaseAnim
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// bool                           bFirstPlay                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UAction_PLAYANIM::PawnPlayBaseAnim(class AScriptedController* C, bool bFirstPlay)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_PLAYANIM.PawnPlayBaseAnim");

	UAction_PLAYANIM_PawnPlayBaseAnim_Params params;
	params.C = C;
	params.bFirstPlay = bFirstPlay;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_PLAYANIM.SetCurrentAnimationFor
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)

void UAction_PLAYANIM::SetCurrentAnimationFor(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_PLAYANIM.SetCurrentAnimationFor");

	UAction_PLAYANIM_SetCurrentAnimationFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.Action_PLAYANIM.InitActionFor
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UAction_PLAYANIM::InitActionFor(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_PLAYANIM.InitActionFor");

	UAction_PLAYANIM_InitActionFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_MOVETOPOINT.GetActionString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UAction_MOVETOPOINT::GetActionString()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_MOVETOPOINT.GetActionString");

	UAction_MOVETOPOINT_GetActionString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_MOVETOPOINT.GetMoveTargetFor
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* UAction_MOVETOPOINT::GetMoveTargetFor(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_MOVETOPOINT.GetMoveTargetFor");

	UAction_MOVETOPOINT_GetMoveTargetFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_MOVETOPOINT.MoveToGoal
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UAction_MOVETOPOINT::MoveToGoal()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_MOVETOPOINT.MoveToGoal");

	UAction_MOVETOPOINT_MoveToGoal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_WAITFORTIMER.GetActionString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UAction_WAITFORTIMER::GetActionString()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_WAITFORTIMER.GetActionString");

	UAction_WAITFORTIMER_GetActionString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_WAITFORTIMER.CompleteWhenTimer
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UAction_WAITFORTIMER::CompleteWhenTimer()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_WAITFORTIMER.CompleteWhenTimer");

	UAction_WAITFORTIMER_CompleteWhenTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_WAITFORTIMER.CompleteWhenTriggered
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UAction_WAITFORTIMER::CompleteWhenTriggered()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_WAITFORTIMER.CompleteWhenTriggered");

	UAction_WAITFORTIMER_CompleteWhenTriggered_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Action_WAITFORTIMER.InitActionFor
// (Defined, Public)
// Parameters:
// class AScriptedController*     C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UAction_WAITFORTIMER::InitActionFor(class AScriptedController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Action_WAITFORTIMER.InitActionFor");

	UAction_WAITFORTIMER_InitActionFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function Gameplay.Counter.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void ACounter::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Counter.Trigger");

	ACounter_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.Counter.Reset
// (Defined, Public)

void ACounter::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Counter.Reset");

	ACounter_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.Counter.BeginPlay
// (Defined, Public)

void ACounter::BeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.Counter.BeginPlay");

	ACounter_BeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function Gameplay.ActionMessage.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AActionMessage::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function Gameplay.ActionMessage.GetString");

	AActionMessage_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
