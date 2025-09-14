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

// Function UnrealGame.UnrealPawn.SpawnGibs
struct AUnrealPawn_SpawnGibs_Params
{
	struct FRotator                                    HitRotation;                                              // (Parm)
	float                                              ChunkPerterbation;                                        // (Parm)
};

// Function UnrealGame.UnrealPawn.ChunkUp
struct AUnrealPawn_ChunkUp_Params
{
	struct FRotator                                    HitRotation;                                              // (Parm)
	float                                              ChunkPerterbation;                                        // (Parm)
};

// Function UnrealGame.UnrealPawn.PlayFootStep
struct AUnrealPawn_PlayFootStep_Params
{
	int                                                side;                                                     // (Parm)
};

// Function UnrealGame.UnrealPawn.IncrementSpree
struct AUnrealPawn_IncrementSpree_Params
{
};

// Function UnrealGame.UnrealPawn.GetSpree
struct AUnrealPawn_GetSpree_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.TakeDrowningDamage
struct AUnrealPawn_TakeDrowningDamage_Params
{
};

// Function UnrealGame.UnrealPawn.SetMovementPhysics
struct AUnrealPawn_SetMovementPhysics_Params
{
};

// Function UnrealGame.UnrealPawn.GetPlacedRoster
struct AUnrealPawn_GetPlacedRoster_Params
{
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.PostNetBeginPlay
struct AUnrealPawn_PostNetBeginPlay_Params
{
};

// Function UnrealGame.UnrealPawn.PostBeginPlay
struct AUnrealPawn_PostBeginPlay_Params
{
};

// Function UnrealGame.UnrealPawn.Dodge
struct AUnrealPawn_Dodge_Params
{
	TEnumAsByte<EDoubleClickDir>                       DoubleClickMove;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.PerformDodge
struct AUnrealPawn_PerformDodge_Params
{
	TEnumAsByte<EDoubleClickDir>                       DoubleClickMove;                                          // (Parm)
	struct FVector                                     Dir;                                                      // (Parm)
	struct FVector                                     Cross;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.CreateInventory
struct AUnrealPawn_CreateInventory_Params
{
	struct FString                                     InventoryClassName;                                       // (Parm, NeedCtorLink)
	class AInventory*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.CustomCreateInventory
struct AUnrealPawn_CustomCreateInventory_Params
{
	struct FString                                     WeaponClassName;                                          // (Parm, NeedCtorLink)
	class AInventory*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.AddDefaultInventory
struct AUnrealPawn_AddDefaultInventory_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPawn.AddDefaultInventoryDOA
struct AUnrealPawn_AddDefaultInventoryDOA_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPawn.IsInLoadout
struct AUnrealPawn_IsInLoadout_Params
{
	class UClass*                                      InventoryClass;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.CheckBob
struct AUnrealPawn_CheckBob_Params
{
	float                                              DeltaTime;                                                // (Parm)
	struct FVector                                     Y;                                                        // (Parm)
};

// Function UnrealGame.UnrealPawn.GetWeaponBoneFor
struct AUnrealPawn_GetWeaponBoneFor_Params
{
	class AInventory*                                  i;                                                        // (Parm)
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.GetDebugName
struct AUnrealPawn_GetDebugName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealPawn.SetAnimAction
struct AUnrealPawn_SetAnimAction_Params
{
	struct FName                                       NewAction;                                                // (Parm)
};

// Function UnrealGame.UnrealPawn.ShouldUnCrouch
struct AUnrealPawn_ShouldUnCrouch_Params
{
};

// Function UnrealGame.UnrealPawn.EndJump
struct AUnrealPawn_EndJump_Params
{
};

// Function UnrealGame.UnrealPawn.HoldGameObject
struct AUnrealPawn_HoldGameObject_Params
{
	class AGameObject*                                 gameObj;                                                  // (Parm)
	struct FName                                       GameObjBone;                                              // (Parm)
};

// Function UnrealGame.UnrealPawn.HoldFlag
struct AUnrealPawn_HoldFlag_Params
{
	class AActor*                                      FlagActor;                                                // (Parm)
};

// Function UnrealGame.UnrealPawn.BotDodge
struct AUnrealPawn_BotDodge_Params
{
	struct FVector                                     Dir;                                                      // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.DisplayDebug
struct AUnrealPawn_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function UnrealGame.UnrealPawn.gibbedBy
struct AUnrealPawn_gibbedBy_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.UnrealPawn.FindValidTaunt
struct AUnrealPawn_FindValidTaunt_Params
{
	struct FName                                       Sequence;                                                 // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPawn.DropFlag
struct AUnrealPawn_DropFlag_Params
{
	struct FString                                     sReason;                                                  // (OptionalParm, Parm, NeedCtorLink)
};

// Function UnrealGame.RosterEntry.InitBot
struct URosterEntry_InitBot_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.RosterEntry.RecommendAttack
struct URosterEntry_RecommendAttack_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RosterEntry.RecommendFreelance
struct URosterEntry_RecommendFreelance_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RosterEntry.RecommendDefense
struct URosterEntry_RecommendDefense_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RosterEntry.NoRecommendation
struct URosterEntry_NoRecommendation_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RosterEntry.RecommendSupport
struct URosterEntry_RecommendSupport_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RosterEntry.SetOrders
struct URosterEntry_SetOrders_Params
{
	TEnumAsByte<EPlayerPos>                            Position;                                                 // (Parm)
};

// Function UnrealGame.RosterEntry.PrecacheRosterFor
struct URosterEntry_PrecacheRosterFor_Params
{
	class AUnrealTeamInfo*                             t;                                                        // (Parm)
};

// Function UnrealGame.RosterEntry.Init
struct URosterEntry_Init_Params
{
};

// Function UnrealGame.UnrealMPGameInfo.MultiMinPlayers
struct AUnrealMPGameInfo_MultiMinPlayers_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.GetDescriptionText
struct AUnrealMPGameInfo_GetDescriptionText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealMPGameInfo.FillPlayInfo
struct AUnrealMPGameInfo_FillPlayInfo_Params
{
	class UPlayInfo*                                   PlayInfo;                                                 // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.GenerateBotOptions
struct AUnrealMPGameInfo_GenerateBotOptions_Params
{
	bool                                               bSinglePlayer;                                            // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealMPGameInfo.AdjustBotInterface
struct AUnrealMPGameInfo_AdjustBotInterface_Params
{
	bool                                               bSinglePlayer;                                            // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.GetServerDetails
struct AUnrealMPGameInfo_GetServerDetails_Params
{
	struct FServerResponseLine                         ServerState;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.UnrealMPGameInfo.InitPlacedBot
struct AUnrealMPGameInfo_InitPlacedBot_Params
{
	class AController*                                 C;                                                        // (Parm)
	class URosterEntry*                                R;                                                        // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.PickupQuery
struct AUnrealMPGameInfo_PickupQuery_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	class APickup*                                     Item;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.CanDisableObjective
struct AUnrealMPGameInfo_CanDisableObjective_Params
{
	class AGameObjective*                              Go;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.AdjustDestroyObjectiveDamage
struct AUnrealMPGameInfo_AdjustDestroyObjectiveDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class AController*                                 instigatedBy;                                             // (Parm)
	class AGameObjective*                              Go;                                                       // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.ShowPathTo
struct AUnrealMPGameInfo_ShowPathTo_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                TeamNum;                                                  // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.CanShowPathTo
struct AUnrealMPGameInfo_CanShowPathTo_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.ForceAddBot
struct AUnrealMPGameInfo_ForceAddBot_Params
{
};

// Function UnrealGame.UnrealMPGameInfo.ChangeLoadOut
struct AUnrealMPGameInfo_ChangeLoadOut_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	struct FString                                     LoadoutName;                                              // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealMPGameInfo.ScoreGameObject
struct AUnrealMPGameInfo_ScoreGameObject_Params
{
	class AController*                                 C;                                                        // (Parm)
	class AGameObject*                                 Go;                                                       // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.GetGameObject
struct AUnrealMPGameInfo_GetGameObject_Params
{
	struct FName                                       GameObjectName;                                           // (Parm)
	class AGameObject*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.FindNewObjectives
struct AUnrealMPGameInfo_FindNewObjectives_Params
{
	class AGameObjective*                              DisabledObjective;                                        // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.ObjectiveDisabled
struct AUnrealMPGameInfo_ObjectiveDisabled_Params
{
	class AGameObjective*                              DisabledObjective;                                        // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.GetRandomTeamSymbol
struct AUnrealMPGameInfo_GetRandomTeamSymbol_Params
{
	int                                                Base;                                                     // (Parm)
	class UTexture*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.RestartGame
struct AUnrealMPGameInfo_RestartGame_Params
{
};

// Function UnrealGame.UnrealMPGameInfo.TooManyBots
struct AUnrealMPGameInfo_TooManyBots_Params
{
	class AController*                                 botToRemove;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.SpawnWait
struct AUnrealMPGameInfo_SpawnWait_Params
{
	class AAIController*                               B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.ShouldRespawn
struct AUnrealMPGameInfo_ShouldRespawn_Params
{
	class APickup*                                     Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.GetNumPlayers
struct AUnrealMPGameInfo_GetNumPlayers_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.TeamScoreEvent
struct AUnrealMPGameInfo_TeamScoreEvent_Params
{
	int                                                Team;                                                     // (Parm)
	float                                              Points;                                                   // (Parm)
	struct FString                                     Desc;                                                     // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealMPGameInfo.ScoreEvent
struct AUnrealMPGameInfo_ScoreEvent_Params
{
	class APlayerReplicationInfo*                      Who;                                                      // (Parm)
	float                                              Points;                                                   // (Parm)
	struct FString                                     Desc;                                                     // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealMPGameInfo.GameEvent
struct AUnrealMPGameInfo_GameEvent_Params
{
	struct FString                                     GEvent;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Desc;                                                     // (Parm, NeedCtorLink)
	class APlayerReplicationInfo*                      Who;                                                      // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.KillEvent
struct AUnrealMPGameInfo_KillEvent_Params
{
	struct FString                                     KillType;                                                 // (Parm, NeedCtorLink)
	class APlayerReplicationInfo*                      Killer;                                                   // (Parm)
	class APlayerReplicationInfo*                      Victim;                                                   // (Parm)
	class UClass*                                      Damage;                                                   // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.SpecialEvent
struct AUnrealMPGameInfo_SpecialEvent_Params
{
	class APlayerReplicationInfo*                      Who;                                                      // (Parm)
	struct FString                                     Desc;                                                     // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealMPGameInfo.ChangeVoiceChannel
struct AUnrealMPGameInfo_ChangeVoiceChannel_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	int                                                NewChannelIndex;                                          // (Parm)
	int                                                OldChannelIndex;                                          // (Parm)
};

// Function UnrealGame.UnrealMPGameInfo.InitMaplistHandler
struct AUnrealMPGameInfo_InitMaplistHandler_Params
{
};

// Function UnrealGame.UnrealMPGameInfo.InitVoiceReplicationInfo
struct AUnrealMPGameInfo_InitVoiceReplicationInfo_Params
{
};

// Function UnrealGame.UnrealMPGameInfo.Login
struct AUnrealMPGameInfo_Login_Params
{
	struct FString                                     Portal;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
	class APlayerController*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealMPGameInfo.PreLogin
struct AUnrealMPGameInfo_PreLogin_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Address;                                                  // (Parm, NeedCtorLink)
	struct FString                                     PlayerID;                                                 // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
	struct FString                                     FailCode;                                                 // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.Bot.ShouldPerformScript
struct ABot_ShouldPerformScript_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ScriptingOverridesAI
struct ABot_ScriptingOverridesAI_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SetNewScript
struct ABot_SetNewScript_Params
{
	class AScriptedSequence*                           NewScript;                                                // (Parm)
};

// Function UnrealGame.Bot.SetEnemyReaction
struct ABot_SetEnemyReaction_Params
{
	int                                                AlertnessLevel;                                           // (Parm)
};

// Function UnrealGame.Bot.IsShootingObjective
struct ABot_IsShootingObjective_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.Stopped
struct ABot_Stopped_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FindViewSpot
struct ABot_FindViewSpot_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.IsHunting
struct ABot_IsHunting_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.IsStrafing
struct ABot_IsStrafing_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.DefendMelee
struct ABot_DefendMelee_Params
{
	float                                              dist;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.DoRetreat
struct ABot_DoRetreat_Params
{
};

// Function UnrealGame.Bot.DoTacticalMove
struct ABot_DoTacticalMove_Params
{
};

// Function UnrealGame.Bot.DoCharge
struct ABot_DoCharge_Params
{
};

// Function UnrealGame.Bot.DoStakeOut
struct ABot_DoStakeOut_Params
{
};

// Function UnrealGame.Bot.LoseEnemy
struct ABot_LoseEnemy_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.LostContact
struct ABot_LostContact_Params
{
	float                                              MaxTime;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.GetDesiredOffset
struct ABot_GetDesiredOffset_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ForceCelebrate
struct ABot_ForceCelebrate_Params
{
};

// Function UnrealGame.Bot.ForceGiveWeapon
struct ABot_ForceGiveWeapon_Params
{
};

// Function UnrealGame.Bot.Celebrate
struct ABot_Celebrate_Params
{
};

// Function UnrealGame.Bot.RecoverFromBadStateCode
struct ABot_RecoverFromBadStateCode_Params
{
};

// Function UnrealGame.Bot.Formation
struct ABot_Formation_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.IsRetreating
struct ABot_IsRetreating_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.damageAttitudeTo
struct ABot_damageAttitudeTo_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	float                                              Damage;                                                   // (Parm)
};

// Function UnrealGame.Bot.SuperPickupNotSpokenFor
struct ABot_SuperPickupNotSpokenFor_Params
{
	class APickup*                                     P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SuperDesireability
struct ABot_SuperDesireability_Params
{
	class APickup*                                     P;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.Desireability
struct ABot_Desireability_Params
{
	class APickup*                                     P;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.NeedWeapon
struct ABot_NeedWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.WanderOrCamp
struct ABot_WanderOrCamp_Params
{
	bool                                               bMayCrouch;                                               // (Parm)
};

// Function UnrealGame.Bot.FaceActor
struct ABot_FaceActor_Params
{
	float                                              StrafingModifier;                                         // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.AlternateTranslocDest
struct ABot_AlternateTranslocDest_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ShouldStrafeTo
struct ABot_ShouldStrafeTo_Params
{
	class AActor*                                      WayPoint;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FaceMoveTarget
struct ABot_FaceMoveTarget_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.NotifyKilled
struct ABot_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function UnrealGame.Bot.TryToDuck
struct ABot_TryToDuck_Params
{
	struct FVector                                     duckDir;                                                  // (Parm)
	bool                                               bReversed;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ChangeStrafe
struct ABot_ChangeStrafe_Params
{
};

// Function UnrealGame.Bot.TryWallDodge
struct ABot_TryWallDodge_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
	class AActor*                                      HitActor;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.MissedDodge
struct ABot_MissedDodge_Params
{
};

// Function UnrealGame.Bot.NotifyFallingHitWall
struct ABot_NotifyFallingHitWall_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
	class AActor*                                      HitActor;                                                 // (Parm)
};

// Function UnrealGame.Bot.ReceiveWarning
struct ABot_ReceiveWarning_Params
{
	class APawn*                                       shooter;                                                  // (Parm)
	float                                              projSpeed;                                                // (Parm)
	struct FVector                                     FireDir;                                                  // (Parm)
};

// Function UnrealGame.Bot.NotifyTakeHit
struct ABot_NotifyTakeHit_Params
{
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function UnrealGame.Bot.ReceiveProjectileWarning
struct ABot_ReceiveProjectileWarning_Params
{
	class AProjectile*                                 proj;                                                     // (Parm)
};

// Function UnrealGame.Bot.DelayedWarning
struct ABot_DelayedWarning_Params
{
};

// Function UnrealGame.Bot.AdjustAim
struct ABot_AdjustAim_Params
{
	struct FFireProperties                             FiredAmmunition;                                          // (Parm)
	struct FVector                                     projStart;                                                // (Parm)
	int                                                AimError;                                                 // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.AdjustAimError
struct ABot_AdjustAimError_Params
{
	float                                              AimError;                                                 // (Parm)
	float                                              TargetDist;                                               // (Parm)
	bool                                               bDefendMelee;                                             // (Parm)
	bool                                               bInstantProj;                                             // (Parm)
	bool                                               bLeadTargetNow;                                           // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.CheckFutureSight
struct ABot_CheckFutureSight_Params
{
	float                                              DeltaTime;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.NearWall
struct ABot_NearWall_Params
{
	float                                              walldist;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.NeedToTurn
struct ABot_NeedToTurn_Params
{
	struct FVector                                     targ;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FindBestPathToward
struct ABot_FindBestPathToward_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               bCheckedReach;                                            // (Parm)
	bool                                               bAllowDetour;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.AllowDetourTo
struct ABot_AllowDetourTo_Params
{
	class ANavigationPoint*                            N;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SetRouteToGoal
struct ABot_SetRouteToGoal_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.StartMoveToward
struct ABot_StartMoveToward_Params
{
	class AActor*                                      o;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.NotifyPostLanded
struct ABot_NotifyPostLanded_Params
{
};

// Function UnrealGame.Bot.NotifyLanded
struct ABot_NotifyLanded_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SetFall
struct ABot_SetFall_Params
{
};

// Function UnrealGame.Bot.PriorityObjective
struct ABot_PriorityObjective_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.NotifyBump
struct ABot_NotifyBump_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.DirectedWander
struct ABot_DirectedWander_Params
{
	struct FVector                                     WanderDir;                                                // (Parm)
};

// Function UnrealGame.Bot.AdjustAround
struct ABot_AdjustAround_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ClearPathFor
struct ABot_ClearPathFor_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.Bot.CancelCampFor
struct ABot_CancelCampFor_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.Bot.CheckPathToGoalAround
struct ABot_CheckPathToGoalAround_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.Restart
struct ABot_Restart_Params
{
};

// Function UnrealGame.Bot.TestDirection
struct ABot_TestDirection_Params
{
	struct FVector                                     Dir;                                                      // (Parm)
	struct FVector                                     pick;                                                     // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FindRoamDest
struct ABot_FindRoamDest_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SoakStop
struct ABot_SoakStop_Params
{
	struct FString                                     problem;                                                  // (Parm, NeedCtorLink)
};

// Function UnrealGame.Bot.PickRetreatDestination
struct ABot_PickRetreatDestination_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FindInventoryGoal
struct ABot_FindInventoryGoal_Params
{
	float                                              BestWeight;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FindSuperPickup
struct ABot_FindSuperPickup_Params
{
	float                                              MaxDist;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ChooseAttackMode
struct ABot_ChooseAttackMode_Params
{
};

// Function UnrealGame.Bot.DoRangedAttackOn
struct ABot_DoRangedAttackOn_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function UnrealGame.Bot.FightEnemy
struct ABot_FightEnemy_Params
{
	bool                                               bCanCharge;                                               // (Parm)
	float                                              EnemyStrength;                                            // (Parm)
};

// Function UnrealGame.Bot.VehicleFightEnemy
struct ABot_VehicleFightEnemy_Params
{
	bool                                               bCanCharge;                                               // (Parm)
	float                                              EnemyStrength;                                            // (Parm)
};

// Function UnrealGame.Bot.EnemyVisible
struct ABot_EnemyVisible_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.DoWaitForLanding
struct ABot_DoWaitForLanding_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ExecuteWhatToDoNext
struct ABot_ExecuteWhatToDoNext_Params
{
};

// Function UnrealGame.Bot.GetEnemyName
struct ABot_GetEnemyName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.Bot.GetOldEnemyName
struct ABot_GetOldEnemyName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.Bot.WhatToDoNext
struct ABot_WhatToDoNext_Params
{
	unsigned char                                      CallingByte;                                              // (Parm)
};

// Function UnrealGame.Bot.WasKilledBy
struct ABot_WasKilledBy_Params
{
	class AController*                                 Other;                                                    // (Parm)
};

// Function UnrealGame.Bot.SetAlertness
struct ABot_SetAlertness_Params
{
	float                                              NewAlertness;                                             // (Parm)
};

// Function UnrealGame.Bot.SetPeripheralVision
struct ABot_SetPeripheralVision_Params
{
};

// Function UnrealGame.Bot.SetMaxDesiredSpeed
struct ABot_SetMaxDesiredSpeed_Params
{
};

// Function UnrealGame.Bot.ResetSkill
struct ABot_ResetSkill_Params
{
};

// Function UnrealGame.Bot.InitializeSkill
struct ABot_InitializeSkill_Params
{
	float                                              InSkill;                                                  // (Parm)
};

// Function UnrealGame.Bot.Possess
struct ABot_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function UnrealGame.Bot.Reset
struct ABot_Reset_Params
{
};

// Function UnrealGame.Bot.NotifyMissedJump
struct ABot_NotifyMissedJump_Params
{
};

// Function UnrealGame.Bot.NotifyJumpApex
struct ABot_NotifyJumpApex_Params
{
};

// Function UnrealGame.Bot.MayDodgeToMoveTarget
struct ABot_MayDodgeToMoveTarget_Params
{
};

// Function UnrealGame.Bot.NotifyPhysicsVolumeChange
struct ABot_NotifyPhysicsVolumeChange_Params
{
	class APhysicsVolume*                              NewVolume;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.StrafeFromDamage
struct ABot_StrafeFromDamage_Params
{
	float                                              Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	bool                                               bFindDest;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.BotVoiceMessage
struct ABot_BotVoiceMessage_Params
{
	struct FName                                       MessageType;                                              // (Parm)
	unsigned char                                      MessageID;                                                // (Parm)
	class AController*                                 Sender;                                                   // (Parm)
};

// Function UnrealGame.Bot.EnemyChanged
struct ABot_EnemyChanged_Params
{
	bool                                               bNewEnemyVisible;                                         // (Parm)
};

// Function UnrealGame.Bot.SetEnemyInfo
struct ABot_SetEnemyInfo_Params
{
	bool                                               bNewEnemyVisible;                                         // (Parm)
};

// Function UnrealGame.Bot.Trigger
struct ABot_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function UnrealGame.Bot.RelativeStrength
struct ABot_RelativeStrength_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.AssignSquadResponsibility
struct ABot_AssignSquadResponsibility_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FreeScript
struct ABot_FreeScript_Params
{
};

// Function UnrealGame.Bot.IsSniping
struct ABot_IsSniping_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.CheckIfShouldCrouch
struct ABot_CheckIfShouldCrouch_Params
{
	struct FVector                                     StartPosition;                                            // (Parm)
	struct FVector                                     TargetPosition;                                           // (Parm)
	float                                              Probability;                                              // (Parm)
};

// Function UnrealGame.Bot.CanStakeOut
struct ABot_CanStakeOut_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ClearShot
struct ABot_ClearShot_Params
{
	struct FVector                                     TargetLoc;                                                // (Parm)
	bool                                               bImmediateFire;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SetAttractionState
struct ABot_SetAttractionState_Params
{
};

// Function UnrealGame.Bot.SeePlayer
struct ABot_SeePlayer_Params
{
	class APawn*                                       SeenPlayer;                                               // (Parm)
};

// Function UnrealGame.Bot.HearNoise
struct ABot_HearNoise_Params
{
	float                                              Loudness;                                                 // (Parm)
	class AActor*                                      NoiseMaker;                                               // (Parm)
};

// Function UnrealGame.Bot.ClearTemporaryOrders
struct ABot_ClearTemporaryOrders_Params
{
};

// Function UnrealGame.Bot.SetTemporaryOrders
struct ABot_SetTemporaryOrders_Params
{
	struct FName                                       NewOrders;                                                // (Parm)
	class AController*                                 OrderGiver;                                               // (Parm)
};

// Function UnrealGame.Bot.SetOrders
struct ABot_SetOrders_Params
{
	struct FName                                       NewOrders;                                                // (Parm)
	class AController*                                 OrderGiver;                                               // (Parm)
};

// Function UnrealGame.Bot.SendMessage
struct ABot_SendMessage_Params
{
	class APlayerReplicationInfo*                      Recipient;                                                // (Parm)
	struct FName                                       MessageType;                                              // (Parm)
	unsigned char                                      MessageID;                                                // (Parm)
	float                                              wait;                                                     // (Parm)
	struct FName                                       BroadcastType;                                            // (Parm)
};

// Function UnrealGame.Bot.GetMessageIndex
struct ABot_GetMessageIndex_Params
{
	struct FName                                       PhraseName;                                               // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.YellAt
struct ABot_YellAt_Params
{
	class APawn*                                       Moron;                                                    // (Parm)
};

// Function UnrealGame.Bot.GetOrderObject
struct ABot_GetOrderObject_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.GetOrders
struct ABot_GetOrders_Params
{
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.DisplayDebug
struct ABot_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function UnrealGame.Bot.CanCombo
struct ABot_CanCombo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.CanComboMoving
struct ABot_CanComboMoving_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ProficientWithWeapon
struct ABot_ProficientWithWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.WeaponPreference
struct ABot_WeaponPreference_Params
{
	class AwWeapon*                                    W;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.ChangedWeapon
struct ABot_ChangedWeapon_Params
{
};

// Function UnrealGame.Bot.StopFiring
struct ABot_StopFiring_Params
{
};

// Function UnrealGame.Bot.CanAttack
struct ABot_CanAttack_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.FireWeaponAt
struct ABot_FireWeaponAt_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.TimedFireWeaponAtEnemy
struct ABot_TimedFireWeaponAtEnemy_Params
{
};

// Function UnrealGame.Bot.ShouldFireAgain
struct ABot_ShouldFireAgain_Params
{
	float                                              RefireRate;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.WeaponFireAgain
struct ABot_WeaponFireAgain_Params
{
	float                                              RefireRate;                                               // (Parm)
	bool                                               bFinishedFire;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.WaitForMover
struct ABot_WaitForMover_Params
{
	class AMover*                                      M;                                                        // (Parm)
};

// Function UnrealGame.Bot.ImpactJump
struct ABot_ImpactJump_Params
{
};

// Function UnrealGame.Bot.CanUseTranslocator
struct ABot_CanUseTranslocator_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.CanImpactJump
struct ABot_CanImpactJump_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.RateWeapon
struct ABot_RateWeapon_Params
{
	class AwWeapon*                                    W;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.UpdatePawnViewPitch
struct ABot_UpdatePawnViewPitch_Params
{
};

// Function UnrealGame.Bot.GetMyPlayer
struct ABot_GetMyPlayer_Params
{
	class APawn*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.InitPlayerReplicationInfo
struct ABot_InitPlayerReplicationInfo_Params
{
};

// Function UnrealGame.Bot.DontReuseTaunt
struct ABot_DontReuseTaunt_Params
{
	int                                                t;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.AutoTaunt
struct ABot_AutoTaunt_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SetCombatTimer
struct ABot_SetCombatTimer_Params
{
};

// Function UnrealGame.Bot.Startle
struct ABot_Startle_Params
{
	class AActor*                                      Feared;                                                   // (Parm)
};

// Function UnrealGame.Bot.FearThisSpot
struct ABot_FearThisSpot_Params
{
	class AAvoidMarker*                                aSpot;                                                    // (Parm)
};

// Function UnrealGame.Bot.TryCombo
struct ABot_TryCombo_Params
{
	struct FString                                     ComboName;                                                // (Parm, NeedCtorLink)
};

// Function UnrealGame.Bot.CanDoubleJump
struct ABot_CanDoubleJump_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.GetOutOfVehicle
struct ABot_GetOutOfVehicle_Params
{
};

// Function UnrealGame.Bot.NotifyHitWall
struct ABot_NotifyHitWall_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
	class AActor*                                      Wall;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.SetupSpecialPathAbilities
struct ABot_SetupSpecialPathAbilities_Params
{
};

// Function UnrealGame.Bot.ShouldKeepShielding
struct ABot_ShouldKeepShielding_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.NotifyAddInventory
struct ABot_NotifyAddInventory_Params
{
	class AInventory*                                  NewItem;                                                  // (Parm)
};

// Function UnrealGame.Bot.HasSuperWeapon
struct ABot_HasSuperWeapon_Params
{
	class AwWeapon*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.Bot.PostBeginPlay
struct ABot_PostBeginPlay_Params
{
};

// Function UnrealGame.Bot.Destroyed
struct ABot_Destroyed_Params
{
};

// Function UnrealGame.SquadAI.FriendlyToward
struct ASquadAI_FriendlyToward_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.CautiousAdvance
struct ASquadAI_CautiousAdvance_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.IsDefending
struct ASquadAI_IsDefending_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.ClearPathFor
struct ASquadAI_ClearPathFor_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.PickRetreatDestination
struct ASquadAI_PickRetreatDestination_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.BeDevious
struct ASquadAI_BeDevious_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.DisplayDebug
struct ASquadAI_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function UnrealGame.SquadAI.PickBotToReassign
struct ASquadAI_PickBotToReassign_Params
{
	class ABot*                                        ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.BotSuitability
struct ASquadAI_BotSuitability_Params
{
	class ABot*                                        B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.ShouldDestroyTranslocator
struct ASquadAI_ShouldDestroyTranslocator_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.CheckSquadObjectives
struct ASquadAI_CheckSquadObjectives_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.OverrideFollowPlayer
struct ASquadAI_OverrideFollowPlayer_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.CheckSpecialVehicleObjectives
struct ASquadAI_CheckSpecialVehicleObjectives_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.VehicleDesireability
struct ASquadAI_VehicleDesireability_Params
{
	class AVehicle*                                    V;                                                        // (Parm)
	class ABot*                                        B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.CheckVehicle
struct ASquadAI_CheckVehicle_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.BotEnteredVehicle
struct ASquadAI_BotEnteredVehicle_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.NeverBail
struct ASquadAI_NeverBail_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.MaxVehicleDist
struct ASquadAI_MaxVehicleDist_Params
{
	class APawn*                                       P;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.AssignSquadResponsibility
struct ASquadAI_AssignSquadResponsibility_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.AddTransientCosts
struct ASquadAI_AddTransientCosts_Params
{
	class ABot*                                        B;                                                        // (Parm)
	float                                              f;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.AllowTaunt
struct ASquadAI_AllowTaunt_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.TellBotToFollow
struct ASquadAI_TellBotToFollow_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.PickNewLeader
struct ASquadAI_PickNewLeader_Params
{
};

// Function UnrealGame.SquadAI.GetSize
struct ASquadAI_GetSize_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.GetShortOrderStringFor
struct ASquadAI_GetShortOrderStringFor_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.SquadAI.GetOrderStringFor
struct ASquadAI_GetOrderStringFor_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.SquadAI.GetOrders
struct ASquadAI_GetOrders_Params
{
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.Retask
struct ASquadAI_Retask_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.SetObjective
struct ASquadAI_SetObjective_Params
{
	class AGameObjective*                              o;                                                        // (Parm)
	bool                                               bForceUpdate;                                             // (Parm)
};

// Function UnrealGame.SquadAI.SetFreelanceScriptFor
struct ASquadAI_SetFreelanceScriptFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.SetDefenseScriptFor
struct ASquadAI_SetDefenseScriptFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.SwitchBots
struct ASquadAI_SwitchBots_Params
{
	class ABot*                                        MyBot;                                                    // (Parm)
	class ABot*                                        OtherBot;                                                 // (Parm)
};

// Function UnrealGame.SquadAI.AddBot
struct ASquadAI_AddBot_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.RemoveBot
struct ASquadAI_RemoveBot_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.RemovePlayer
struct ASquadAI_RemovePlayer_Params
{
	class APlayerController*                           P;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.SetLeader
struct ASquadAI_SetLeader_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.SetFinalStretch
struct ASquadAI_SetFinalStretch_Params
{
	bool                                               bValue;                                                   // (Parm)
};

// Function UnrealGame.SquadAI.FindPathToObjective
struct ASquadAI_FindPathToObjective_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class AActor*                                      o;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.TryToIntercept
struct ASquadAI_TryToIntercept_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class APawn*                                       P;                                                        // (Parm)
	class AActor*                                      RouteGoal;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.SetAlternatePath
struct ASquadAI_SetAlternatePath_Params
{
	bool                                               bResetSquad;                                              // (Parm)
};

// Function UnrealGame.SquadAI.Initialize
struct ASquadAI_Initialize_Params
{
	class AUnrealTeamInfo*                             t;                                                        // (Parm)
	class AGameObjective*                              o;                                                        // (Parm)
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.MergeWith
struct ASquadAI_MergeWith_Params
{
	class ASquadAI*                                    S;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.CloseToLeader
struct ASquadAI_CloseToLeader_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.NearFormationCenter
struct ASquadAI_NearFormationCenter_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.WanderNearLeader
struct ASquadAI_WanderNearLeader_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.WaitAtThisPosition
struct ASquadAI_WaitAtThisPosition_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.ShouldDeferTo
struct ASquadAI_ShouldDeferTo_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.AssessThreat
struct ASquadAI_AssessThreat_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class APawn*                                       NewThreat;                                                // (Parm)
	bool                                               bThreatVisible;                                           // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.UnderFire
struct ASquadAI_UnderFire_Params
{
	class APawn*                                       NewThreat;                                                // (Parm)
	class ABot*                                        Ignored;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.ModifyThreat
struct ASquadAI_ModifyThreat_Params
{
	float                                              current;                                                  // (Parm)
	class APawn*                                       NewThreat;                                                // (Parm)
	bool                                               bThreatVisible;                                           // (Parm)
	class ABot*                                        B;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.FindNewEnemyFor
struct ASquadAI_FindNewEnemyFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               bSeeEnemy;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.NotifyKilled
struct ASquadAI_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function UnrealGame.SquadAI.RemoveEnemy
struct ASquadAI_RemoveEnemy_Params
{
	class APawn*                                       E;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.IsOnSquad
struct ASquadAI_IsOnSquad_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.PriorityObjective
struct ASquadAI_PriorityObjective_Params
{
	class ABot*                                        B;                                                        // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.SetEnemy
struct ASquadAI_SetEnemy_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.ValidEnemy
struct ASquadAI_ValidEnemy_Params
{
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.AddEnemy
struct ASquadAI_AddEnemy_Params
{
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.MustKeepEnemy
struct ASquadAI_MustKeepEnemy_Params
{
	class APawn*                                       E;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.LostEnemy
struct ASquadAI_LostEnemy_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.MergeEnemiesFrom
struct ASquadAI_MergeEnemiesFrom_Params
{
	class ASquadAI*                                    S;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.FormationCenter
struct ASquadAI_FormationCenter_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.GetFacingRotation
struct ASquadAI_GetFacingRotation_Params
{
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.GetLinkVehicle
struct ASquadAI_GetLinkVehicle_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class AVehicle*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.GetKeyVehicle
struct ASquadAI_GetKeyVehicle_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class AVehicle*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.SetFacingActor
struct ASquadAI_SetFacingActor_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.AllowImpactJumpBy
struct ASquadAI_AllowImpactJumpBy_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.AllowTranslocationBy
struct ASquadAI_AllowTranslocationBy_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.Destroyed
struct ASquadAI_Destroyed_Params
{
};

// Function UnrealGame.SquadAI.GetRestingFormation
struct ASquadAI_GetRestingFormation_Params
{
	class ARestingFormation*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.AllowDetourTo
struct ASquadAI_AllowDetourTo_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class ANavigationPoint*                            N;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.ShouldSuppressEnemy
struct ASquadAI_ShouldSuppressEnemy_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SquadAI.CriticalObjectiveWarning
struct ASquadAI_CriticalObjectiveWarning_Params
{
	class APawn*                                       NewEnemy;                                                 // (Parm)
};

// Function UnrealGame.SquadAI.AssignCombo
struct ASquadAI_AssignCombo_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.SquadAI.Reset
struct ASquadAI_Reset_Params
{
};

// Function UnrealGame.GameObject.LogReturned
struct AGameObject_LogReturned_Params
{
};

// Function UnrealGame.GameObject.LogDropped
struct AGameObject_LogDropped_Params
{
};

// Function UnrealGame.GameObject.LogTaken
struct AGameObject_LogTaken_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.GameObject.BaseChange
struct AGameObject_BaseChange_Params
{
};

// Function UnrealGame.GameObject.Landed
struct AGameObject_Landed_Params
{
	struct FVector                                     HitNormall;                                               // (Parm)
};

// Function UnrealGame.GameObject.NotReachableBy
struct AGameObject_NotReachableBy_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.GameObject.FellOutOfWorld
struct AGameObject_FellOutOfWorld_Params
{
	TEnumAsByte<EeKillZType>                           KillType;                                                 // (Parm)
};

// Function UnrealGame.GameObject.Touch
struct AGameObject_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.GameObject.ValidHolder
struct AGameObject_ValidHolder_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObject.IsHome
struct AGameObject_IsHome_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObject.Position
struct AGameObject_Position_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObject.SetDisable
struct AGameObject_SetDisable_Params
{
	bool                                               Disable;                                                  // (Parm)
};

// Function UnrealGame.GameObject.ClearHolder
struct AGameObject_ClearHolder_Params
{
};

// Function UnrealGame.GameObject.CalcSetHome
struct AGameObject_CalcSetHome_Params
{
};

// Function UnrealGame.GameObject.SendHomeDisabled
struct AGameObject_SendHomeDisabled_Params
{
	float                                              TimeOut;                                                  // (Parm)
};

// Function UnrealGame.GameObject.SendHome
struct AGameObject_SendHome_Params
{
};

// Function UnrealGame.GameObject.Drop
struct AGameObject_Drop_Params
{
	struct FVector                                     NewVel;                                                   // (Parm)
	struct FString                                     sReason;                                                  // (OptionalParm, Parm, NeedCtorLink)
};

// Function UnrealGame.GameObject.Score
struct AGameObject_Score_Params
{
};

// Function UnrealGame.GameObject.SetHolder
struct AGameObject_SetHolder_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.GameObject.CanBePickedUpBy
struct AGameObject_CanBePickedUpBy_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObject.CanBeThrownBy
struct AGameObject_CanBeThrownBy_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObject.ForceBegin
struct AGameObject_ForceBegin_Params
{
};

// Function UnrealGame.GameObject.PostBeginPlay
struct AGameObject_PostBeginPlay_Params
{
};

// Function UnrealGame.UnrealPlayer.wViewAttacked
struct AUnrealPlayer_wViewAttacked_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function UnrealGame.UnrealPlayer.wAttackedView
struct AUnrealPlayer_wAttackedView_Params
{
	int                                                iPitch;                                                   // (Parm)
	int                                                iYaw;                                                     // (Parm)
	int                                                iRoll;                                                    // (Parm)
};

// Function UnrealGame.UnrealPlayer.AttackedView
struct AUnrealPlayer_AttackedView_Params
{
	int                                                iWeaponID;                                                // (Parm)
	float                                              fHitGunKick;                                              // (Parm)
	struct FVector                                     vAttacked;                                                // (Parm)
};

// Function UnrealGame.UnrealPlayer.RotateByAttacked
struct AUnrealPlayer_RotateByAttacked_Params
{
	struct FVector                                     CameraLocation;                                           // (Parm, OutParm)
	struct FRotator                                    CameraRotation;                                           // (Parm, OutParm)
};

// Function UnrealGame.UnrealPlayer.DisplayDebug
struct AUnrealPlayer_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function UnrealGame.UnrealPlayer.ClientReceiveBotDebugString
struct AUnrealPlayer_ClientReceiveBotDebugString_Params
{
	struct FString                                     DebugString;                                              // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayer.ServerSendBotDebugString
struct AUnrealPlayer_ServerSendBotDebugString_Params
{
};

// Function UnrealGame.UnrealPlayer.NetDebugBot
struct AUnrealPlayer_NetDebugBot_Params
{
};

// Function UnrealGame.UnrealPlayer.ServerChatDebug
struct AUnrealPlayer_ServerChatDebug_Params
{
};

// Function UnrealGame.UnrealPlayer.ClientGameEnded
struct AUnrealPlayer_ClientGameEnded_Params
{
};

// Function UnrealGame.UnrealPlayer.AutoJoinVoiceChat
struct AUnrealPlayer_AutoJoinVoiceChat_Params
{
};

// Function UnrealGame.UnrealPlayer.PostNetBeginPlay
struct AUnrealPlayer_PostNetBeginPlay_Params
{
};

// Function UnrealGame.UnrealPlayer.NeedNetNotify
struct AUnrealPlayer_NeedNetNotify_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayer.SetCustomRewardAnnouncerClass
struct AUnrealPlayer_SetCustomRewardAnnouncerClass_Params
{
	struct FString                                     NewAnnouncerClass;                                        // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayer.GetCustomRewardAnnouncerClass
struct AUnrealPlayer_GetCustomRewardAnnouncerClass_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayer.SetCustomStatusAnnouncerClass
struct AUnrealPlayer_SetCustomStatusAnnouncerClass_Params
{
	struct FString                                     NewAnnouncerClass;                                        // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayer.GetCustomStatusAnnouncerClass
struct AUnrealPlayer_GetCustomStatusAnnouncerClass_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayer.ShowMidGameMenu
struct AUnrealPlayer_ShowMidGameMenu_Params
{
	bool                                               bPause;                                                   // (Parm)
};

// Function UnrealGame.UnrealPlayer.ServerDropFlag
struct AUnrealPlayer_ServerDropFlag_Params
{
};

// Function UnrealGame.UnrealPlayer.DropFlag
struct AUnrealPlayer_DropFlag_Params
{
};

// Function UnrealGame.UnrealPlayer.PlayWinMessage
struct AUnrealPlayer_PlayWinMessage_Params
{
	bool                                               bWinner;                                                  // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientPlayTakeHit
struct AUnrealPlayer_ClientPlayTakeHit_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
	unsigned char                                      Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPlayer.HitSound
struct AUnrealPlayer_HitSound_Params
{
};

// Function UnrealGame.UnrealPlayer.NewClientPlayTakeHit
struct AUnrealPlayer_NewClientPlayTakeHit_Params
{
	struct FVector                                     AttackLoc;                                                // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	unsigned char                                      Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                iWeaponID;                                                // (OptionalParm, Parm)
	float                                              fHitGunKick;                                              // (OptionalParm, Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPlayer.NotifyTakeHit
struct AUnrealPlayer_NotifyTakeHit_Params
{
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPlayer.ShowLoginMenu
struct AUnrealPlayer_ShowLoginMenu_Params
{
};

// Function UnrealGame.UnrealPlayer.ClientReceiveLoginMenu
struct AUnrealPlayer_ClientReceiveLoginMenu_Params
{
	struct FString                                     MenuClass;                                                // (Parm, NeedCtorLink)
	bool                                               bForce;                                                   // (Parm)
};

// Function UnrealGame.UnrealPlayer.ServerSetReadyToStart
struct AUnrealPlayer_ServerSetReadyToStart_Params
{
};

// Function UnrealGame.UnrealPlayer.InitInputSystem
struct AUnrealPlayer_InitInputSystem_Params
{
};

// Function UnrealGame.UnrealPlayer.PostNetReceive
struct AUnrealPlayer_PostNetReceive_Params
{
};

// Function UnrealGame.UnrealPlayer.PlayStartupMessage
struct AUnrealPlayer_PlayStartupMessage_Params
{
	unsigned char                                      StartupStage;                                             // (Parm)
};

// Function UnrealGame.UnrealPlayer.KickWarning
struct AUnrealPlayer_KickWarning_Params
{
};

// Function UnrealGame.UnrealPlayer.PlayAnnouncement
struct AUnrealPlayer_PlayAnnouncement_Params
{
	class USound*                                      ASound;                                                   // (Parm)
	unsigned char                                      AnnouncementLevel;                                        // (Parm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPlayer.PlayRewardAnnouncement
struct AUnrealPlayer_PlayRewardAnnouncement_Params
{
	struct FName                                       AName;                                                    // (Parm)
	unsigned char                                      AnnouncementLevel;                                        // (Parm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
	TEnumAsByte<ESoundSlot>                            Slot;                                                     // (OptionalParm, Parm)
	bool                                               isWomanVoice;                                             // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPlayer.PlayStatusAnnouncement
struct AUnrealPlayer_PlayStatusAnnouncement_Params
{
	struct FString                                     AName;                                                    // (Parm, NeedCtorLink)
	unsigned char                                      AnnouncementLevel;                                        // (Parm)
	bool                                               bForce;                                                   // (OptionalParm, Parm)
};

// Function UnrealGame.UnrealPlayer.ServerPlayVehicleHorn
struct AUnrealPlayer_ServerPlayVehicleHorn_Params
{
	int                                                HornIndex;                                                // (Parm)
};

// Function UnrealGame.UnrealPlayer.PlayVehicleHorn
struct AUnrealPlayer_PlayVehicleHorn_Params
{
	int                                                HornIndex;                                                // (Parm)
};

// Function UnrealGame.UnrealPlayer.ServerTaunt
struct AUnrealPlayer_ServerTaunt_Params
{
	struct FName                                       AnimName;                                                 // (Parm)
};

// Function UnrealGame.UnrealPlayer.TAUNT
struct AUnrealPlayer_TAUNT_Params
{
	struct FName                                       Sequence;                                                 // (Parm)
};

// Function UnrealGame.UnrealPlayer.RandomTaunt
struct AUnrealPlayer_RandomTaunt_Params
{
};

// Function UnrealGame.UnrealPlayer.GetMessageIndex
struct AUnrealPlayer_GetMessageIndex_Params
{
	struct FName                                       PhraseName;                                               // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayer.ServerShowPathToBase
struct AUnrealPlayer_ServerShowPathToBase_Params
{
	int                                                TeamNum;                                                  // (Parm)
};

// Function UnrealGame.UnrealPlayer.BasePath
struct AUnrealPlayer_BasePath_Params
{
	unsigned char                                      Num;                                                      // (Parm)
};

// Function UnrealGame.UnrealPlayer.SoakPause
struct AUnrealPlayer_SoakPause_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.UnrealPlayer.SoakBots
struct AUnrealPlayer_SoakBots_Params
{
};

// Function UnrealGame.UnrealPlayer.DontReuseTaunt
struct AUnrealPlayer_DontReuseTaunt_Params
{
	int                                                t;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayer.AutoTaunt
struct AUnrealPlayer_AutoTaunt_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayer.Possess
struct AUnrealPlayer_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function UnrealGame.UnrealPlayer.ShowAI
struct AUnrealPlayer_ShowAI_Params
{
};

// Function UnrealGame.UnrealPlayer.LogMultiKills
struct AUnrealPlayer_LogMultiKills_Params
{
	float                                              Reward;                                                   // (Parm)
	bool                                               bEnemyKill;                                               // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientDelayedAnnouncement
struct AUnrealPlayer_ClientDelayedAnnouncement_Params
{
	class USound*                                      AnnouncementSound;                                        // (Parm)
	unsigned char                                      Delay;                                                    // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientDelayedAnnouncementNamed
struct AUnrealPlayer_ClientDelayedAnnouncementNamed_Params
{
	struct FName                                       Announcement;                                             // (Parm)
	unsigned char                                      Delay;                                                    // (Parm)
};

// Function UnrealGame.UnrealPlayer.AwardAdrenaline
struct AUnrealPlayer_AwardAdrenaline_Params
{
	float                                              Amount;                                                   // (Parm)
};

// Function UnrealGame.UnrealPlayer.PostBeginPlay
struct AUnrealPlayer_PostBeginPlay_Params
{
};

// Function UnrealGame.UnrealPlayer.ClientSendStats
struct AUnrealPlayer_ClientSendStats_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	int                                                newgoals;                                                 // (Parm)
	bool                                               bNewFirstBlood;                                           // (Parm)
	int                                                newKills;                                                 // (Parm)
	int                                                newsuicides;                                              // (Parm)
	int                                                newFlagTouches;                                           // (Parm)
	int                                                newFlagReturns;                                           // (Parm)
	int                                                newFlakCount;                                             // (Parm)
	int                                                newComboCount;                                            // (Parm)
	int                                                newHeadCount;                                             // (Parm)
	int                                                newRanOverCount;                                          // (Parm)
	int                                                newDaredevilPoints;                                       // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientSendCombos
struct AUnrealPlayer_ClientSendCombos_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	unsigned char                                      Combos0;                                                  // (Parm)
	unsigned char                                      Combos1;                                                  // (Parm)
	unsigned char                                      Combos2;                                                  // (Parm)
	unsigned char                                      Combos3;                                                  // (Parm)
	unsigned char                                      Combos4;                                                  // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientSendMultiKills
struct AUnrealPlayer_ClientSendMultiKills_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	unsigned char                                      MultiKills0;                                              // (Parm)
	unsigned char                                      MultiKills1;                                              // (Parm)
	unsigned char                                      MultiKills2;                                              // (Parm)
	unsigned char                                      MultiKills3;                                              // (Parm)
	unsigned char                                      MultiKills4;                                              // (Parm)
	unsigned char                                      MultiKills5;                                              // (Parm)
	unsigned char                                      MultiKills6;                                              // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientSendSprees
struct AUnrealPlayer_ClientSendSprees_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	unsigned char                                      Spree0;                                                   // (Parm)
	unsigned char                                      Spree1;                                                   // (Parm)
	unsigned char                                      Spree2;                                                   // (Parm)
	unsigned char                                      Spree3;                                                   // (Parm)
	unsigned char                                      Spree4;                                                   // (Parm)
	unsigned char                                      Spree5;                                                   // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientSendVehicle
struct AUnrealPlayer_ClientSendVehicle_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	class UClass*                                      V;                                                        // (Parm)
	int                                                Kills;                                                    // (Parm)
	int                                                Deaths;                                                   // (Parm)
	int                                                DeathsDriving;                                            // (Parm)
	int                                                i;                                                        // (Parm)
};

// Function UnrealGame.UnrealPlayer.ClientSendWeapon
struct AUnrealPlayer_ClientSendWeapon_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	class UClass*                                      W;                                                        // (Parm)
	int                                                Kills;                                                    // (Parm)
	int                                                Deaths;                                                   // (Parm)
	int                                                deathsholding;                                            // (Parm)
	int                                                i;                                                        // (Parm)
};

// Function UnrealGame.UnrealPlayer.ServerGetNextVehicleStats
struct AUnrealPlayer_ServerGetNextVehicleStats_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	int                                                i;                                                        // (Parm)
};

// Function UnrealGame.UnrealPlayer.ServerGetNextWeaponStats
struct AUnrealPlayer_ServerGetNextWeaponStats_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	int                                                i;                                                        // (Parm)
};

// Function UnrealGame.UnrealPlayer.ServerUpdateStatArrays
struct AUnrealPlayer_ServerUpdateStatArrays_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
};

// Function UnrealGame.UnrealPlayer.ServerUpdateStats
struct AUnrealPlayer_ServerUpdateStats_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
};

// Function UnrealGame.DeathMatch.PermitWeaponChangeInSpecialMode
struct ADeathMatch_PermitWeaponChangeInSpecialMode_Params
{
};

// Function UnrealGame.DeathMatch.AnnounceSentryGun
struct ADeathMatch_AnnounceSentryGun_Params
{
	class AController*                                 Caller;                                                   // (Parm)
};

// Function UnrealGame.DeathMatch.AnnounceUAV
struct ADeathMatch_AnnounceUAV_Params
{
	class AController*                                 Caller;                                                   // (Parm)
};

// Function UnrealGame.DeathMatch.AnnounceHelicopter
struct ADeathMatch_AnnounceHelicopter_Params
{
	class AController*                                 Caller;                                                   // (Parm)
};

// Function UnrealGame.DeathMatch.AnnounceArtillery
struct ADeathMatch_AnnounceArtillery_Params
{
	class AController*                                 Caller;                                                   // (Parm)
};

// Function UnrealGame.DeathMatch.GetAllLoadHints
struct ADeathMatch_GetAllLoadHints_Params
{
	bool                                               bThisClassOnly;                                           // (OptionalParm, Parm)
	TArray<struct FString>                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.GetNextLoadHint
struct ADeathMatch_GetNextLoadHint_Params
{
	struct FString                                     MapName;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.SetGrammar
struct ADeathMatch_SetGrammar_Params
{
};

// Function UnrealGame.DeathMatch.PrecacheGameAnnouncements
struct ADeathMatch_PrecacheGameAnnouncements_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function UnrealGame.DeathMatch.WantsPickups
struct ADeathMatch_WantsPickups_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.EndSpree
struct ADeathMatch_EndSpree_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Other;                                                    // (Parm)
};

// Function UnrealGame.DeathMatch.NotifySpree
struct ADeathMatch_NotifySpree_Params
{
	class AController*                                 Other;                                                    // (Parm)
	int                                                Num;                                                      // (Parm)
};

// Function UnrealGame.DeathMatch.GetDescriptionText
struct ADeathMatch_GetDescriptionText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.GetDisplayText
struct ADeathMatch_GetDisplayText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.FillPlayInfo
struct ADeathMatch_FillPlayInfo_Params
{
	class UPlayInfo*                                   PlayInfo;                                                 // (Parm)
};

// Function UnrealGame.DeathMatch.AcceptPlayInfoProperty
struct ADeathMatch_AcceptPlayInfoProperty_Params
{
	struct FString                                     PropertyName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.ReviewJumpSpots
struct ADeathMatch_ReviewJumpSpots_Params
{
	struct FName                                       TestLabel;                                                // (Parm)
};

// Function UnrealGame.DeathMatch.addaistrike
struct ADeathMatch_addaistrike_Params
{
	int                                                Num;                                                      // (Parm)
};

// Function UnrealGame.DeathMatch.addaifire
struct ADeathMatch_addaifire_Params
{
	struct FString                                     Num;                                                      // (Parm, NeedCtorLink)
	struct FString                                     Team;                                                     // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.addai
struct ADeathMatch_addai_Params
{
	struct FString                                     Num;                                                      // (Parm, NeedCtorLink)
	struct FString                                     Team;                                                     // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.addaibot
struct ADeathMatch_addaibot_Params
{
	struct FString                                     Num;                                                      // (Parm, NeedCtorLink)
	struct FString                                     Team;                                                     // (Parm, NeedCtorLink)
	struct FString                                     Grade;                                                    // (Parm, NeedCtorLink)
	struct FString                                     NPCID;                                                    // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.AddwAIBot
struct ADeathMatch_AddwAIBot_Params
{
	struct FString                                     strNum;                                                   // (Parm, NeedCtorLink)
	struct FString                                     strTeam;                                                  // (Parm, NeedCtorLink)
	struct FString                                     aiClass;                                                  // (Parm, NeedCtorLink)
	struct FString                                     strGrade;                                                 // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     strNPCID;                                                 // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     strRegenLocationIndex;                                    // (OptionalParm, Parm, NeedCtorLink)
	class AController*                                 callerController;                                         // (OptionalParm, Parm)
	bool                                               bUseDynamicRegenLocation;                                 // (OptionalParm, Parm)
	struct FVector                                     v3DynamicRegenLocation;                                   // (OptionalParm, Parm)
	bool                                               bUseFakeID;                                               // (OptionalParm, Parm)
};

// Function UnrealGame.DeathMatch.rfAckGetBotID
struct ADeathMatch_rfAckGetBotID_Params
{
	int                                                Result;                                                   // (Parm)
	unsigned char                                      RequestedAFCount;                                         // (Parm)
	unsigned char                                      RequestedRSACount;                                        // (Parm)
	TArray<int>                                        AFBotID;                                                  // (Parm, NeedCtorLink)
	TArray<int>                                        RSABotID;                                                 // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.HandleGetBotID
struct ADeathMatch_HandleGetBotID_Params
{
	int                                                Team;                                                     // (Parm)
	TArray<int>                                        BotID;                                                    // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.EnqueueAddBot
struct ADeathMatch_EnqueueAddBot_Params
{
	class UClass*                                      BotClass;                                                 // (Parm)
	class AController*                                 callerController;                                         // (Parm)
	int                                                Team;                                                     // (Parm)
	int                                                Grade;                                                    // (Parm)
	int                                                NPCID;                                                    // (Parm)
	int                                                iRegenLocationIndex;                                      // (Parm)
	bool                                               bUseDynamicRegenLocation;                                 // (Parm)
	struct FVector                                     v3DynamicRegenLocation;                                   // (Parm)
};

// Function UnrealGame.DeathMatch.Killaibots
struct ADeathMatch_Killaibots_Params
{
	int                                                Num;                                                      // (OptionalParm, Parm)
};

// Function UnrealGame.DeathMatch.Kill
struct ADeathMatch_Kill_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.DeathMatch.KillBots
struct ADeathMatch_KillBots_Params
{
	int                                                Num;                                                      // (Parm)
};

// Function UnrealGame.DeathMatch.AddBots
struct ADeathMatch_AddBots_Params
{
	int                                                Num;                                                      // (Parm)
};

// Function UnrealGame.DeathMatch.AddNamedBot
struct ADeathMatch_AddNamedBot_Params
{
	struct FString                                     botname;                                                  // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.dobalancebots
struct ADeathMatch_dobalancebots_Params
{
};

// Function UnrealGame.DeathMatch.setFakeUID
struct ADeathMatch_setFakeUID_Params
{
};

// Function UnrealGame.DeathMatch.ReduceDamage
struct ADeathMatch_ReduceDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class APawn*                                       injured;                                                  // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm, OutParm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                iWeaponType;                                              // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.AdjustSkill
struct ADeathMatch_AdjustSkill_Params
{
	class AAIController*                               B;                                                        // (Parm)
	class APlayerController*                           P;                                                        // (Parm)
	bool                                               bWinner;                                                  // (Parm)
};

// Function UnrealGame.DeathMatch.ScoreKill
struct ADeathMatch_ScoreKill_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Other;                                                    // (Parm)
};

// Function UnrealGame.DeathMatch.ScoreObjective
struct ADeathMatch_ScoreObjective_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
	float                                              Score;                                                    // (Parm)
};

// Function UnrealGame.DeathMatch.CheckScore
struct ADeathMatch_CheckScore_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
};

// Function UnrealGame.DeathMatch.CheckMaxLives
struct ADeathMatch_CheckMaxLives_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.RatePlayerStart
struct ADeathMatch_RatePlayerStart_Params
{
	class ANavigationPoint*                            N;                                                        // (Parm)
	unsigned char                                      Team;                                                     // (Parm)
	class AController*                                 Player;                                                   // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.CheckLives
struct ADeathMatch_CheckLives_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.ChangeHostExtraWork
struct ADeathMatch_ChangeHostExtraWork_Params
{
};

// Function UnrealGame.DeathMatch.GetUserBackToVehicle
struct ADeathMatch_GetUserBackToVehicle_Params
{
};

// Function UnrealGame.DeathMatch.ContinueMatch
struct ADeathMatch_ContinueMatch_Params
{
};

// Function UnrealGame.DeathMatch.RecoverHelicopter
struct ADeathMatch_RecoverHelicopter_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.DeathMatch.OnKillingDropOut
struct ADeathMatch_OnKillingDropOut_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.DeathMatch.CalcItemUsedTimeAll
struct ADeathMatch_CalcItemUsedTimeAll_Params
{
};

// Function UnrealGame.DeathMatch.ForcedStartMatch
struct ADeathMatch_ForcedStartMatch_Params
{
};

// Function UnrealGame.DeathMatch.UpdateVehicles
struct ADeathMatch_UpdateVehicles_Params
{
};

// Function UnrealGame.DeathMatch.ProcessDefaultInv
struct ADeathMatch_ProcessDefaultInv_Params
{
};

// Function UnrealGame.DeathMatch.GameAddDefaultInventory
struct ADeathMatch_GameAddDefaultInventory_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.DeathMatch.AnnounceTimesUp
struct ADeathMatch_AnnounceTimesUp_Params
{
};

// Function UnrealGame.DeathMatch.GetNetWait
struct ADeathMatch_GetNetWait_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.PlayStartupMessage
struct ADeathMatch_PlayStartupMessage_Params
{
};

// Function UnrealGame.DeathMatch.PlayEndOfMatchMessage
struct ADeathMatch_PlayEndOfMatchMessage_Params
{
};

// Function UnrealGame.DeathMatch.FindPlayerStart_TU
struct ADeathMatch_FindPlayerStart_TU_Params
{
	class AController*                                 Player;                                                   // (Parm)
	unsigned char                                      inTeam;                                                   // (OptionalParm, Parm)
	struct FString                                     incomingName;                                             // (OptionalParm, Parm, NeedCtorLink)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.FindPlayerStart
struct ADeathMatch_FindPlayerStart_Params
{
	class AController*                                 Player;                                                   // (Parm)
	unsigned char                                      inTeam;                                                   // (OptionalParm, Parm)
	struct FString                                     incomingName;                                             // (OptionalParm, Parm, NeedCtorLink)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.SetGameEndType
struct ADeathMatch_SetGameEndType_Params
{
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.EndGame
struct ADeathMatch_EndGame_Params
{
	class APlayerReplicationInfo*                      Winner;                                                   // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.AnnounceMatchInfo
struct ADeathMatch_AnnounceMatchInfo_Params
{
};

// Function UnrealGame.DeathMatch.BalanceBots
struct ADeathMatch_BalanceBots_Params
{
};

// Function UnrealGame.DeathMatch.StartMatch
struct ADeathMatch_StartMatch_Params
{
};

// Function UnrealGame.DeathMatch.FindTeamFor
struct ADeathMatch_FindTeamFor_Params
{
	class AController*                                 C;                                                        // (Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.InitPlacedBot
struct ADeathMatch_InitPlacedBot_Params
{
	class AController*                                 C;                                                        // (Parm)
	class URosterEntry*                                R;                                                        // (Parm)
};

// Function UnrealGame.DeathMatch.InitializeBot
struct ADeathMatch_InitializeBot_Params
{
	class ABot*                                        NewBot;                                                   // (Parm)
	class AUnrealTeamInfo*                             BotTeam;                                                  // (Parm)
	class URosterEntry*                                Chosen;                                                   // (Parm)
};

// Function UnrealGame.DeathMatch.SpawnBot
struct ADeathMatch_SpawnBot_Params
{
	struct FString                                     botname;                                                  // (OptionalParm, Parm, NeedCtorLink)
	class ABot*                                        ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.PreLoadBot
struct ADeathMatch_PreLoadBot_Params
{
};

// Function UnrealGame.DeathMatch.PreLoadNamedBot
struct ADeathMatch_PreLoadNamedBot_Params
{
	struct FString                                     botname;                                                  // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.GetBotTeam2
struct ADeathMatch_GetBotTeam2_Params
{
	bool                                               forceTeam;                                                // (Parm)
	int                                                Team;                                                     // (Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.GetBotTeam
struct ADeathMatch_GetBotTeam_Params
{
	int                                                TeamBots;                                                 // (OptionalParm, Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.InitTeamSymbols
struct ADeathMatch_InitTeamSymbols_Params
{
};

// Function UnrealGame.DeathMatch.InitGameReplicationInfo
struct ADeathMatch_InitGameReplicationInfo_Params
{
};

// Function UnrealGame.DeathMatch.GetServerDetails
struct ADeathMatch_GetServerDetails_Params
{
	struct FServerResponseLine                         ServerState;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.NeedPlayers
struct ADeathMatch_NeedPlayers_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.Logout
struct ADeathMatch_Logout_Params
{
	class AController*                                 Exiting;                                                  // (Parm)
};

// Function UnrealGame.DeathMatch.AllowBecomeActivePlayer
struct ADeathMatch_AllowBecomeActivePlayer_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.BecomeSpectator
struct ADeathMatch_BecomeSpectator_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.ChangeName
struct ADeathMatch_ChangeName_Params
{
	class AController*                                 Other;                                                    // (Parm)
	struct FString                                     S;                                                        // (Parm, NeedCtorLink)
	bool                                               bNameChange;                                              // (Parm)
};

// Function UnrealGame.DeathMatch.ShouldRespawn
struct ADeathMatch_ShouldRespawn_Params
{
	class APickup*                                     Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.CanSpectate
struct ADeathMatch_CanSpectate_Params
{
	class APlayerController*                           Viewer;                                                   // (Parm)
	bool                                               bOnlySpectator;                                           // (Parm)
	class AActor*                                      ViewTarget;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.AddDefaultInventory
struct ADeathMatch_AddDefaultInventory_Params
{
	class APawn*                                       PlayerPawn;                                               // (Parm)
};

// Function UnrealGame.DeathMatch.AddBot
struct ADeathMatch_AddBot_Params
{
	struct FString                                     botname;                                                  // (OptionalParm, Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.ForceAddBot
struct ADeathMatch_ForceAddBot_Params
{
};

// Function UnrealGame.DeathMatch.TooManyBots
struct ADeathMatch_TooManyBots_Params
{
	class AController*                                 botToRemove;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.RestartPlayer
struct ADeathMatch_RestartPlayer_Params
{
	class AController*                                 aPlayer;                                                  // (Parm)
};

// Function UnrealGame.DeathMatch.ChangeLoadOut
struct ADeathMatch_ChangeLoadOut_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	struct FString                                     LoadoutName;                                              // (Parm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.PostLogin
struct ADeathMatch_PostLogin_Params
{
	class APlayerController*                           NewPlayer;                                                // (Parm)
};

// Function UnrealGame.DeathMatch.Login
struct ADeathMatch_Login_Params
{
	struct FString                                     Portal;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
	class APlayerController*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.AtCapacity
struct ADeathMatch_AtCapacity_Params
{
	bool                                               bSpectator;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.PlayWinMessage
struct ADeathMatch_PlayWinMessage_Params
{
	class APlayerController*                           Player;                                                   // (Parm)
	bool                                               bWinner;                                                  // (Parm)
};

// Function UnrealGame.DeathMatch.CheckEndGame
struct ADeathMatch_CheckEndGame_Params
{
	class APlayerReplicationInfo*                      Winner;                                                   // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.CheckEndGameCondition
struct ADeathMatch_CheckEndGameCondition_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.AcceptInventory
struct ADeathMatch_AcceptInventory_Params
{
	class APawn*                                       PlayerPawn;                                               // (Parm)
};

// Function UnrealGame.DeathMatch.GetMinPlayers
struct ADeathMatch_GetMinPlayers_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.TweakSkill
struct ADeathMatch_TweakSkill_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.DeathMatch.InitGame
struct ADeathMatch_InitGame_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.DeathMatch.AddGameSpecificInventory
struct ADeathMatch_AddGameSpecificInventory_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.DeathMatch.AllowTransloc
struct ADeathMatch_AllowTransloc_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.NeverAllowTransloc
struct ADeathMatch_NeverAllowTransloc_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.InitLogging
struct ADeathMatch_InitLogging_Params
{
};

// Function UnrealGame.DeathMatch.VehicleScoreKill
struct ADeathMatch_VehicleScoreKill_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class AVehicle*                                    DestroyedVehicle;                                         // (Parm)
	struct FString                                     KillInfo;                                                 // (Parm, OutParm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.Killed
struct ADeathMatch_Killed_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function UnrealGame.DeathMatch.CheckReady
struct ADeathMatch_CheckReady_Params
{
};

// Function UnrealGame.DeathMatch.JustStarted
struct ADeathMatch_JustStarted_Params
{
	float                                              t;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.Reset
struct ADeathMatch_Reset_Params
{
};

// Function UnrealGame.DeathMatch.OverrideInitialBots
struct ADeathMatch_OverrideInitialBots_Params
{
};

// Function UnrealGame.DeathMatch.PostBeginPlay
struct ADeathMatch_PostBeginPlay_Params
{
};

// Function UnrealGame.DeathMatch.PreBeginPlay
struct ADeathMatch_PreBeginPlay_Params
{
};

// Function UnrealGame.DeathMatch.GetTimeSecondsLeft
struct ADeathMatch_GetTimeSecondsLeft_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DeathMatch.SendBgmMessageBeginMatch
struct ADeathMatch_SendBgmMessageBeginMatch_Params
{
};

// Function UnrealGame.JumpSpot.TryTranslocator
struct AJumpSpot_TryTranslocator_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.JumpSpot.SuggestMovePreparation
struct AJumpSpot_SuggestMovePreparation_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.JumpSpot.SpecialCost
struct AJumpSpot_SpecialCost_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	class UReachSpec*                                  Path;                                                     // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.JumpSpot.EffectiveDoubleJump
struct AJumpSpot_EffectiveDoubleJump_Params
{
	class UReachSpec*                                  Path;                                                     // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.JumpSpot.CanDoubleJump
struct AJumpSpot_CanDoubleJump_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.JumpSpot.CanMakeJump
struct AJumpSpot_CanMakeJump_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	float                                              JumpHeight;                                               // (Parm)
	float                                              GroundSpeed;                                              // (Parm)
	int                                                Num;                                                      // (Parm)
	class AActor*                                      Start;                                                    // (Parm)
	bool                                               bForceCheck;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.JumpSpot.PostBeginPlay
struct AJumpSpot_PostBeginPlay_Params
{
};

// Function UnrealGame.UnrealScriptedSequence.HigherPriorityThan
struct AUnrealScriptedSequence_HigherPriorityThan_Params
{
	class AUnrealScriptedSequence*                     S;                                                        // (Parm)
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealScriptedSequence.BeginPlay
struct AUnrealScriptedSequence_BeginPlay_Params
{
};

// Function UnrealGame.UnrealScriptedSequence.CheckForErrors
struct AUnrealScriptedSequence_CheckForErrors_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealScriptedSequence.FreeScript
struct AUnrealScriptedSequence_FreeScript_Params
{
};

// Function UnrealGame.UnrealScriptedSequence.Reset
struct AUnrealScriptedSequence_Reset_Params
{
};

// Function UnrealGame.HoldSpot.FreeScript
struct AHoldSpot_FreeScript_Params
{
};

// Function UnrealGame.HoldSpot.GetMoveTarget
struct AHoldSpot_GetMoveTarget_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.EndGameTauntFor
struct ATeamGame_EndGameTauntFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.TeamGame.EndGameCommentFor
struct ATeamGame_EndGameCommentFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.TeamGame.PickEndGameTauntFor
struct ATeamGame_PickEndGameTauntFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.WeakObjectives
struct ATeamGame_WeakObjectives_Params
{
};

// Function UnrealGame.TeamGame.GetAllLoadHints
struct ATeamGame_GetAllLoadHints_Params
{
	bool                                               bThisClassOnly;                                           // (OptionalParm, Parm)
	TArray<struct FString>                             ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.PostLogin
struct ATeamGame_PostLogin_Params
{
	class APlayerController*                           NewPlayer;                                                // (Parm)
};

// Function UnrealGame.TeamGame.InitVoiceReplicationInfo
struct ATeamGame_InitVoiceReplicationInfo_Params
{
};

// Function UnrealGame.TeamGame.AnnounceScore
struct ATeamGame_AnnounceScore_Params
{
	int                                                ScoringTeam;                                              // (Parm)
};

// Function UnrealGame.TeamGame.AcceptPlayInfoProperty
struct ATeamGame_AcceptPlayInfoProperty_Params
{
	struct FString                                     PropertyName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetDescriptionText
struct ATeamGame_GetDescriptionText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.FillPlayInfo
struct ATeamGame_FillPlayInfo_Params
{
	class UPlayInfo*                                   PlayInfo;                                                 // (Parm)
};

// Function UnrealGame.TeamGame.FindNewObjectives
struct ATeamGame_FindNewObjectives_Params
{
	class AGameObjective*                              DisabledObjective;                                        // (Parm)
};

// Function UnrealGame.TeamGame.ParseMessageString
struct ATeamGame_ParseMessageString_Params
{
	class AMutator*                                    BaseMutator;                                              // (Parm)
	class AController*                                 Who;                                                      // (Parm)
	struct FString                                     Message;                                                  // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.FindTeamDesignation
struct ATeamGame_FindTeamDesignation_Params
{
	class AGameReplicationInfo*                        GRI;                                                      // (Parm)
	class AActor*                                      A;                                                        // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.ParseChatPercVar
struct ATeamGame_ParseChatPercVar_Params
{
	class AMutator*                                    BaseMutator;                                              // (Parm)
	class AController*                                 Who;                                                      // (Parm)
	struct FString                                     Cmd;                                                      // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.PlayEndOfMatchMessage
struct ATeamGame_PlayEndOfMatchMessage_Params
{
};

// Function UnrealGame.TeamGame.TooManyBots
struct ATeamGame_TooManyBots_Params
{
	class AController*                                 botToRemove;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.SameTeam
struct ATeamGame_SameTeam_Params
{
	class AController*                                 A;                                                        // (Parm)
	class AController*                                 B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.ReduceDamage
struct ATeamGame_ReduceDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class APawn*                                       injured;                                                  // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm, OutParm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                iWeaponType;                                              // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.SetTeamAssistPoint
struct ATeamGame_SetTeamAssistPoint_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Other;                                                    // (Parm)
};

// Function UnrealGame.TeamGame.ScoreKill
struct ATeamGame_ScoreKill_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Other;                                                    // (Parm)
};

// Function UnrealGame.TeamGame.NearGoal
struct ATeamGame_NearGoal_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.FindVictimsTarget
struct ATeamGame_FindVictimsTarget_Params
{
	class AController*                                 Other;                                                    // (Parm)
	class APawn*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.CriticalPlayer
struct ATeamGame_CriticalPlayer_Params
{
	class AController*                                 Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.AnnounceAlmostWinningTeam
struct ATeamGame_AnnounceAlmostWinningTeam_Params
{
};

// Function UnrealGame.TeamGame.AnnounceEndingWinningTeam
struct ATeamGame_AnnounceEndingWinningTeam_Params
{
};

// Function UnrealGame.TeamGame.AnnounceWinningTeam
struct ATeamGame_AnnounceWinningTeam_Params
{
};

// Function UnrealGame.TeamGame.CheckScore
struct ATeamGame_CheckScore_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
};

// Function UnrealGame.TeamGame.RatePlayerStart
struct ATeamGame_RatePlayerStart_Params
{
	class ANavigationPoint*                            N;                                                        // (Parm)
	unsigned char                                      Team;                                                     // (Parm)
	class AController*                                 Player;                                                   // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.ChangeTeam
struct ATeamGame_ChangeTeam_Params
{
	class AController*                                 Other;                                                    // (Parm)
	int                                                iTeamID;                                                  // (Parm)
	bool                                               bNewTeam;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetTeamID_by_Balancing
struct ATeamGame_GetTeamID_by_Balancing_Params
{
	int                                                iTeamID;                                                  // (Parm)
	class AController*                                 C;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.FindTeamFor
struct ATeamGame_FindTeamFor_Params
{
	class AController*                                 C;                                                        // (Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetBotTeam2
struct ATeamGame_GetBotTeam2_Params
{
	bool                                               forceTeam;                                                // (Parm)
	int                                                Team;                                                     // (Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetBotTeam
struct ATeamGame_GetBotTeam_Params
{
	int                                                TeamBots;                                                 // (OptionalParm, Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetServerDetails
struct ATeamGame_GetServerDetails_Params
{
	struct FServerResponseLine                         ServerState;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.CanSpectate
struct ATeamGame_CanSpectate_Params
{
	class APlayerController*                           Viewer;                                                   // (Parm)
	bool                                               bOnlySpectator;                                           // (Parm)
	class AActor*                                      ViewTarget;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.SetEndGameFocus
struct ATeamGame_SetEndGameFocus_Params
{
	class APlayerReplicationInfo*                      Winner;                                                   // (Parm)
};

// Function UnrealGame.TeamGame.CheckEndGame
struct ATeamGame_CheckEndGame_Params
{
	class APlayerReplicationInfo*                      Winner;                                                   // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.IncrementGoalsScored
struct ATeamGame_IncrementGoalsScored_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function UnrealGame.TeamGame.NotifyKilled
struct ATeamGame_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function UnrealGame.TeamGame.RestartPlayer
struct ATeamGame_RestartPlayer_Params
{
	class AController*                                 aPlayer;                                                  // (Parm)
};

// Function UnrealGame.TeamGame.ShowPathTo
struct ATeamGame_ShowPathTo_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                TeamNum;                                                  // (Parm)
};

// Function UnrealGame.TeamGame.CanShowPathTo
struct ATeamGame_CanShowPathTo_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                TeamNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetMinPlayers
struct ATeamGame_GetMinPlayers_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.InitTeamSymbols
struct ATeamGame_InitTeamSymbols_Params
{
};

// Function UnrealGame.TeamGame.InitGame
struct ATeamGame_InitGame_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.GetRedTeam
struct ATeamGame_GetRedTeam_Params
{
	int                                                TeamBots;                                                 // (Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetBlueTeam
struct ATeamGame_GetBlueTeam_Params
{
	int                                                TeamBots;                                                 // (Parm)
	class AUnrealTeamInfo*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.PreLoadBot
struct ATeamGame_PreLoadBot_Params
{
};

// Function UnrealGame.TeamGame.PreLoadNamedBot
struct ATeamGame_PreLoadNamedBot_Params
{
	struct FString                                     botname;                                                  // (Parm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.OverrideInitialBots
struct ATeamGame_OverrideInitialBots_Params
{
};

// Function UnrealGame.TeamGame.OtherTeam
struct ATeamGame_OtherTeam_Params
{
	class ATeamInfo*                                   Requester;                                                // (Parm)
	class ATeamInfo*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.CheckMaxLives
struct ATeamGame_CheckMaxLives_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.UpdateAnnouncements
struct ATeamGame_UpdateAnnouncements_Params
{
};

// Function UnrealGame.TeamGame.PrecacheGameAnnouncements
struct ATeamGame_PrecacheGameAnnouncements_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function UnrealGame.TeamGame.BallCarrierMessage
struct ATeamGame_BallCarrierMessage_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.GetStatus
struct ATeamGame_GetStatus_Params
{
	class APlayerController*                           Sender;                                                   // (Parm)
	class ABot*                                        B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.ParseVoiceCommand
struct ATeamGame_ParseVoiceCommand_Params
{
	class APlayerController*                           Sender;                                                   // (Parm)
	struct FString                                     RecognizedString;                                         // (Parm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.ParseRecipients
struct ATeamGame_ParseRecipients_Params
{
	int                                                RecipientIDs;                                             // (Parm, OutParm)
	int                                                NumRecipients;                                            // (Parm, OutParm)
	struct FString                                     OrderString;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.ParseRecipient
struct ATeamGame_ParseRecipient_Params
{
	struct FString                                     Recipient;                                                // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.ApplyOrder
struct ATeamGame_ApplyOrder_Params
{
	class APlayerController*                           Sender;                                                   // (Parm)
	int                                                RecipientID;                                              // (Parm)
	int                                                OrderID;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.ParseOrder
struct ATeamGame_ParseOrder_Params
{
	struct FString                                     OrderString;                                              // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.StartMatch
struct ATeamGame_StartMatch_Params
{
};

// Function UnrealGame.TeamGame.GetTeamScores
struct ATeamGame_GetTeamScores_Params
{
	TArray<int>                                        ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamGame.GetWaitViewClass
struct ATeamGame_GetWaitViewClass_Params
{
	unsigned char                                      Team;                                                     // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamGame.SetGrammar
struct ATeamGame_SetGrammar_Params
{
};

// Function UnrealGame.TeamGame.PostBeginPlay
struct ATeamGame_PostBeginPlay_Params
{
};

// Function UnrealGame.GameObjective.SetTeam
struct AGameObjective_SetTeam_Params
{
	unsigned char                                      TeamIndex;                                                // (Parm)
};

// Function UnrealGame.GameObjective.AwardAssaultScore
struct AGameObjective_AwardAssaultScore_Params
{
	int                                                Score;                                                    // (Parm)
};

// Function UnrealGame.GameObjective.ShareScore
struct AGameObjective_ShareScore_Params
{
	int                                                Score;                                                    // (Parm)
	struct FString                                     EventDesc;                                                // (Parm, NeedCtorLink)
};

// Function UnrealGame.GameObjective.AddScorer
struct AGameObjective_AddScorer_Params
{
	class AController*                                 C;                                                        // (Parm)
	float                                              Pct;                                                      // (Parm)
};

// Function UnrealGame.GameObjective.UpdatePrecacheMaterials
struct AGameObjective_UpdatePrecacheMaterials_Params
{
};

// Function UnrealGame.GameObjective.GetObjectiveProgress
struct AGameObjective_GetObjectiveProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.SetObjectiveOverlay
struct AGameObjective_SetObjectiveOverlay_Params
{
	bool                                               bShow;                                                    // (Parm)
};

// Function UnrealGame.GameObjective.PostNetReceive
struct AGameObjective_PostNetReceive_Params
{
};

// Function UnrealGame.GameObjective.HighlightPhysicalObjective
struct AGameObjective_HighlightPhysicalObjective_Params
{
	bool                                               bShow;                                                    // (Parm)
};

// Function UnrealGame.GameObjective.PrecacheAnnouncer
struct AGameObjective_PrecacheAnnouncer_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function UnrealGame.GameObjective.Trigger
struct AGameObjective_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       Instigator;                                               // (Parm)
};

// Function UnrealGame.GameObjective.CheckPlayCriticalAlarm
struct AGameObjective_CheckPlayCriticalAlarm_Params
{
};

// Function UnrealGame.GameObjective.SetCriticalStatus
struct AGameObjective_SetCriticalStatus_Params
{
	bool                                               bNewCriticalStatus;                                       // (Parm)
};

// Function UnrealGame.GameObjective.IsCritical
struct AGameObjective_IsCritical_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.IsActive
struct AGameObjective_IsActive_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.SetActive
struct AGameObjective_SetActive_Params
{
	bool                                               bActiveStatus;                                            // (Parm)
};

// Function UnrealGame.GameObjective.Reset
struct AGameObjective_Reset_Params
{
};

// Function UnrealGame.GameObjective.BetterObjectiveThan
struct AGameObjective_BetterObjectiveThan_Params
{
	class AGameObjective*                              Best;                                                     // (Parm)
	unsigned char                                      DesiredTeamNum;                                           // (Parm)
	unsigned char                                      RequesterTeamNum;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.PlayDestructionMessage
struct AGameObjective_PlayDestructionMessage_Params
{
};

// Function UnrealGame.GameObjective.DisableObjective
struct AGameObjective_DisableObjective_Params
{
	class APawn*                                       Instigator;                                               // (Parm)
};

// Function UnrealGame.GameObjective.CompleteObjective
struct AGameObjective_CompleteObjective_Params
{
	class APawn*                                       Instigator;                                               // (Parm)
};

// Function UnrealGame.GameObjective.GetNumDefenders
struct AGameObjective_GetNumDefenders_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.TellBotHowToDisable
struct AGameObjective_TellBotHowToDisable_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.GetHumanReadableName
struct AGameObjective_GetHumanReadableName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.GameObjective.OwnsDefenseScript
struct AGameObjective_OwnsDefenseScript_Params
{
	class AUnrealScriptedSequence*                     S;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.Timer
struct AGameObjective_Timer_Params
{
};

// Function UnrealGame.GameObjective.NearObjective
struct AGameObjective_NearObjective_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.BotNearObjective
struct AGameObjective_BotNearObjective_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.PlayAlarm
struct AGameObjective_PlayAlarm_Params
{
};

// Function UnrealGame.GameObjective.UpdateLocationName
struct AGameObjective_UpdateLocationName_Params
{
};

// Function UnrealGame.GameObjective.ForceBegin
struct AGameObjective_ForceBegin_Params
{
};

// Function UnrealGame.GameObjective.PostBeginPlay
struct AGameObjective_PostBeginPlay_Params
{
};

// Function UnrealGame.GameObjective.PreBeginPlay
struct AGameObjective_PreBeginPlay_Params
{
};

// Function UnrealGame.GameObjective.CanDoubleJump
struct AGameObjective_CanDoubleJump_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.GameObjective.GetDifficulty
struct AGameObjective_GetDifficulty_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.GetObjectiveProgress
struct ADestroyableObjective_GetObjectiveProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.IsCritical
struct ADestroyableObjective_IsCritical_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.TimerPop
struct ADestroyableObjective_TimerPop_Params
{
	class AVolumeTimer*                                t;                                                        // (Parm)
};

// Function UnrealGame.DestroyableObjective.DisableObjective
struct ADestroyableObjective_DisableObjective_Params
{
	class APawn*                                       Instigator;                                               // (Parm)
};

// Function UnrealGame.DestroyableObjective.HealDamage
struct ADestroyableObjective_HealDamage_Params
{
	int                                                Amount;                                                   // (Parm)
	class AController*                                 Healer;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.AwardAssaultScore
struct ADestroyableObjective_AwardAssaultScore_Params
{
	int                                                Score;                                                    // (Parm)
};

// Function UnrealGame.DestroyableObjective.TakeDamage
struct ADestroyableObjective_TakeDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function UnrealGame.DestroyableObjective.Reset
struct ADestroyableObjective_Reset_Params
{
};

// Function UnrealGame.DestroyableObjective.TellBotHowToHeal
struct ADestroyableObjective_TellBotHowToHeal_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.NearObjective
struct ADestroyableObjective_NearObjective_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.TellBotHowToDisable
struct ADestroyableObjective_TellBotHowToDisable_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.LegitimateTargetOf
struct ADestroyableObjective_LegitimateTargetOf_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.KillEnemyFirst
struct ADestroyableObjective_KillEnemyFirst_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.GetShootTarget
struct ADestroyableObjective_GetShootTarget_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.TeamLink
struct ADestroyableObjective_TeamLink_Params
{
	int                                                TeamNum;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.Destroyed
struct ADestroyableObjective_Destroyed_Params
{
};

// Function UnrealGame.DestroyableObjective.SetDelayedDamageInstigatorController
struct ADestroyableObjective_SetDelayedDamageInstigatorController_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.DestroyableObjective.SpecialCost
struct ADestroyableObjective_SpecialCost_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	class UReachSpec*                                  Path;                                                     // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DestroyableObjective.PostBeginPlay
struct ADestroyableObjective_PostBeginPlay_Params
{
};

// Function UnrealGame.RestingFormation.GetViewPointFor
struct ARestingFormation_GetViewPointFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
	int                                                pos;                                                      // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RestingFormation.GetLocationFor
struct ARestingFormation_GetLocationFor_Params
{
	int                                                pos;                                                      // (Parm)
	class ABot*                                        B;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RestingFormation.RecommendPositionFor
struct ARestingFormation_RecommendPositionFor_Params
{
	class ABot*                                        B;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RestingFormation.SetFormation
struct ARestingFormation_SetFormation_Params
{
	class ABot*                                        B;                                                        // (Parm)
	int                                                pos;                                                      // (Parm)
	bool                                               bFullCheck;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.RestingFormation.LeaveFormation
struct ARestingFormation_LeaveFormation_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.UnrealTeamInfo.RemoveFromTeam
struct AUnrealTeamInfo_RemoveFromTeam_Params
{
	class AController*                                 Other;                                                    // (Parm)
};

// Function UnrealGame.UnrealTeamInfo.SetBotOrders
struct AUnrealTeamInfo_SetBotOrders_Params
{
	class ABot*                                        NewBot;                                                   // (Parm)
	class URosterEntry*                                R;                                                        // (Parm)
};

// Function UnrealGame.UnrealTeamInfo.BelongsOnTeam
struct AUnrealTeamInfo_BelongsOnTeam_Params
{
	class UClass*                                      PawnClass;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.AddToTeam
struct AUnrealTeamInfo_AddToTeam_Params
{
	class AController*                                 Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.GetNamedBot
struct AUnrealTeamInfo_GetNamedBot_Params
{
	struct FString                                     botname;                                                  // (Parm, NeedCtorLink)
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.GetNextBot
struct AUnrealTeamInfo_GetNextBot_Params
{
	struct FString                                     botname;                                                  // (Parm, NeedCtorLink)
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.AddNamedBot
struct AUnrealTeamInfo_AddNamedBot_Params
{
	struct FString                                     botname;                                                  // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealTeamInfo.AddRandomPlayer
struct AUnrealTeamInfo_AddRandomPlayer_Params
{
};

// Function UnrealGame.UnrealTeamInfo.AlreadyExistsEntry
struct AUnrealTeamInfo_AlreadyExistsEntry_Params
{
	struct FString                                     CharacterName;                                            // (Parm, NeedCtorLink)
	bool                                               bNoRecursion;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.GetRandomPlayer
struct AUnrealTeamInfo_GetRandomPlayer_Params
{
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.ChooseBotClass
struct AUnrealTeamInfo_ChooseBotClass_Params
{
	struct FString                                     botname;                                                  // (OptionalParm, Parm, NeedCtorLink)
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.NeedsBotMoreThan
struct AUnrealTeamInfo_NeedsBotMoreThan_Params
{
	class AUnrealTeamInfo*                             t;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.NextLoadOut
struct AUnrealTeamInfo_NextLoadOut_Params
{
	class UClass*                                      CurrentLoadout;                                           // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.FillPlayerTeam
struct AUnrealTeamInfo_FillPlayerTeam_Params
{
	class UGameProfile*                                G;                                                        // (Parm)
};

// Function UnrealGame.UnrealTeamInfo.Initialize
struct AUnrealTeamInfo_Initialize_Params
{
	int                                                TeamBots;                                                 // (Parm)
};

// Function UnrealGame.UnrealTeamInfo.AllBotsSpawned
struct AUnrealTeamInfo_AllBotsSpawned_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.OverrideInitialBots
struct AUnrealTeamInfo_OverrideInitialBots_Params
{
	int                                                N;                                                        // (Parm)
	class AUnrealTeamInfo*                             t;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamInfo.Reset
struct AUnrealTeamInfo_Reset_Params
{
};

// Function UnrealGame.ShootTarget.Trigger
struct AShootTarget_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function UnrealGame.ShootTarget.TakeDamage
struct AShootTarget_TakeDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function UnrealGame.ProximityObjective.TellBotHowToDisable
struct AProximityObjective_TellBotHowToDisable_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.ProximityObjective.SetActive
struct AProximityObjective_SetActive_Params
{
	bool                                               bActiveStatus;                                            // (Parm)
};

// Function UnrealGame.ProximityObjective.FindInstigator
struct AProximityObjective_FindInstigator_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	class APawn*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.ProximityObjective.IsRelevant
struct AProximityObjective_IsRelevant_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               bAliveCheck;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.ProximityObjective.Touch
struct AProximityObjective_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.HoldObjective.UpdatePrecacheMaterials
struct AHoldObjective_UpdatePrecacheMaterials_Params
{
};

// Function UnrealGame.HoldObjective.SetObjectiveOverlay
struct AHoldObjective_SetObjectiveOverlay_Params
{
	bool                                               bShow;                                                    // (Parm)
};

// Function UnrealGame.HoldObjective.IsCritical
struct AHoldObjective_IsCritical_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.HoldObjective.GetObjectiveProgress
struct AHoldObjective_GetObjectiveProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.HoldObjective.Reset
struct AHoldObjective_Reset_Params
{
};

// Function UnrealGame.HoldObjective.CompleteObjective
struct AHoldObjective_CompleteObjective_Params
{
	class APawn*                                       Instigator;                                               // (Parm)
};

// Function UnrealGame.HoldObjective.Trigger
struct AHoldObjective_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       Instigator;                                               // (Parm)
};

// Function UnrealGame.HoldObjective.AwardAssaultScore
struct AHoldObjective_AwardAssaultScore_Params
{
	int                                                Score;                                                    // (Parm)
};

// Function UnrealGame.HoldObjective.RemoveTouchingPlayer
struct AHoldObjective_RemoveTouchingPlayer_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.HoldObjective.AddNewTouchingPlayer
struct AHoldObjective_AddNewTouchingPlayer_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function UnrealGame.HoldObjective.PlayerToucherDied
struct AHoldObjective_PlayerToucherDied_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.HoldObjective.UnTouch
struct AHoldObjective_UnTouch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.HoldObjective.Touch
struct AHoldObjective_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.HoldObjective.TellBotHowToDisable
struct AHoldObjective_TellBotHowToDisable_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.HoldObjective.PostBeginPlay
struct AHoldObjective_PostBeginPlay_Params
{
};

// Function UnrealGame.TeamAI.RemoveFromTeam
struct ATeamAI_RemoveFromTeam_Params
{
	class AController*                                 Other;                                                    // (Parm)
};

// Function UnrealGame.TeamAI.CallForHelp
struct ATeamAI_CallForHelp_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.TeamAI.SetOrders
struct ATeamAI_SetOrders_Params
{
	class ABot*                                        B;                                                        // (Parm)
	struct FName                                       NewOrders;                                                // (Parm)
	class AController*                                 OrderGiver;                                               // (Parm)
};

// Function UnrealGame.TeamAI.SetBotOrders
struct ATeamAI_SetBotOrders_Params
{
	class ABot*                                        NewBot;                                                   // (Parm)
	class URosterEntry*                                R;                                                        // (Parm)
};

// Function UnrealGame.TeamAI.PutOnFreelance
struct ATeamAI_PutOnFreelance_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.TeamAI.PutOnOffense
struct ATeamAI_PutOnOffense_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.TeamAI.PutOnDefense
struct ATeamAI_PutOnDefense_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.GetPriorityFreelanceObjective
struct ATeamAI_GetPriorityFreelanceObjective_Params
{
	class AGameObjective*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.GetPriorityAttackObjectiveFor
struct ATeamAI_GetPriorityAttackObjectiveFor_Params
{
	class ASquadAI*                                    AttackSquad;                                              // (Parm)
	class AGameObjective*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.GetPriorityAttackObjective
struct ATeamAI_GetPriorityAttackObjective_Params
{
	class AGameObjective*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.GetMostDefendedObjective
struct ATeamAI_GetMostDefendedObjective_Params
{
	class AGameObjective*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.GetLeastDefendedObjective
struct ATeamAI_GetLeastDefendedObjective_Params
{
	class AGameObjective*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.AddSquadWithLeader
struct ATeamAI_AddSquadWithLeader_Params
{
	class AController*                                 C;                                                        // (Parm)
	class AGameObjective*                              o;                                                        // (Parm)
	class ASquadAI*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.PutBotOnSquadLedBy
struct ATeamAI_PutBotOnSquadLedBy_Params
{
	class AController*                                 C;                                                        // (Parm)
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.TeamAI.AddHumanSquad
struct ATeamAI_AddHumanSquad_Params
{
	class ASquadAI*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.FindHumanSquad
struct ATeamAI_FindHumanSquad_Params
{
	class ASquadAI*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.SetObjectiveLists
struct ATeamAI_SetObjectiveLists_Params
{
};

// Function UnrealGame.TeamAI.FriendlyToward
struct ATeamAI_FriendlyToward_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.FindSquadOf
struct ATeamAI_FindSquadOf_Params
{
	class AController*                                 C;                                                        // (Parm)
	class ASquadAI*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.OnThisTeam
struct ATeamAI_OnThisTeam_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.RemoveSquad
struct ATeamAI_RemoveSquad_Params
{
	class ASquadAI*                                    Squad;                                                    // (Parm)
};

// Function UnrealGame.TeamAI.FindNewObjectiveFor
struct ATeamAI_FindNewObjectiveFor_Params
{
	class ASquadAI*                                    S;                                                        // (Parm)
	bool                                               bForceUpdate;                                             // (Parm)
};

// Function UnrealGame.TeamAI.FindNewObjectives
struct ATeamAI_FindNewObjectives_Params
{
	class AGameObjective*                              DisabledObjective;                                        // (Parm)
};

// Function UnrealGame.TeamAI.NotifyKilled
struct ATeamAI_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function UnrealGame.TeamAI.ReAssessStrategy
struct ATeamAI_ReAssessStrategy_Params
{
};

// Function UnrealGame.TeamAI.GetSquadLedBy
struct ATeamAI_GetSquadLedBy_Params
{
	class AController*                                 C;                                                        // (Parm)
	class ASquadAI*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.ClearEnemies
struct ATeamAI_ClearEnemies_Params
{
};

// Function UnrealGame.TeamAI.Reset
struct ATeamAI_Reset_Params
{
};

// Function UnrealGame.TeamAI.SuperPickupAvailable
struct ATeamAI_SuperPickupAvailable_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamAI.CallForBall
struct ATeamAI_CallForBall_Params
{
	class APawn*                                       Recipient;                                                // (Parm)
};

// Function UnrealGame.TeamAI.CriticalObjectiveWarning
struct ATeamAI_CriticalObjectiveWarning_Params
{
	class AGameObjective*                              G;                                                        // (Parm)
	class APawn*                                       NewEnemy;                                                 // (Parm)
};

// Function UnrealGame.TeamAI.Timer
struct ATeamAI_Timer_Params
{
};

// Function UnrealGame.TeamAI.PostBeginPlay
struct ATeamAI_PostBeginPlay_Params
{
};

// Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleDeathDriving
struct ATeamPlayerReplicationInfo_AddVehicleDeathDriving_Params
{
	class UClass*                                      V;                                                        // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleDeath
struct ATeamPlayerReplicationInfo_AddVehicleDeath_Params
{
	class UClass*                                      D;                                                        // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleKill
struct ATeamPlayerReplicationInfo_AddVehicleKill_Params
{
	class UClass*                                      D;                                                        // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.UpdateVehicleStats
struct ATeamPlayerReplicationInfo_UpdateVehicleStats_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	class UClass*                                      V;                                                        // (Parm)
	int                                                newKills;                                                 // (Parm)
	int                                                newDeaths;                                                // (Parm)
	int                                                newDeathsDriving;                                         // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponDeathHolding
struct ATeamPlayerReplicationInfo_AddWeaponDeathHolding_Params
{
	class UClass*                                      W;                                                        // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponDeath
struct ATeamPlayerReplicationInfo_AddWeaponDeath_Params
{
	class UClass*                                      D;                                                        // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponKill
struct ATeamPlayerReplicationInfo_AddWeaponKill_Params
{
	class UClass*                                      D;                                                        // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.UpdateWeaponStats
struct ATeamPlayerReplicationInfo_UpdateWeaponStats_Params
{
	class ATeamPlayerReplicationInfo*                  PRI;                                                      // (Parm)
	class UClass*                                      W;                                                        // (Parm)
	int                                                newKills;                                                 // (Parm)
	int                                                newDeaths;                                                // (Parm)
	int                                                newDeathsHolding;                                         // (Parm)
};

// Function UnrealGame.TeamPlayerReplicationInfo.PostBeginPlay
struct ATeamPlayerReplicationInfo_PostBeginPlay_Params
{
};

// Function UnrealGame.SpecialVehicleObjective.Reset
struct ASpecialVehicleObjective_Reset_Params
{
};

// Function UnrealGame.SpecialVehicleObjective.UnTrigger
struct ASpecialVehicleObjective_UnTrigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function UnrealGame.SpecialVehicleObjective.Trigger
struct ASpecialVehicleObjective_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function UnrealGame.SpecialVehicleObjective.IsAccessibleTo
struct ASpecialVehicleObjective_IsAccessibleTo_Params
{
	class APawn*                                       BotPawn;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SpecialVehicleObjective.PostBeginPlay
struct ASpecialVehicleObjective_PostBeginPlay_Params
{
};

// Function UnrealGame.AssaultPath.FindPreviousPath
struct AAssaultPath_FindPreviousPath_Params
{
	struct FName                                       AlternatePathTag;                                         // (Parm)
	class AAssaultPath*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.AssaultPath.FindNextPath
struct AAssaultPath_FindNextPath_Params
{
	struct FName                                       AlternatePathTag;                                         // (Parm)
	class AAssaultPath*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.AssaultPath.HasPathTag
struct AAssaultPath_HasPathTag_Params
{
	struct FName                                       aPathTag;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.AssaultPath.PickTag
struct AAssaultPath_PickTag_Params
{
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.AssaultPath.AddTo
struct AAssaultPath_AddTo_Params
{
	class AGameObjective*                              o;                                                        // (Parm)
};

// Function UnrealGame.AssaultPath.ValidatePathTags
struct AAssaultPath_ValidatePathTags_Params
{
};

// Function UnrealGame.AssaultPath.Trigger
struct AAssaultPath_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function UnrealGame.DMStatsScreen.NextStats
struct ADMStatsScreen_NextStats_Params
{
};

// Function UnrealGame.DMStatsScreen.DrawScoreboard
struct ADMStatsScreen_DrawScoreboard_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function UnrealGame.DMStatsScreen.MakeColorCode
struct ADMStatsScreen_MakeColorCode_Params
{
	struct FColor                                      NewColor;                                                 // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.DestroyVoiceChannel
struct AUnrealVoiceReplicationInfo_DestroyVoiceChannel_Params
{
	class AVoiceChatRoom*                              Channel;                                                  // (Parm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.CreateNewVoiceChannel
struct AUnrealVoiceReplicationInfo_CreateNewVoiceChannel_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (OptionalParm, Parm)
	class AVoiceChatRoom*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.IsMember
struct AUnrealVoiceReplicationInfo_IsMember_Params
{
	class APlayerReplicationInfo*                      TestPRI;                                                  // (Parm)
	int                                                ChannelIndex;                                             // (Parm)
	bool                                               bNoCascade;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetPlayerChannelCount
struct AUnrealVoiceReplicationInfo_GetPlayerChannelCount_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetPublicChannelCount
struct AUnrealVoiceReplicationInfo_GetPublicChannelCount_Params
{
	bool                                               bSingleTeam;                                              // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetPlayerChannels
struct AUnrealVoiceReplicationInfo_GetPlayerChannels_Params
{
	TArray<class AVoiceChatRoom*>                      ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetPublicChannels
struct AUnrealVoiceReplicationInfo_GetPublicChannels_Params
{
	TArray<class AVoiceChatRoom*>                      ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelIndex
struct AUnrealVoiceReplicationInfo_GetChannelIndex_Params
{
	struct FString                                     ChannelTitle;                                             // (Parm, NeedCtorLink)
	int                                                TeamIndex;                                                // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelCount
struct AUnrealVoiceReplicationInfo_GetChannelCount_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannels
struct AUnrealVoiceReplicationInfo_GetChannels_Params
{
	TArray<class AVoiceChatRoom*>                      ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetMemberChannels
struct AUnrealVoiceReplicationInfo_GetMemberChannels_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	TArray<int>                                        ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelMembersAt
struct AUnrealVoiceReplicationInfo_GetChannelMembersAt_Params
{
	int                                                Index;                                                    // (Parm)
	TArray<int>                                        ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelMembers
struct AUnrealVoiceReplicationInfo_GetChannelMembers_Params
{
	struct FString                                     ChatRoomName;                                             // (Parm, NeedCtorLink)
	int                                                TeamIndex;                                                // (OptionalParm, Parm)
	TArray<int>                                        ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelAt
struct AUnrealVoiceReplicationInfo_GetChannelAt_Params
{
	int                                                Index;                                                    // (Parm)
	class AVoiceChatRoom*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannel
struct AUnrealVoiceReplicationInfo_GetChannel_Params
{
	struct FString                                     ChatRoomName;                                             // (Parm, NeedCtorLink)
	int                                                TeamIndex;                                                // (OptionalParm, Parm)
	class AVoiceChatRoom*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.RemoveVoiceChannel
struct AUnrealVoiceReplicationInfo_RemoveVoiceChannel_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.AddVoiceChannel
struct AUnrealVoiceReplicationInfo_AddVoiceChannel_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (OptionalParm, Parm)
	class AVoiceChatRoom*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.LeaveChannel
struct AUnrealVoiceReplicationInfo_LeaveChannel_Params
{
	struct FString                                     ChannelTitle;                                             // (Parm, NeedCtorLink)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.JoinChannelAt
struct AUnrealVoiceReplicationInfo_JoinChannelAt_Params
{
	int                                                ChannelIndex;                                             // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	TEnumAsByte<EJoinChatResult>                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.JoinChannel
struct AUnrealVoiceReplicationInfo_JoinChannel_Params
{
	struct FString                                     ChannelTitle;                                             // (Parm, NeedCtorLink)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	TEnumAsByte<EJoinChatResult>                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.CanJoinChannel
struct AUnrealVoiceReplicationInfo_CanJoinChannel_Params
{
	struct FString                                     ChannelTitle;                                             // (Parm, NeedCtorLink)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.RemoveVoiceChatter
struct AUnrealVoiceReplicationInfo_RemoveVoiceChatter_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.AddVoiceChatter
struct AUnrealVoiceReplicationInfo_AddVoiceChatter_Params
{
	class APlayerReplicationInfo*                      NewPRI;                                                   // (Parm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.InitChannels
struct AUnrealVoiceReplicationInfo_InitChannels_Params
{
};

// Function UnrealGame.UnrealVoiceReplicationInfo.SetGRI
struct AUnrealVoiceReplicationInfo_SetGRI_Params
{
	class AGameReplicationInfo*                        NewGRI;                                                   // (Parm)
};

// Function UnrealGame.UnrealVoiceReplicationInfo.PostNetBeginPlay
struct AUnrealVoiceReplicationInfo_PostNetBeginPlay_Params
{
};

// Function UnrealGame.UnrealVoiceReplicationInfo.PostBeginPlay
struct AUnrealVoiceReplicationInfo_PostBeginPlay_Params
{
};

// Function UnrealGame.UnrealVoiceReplicationInfo.DisplayDebug
struct AUnrealVoiceReplicationInfo_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function UnrealGame.UnrealChatHandler.AcceptBroadcastVoice
struct AUnrealChatHandler_AcceptBroadcastVoice_Params
{
	class APlayerController*                           Receiver;                                                 // (Parm)
	class APlayerReplicationInfo*                      Sender;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatHandler.AcceptBroadcastSpeech
struct AUnrealChatHandler_AcceptBroadcastSpeech_Params
{
	class APlayerController*                           Receiver;                                                 // (Parm)
	class APlayerReplicationInfo*                      SenderPRI;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatHandler.AcceptBroadcastLocalized
struct AUnrealChatHandler_AcceptBroadcastLocalized_Params
{
	class APlayerController*                           Receiver;                                                 // (Parm)
	class AActor*                                      Sender;                                                   // (Parm)
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     obj;                                                      // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatHandler.AcceptBroadcastText
struct AUnrealChatHandler_AcceptBroadcastText_Params
{
	class APlayerController*                           Receiver;                                                 // (Parm)
	class APlayerReplicationInfo*                      SenderPRI;                                                // (Parm)
	struct FString                                     Msg;                                                      // (Parm, OutParm, NeedCtorLink)
	struct FName                                       Type;                                                     // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatHandler.DoChatDebug
struct AUnrealChatHandler_DoChatDebug_Params
{
};

// Function UnrealGame.UnrealChatHandler.ToggleChatDebug
struct AUnrealChatHandler_ToggleChatDebug_Params
{
};

// Function UnrealGame.StartupMessage.GotoHud
struct AStartupMessage_GotoHud_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.StartupMessage.GetString
struct AStartupMessage_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.StartupMessage.ClientReceive
struct AStartupMessage_ClientReceive_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function UnrealGame.IdleKickWarningMessage.GetString
struct AIdleKickWarningMessage_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.AnnounceAdrenaline.Timer
struct AAnnounceAdrenaline_Timer_Params
{
};

// Function UnrealGame.CustomBotConfig.IndexFor
struct UCustomBotConfig_IndexFor_Params
{
	struct FString                                     PlayerName;                                               // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.CustomBotConfig.AggressivenessRating
struct UCustomBotConfig_AggressivenessRating_Params
{
	struct FCustomConfiguration                        cc;                                                       // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.CustomBotConfig.TacticsRating
struct UCustomBotConfig_TacticsRating_Params
{
	struct FCustomConfiguration                        cc;                                                       // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.CustomBotConfig.AgilityRating
struct UCustomBotConfig_AgilityRating_Params
{
	struct FCustomConfiguration                        cc;                                                       // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.CustomBotConfig.AccuracyRating
struct UCustomBotConfig_AccuracyRating_Params
{
	struct FCustomConfiguration                        cc;                                                       // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.CustomBotConfig.RatingModifier
struct UCustomBotConfig_RatingModifier_Params
{
	struct FString                                     CharacterName;                                            // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.CustomBotConfig.GetFavoriteWeaponFor
struct UCustomBotConfig_GetFavoriteWeaponFor_Params
{
	struct FCustomConfiguration                        cc;                                                       // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.CustomBotConfig.Customize
struct UCustomBotConfig_Customize_Params
{
	class URosterEntry*                                R;                                                        // (Parm)
};

// Function UnrealGame.KillingSpreeMessage.ClientReceive
struct AKillingSpreeMessage_ClientReceive_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function UnrealGame.KillingSpreeMessage.GetString
struct AKillingSpreeMessage_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.KillingSpreeMessage.GetRelatedString
struct AKillingSpreeMessage_GetRelatedString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.KillingSpreeMessage.GetFontSize
struct AKillingSpreeMessage_GetFontSize_Params
{
	int                                                Switch;                                                   // (Parm)
	class APlayerReplicationInfo*                      RelatedPRI1;                                              // (Parm)
	class APlayerReplicationInfo*                      RelatedPRI2;                                              // (Parm)
	class APlayerReplicationInfo*                      LocalPlayer;                                              // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.AssignSquadResponsibility
struct ADMSquad_AssignSquadResponsibility_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.FriendlyToward
struct ADMSquad_FriendlyToward_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.SetEnemy
struct ADMSquad_SetEnemy_Params
{
	class ABot*                                        B;                                                        // (Parm)
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.GetOrders
struct ADMSquad_GetOrders_Params
{
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.BeDevious
struct ADMSquad_BeDevious_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.NearFormationCenter
struct ADMSquad_NearFormationCenter_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.WaitAtThisPosition
struct ADMSquad_WaitAtThisPosition_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.CheckSquadObjectives
struct ADMSquad_CheckSquadObjectives_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.ShouldDeferTo
struct ADMSquad_ShouldDeferTo_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.RemoveBot
struct ADMSquad_RemoveBot_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.DMSquad.AddBot
struct ADMSquad_AddBot_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.DMSquad.IsDefending
struct ADMSquad_IsDefending_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMSquad.DisplayDebug
struct ADMSquad_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function UnrealGame.DMSquad.AssignCombo
struct ADMSquad_AssignCombo_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function UnrealGame.WeaponDamageType.GetWeaponClass
struct AWeaponDamageType_GetWeaponClass_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.LevelGameRules.UpdateGame
struct ALevelGameRules_UpdateGame_Params
{
	class AGameInfo*                                   G;                                                        // (Parm)
};

// Function UnrealGame.LevelGameRules.PreBeginPlay
struct ALevelGameRules_PreBeginPlay_Params
{
};

// Function UnrealGame.UnrealPlayerChatManager.Count
struct AUnrealPlayerChatManager_Count_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.IsLocal
struct AUnrealPlayerChatManager_IsLocal_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.IsValid
struct AUnrealPlayerChatManager_IsValid_Params
{
	int                                                i;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.GetHashIndex
struct AUnrealPlayerChatManager_GetHashIndex_Params
{
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.GetIDIndex
struct AUnrealPlayerChatManager_GetIDIndex_Params
{
	int                                                PlayerID;                                                 // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.GetPlayerHash
struct AUnrealPlayerChatManager_GetPlayerHash_Params
{
	int                                                PlayerID;                                                 // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayerChatManager.ClientIsBanned
struct AUnrealPlayerChatManager_ClientIsBanned_Params
{
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.GetPlayerRestriction
struct AUnrealPlayerChatManager_GetPlayerRestriction_Params
{
	int                                                PlayerID;                                                 // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.UnMergeRestriction
struct AUnrealPlayerChatManager_UnMergeRestriction_Params
{
	int                                                Index;                                                    // (Parm)
	unsigned char                                      NewType;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.MergeRestriction
struct AUnrealPlayerChatManager_MergeRestriction_Params
{
	int                                                Index;                                                    // (Parm)
	unsigned char                                      NewType;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.ClearRestrictionID
struct AUnrealPlayerChatManager_ClearRestrictionID_Params
{
	int                                                PlayerID;                                                 // (Parm)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.ClearRestriction
struct AUnrealPlayerChatManager_ClearRestriction_Params
{
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.AddRestrictionID
struct AUnrealPlayerChatManager_AddRestrictionID_Params
{
	int                                                PlayerID;                                                 // (Parm)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.AddRestriction
struct AUnrealPlayerChatManager_AddRestriction_Params
{
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.SetRestrictionID
struct AUnrealPlayerChatManager_SetRestrictionID_Params
{
	int                                                PlayerID;                                                 // (Parm)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.SetRestriction
struct AUnrealPlayerChatManager_SetRestriction_Params
{
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	unsigned char                                      Type;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.IsBanned
struct AUnrealPlayerChatManager_IsBanned_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.AcceptVoice
struct AUnrealPlayerChatManager_AcceptVoice_Params
{
	class APlayerReplicationInfo*                      SenderPRI;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.AcceptSpeech
struct AUnrealPlayerChatManager_AcceptSpeech_Params
{
	class APlayerReplicationInfo*                      SenderPRI;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.AcceptText
struct AUnrealPlayerChatManager_AcceptText_Params
{
	class APlayerReplicationInfo*                      Sender;                                                   // (Parm)
	struct FString                                     Msg;                                                      // (Parm, OutParm, NeedCtorLink)
	struct FName                                       Type;                                                     // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.UnTrackPlayer
struct AUnrealPlayerChatManager_UnTrackPlayer_Params
{
	int                                                PlayerID;                                                 // (Parm)
};

// Function UnrealGame.UnrealPlayerChatManager.TrackNewPlayer
struct AUnrealPlayerChatManager_TrackNewPlayer_Params
{
	int                                                PlayerID;                                                 // (Parm)
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	struct FString                                     PlayerAddress;                                            // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayerChatManager.ReceiveBanInfo
struct AUnrealPlayerChatManager_ReceiveBanInfo_Params
{
	struct FString                                     S;                                                        // (Parm, NeedCtorLink)
};

// Function UnrealGame.UnrealPlayerChatManager.StoreChatBan
struct AUnrealPlayerChatManager_StoreChatBan_Params
{
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	unsigned char                                      Restriction;                                              // (Parm)
};

// Function UnrealGame.UnrealPlayerChatManager.LoadChatBan
struct AUnrealPlayerChatManager_LoadChatBan_Params
{
	struct FString                                     PlayerHash;                                               // (Parm, NeedCtorLink)
	unsigned char                                      OutRestriction;                                           // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealPlayerChatManager.LogChatRestriction
struct AUnrealPlayerChatManager_LogChatRestriction_Params
{
	int                                                i;                                                        // (Parm)
};

// Function UnrealGame.UnrealPlayerChatManager.ChatDebug
struct AUnrealPlayerChatManager_ChatDebug_Params
{
};

// Function UnrealGame.UseObjective.TellBotHowToDisable
struct AUseObjective_TellBotHowToDisable_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UseObjective.Touch
struct AUseObjective_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.UseObjective.UsedBy
struct AUseObjective_UsedBy_Params
{
	class APawn*                                       User;                                                     // (Parm)
};

// Function UnrealGame.WillowWhisp.StartNextPath
struct AWillowWhisp_StartNextPath_Params
{
};

// Function UnrealGame.WillowWhisp.PostNetBeginPlay
struct AWillowWhisp_PostNetBeginPlay_Params
{
};

// Function UnrealGame.WillowWhisp.PostBeginPlay
struct AWillowWhisp_PostBeginPlay_Params
{
};

// Function UnrealGame.DMMutator.GetServerDetails
struct ADMMutator_GetServerDetails_Params
{
	struct FServerResponseLine                         ServerState;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function UnrealGame.DMMutator.AlwaysKeep
struct ADMMutator_AlwaysKeep_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.DMMutator.MutatorIsAllowed
struct ADMMutator_MutatorIsAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.PickupMessagePlus.ClientReceive
struct APickupMessagePlus_ClientReceive_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function UnrealGame.SnipingVolume.Touch
struct ASnipingVolume_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.SnipingVolume.AddDefensePoint
struct ASnipingVolume_AddDefensePoint_Params
{
	class AUnrealScriptedSequence*                     S;                                                        // (Parm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.GetOpposingTeamChannel
struct ATeamVoiceReplicationInfo_GetOpposingTeamChannel_Params
{
	int                                                ChannelIndex;                                             // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.GetTitle
struct ATeamVoiceReplicationInfo_GetTitle_Params
{
	class AVoiceChatRoom*                              Room;                                                     // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamVoiceReplicationInfo.NotifyTeamChange
struct ATeamVoiceReplicationInfo_NotifyTeamChange_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	int                                                TeamIndex;                                                // (Parm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.JoinChannelAt
struct ATeamVoiceReplicationInfo_JoinChannelAt_Params
{
	int                                                ChannelIndex;                                             // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	TEnumAsByte<EJoinChatResult>                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.JoinChannel
struct ATeamVoiceReplicationInfo_JoinChannel_Params
{
	struct FString                                     ChannelTitle;                                             // (Parm, NeedCtorLink)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	struct FString                                     Password;                                                 // (Parm, NeedCtorLink)
	TEnumAsByte<EJoinChatResult>                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.GetChannel
struct ATeamVoiceReplicationInfo_GetChannel_Params
{
	struct FString                                     ChatRoomName;                                             // (Parm, NeedCtorLink)
	int                                                TeamIndex;                                                // (OptionalParm, Parm)
	class AVoiceChatRoom*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.GetChannelIndex
struct ATeamVoiceReplicationInfo_GetChannelIndex_Params
{
	struct FString                                     ChannelTitle;                                             // (Parm, NeedCtorLink)
	int                                                TeamIndex;                                                // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.GetMask
struct ATeamVoiceReplicationInfo_GetMask_Params
{
	class AVoiceChatRoom*                              Room;                                                     // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.SetMask
struct ATeamVoiceReplicationInfo_SetMask_Params
{
	class AVoiceChatRoom*                              Room;                                                     // (Parm)
	int                                                NewMask;                                                  // (Parm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.ValidRoom
struct ATeamVoiceReplicationInfo_ValidRoom_Params
{
	class AVoiceChatRoom*                              Room;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TeamVoiceReplicationInfo.InitChannels
struct ATeamVoiceReplicationInfo_InitChannels_Params
{
};

// Function UnrealGame.UnrealChatRoom.RemoveChild
struct AUnrealChatRoom_RemoveChild_Params
{
	class AVoiceChatRoom*                              Child;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.AddChild
struct AUnrealChatRoom_AddChild_Params
{
	class AVoiceChatRoom*                              NewChild;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.SetMask
struct AUnrealChatRoom_SetMask_Params
{
	int                                                NewMask;                                                  // (Parm)
};

// Function UnrealGame.UnrealChatRoom.SetTeam
struct AUnrealChatRoom_SetTeam_Params
{
	int                                                NewTeam;                                                  // (Parm)
};

// Function UnrealGame.UnrealChatRoom.IsBanned
struct AUnrealChatRoom_IsBanned_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.RemoveMember
struct AUnrealChatRoom_RemoveMember_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function UnrealGame.UnrealChatRoom.AddMember
struct AUnrealChatRoom_AddMember_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function UnrealGame.UnrealChatRoom.LeaveChannel
struct AUnrealChatRoom_LeaveChannel_Params
{
	class APlayerReplicationInfo*                      LeavingPRI;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.JoinChannel
struct AUnrealChatRoom_JoinChannel_Params
{
	class APlayerReplicationInfo*                      NewPRI;                                                   // (Parm)
	struct FString                                     InPassword;                                               // (Parm, NeedCtorLink)
	TEnumAsByte<EJoinChatResult>                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.CanJoinChannel
struct AUnrealChatRoom_CanJoinChannel_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.IsMember
struct AUnrealChatRoom_IsMember_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               bNoCascade;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.IsFull
struct AUnrealChatRoom_IsFull_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.Count
struct AUnrealChatRoom_Count_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.IsPrivateChannel
struct AUnrealChatRoom_IsPrivateChannel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.IsPublicChannel
struct AUnrealChatRoom_IsPublicChannel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.GetMembers
struct AUnrealChatRoom_GetMembers_Params
{
	TArray<class APlayerReplicationInfo*>              ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealChatRoom.GetPassword
struct AUnrealChatRoom_GetPassword_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealChatRoom.GetTeam
struct AUnrealChatRoom_GetTeam_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.GetTitle
struct AUnrealChatRoom_GetTitle_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.UnrealChatRoom.GetMask
struct AUnrealChatRoom_GetMask_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealChatRoom.PostNetBeginPlay
struct AUnrealChatRoom_PostNetBeginPlay_Params
{
};

// Function UnrealGame.UnrealChatRoom.Timer
struct AUnrealChatRoom_Timer_Params
{
};

// Function UnrealGame.UnrealChatRoom.SetGRI
struct AUnrealChatRoom_SetGRI_Params
{
	class AGameReplicationInfo*                        InGRI;                                                    // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.RemoveTouchingPlayer
struct AwFlagObjectiveBase_RemoveTouchingPlayer_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.AddNewTouchingPlayer
struct AwFlagObjectiveBase_AddNewTouchingPlayer_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.PlayerToucherDied
struct AwFlagObjectiveBase_PlayerToucherDied_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.CheckObjectiveProgress
struct AwFlagObjectiveBase_CheckObjectiveProgress_Params
{
	int                                                iTeamIndex;                                               // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.ResetCapture
struct AwFlagObjectiveBase_ResetCapture_Params
{
};

// Function UnrealGame.wFlagObjectiveBase.Reset
struct AwFlagObjectiveBase_Reset_Params
{
};

// Function UnrealGame.wFlagObjectiveBase.UnTouch
struct AwFlagObjectiveBase_UnTouch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.Touch
struct AwFlagObjectiveBase_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.RecoverCapturing
struct AwFlagObjectiveBase_RecoverCapturing_Params
{
};

// Function UnrealGame.wFlagObjectiveBase.SetActiveTeam
struct AwFlagObjectiveBase_SetActiveTeam_Params
{
	int                                                iTeam;                                                    // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.BeginPlay
struct AwFlagObjectiveBase_BeginPlay_Params
{
};

// Function UnrealGame.wFlagObjectiveBase.OnUnTouch
struct AwFlagObjectiveBase_OnUnTouch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.wFlagObjectiveBase.OnTouch
struct AwFlagObjectiveBase_OnTouch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function UnrealGame.UnrealTeamChatRoom.NotifyTeamChange
struct AUnrealTeamChatRoom_NotifyTeamChange_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	int                                                NewTeamIndex;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamChatRoom.CanJoinChannel
struct AUnrealTeamChatRoom_CanJoinChannel_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealTeamChatRoom.IsTeamChannel
struct AUnrealTeamChatRoom_IsTeamChannel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.WillowWhispPath.StartNextPath
struct AWillowWhispPath_StartNextPath_Params
{
};

// Function UnrealGame.WillowWhispPath.PostNetBeginPlay
struct AWillowWhispPath_PostNetBeginPlay_Params
{
};

// Function UnrealGame.WillowWhispPath.PostBeginPlay
struct AWillowWhispPath_PostBeginPlay_Params
{
};

// Function UnrealGame.StringMessagePlus.AssembleString
struct AStringMessagePlus_AssembleString_Params
{
	class AHUD*                                        myHUD;                                                    // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	struct FString                                     MessageString;                                            // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.SayMessagePlus.GetConsoleColor
struct ASayMessagePlus_GetConsoleColor_Params
{
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.SayMessagePlus.AssembleString
struct ASayMessagePlus_AssembleString_Params
{
	class AHUD*                                        myHUD;                                                    // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	struct FString                                     MessageString;                                            // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.SayMessagePlus.RenderComplexMessage
struct ASayMessagePlus_RenderComplexMessage_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              XL;                                                       // (Parm, OutParm)
	float                                              YL;                                                       // (Parm, OutParm)
	struct FString                                     MessageString;                                            // (OptionalParm, Parm, NeedCtorLink)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function UnrealGame.TeamSayMessagePlus.AssembleString
struct ATeamSayMessagePlus_AssembleString_Params
{
	class AHUD*                                        myHUD;                                                    // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	struct FString                                     MessageString;                                            // (OptionalParm, Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TeamSayMessagePlus.RenderComplexMessage
struct ATeamSayMessagePlus_RenderComplexMessage_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              XL;                                                       // (Parm, OutParm)
	float                                              YL;                                                       // (Parm, OutParm)
	struct FString                                     MessageString;                                            // (OptionalParm, Parm, NeedCtorLink)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function UnrealGame.PlayerNameMessage.GetString
struct APlayerNameMessage_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function UnrealGame.TurretController.GetWaitForTargetTime
struct ATurretController_GetWaitForTargetTime_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TurretController.IsTurretFiring
struct ATurretController_IsTurretFiring_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TurretController.IsTargetRelevant
struct ATurretController_IsTargetRelevant_Params
{
	class APawn*                                       Target;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TurretController.GetTeamNum
struct ATurretController_GetTeamNum_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.TurretController.Possess
struct ATurretController_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function UnrealGame.TurretController.AdjustAim
struct ATurretController_AdjustAim_Params
{
	struct FFireProperties                             FiredAmmunition;                                          // (Parm)
	struct FVector                                     projStart;                                                // (Parm)
	int                                                AimError;                                                 // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function UnrealGame.UnrealSecurity.ServerCallback
struct AUnrealSecurity_ServerCallback_Params
{
	int                                                SecType;                                                  // (Parm)
	struct FString                                     Data;                                                     // (Parm, NeedCtorLink)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
