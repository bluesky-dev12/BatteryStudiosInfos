#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function Gameplay.AnimNotify_EjectShell.Notify
struct UAnimNotify_EjectShell_Notify_Params
{
	class AActor*                                      Owner;                                                    // (Parm)
};

// Function Gameplay.AnimNotify_ReloadWeapon.Notify
struct UAnimNotify_ReloadWeapon_Notify_Params
{
	class AActor*                                      Owner;                                                    // (Parm)
};

// Function Gameplay.AnimNotify_EjectShell_3rd.Notify
struct UAnimNotify_EjectShell_3rd_Notify_Params
{
	class AActor*                                      Owner;                                                    // (Parm)
};

// Function Gameplay.AnimNotify_EjectShell_Recham.Notify
struct UAnimNotify_EjectShell_Recham_Notify_Params
{
	class AActor*                                      Owner;                                                    // (Parm)
};

// Function Gameplay.Drowned.GetPawnDamageEffect
struct ADrowned_GetPawnDamageEffect_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	float                                              Damage;                                                   // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	class APawn*                                       Victim;                                                   // (Parm)
	bool                                               bLowDetail;                                               // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedController.LeaveScripting
struct AScriptedController_LeaveScripting_Params
{
};

// Function Gameplay.ScriptedController.AdjustAim
struct AScriptedController_AdjustAim_Params
{
	struct FFireProperties                             FiredAmmunition;                                          // (Parm)
	struct FVector                                     projStart;                                                // (Parm)
	int                                                AimError;                                                 // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedController.SetFireYaw
struct AScriptedController_SetFireYaw_Params
{
	int                                                FireYaw;                                                  // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedController.ClearAnimation
struct AScriptedController_ClearAnimation_Params
{
};

// Function Gameplay.ScriptedController.SetNewScript
struct AScriptedController_SetNewScript_Params
{
	class AScriptedSequence*                           NewScript;                                                // (Parm)
};

// Function Gameplay.ScriptedController.ClearScript
struct AScriptedController_ClearScript_Params
{
};

// Function Gameplay.ScriptedController.CheckIfNearPlayer
struct AScriptedController_CheckIfNearPlayer_Params
{
	float                                              Distance;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedController.GetSoundSource
struct AScriptedController_GetSoundSource_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedController.GetInstigator
struct AScriptedController_GetInstigator_Params
{
	class APawn*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedController.GetMyPlayer
struct AScriptedController_GetMyPlayer_Params
{
	class APawn*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedController.DestroyPawn
struct AScriptedController_DestroyPawn_Params
{
};

// Function Gameplay.ScriptedController.SetEnemyReaction
struct AScriptedController_SetEnemyReaction_Params
{
	int                                                AlertnessLevel;                                           // (Parm)
};

// Function Gameplay.ScriptedController.TakeControlOf
struct AScriptedController_TakeControlOf_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function Gameplay.ScriptedController.NotifyJumpApex
struct AScriptedController_NotifyJumpApex_Params
{
};

// Function Gameplay.ScriptedController.SetDoubleJump
struct AScriptedController_SetDoubleJump_Params
{
};

// Function Gameplay.ScriptedController.WeaponFireAgain
struct AScriptedController_WeaponFireAgain_Params
{
	float                                              RefireRate;                                               // (Parm)
	bool                                               bFinishedFire;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedSequence.SetActions
struct AScriptedSequence_SetActions_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
};

// Function Gameplay.ScriptedSequence.ValidAction
struct AScriptedSequence_ValidAction_Params
{
	int                                                N;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedSequence.TakeOver
struct AScriptedSequence_TakeOver_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function Gameplay.ScriptedSequence.CheckForErrors
struct AScriptedSequence_CheckForErrors_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedSequence.SpawnControllerFor
struct AScriptedSequence_SpawnControllerFor_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function Gameplay.ScriptedSequence.Reset
struct AScriptedSequence_Reset_Params
{
};

// Function Gameplay.ScriptedSequence.PostBeginPlay
struct AScriptedSequence_PostBeginPlay_Params
{
};

// Function Gameplay.ScriptedAction.GetActionString
struct UScriptedAction_GetActionString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Gameplay.ScriptedAction.ProceedToSectionEnd
struct UScriptedAction_ProceedToSectionEnd_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
};

// Function Gameplay.ScriptedAction.ProceedToNextAction
struct UScriptedAction_ProceedToNextAction_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
};

// Function Gameplay.ScriptedAction.GetScript
struct UScriptedAction_GetScript_Params
{
	class AScriptedSequence*                           S;                                                        // (Parm)
	class AScriptedSequence*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedAction.StartsSection
struct UScriptedAction_StartsSection_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedAction.EndsSection
struct UScriptedAction_EndsSection_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedAction.InitActionFor
struct UScriptedAction_InitActionFor_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.ScriptedAction.Reset
struct UScriptedAction_Reset_Params
{
};

// Function Gameplay.ScriptedAction.PostBeginPlay
struct UScriptedAction_PostBeginPlay_Params
{
	class AScriptedSequence*                           ss;                                                       // (Parm)
};

// Function Gameplay.ScriptedAction.ActionCompleted
struct UScriptedAction_ActionCompleted_Params
{
};

// Function Gameplay.LatentScriptedAction.GetDistance
struct ULatentScriptedAction_GetDistance_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.GetMoveTargetFor
struct ULatentScriptedAction_GetMoveTargetFor_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.TurnToGoal
struct ULatentScriptedAction_TurnToGoal_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.MoveToGoal
struct ULatentScriptedAction_MoveToGoal_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.StillTicking
struct ULatentScriptedAction_StillTicking_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	float                                              DeltaTime;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.TickedAction
struct ULatentScriptedAction_TickedAction_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.WaitForPlayer
struct ULatentScriptedAction_WaitForPlayer_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.CompleteWhenTimer
struct ULatentScriptedAction_CompleteWhenTimer_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.CompleteOnLIPSincAnim
struct ULatentScriptedAction_CompleteOnLIPSincAnim_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.CompleteOnAnim
struct ULatentScriptedAction_CompleteOnAnim_Params
{
	int                                                Channel;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.CompleteWhenTriggered
struct ULatentScriptedAction_CompleteWhenTriggered_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.InitActionFor
struct ULatentScriptedAction_InitActionFor_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.LatentScriptedAction.DisplayDebug
struct ULatentScriptedAction_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function Gameplay.Action_PLAYANIM.GetActionString
struct UAction_PLAYANIM_GetActionString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Gameplay.Action_PLAYANIM.PawnPlayBaseAnim
struct UAction_PLAYANIM_PawnPlayBaseAnim_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	bool                                               bFirstPlay;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.Action_PLAYANIM.SetCurrentAnimationFor
struct UAction_PLAYANIM_SetCurrentAnimationFor_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
};

// Function Gameplay.Action_PLAYANIM.InitActionFor
struct UAction_PLAYANIM_InitActionFor_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.Action_MOVETOPOINT.GetActionString
struct UAction_MOVETOPOINT_GetActionString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Gameplay.Action_MOVETOPOINT.GetMoveTargetFor
struct UAction_MOVETOPOINT_GetMoveTargetFor_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.Action_MOVETOPOINT.MoveToGoal
struct UAction_MOVETOPOINT_MoveToGoal_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.Action_WAITFORTIMER.GetActionString
struct UAction_WAITFORTIMER_GetActionString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function Gameplay.Action_WAITFORTIMER.CompleteWhenTimer
struct UAction_WAITFORTIMER_CompleteWhenTimer_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.Action_WAITFORTIMER.CompleteWhenTriggered
struct UAction_WAITFORTIMER_CompleteWhenTriggered_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.Action_WAITFORTIMER.InitActionFor
struct UAction_WAITFORTIMER_InitActionFor_Params
{
	class AScriptedController*                         C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function Gameplay.Counter.Trigger
struct ACounter_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function Gameplay.Counter.Reset
struct ACounter_Reset_Params
{
};

// Function Gameplay.Counter.BeginPlay
struct ACounter_BeginPlay_Params
{
};

// Function Gameplay.ActionMessage.GetString
struct AActionMessage_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
