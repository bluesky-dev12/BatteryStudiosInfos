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

// Function WGame.wUtil.GetMutatorClasses
struct UwUtil_GetMutatorClasses_Params
{
	TArray<struct FString>                             MutClassNames;                                            // (OptionalParm, Parm, NeedCtorLink)
	TArray<class UClass*>                              ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wUtil.GetTeamInfoSalaryFor
struct UwUtil_GetTeamInfoSalaryFor_Params
{
	class AUnrealTeamInfo*                             UT;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.GetTeamSalaryFor
struct UwUtil_GetTeamSalaryFor_Params
{
	class UGameProfile*                                GP;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamArrayTacticsRating
struct UwUtil_TeamArrayTacticsRating_Params
{
	TArray<struct FString>                             Players;                                                  // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamInfoTacticsRating
struct UwUtil_TeamInfoTacticsRating_Params
{
	class AUnrealTeamInfo*                             UT;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamTacticsRating
struct UwUtil_TeamTacticsRating_Params
{
	class UGameProfile*                                GP;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamArrayAgilityRating
struct UwUtil_TeamArrayAgilityRating_Params
{
	TArray<struct FString>                             Players;                                                  // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamInfoAgilityRating
struct UwUtil_TeamInfoAgilityRating_Params
{
	class AUnrealTeamInfo*                             UT;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamAgilityRating
struct UwUtil_TeamAgilityRating_Params
{
	class UGameProfile*                                GP;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamArrayAggressivenessRating
struct UwUtil_TeamArrayAggressivenessRating_Params
{
	TArray<struct FString>                             Players;                                                  // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamInfoAggressivenessRating
struct UwUtil_TeamInfoAggressivenessRating_Params
{
	class AUnrealTeamInfo*                             UT;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamAggressivenessRating
struct UwUtil_TeamAggressivenessRating_Params
{
	class UGameProfile*                                GP;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamArrayAccuracyRating
struct UwUtil_TeamArrayAccuracyRating_Params
{
	TArray<struct FString>                             Players;                                                  // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamInfoAccuracyRating
struct UwUtil_TeamInfoAccuracyRating_Params
{
	class AUnrealTeamInfo*                             UT;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TeamAccuracyRating
struct UwUtil_TeamAccuracyRating_Params
{
	class UGameProfile*                                GP;                                                       // (Parm)
	int                                                lineupsize;                                               // (OptionalParm, Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.AggressivenessRating
struct UwUtil_AggressivenessRating_Params
{
	struct FPlayerRecord                               PRE;                                                      // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.TacticsRating
struct UwUtil_TacticsRating_Params
{
	struct FPlayerRecord                               PRE;                                                      // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.AgilityRating
struct UwUtil_AgilityRating_Params
{
	struct FPlayerRecord                               PRE;                                                      // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.AccuracyRating
struct UwUtil_AccuracyRating_Params
{
	struct FPlayerRecord                               PRE;                                                      // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.RatingModifier
struct UwUtil_RatingModifier_Params
{
	struct FString                                     CharacterName;                                            // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.GetFavoriteWeaponFor
struct UwUtil_GetFavoriteWeaponFor_Params
{
	struct FPlayerRecord                               PRE;                                                      // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wUtil.GetSalaryFor
struct UwUtil_GetSalaryFor_Params
{
	struct FPlayerRecord                               PRE;                                                      // (Parm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.FindPlayerRecord
struct UwUtil_FindPlayerRecord_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FPlayerRecord                               ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wUtil.GetMutatorList
struct UwUtil_GetMutatorList_Params
{
	TArray<struct UwUtil_FMutatorRecord>               MutatorRecords;                                           // (Parm, NeedCtorLink)
};

// Function WGame.wUtil.LoadDecoText
struct UwUtil_LoadDecoText_Params
{
	struct FString                                     PackageName;                                              // (Parm, NeedCtorLink)
	struct FString                                     DecoTextName;                                             // (Parm, NeedCtorLink)
	int                                                ColumnCount;                                              // (OptionalParm, Parm)
	class UDecoText*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUtil.FindUPLPlayerRecord
struct UwUtil_FindUPLPlayerRecord_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	struct FPlayerRecord                               ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wUtil.GetPlayerRecord
struct UwUtil_GetPlayerRecord_Params
{
	int                                                Index;                                                    // (Parm)
	struct FPlayerRecord                               ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wUtil.GetPlayerList
struct UwUtil_GetPlayerList_Params
{
	TArray<struct FPlayerRecord>                       PlayerRecords;                                            // (Parm, OutParm, NeedCtorLink)
};

// Function WGame.wTeamRoster.BelongsOnTeam
struct AwTeamRoster_BelongsOnTeam_Params
{
	class UClass*                                      PawnClass;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamRoster.AlreadyExistsEntry
struct AwTeamRoster_AlreadyExistsEntry_Params
{
	struct FString                                     CharacterName;                                            // (Parm, NeedCtorLink)
	bool                                               bNoRecursion;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamRoster.AvailableRecord
struct AwTeamRoster_AvailableRecord_Params
{
	struct FString                                     MenuString;                                               // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamRoster.GetRandomPlayer
struct AwTeamRoster_GetRandomPlayer_Params
{
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamRoster.FillPlayerTeam
struct AwTeamRoster_FillPlayerTeam_Params
{
	class UGameProfile*                                G;                                                        // (Parm)
};

// Function WGame.wTeamRoster.Initialize
struct AwTeamRoster_Initialize_Params
{
	int                                                TeamBots;                                                 // (Parm)
};

// Function WGame.wTeamRoster.GetNamedBot
struct AwTeamRoster_GetNamedBot_Params
{
	struct FString                                     botname;                                                  // (Parm, NeedCtorLink)
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamRoster.PostBeginPlay
struct AwTeamRoster_PostBeginPlay_Params
{
};

// Function WGame.wKillerMessagePlus.GetString
struct AwKillerMessagePlus_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wDeathMessage.ClientReceive
struct AwDeathMessage_ClientReceive_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function WGame.wDeathMessage.GetString
struct AwDeathMessage_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wDeathMessage.GetConsoleColor
struct AwDeathMessage_GetConsoleColor_Params
{
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPurpose.GetActivationScore
struct UwPurpose_GetActivationScore_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPurpose.Evaluate
struct UwPurpose_Evaluate_Params
{
	class UwStateData*                                 S;                                                        // (Parm, OutParm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPurpose.Create
struct UwPurpose_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UwPurpose*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPurposeAttackTarget.GetActivationScore
struct UwPurposeAttackTarget_GetActivationScore_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPurposeAttackTarget.Evaluate
struct UwPurposeAttackTarget_Evaluate_Params
{
	class UwStateData*                                 S;                                                        // (Parm, OutParm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.ClearReferences
struct AwAILevel_ClearReferences_Params
{
};

// Function WGame.wAILevel.BotsLovePeace
struct AwAILevel_BotsLovePeace_Params
{
};

// Function WGame.wAILevel.ResetNames
struct AwAILevel_ResetNames_Params
{
};

// Function WGame.wAILevel.GetItemParamByGroupID
struct AwAILevel_GetItemParamByGroupID_Params
{
	int                                                GroupID;                                                  // (Parm)
	class UwNPCItemGroupParam*                         ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.GetName
struct AwAILevel_GetName_Params
{
	int                                                NameGroupID;                                              // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wAILevel.KillBot
struct AwAILevel_KillBot_Params
{
	class AAIController*                               Bot;                                                      // (Parm)
};

// Function WGame.wAILevel.KillBots
struct AwAILevel_KillBots_Params
{
	int                                                Num;                                                      // (Parm)
};

// Function WGame.wAILevel.KillBotsTeam
struct AwAILevel_KillBotsTeam_Params
{
	int                                                Num;                                                      // (Parm)
	int                                                inTeam;                                                   // (Parm)
};

// Function WGame.wAILevel.RegisterBot
struct AwAILevel_RegisterBot_Params
{
	class AwAIBotBase*                                 Bot;                                                      // (Parm)
};

// Function WGame.wAILevel.GetNPCAction
struct AwAILevel_GetNPCAction_Params
{
	int                                                ActionGroupID;                                            // (Parm)
	class UwNPCActions*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.ActionExists
struct AwAILevel_ActionExists_Params
{
	int                                                ActionGroupID;                                            // (Parm)
	struct FString                                     Action;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.GetNPCParam
struct AwAILevel_GetNPCParam_Params
{
	int                                                Grade;                                                    // (Parm)
	class UwNPCParam*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.GetNPCParamByNPCID
struct AwAILevel_GetNPCParamByNPCID_Params
{
	int                                                NPCID;                                                    // (Parm)
	class UwNPCParam*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.UpdateInfluenceListScript
struct AwAILevel_UpdateInfluenceListScript_Params
{
};

// Function WGame.wAILevel.UpdateInfluenceList
struct AwAILevel_UpdateInfluenceList_Params
{
};

// Function WGame.wAILevel.UpdateInfluenceListNative
struct AwAILevel_UpdateInfluenceListNative_Params
{
};

// Function WGame.wAILevel.UpdateAllNavs
struct AwAILevel_UpdateAllNavs_Params
{
};

// Function WGame.wAILevel.GetRandomDestFromInfluence
struct AwAILevel_GetRandomDestFromInfluence_Params
{
	unsigned char                                      inTeam;                                                   // (Parm)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.GetRandomDestFromFrontLine
struct AwAILevel_GetRandomDestFromFrontLine_Params
{
	unsigned char                                      inTeam;                                                   // (Parm)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAILevel.InitFrontLine
struct AwAILevel_InitFrontLine_Params
{
};

// Function WGame.wAILevel.Tick
struct AwAILevel_Tick_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wAILevel.InitInfluenceList
struct AwAILevel_InitInfluenceList_Params
{
};

// Function WGame.wAILevel.Initialize
struct AwAILevel_Initialize_Params
{
};

// Function WGame.wAILevel.PreBeginPlay
struct AwAILevel_PreBeginPlay_Params
{
};

// Function WGame.wStateData.Create
struct UwStateData_Create_Params
{
	class UwStateData*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.ShortMemory.DisplayDebug
struct UShortMemory_DisplayDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.ShortMemory.SetOffsetCrouchHeight
struct UShortMemory_SetOffsetCrouchHeight_Params
{
	float                                              fHeight;                                                  // (Parm)
};

// Function WGame.ShortMemory.SetOffsetStandHeight
struct UShortMemory_SetOffsetStandHeight_Params
{
	float                                              fHeight;                                                  // (Parm)
};

// Function WGame.ShortMemory.GetByPawn
struct UShortMemory_GetByPawn_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               createIfNotFound;                                         // (OptionalParm, Parm)
	class UMemoryItem*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.ShortMemory.GetByPawn2
struct UShortMemory_GetByPawn2_Params
{
	class APawn*                                       P;                                                        // (Parm)
	class UMemoryItem*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.ShortMemory.RemoveByPawn
struct UShortMemory_RemoveByPawn_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.ShortMemory.RemoveAll
struct UShortMemory_RemoveAll_Params
{
};

// Function WGame.ShortMemory.ClearReferences
struct UShortMemory_ClearReferences_Params
{
};

// Function WGame.ShortMemory.RemoveMemoriesOverRetentionTime
struct UShortMemory_RemoveMemoriesOverRetentionTime_Params
{
};

// Function WGame.ShortMemory.RememberByVision
struct UShortMemory_RememberByVision_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.ShortMemory.RememberBySound
struct UShortMemory_RememberBySound_Params
{
	class APawn*                                       P;                                                        // (Parm)
	float                                              Loudness;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.ShortMemory.NotifyDestroyed
struct UShortMemory_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.ShortMemory.Update
struct UShortMemory_Update_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.ShortMemory.Create
struct UShortMemory_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	float                                              inResponseTime;                                           // (Parm)
	class UShortMemory*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.MemoryItem.SetOffsetCrouchHeight
struct UMemoryItem_SetOffsetCrouchHeight_Params
{
	float                                              fHeight;                                                  // (Parm)
};

// Function WGame.MemoryItem.SetOffsetStandHeight
struct UMemoryItem_SetOffsetStandHeight_Params
{
	float                                              fHeight;                                                  // (Parm)
};

// Function WGame.MemoryItem.ClearReferences
struct UMemoryItem_ClearReferences_Params
{
};

// Function WGame.MemoryItem.Update
struct UMemoryItem_Update_Params
{
};

// Function WGame.MemoryItem.AddKnownPosition
struct UMemoryItem_AddKnownPosition_Params
{
	struct FVector                                     V;                                                        // (Parm)
	float                                              t;                                                        // (Parm)
};

// Function WGame.MemoryItem.NotifyDestroyed
struct UMemoryItem_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.MemoryItem.Create
struct UMemoryItem_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class APawn*                                       P;                                                        // (Parm)
	class UMemoryItem*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.DisplayDebug_Path
struct AwAIBotBase_DisplayDebug_Path_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wAIBotBase.DisplayDebug
struct AwAIBotBase_DisplayDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wAIBotBase.SetFireYaw
struct AwAIBotBase_SetFireYaw_Params
{
	int                                                FireYaw;                                                  // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.AdjustAim
struct AwAIBotBase_AdjustAim_Params
{
	struct FFireProperties                             FiredAmmunition;                                          // (Parm)
	struct FVector                                     projStart;                                                // (Parm)
	int                                                AimError;                                                 // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.NotifyKilled
struct AwAIBotBase_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function WGame.wAIBotBase.HearNoise
struct AwAIBotBase_HearNoise_Params
{
	float                                              Loudness;                                                 // (Parm)
	class AActor*                                      NoiseMaker;                                               // (Parm)
};

// Function WGame.wAIBotBase.SeePlayer
struct AwAIBotBase_SeePlayer_Params
{
	class APawn*                                       SeenPlayer;                                               // (Parm)
};

// Function WGame.wAIBotBase.NotifyVehicle
struct AwAIBotBase_NotifyVehicle_Params
{
	class AVehicle*                                    V;                                                        // (Parm)
};

// Function WGame.wAIBotBase.OnMemoryVisibleChanged
struct AwAIBotBase_OnMemoryVisibleChanged_Params
{
};

// Function WGame.wAIBotBase.HandleMessage
struct AwAIBotBase_HandleMessage_Params
{
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
};

// Function WGame.wAIBotBase.wClientFlash
struct AwAIBotBase_wClientFlash_Params
{
	float                                              fTime;                                                    // (Parm)
};

// Function WGame.wAIBotBase.IsProning
struct AwAIBotBase_IsProning_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.TryProne
struct AwAIBotBase_TryProne_Params
{
};

// Function WGame.wAIBotBase.IsCrouching
struct AwAIBotBase_IsCrouching_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.TryCrouch
struct AwAIBotBase_TryCrouch_Params
{
};

// Function WGame.wAIBotBase.IsStandingUp
struct AwAIBotBase_IsStandingUp_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.TryStandUp
struct AwAIBotBase_TryStandUp_Params
{
};

// Function WGame.wAIBotBase.IsSprinting
struct AwAIBotBase_IsSprinting_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.SetSprint
struct AwAIBotBase_SetSprint_Params
{
	bool                                               Value;                                                    // (Parm)
};

// Function WGame.wAIBotBase.PawnDied
struct AwAIBotBase_PawnDied_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wAIBotBase.ClientOnEndWaitingForStart
struct AwAIBotBase_ClientOnEndWaitingForStart_Params
{
};

// Function WGame.wAIBotBase.ZeroExtraCost
struct AwAIBotBase_ZeroExtraCost_Params
{
};

// Function WGame.wAIBotBase.CopyNavExtraCost
struct AwAIBotBase_CopyNavExtraCost_Params
{
};

// Function WGame.wAIBotBase.UpdateNavDetourExtraCostScript
struct AwAIBotBase_UpdateNavDetourExtraCostScript_Params
{
	struct FVector                                     S;                                                        // (Parm)
	struct FVector                                     E;                                                        // (Parm)
};

// Function WGame.wAIBotBase.UpdateNavDetourExtraCost
struct AwAIBotBase_UpdateNavDetourExtraCost_Params
{
	struct FVector                                     S;                                                        // (Parm)
	struct FVector                                     E;                                                        // (Parm)
};

// Function WGame.wAIBotBase.UpdateNavDetourExtraCostNative
struct AwAIBotBase_UpdateNavDetourExtraCostNative_Params
{
	struct FVector                                     S;                                                        // (Parm)
	struct FVector                                     E;                                                        // (Parm)
};

// Function WGame.wAIBotBase.InitNavExtraCost
struct AwAIBotBase_InitNavExtraCost_Params
{
};

// Function WGame.wAIBotBase.Cmd
struct AwAIBotBase_Cmd_Params
{
	struct FString                                     P1;                                                       // (Parm, NeedCtorLink)
	struct FString                                     P2;                                                       // (Parm, NeedCtorLink)
	struct FString                                     p3;                                                       // (Parm, NeedCtorLink)
	struct FString                                     p4;                                                       // (Parm, NeedCtorLink)
	struct FString                                     p5;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wAIBotBase.EvaluateState
struct AwAIBotBase_EvaluateState_Params
{
	class UwStateData*                                 S;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.SetupWStateNative
struct AwAIBotBase_SetupWStateNative_Params
{
	class UwStateData*                                 S;                                                        // (Parm, OutParm)
};

// Function WGame.wAIBotBase.NotifyAddDefaultInventory
struct AwAIBotBase_NotifyAddDefaultInventory_Params
{
};

// Function WGame.wAIBotBase.NotifyAddInventory
struct AwAIBotBase_NotifyAddInventory_Params
{
	class AInventory*                                  NewItem;                                                  // (Parm)
};

// Function WGame.wAIBotBase.SetupWeapons
struct AwAIBotBase_SetupWeapons_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wAIBotBase.SetPawnClass
struct AwAIBotBase_SetPawnClass_Params
{
	struct FString                                     inClass;                                                  // (Parm, NeedCtorLink)
	struct FString                                     InCharacter;                                              // (Parm, NeedCtorLink)
};

// Function WGame.wAIBotBase.SetName
struct AwAIBotBase_SetName_Params
{
	class UwNPCParam*                                  Param;                                                    // (Parm)
};

// Function WGame.wAIBotBase.InitBot
struct AwAIBotBase_InitBot_Params
{
	int                                                Grade;                                                    // (Parm)
};

// Function WGame.wAIBotBase.ClearReferences
struct AwAIBotBase_ClearReferences_Params
{
};

// Function WGame.wAIBotBase.WeaponFireAgain
struct AwAIBotBase_WeaponFireAgain_Params
{
	float                                              RefireRate;                                               // (Parm)
	bool                                               bFinishedFire;                                            // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIBotBase.ReadyToMeleeAttack
struct AwAIBotBase_ReadyToMeleeAttack_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayerInfo.Setup
struct UwPlayerInfo_Setup_Params
{
	class AwPawn*                                      P;                                                        // (Parm)
	struct FPlayerRecord                               Rec;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayerInfo.SetupPawn
struct UwPlayerInfo_SetupPawn_Params
{
	class AwPawn*                                      P;                                                        // (Parm)
	int                                                iBodyItemID;                                              // (Parm)
	int                                                iHelmetItemID;                                            // (Parm)
	int                                                iAcceItemID;                                              // (Parm)
	int                                                iBackPackID;                                              // (Parm)
	int                                                iPouchID;                                                 // (Parm)
	int                                                iCamouflageID;                                            // (Parm)
	int                                                iTeamIndex;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.SpeciesType.GetOffsetForSequence
struct USpeciesType_GetOffsetForSequence_Params
{
	struct FName                                       Sequence;                                                 // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.SpeciesType.Setup
struct USpeciesType_Setup_Params
{
	class AwPawn*                                      P;                                                        // (Parm)
	struct FPlayerRecord                               Rec;                                                      // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.SpeciesType.SetTeamSkin
struct USpeciesType_SetTeamSkin_Params
{
	class AwPawn*                                      P;                                                        // (Parm)
	struct FPlayerRecord                               Rec;                                                      // (Parm, NeedCtorLink)
	int                                                TeamNum;                                                  // (Parm)
};

// Function WGame.SpeciesType.GetRagSkelName
struct USpeciesType_GetRagSkelName_Params
{
	struct FString                                     MeshName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.SpeciesType.ModifyPawn
struct USpeciesType_ModifyPawn_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.SpeciesType.ModifyImpartedDamage
struct USpeciesType_ModifyImpartedDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class APawn*                                       injured;                                                  // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.SpeciesType.ModifyReceivedDamage
struct USpeciesType_ModifyReceivedDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class APawn*                                       injured;                                                  // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.SpeciesType.LoadResources
struct USpeciesType_LoadResources_Params
{
	struct FPlayerRecord                               Rec;                                                      // (Parm, NeedCtorLink)
	class ALevelInfo*                                  Level;                                                    // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	int                                                TeamNum;                                                  // (Parm)
};

// Function WGame.SpeciesType.GetVoiceType
struct USpeciesType_GetVoiceType_Params
{
	bool                                               bIsFemale;                                                // (Parm)
	class ALevelInfo*                                  Level;                                                    // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.AnimNotify_Nemesis_BeamPrepare.Notify
struct UAnimNotify_Nemesis_BeamPrepare_Notify_Params
{
	class AActor*                                      Owner;                                                    // (Parm)
};

// Function WGame.wPawn.SkillInit
struct AwPawn_SkillInit_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WGame.wPawn.ClientSkillDeadPlayer
struct AwPawn_ClientSkillDeadPlayer_Params
{
};

// Function WGame.wPawn.AddAllyEffect
struct AwPawn_AddAllyEffect_Params
{
};

// Function WGame.wPawn.reset_weapon
struct AwPawn_reset_weapon_Params
{
};

// Function WGame.wPawn.DisplayDebug
struct AwPawn_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wPawn.SetBurning
struct AwPawn_SetBurning_Params
{
	bool                                               bBurn;                                                    // (Parm)
	class AwProjectile*                                proj;                                                     // (Parm)
};

// Function WGame.wPawn.GetWeaponAttachmentInfo
struct AwPawn_GetWeaponAttachmentInfo_Params
{
	unsigned char                                      byFlashCount;                                             // (Parm, OutParm)
	unsigned char                                      byFiringMode;                                             // (Parm, OutParm)
};

// Function WGame.wPawn.SetWeaponQuickChange
struct AwPawn_SetWeaponQuickChange_Params
{
	bool                                               bOn;                                                      // (Parm)
};

// Function WGame.wPawn.SetWeaponQuickReload
struct AwPawn_SetWeaponQuickReload_Params
{
	bool                                               bOn;                                                      // (Parm)
};

// Function WGame.wPawn.SetWeaponQuickAimZoom
struct AwPawn_SetWeaponQuickAimZoom_Params
{
	bool                                               bOn;                                                      // (Parm)
};

// Function WGame.wPawn.AddWeaponFillAmmoAndMagazine
struct AwPawn_AddWeaponFillAmmoAndMagazine_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.AddWeaponMagazine
struct AwPawn_AddWeaponMagazine_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.SetRemoveWeaponSkill
struct AwPawn_SetRemoveWeaponSkill_Params
{
	class AwWeapon*                                    W;                                                        // (Parm)
};

// Function WGame.wPawn.SetAddWeaponSkill
struct AwPawn_SetAddWeaponSkill_Params
{
	class AwWeapon*                                    W;                                                        // (Parm)
	int                                                iaWeaponID;                                               // (Parm)
	int                                                iPartsID;                                                 // (Parm)
};

// Function WGame.wPawn.RenderFPWeaponAttachment
struct AwPawn_RenderFPWeaponAttachment_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WGame.wPawn.MakeShellEffect_Rechamber
struct AwPawn_MakeShellEffect_Rechamber_Params
{
};

// Function WGame.wPawn.MakeShellEffect
struct AwPawn_MakeShellEffect_Params
{
};

// Function WGame.wPawn.ServerCallNoWeaponMessage
struct AwPawn_ServerCallNoWeaponMessage_Params
{
	unsigned char                                      bySlot;                                                   // (Parm)
};

// Function WGame.wPawn.AddNoWeaponChangeMessage
struct AwPawn_AddNoWeaponChangeMessage_Params
{
	unsigned char                                      bySlot;                                                   // (Parm)
};

// Function WGame.wPawn.HandlePickup
struct AwPawn_HandlePickup_Params
{
	class APickup*                                     pick;                                                     // (Parm)
};

// Function WGame.wPawn.PlayReload
struct AwPawn_PlayReload_Params
{
};

// Function WGame.wPawn.PlayRechamber
struct AwPawn_PlayRechamber_Params
{
};

// Function WGame.wPawn.PlayMelee
struct AwPawn_PlayMelee_Params
{
	bool                                               bMeleeKnifeOrButt;                                        // (Parm)
};

// Function WGame.wPawn.PostRender2D
struct AwPawn_PostRender2D_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ScreenLocX;                                               // (Parm)
	float                                              ScreenLocY;                                               // (Parm)
};

// Function WGame.wPawn.SpawnSupplyItem
struct AwPawn_SpawnSupplyItem_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.SpawnBlackbox
struct AwPawn_SpawnBlackbox_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.SpawnMedals
struct AwPawn_SpawnMedals_Params
{
};

// Function WGame.wPawn.ClientSwitchToLastWeapon
struct AwPawn_ClientSwitchToLastWeapon_Params
{
	unsigned char                                      defuseSwitch;                                             // (OptionalParm, Parm)
};

// Function WGame.wPawn.SetSpecialState
struct AwPawn_SetSpecialState_Params
{
	unsigned char                                      byState;                                                  // (Parm)
};

// Function WGame.wPawn.ServerQSlotChangeCheck
struct AwPawn_ServerQSlotChangeCheck_Params
{
};

// Function WGame.wPawn.ClientQSlotChangeCheck
struct AwPawn_ClientQSlotChangeCheck_Params
{
};

// Function WGame.wPawn.AddBaseInvenWeapon
struct AwPawn_AddBaseInvenWeapon_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	int                                                iPos;                                                     // (Parm)
};

// Function WGame.wPawn.SetSelectedQuickSlotInventory
struct AwPawn_SetSelectedQuickSlotInventory_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	bool                                               bQuickslotChange;                                         // (Parm)
};

// Function WGame.wPawn.AddWeaponByWeaponLimited
struct AwPawn_AddWeaponByWeaponLimited_Params
{
	int                                                iWeaponID;                                                // (Parm)
	int                                                iPartsID;                                                 // (Parm)
	struct FBtrDouble                                  UniqueID;                                                 // (Parm)
};

// Function WGame.wPawn.SetInfiniteAmmoTutorial
struct AwPawn_SetInfiniteAmmoTutorial_Params
{
	bool                                               bDeleteGranade;                                           // (OptionalParm, Parm)
	int                                                iGranadeCount;                                            // (OptionalParm, Parm)
};

// Function WGame.wPawn.SetInfiniteAmmo
struct AwPawn_SetInfiniteAmmo_Params
{
	int                                                ammoCount;                                                // (OptionalParm, Parm)
};

// Function WGame.wPawn.DoSortEquipedItems
struct AwPawn_DoSortEquipedItems_Params
{
	class UwMatchUserInfo*                             kUserInfo;                                                // (Parm)
};

// Function WGame.wPawn.CheckWeaponBySubGameMode
struct AwPawn_CheckWeaponBySubGameMode_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.AddDefaultInventoryDOA
struct AwPawn_AddDefaultInventoryDOA_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WGame.wPawn.SetGrenadlInvenByWeaponLimited
struct AwPawn_SetGrenadlInvenByWeaponLimited_Params
{
	int                                                i;                                                        // (Parm)
	class UwMatchMaker*                                kMM;                                                      // (Parm)
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	bool                                               IsQuick;                                                  // (Parm)
};

// Function WGame.wPawn.SetFlameThrowerlInvenByWeaponLimited
struct AwPawn_SetFlameThrowerlInvenByWeaponLimited_Params
{
	int                                                i;                                                        // (Parm)
	class UwMatchMaker*                                kMM;                                                      // (Parm)
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	bool                                               IsQuick;                                                  // (Parm)
};

// Function WGame.wPawn.SetMGlInvenByWeaponLimited
struct AwPawn_SetMGlInvenByWeaponLimited_Params
{
	int                                                i;                                                        // (Parm)
	class UwMatchMaker*                                kMM;                                                      // (Parm)
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	bool                                               IsQuick;                                                  // (Parm)
};

// Function WGame.wPawn.SetShotGunlInvenByWeaponLimited
struct AwPawn_SetShotGunlInvenByWeaponLimited_Params
{
	int                                                i;                                                        // (Parm)
	class UwMatchMaker*                                kMM;                                                      // (Parm)
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	bool                                               IsQuick;                                                  // (Parm)
};

// Function WGame.wPawn.SetPistolInvenByWeaponLimited
struct AwPawn_SetPistolInvenByWeaponLimited_Params
{
	int                                                i;                                                        // (Parm)
	class UwMatchMaker*                                kMM;                                                      // (Parm)
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	bool                                               IsQuick;                                                  // (Parm)
};

// Function WGame.wPawn.AddDefaultInventory
struct AwPawn_AddDefaultInventory_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WGame.wPawn.RemoveInventoryByDamageType
struct AwPawn_RemoveInventoryByDamageType_Params
{
	TEnumAsByte<EeWeaponType>                          removeWeaponType;                                         // (Parm)
};

// Function WGame.wPawn.RemoveAllInventory
struct AwPawn_RemoveAllInventory_Params
{
};

// Function WGame.wPawn.ChangeInventoryByQSlot
struct AwPawn_ChangeInventoryByQSlot_Params
{
};

// Function WGame.wPawn.GetSlotPosbySkillID
struct AwPawn_GetSlotPosbySkillID_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	int                                                iSkillID;                                                 // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.GetInvenSkillIDbyPos
struct AwPawn_GetInvenSkillIDbyPos_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	int                                                iPos;                                                     // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.AddBaseInvenSkill
struct AwPawn_AddBaseInvenSkill_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
	int                                                iPos;                                                     // (Parm)
};

// Function WGame.wPawn.SetSelectedQuickSlotSkills
struct AwPawn_SetSelectedQuickSlotSkills_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
};

// Function WGame.wPawn.AddWeaponFromSkill
struct AwPawn_AddWeaponFromSkill_Params
{
	struct FBtrDouble                                  iUniqueID;                                                // (Parm)
	int                                                iaWeaponID;                                               // (Parm)
};

// Function WGame.wPawn.AddSkillByInventory
struct AwPawn_AddSkillByInventory_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
};

// Function WGame.wPawn.AddDefaultSkills
struct AwPawn_AddDefaultSkills_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WGame.wPawn.GetGibParts
struct AwPawn_GetGibParts_Params
{
	int                                                iCollisionPart;                                           // (Parm)
	TEnumAsByte<EGibType>                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.SpawnGoreGiblet
struct AwPawn_SpawnGoreGiblet_Params
{
	int                                                iIndex;                                                   // (Parm)
};

// Function WGame.wPawn.MakeGorePawn
struct AwPawn_MakeGorePawn_Params
{
	int                                                iPart;                                                    // (Parm)
};

// Function WGame.wPawn.EndCrouch
struct AwPawn_EndCrouch_Params
{
	float                                              HeightAdjust;                                             // (Parm)
};

// Function WGame.wPawn.EndProne
struct AwPawn_EndProne_Params
{
	float                                              HeightAdjust;                                             // (Parm)
};

// Function WGame.wPawn.SetParts
struct AwPawn_SetParts_Params
{
	TEnumAsByte<EePlayerParts>                         iPartsIndex;                                              // (Parm)
	class UMesh*                                       resMesh;                                                  // (Parm)
	class UStaticMesh*                                 resStaticMesh;                                            // (Parm)
};

// Function WGame.wPawn.GetCamouflage
struct AwPawn_GetCamouflage_Params
{
	int                                                iItemID;                                                  // (Parm)
	unsigned char                                      byTeam;                                                   // (Parm)
	class UMaterial*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.SetCamouflage
struct AwPawn_SetCamouflage_Params
{
	int                                                iItemID;                                                  // (Parm)
	unsigned char                                      byTeam;                                                   // (Parm)
};

// Function WGame.wPawn.ResetAllParts
struct AwPawn_ResetAllParts_Params
{
};

// Function WGame.wPawn.Died
struct AwPawn_Died_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function WGame.wPawn.DoDerezEffect
struct AwPawn_DoDerezEffect_Params
{
};

// Function WGame.wPawn.GetGibClass
struct AwPawn_GetGibClass_Params
{
	TEnumAsByte<EGibType>                              gibType;                                                  // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.GetSound
struct AwPawn_GetSound_Params
{
	TEnumAsByte<ESoundType>                            soundType;                                                // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPawn.ResetPhysicsBasedAnim
struct AwPawn_ResetPhysicsBasedAnim_Params
{
};

// Function WGame.wPawn.IsTeamGame
struct AwPawn_IsTeamGame_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.Setup
struct AwPawn_Setup_Params
{
	struct FPlayerRecord                               Rec;                                                      // (Parm, NeedCtorLink)
	bool                                               bLoadNow;                                                 // (OptionalParm, Parm)
};

// Function WGame.wPawn.GetDefaultCharacter
struct AwPawn_GetDefaultCharacter_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPawn.ForceDefaultCharacter
struct AwPawn_ForceDefaultCharacter_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.CheckValidMaleDefault
struct AwPawn_CheckValidMaleDefault_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.CheckValidFemaleDefault
struct AwPawn_CheckValidFemaleDefault_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.ClientReStart
struct AwPawn_ClientReStart_Params
{
};

// Function WGame.wPawn.PostNetReceive
struct AwPawn_PostNetReceive_Params
{
};

// Function WGame.wPawn.NotifyTeamChanged
struct AwPawn_NotifyTeamChanged_Params
{
};

// Function WGame.wPawn.DoJump
struct AwPawn_DoJump_Params
{
	bool                                               bUpdating;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.CanMultiJump
struct AwPawn_CanMultiJump_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.CanDoubleJump
struct AwPawn_CanDoubleJump_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.DoDoubleJump
struct AwPawn_DoDoubleJump_Params
{
	bool                                               bUpdating;                                                // (Parm)
};

// Function WGame.wPawn.PerformDodge
struct AwPawn_PerformDodge_Params
{
	TEnumAsByte<EDoubleClickDir>                       DoubleClickMove;                                          // (Parm)
	struct FVector                                     Dir;                                                      // (Parm)
	struct FVector                                     Cross;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.Dodge
struct AwPawn_Dodge_Params
{
	TEnumAsByte<EDoubleClickDir>                       DoubleClickMove;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.BotDodge
struct AwPawn_BotDodge_Params
{
	struct FVector                                     Dir;                                                      // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.SetInvisibility
struct AwPawn_SetInvisibility_Params
{
	float                                              Time;                                                     // (Parm)
};

// Function WGame.wPawn.ServerChangedWeapon
struct AwPawn_ServerChangedWeapon_Params
{
	class AwWeapon*                                    OldWeapon;                                                // (Parm)
	class AwWeapon*                                    newWeapon;                                                // (Parm)
};

// Function WGame.wPawn.ChangedWeapon
struct AwPawn_ChangedWeapon_Params
{
};

// Function WGame.wPawn.SetWeaponOverlay
struct AwPawn_SetWeaponOverlay_Params
{
	class UMaterial*                                   mat;                                                      // (Parm)
	float                                              Time;                                                     // (Parm)
	bool                                               override;                                                 // (Parm)
};

// Function WGame.wPawn.DisableUDamage
struct AwPawn_DisableUDamage_Params
{
};

// Function WGame.wPawn.EnableUDamage
struct AwPawn_EnableUDamage_Params
{
	float                                              Amount;                                                   // (Parm)
};

// Function WGame.wPawn.HasUDamage
struct AwPawn_HasUDamage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.DoCombo
struct AwPawn_DoCombo_Params
{
	class UClass*                                      ComboClass;                                               // (Parm)
};

// Function WGame.wPawn.DoComboName
struct AwPawn_DoComboName_Params
{
	struct FString                                     ComboClassName;                                           // (Parm, NeedCtorLink)
};

// Function WGame.wPawn.InCurrentCombo
struct AwPawn_InCurrentCombo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.AddShieldStrength
struct AwPawn_AddShieldStrength_Params
{
	int                                                ShieldAmount;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.CanUseShield
struct AwPawn_CanUseShield_Params
{
	int                                                ShieldAmount;                                             // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.GetShieldStrength
struct AwPawn_GetShieldStrength_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.GetShieldStrengthMax
struct AwPawn_GetShieldStrengthMax_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.TakeDamageSound
struct AwPawn_TakeDamageSound_Params
{
	int                                                LeftHealth;                                               // (Parm)
	int                                                ActualDamage;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	class AController*                                 Killer;                                                   // (OptionalParm, Parm)
};

// Function WGame.wPawn.PlayFootStepRight
struct AwPawn_PlayFootStepRight_Params
{
};

// Function WGame.wPawn.PlayFootStepLeft
struct AwPawn_PlayFootStepLeft_Params
{
};

// Function WGame.wPawn.FootStepping
struct AwPawn_FootStepping_Params
{
	int                                                side;                                                     // (Parm)
};

// Function WGame.wPawn.PlayEquipHitSound
struct AwPawn_PlayEquipHitSound_Params
{
};

// Function WGame.wPawn.PlayBreathSound
struct AwPawn_PlayBreathSound_Params
{
};

// Function WGame.wPawn.PlayDirectionalHit
struct AwPawn_PlayDirectionalHit_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
	bool                                               bUseHitStun;                                              // (OptionalParm, Parm)
	bool                                               bGoreChange;                                              // (OptionalParm, Parm)
};

// Function WGame.wPawn.PlayDirectionalDeath
struct AwPawn_PlayDirectionalDeath_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
};

// Function WGame.wPawn.KImpact
struct AwPawn_KImpact_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	struct FVector                                     pos;                                                      // (Parm)
	struct FVector                                     impactVel;                                                // (Parm)
	struct FVector                                     impactNorm;                                               // (Parm)
};

// Function WGame.wPawn.PlayTakeHit
struct AwPawn_PlayTakeHit_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
};

// Function WGame.wPawn.ClientDying
struct AwPawn_ClientDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.wPawn.SpawnGibs
struct AwPawn_SpawnGibs_Params
{
	struct FRotator                                    HitRotation;                                              // (Parm)
	float                                              ChunkPerterbation;                                        // (Parm)
};

// Function WGame.wPawn.PlayDyingAnimation
struct AwPawn_PlayDyingAnimation_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
};

// Function WGame.wPawn.PlayDying
struct AwPawn_PlayDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wPawn.RandSpin
struct AwPawn_RandSpin_Params
{
	float                                              spinRate;                                                 // (Parm)
};

// Function WGame.wPawn.KSkelConvulse
struct AwPawn_KSkelConvulse_Params
{
};

// Function WGame.wPawn.SetWeaponAttachment
struct AwPawn_SetWeaponAttachment_Params
{
	class AwWeaponAttachment*                          NewAtt;                                                   // (Parm)
};

// Function WGame.wPawn.PlayVictoryAnimation
struct AwPawn_PlayVictoryAnimation_Params
{
};

// Function WGame.wPawn.CheckProneAni
struct AwPawn_CheckProneAni_Params
{
	bool                                               bGoProne;                                                 // (Parm)
};

// Function WGame.wPawn.ServerThrowsWeaponAnim
struct AwPawn_ServerThrowsWeaponAnim_Params
{
	bool                                               bQuick;                                                   // (Parm)
};

// Function WGame.wPawn.ServerPlayPutdownWeaponAnim
struct AwPawn_ServerPlayPutdownWeaponAnim_Params
{
	bool                                               bQuick;                                                   // (Parm)
};

// Function WGame.wPawn.PlayWeaponSwitch
struct AwPawn_PlayWeaponSwitch_Params
{
	class AwWeapon*                                    newWeapon;                                                // (Parm)
};

// Function WGame.wPawn.AnimEnd
struct AwPawn_AnimEnd_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WGame.wPawn.ScriptPlayIdle
struct AwPawn_ScriptPlayIdle_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WGame.wPawn.InitialPlayer
struct AwPawn_InitialPlayer_Params
{
};

// Function WGame.wPawn.GetIsFiring
struct AwPawn_GetIsFiring_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.StopFiring
struct AwPawn_StopFiring_Params
{
};

// Function WGame.wPawn.StartFiring
struct AwPawn_StartFiring_Params
{
	bool                                               bHeavy;                                                   // (Parm)
	bool                                               bRapid;                                                   // (Parm)
};

// Function WGame.wPawn.SetAnimAction
struct AwPawn_SetAnimAction_Params
{
	struct FName                                       NewAction;                                                // (Parm)
};

// Function WGame.wPawn.FindValidTaunt
struct AwPawn_FindValidTaunt_Params
{
	struct FName                                       Sequence;                                                 // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.PlayDoubleJump
struct AwPawn_PlayDoubleJump_Params
{
};

// Function WGame.wPawn.GetAnimSequence
struct AwPawn_GetAnimSequence_Params
{
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.Landed
struct AwPawn_Landed_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WGame.wPawn.PlayLandedSound
struct AwPawn_PlayLandedSound_Params
{
	int                                                SurfType;                                                 // (Parm)
};

// Function WGame.wPawn.GetOffhandBoneFor
struct AwPawn_GetOffhandBoneFor_Params
{
	class AInventory*                                  i;                                                        // (Parm)
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.GetWeaponBoneFor
struct AwPawn_GetWeaponBoneFor_Params
{
	class AInventory*                                  i;                                                        // (Parm)
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.CheckReflect
struct AwPawn_CheckReflect_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     RefNormal;                                                // (Parm, OutParm)
	int                                                Damage;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.PlayHit
struct AwPawn_PlayHit_Params
{
	float                                              Damage;                                                   // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wPawn.PostNetBeginPlay
struct AwPawn_PostNetBeginPlay_Params
{
};

// Function WGame.wPawn.InitMyParam
struct AwPawn_InitMyParam_Params
{
};

// Function WGame.wPawn.PostBeginPlay
struct AwPawn_PostBeginPlay_Params
{
};

// Function WGame.wPawn.WithinRadius
struct AwPawn_WithinRadius_Params
{
};

// Function WGame.wPawn.SetProximityFuze
struct AwPawn_SetProximityFuze_Params
{
	bool                                               bProximity;                                               // (Parm)
	class AwPawn*                                      aiBot;                                                    // (Parm)
};

// Function WGame.wPawn.TickDamageWithinRadius
struct AwPawn_TickDamageWithinRadius_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wPawn.Tick
struct AwPawn_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wPawn.TestVersion_SetParameters
struct AwPawn_TestVersion_SetParameters_Params
{
};

// Function WGame.wPawn.TickDeRes
struct AwPawn_TickDeRes_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wPawn.SetOverlayMaterial
struct AwPawn_SetOverlayMaterial_Params
{
	class UMaterial*                                   mat;                                                      // (Parm)
	float                                              Time;                                                     // (Parm)
	bool                                               bOverride;                                                // (Parm)
};

// Function WGame.wPawn.StartDeRes
struct AwPawn_StartDeRes_Params
{
};

// Function WGame.wPawn.DoDamageFX
struct AwPawn_DoDamageFX_Params
{
	struct FName                                       BoneName;                                                 // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FRotator                                    R;                                                        // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wPawn.GetBoneNameByCollisionID
struct AwPawn_GetBoneNameByCollisionID_Params
{
	int                                                CollisionID;                                              // (Parm)
	struct FName                                       BoneName;                                                 // (Parm, OutParm)
};

// Function WGame.wPawn.CalcHitLoc
struct AwPawn_CalcHitLoc_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
	struct FVector                                     hitRay;                                                   // (Parm)
	struct FName                                       BoneName;                                                 // (Parm, OutParm)
	float                                              dist;                                                     // (Parm, OutParm)
};

// Function WGame.wPawn.HideBone
struct AwPawn_HideBone_Params
{
	struct FName                                       BoneName;                                                 // (Parm)
};

// Function WGame.wPawn.GetBloodHitClass
struct AwPawn_GetBloodHitClass_Params
{
	bool                                               bHeadShot;                                                // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.ProcessHitFX
struct AwPawn_ProcessHitFX_Params
{
};

// Function WGame.wPawn.SpawnGiblet
struct AwPawn_SpawnGiblet_Params
{
	class UClass*                                      GibClass;                                                 // (Parm)
	struct FVector                                     Location;                                                 // (Parm)
	struct FRotator                                    Rotation;                                                 // (Parm)
	float                                              GibPerterbation;                                          // (Parm)
	struct FVector                                     GibVelocity;                                              // (Parm)
};

// Function WGame.wPawn.SetHeadScale
struct AwPawn_SetHeadScale_Params
{
	float                                              NewScale;                                                 // (Parm)
};

// Function WGame.wPawn.AttachEffect
struct AwPawn_AttachEffect_Params
{
	class UClass*                                      EmitterClass;                                             // (Parm)
	struct FName                                       BoneName;                                                 // (Parm)
	struct FVector                                     Location;                                                 // (Parm)
	struct FRotator                                    Rotation;                                                 // (Parm)
};

// Function WGame.wPawn.StopDriving
struct AwPawn_StopDriving_Params
{
	class AVehicle*                                    V;                                                        // (Parm)
};

// Function WGame.wPawn.StartDriving
struct AwPawn_StartDriving_Params
{
	class AVehicle*                                    V;                                                        // (Parm)
};

// Function WGame.wPawn.TickDamage
struct AwPawn_TickDamage_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wPawn.TickFX
struct AwPawn_TickFX_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wPawn.RemovePowerups
struct AwPawn_RemovePowerups_Params
{
};

// Function WGame.wPawn.GetTeam
struct AwPawn_GetTeam_Params
{
	class ATeamInfo*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.GetTeamNum
struct AwPawn_GetTeamNum_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.GetKillerController
struct AwPawn_GetKillerController_Params
{
	class AController*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.Gasp
struct AwPawn_Gasp_Params
{
};

// Function WGame.wPawn.PlayDyingSound
struct AwPawn_PlayDyingSound_Params
{
};

// Function WGame.wPawn.PlayMoverHitSound
struct AwPawn_PlayMoverHitSound_Params
{
};

// Function WGame.wPawn.PlayTeleportEffect
struct AwPawn_PlayTeleportEffect_Params
{
	bool                                               bOut;                                                     // (Parm)
	bool                                               bSound;                                                   // (Parm)
};

// Function WGame.wPawn.DeactivateSpawnProtection
struct AwPawn_DeactivateSpawnProtection_Params
{
};

// Function WGame.wPawn.AdjustedStrength
struct AwPawn_AdjustedStrength_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.PhysicsVolumeChange
struct AwPawn_PhysicsVolumeChange_Params
{
	class APhysicsVolume*                              NewVolume;                                                // (Parm)
};

// Function WGame.wPawn.RemoveFlamingEffects
struct AwPawn_RemoveFlamingEffects_Params
{
};

// Function WGame.wPawn.Destroyed
struct AwPawn_Destroyed_Params
{
};

// Function WGame.wPawn.AssignInitialPose
struct AwPawn_AssignInitialPose_Params
{
};

// Function WGame.wPawn.DoTranslocateOut
struct AwPawn_DoTranslocateOut_Params
{
	struct FVector                                     PrevLocation;                                             // (Parm)
};

// Function WGame.wPawn.WasPlayerPawn
struct AwPawn_WasPlayerPawn_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.UnPossessed
struct AwPawn_UnPossessed_Params
{
};

// Function WGame.wPawn.PossessedBy
struct AwPawn_PossessedBy_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WGame.wPawn.GetPlacedRoster
struct AwPawn_GetPlacedRoster_Params
{
	class URosterEntry*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawn.PlayWaiting
struct AwPawn_PlayWaiting_Params
{
};

// Function WGame.wPawn.AltFire
struct AwPawn_AltFire_Params
{
	float                                              f;                                                        // (OptionalParm, Parm)
};

// Function WGame.wPawn.Fire
struct AwPawn_Fire_Params
{
	float                                              f;                                                        // (OptionalParm, Parm)
};

// Function WGame.wPawn.ClientWeaponReset
struct AwPawn_ClientWeaponReset_Params
{
};

// Function WGame.wPawn.SimulatedSetRotation
struct AwPawn_SimulatedSetRotation_Params
{
	struct FRotator                                    R;                                                        // (Parm)
};

// Function WGame.wPawn.PlayTurretIdleAnim
struct AwPawn_PlayTurretIdleAnim_Params
{
	bool                                               UpDown;                                                   // (OptionalParm, Parm)
};

// Function WGame.wMonster.StartDeRes
struct AwMonster_StartDeRes_Params
{
};

// Function WGame.wMonster.ProcessHitFX
struct AwMonster_ProcessHitFX_Params
{
};

// Function WGame.wMonster.CreateGib
struct AwMonster_CreateGib_Params
{
	struct FName                                       BoneName;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FRotator                                    R;                                                        // (Parm)
};

// Function WGame.wMonster.SetAnimAction
struct AwMonster_SetAnimAction_Params
{
	struct FName                                       NewAction;                                                // (Parm)
};

// Function WGame.wMonster.PlayVictoryAnimation
struct AwMonster_PlayVictoryAnimation_Params
{
};

// Function WGame.wMonster.MeleeDamageTarget
struct AwMonster_MeleeDamageTarget_Params
{
	int                                                hitdamage;                                                // (Parm)
	struct FVector                                     pushdir;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.PlayDyingSound
struct AwMonster_PlayDyingSound_Params
{
};

// Function WGame.wMonster.PlayDying
struct AwMonster_PlayDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wMonster.PlayTakeHit
struct AwMonster_PlayTakeHit_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
};

// Function WGame.wMonster.IsPlayerPawn
struct AwMonster_IsPlayerPawn_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.SetMovementPhysics
struct AwMonster_SetMovementPhysics_Params
{
};

// Function WGame.wMonster.AnimEnd
struct AwMonster_AnimEnd_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WGame.wMonster.PlayVictory
struct AwMonster_PlayVictory_Params
{
};

// Function WGame.wMonster.Destroyed
struct AwMonster_Destroyed_Params
{
};

// Function WGame.wMonster.PlayChallengeSound
struct AwMonster_PlayChallengeSound_Params
{
};

// Function WGame.wMonster.AssignInitialPose
struct AwMonster_AssignInitialPose_Params
{
};

// Function WGame.wMonster.SameSpeciesAs
struct AwMonster_SameSpeciesAs_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.LandThump
struct AwMonster_LandThump_Params
{
};

// Function WGame.wMonster.PostBeginPlay
struct AwMonster_PostBeginPlay_Params
{
};

// Function WGame.wMonster.FireProjectile
struct AwMonster_FireProjectile_Params
{
};

// Function WGame.wMonster.GetFireStart
struct AwMonster_GetFireStart_Params
{
	struct FVector                                     X;                                                        // (Parm)
	struct FVector                                     Y;                                                        // (Parm)
	struct FVector                                     Z;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.RangedAttackTime
struct AwMonster_RangedAttackTime_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.HasRangedAttack
struct AwMonster_HasRangedAttack_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.PreferMelee
struct AwMonster_PreferMelee_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.Fire
struct AwMonster_Fire_Params
{
	float                                              f;                                                        // (OptionalParm, Parm)
};

// Function WGame.wMonster.IsHeadShot
struct AwMonster_IsHeadShot_Params
{
	struct FVector                                     loc;                                                      // (Parm)
	struct FVector                                     ray;                                                      // (Parm)
	float                                              AdditionalScale;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.ForceDefaultCharacter
struct AwMonster_ForceDefaultCharacter_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.TurnOff
struct AwMonster_TurnOff_Params
{
};

// Function WGame.wMonster.GetChargingDist
struct AwMonster_GetChargingDist_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.RecommendSplashDamage
struct AwMonster_RecommendSplashDamage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.GetDamageRadius
struct AwMonster_GetDamageRadius_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.SplashDamage
struct AwMonster_SplashDamage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.StopFiring
struct AwMonster_StopFiring_Params
{
};

// Function WGame.wMonster.CanAttack
struct AwMonster_CanAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonster.RangedAttack
struct AwMonster_RangedAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wMonster.PostNetBeginPlay
struct AwMonster_PostNetBeginPlay_Params
{
};

// Function WGame.wMonster.SetBotMesh
struct AwMonster_SetBotMesh_Params
{
};

// Function WGame.wDefenceBoss.Process_TossWeapon_When_Dying
struct AwDefenceBoss_Process_TossWeapon_When_Dying_Params
{
	class ALevelInfo*                                  levenInfo;                                                // (Parm)
	class APawn*                                       Pawn;                                                     // (Parm)
	class AwWeapon*                                    Weapon;                                                   // (Parm)
};

// Function WGame.wDefenceBoss.FootStepping
struct AwDefenceBoss_FootStepping_Params
{
	int                                                side;                                                     // (Parm)
};

// Function WGame.wDefenceBoss.EffectExplosion
struct AwDefenceBoss_EffectExplosion_Params
{
};

// Function WGame.wDefenceBoss.PlayDying
struct AwDefenceBoss_PlayDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wDefenceBoss.SetAnimAction
struct AwDefenceBoss_SetAnimAction_Params
{
	struct FName                                       NewAction;                                                // (Parm)
};

// Function WGame.wDefenceBoss.SpawnLastAttackEffect
struct AwDefenceBoss_SpawnLastAttackEffect_Params
{
};

// Function WGame.wDefenceBoss.TakeDamage
struct AwDefenceBoss_TakeDamage_Params
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

// Function WGame.wDefenceBoss.Tick
struct AwDefenceBoss_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wDefenceBoss.ServerTick
struct AwDefenceBoss_ServerTick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wDefenceBoss.PatternTick
struct AwDefenceBoss_PatternTick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wDefenceBoss.Bump
struct AwDefenceBoss_Bump_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WGame.wDefenceBoss.FinalMeleeAttack
struct AwDefenceBoss_FinalMeleeAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wDefenceBoss.RangedAttack
struct AwDefenceBoss_RangedAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wDefenceBoss.LastMeleeAttack
struct AwDefenceBoss_LastMeleeAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wDefenceBoss.StartCharging
struct AwDefenceBoss_StartCharging_Params
{
};

// Function WGame.wDefenceBoss.RangedAttackTime
struct AwDefenceBoss_RangedAttackTime_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.GetFireStart
struct AwDefenceBoss_GetFireStart_Params
{
	struct FVector                                     X;                                                        // (Parm)
	struct FVector                                     Y;                                                        // (Parm)
	struct FVector                                     Z;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.GetFireBack
struct AwDefenceBoss_GetFireBack_Params
{
	struct FVector                                     X;                                                        // (Parm)
	struct FVector                                     Y;                                                        // (Parm)
	struct FVector                                     Z;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.PlayVictory
struct AwDefenceBoss_PlayVictory_Params
{
};

// Function WGame.wDefenceBoss.PlayDirectionalHit
struct AwDefenceBoss_PlayDirectionalHit_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
	bool                                               bUseHitStun;                                              // (OptionalParm, Parm)
	bool                                               bGoreChange;                                              // (OptionalParm, Parm)
};

// Function WGame.wDefenceBoss.PlayDirectionalDeath
struct AwDefenceBoss_PlayDirectionalDeath_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
};

// Function WGame.wDefenceBoss.AnimEnd
struct AwDefenceBoss_AnimEnd_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WGame.wDefenceBoss.WingBeat
struct AwDefenceBoss_WingBeat_Params
{
};

// Function WGame.wDefenceBoss.SetMovementPhysics
struct AwDefenceBoss_SetMovementPhysics_Params
{
};

// Function WGame.wDefenceBoss.PostBeginPlay
struct AwDefenceBoss_PostBeginPlay_Params
{
};

// Function WGame.wDefenceBoss.FireProjectile
struct AwDefenceBoss_FireProjectile_Params
{
};

// Function WGame.wDefenceBoss.FireProjectile_Beam
struct AwDefenceBoss_FireProjectile_Beam_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.FireBeam
struct AwDefenceBoss_FireBeam_Params
{
};

// Function WGame.wDefenceBoss.StopPrepareBeamEffect
struct AwDefenceBoss_StopPrepareBeamEffect_Params
{
};

// Function WGame.wDefenceBoss.SpawnPrepareBeamEffect
struct AwDefenceBoss_SpawnPrepareBeamEffect_Params
{
};

// Function WGame.wDefenceBoss.GetRandDirection
struct AwDefenceBoss_GetRandDirection_Params
{
	struct FRotator                                    InRotation;                                               // (Parm)
	int                                                iDegreeX;                                                 // (Parm)
	int                                                iDegreeY;                                                 // (Parm)
	int                                                iDegreeZ;                                                 // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.FireProjectile_Rocket
struct AwDefenceBoss_FireProjectile_Rocket_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.FireProjectile_Rocket2
struct AwDefenceBoss_FireProjectile_Rocket2_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.ReadyToRocket
struct AwDefenceBoss_ReadyToRocket_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.ReadyToBeam
struct AwDefenceBoss_ReadyToBeam_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.RemainTimeRangedAttack
struct AwDefenceBoss_RemainTimeRangedAttack_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.ReadyToRangedAttack
struct AwDefenceBoss_ReadyToRangedAttack_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.GetChargingDist
struct AwDefenceBoss_GetChargingDist_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.Destroyed
struct AwDefenceBoss_Destroyed_Params
{
};

// Function WGame.wDefenceBoss.Create
struct AwDefenceBoss_Create_Params
{
	class ALevelInfo*                                  Level;                                                    // (Parm)
	unsigned char                                      TeamNum;                                                  // (Parm)
	int                                                Grade;                                                    // (Parm)
	int                                                RegenLoc;                                                 // (Parm)
	class AwDefenceBoss*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBoss.GetFlyingPathNode
struct AwDefenceBoss_GetFlyingPathNode_Params
{
	class ALevelInfo*                                  Level;                                                    // (Parm)
	int                                                idx;                                                      // (Parm)
	int                                                RegenLoc;                                                 // (OptionalParm, Parm)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.AnimNotify_Nemesis_BeamFire.Notify
struct UAnimNotify_Nemesis_BeamFire_Notify_Params
{
	class AActor*                                      Owner;                                                    // (Parm)
};

// Function WGame.wPlayer.MakeItemBox
struct AwPlayer_MakeItemBox_Params
{
	struct FString                                     t;                                                        // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.AnimRate
struct AwPlayer_AnimRate_Params
{
	float                                              fAnimRate;                                                // (Parm)
};

// Function WGame.wPlayer.UseRagdoll
struct AwPlayer_UseRagdoll_Params
{
	bool                                               bUse;                                                     // (Parm)
};

// Function WGame.wPlayer.BodyRot_BR
struct AwPlayer_BodyRot_BR_Params
{
	float                                              fR;                                                       // (Parm)
};

// Function WGame.wPlayer.BodyRot_BL
struct AwPlayer_BodyRot_BL_Params
{
	float                                              fR;                                                       // (Parm)
};

// Function WGame.wPlayer.BodyRot_FR
struct AwPlayer_BodyRot_FR_Params
{
	float                                              fR;                                                       // (Parm)
};

// Function WGame.wPlayer.BodyRot_FL
struct AwPlayer_BodyRot_FL_Params
{
	float                                              fR;                                                       // (Parm)
};

// Function WGame.wPlayer.Rot_CBR
struct AwPlayer_Rot_CBR_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Rot_CBL
struct AwPlayer_Rot_CBL_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Rot_CFR
struct AwPlayer_Rot_CFR_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Rot_CFL
struct AwPlayer_Rot_CFL_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Rot_BR
struct AwPlayer_Rot_BR_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Rot_BL
struct AwPlayer_Rot_BL_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Rot_FR
struct AwPlayer_Rot_FR_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Rot_FL
struct AwPlayer_Rot_FL_Params
{
	struct FString                                     fX;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fY;                                                       // (Parm, NeedCtorLink)
	struct FString                                     fZ;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.ShowRot
struct AwPlayer_ShowRot_Params
{
};

// Function WGame.wPlayer.RenderSpectatorFPWeapon
struct AwPlayer_RenderSpectatorFPWeapon_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	bool                                               bClearedZBuffer;                                          // (Parm)
};

// Function WGame.wPlayer.ChangeMouseSenseAim
struct AwPlayer_ChangeMouseSenseAim_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wPlayer.ChangeMouseSense
struct AwPlayer_ChangeMouseSense_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wPlayer.MouseSenseDownAim
struct AwPlayer_MouseSenseDownAim_Params
{
};

// Function WGame.wPlayer.MouseSenseUpAim
struct AwPlayer_MouseSenseUpAim_Params
{
};

// Function WGame.wPlayer.MouseSenseDown
struct AwPlayer_MouseSenseDown_Params
{
};

// Function WGame.wPlayer.MouseSenseUp
struct AwPlayer_MouseSenseUp_Params
{
};

// Function WGame.wPlayer.RemoveSkill_Client
struct AwPlayer_RemoveSkill_Client_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WGame.wPlayer.RemoveSkill
struct AwPlayer_RemoveSkill_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WGame.wPlayer.ClientReStart
struct AwPlayer_ClientReStart_Params
{
	class APawn*                                       NewPawn;                                                  // (Parm)
};

// Function WGame.wPlayer.ApplySkill_Client
struct AwPlayer_ApplySkill_Client_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WGame.wPlayer.AddSkill_Client
struct AwPlayer_AddSkill_Client_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WGame.wPlayer.SkillInit_Server
struct AwPlayer_SkillInit_Server_Params
{
	bool                                               bQuickslotChange;                                         // (Parm)
};

// Function WGame.wPlayer.AddSkill
struct AwPlayer_AddSkill_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WGame.wPlayer.ShowResultMenu
struct AwPlayer_ShowResultMenu_Params
{
};

// Function WGame.wPlayer.HIJTest00
struct AwPlayer_HIJTest00_Params
{
};

// Function WGame.wPlayer.PartsTest
struct AwPlayer_PartsTest_Params
{
};

// Function WGame.wPlayer.tT
struct AwPlayer_tT_Params
{
	float                                              fRate;                                                    // (Parm)
};

// Function WGame.wPlayer.TTT
struct AwPlayer_TTT_Params
{
};

// Function WGame.wPlayer.HIJ
struct AwPlayer_HIJ_Params
{
};

// Function WGame.wPlayer.ServerWarp
struct AwPlayer_ServerWarp_Params
{
};

// Function WGame.wPlayer.Warp
struct AwPlayer_Warp_Params
{
};

// Function WGame.wPlayer.ActivateSupplyItem
struct AwPlayer_ActivateSupplyItem_Params
{
	class AController*                                 callingController;                                        // (Parm)
	TEnumAsByte<ESUPPLY_ITEM_TYPE>                     eSupplyItemType;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.CanUseActivateSupplyItem
struct AwPlayer_CanUseActivateSupplyItem_Params
{
	class AController*                                 callingController;                                        // (Parm)
	TEnumAsByte<ESUPPLY_ITEM_TYPE>                     eSupplyItemType;                                          // (Parm)
	bool                                               bShowMessage;                                             // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.UAV
struct AwPlayer_UAV_Params
{
};

// Function WGame.wPlayer.DoAirStrikeFire
struct AwPlayer_DoAirStrikeFire_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.wPlayer.IsActiveMyTeamSentryGun
struct AwPlayer_IsActiveMyTeamSentryGun_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.IsActiveUAV
struct AwPlayer_IsActiveUAV_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.IsActiveHelicopter
struct AwPlayer_IsActiveHelicopter_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.IsActiveAirFire
struct AwPlayer_IsActiveAirFire_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.heli
struct AwPlayer_heli_Params
{
};

// Function WGame.wPlayer.c4
struct AwPlayer_c4_Params
{
};

// Function WGame.wPlayer.art
struct AwPlayer_art_Params
{
};

// Function WGame.wPlayer.ServerCallSentryGunInstall
struct AwPlayer_ServerCallSentryGunInstall_Params
{
	class AController*                                 callingController;                                        // (Parm)
};

// Function WGame.wPlayer.ServerCallAirStrike
struct AwPlayer_ServerCallAirStrike_Params
{
	class AController*                                 Caller;                                                   // (OptionalParm, Parm)
};

// Function WGame.wPlayer.ServerCallHelicopter
struct AwPlayer_ServerCallHelicopter_Params
{
	class APawn*                                       lastHeliPawn;                                             // (OptionalParm, Parm)
	class AController*                                 Caller;                                                   // (OptionalParm, Parm)
};

// Function WGame.wPlayer.Check
struct AwPlayer_Check_Params
{
};

// Function WGame.wPlayer.ShowBindings
struct AwPlayer_ShowBindings_Params
{
};

// Function WGame.wPlayer.ShowAliases
struct AwPlayer_ShowAliases_Params
{
};

// Function WGame.wPlayer.InitializeVoiceChat
struct AwPlayer_InitializeVoiceChat_Params
{
};

// Function WGame.wPlayer.ClientReceiveBan
struct AwPlayer_ClientReceiveBan_Params
{
	struct FString                                     BanInfo;                                                  // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.ServerRequestBanInfo
struct AwPlayer_ServerRequestBanInfo_Params
{
	int                                                PlayerID;                                                 // (Parm)
};

// Function WGame.wPlayer.ServerSpecViewGoal
struct AwPlayer_ServerSpecViewGoal_Params
{
};

// Function WGame.wPlayer.SpecViewGoal
struct AwPlayer_SpecViewGoal_Params
{
};

// Function WGame.wPlayer.ServerRequestPlayerInfo
struct AwPlayer_ServerRequestPlayerInfo_Params
{
};

// Function WGame.wPlayer.AdminMenu
struct AwPlayer_AdminMenu_Params
{
	struct FString                                     CommandLine;                                              // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.PostNetReceive
struct AwPlayer_PostNetReceive_Params
{
};

// Function WGame.wPlayer.NeedNetNotify
struct AwPlayer_NeedNetNotify_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.ChangeCharacter
struct AwPlayer_ChangeCharacter_Params
{
	struct FString                                     newCharacter;                                             // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Possess
struct AwPlayer_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wPlayer.SetPawnFemale
struct AwPlayer_SetPawnFemale_Params
{
};

// Function WGame.wPlayer.UpdateModeItem_SkinCharacter
struct AwPlayer_UpdateModeItem_SkinCharacter_Params
{
	int                                                BodyItemID;                                               // (Parm, OutParm)
	class UwMatchMaker*                                MM;                                                       // (Parm)
	unsigned char                                      byModeItem;                                               // (Parm)
	int                                                ItemID;                                                   // (Parm)
};

// Function WGame.wPlayer.SetPlayerEquipInfo
struct AwPlayer_SetPlayerEquipInfo_Params
{
};

// Function WGame.wPlayer.SetPawnClass
struct AwPlayer_SetPawnClass_Params
{
	struct FString                                     inClass;                                                  // (Parm, NeedCtorLink)
	struct FString                                     InCharacter;                                              // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.PawnDied
struct AwPlayer_PawnDied_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wPlayer.CameraTrack
struct AwPlayer_CameraTrack_Params
{
	class APawn*                                       Target;                                                   // (Parm)
	float                                              DeltaTime;                                                // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.LineOfSight
struct AwPlayer_LineOfSight_Params
{
	int                                                C;                                                        // (Parm)
	class APawn*                                       Target;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.PickNextBot
struct AwPlayer_PickNextBot_Params
{
	class APawn*                                       current;                                                  // (Parm)
	class APawn*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.FindFloatingCam
struct AwPlayer_FindFloatingCam_Params
{
	class APawn*                                       Target;                                                   // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.FindFixedCam
struct AwPlayer_FindFixedCam_Params
{
	class APawn*                                       Target;                                                   // (Parm)
	int                                                newcam;                                                   // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.FillCameraList
struct AwPlayer_FillCameraList_Params
{
};

// Function WGame.wPlayer.ServerDoCombo
struct AwPlayer_ServerDoCombo_Params
{
	class UClass*                                      ComboClass;                                               // (Parm)
};

// Function WGame.wPlayer.DoCombo
struct AwPlayer_DoCombo_Params
{
	class UClass*                                      ComboClass;                                               // (Parm)
};

// Function WGame.wPlayer.ServerPlayWeaponNullSound
struct AwPlayer_ServerPlayWeaponNullSound_Params
{
	class AwWeapon*                                    Wpn;                                                      // (Parm)
	TEnumAsByte<ESoundSlot>                            Slot;                                                     // (Parm)
	bool                                               UseStereo;                                                // (OptionalParm, Parm)
};

// Function WGame.wPlayer.ProcessQuickGrenadeKey2
struct AwPlayer_ProcessQuickGrenadeKey2_Params
{
};

// Function WGame.wPlayer.ProcessQuickGrenadeKey
struct AwPlayer_ProcessQuickGrenadeKey_Params
{
};

// Function WGame.wPlayer.ProcessSwitchDemoPack
struct AwPlayer_ProcessSwitchDemoPack_Params
{
	unsigned char                                      byUsed;                                                   // (Parm, OutParm)
	bool                                               hasBomb;                                                  // (Parm)
	bool                                               bSettingBomb;                                             // (Parm)
};

// Function WGame.wPlayer.ProcessSetObjective
struct AwPlayer_ProcessSetObjective_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.ProcessUseKey
struct AwPlayer_ProcessUseKey_Params
{
};

// Function WGame.wPlayer.PlayerTick
struct AwPlayer_PlayerTick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wPlayer.NotifyTakeHit
struct AwPlayer_NotifyTakeHit_Params
{
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wPlayer.ClientReceiveCombo
struct AwPlayer_ClientReceiveCombo_Params
{
	struct FString                                     NewCombo;                                                 // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.ServerSetClassicTrans
struct AwPlayer_ServerSetClassicTrans_Params
{
	bool                                               B;                                                        // (Parm)
};

// Function WGame.wPlayer.PostNetBeginPlay
struct AwPlayer_PostNetBeginPlay_Params
{
};

// Function WGame.wPlayer.PostBeginPlay
struct AwPlayer_PostBeginPlay_Params
{
};

// Function WGame.wPlayer.L33TPhrase
struct AwPlayer_L33TPhrase_Params
{
	int                                                phraseNum;                                                // (Parm)
};

// Function WGame.wPlayer.RateWeapon
struct AwPlayer_RateWeapon_Params
{
	class AwWeapon*                                    W;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.PlayBeepSound
struct AwPlayer_PlayBeepSound_Params
{
};

// Function WGame.wPlayer.StopFiring
struct AwPlayer_StopFiring_Params
{
};

// Function WGame.wPlayer.ClientReceiveMapName
struct AwPlayer_ClientReceiveMapName_Params
{
	struct FString                                     NewMap;                                                   // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.ServerRequestMapList
struct AwPlayer_ServerRequestMapList_Params
{
};

// Function WGame.wPlayer.ClientReceiveResultMenu
struct AwPlayer_ClientReceiveResultMenu_Params
{
	struct FString                                     MenuClass;                                                // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.ClientReceiveRule
struct AwPlayer_ClientReceiveRule_Params
{
	struct FString                                     NewRule;                                                  // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.ServerRequestRules
struct AwPlayer_ServerRequestRules_Params
{
};

// Function WGame.wPlayer.GetPhysicsString
struct AwPlayer_GetPhysicsString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPlayer.GetRoleString
struct AwPlayer_GetRoleString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPlayer.DebugMessage
struct AwPlayer_DebugMessage_Params
{
	struct FString                                     DebugString;                                              // (Parm, NeedCtorLink)
	struct FName                                       Type;                                                     // (OptionalParm, Parm)
};

// Function WGame.wPlayer.CheckPriority
struct AwPlayer_CheckPriority_Params
{
};

// Function WGame.wPlayer.InInventoryRebuildSkipList
struct AwPlayer_InInventoryRebuildSkipList_Params
{
	class AwWeapon*                                    W;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.ServerRequestWeapon
struct AwPlayer_ServerRequestWeapon_Params
{
	int                                                iWeaponID;                                                // (Parm)
};

// Function WGame.wPlayer.SetSpeed
struct AwPlayer_SetSpeed_Params
{
	float                                              factor;                                                   // (Parm)
};

// Function WGame.wPlayer.ResetNames
struct AwPlayer_ResetNames_Params
{
};

// Function WGame.wPlayer.setcmd
struct AwPlayer_setcmd_Params
{
	struct FString                                     targetName;                                               // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.Cmd
struct AwPlayer_Cmd_Params
{
	struct FString                                     P1;                                                       // (Parm, NeedCtorLink)
	struct FString                                     P2;                                                       // (Parm, NeedCtorLink)
	struct FString                                     p3;                                                       // (Parm, NeedCtorLink)
	struct FString                                     p4;                                                       // (Parm, NeedCtorLink)
	struct FString                                     p5;                                                       // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.SetDoTraceNativeInstant
struct AwPlayer_SetDoTraceNativeInstant_Params
{
	bool                                               val;                                                      // (Parm)
};

// Function WGame.wPlayer.SetFovSpeed
struct AwPlayer_SetFovSpeed_Params
{
	float                                              V;                                                        // (Parm)
};

// Function WGame.wPlayer.GetFovSpeed
struct AwPlayer_GetFovSpeed_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayer.ShowPathToActor
struct AwPlayer_ShowPathToActor_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wPlayer.ProcessMapName
struct AwPlayer_ProcessMapName_Params
{
	struct FString                                     NewMap;                                                   // (Parm, NeedCtorLink)
};

// Function WGame.wPlayer.ProcessRule
struct AwPlayer_ProcessRule_Params
{
	struct FString                                     NewRule;                                                  // (Parm, NeedCtorLink)
};

// Function WGame.wSupplyPack.CanPickUp
struct AwSupplyPack_CanPickUp_Params
{
	class APawn*                                       Pawn;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wSupplyPack.Landed
struct AwSupplyPack_Landed_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WGame.wHealthPack.GetHealMax
struct AwHealthPack_GetHealMax_Params
{
	class APawn*                                       P;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHealthPack.Reset
struct AwHealthPack_Reset_Params
{
};

// Function WGame.wHealthPack.DisplayEvent
struct AwHealthPack_DisplayEvent_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wHealthPack.DeleteSuppliesPositions
struct AwHealthPack_DeleteSuppliesPositions_Params
{
};

// Function WGame.wHealthPack.PostNetBeginPlay
struct AwHealthPack_PostNetBeginPlay_Params
{
};

// Function WGame.wHealthPack.UpdateHUD
struct AwHealthPack_UpdateHUD_Params
{
	class AHUD*                                        H;                                                        // (Parm)
};

// Function WGame.wUAVPack.CanPickUp
struct AwUAVPack_CanPickUp_Params
{
	class APawn*                                       Pawn;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wUAVPack.AnnouncePickup
struct AwUAVPack_AnnouncePickup_Params
{
	class APawn*                                       Receiver;                                                 // (Parm)
};

// Function WGame.wUAVPack.Reset
struct AwUAVPack_Reset_Params
{
};

// Function WGame.wUAVPack.DeleteSuppliesPositions
struct AwUAVPack_DeleteSuppliesPositions_Params
{
};

// Function WGame.wUAVPack.PostNetBeginPlay
struct AwUAVPack_PostNetBeginPlay_Params
{
};

// Function WGame.wUAVPack.DisplayEvent
struct AwUAVPack_DisplayEvent_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wUAVPack.UpdateHUD
struct AwUAVPack_UpdateHUD_Params
{
	class AHUD*                                        H;                                                        // (Parm)
};

// Function WGame.wHeliPack.CanPickUp
struct AwHeliPack_CanPickUp_Params
{
	class APawn*                                       Pawn;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHeliPack.AnnouncePickup
struct AwHeliPack_AnnouncePickup_Params
{
	class APawn*                                       Receiver;                                                 // (Parm)
};

// Function WGame.wHeliPack.Reset
struct AwHeliPack_Reset_Params
{
};

// Function WGame.wHeliPack.DeleteSuppliesPositions
struct AwHeliPack_DeleteSuppliesPositions_Params
{
};

// Function WGame.wHeliPack.PostNetBeginPlay
struct AwHeliPack_PostNetBeginPlay_Params
{
};

// Function WGame.wHeliPack.DisplayEvent
struct AwHeliPack_DisplayEvent_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wHeliPack.UpdateHUD
struct AwHeliPack_UpdateHUD_Params
{
	class AHUD*                                        H;                                                        // (Parm)
};

// Function WGame.wBombingPack.CanPickUpPack
struct AwBombingPack_CanPickUpPack_Params
{
	class APawn*                                       Pawn;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBombingPack.AnnouncePickup
struct AwBombingPack_AnnouncePickup_Params
{
	class APawn*                                       Receiver;                                                 // (Parm)
};

// Function WGame.wBombingPack.Reset
struct AwBombingPack_Reset_Params
{
};

// Function WGame.wBombingPack.DeleteSuppliesPositions
struct AwBombingPack_DeleteSuppliesPositions_Params
{
};

// Function WGame.wBombingPack.PostNetBeginPlay
struct AwBombingPack_PostNetBeginPlay_Params
{
};

// Function WGame.wBombingPack.UpdateHUD
struct AwBombingPack_UpdateHUD_Params
{
	class AHUD*                                        H;                                                        // (Parm)
};

// Function WGame.wSentryGunPack.CanPickUp
struct AwSentryGunPack_CanPickUp_Params
{
	class APawn*                                       Pawn;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wSentryGunPack.AnnouncePickup
struct AwSentryGunPack_AnnouncePickup_Params
{
	class APawn*                                       Receiver;                                                 // (Parm)
};

// Function WGame.wSentryGunPack.Reset
struct AwSentryGunPack_Reset_Params
{
};

// Function WGame.wSentryGunPack.DeleteSuppliesPositions
struct AwSentryGunPack_DeleteSuppliesPositions_Params
{
};

// Function WGame.wSentryGunPack.PostNetBeginPlay
struct AwSentryGunPack_PostNetBeginPlay_Params
{
};

// Function WGame.wSentryGunPack.DisplayEvent
struct AwSentryGunPack_DisplayEvent_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wSentryGunPack.UpdateHUD
struct AwSentryGunPack_UpdateHUD_Params
{
	class AHUD*                                        H;                                                        // (Parm)
};

// Function WGame.wMedalPack.Reset
struct AwMedalPack_Reset_Params
{
};

// Function WGame.wMedalPack.DisplayEvent
struct AwMedalPack_DisplayEvent_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wMedalPack.DeleteSuppliesPositions
struct AwMedalPack_DeleteSuppliesPositions_Params
{
};

// Function WGame.wMedalPack.PostNetBeginPlay
struct AwMedalPack_PostNetBeginPlay_Params
{
};

// Function WGame.wMedalPack.UpdateHUD
struct AwMedalPack_UpdateHUD_Params
{
	class AHUD*                                        H;                                                        // (Parm)
};

// Function WGame.wBotVehicleController.GameHasEnded
struct AwBotVehicleController_GameHasEnded_Params
{
};

// Function WGame.wBotVehicleController.Stopped
struct AwBotVehicleController_Stopped_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.IsHunting
struct AwBotVehicleController_IsHunting_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.IsStrafing
struct AwBotVehicleController_IsStrafing_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.DefendMelee
struct AwBotVehicleController_DefendMelee_Params
{
	float                                              dist;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.DoTacticalMove
struct AwBotVehicleController_DoTacticalMove_Params
{
};

// Function WGame.wBotVehicleController.DoCharge
struct AwBotVehicleController_DoCharge_Params
{
};

// Function WGame.wBotVehicleController.DoStakeOut
struct AwBotVehicleController_DoStakeOut_Params
{
};

// Function WGame.wBotVehicleController.Celebrate
struct AwBotVehicleController_Celebrate_Params
{
};

// Function WGame.wBotVehicleController.Formation
struct AwBotVehicleController_Formation_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.NotifyTakeHit
struct AwBotVehicleController_NotifyTakeHit_Params
{
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wBotVehicleController.GetTeamNum
struct AwBotVehicleController_GetTeamNum_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.GetNextPathForMoveTarget
struct AwBotVehicleController_GetNextPathForMoveTarget_Params
{
};

// Function WGame.wBotVehicleController.GetHeli
struct AwBotVehicleController_GetHeli_Params
{
	class AwHelicopter*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.damageAttitudeTo
struct AwBotVehicleController_damageAttitudeTo_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	float                                              Damage;                                                   // (Parm)
};

// Function WGame.wBotVehicleController.Desireability
struct AwBotVehicleController_Desireability_Params
{
	class APickup*                                     P;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.FaceActor
struct AwBotVehicleController_FaceActor_Params
{
	float                                              StrafingModifier;                                         // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.ShouldStrafeTo
struct AwBotVehicleController_ShouldStrafeTo_Params
{
	class AActor*                                      WayPoint;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.FaceMoveTarget
struct AwBotVehicleController_FaceMoveTarget_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.NotifyKilled
struct AwBotVehicleController_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function WGame.wBotVehicleController.TryToDuck
struct AwBotVehicleController_TryToDuck_Params
{
	struct FVector                                     duckDir;                                                  // (Parm)
	bool                                               bReversed;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.ReceiveWarning
struct AwBotVehicleController_ReceiveWarning_Params
{
	class APawn*                                       shooter;                                                  // (Parm)
	float                                              projSpeed;                                                // (Parm)
	struct FVector                                     FireDir;                                                  // (Parm)
};

// Function WGame.wBotVehicleController.AdjustAim
struct AwBotVehicleController_AdjustAim_Params
{
	struct FFireProperties                             FiredAmmunition;                                          // (Parm)
	struct FVector                                     projStart;                                                // (Parm)
	int                                                AimError;                                                 // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.AdjustAimError
struct AwBotVehicleController_AdjustAimError_Params
{
	float                                              AimError;                                                 // (Parm)
	float                                              TargetDist;                                               // (Parm)
	bool                                               bDefendMelee;                                             // (Parm)
	bool                                               bInstantProj;                                             // (Parm)
	bool                                               bLeadTargetNow;                                           // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.CheckFutureSight
struct AwBotVehicleController_CheckFutureSight_Params
{
	float                                              DeltaTime;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.NearWall
struct AwBotVehicleController_NearWall_Params
{
	float                                              walldist;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.NeedToTurn
struct AwBotVehicleController_NeedToTurn_Params
{
	struct FVector                                     targ;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.FindBestPathToward
struct AwBotVehicleController_FindBestPathToward_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               bCheckedReach;                                            // (Parm)
	bool                                               bAllowDetour;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.NotifyLanded
struct AwBotVehicleController_NotifyLanded_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.SetFall
struct AwBotVehicleController_SetFall_Params
{
};

// Function WGame.wBotVehicleController.NotifyBump
struct AwBotVehicleController_NotifyBump_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.AdjustAround
struct AwBotVehicleController_AdjustAround_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.CancelCampFor
struct AwBotVehicleController_CancelCampFor_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WGame.wBotVehicleController.Restart
struct AwBotVehicleController_Restart_Params
{
};

// Function WGame.wBotVehicleController.TestDirection
struct AwBotVehicleController_TestDirection_Params
{
	struct FVector                                     Dir;                                                      // (Parm)
	struct FVector                                     pick;                                                     // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.FindRoamDest
struct AwBotVehicleController_FindRoamDest_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.SoakStop
struct AwBotVehicleController_SoakStop_Params
{
	struct FString                                     problem;                                                  // (Parm, NeedCtorLink)
};

// Function WGame.wBotVehicleController.DoRangedAttackOn
struct AwBotVehicleController_DoRangedAttackOn_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wBotVehicleController.EnemyVisible
struct AwBotVehicleController_EnemyVisible_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.DoWaitForLanding
struct AwBotVehicleController_DoWaitForLanding_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.ExecuteWhatToDoNext
struct AwBotVehicleController_ExecuteWhatToDoNext_Params
{
};

// Function WGame.wBotVehicleController.GetEnemyName
struct AwBotVehicleController_GetEnemyName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wBotVehicleController.GetOldEnemyName
struct AwBotVehicleController_GetOldEnemyName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wBotVehicleController.TryToWalk
struct AwBotVehicleController_TryToWalk_Params
{
};

// Function WGame.wBotVehicleController.WhatToDoNext
struct AwBotVehicleController_WhatToDoNext_Params
{
	unsigned char                                      CallingByte;                                              // (Parm)
};

// Function WGame.wBotVehicleController.SetPeripheralVision
struct AwBotVehicleController_SetPeripheralVision_Params
{
};

// Function WGame.wBotVehicleController.SetMaxDesiredSpeed
struct AwBotVehicleController_SetMaxDesiredSpeed_Params
{
};

// Function WGame.wBotVehicleController.ResetSkill
struct AwBotVehicleController_ResetSkill_Params
{
};

// Function WGame.wBotVehicleController.InitializeSkill
struct AwBotVehicleController_InitializeSkill_Params
{
	float                                              InSkill;                                                  // (Parm)
};

// Function WGame.wBotVehicleController.Possess
struct AwBotVehicleController_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wBotVehicleController.NotifyMissedJump
struct AwBotVehicleController_NotifyMissedJump_Params
{
};

// Function WGame.wBotVehicleController.NotifyPhysicsVolumeChange
struct AwBotVehicleController_NotifyPhysicsVolumeChange_Params
{
	class APhysicsVolume*                              NewVolume;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.StrafeFromDamage
struct AwBotVehicleController_StrafeFromDamage_Params
{
	float                                              Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	bool                                               bFindDest;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.EnemyChanged
struct AwBotVehicleController_EnemyChanged_Params
{
	bool                                               bNewEnemyVisible;                                         // (Parm)
};

// Function WGame.wBotVehicleController.SetEnemyInfo
struct AwBotVehicleController_SetEnemyInfo_Params
{
	bool                                               bNewEnemyVisible;                                         // (Parm)
};

// Function WGame.wBotVehicleController.Trigger
struct AwBotVehicleController_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function WGame.wBotVehicleController.CheckIfShouldCrouch
struct AwBotVehicleController_CheckIfShouldCrouch_Params
{
	struct FVector                                     StartPosition;                                            // (Parm)
	struct FVector                                     TargetPosition;                                           // (Parm)
	float                                              Probability;                                              // (Parm)
};

// Function WGame.wBotVehicleController.ClearShot
struct AwBotVehicleController_ClearShot_Params
{
	struct FVector                                     TargetLoc;                                                // (Parm)
	bool                                               bImmediateFire;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.SeePlayer
struct AwBotVehicleController_SeePlayer_Params
{
	class APawn*                                       SeenPlayer;                                               // (Parm)
};

// Function WGame.wBotVehicleController.HearNoise
struct AwBotVehicleController_HearNoise_Params
{
	float                                              Loudness;                                                 // (Parm)
	class AActor*                                      NoiseMaker;                                               // (Parm)
};

// Function WGame.wBotVehicleController.SetEnemy
struct AwBotVehicleController_SetEnemy_Params
{
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               bHateMonster;                                             // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.ChangeEnemy
struct AwBotVehicleController_ChangeEnemy_Params
{
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               bCanSeeNewEnemy;                                          // (Parm)
};

// Function WGame.wBotVehicleController.FindNewEnemy
struct AwBotVehicleController_FindNewEnemy_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.DisplayDebug
struct AwBotVehicleController_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wBotVehicleController.StopFiring
struct AwBotVehicleController_StopFiring_Params
{
};

// Function WGame.wBotVehicleController.CanAttack
struct AwBotVehicleController_CanAttack_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.FireWeaponAt
struct AwBotVehicleController_FireWeaponAt_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicleController.TimedFireWeaponAtEnemy
struct AwBotVehicleController_TimedFireWeaponAtEnemy_Params
{
};

// Function WGame.wBotVehicleController.WaitForMover
struct AwBotVehicleController_WaitForMover_Params
{
	class AMover*                                      M;                                                        // (Parm)
};

// Function WGame.wBotVehicleController.SetCombatTimer
struct AwBotVehicleController_SetCombatTimer_Params
{
};

// Function WGame.wBotVehicleController.FearThisSpot
struct AwBotVehicleController_FearThisSpot_Params
{
	class AAvoidMarker*                                aSpot;                                                    // (Parm)
};

// Function WGame.wBotVehicleController.PostBeginPlay
struct AwBotVehicleController_PostBeginPlay_Params
{
};

// Function WGame.wPawnSoundGroup.GetEquipHitSound
struct UwPawnSoundGroup_GetEquipHitSound_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPawnSoundGroup.GetBreathSound
struct UwPawnSoundGroup_GetBreathSound_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPawnSoundGroup.GetSound
struct UwPawnSoundGroup_GetSound_Params
{
	TEnumAsByte<ESoundType>                            soundType;                                                // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPawnSoundGroup.GetLandedSound3d
struct UwPawnSoundGroup_GetLandedSound3d_Params
{
	int                                                SurfType;                                                 // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPawnSoundGroup.GetLandedSound2D
struct UwPawnSoundGroup_GetLandedSound2D_Params
{
	int                                                SurfType;                                                 // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPawnSoundGroup.GetDeathSound
struct UwPawnSoundGroup_GetDeathSound_Params
{
	class USound*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPawnSoundGroup.GetHitSound
struct UwPawnSoundGroup_GetHitSound_Params
{
	class USound*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Combo.Tick
struct ACombo_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.Combo.StopEffect
struct ACombo_StopEffect_Params
{
	class AwPawn*                                      P;                                                        // (Parm)
};

// Function WGame.Combo.StartEffect
struct ACombo_StartEffect_Params
{
	class AwPawn*                                      P;                                                        // (Parm)
};

// Function WGame.Combo.Destroyed
struct ACombo_Destroyed_Params
{
};

// Function WGame.Combo.AdrenalineEmpty
struct ACombo_AdrenalineEmpty_Params
{
};

// Function WGame.Combo.PostBeginPlay
struct ACombo_PostBeginPlay_Params
{
};

// Function WGame.wWeaponAttachment.MakeMeleeHitEffect
struct AwWeaponAttachment_MakeMeleeHitEffect_Params
{
};

// Function WGame.wWeaponAttachment.Timer
struct AwWeaponAttachment_Timer_Params
{
};

// Function WGame.wWeaponAttachment.InitFor
struct AwWeaponAttachment_InitFor_Params
{
	class AInventory*                                  i;                                                        // (Parm)
};

// Function WGame.wWeaponAttachment.WeaponLight
struct AwWeaponAttachment_WeaponLight_Params
{
};

// Function WGame.wWeaponAttachment.GetTipLocation
struct AwWeaponAttachment_GetTipLocation_Params
{
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wWeaponAttachment.PostNetBeginPlay
struct AwWeaponAttachment_PostNetBeginPlay_Params
{
};

// Function WGame.wWeaponAttachment.ThirdPersonEffects
struct AwWeaponAttachment_ThirdPersonEffects_Params
{
};

// Function WGame.wWeaponAttachment.UpdateHit
struct AwWeaponAttachment_UpdateHit_Params
{
	class AActor*                                      HitActor;                                                 // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
	class UMaterial*                                   HitMaterial;                                              // (Parm)
};

// Function WGame.wWeaponAttachment.UpdatePenetrateHit
struct AwWeaponAttachment_UpdatePenetrateHit_Params
{
	class AActor*                                      mHitActor;                                                // (Parm)
	struct FVector                                     mHitLocation;                                             // (Parm)
	struct FVector                                     mHitNormal;                                               // (Parm)
	class UMaterial*                                   mHitMaterial;                                             // (Parm)
	int                                                mLastHitIdx;                                              // (Parm)
};

// Function WGame.wWeaponAttachment.Hide
struct AwWeaponAttachment_Hide_Params
{
	bool                                               NewbHidden;                                               // (Parm)
};

// Function WGame.wWeaponAttachment.GetHitInfo
struct AwWeaponAttachment_GetHitInfo_Params
{
	int                                                nIndex;                                                   // (Parm)
	int                                                i;                                                        // (Parm)
};

// Function WGame.wWeaponAttachment.MakeSpawnShell
struct AwWeaponAttachment_MakeSpawnShell_Params
{
	bool                                               bRechamber;                                               // (OptionalParm, Parm)
};

// Function WGame.wAIPawn.PlayLandedSound
struct AwAIPawn_PlayLandedSound_Params
{
	int                                                SurfType;                                                 // (Parm)
};

// Function WGame.wAIPawn.CheckEntryVehicle
struct AwAIPawn_CheckEntryVehicle_Params
{
};

// Function WGame.wAIPawn.Tick
struct AwAIPawn_Tick_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wAIPawn.UpdateCannotFindPath
struct AwAIPawn_UpdateCannotFindPath_Params
{
};

// Function WGame.wAIPawn.LogCannotFindPath
struct AwAIPawn_LogCannotFindPath_Params
{
	class AActor*                                      Dest;                                                     // (Parm)
};

// Function WGame.wAIPawn.SetCannotFIndPath
struct AwAIPawn_SetCannotFIndPath_Params
{
	class AActor*                                      Dest;                                                     // (Parm)
};

// Function WGame.wAIPawn.NotifyAddDefaultInventory
struct AwAIPawn_NotifyAddDefaultInventory_Params
{
};

// Function WGame.wAIPawn.AddDefaultInventory
struct AwAIPawn_AddDefaultInventory_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WGame.wRosterEntry.InitBot
struct UwRosterEntry_InitBot_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function WGame.wRosterEntry.PrecacheRosterFor
struct UwRosterEntry_PrecacheRosterFor_Params
{
	class AUnrealTeamInfo*                             t;                                                        // (Parm)
};

// Function WGame.wRosterEntry.CreateRosterEntryCharacter
struct UwRosterEntry_CreateRosterEntryCharacter_Params
{
	struct FString                                     CharName;                                                 // (Parm, NeedCtorLink)
	class UwRosterEntry*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wRosterEntry.CreateRosterEntry
struct UwRosterEntry_CreateRosterEntry_Params
{
	int                                                prIdx;                                                    // (Parm)
	class UwRosterEntry*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.SPECIES_Merc.GetRagSkelName
struct USPECIES_Merc_GetRagSkelName_Params
{
	struct FString                                     MeshName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wBot.Possess
struct AwBot_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wBot.SetPawnClass
struct AwBot_SetPawnClass_Params
{
	struct FString                                     inClass;                                                  // (Parm, NeedCtorLink)
	struct FString                                     InCharacter;                                              // (Parm, NeedCtorLink)
};

// Function WGame.wMonsterController.GameHasEnded
struct AwMonsterController_GameHasEnded_Params
{
};

// Function WGame.wMonsterController.Stopped
struct AwMonsterController_Stopped_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.IsHunting
struct AwMonsterController_IsHunting_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.IsStrafing
struct AwMonsterController_IsStrafing_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.DefendMelee
struct AwMonsterController_DefendMelee_Params
{
	float                                              dist;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.DoTacticalMove
struct AwMonsterController_DoTacticalMove_Params
{
};

// Function WGame.wMonsterController.DoCharge
struct AwMonsterController_DoCharge_Params
{
};

// Function WGame.wMonsterController.DoStakeOut
struct AwMonsterController_DoStakeOut_Params
{
};

// Function WGame.wMonsterController.Celebrate
struct AwMonsterController_Celebrate_Params
{
};

// Function WGame.wMonsterController.Formation
struct AwMonsterController_Formation_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.damageAttitudeTo
struct AwMonsterController_damageAttitudeTo_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	float                                              Damage;                                                   // (Parm)
};

// Function WGame.wMonsterController.Desireability
struct AwMonsterController_Desireability_Params
{
	class APickup*                                     P;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.WanderOrCamp
struct AwMonsterController_WanderOrCamp_Params
{
	bool                                               bMayCrouch;                                               // (Parm)
};

// Function WGame.wMonsterController.FaceActor
struct AwMonsterController_FaceActor_Params
{
	float                                              StrafingModifier;                                         // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.ShouldStrafeTo
struct AwMonsterController_ShouldStrafeTo_Params
{
	class AActor*                                      WayPoint;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.FaceMoveTarget
struct AwMonsterController_FaceMoveTarget_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.NotifyKilled
struct AwMonsterController_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function WGame.wMonsterController.TryToDuck
struct AwMonsterController_TryToDuck_Params
{
	struct FVector                                     duckDir;                                                  // (Parm)
	bool                                               bReversed;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.ReceiveWarning
struct AwMonsterController_ReceiveWarning_Params
{
	class APawn*                                       shooter;                                                  // (Parm)
	float                                              projSpeed;                                                // (Parm)
	struct FVector                                     FireDir;                                                  // (Parm)
};

// Function WGame.wMonsterController.AdjustAim
struct AwMonsterController_AdjustAim_Params
{
	struct FFireProperties                             FiredAmmunition;                                          // (Parm)
	struct FVector                                     projStart;                                                // (Parm)
	int                                                AimError;                                                 // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.AdjustAimError
struct AwMonsterController_AdjustAimError_Params
{
	float                                              AimError;                                                 // (Parm)
	float                                              TargetDist;                                               // (Parm)
	bool                                               bDefendMelee;                                             // (Parm)
	bool                                               bInstantProj;                                             // (Parm)
	bool                                               bLeadTargetNow;                                           // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.CheckFutureSight
struct AwMonsterController_CheckFutureSight_Params
{
	float                                              DeltaTime;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.NearWall
struct AwMonsterController_NearWall_Params
{
	float                                              walldist;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.NeedToTurn
struct AwMonsterController_NeedToTurn_Params
{
	struct FVector                                     targ;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.FindBestPathToward
struct AwMonsterController_FindBestPathToward_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               bCheckedReach;                                            // (Parm)
	bool                                               bAllowDetour;                                             // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.NotifyLanded
struct AwMonsterController_NotifyLanded_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.SetFall
struct AwMonsterController_SetFall_Params
{
};

// Function WGame.wMonsterController.NotifyBump
struct AwMonsterController_NotifyBump_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.DirectedWander
struct AwMonsterController_DirectedWander_Params
{
	struct FVector                                     WanderDir;                                                // (Parm)
};

// Function WGame.wMonsterController.AdjustAround
struct AwMonsterController_AdjustAround_Params
{
	class APawn*                                       Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.CancelCampFor
struct AwMonsterController_CancelCampFor_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WGame.wMonsterController.Restart
struct AwMonsterController_Restart_Params
{
};

// Function WGame.wMonsterController.TestDirection
struct AwMonsterController_TestDirection_Params
{
	struct FVector                                     Dir;                                                      // (Parm)
	struct FVector                                     pick;                                                     // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.FindRoamDest
struct AwMonsterController_FindRoamDest_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.SoakStop
struct AwMonsterController_SoakStop_Params
{
	struct FString                                     problem;                                                  // (Parm, NeedCtorLink)
};

// Function WGame.wMonsterController.ChooseAttackMode
struct AwMonsterController_ChooseAttackMode_Params
{
};

// Function WGame.wMonsterController.DoRangedAttackOn
struct AwMonsterController_DoRangedAttackOn_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wMonsterController.FightEnemy
struct AwMonsterController_FightEnemy_Params
{
	bool                                               bCanCharge;                                               // (Parm)
};

// Function WGame.wMonsterController.EnemyVisible
struct AwMonsterController_EnemyVisible_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.DoWaitForLanding
struct AwMonsterController_DoWaitForLanding_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.ExecuteWhatToDoNext
struct AwMonsterController_ExecuteWhatToDoNext_Params
{
};

// Function WGame.wMonsterController.GetEnemyName
struct AwMonsterController_GetEnemyName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wMonsterController.GetOldEnemyName
struct AwMonsterController_GetOldEnemyName_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wMonsterController.TryToWalk
struct AwMonsterController_TryToWalk_Params
{
};

// Function WGame.wMonsterController.WhatToDoNext
struct AwMonsterController_WhatToDoNext_Params
{
	unsigned char                                      CallingByte;                                              // (Parm)
};

// Function WGame.wMonsterController.SetPeripheralVision
struct AwMonsterController_SetPeripheralVision_Params
{
};

// Function WGame.wMonsterController.SetMaxDesiredSpeed
struct AwMonsterController_SetMaxDesiredSpeed_Params
{
};

// Function WGame.wMonsterController.ResetSkill
struct AwMonsterController_ResetSkill_Params
{
};

// Function WGame.wMonsterController.InitializeSkill
struct AwMonsterController_InitializeSkill_Params
{
	float                                              InSkill;                                                  // (Parm)
};

// Function WGame.wMonsterController.Possess
struct AwMonsterController_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wMonsterController.NotifyMissedJump
struct AwMonsterController_NotifyMissedJump_Params
{
};

// Function WGame.wMonsterController.NotifyPhysicsVolumeChange
struct AwMonsterController_NotifyPhysicsVolumeChange_Params
{
	class APhysicsVolume*                              NewVolume;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.StrafeFromDamage
struct AwMonsterController_StrafeFromDamage_Params
{
	float                                              Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	bool                                               bFindDest;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.EnemyChanged
struct AwMonsterController_EnemyChanged_Params
{
	bool                                               bNewEnemyVisible;                                         // (Parm)
};

// Function WGame.wMonsterController.SetEnemyInfo
struct AwMonsterController_SetEnemyInfo_Params
{
	bool                                               bNewEnemyVisible;                                         // (Parm)
};

// Function WGame.wMonsterController.Trigger
struct AwMonsterController_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function WGame.wMonsterController.CheckIfShouldCrouch
struct AwMonsterController_CheckIfShouldCrouch_Params
{
	struct FVector                                     StartPosition;                                            // (Parm)
	struct FVector                                     TargetPosition;                                           // (Parm)
	float                                              Probability;                                              // (Parm)
};

// Function WGame.wMonsterController.ClearShot
struct AwMonsterController_ClearShot_Params
{
	struct FVector                                     TargetLoc;                                                // (Parm)
	bool                                               bImmediateFire;                                           // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.SeePlayer
struct AwMonsterController_SeePlayer_Params
{
	class APawn*                                       SeenPlayer;                                               // (Parm)
};

// Function WGame.wMonsterController.HearNoise
struct AwMonsterController_HearNoise_Params
{
	float                                              Loudness;                                                 // (Parm)
	class AActor*                                      NoiseMaker;                                               // (Parm)
};

// Function WGame.wMonsterController.SetEnemy
struct AwMonsterController_SetEnemy_Params
{
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               bHateMonster;                                             // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.ChangeEnemy
struct AwMonsterController_ChangeEnemy_Params
{
	class APawn*                                       NewEnemy;                                                 // (Parm)
	bool                                               bCanSeeNewEnemy;                                          // (Parm)
};

// Function WGame.wMonsterController.FindNewEnemy
struct AwMonsterController_FindNewEnemy_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.DisplayDebug
struct AwMonsterController_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wMonsterController.StopFiring
struct AwMonsterController_StopFiring_Params
{
};

// Function WGame.wMonsterController.CanAttack
struct AwMonsterController_CanAttack_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.FireWeaponAt
struct AwMonsterController_FireWeaponAt_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wMonsterController.TimedFireWeaponAtEnemy
struct AwMonsterController_TimedFireWeaponAtEnemy_Params
{
};

// Function WGame.wMonsterController.WaitForMover
struct AwMonsterController_WaitForMover_Params
{
	class AMover*                                      M;                                                        // (Parm)
};

// Function WGame.wMonsterController.SetCombatTimer
struct AwMonsterController_SetCombatTimer_Params
{
};

// Function WGame.wMonsterController.FearThisSpot
struct AwMonsterController_FearThisSpot_Params
{
	class AAvoidMarker*                                aSpot;                                                    // (Parm)
};

// Function WGame.wMonsterController.PostBeginPlay
struct AwMonsterController_PostBeginPlay_Params
{
};

// Function WGame.wDefenceBossController.FindRandEnemy
struct AwDefenceBossController_FindRandEnemy_Params
{
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBossController.FightEnemy
struct AwDefenceBossController_FightEnemy_Params
{
	bool                                               bCanCharge;                                               // (Parm)
};

// Function WGame.wDefenceBossController.WanderOrCamp
struct AwDefenceBossController_WanderOrCamp_Params
{
	bool                                               bMayCrouch;                                               // (Parm)
};

// Function WGame.wDefenceBossController.TimedFireWeaponAtTarget
struct AwDefenceBossController_TimedFireWeaponAtTarget_Params
{
};

// Function WGame.wDefenceBossController.DoCharge
struct AwDefenceBossController_DoCharge_Params
{
};

// Function WGame.wDefenceBossController.GetTeamNum
struct AwDefenceBossController_GetTeamNum_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wDefenceBossController.InitBot
struct AwDefenceBossController_InitBot_Params
{
	int                                                Grade;                                                    // (Parm)
};

// Function WGame.wDefenceBossController.ResetSkill
struct AwDefenceBossController_ResetSkill_Params
{
};

// Function WGame.wDefenceBossController.OnBeginRound
struct AwDefenceBossController_OnBeginRound_Params
{
};

// Function WGame.wSeekingRocket.PostBeginPlay
struct AwSeekingRocket_PostBeginPlay_Params
{
};

// Function WGame.wSeekingRocket.Timer
struct AwSeekingRocket_Timer_Params
{
};

// Function WGame.wAction.ClearReferences
struct UwAction_ClearReferences_Params
{
};

// Function WGame.wAction.WriteFutureState
struct UwAction_WriteFutureState_Params
{
	class UwFutureState*                               fs;                                                       // (Parm, OutParm)
};

// Function WGame.wAction.Sim_PostEffect
struct UwAction_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction.Sim_PreEffect
struct UwAction_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction.Sim_GetTime
struct UwAction_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction.CheckRequirement
struct UwAction_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction.GetGoal
struct UwAction_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wActionContainer.ToString
struct UwActionContainer_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wActionContainer.FreeActionContainers
struct UwActionContainer_FreeActionContainers_Params
{
};

// Function WGame.wActionContainer.FreeActions
struct UwActionContainer_FreeActions_Params
{
};

// Function WGame.wActionContainer.FreeAll
struct UwActionContainer_FreeAll_Params
{
};

// Function WGame.wActionContainer.WriteFutureState
struct UwActionContainer_WriteFutureState_Params
{
	class UwFutureState*                               fs;                                                       // (Parm, OutParm)
};

// Function WGame.wActionContainer.Includes
struct UwActionContainer_Includes_Params
{
	class UwAction*                                    testAction;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wActionContainer.AddSubContainer
struct UwActionContainer_AddSubContainer_Params
{
	class UwAction*                                    inAction;                                                 // (Parm)
	class UwActionContainer*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wActionContainer.ClearReferences
struct UwActionContainer_ClearReferences_Params
{
};

// Function WGame.wActionContainer.Init
struct UwActionContainer_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UwActionContainer*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal.SetFocus
struct UGoal_SetFocus_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal.SetFocusValue
struct UGoal_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal.SetFocusValueToTarget
struct UGoal_SetFocusValueToTarget_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal.ToString
struct UGoal_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal.DisplayDebug
struct UGoal_DisplayDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Level;                                                    // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.Goal.HandleMessage
struct UGoal_HandleMessage_Params
{
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
};

// Function WGame.Goal.End
struct UGoal_End_Params
{
};

// Function WGame.Goal.ProcessSubGoals
struct UGoal_ProcessSubGoals_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal.ActualWork
struct UGoal_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal.Process
struct UGoal_Process_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal.StartIfNotStarted
struct UGoal_StartIfNotStarted_Params
{
};

// Function WGame.Goal.Start
struct UGoal_Start_Params
{
};

// Function WGame.Goal.ClearSubgoals
struct UGoal_ClearSubgoals_Params
{
	bool                                               free;                                                     // (OptionalParm, Parm)
};

// Function WGame.Goal.AddSubgoal
struct UGoal_AddSubgoal_Params
{
	class UGoal*                                       inGoal;                                                   // (Parm)
};

// Function WGame.Goal.NotifyDestroyed
struct UGoal_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal.ClearReferences
struct UGoal_ClearReferences_Params
{
};

// Function WGame.Goal.InitBase
struct UGoal_InitBase_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
};

// Function WGame.wPlanMaster._request
struct UwPlanMaster__request_Params
{
	int                                                i;                                                        // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlanMaster.RequestItr
struct UwPlanMaster_RequestItr_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlanMaster.RequestUpdateItr
struct UwPlanMaster_RequestUpdateItr_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlanMaster.Update
struct UwPlanMaster_Update_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wPlanMaster.Create
struct UwPlanMaster_Create_Params
{
	class AwAILevel*                                   inLevel;                                                  // (Parm)
	class UwPlanMaster*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.StartDeRes
struct AwBotVehicle_StartDeRes_Params
{
};

// Function WGame.wBotVehicle.CreateGib
struct AwBotVehicle_CreateGib_Params
{
	struct FName                                       BoneName;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FRotator                                    R;                                                        // (Parm)
};

// Function WGame.wBotVehicle.SetAnimAction
struct AwBotVehicle_SetAnimAction_Params
{
	struct FName                                       NewAction;                                                // (Parm)
};

// Function WGame.wBotVehicle.PlayVictoryAnimation
struct AwBotVehicle_PlayVictoryAnimation_Params
{
};

// Function WGame.wBotVehicle.MeleeDamageTarget
struct AwBotVehicle_MeleeDamageTarget_Params
{
	int                                                hitdamage;                                                // (Parm)
	struct FVector                                     pushdir;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.PlayDyingSound
struct AwBotVehicle_PlayDyingSound_Params
{
};

// Function WGame.wBotVehicle.PlayDying
struct AwBotVehicle_PlayDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wBotVehicle.PlayTakeHit
struct AwBotVehicle_PlayTakeHit_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
};

// Function WGame.wBotVehicle.IsPlayerPawn
struct AwBotVehicle_IsPlayerPawn_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.SetMovementPhysics
struct AwBotVehicle_SetMovementPhysics_Params
{
};

// Function WGame.wBotVehicle.AnimEnd
struct AwBotVehicle_AnimEnd_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WGame.wBotVehicle.PlayVictory
struct AwBotVehicle_PlayVictory_Params
{
};

// Function WGame.wBotVehicle.Destroyed
struct AwBotVehicle_Destroyed_Params
{
};

// Function WGame.wBotVehicle.PlayChallengeSound
struct AwBotVehicle_PlayChallengeSound_Params
{
};

// Function WGame.wBotVehicle.AssignInitialPose
struct AwBotVehicle_AssignInitialPose_Params
{
};

// Function WGame.wBotVehicle.SameSpeciesAs
struct AwBotVehicle_SameSpeciesAs_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.LandThump
struct AwBotVehicle_LandThump_Params
{
};

// Function WGame.wBotVehicle.SpawnGiblet
struct AwBotVehicle_SpawnGiblet_Params
{
	class UClass*                                      GibClass;                                                 // (Parm)
	struct FVector                                     Location;                                                 // (Parm)
	struct FRotator                                    Rotation;                                                 // (Parm)
	float                                              GibPerterbation;                                          // (Parm)
	struct FVector                                     GibVelocity;                                              // (Parm)
};

// Function WGame.wBotVehicle.PostBeginPlay
struct AwBotVehicle_PostBeginPlay_Params
{
};

// Function WGame.wBotVehicle.FireProjectile
struct AwBotVehicle_FireProjectile_Params
{
};

// Function WGame.wBotVehicle.GetFireStart
struct AwBotVehicle_GetFireStart_Params
{
	struct FVector                                     X;                                                        // (Parm)
	struct FVector                                     Y;                                                        // (Parm)
	struct FVector                                     Z;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.RangedAttackTime
struct AwBotVehicle_RangedAttackTime_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.HasRangedAttack
struct AwBotVehicle_HasRangedAttack_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.PreferMelee
struct AwBotVehicle_PreferMelee_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.Fire
struct AwBotVehicle_Fire_Params
{
	float                                              f;                                                        // (OptionalParm, Parm)
};

// Function WGame.wBotVehicle.IsHeadShot
struct AwBotVehicle_IsHeadShot_Params
{
	struct FVector                                     loc;                                                      // (Parm)
	struct FVector                                     ray;                                                      // (Parm)
	float                                              AdditionalScale;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.ForceDefaultCharacter
struct AwBotVehicle_ForceDefaultCharacter_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.TurnOff
struct AwBotVehicle_TurnOff_Params
{
};

// Function WGame.wBotVehicle.RecommendSplashDamage
struct AwBotVehicle_RecommendSplashDamage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.GetDamageRadius
struct AwBotVehicle_GetDamageRadius_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.SplashDamage
struct AwBotVehicle_SplashDamage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.StopFiring
struct AwBotVehicle_StopFiring_Params
{
};

// Function WGame.wBotVehicle.CanAttack
struct AwBotVehicle_CanAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBotVehicle.RangedAttack
struct AwBotVehicle_RangedAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wSentryGunPawn.Destroyed
struct AwSentryGunPawn_Destroyed_Params
{
};

// Function WGame.wSentryGunPawn.PostBeginPlay
struct AwSentryGunPawn_PostBeginPlay_Params
{
};

// Function WGame.wHelicopter.SpawnHeli
struct AwHelicopter_SpawnHeli_Params
{
	class ALevelInfo*                                  Level;                                                    // (Parm)
	class AwHelicopter*                                lastHeli;                                                 // (Parm)
	class AController*                                 Caller;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopter.GetFlyingPathNode
struct AwHelicopter_GetFlyingPathNode_Params
{
	class ALevelInfo*                                  Level;                                                    // (Parm)
	int                                                idx;                                                      // (Parm)
	int                                                RegenLoc;                                                 // (OptionalParm, Parm)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopter.GetBloodHitClass
struct AwHelicopter_GetBloodHitClass_Params
{
	bool                                               bHeadShot;                                                // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopter.deleOnReachedDestination
struct AwHelicopter_deleOnReachedDestination_Params
{
	struct FVector                                     Dir;                                                      // (Parm)
	class AActor*                                      GoalActor;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopter.GetWeaponBoneFor
struct AwHelicopter_GetWeaponBoneFor_Params
{
	class AInventory*                                  i;                                                        // (Parm)
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopter.PoundDamageTarget
struct AwHelicopter_PoundDamageTarget_Params
{
};

// Function WGame.wHelicopter.PunchDamageTarget
struct AwHelicopter_PunchDamageTarget_Params
{
};

// Function WGame.wHelicopter.GetFireStart
struct AwHelicopter_GetFireStart_Params
{
	struct FVector                                     X;                                                        // (Parm)
	struct FVector                                     Y;                                                        // (Parm)
	struct FVector                                     Z;                                                        // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopter.SpawnBelch
struct AwHelicopter_SpawnBelch_Params
{
};

// Function WGame.wHelicopter.PlayVictory
struct AwHelicopter_PlayVictory_Params
{
};

// Function WGame.wHelicopter.PlayDirectionalHit
struct AwHelicopter_PlayDirectionalHit_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
	bool                                               bUseHitStun;                                              // (OptionalParm, Parm)
	bool                                               bGoreChange;                                              // (OptionalParm, Parm)
};

// Function WGame.wHelicopter.PlayDirectionalDeath
struct AwHelicopter_PlayDirectionalDeath_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
};

// Function WGame.wHelicopter.Falling
struct AwHelicopter_Falling_Params
{
};

// Function WGame.wHelicopter.SetMovementPhysics
struct AwHelicopter_SetMovementPhysics_Params
{
};

// Function WGame.wHelicopter.Dodge
struct AwHelicopter_Dodge_Params
{
	TEnumAsByte<EDoubleClickDir>                       DoubleClickMove;                                          // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopter.RangedAttack
struct AwHelicopter_RangedAttack_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wHelicopter.PostBeginPlay
struct AwHelicopter_PostBeginPlay_Params
{
};

// Function WGame.wHelicopter.ClientPlayStaySound
struct AwHelicopter_ClientPlayStaySound_Params
{
};

// Function WGame.wHelicopter.ClientPlayMoveSound
struct AwHelicopter_ClientPlayMoveSound_Params
{
};

// Function WGame.wHelicopter.ClientStopAllHeliSound
struct AwHelicopter_ClientStopAllHeliSound_Params
{
};

// Function WGame.wHelicopter.StopAllHeliSound
struct AwHelicopter_StopAllHeliSound_Params
{
};

// Function WGame.wHelicopter.HeliExplosionWhenDestroyed
struct AwHelicopter_HeliExplosionWhenDestroyed_Params
{
};

// Function WGame.wHelicopter.Destroyed
struct AwHelicopter_Destroyed_Params
{
};

// Function WGame.wHelicopter.RemoveLevelHelicopter
struct AwHelicopter_RemoveLevelHelicopter_Params
{
};

// Function WGame.ComboMessage.ClientReceive
struct AComboMessage_ClientReceive_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function WGame.ComboMessage.GetString
struct AComboMessage_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wPlayerReplicationInfo.GetPortrait
struct AwPlayerReplicationInfo_GetPortrait_Params
{
	class UMaterial*                                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPlayerReplicationInfo.UpdateCharacter
struct AwPlayerReplicationInfo_UpdateCharacter_Params
{
};

// Function WGame.wPlayerReplicationInfo.SetCharacterName
struct AwPlayerReplicationInfo_SetCharacterName_Params
{
	struct FString                                     S;                                                        // (Parm, NeedCtorLink)
};

// Function WGame.wPlayerReplicationInfo.UpdatePrecacheMaterials
struct AwPlayerReplicationInfo_UpdatePrecacheMaterials_Params
{
};

// Function WGame.PlayerRecordClass.FillPlayerRecord
struct UPlayerRecordClass_FillPlayerRecord_Params
{
	struct FPlayerRecord                               ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wAIBot.Possess
struct AwAIBot_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wAIBot.SetPawnClass
struct AwAIBot_SetPawnClass_Params
{
	struct FString                                     inClass;                                                  // (Parm, NeedCtorLink)
	struct FString                                     InCharacter;                                              // (Parm, NeedCtorLink)
};

// Function WGame.wSeekingRocket_Nemesis.wLoadOut_SetStaticMesh
struct AwSeekingRocket_Nemesis_wLoadOut_SetStaticMesh_Params
{
	class UStaticMesh*                                 stMesh;                                                   // (Parm)
};

// Function WGame.wSeekingRocket_Nemesis.TakeDamage
struct AwSeekingRocket_Nemesis_TakeDamage_Params
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

// Function WGame.wSeekingRocket_Nemesis.SetSpawnEmitter
struct AwSeekingRocket_Nemesis_SetSpawnEmitter_Params
{
};

// Function WGame.wSeekingRocket_Nemesis.SetSpeed
struct AwSeekingRocket_Nemesis_SetSpeed_Params
{
	float                                              fSpeed;                                                   // (Parm)
};

// Function WGame.wSeekingRocket_Nemesis.Timer
struct AwSeekingRocket_Nemesis_Timer_Params
{
};

// Function WGame.wSeekingRocket_Nemesis.HurtRadius
struct AwSeekingRocket_Nemesis_HurtRadius_Params
{
	float                                              DamageAmount;                                             // (Parm)
	float                                              DamageRadius;                                             // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	float                                              Momentum;                                                 // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.wSeekingRocket_Nemesis.Touch
struct AwSeekingRocket_Nemesis_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WGame.wSeekingIncenRocket_Nemesis.Explode
struct AwSeekingIncenRocket_Nemesis_Explode_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WGame.wSeekingIncenRocket_Nemesis.SplashGrenades
struct AwSeekingIncenRocket_Nemesis_SplashGrenades_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.wIncendiaryRocket.Explode
struct AwIncendiaryRocket_Explode_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WGame.wIncendiaryRocket.Destroyed
struct AwIncendiaryRocket_Destroyed_Params
{
};

// Function WGame.wIncendiaryRocket.SpawnTrail
struct AwIncendiaryRocket_SpawnTrail_Params
{
};

// Function WGame.wIncendiaryRocket.SetSpawnEmitter
struct AwIncendiaryRocket_SetSpawnEmitter_Params
{
};

// Function WGame.wIncendiaryRocket.SplashGrenades
struct AwIncendiaryRocket_SplashGrenades_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.wIncendiaryRocket.HurtRadius
struct AwIncendiaryRocket_HurtRadius_Params
{
	float                                              DamageAmount;                                             // (Parm)
	float                                              DamageRadius;                                             // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	float                                              Momentum;                                                 // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.Goal_PlanAndExec.ToString
struct UGoal_PlanAndExec_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_PlanAndExec.HandleMessage
struct UGoal_PlanAndExec_HandleMessage_Params
{
	struct FString                                     Msg;                                                      // (Parm, NeedCtorLink)
};

// Function WGame.Goal_PlanAndExec.ActualWork
struct UGoal_PlanAndExec_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_PlanAndExec.Start
struct UGoal_PlanAndExec_Start_Params
{
};

// Function WGame.Goal_PlanAndExec.LogFlag
struct UGoal_PlanAndExec_LogFlag_Params
{
};

// Function WGame.Goal_PlanAndExec.LogPlan
struct UGoal_PlanAndExec_LogPlan_Params
{
	int                                                tries;                                                    // (Parm)
	float                                              planScore;                                                // (Parm)
	class UwActionContainer*                           Plan;                                                     // (Parm, OutParm)
};

// Function WGame.Goal_PlanAndExec.LookForBetterPlan
struct UGoal_PlanAndExec_LookForBetterPlan_Params
{
	int                                                tries;                                                    // (Parm)
};

// Function WGame.Goal_PlanAndExec.Replan
struct UGoal_PlanAndExec_Replan_Params
{
};

// Function WGame.Goal_PlanAndExec.DecidePurposeToActivate
struct UGoal_PlanAndExec_DecidePurposeToActivate_Params
{
};

// Function WGame.Goal_PlanAndExec.InitPurposes
struct UGoal_PlanAndExec_InitPurposes_Params
{
};

// Function WGame.Goal_PlanAndExec.ClearReferences
struct UGoal_PlanAndExec_ClearReferences_Params
{
};

// Function WGame.Goal_PlanAndExec.Init
struct UGoal_PlanAndExec_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UwActionPlanner*                             inPlaner;                                                 // (Parm)
	class UGoal_PlanAndExec*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Fire.ToString
struct UGoal_Fire_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Fire.End
struct UGoal_Fire_End_Params
{
};

// Function WGame.Goal_Fire.ActualWork
struct UGoal_Fire_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Fire.Start
struct UGoal_Fire_Start_Params
{
};

// Function WGame.Goal_Fire.SetFocusValue
struct UGoal_Fire_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Fire.NotifyDestroyed
struct UGoal_Fire_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_Fire.ClearReferences
struct UGoal_Fire_ClearReferences_Params
{
};

// Function WGame.Goal_Fire.Init
struct UGoal_Fire_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class AActor*                                      inTarget;                                                 // (Parm)
	bool                                               inDoAim;                                                  // (Parm)
	int                                                inFireCount;                                              // (Parm)
	class UGoal_Fire*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MovePathToward.NotifyDestroyed
struct UGoal_MovePathToward_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_MovePathToward.ToString
struct UGoal_MovePathToward_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_MovePathToward.AddGoalMoveToward
struct UGoal_MovePathToward_AddGoalMoveToward_Params
{
	int                                                stackLevel;                                               // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MovePathToward.ActualWork
struct UGoal_MovePathToward_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MovePathToward.Start
struct UGoal_MovePathToward_Start_Params
{
};

// Function WGame.Goal_MovePathToward.ClearReferences
struct UGoal_MovePathToward_ClearReferences_Params
{
};

// Function WGame.Goal_MovePathToward.Init
struct UGoal_MovePathToward_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class AActor*                                      inDestination;                                            // (Parm)
	float                                              inReachRadius;                                            // (OptionalParm, Parm)
	class UGoal_MovePathToward*                        ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Roam.ToString
struct UGoal_Roam_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Roam.AddGoalMovePathToward
struct UGoal_Roam_AddGoalMovePathToward_Params
{
};

// Function WGame.Goal_Roam.ActualWork
struct UGoal_Roam_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Roam.Start
struct UGoal_Roam_Start_Params
{
};

// Function WGame.Goal_Roam.Init
struct UGoal_Roam_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_Roam*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Shoot.ToString
struct UGoal_Shoot_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Shoot.ActualWork
struct UGoal_Shoot_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Shoot.Start
struct UGoal_Shoot_Start_Params
{
};

// Function WGame.Goal_Shoot.ClearReferences
struct UGoal_Shoot_ClearReferences_Params
{
};

// Function WGame.Goal_Shoot.Init
struct UGoal_Shoot_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class AActor*                                      inTarget;                                                 // (Parm)
	bool                                               inDoAim;                                                  // (Parm)
	class UGoal_Shoot*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Test.ToString
struct UGoal_Test_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Test.AddGoal
struct UGoal_Test_AddGoal_Params
{
};

// Function WGame.Goal_Test.GetReachableRandomTarget
struct UGoal_Test_GetReachableRandomTarget_Params
{
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Test.End
struct UGoal_Test_End_Params
{
};

// Function WGame.Goal_Test.ActualWork
struct UGoal_Test_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Test.Start
struct UGoal_Test_Start_Params
{
};

// Function WGame.Goal_Test.Init
struct UGoal_Test_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_Test*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPurposeExplore.GetActivationScore
struct UwPurposeExplore_GetActivationScore_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wPurposeExplore.Evaluate
struct UwPurposeExplore_Evaluate_Params
{
	class UwStateData*                                 S;                                                        // (Parm, OutParm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wActionPlanner.Plan
struct UwActionPlanner_Plan_Params
{
	class UwPurpose*                                   purpose;                                                  // (Parm)
	int                                                tries;                                                    // (Parm)
	float                                              bestPlanScore;                                            // (Parm, OutParm)
	class UwActionContainer*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wActionPlanner.SubPlan
struct UwActionPlanner_SubPlan_Params
{
	int                                                Layer;                                                    // (Parm)
	class UwActionContainer*                           acon;                                                     // (Parm, OutParm)
	class UwStateData*                                 S;                                                        // (Parm, OutParm)
	TArray<class UwActionLayer*>                       Actions;                                                  // (Parm, OutParm, NeedCtorLink)
	class UwPurpose*                                   purpose;                                                  // (Parm)
	float                                              parentActionTime;                                         // (Parm)
};

// Function WGame.wActionPlanner.GetActionCandidatesByLayer
struct UwActionPlanner_GetActionCandidatesByLayer_Params
{
	TArray<class UwAction*>                            rawActions;                                               // (Parm, OutParm, NeedCtorLink)
	TArray<class UwActionLayer*>                       actionsByLayer;                                           // (Parm, OutParm, NeedCtorLink)
};

// Function WGame.wActionPlanner.GetActionCandidates
struct UwActionPlanner_GetActionCandidates_Params
{
	TArray<class UwAction*>                            Actions;                                                  // (Parm, OutParm, NeedCtorLink)
};

// Function WGame.wActionPlanner.GetActionCandidates_Pick
struct UwActionPlanner_GetActionCandidates_Pick_Params
{
	TArray<class UwAction*>                            Actions;                                                  // (Parm, OutParm, NeedCtorLink)
};

// Function WGame.wActionPlanner.GetActionCandidates_SwitchWeapon
struct UwActionPlanner_GetActionCandidates_SwitchWeapon_Params
{
	TArray<class UwAction*>                            Actions;                                                  // (Parm, OutParm, NeedCtorLink)
};

// Function WGame.wActionPlanner.ClearReferences
struct UwActionPlanner_ClearReferences_Params
{
};

// Function WGame.wActionPlanner.Create
struct UwActionPlanner_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UwNPCActions*                                Actions;                                                  // (Parm)
	class UwActionPlanner*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wFutureState.Init
struct UwFutureState_Init_Params
{
};

// Function WGame.wFutureState.Create
struct UwFutureState_Create_Params
{
	class UwFutureState*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.TargetingSystem.ClearReferences
struct UTargetingSystem_ClearReferences_Params
{
};

// Function WGame.TargetingSystem.DisplayDebug
struct UTargetingSystem_DisplayDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.TargetingSystem.Update
struct UTargetingSystem_Update_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.TargetingSystem.GetTarget
struct UTargetingSystem_GetTarget_Params
{
	class UMemoryItem*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.TargetingSystem.InitEvaluator
struct UTargetingSystem_InitEvaluator_Params
{
};

// Function WGame.TargetingSystem.Create
struct UTargetingSystem_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UTargetingSystem*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.OnEndRound
struct AwHelicopterController_OnEndRound_Params
{
};

// Function WGame.wHelicopterController.PawnDied
struct AwHelicopterController_PawnDied_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wHelicopterController.ClientOnEndWaitingForStart
struct AwHelicopterController_ClientOnEndWaitingForStart_Params
{
};

// Function WGame.wHelicopterController.Disappear
struct AwHelicopterController_Disappear_Params
{
};

// Function WGame.wHelicopterController.ServerStopAllSoundByHeli
struct AwHelicopterController_ServerStopAllSoundByHeli_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wHelicopterController.PlayStaySound
struct AwHelicopterController_PlayStaySound_Params
{
};

// Function WGame.wHelicopterController.PlayMoveSound
struct AwHelicopterController_PlayMoveSound_Params
{
};

// Function WGame.wHelicopterController.Decelerate
struct AwHelicopterController_Decelerate_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wHelicopterController.Accelerate
struct AwHelicopterController_Accelerate_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wHelicopterController.GetEnemy
struct AwHelicopterController_GetEnemy_Params
{
	class APawn*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.GetDotAgainstGround
struct AwHelicopterController_GetDotAgainstGround_Params
{
	class APawn*                                       P;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.GetDot
struct AwHelicopterController_GetDot_Params
{
	class APawn*                                       P;                                                        // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.GetMomentousRandomDest
struct AwHelicopterController_GetMomentousRandomDest_Params
{
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.ProgressFlyingPathNode
struct AwHelicopterController_ProgressFlyingPathNode_Params
{
};

// Function WGame.wHelicopterController.GetNextFlyingPathNode
struct AwHelicopterController_GetNextFlyingPathNode_Params
{
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.Degree2Unreal
struct AwHelicopterController_Degree2Unreal_Params
{
	float                                              Angle;                                                    // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.GetSignedRandom
struct AwHelicopterController_GetSignedRandom_Params
{
	int                                                Min;                                                      // (Parm)
	int                                                Max;                                                      // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.AdjustAim
struct AwHelicopterController_AdjustAim_Params
{
	struct FFireProperties                             FiredAmmunition;                                          // (Parm)
	struct FVector                                     projStart;                                                // (Parm)
	int                                                AimError;                                                 // (Parm)
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.GetPRI
struct AwHelicopterController_GetPRI_Params
{
	class APlayerReplicationInfo*                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.GameHasEnded
struct AwHelicopterController_GameHasEnded_Params
{
};

// Function WGame.wHelicopterController.GetTeamNum
struct AwHelicopterController_GetTeamNum_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.GetHeli
struct AwHelicopterController_GetHeli_Params
{
	class AwHelicopter*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.NotifyKilled
struct AwHelicopterController_NotifyKilled_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
};

// Function WGame.wHelicopterController.Possess
struct AwHelicopterController_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wHelicopterController.DisplayDebug
struct AwHelicopterController_DisplayDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wHelicopterController.IncY
struct AwHelicopterController_IncY_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wHelicopterController.Rotator2String
struct AwHelicopterController_Rotator2String_Params
{
	struct FRotator                                    R;                                                        // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wHelicopterController.Vector2String
struct AwHelicopterController_Vector2String_Params
{
	struct FVector                                     V;                                                        // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.wHelicopterController.FireWeaponAt
struct AwHelicopterController_FireWeaponAt_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wHelicopterController.CancelCampFor
struct AwHelicopterController_CancelCampFor_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WGame.wAISentryGunController.GetViewRotation
struct AwAISentryGunController_GetViewRotation_Params
{
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAISentryGunController.IsFinishSpecificBoneRotate
struct AwAISentryGunController_IsFinishSpecificBoneRotate_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAISentryGunController.ExecuteWhatToDoNext
struct AwAISentryGunController_ExecuteWhatToDoNext_Params
{
};

// Function WGame.DECO_Barricade.EncroachingOn
struct ADECO_Barricade_EncroachingOn_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DECO_Barricade.EncroachedBy
struct ADECO_Barricade_EncroachedBy_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WGame.DECO_Barricade.Bump
struct ADECO_Barricade_Bump_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WGame.DECO_Barricade.Reset
struct ADECO_Barricade_Reset_Params
{
};

// Function WGame.DECO_Barricade.IsNearbyBarrel
struct ADECO_Barricade_IsNearbyBarrel_Params
{
	class AActor*                                      A;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DECO_Barricade.HurtRadius
struct ADECO_Barricade_HurtRadius_Params
{
	float                                              DamageAmount;                                             // (Parm)
	float                                              DamageRadius;                                             // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	float                                              Momentum;                                                 // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.DECO_Barricade.TimerPop
struct ADECO_Barricade_TimerPop_Params
{
	class AVolumeTimer*                                t;                                                        // (Parm)
};

// Function WGame.DECO_Barricade.CheckNearbyBarrels
struct ADECO_Barricade_CheckNearbyBarrels_Params
{
};

// Function WGame.DECO_Barricade.TakeDamage
struct ADECO_Barricade_TakeDamage_Params
{
	int                                                NDamage;                                                  // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function WGame.DECO_Barricade.SetDelayedDamageInstigatorController
struct ADECO_Barricade_SetDelayedDamageInstigatorController_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WGame.DECO_Barricade.PostNetBeginPlay
struct ADECO_Barricade_PostNetBeginPlay_Params
{
};

// Function WGame.DECO_Barricade.PostBeginPlay
struct ADECO_Barricade_PostBeginPlay_Params
{
};

// Function WGame.DECO_Barricade.TickDamage
struct ADECO_Barricade_TickDamage_Params
{
};

// Function WGame.DECO_Barricade.SetBurning
struct ADECO_Barricade_SetBurning_Params
{
	bool                                               bBurn;                                                    // (Parm)
	class AwProjectile*                                proj;                                                     // (Parm)
};

// Function WGame.DECO_Barricade.BaseChange
struct ADECO_Barricade_BaseChange_Params
{
};

// Function WGame.DECO_Barricade.PhysicsVolumeChange
struct ADECO_Barricade_PhysicsVolumeChange_Params
{
	class APhysicsVolume*                              NewVolume;                                                // (Parm)
};

// Function WGame.DECO_Barricade.HitWall
struct ADECO_Barricade_HitWall_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
	class AActor*                                      Wall;                                                     // (Parm)
	class UMaterial*                                   HitMaterial;                                              // (Parm)
};

// Function WGame.DECO_Barricade.Landed
struct ADECO_Barricade_Landed_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WGame.Goal_MoveToward.ToString
struct UGoal_MoveToward_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_MoveToward.NotifyDestroyed
struct UGoal_MoveToward_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_MoveToward.SetFocusValue
struct UGoal_MoveToward_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToward.ActualWork
struct UGoal_MoveToward_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToward.doSprint
struct UGoal_MoveToward_doSprint_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToward.Start
struct UGoal_MoveToward_Start_Params
{
};

// Function WGame.Goal_MoveToward.PassedCheckPoint
struct UGoal_MoveToward_PassedCheckPoint_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToward.ClearReferences
struct UGoal_MoveToward_ClearReferences_Params
{
};

// Function WGame.Goal_MoveToward.Init
struct UGoal_MoveToward_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class AActor*                                      inDestination;                                            // (Parm)
	class AActor*                                      inFocus;                                                  // (Parm)
	float                                              inReachRadius;                                            // (OptionalParm, Parm)
	bool                                               inSprint;                                                 // (OptionalParm, Parm)
	bool                                               inCrouch;                                                 // (OptionalParm, Parm)
	bool                                               inProne;                                                  // (OptionalParm, Parm)
	class UGoal_MoveToward*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE.Evaluate
struct UDAE_Evaluate_Params
{
	class UMemoryItem*                                 mi;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_Multiple.Evaluate
struct UDAE_Multiple_Evaluate_Params
{
	class UMemoryItem*                                 mi;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_Multiple.Add
struct UDAE_Multiple_Add_Params
{
	float                                              factor;                                                   // (Parm)
	class UDAE*                                        inDAE;                                                    // (Parm)
};

// Function WGame.DAE_Multiple.Create
struct UDAE_Multiple_Create_Params
{
	class UDAE_Multiple*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_InSight.Evaluate
struct UDAE_InSight_Evaluate_Params
{
	class UMemoryItem*                                 mi;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_InSight.Create
struct UDAE_InSight_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UDAE_InSight*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_Visibility.Evaluate
struct UDAE_Visibility_Evaluate_Params
{
	class UMemoryItem*                                 mi;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_Visibility.Create
struct UDAE_Visibility_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UDAE_Visibility*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_Proximity.Evaluate
struct UDAE_Proximity_Evaluate_Params
{
	class UMemoryItem*                                 mi;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_Proximity.Create
struct UDAE_Proximity_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	float                                              inMaxDistance;                                            // (Parm)
	class UDAE_Proximity*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_IsTurret.Evaluate
struct UDAE_IsTurret_Evaluate_Params
{
	class UMemoryItem*                                 mi;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_IsTurret.Create
struct UDAE_IsTurret_Create_Params
{
	class UDAE_IsTurret*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_RecentTarget.Evaluate
struct UDAE_RecentTarget_Evaluate_Params
{
	class UMemoryItem*                                 mi;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.DAE_RecentTarget.Create
struct UDAE_RecentTarget_Create_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	float                                              InTime;                                                   // (Parm)
	class UDAE_RecentTarget*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Empty.Sim_PostEffect
struct UwAction_Empty_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Empty.Sim_PreEffect
struct UwAction_Empty_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Empty.Sim_GetTime
struct UwAction_Empty_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Empty.CheckRequirement
struct UwAction_Empty_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Empty.Init
struct UwAction_Empty_Init_Params
{
	class UwAction_Empty*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wActionLayer.Init
struct UwActionLayer_Init_Params
{
	class UwActionLayer*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Fire.GetGoal
struct UwAction_Fire_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Fire.GetWeaponMultiplier
struct UwAction_Fire_GetWeaponMultiplier_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Fire.Sim_PostEffect
struct UwAction_Fire_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Fire.Sim_PreEffect
struct UwAction_Fire_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Fire.CalcDamage
struct UwAction_Fire_CalcDamage_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Fire.Sim_GetTime
struct UwAction_Fire_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Fire.CheckRequirement
struct UwAction_Fire_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Fire.Init
struct UwAction_Fire_Init_Params
{
	class UwAction_Fire*                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Reload.GetGoal
struct UwAction_Reload_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Reload.Sim_PostEffect
struct UwAction_Reload_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Reload.Sim_PreEffect
struct UwAction_Reload_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Reload.Sim_GetTime
struct UwAction_Reload_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Reload.CheckRequirement
struct UwAction_Reload_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Reload.Init
struct UwAction_Reload_Init_Params
{
	class UwAction_Reload*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Explore.GetGoal
struct UwAction_Explore_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Explore.CalcMeetNewEnemyProbability
struct UwAction_Explore_CalcMeetNewEnemyProbability_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Explore.Sim_PostEffect
struct UwAction_Explore_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Explore.Sim_PreEffect
struct UwAction_Explore_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_Explore.Sim_GetTime
struct UwAction_Explore_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Explore.CheckRequirement
struct UwAction_Explore_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_Explore.Init
struct UwAction_Explore_Init_Params
{
	class UwAction_Explore*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ExploreTutorial.CalcMeetNewEnemyProbability
struct UwAction_ExploreTutorial_CalcMeetNewEnemyProbability_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ExploreTutorial.CheckRequirement
struct UwAction_ExploreTutorial_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_IdleHands.GetGoal
struct UwAction_IdleHands_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_IdleHands.Sim_PostEffect
struct UwAction_IdleHands_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_IdleHands.Sim_PreEffect
struct UwAction_IdleHands_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_IdleHands.Sim_GetTime
struct UwAction_IdleHands_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_IdleHands.CheckRequirement
struct UwAction_IdleHands_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_IdleHands.Init
struct UwAction_IdleHands_Init_Params
{
	float                                              inIdleTime;                                               // (Parm)
	class UwAction_IdleHands*                          ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ApproachAndMelee.GetGoal
struct UwAction_ApproachAndMelee_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ApproachAndMelee.Sim_PostEffect
struct UwAction_ApproachAndMelee_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_ApproachAndMelee.Sim_PreEffect
struct UwAction_ApproachAndMelee_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_ApproachAndMelee.Sim_GetTime
struct UwAction_ApproachAndMelee_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ApproachAndMelee.CheckRequirement
struct UwAction_ApproachAndMelee_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ApproachAndMelee.Init
struct UwAction_ApproachAndMelee_Init_Params
{
	class UwAction_ApproachAndMelee*                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToEnemyInfluence.GetGoal
struct UwAction_MoveToEnemyInfluence_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToEnemyInfluence.Sim_PostEffect
struct UwAction_MoveToEnemyInfluence_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_MoveToEnemyInfluence.Sim_PreEffect
struct UwAction_MoveToEnemyInfluence_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_MoveToEnemyInfluence.Sim_GetTime
struct UwAction_MoveToEnemyInfluence_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToEnemyInfluence.CheckRequirement
struct UwAction_MoveToEnemyInfluence_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToEnemyInfluence.Init
struct UwAction_MoveToEnemyInfluence_Init_Params
{
	class UwAction_MoveToEnemyInfluence*               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToSeeTarget.GetGoal
struct UwAction_MoveToSeeTarget_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToSeeTarget.Sim_PostEffect
struct UwAction_MoveToSeeTarget_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_MoveToSeeTarget.Sim_PreEffect
struct UwAction_MoveToSeeTarget_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_MoveToSeeTarget.Sim_GetTime
struct UwAction_MoveToSeeTarget_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToSeeTarget.CheckRequirement
struct UwAction_MoveToSeeTarget_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MoveToSeeTarget.Init
struct UwAction_MoveToSeeTarget_Init_Params
{
	class UwAction_MoveToSeeTarget*                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_LookAround.GetGoal
struct UwAction_LookAround_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_LookAround.Sim_PostEffect
struct UwAction_LookAround_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_LookAround.Sim_PreEffect
struct UwAction_LookAround_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_LookAround.Sim_GetTime
struct UwAction_LookAround_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_LookAround.CheckRequirement
struct UwAction_LookAround_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_LookAround.Init
struct UwAction_LookAround_Init_Params
{
	float                                              inDuration;                                               // (Parm)
	class UwAction_LookAround*                         ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseHelicopter.GetGoal
struct UwAction_UseHelicopter_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseHelicopter.Sim_PostEffect
struct UwAction_UseHelicopter_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_UseHelicopter.Sim_PreEffect
struct UwAction_UseHelicopter_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_UseHelicopter.Sim_GetTime
struct UwAction_UseHelicopter_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseHelicopter.CheckRequirement
struct UwAction_UseHelicopter_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseHelicopter.Init
struct UwAction_UseHelicopter_Init_Params
{
	class UwAction_UseHelicopter*                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseAIrstrikeRealTime.GetGoal
struct UwAction_UseAIrstrikeRealTime_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseAIrstrikeRealTime.Sim_PostEffect
struct UwAction_UseAIrstrikeRealTime_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_UseAIrstrikeRealTime.Sim_PreEffect
struct UwAction_UseAIrstrikeRealTime_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_UseAIrstrikeRealTime.Sim_GetTime
struct UwAction_UseAIrstrikeRealTime_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseAIrstrikeRealTime.CheckRequirement
struct UwAction_UseAIrstrikeRealTime_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseAIrstrikeRealTime.Init
struct UwAction_UseAIrstrikeRealTime_Init_Params
{
	class UwAction_UseAIrstrikeRealTime*               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseUAV.GetGoal
struct UwAction_UseUAV_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseUAV.Sim_PostEffect
struct UwAction_UseUAV_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_UseUAV.Sim_PreEffect
struct UwAction_UseUAV_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_UseUAV.Sim_GetTime
struct UwAction_UseUAV_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseUAV.CheckRequirement
struct UwAction_UseUAV_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_UseUAV.Init
struct UwAction_UseUAV_Init_Params
{
	class UwAction_UseUAV*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MeleeNoTarget.GetGoal
struct UwAction_MeleeNoTarget_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MeleeNoTarget.Sim_PostEffect
struct UwAction_MeleeNoTarget_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_MeleeNoTarget.Sim_PreEffect
struct UwAction_MeleeNoTarget_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_MeleeNoTarget.Sim_GetTime
struct UwAction_MeleeNoTarget_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MeleeNoTarget.CheckRequirement
struct UwAction_MeleeNoTarget_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_MeleeNoTarget.Init
struct UwAction_MeleeNoTarget_Init_Params
{
	class UwAction_MeleeNoTarget*                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_AimSpecificParts.GetGoal
struct UwAction_AimSpecificParts_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_AimSpecificParts.Sim_PostEffect
struct UwAction_AimSpecificParts_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_AimSpecificParts.Sim_PreEffect
struct UwAction_AimSpecificParts_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_AimSpecificParts.Sim_GetTime
struct UwAction_AimSpecificParts_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_AimSpecificParts.CheckRequirement
struct UwAction_AimSpecificParts_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_AimSpecificParts.Init
struct UwAction_AimSpecificParts_Init_Params
{
	class UwAction_AimSpecificParts*                   ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_FireSpecialTarget.GetGoal
struct UwAction_FireSpecialTarget_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_FireSpecialTarget.CalcDamage
struct UwAction_FireSpecialTarget_CalcDamage_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_FireSpecialTarget.Sim_GetTime
struct UwAction_FireSpecialTarget_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_FireSpecialTarget.CheckRequirement
struct UwAction_FireSpecialTarget_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_FireSpecialTarget.NotifyDestroyed
struct UwAction_FireSpecialTarget_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wAction_FireSpecialTarget.Init2
struct UwAction_FireSpecialTarget_Init2_Params
{
	class AActor*                                      inTarget;                                                 // (Parm)
	float                                              inDmgFactor;                                              // (Parm)
	class UwAction_FireSpecialTarget*                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickTarget.GetGoal
struct UwAction_PickTarget_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickTarget.Sim_PostEffect
struct UwAction_PickTarget_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickTarget.Sim_PreEffect
struct UwAction_PickTarget_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickTarget.Sim_GetTime
struct UwAction_PickTarget_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickTarget.CheckRequirement
struct UwAction_PickTarget_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickTarget.ClearReferences
struct UwAction_PickTarget_ClearReferences_Params
{
};

// Function WGame.wAction_PickTarget.Init
struct UwAction_PickTarget_Init_Params
{
	class UMemoryItem*                                 inTarget;                                                 // (Parm)
	class UwAction_PickTarget*                         ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ThrowGrenadeRealTime.GetGoal
struct UwAction_ThrowGrenadeRealTime_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ThrowGrenadeRealTime.Sim_PostEffect
struct UwAction_ThrowGrenadeRealTime_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_ThrowGrenadeRealTime.Sim_PreEffect
struct UwAction_ThrowGrenadeRealTime_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_ThrowGrenadeRealTime.Sim_GetTime
struct UwAction_ThrowGrenadeRealTime_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ThrowGrenadeRealTime.CheckRequirement
struct UwAction_ThrowGrenadeRealTime_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_ThrowGrenadeRealTime.Init
struct UwAction_ThrowGrenadeRealTime_Init_Params
{
	class UwAction_ThrowGrenadeRealTime*               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHealth.NotifyDestroyed
struct UwAction_PickHealth_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wAction_PickHealth.GetGoal
struct UwAction_PickHealth_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHealth.Sim_PostEffect
struct UwAction_PickHealth_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickHealth.Sim_PreEffect
struct UwAction_PickHealth_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickHealth.Sim_GetTime
struct UwAction_PickHealth_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHealth.CheckRequirement
struct UwAction_PickHealth_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHealth.ClearReferences
struct UwAction_PickHealth_ClearReferences_Params
{
};

// Function WGame.wAction_PickHealth.Init
struct UwAction_PickHealth_Init_Params
{
	class APickup*                                     inPack;                                                   // (Parm)
	class UwAction_PickHealth*                         ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHelicopter.NotifyDestroyed
struct UwAction_PickHelicopter_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wAction_PickHelicopter.GetGoal
struct UwAction_PickHelicopter_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHelicopter.Sim_PostEffect
struct UwAction_PickHelicopter_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickHelicopter.Sim_PreEffect
struct UwAction_PickHelicopter_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickHelicopter.Sim_GetTime
struct UwAction_PickHelicopter_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHelicopter.CheckRequirement
struct UwAction_PickHelicopter_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickHelicopter.ClearReferences
struct UwAction_PickHelicopter_ClearReferences_Params
{
};

// Function WGame.wAction_PickHelicopter.Init
struct UwAction_PickHelicopter_Init_Params
{
	class APickup*                                     inPack;                                                   // (Parm)
	class UwAction_PickHelicopter*                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickAirstrike.NotifyDestroyed
struct UwAction_PickAirstrike_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wAction_PickAirstrike.GetGoal
struct UwAction_PickAirstrike_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickAirstrike.Sim_PostEffect
struct UwAction_PickAirstrike_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickAirstrike.Sim_PreEffect
struct UwAction_PickAirstrike_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickAirstrike.Sim_GetTime
struct UwAction_PickAirstrike_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickAirstrike.CheckRequirement
struct UwAction_PickAirstrike_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickAirstrike.ClearReferences
struct UwAction_PickAirstrike_ClearReferences_Params
{
};

// Function WGame.wAction_PickAirstrike.Init
struct UwAction_PickAirstrike_Init_Params
{
	class APickup*                                     inPack;                                                   // (Parm)
	class UwAction_PickAirstrike*                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickUAV.NotifyDestroyed
struct UwAction_PickUAV_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wAction_PickUAV.GetGoal
struct UwAction_PickUAV_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickUAV.Sim_PostEffect
struct UwAction_PickUAV_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickUAV.Sim_PreEffect
struct UwAction_PickUAV_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_PickUAV.Sim_GetTime
struct UwAction_PickUAV_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickUAV.CheckRequirement
struct UwAction_PickUAV_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_PickUAV.ClearReferences
struct UwAction_PickUAV_ClearReferences_Params
{
};

// Function WGame.wAction_PickUAV.Init
struct UwAction_PickUAV_Init_Params
{
	class APickup*                                     inPack;                                                   // (Parm)
	class UwAction_PickUAV*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_SwitchWeapon.GetGoal
struct UwAction_SwitchWeapon_GetGoal_Params
{
	class AwAIBotBase*                                 Owner;                                                    // (Parm)
	class UGoal*                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_SwitchWeapon.Sim_PostEffect
struct UwAction_SwitchWeapon_Sim_PostEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_SwitchWeapon.Sim_PreEffect
struct UwAction_SwitchWeapon_Sim_PreEffect_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
};

// Function WGame.wAction_SwitchWeapon.Sim_GetTime
struct UwAction_SwitchWeapon_Sim_GetTime_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_SwitchWeapon.CheckRequirement
struct UwAction_SwitchWeapon_CheckRequirement_Params
{
	class UwStateData*                                 ws;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAction_SwitchWeapon.NotifyDestroyed
struct UwAction_SwitchWeapon_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.wAction_SwitchWeapon.ClearReferences
struct UwAction_SwitchWeapon_ClearReferences_Params
{
};

// Function WGame.wAction_SwitchWeapon.Init
struct UwAction_SwitchWeapon_Init_Params
{
	class AwWeapon*                                    inWeapon;                                                 // (Parm)
	class UwAction_SwitchWeapon*                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPlan.ToString
struct UGoal_ExecPlan_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_ExecPlan.SetFocusValue
struct UGoal_ExecPlan_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPlan.End
struct UGoal_ExecPlan_End_Params
{
};

// Function WGame.Goal_ExecPlan.ActualWork
struct UGoal_ExecPlan_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPlan.GetProgress
struct UGoal_ExecPlan_GetProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPlan.InitSubGoals
struct UGoal_ExecPlan_InitSubGoals_Params
{
};

// Function WGame.Goal_ExecPlan.Start
struct UGoal_ExecPlan_Start_Params
{
};

// Function WGame.Goal_ExecPlan.ClearReferences
struct UGoal_ExecPlan_ClearReferences_Params
{
};

// Function WGame.Goal_ExecPlan.Init
struct UGoal_ExecPlan_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UwActionContainer*                           inPlan;                                                   // (Parm)
	class UGoal_ExecPlan*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Stay.ToString
struct UGoal_Stay_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Stay.ActualWork
struct UGoal_Stay_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Stay.Start
struct UGoal_Stay_Start_Params
{
};

// Function WGame.Goal_Stay.Init
struct UGoal_Stay_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	float                                              inStayLength;                                             // (Parm)
	class UGoal_Stay*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchWeapon.ToString
struct UGoal_SwitchWeapon_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_SwitchWeapon.SetFocusValue
struct UGoal_SwitchWeapon_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchWeapon.ActualWork
struct UGoal_SwitchWeapon_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchWeapon.Start
struct UGoal_SwitchWeapon_Start_Params
{
};

// Function WGame.Goal_SwitchWeapon.Init
struct UGoal_SwitchWeapon_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	unsigned char                                      InGroup;                                                  // (Parm)
	class UGoal_SwitchWeapon*                          ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Reload.ToString
struct UGoal_Reload_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Reload.SetFocusValue
struct UGoal_Reload_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Reload.ActualWork
struct UGoal_Reload_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Reload.NotifyDestroyed
struct UGoal_Reload_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_Reload.Start
struct UGoal_Reload_Start_Params
{
};

// Function WGame.Goal_Reload.ClearReferences
struct UGoal_Reload_ClearReferences_Params
{
};

// Function WGame.Goal_Reload.Init
struct UGoal_Reload_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_Reload*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPartialPlan.ToString
struct UGoal_ExecPartialPlan_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_ExecPartialPlan.DisplayDebug
struct UGoal_ExecPartialPlan_DisplayDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Level;                                                    // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.Goal_ExecPartialPlan.SetFocus
struct UGoal_ExecPartialPlan_SetFocus_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPartialPlan.ClearSubgoals
struct UGoal_ExecPartialPlan_ClearSubgoals_Params
{
	bool                                               free;                                                     // (OptionalParm, Parm)
};

// Function WGame.Goal_ExecPartialPlan.End
struct UGoal_ExecPartialPlan_End_Params
{
};

// Function WGame.Goal_ExecPartialPlan.ActualWork
struct UGoal_ExecPartialPlan_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPartialPlan.GetNextSubGoal
struct UGoal_ExecPartialPlan_GetNextSubGoal_Params
{
	class UGoal_ExecPartialPlan*                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPartialPlan.GetProgress
struct UGoal_ExecPartialPlan_GetProgress_Params
{
	float                                              Min;                                                      // (Parm)
	float                                              Size;                                                     // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ExecPartialPlan.Start
struct UGoal_ExecPartialPlan_Start_Params
{
};

// Function WGame.Goal_ExecPartialPlan.ClearReferences
struct UGoal_ExecPartialPlan_ClearReferences_Params
{
};

// Function WGame.Goal_ExecPartialPlan.Init
struct UGoal_ExecPartialPlan_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UwActionContainer*                           inPartialPlan;                                            // (Parm)
	class UGoal_ExecPartialPlan*                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToSeeTarget.ToString
struct UGoal_MoveToSeeTarget_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_MoveToSeeTarget.ActualWork
struct UGoal_MoveToSeeTarget_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToSeeTarget.Start
struct UGoal_MoveToSeeTarget_Start_Params
{
};

// Function WGame.Goal_MoveToSeeTarget.Init
struct UGoal_MoveToSeeTarget_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_MoveToSeeTarget*                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_PickTarget.ToString
struct UGoal_PickTarget_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_PickTarget.ActualWork
struct UGoal_PickTarget_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_PickTarget.Start
struct UGoal_PickTarget_Start_Params
{
};

// Function WGame.Goal_PickTarget.ClearReferences
struct UGoal_PickTarget_ClearReferences_Params
{
};

// Function WGame.Goal_PickTarget.Init
struct UGoal_PickTarget_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UMemoryItem*                                 inMI;                                                     // (Parm)
	class UGoal_PickTarget*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_AimSpecificParts.ToString
struct UGoal_AimSpecificParts_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_AimSpecificParts.End
struct UGoal_AimSpecificParts_End_Params
{
};

// Function WGame.Goal_AimSpecificParts.SetFocusValue
struct UGoal_AimSpecificParts_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_AimSpecificParts.ActualWork
struct UGoal_AimSpecificParts_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_AimSpecificParts.Start
struct UGoal_AimSpecificParts_Start_Params
{
};

// Function WGame.Goal_AimSpecificParts.Init
struct UGoal_AimSpecificParts_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_AimSpecificParts*                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ThrowGrenadeRealTime.ToString
struct UGoal_ThrowGrenadeRealTime_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_ThrowGrenadeRealTime.GetTarget
struct UGoal_ThrowGrenadeRealTime_GetTarget_Params
{
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ThrowGrenadeRealTime.ActualWork
struct UGoal_ThrowGrenadeRealTime_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ThrowGrenadeRealTime.Start
struct UGoal_ThrowGrenadeRealTime_Start_Params
{
};

// Function WGame.Goal_ThrowGrenadeRealTime.ClearReferences
struct UGoal_ThrowGrenadeRealTime_ClearReferences_Params
{
};

// Function WGame.Goal_ThrowGrenadeRealTime.Init
struct UGoal_ThrowGrenadeRealTime_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_ThrowGrenadeRealTime*                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchAndUse.ToString
struct UGoal_SwitchAndUse_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_SwitchAndUse.End
struct UGoal_SwitchAndUse_End_Params
{
};

// Function WGame.Goal_SwitchAndUse.ActualWork
struct UGoal_SwitchAndUse_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchAndUse.Start
struct UGoal_SwitchAndUse_Start_Params
{
};

// Function WGame.Goal_SwitchAndUse.Init
struct UGoal_SwitchAndUse_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	int                                                InGroup;                                                  // (Parm)
	class UGoal_SwitchAndUse*                          ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_LookAround.ToString
struct UGoal_LookAround_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_LookAround.End
struct UGoal_LookAround_End_Params
{
};

// Function WGame.Goal_LookAround.SetFocusValue
struct UGoal_LookAround_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_LookAround.NextFocusTarget
struct UGoal_LookAround_NextFocusTarget_Params
{
};

// Function WGame.Goal_LookAround.ActualWork
struct UGoal_LookAround_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_LookAround.Start
struct UGoal_LookAround_Start_Params
{
};

// Function WGame.Goal_LookAround.Init
struct UGoal_LookAround_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	float                                              inDuration;                                               // (Parm)
	class UGoal_LookAround*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MeleeNoTarget.ToString
struct UGoal_MeleeNoTarget_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_MeleeNoTarget.ActualWork
struct UGoal_MeleeNoTarget_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MeleeNoTarget.Start
struct UGoal_MeleeNoTarget_Start_Params
{
};

// Function WGame.Goal_MeleeNoTarget.NotifyDestroyed
struct UGoal_MeleeNoTarget_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_MeleeNoTarget.Init
struct UGoal_MeleeNoTarget_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	int                                                inMeleeCount;                                             // (Parm)
	class UGoal_MeleeNoTarget*                         ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToEnemyInfluence.ToString
struct UGoal_MoveToEnemyInfluence_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_MoveToEnemyInfluence.ActualWork
struct UGoal_MoveToEnemyInfluence_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_MoveToEnemyInfluence.Start
struct UGoal_MoveToEnemyInfluence_Start_Params
{
};

// Function WGame.Goal_MoveToEnemyInfluence.Init
struct UGoal_MoveToEnemyInfluence_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_MoveToEnemyInfluence*                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Fail.ToString
struct UGoal_Fail_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Fail.ActualWork
struct UGoal_Fail_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Fail.Start
struct UGoal_Fail_Start_Params
{
};

// Function WGame.Goal_Fail.Init
struct UGoal_Fail_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_Fail*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_UseAirstrikeRealTime.ToString
struct UGoal_UseAirstrikeRealTime_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_UseAirstrikeRealTime.GetTarget
struct UGoal_UseAirstrikeRealTime_GetTarget_Params
{
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_UseAirstrikeRealTime.ActualWork
struct UGoal_UseAirstrikeRealTime_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_UseAirstrikeRealTime.Start
struct UGoal_UseAirstrikeRealTime_Start_Params
{
};

// Function WGame.Goal_UseAirstrikeRealTime.ClearReferences
struct UGoal_UseAirstrikeRealTime_ClearReferences_Params
{
};

// Function WGame.Goal_UseAirstrikeRealTime.Init
struct UGoal_UseAirstrikeRealTime_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class UGoal_UseAirstrikeRealTime*                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ApproachAndMelee.ToString
struct UGoal_ApproachAndMelee_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_ApproachAndMelee.ActualWork
struct UGoal_ApproachAndMelee_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_ApproachAndMelee.Start
struct UGoal_ApproachAndMelee_Start_Params
{
};

// Function WGame.Goal_ApproachAndMelee.NotifyDestroyed
struct UGoal_ApproachAndMelee_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_ApproachAndMelee.ClearReferences
struct UGoal_ApproachAndMelee_ClearReferences_Params
{
};

// Function WGame.Goal_ApproachAndMelee.Init
struct UGoal_ApproachAndMelee_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class APawn*                                       inTarget;                                                 // (Parm)
	class UGoal_ApproachAndMelee*                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchAndFire.ToString
struct UGoal_SwitchAndFire_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_SwitchAndFire.End
struct UGoal_SwitchAndFire_End_Params
{
};

// Function WGame.Goal_SwitchAndFire.ActualWork
struct UGoal_SwitchAndFire_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchAndFire.Start
struct UGoal_SwitchAndFire_Start_Params
{
};

// Function WGame.Goal_SwitchAndFire.ClearReferences
struct UGoal_SwitchAndFire_ClearReferences_Params
{
};

// Function WGame.Goal_SwitchAndFire.Init
struct UGoal_SwitchAndFire_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	int                                                InGroup;                                                  // (Parm)
	class AActor*                                      inTarget;                                                 // (Parm)
	class UGoal_SwitchAndFire*                         ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Throw.ToString
struct UGoal_Throw_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Throw.End
struct UGoal_Throw_End_Params
{
};

// Function WGame.Goal_Throw.SetFocusValue
struct UGoal_Throw_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Throw.ActualWork
struct UGoal_Throw_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Throw.GetViewLocation
struct UGoal_Throw_GetViewLocation_Params
{
	struct FVector                                     curLocation;                                              // (Parm)
	struct FVector                                     fallLocation;                                             // (Parm)
	struct FVector                                     ViewLocation;                                             // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Throw.CanThrowTo
struct UGoal_Throw_CanThrowTo_Params
{
	class ALevelInfo*                                  Level;                                                    // (Parm)
	struct FVector                                     From;                                                     // (Parm)
	struct FVector                                     to;                                                       // (Parm)
	struct FVector                                     View;                                                     // (Parm, OutParm)
	bool                                               checkUp;                                                  // (Parm)
	bool                                               checkDown;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Throw.SpawnTrail
struct UGoal_Throw_SpawnTrail_Params
{
	struct FVector                                     ViewLocation;                                             // (Parm)
};

// Function WGame.Goal_Throw.Start
struct UGoal_Throw_Start_Params
{
};

// Function WGame.Goal_Throw.NotifyDestroyed
struct UGoal_Throw_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_Throw.ClearReferences
struct UGoal_Throw_ClearReferences_Params
{
};

// Function WGame.Goal_Throw.Init
struct UGoal_Throw_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class AActor*                                      inTarget;                                                 // (Parm)
	class UGoal_Throw*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchAndThrow.ToString
struct UGoal_SwitchAndThrow_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_SwitchAndThrow.End
struct UGoal_SwitchAndThrow_End_Params
{
};

// Function WGame.Goal_SwitchAndThrow.ActualWork
struct UGoal_SwitchAndThrow_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_SwitchAndThrow.Start
struct UGoal_SwitchAndThrow_Start_Params
{
};

// Function WGame.Goal_SwitchAndThrow.NotifyDestroyed
struct UGoal_SwitchAndThrow_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_SwitchAndThrow.ClearReferences
struct UGoal_SwitchAndThrow_ClearReferences_Params
{
};

// Function WGame.Goal_SwitchAndThrow.Init
struct UGoal_SwitchAndThrow_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class AActor*                                      inTarget;                                                 // (Parm)
	int                                                InGroup;                                                  // (Parm)
	class UGoal_SwitchAndThrow*                        ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Melee.ToString
struct UGoal_Melee_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Melee.SetFocusValue
struct UGoal_Melee_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Melee.ActualWork
struct UGoal_Melee_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Melee.Start
struct UGoal_Melee_Start_Params
{
};

// Function WGame.Goal_Melee.NotifyDestroyed
struct UGoal_Melee_NotifyDestroyed_Params
{
	class AActor*                                      A;                                                        // (Parm)
};

// Function WGame.Goal_Melee.ClearReferences
struct UGoal_Melee_ClearReferences_Params
{
};

// Function WGame.Goal_Melee.Init
struct UGoal_Melee_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	class AActor*                                      inTarget;                                                 // (Parm)
	class UGoal_Melee*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Look.ToString
struct UGoal_Look_ToString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WGame.Goal_Look.End
struct UGoal_Look_End_Params
{
};

// Function WGame.Goal_Look.SetFocusValue
struct UGoal_Look_SetFocusValue_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Look.ActualWork
struct UGoal_Look_ActualWork_Params
{
	float                                              dt;                                                       // (Parm)
	TEnumAsByte<EGoalStatus>                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.Goal_Look.Start
struct UGoal_Look_Start_Params
{
};

// Function WGame.Goal_Look.Init
struct UGoal_Look_Init_Params
{
	class AwAIBotBase*                                 inOwner;                                                  // (Parm)
	struct FVector                                     inLookLocation;                                           // (Parm)
	class UGoal_Look*                                  ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wEntryGameInfo.PrecacheGameSkeletalMeshes
struct AwEntryGameInfo_PrecacheGameSkeletalMeshes_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.wEntryGameInfo.PrecacheGameStaticMeshes
struct AwEntryGameInfo_PrecacheGameStaticMeshes_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.wEntryGameInfo.PrecacheGameTextures
struct AwEntryGameInfo_PrecacheGameTextures_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.wEntryGameInfo.PostLogin
struct AwEntryGameInfo_PostLogin_Params
{
	class APlayerController*                           NewPlayer;                                                // (Parm)
};

// Function WGame.wWeaponPickup_Location.Reset
struct AwWeaponPickup_Location_Reset_Params
{
};

// Function WGame.wWeaponPickup_Location.PickWeapon
struct AwWeaponPickup_Location_PickWeapon_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WGame.wWeaponPickup_Location.PostNetBeginPlay
struct AwWeaponPickup_Location_PostNetBeginPlay_Params
{
};

// Function WGame.wWeaponPickup_Location.PreBeginPlay
struct AwWeaponPickup_Location_PreBeginPlay_Params
{
};

// Function WGame.wWeaponPickup_RPG7.PreBeginPlay
struct AwWeaponPickup_RPG7_PreBeginPlay_Params
{
};

// Function WGame.wTeamGame.RespawnPlayer
struct AwTeamGame_RespawnPlayer_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               bClearSpecials;                                           // (OptionalParm, Parm)
};

// Function WGame.wTeamGame.PossessPawn
struct AwTeamGame_PossessPawn_Params
{
	class AController*                                 C;                                                        // (Parm)
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wTeamGame.SpawnAndPossessPawn
struct AwTeamGame_SpawnAndPossessPawn_Params
{
	class AController*                                 C;                                                        // (Parm)
	struct FString                                     PawnClassName;                                            // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamGame.FindPlayerStart
struct AwTeamGame_FindPlayerStart_Params
{
	class AController*                                 Player;                                                   // (Parm)
	unsigned char                                      inTeam;                                                   // (OptionalParm, Parm)
	struct FString                                     incomingName;                                             // (OptionalParm, Parm, NeedCtorLink)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamGame.GetGameSpecificPurposes
struct AwTeamGame_GetGameSpecificPurposes_Params
{
	class AController*                                 Owner;                                                    // (Parm)
	TArray<class UObject*>                             purposes;                                                 // (Parm, OutParm, NeedCtorLink)
};

// Function WGame.wTeamGame.EndGame
struct AwTeamGame_EndGame_Params
{
	class APlayerReplicationInfo*                      Winner;                                                   // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function WGame.wTeamGame.statai
struct AwTeamGame_statai_Params
{
};

// Function WGame.wTeamGame.SetOldTeamInfo
struct AwTeamGame_SetOldTeamInfo_Params
{
	class AGameReplicationInfo*                        OldGRI;                                                   // (Parm)
};

// Function WGame.wTeamGame.GetBootySeedValue
struct AwTeamGame_GetBootySeedValue_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTeamGame.StartMatch
struct AwTeamGame_StartMatch_Params
{
};

// Function WGame.wTeamGame.CalcResultPoints
struct AwTeamGame_CalcResultPoints_Params
{
};

// Function WGame.wTeamGame.InitGame
struct AwTeamGame_InitGame_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
};

// Function WGame.wTeamGame.PostLogin
struct AwTeamGame_PostLogin_Params
{
	class APlayerController*                           NewPlayer;                                                // (Parm)
};

// Function WGame.wTeamGame.PrecacheGameSkeletalMeshes
struct AwTeamGame_PrecacheGameSkeletalMeshes_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.wTeamGame.PrecacheGameStaticMeshes
struct AwTeamGame_PrecacheGameStaticMeshes_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.wTeamGame.PrecacheGameTextures
struct AwTeamGame_PrecacheGameTextures_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.wWeaponPickup_M2B.PreBeginPlay
struct AwWeaponPickup_M2B_PreBeginPlay_Params
{
};

// Function WGame.wVehicle.UpdatePrecacheMaterials
struct AwVehicle_UpdatePrecacheMaterials_Params
{
};

// Function WGame.wVehicle.StaticPrecache
struct AwVehicle_StaticPrecache_Params
{
	class ALevelInfo*                                  L;                                                        // (Parm)
};

// Function WGame.wVehicle.PerformTrace
struct AwVehicle_PerformTrace_Params
{
	struct FVector                                     HitLocation;                                              // (Parm, OutParm)
	struct FVector                                     HitNormal;                                                // (Parm, OutParm)
	struct FVector                                     End;                                                      // (Parm)
	struct FVector                                     Start;                                                    // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.CalcWeaponFire
struct AwVehicle_CalcWeaponFire_Params
{
	struct FVector                                     HitLocation;                                              // (Parm, OutParm)
	struct FVector                                     HitNormal;                                                // (Parm, OutParm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.GetBotError
struct AwVehicle_GetBotError_Params
{
	struct FVector                                     StartLocation;                                            // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.GetFireStart
struct AwVehicle_GetFireStart_Params
{
	float                                              XOffset;                                                  // (OptionalParm, Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.GetCrosshairWorldLocation
struct AwVehicle_GetCrosshairWorldLocation_Params
{
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.NotifyEnemyLockedOn
struct AwVehicle_NotifyEnemyLockedOn_Params
{
};

// Function WGame.wVehicle.DrawCrosshairAlignment
struct AwVehicle_DrawCrosshairAlignment_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm)
};

// Function WGame.wVehicle.WeaponHitsCrosshairsHL
struct AwVehicle_WeaponHitsCrosshairsHL_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.DrawCrosshair
struct AwVehicle_DrawCrosshair_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.DrawHealthInfo
struct AwVehicle_DrawHealthInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wVehicle.DrawWeaponInfo
struct AwVehicle_DrawWeaponInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AHUD*                                        H;                                                        // (Parm)
};

// Function WGame.wVehicle.DrawVehicleHUD
struct AwVehicle_DrawVehicleHUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wVehicle.SpecialDrawCrosshair
struct AwVehicle_SpecialDrawCrosshair_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WGame.wVehicle.DrawHUD
struct AwVehicle_DrawHUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WGame.wVehicle.GetWeaponBoneFor
struct AwVehicle_GetWeaponBoneFor_Params
{
	class AInventory*                                  i;                                                        // (Parm)
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.PlayDying
struct AwVehicle_PlayDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wVehicle.CalcInertia
struct AwVehicle_CalcInertia_Params
{
	float                                              DeltaTime;                                                // (Parm)
	float                                              FrictionFactor;                                           // (Parm)
	float                                              OldValue;                                                 // (Parm)
	float                                              NewValue;                                                 // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.Explode
struct AwVehicle_Explode_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WGame.wVehicle.TakeDamage
struct AwVehicle_TakeDamage_Params
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

// Function WGame.wVehicle.StopWeaponFiring
struct AwVehicle_StopWeaponFiring_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.ClientKDriverLeave
struct AwVehicle_ClientKDriverLeave_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wVehicle.ClientKDriverEnter
struct AwVehicle_ClientKDriverEnter_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wVehicle.KDriverLeave
struct AwVehicle_KDriverLeave_Params
{
	bool                                               bForceLeave;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wVehicle.UnPossessed
struct AwVehicle_UnPossessed_Params
{
};

// Function WGame.wVehicle.PossessedBy
struct AwVehicle_PossessedBy_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WGame.wVehicle.AddDefaultInventory
struct AwVehicle_AddDefaultInventory_Params
{
};

// Function WGame.wVehicle.Destroyed
struct AwVehicle_Destroyed_Params
{
};

// Function WGame.wVehicle.PostBeginPlay
struct AwVehicle_PostBeginPlay_Params
{
};

// Function WGame.wVehicle.Tick
struct AwVehicle_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wVehicle.ClientDying
struct AwVehicle_ClientDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
};

// Function WGame.wVehicle.PlayHit
struct AwVehicle_PlayHit_Params
{
	float                                              Damage;                                                   // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WGame.wTurret.MakeFireNoise
struct AwTurret_MakeFireNoise_Params
{
};

// Function WGame.wTurret.TakeDamage
struct AwTurret_TakeDamage_Params
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

// Function WGame.wTurret.InitBaseRotation
struct AwTurret_InitBaseRotation_Params
{
};

// Function WGame.wTurret.PlaceExitingDriver
struct AwTurret_PlaceExitingDriver_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.PointOfView
struct AwTurret_PointOfView_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.UpdatePrecacheMaterials
struct AwTurret_UpdatePrecacheMaterials_Params
{
};

// Function WGame.wTurret.StaticPrecache
struct AwTurret_StaticPrecache_Params
{
	class ALevelInfo*                                  L;                                                        // (Parm)
};

// Function WGame.wTurret.KDriverLeave
struct AwTurret_KDriverLeave_Params
{
	bool                                               bForceLeave;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.KDriverEnter
struct AwTurret_KDriverEnter_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wTurret.ClientKDriverEnter
struct AwTurret_ClientKDriverEnter_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wTurret.AttachDriver
struct AwTurret_AttachDriver_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WGame.wTurret.PostZoomAdjust
struct AwTurret_PostZoomAdjust_Params
{
	float                                              ZoomPct;                                                  // (Parm)
};

// Function WGame.wTurret.DrawCrosshair
struct AwTurret_DrawCrosshair_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.PerformTrace
struct AwTurret_PerformTrace_Params
{
	struct FVector                                     HitLocation;                                              // (Parm, OutParm)
	struct FVector                                     HitNormal;                                                // (Parm, OutParm)
	struct FVector                                     End;                                                      // (Parm)
	struct FVector                                     Start;                                                    // (Parm)
	class AActor*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.DrawHealthInfo
struct AwTurret_DrawHealthInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wTurret.Explode
struct AwTurret_Explode_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WGame.wTurret.PlayFiring
struct AwTurret_PlayFiring_Params
{
	float                                              Rate;                                                     // (OptionalParm, Parm)
	struct FName                                       FiringMode;                                               // (OptionalParm, Parm)
};

// Function WGame.wTurret.GetViewRotation
struct AwTurret_GetViewRotation_Params
{
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.SpecialCalcFirstPersonView
struct AwTurret_SpecialCalcFirstPersonView_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
	class AActor*                                      ViewActor;                                                // (Parm, OutParm)
	struct FVector                                     CameraLocation;                                           // (Parm, OutParm)
	struct FRotator                                    CameraRotation;                                           // (Parm, OutParm)
};

// Function WGame.wTurret.SpecialCalcView
struct AwTurret_SpecialCalcView_Params
{
	class AActor*                                      ViewActor;                                                // (Parm, OutParm)
	struct FVector                                     CameraLocation;                                           // (Parm, OutParm)
	struct FRotator                                    CameraRotation;                                           // (Parm, OutParm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.TestSetDriverFrame
struct AwTurret_TestSetDriverFrame_Params
{
	float                                              frame;                                                    // (Parm)
	float                                              UpDownFrame;                                              // (OptionalParm, Parm)
};

// Function WGame.wTurret.Tick
struct AwTurret_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wTurret.NotifyAllControllers
struct AwTurret_NotifyAllControllers_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wTurret.UpdateRocketAcceleration
struct AwTurret_UpdateRocketAcceleration_Params
{
	float                                              DeltaTime;                                                // (Parm)
	float                                              YawChange;                                                // (Parm)
	float                                              PitchChange;                                              // (Parm)
};

// Function WGame.wTurret.Destroyed
struct AwTurret_Destroyed_Params
{
};

// Function WGame.wTurret.SetRotateForPlayerView
struct AwTurret_SetRotateForPlayerView_Params
{
	struct FRotator                                    PCRot;                                                    // (Parm)
};

// Function WGame.wTurret.HasAmmo
struct AwTurret_HasAmmo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.PostNetBeginPlay
struct AwTurret_PostNetBeginPlay_Params
{
};

// Function WGame.wTurret.UnPossessed
struct AwTurret_UnPossessed_Params
{
};

// Function WGame.wTurret.PossessedBy
struct AwTurret_PossessedBy_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WGame.wTurret.PostBeginPlay
struct AwTurret_PostBeginPlay_Params
{
};

// Function WGame.wTurret.ServerSwitchTurret
struct AwTurret_ServerSwitchTurret_Params
{
	bool                                               bNextTurret;                                              // (Parm)
};

// Function WGame.wTurret.NextWeapon
struct AwTurret_NextWeapon_Params
{
};

// Function WGame.wTurret.PrevWeapon
struct AwTurret_PrevWeapon_Params
{
};

// Function WGame.wTurret.BotDesireability
struct AwTurret_BotDesireability_Params
{
	class AActor*                                      S;                                                        // (Parm)
	int                                                TeamIndex;                                                // (Parm)
	class AActor*                                      Objective;                                                // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.StronglyRecommended
struct AwTurret_StronglyRecommended_Params
{
	class AActor*                                      S;                                                        // (Parm)
	int                                                TeamIndex;                                                // (Parm)
	class AActor*                                      Objective;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret.RecommendLongRangedAttack
struct AwTurret_RecommendLongRangedAttack_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret_FNM240.DisplayDebug
struct AwTurret_FNM240_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WGame.wTurret_FNM240.GetViewRotation
struct AwTurret_FNM240_GetViewRotation_Params
{
	struct FRotator                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wTurret_FNM240.TZ
struct AwTurret_FNM240_TZ_Params
{
	int                                                iZ;                                                       // (Parm)
};

// Function WGame.wTurret_FNM240.ty
struct AwTurret_FNM240_ty_Params
{
	int                                                iY;                                                       // (Parm)
};

// Function WGame.wTurret_FNM240.TX
struct AwTurret_FNM240_TX_Params
{
	int                                                iX;                                                       // (Parm)
};

// Function WGame.wTurret_FNM240.t
struct AwTurret_FNM240_t_Params
{
	int                                                iType;                                                    // (Parm)
};

// Function WGame.wTurret_FNM240.UpdatePrecacheMaterials
struct AwTurret_FNM240_UpdatePrecacheMaterials_Params
{
};

// Function WGame.wTurret_FNM240.UpdatePrecacheStaticMeshes
struct AwTurret_FNM240_UpdatePrecacheStaticMeshes_Params
{
};

// Function WGame.wTurret_FNM240.StaticPrecache
struct AwTurret_FNM240_StaticPrecache_Params
{
	class ALevelInfo*                                  L;                                                        // (Parm)
};

// Function WGame.wTurret_FNM240.SetExitViewRotation
struct AwTurret_FNM240_SetExitViewRotation_Params
{
	class APawn*                                       Driver;                                                   // (Parm)
};

// Function WGame.wTurret_FNM240.MakeFireNoise
struct AwTurret_FNM240_MakeFireNoise_Params
{
};

// Function WGame.wTurret_FNM240.ClientKDriverLeave
struct AwTurret_FNM240_ClientKDriverLeave_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wTurret_FNM240.ClientKDriverEnter
struct AwTurret_FNM240_ClientKDriverEnter_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WGame.wTurret_FNM240.PostBeginPlay
struct AwTurret_FNM240_PostBeginPlay_Params
{
};

// Function WGame.wAmmoSupplyObjective.ChargeAmmo
struct AwAmmoSupplyObjective_ChargeAmmo_Params
{
	class AwPawn*                                      P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAmmoSupplyObjective.Touch
struct AwAmmoSupplyObjective_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WGame.wAmmoSupplyObjective.PostBeginPlay
struct AwAmmoSupplyObjective_PostBeginPlay_Params
{
};

// Function WGame.wAIDefencePawn.TakeFallingDamage
struct AwAIDefencePawn_TakeFallingDamage_Params
{
};

// Function WGame.wAIDefencePawn.SetCollisionSizeEx
struct AwAIDefencePawn_SetCollisionSizeEx_Params
{
	float                                              fRadius;                                                  // (Parm)
	float                                              fHeight;                                                  // (Parm)
};

// Function WGame.wAIDefencePawn.SetCollisionRadius
struct AwAIDefencePawn_SetCollisionRadius_Params
{
};

// Function WGame.wAIDefencePawn.AdjustCollisionSize
struct AwAIDefencePawn_AdjustCollisionSize_Params
{
};

// Function WGame.wAIDefencePawn.EffectExplosion
struct AwAIDefencePawn_EffectExplosion_Params
{
};

// Function WGame.wAIDefencePawn.CheckDamageWithinRadius
struct AwAIDefencePawn_CheckDamageWithinRadius_Params
{
};

// Function WGame.wAIDefencePawn.Tick
struct AwAIDefencePawn_Tick_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WGame.wAIDefencePawn.deleOnReachedDestination
struct AwAIDefencePawn_deleOnReachedDestination_Params
{
	struct FVector                                     Dir;                                                      // (Parm)
	class AActor*                                      GoalActor;                                                // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefencePawn.CheckUpdateAnimation
struct AwAIDefencePawn_CheckUpdateAnimation_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefencePawn.PlayLandedSound
struct AwAIDefencePawn_PlayLandedSound_Params
{
	int                                                SurfType;                                                 // (Parm)
};

// Function WGame.wAIDefencePawn.FootStepping
struct AwAIDefencePawn_FootStepping_Params
{
	int                                                side;                                                     // (Parm)
};

// Function WGame.wAIDefencePawn.SpawnSupplyItem
struct AwAIDefencePawn_SpawnSupplyItem_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefencePawn.SpawnGibs
struct AwAIDefencePawn_SpawnGibs_Params
{
	struct FRotator                                    HitRotation;                                              // (Parm)
	float                                              ChunkPerterbation;                                        // (Parm)
};

// Function WGame.wAIDefencePawn.SpawnGoreGiblet
struct AwAIDefencePawn_SpawnGoreGiblet_Params
{
	int                                                iIndex;                                                   // (Parm)
};

// Function WGame.wAIDefencePawn.PlayMelee
struct AwAIDefencePawn_PlayMelee_Params
{
	bool                                               bMeleeKnifeOrButt;                                        // (Parm)
};

// Function WGame.wAIDefencePawn.GetBloodHitClass
struct AwAIDefencePawn_GetBloodHitClass_Params
{
	bool                                               bHeadShot;                                                // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefencePawn.AddDefaultSkills
struct AwAIDefencePawn_AddDefaultSkills_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WGame.wAIDefencePawn.AddWeapon
struct AwAIDefencePawn_AddWeapon_Params
{
	struct FBtrDouble                                  iUniqueID;                                                // (Parm)
	int                                                iWeaponID;                                                // (Parm)
	int                                                iAddPartsID;                                              // (Parm)
	bool                                               bPickupChange;                                            // (OptionalParm, Parm)
	int                                                iPainting_Item_ID;                                        // (OptionalParm, Parm)
	class AwWeapon*                                    ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefencePawn.ChangedWeapon
struct AwAIDefencePawn_ChangedWeapon_Params
{
};

// Function WGame.wAIDefencePawn.AddDefaultInventory
struct AwAIDefencePawn_AddDefaultInventory_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WGame.wAIDefencePawn.PlayDyingAnimation
struct AwAIDefencePawn_PlayDyingAnimation_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
};

// Function WGame.wAIDefencePawn.Process_TossWeapon_When_Dying
struct AwAIDefencePawn_Process_TossWeapon_When_Dying_Params
{
	class ALevelInfo*                                  levenInfo;                                                // (Parm)
	class APawn*                                       Pawn;                                                     // (Parm)
	class AwWeapon*                                    Weapon;                                                   // (Parm)
};

// Function WGame.wAIDefencePawn.PostBeginPlay
struct AwAIDefencePawn_PostBeginPlay_Params
{
};

// Function WGame.wAIDefencePawn.PostNetReceive
struct AwAIDefencePawn_PostNetReceive_Params
{
};

// Function WGame.wAIDefencePawn.Setup
struct AwAIDefencePawn_Setup_Params
{
	struct FPlayerRecord                               Rec;                                                      // (Parm, NeedCtorLink)
	bool                                               bLoadNow;                                                 // (OptionalParm, Parm)
};

// Function WGame.wAIDefencePawn.InitDefencePawn
struct AwAIDefencePawn_InitDefencePawn_Params
{
	class ALevelInfo*                                  Level;                                                    // (Parm)
	int                                                Grade;                                                    // (Parm)
	int                                                RegenLoc;                                                 // (Parm)
};

// Function WGame.wAIDefencePawn.Create
struct AwAIDefencePawn_Create_Params
{
	class ALevelInfo*                                  Level;                                                    // (Parm)
	struct FVector                                     Location;                                                 // (Parm)
	struct FRotator                                    Rotation;                                                 // (Parm)
	class AwAIDefencePawn*                             ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefencePawn.PostNetBeginPlay
struct AwAIDefencePawn_PostNetBeginPlay_Params
{
};

// Function WGame.wAIDefencePawn.SetBotMesh
struct AwAIDefencePawn_SetBotMesh_Params
{
};

// Function WGame.wBTR_ArrangeTurret.ForceSpawnVehicle
struct AwBTR_ArrangeTurret_ForceSpawnVehicle_Params
{
};

// Function WGame.wBTR_ArrangeTurret.ForceDestroyVehicle
struct AwBTR_ArrangeTurret_ForceDestroyVehicle_Params
{
};

// Function WGame.wBTR_ArrangeTurret.PrecacheAnnouncer
struct AwBTR_ArrangeTurret_PrecacheAnnouncer_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function WGame.wBTR_ArrangeTurret.VehicleDestroyed
struct AwBTR_ArrangeTurret_VehicleDestroyed_Params
{
	class AVehicle*                                    V;                                                        // (Parm)
};

// Function WGame.wBTR_ArrangeTurret.VehiclePossessed
struct AwBTR_ArrangeTurret_VehiclePossessed_Params
{
	class AVehicle*                                    V;                                                        // (Parm)
};

// Function WGame.wBTR_ArrangeTurret.Timer
struct AwBTR_ArrangeTurret_Timer_Params
{
};

// Function WGame.wBTR_ArrangeTurret.Reset
struct AwBTR_ArrangeTurret_Reset_Params
{
};

// Function WGame.wBTR_ArrangeTurret.SetVehicleTeam
struct AwBTR_ArrangeTurret_SetVehicleTeam_Params
{
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBTR_ArrangeTurret.VehicleSpawned
struct AwBTR_ArrangeTurret_VehicleSpawned_Params
{
};

// Function WGame.wBTR_ArrangeTurret.SpawnBuildEffect
struct AwBTR_ArrangeTurret_SpawnBuildEffect_Params
{
};

// Function WGame.wBTR_ArrangeTurret.SpawnVehicle
struct AwBTR_ArrangeTurret_SpawnVehicle_Params
{
	bool                                               noCollisionFail;                                          // (OptionalParm, Parm)
};

// Function WGame.wBTR_ArrangeTurret.Shutdown
struct AwBTR_ArrangeTurret_Shutdown_Params
{
};

// Function WGame.wBTR_ArrangeTurret.SetEnabled
struct AwBTR_ArrangeTurret_SetEnabled_Params
{
	bool                                               bNewEnabled;                                              // (Parm)
};

// Function WGame.wBTR_ArrangeTurret.Trigger
struct AwBTR_ArrangeTurret_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function WGame.wBTR_ArrangeTurret.SelfTriggered
struct AwBTR_ArrangeTurret_SelfTriggered_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wBTR_ArrangeTurret.UpdatePrecacheStaticMeshes
struct AwBTR_ArrangeTurret_UpdatePrecacheStaticMeshes_Params
{
};

// Function WGame.wBTR_ArrangeTurret.UpdatePrecacheMaterials
struct AwBTR_ArrangeTurret_UpdatePrecacheMaterials_Params
{
};

// Function WGame.wBTR_ArrangeTurret.PostBeginPlay
struct AwBTR_ArrangeTurret_PostBeginPlay_Params
{
};

// Function WGame.wBTR_Turret_FNM240.VehicleSpawned
struct AwBTR_Turret_FNM240_VehicleSpawned_Params
{
};

// Function WGame.wTurret_Base.UpdateOverlay
struct AwTurret_Base_UpdateOverlay_Params
{
};

// Function WGame.wTurret_Base.Timer
struct AwTurret_Base_Timer_Params
{
};

// Function WGame.wTurret_Base.TakeDamage
struct AwTurret_Base_TakeDamage_Params
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

// Function WGame.wTurret_Base.UpdateSwivelRotation
struct AwTurret_Base_UpdateSwivelRotation_Params
{
	struct FRotator                                    TurretRotation;                                           // (Parm)
};

// Function WGame.wTurret_Base.UpdateBaseRotation
struct AwTurret_Base_UpdateBaseRotation_Params
{
	struct FRotator                                    TurretRotation;                                           // (Parm)
};

// Function WGame.wTurret_Base.PostBeginPlay
struct AwTurret_Base_PostBeginPlay_Params
{
};

// Function WGame.wTurret_FNM240_Base.UpdateBaseRotation
struct AwTurret_FNM240_Base_UpdateBaseRotation_Params
{
	struct FRotator                                    TurretRotation;                                           // (Parm)
};

// Function WGame.wTurret_FNM240_Swivel.UpdateSwivelRotation
struct AwTurret_FNM240_Swivel_UpdateSwivelRotation_Params
{
	struct FRotator                                    TurretRotation;                                           // (Parm)
};

// Function WGame.wAIDefenceBot.GetTeamNum
struct AwAIDefenceBot_GetTeamNum_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefenceBot.Possess
struct AwAIDefenceBot_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wAIDefenceBot.InitBot
struct AwAIDefenceBot_InitBot_Params
{
	int                                                Grade;                                                    // (Parm)
};

// Function WGame.wAIDefenceBot.TickStance
struct AwAIDefenceBot_TickStance_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WGame.wAIDefenceBot.TryProne
struct AwAIDefenceBot_TryProne_Params
{
};

// Function WGame.wAIDefenceBot.TryCrouch
struct AwAIDefenceBot_TryCrouch_Params
{
};

// Function WGame.wAIDefenceBot.SetupWeapons
struct AwAIDefenceBot_SetupWeapons_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WGame.wAIDefenceBot.SetPawnClass
struct AwAIDefenceBot_SetPawnClass_Params
{
	struct FString                                     inClass;                                                  // (Parm, NeedCtorLink)
	struct FString                                     InCharacter;                                              // (Parm, NeedCtorLink)
};

// Function WGame.wAIDefenceBot.NotifyAddDefaultInventory
struct AwAIDefenceBot_NotifyAddDefaultInventory_Params
{
};

// Function WGame.wAIDefenceBot.CallAirStrike
struct AwAIDefenceBot_CallAirStrike_Params
{
	class AController*                                 Caller;                                                   // (OptionalParm, Parm)
};

// Function WGame.wAIDefenceBot.ReadyToMeleeAttack
struct AwAIDefenceBot_ReadyToMeleeAttack_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WGame.wAIDefenceBot_Alpha.NotifyAddDefaultInventory
struct AwAIDefenceBot_Alpha_NotifyAddDefaultInventory_Params
{
};

// Function WGame.PrecacheGameClient.PrecacheGameSkeletalMeshes
struct UPrecacheGameClient_PrecacheGameSkeletalMeshes_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.PrecacheGameClient.PrecacheGameStaticMeshes
struct UPrecacheGameClient_PrecacheGameStaticMeshes_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

// Function WGame.PrecacheGameClient.PrecacheGameTextures
struct UPrecacheGameClient_PrecacheGameTextures_Params
{
	class ALevelInfo*                                  myLevel;                                                  // (Parm)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
