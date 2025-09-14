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

// Function WMission.wMSPlayerReplicationInfo.Reset
struct AwMSPlayerReplicationInfo_Reset_Params
{
};

// Function WMission.wMSPlayerReplicationInfo.CanBotTeleport
struct AwMSPlayerReplicationInfo_CanBotTeleport_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSPlayerReplicationInfo.Timer
struct AwMSPlayerReplicationInfo_Timer_Params
{
};

// Function WMission.wAlienPlayerReplicationInfo.Reset
struct AwAlienPlayerReplicationInfo_Reset_Params
{
};

// Function WMission.wAlienPlayerReplicationInfo.ServerSetSkinID
struct AwAlienPlayerReplicationInfo_ServerSetSkinID_Params
{
	unsigned char                                      bySkinID;                                                 // (Parm)
};

// Function WMission.wAlienPlayerReplicationInfo.GetSelectedSkinID
struct AwAlienPlayerReplicationInfo_GetSelectedSkinID_Params
{
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienPlayerReplicationInfo.GetInfectionLevel
struct AwAlienPlayerReplicationInfo_GetInfectionLevel_Params
{
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienPlayerReplicationInfo.SetInfectionLevel
struct AwAlienPlayerReplicationInfo_SetInfectionLevel_Params
{
	unsigned char                                      Level;                                                    // (Parm)
};

// Function WMission.wAlienPlayerReplicationInfo.GetObjType
struct AwAlienPlayerReplicationInfo_GetObjType_Params
{
	TEnumAsByte<EAlienModeType>                        ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienPlayerReplicationInfo.SetObjType
struct AwAlienPlayerReplicationInfo_SetObjType_Params
{
	TEnumAsByte<EAlienModeType>                        eType;                                                    // (Parm)
};

// Function WMission.wHUD_Mission.DrawMissionIcon
struct AwHUD_Mission_DrawMissionIcon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
};

// Function WMission.wHUD_Mission.DrawIntroTitle
struct AwHUD_Mission_DrawIntroTitle_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawCinematicHUD
struct AwHUD_Mission_DrawCinematicHUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.UpdatePrecacheMaterials
struct AwHUD_Mission_UpdatePrecacheMaterials_Params
{
};

// Function WMission.wHUD_Mission.UpdatePrecacheStaticMeshes
struct AwHUD_Mission_UpdatePrecacheStaticMeshes_Params
{
};

// Function WMission.wHUD_Mission.GetInfoString
struct AwHUD_Mission_GetInfoString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wHUD_Mission.CheckCountdown
struct AwHUD_Mission_CheckCountdown_Params
{
	class AGameReplicationInfo*                        GRI;                                                      // (Parm)
};

// Function WMission.wHUD_Mission.DrawPracticeRoundInfo
struct AwHUD_Mission_DrawPracticeRoundInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.TeamChanged
struct AwHUD_Mission_TeamChanged_Params
{
};

// Function WMission.wHUD_Mission.NotifyGRIChanged
struct AwHUD_Mission_NotifyGRIChanged_Params
{
};

// Function WMission.wHUD_Mission.Tick
struct AwHUD_Mission_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WMission.wHUD_Mission.DrawTextWithBackground
struct AwHUD_Mission_DrawTextWithBackground_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FString                                     Text;                                                     // (Parm, NeedCtorLink)
	struct FColor                                      TextColor;                                                // (Parm)
	float                                              XO;                                                       // (Parm)
	float                                              YO;                                                       // (Parm)
};

// Function WMission.wHUD_Mission.GetScreenCorner
struct AwHUD_Mission_GetScreenCorner_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AActor*                                      A;                                                        // (Parm)
	struct FVector                                     CornerVect;                                               // (Parm)
	struct FVector                                     IPScrO;                                                   // (Parm)
	struct FRotator                                    CameraRotation;                                           // (Parm)
	float                                              ColExpand;                                                // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.Draw_2DCollisionBox
struct AwHUD_Mission_Draw_2DCollisionBox_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AActor*                                      A;                                                        // (Parm)
	struct FVector                                     ScrPos;                                                   // (Parm)
	struct FString                                     Description;                                              // (Parm, NeedCtorLink)
	float                                              ColExpand;                                                // (Parm)
	bool                                               bSizeOverride;                                            // (Parm)
};

// Function WMission.wHUD_Mission.GetGYRColorRamp
struct AwHUD_Mission_GetGYRColorRamp_Params
{
	float                                              Pct;                                                      // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.GetObjectiveColor
struct AwHUD_Mission_GetObjectiveColor_Params
{
	class AGameObjective*                              Go;                                                       // (Parm)
	unsigned char                                      bProgressPulsing;                                         // (OptionalParm, Parm, OutParm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.GetTeamColor
struct AwHUD_Mission_GetTeamColor_Params
{
	unsigned char                                      Team;                                                     // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.CustomHUDColorAllowed
struct AwHUD_Mission_CustomHUDColorAllowed_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.DrawCustomHealthInfo
struct AwHUD_Mission_DrawCustomHealthInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
	bool                                               bSkaarj;                                                  // (Parm)
};

// Function WMission.wHUD_Mission.DrawInfoPods
struct AwHUD_Mission_DrawInfoPods_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.CanSpawnNotify
struct AwHUD_Mission_CanSpawnNotify_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.GetCurrentObjective
struct AwHUD_Mission_GetCurrentObjective_Params
{
	class AGameObjective*                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.NotifyUpdatedObjective
struct AwHUD_Mission_NotifyUpdatedObjective_Params
{
};

// Function WMission.wHUD_Mission.HighlightCurrentObjective
struct AwHUD_Mission_HighlightCurrentObjective_Params
{
	bool                                               bShowWayPoint;                                            // (Parm)
};

// Function WMission.wHUD_Mission.AnnouncementPlayed
struct AwHUD_Mission_AnnouncementPlayed_Params
{
	struct FString                                     AnnouncerSound;                                           // (Parm, NeedCtorLink)
	unsigned char                                      Switch;                                                   // (Parm)
};

// Function WMission.wHUD_Mission.IsObjectiveVisible
struct AwHUD_Mission_IsObjectiveVisible_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AGameObjective*                              Target;                                                   // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm, OutParm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.DrawHealthBar
struct AwHUD_Mission_DrawHealthBar_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     HBScreenPos;                                              // (Parm)
	float                                              Health;                                                   // (Parm)
	float                                              MaxHealth;                                                // (Parm)
	struct FColor                                      ObjColor;                                                 // (Parm)
};

// Function WMission.wHUD_Mission.Release_ObjectivePointingArrow
struct AwHUD_Mission_Release_ObjectivePointingArrow_Params
{
};

// Function WMission.wHUD_Mission.Draw3dObjectiveArrow
struct AwHUD_Mission_Draw3dObjectiveArrow_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.Release_BehindObjectiveArrows
struct AwHUD_Mission_Release_BehindObjectiveArrows_Params
{
};

// Function WMission.wHUD_Mission.Get_BehindObjectiveArrow
struct AwHUD_Mission_Get_BehindObjectiveArrow_Params
{
	class UTexRotator*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.DrawObjectiveIcon
struct AwHUD_Mission_DrawObjectiveIcon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bOptionalObjective;                                       // (Parm)
	float                                              PosX;                                                     // (Parm)
	float                                              PosY;                                                     // (Parm)
	float                                              tileX;                                                    // (Parm)
	float                                              tileY;                                                    // (Parm)
};

// Function WMission.wHUD_Mission.DrawObjectiveStatusOverlay
struct AwHUD_Mission_DrawObjectiveStatusOverlay_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              Progress;                                                 // (Parm)
	bool                                               bCriticalFlash;                                           // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm)
	float                                              Scale;                                                    // (Parm)
};

// Function WMission.wHUD_Mission.DrawCriticalObjectiveOverlay
struct AwHUD_Mission_DrawCriticalObjectiveOverlay_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     ScreenPos;                                                // (Parm)
	float                                              Scale;                                                    // (Parm)
};

// Function WMission.wHUD_Mission.DrawMiniMap
struct AwHUD_Mission_DrawMiniMap_Params
{
	class AwHudPart_MinimapBase*                       Minimap;                                                  // (Parm)
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawBigmap_HUD
struct AwHUD_Mission_DrawBigmap_HUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawMinimap_HUD
struct AwHUD_Mission_DrawMinimap_HUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.CheckAndDrawProgress
struct AwHUD_Mission_CheckAndDrawProgress_Params
{
	class AGameObjective*                              Go;                                                       // (Parm)
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawProgressMessage
struct AwHUD_Mission_DrawProgressMessage_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              ProgressPct;                                              // (Parm)
};

// Function WMission.wHUD_Mission.GetGameObjectIndexByTag
struct AwHUD_Mission_GetGameObjectIndexByTag_Params
{
	struct FName                                       Tag;                                                      // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.GetGameObjectIndex
struct AwHUD_Mission_GetGameObjectIndex_Params
{
	class AGameObjective*                              Go;                                                       // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.DrawObjectives
struct AwHUD_Mission_DrawObjectives_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.MultiplyColor
struct AwHUD_Mission_MultiplyColor_Params
{
	struct FColor                                      c1;                                                       // (Parm, OutParm)
	struct FColor                                      c2;                                                       // (Parm)
	struct FColor                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.IsOnEdgeOfScreen
struct AwHUD_Mission_IsOnEdgeOfScreen_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     pos;                                                      // (Parm)
	float                                              W;                                                        // (Parm)
	float                                              H;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.GetRadarDotPosition
struct AwHUD_Mission_GetRadarDotPosition_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     dist;                                                     // (Parm)
	struct FVector                                     ViewX;                                                    // (Parm)
	struct FVector                                     ViewY;                                                    // (Parm)
	float                                              OffsetScale;                                              // (Parm)
	float                                              OffsetY;                                                  // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.GetRadarDotDist
struct AwHUD_Mission_GetRadarDotDist_Params
{
	struct FVector                                     dist;                                                     // (Parm)
	struct FVector                                     ViewX;                                                    // (Parm)
	struct FVector                                     ViewY;                                                    // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.ApplySmartRangeDist
struct AwHUD_Mission_ApplySmartRangeDist_Params
{
	float                                              dist;                                                     // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.DrawRadarPassB
struct AwHUD_Mission_DrawRadarPassB_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawRadarPassA
struct AwHUD_Mission_DrawRadarPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawDebug
struct AwHUD_Mission_DrawDebug_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                X;                                                        // (Parm)
	int                                                Y;                                                        // (Parm, OutParm)
	int                                                dy;                                                       // (Parm)
};

// Function WMission.wHUD_Mission.DrawSpectatingHud
struct AwHUD_Mission_DrawSpectatingHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.ShowTeamScorePassC
struct AwHUD_Mission_ShowTeamScorePassC_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.IsVSRelevant
struct AwHUD_Mission_IsVSRelevant_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.DrawTeamVS
struct AwHUD_Mission_DrawTeamVS_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.ShowTeamScorePassA
struct AwHUD_Mission_ShowTeamScorePassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.UpdateHUD
struct AwHUD_Mission_UpdateHUD_Params
{
};

// Function WMission.wHUD_Mission.updateScore
struct AwHUD_Mission_updateScore_Params
{
};

// Function WMission.wHUD_Mission.UpdateTimer
struct AwHUD_Mission_UpdateTimer_Params
{
	int                                                TimeMinutes;                                              // (Parm, OutParm)
	int                                                TimeSeconds;                                              // (Parm, OutParm)
};

// Function WMission.wHUD_Mission.UpdateTeamHud
struct AwHUD_Mission_UpdateTeamHud_Params
{
};

// Function WMission.wHUD_Mission.ShouldShowObjectiveBoard
struct AwHUD_Mission_ShouldShowObjectiveBoard_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Mission.DrawAssaultHUDLayer
struct AwHUD_Mission_DrawAssaultHUDLayer_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.CanvasDrawActors
struct AwHUD_Mission_CanvasDrawActors_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bClearedZBuffer;                                          // (Parm)
};

// Function WMission.wHUD_Mission.DrawHudPassC
struct AwHUD_Mission_DrawHudPassC_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawHudPassB
struct AwHUD_Mission_DrawHudPassB_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawDebugTime
struct AwHUD_Mission_DrawDebugTime_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawDebugMission
struct AwHUD_Mission_DrawDebugMission_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.CallEvent
struct AwHUD_Mission_CallEvent_Params
{
	bool                                               InvenCheck;                                               // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function WMission.wHUD_Mission.DrawHudPassA
struct AwHUD_Mission_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.Destroyed
struct AwHUD_Mission_Destroyed_Params
{
};

// Function WMission.wHUD_Mission.UpdateOBJ
struct AwHUD_Mission_UpdateOBJ_Params
{
};

// Function WMission.wHUD_Mission.PostBeginPlay
struct AwHUD_Mission_PostBeginPlay_Params
{
};

// Function WMission.wHUD_Mission.PrecacheFonts
struct AwHUD_Mission_PrecacheFonts_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.ShowObjectiveBoard
struct AwHUD_Mission_ShowObjectiveBoard_Params
{
};

// Function WMission.wHUD_Mission.DrawAdrenaline
struct AwHUD_Mission_DrawAdrenaline_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Mission.DrawTimer
struct AwHUD_Mission_DrawTimer_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.ShowRadioMessage_Notify
struct AwHUD_Alien_ShowRadioMessage_Notify_Params
{
};

// Function WMission.wHUD_Alien.ShowRadioMessage_Alarm
struct AwHUD_Alien_ShowRadioMessage_Alarm_Params
{
};

// Function WMission.wHUD_Alien.ShowRadioMessage
struct AwHUD_Alien_ShowRadioMessage_Params
{
};

// Function WMission.wHUD_Alien.LocalizedMessage2
struct AwHUD_Alien_LocalizedMessage2_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	bool                                               bOption_Push;                                             // (OptionalParm, Parm)
	struct FString                                     CriticalString;                                           // (OptionalParm, Parm, NeedCtorLink)
};

// Function WMission.wHUD_Alien.ChangeWeaponSlot5Hud
struct AwHUD_Alien_ChangeWeaponSlot5Hud_Params
{
	class AwWeapon*                                    newWeapon;                                                // (Parm)
	bool                                               bAddSkill;                                                // (OptionalParm, Parm)
};

// Function WMission.wHUD_Alien.Tick
struct AwHUD_Alien_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WMission.wHUD_Alien.CheckPawnOwnerSkill
struct AwHUD_Alien_CheckPawnOwnerSkill_Params
{
	int                                                skillC4;                                                  // (Parm, OutParm)
	int                                                skillAirStirke;                                           // (Parm, OutParm)
	int                                                skillRPG;                                                 // (Parm, OutParm)
};

// Function WMission.wHUD_Alien.CallEvent
struct AwHUD_Alien_CallEvent_Params
{
	bool                                               InvenCheck;                                               // (OptionalParm, Parm)
	int                                                iReservation1;                                            // (OptionalParm, Parm)
	int                                                iReservation2;                                            // (OptionalParm, Parm)
};

// Function WMission.wHUD_Alien.UpdateModeEquippedItem
struct AwHUD_Alien_UpdateModeEquippedItem_Params
{
};

// Function WMission.wHUD_Alien.UpdateModeItemSlot_Human
struct AwHUD_Alien_UpdateModeItemSlot_Human_Params
{
};

// Function WMission.wHUD_Alien.UpdateModeItemSlot_Alien
struct AwHUD_Alien_UpdateModeItemSlot_Alien_Params
{
};

// Function WMission.wHUD_Alien.AddTeamDeathInfo
struct AwHUD_Alien_AddTeamDeathInfo_Params
{
	class APawn*                                       P;                                                        // (Parm)
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	float                                              FadeTime;                                                 // (Parm)
	float                                              Duration;                                                 // (Parm)
};

// Function WMission.wHUD_Alien.NotifyHealthInDanger
struct AwHUD_Alien_NotifyHealthInDanger_Params
{
};

// Function WMission.wHUD_Alien.OnClientReceiveDeathMessage
struct AwHUD_Alien_OnClientReceiveDeathMessage_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (Parm)
	class APlayerReplicationInfo*                      attackerPRI;                                              // (Parm)
	class APlayerReplicationInfo*                      victimPRI;                                                // (Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function WMission.wHUD_Alien.DrawSpecialSkillMedal
struct AwHUD_Alien_DrawSpecialSkillMedal_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	int                                                Index;                                                    // (Parm)
	int                                                width;                                                    // (Parm)
	int                                                Height;                                                   // (Parm)
	struct FCalCoordsW                                 calW;                                                     // (Parm)
	int                                                PosX;                                                     // (Parm)
	int                                                PosY;                                                     // (Parm)
	float                                              curScale;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Alien.DeleteSuppliesPositions
struct AwHUD_Alien_DeleteSuppliesPositions_Params
{
	class AActor*                                      act;                                                      // (Parm)
};

// Function WMission.wHUD_Alien.CacheSuppliesPositions
struct AwHUD_Alien_CacheSuppliesPositions_Params
{
	class AActor*                                      act;                                                      // (Parm)
};

// Function WMission.wHUD_Alien.UpdateSelectAlienMenu
struct AwHUD_Alien_UpdateSelectAlienMenu_Params
{
};

// Function WMission.wHUD_Alien.ChangeHudType
struct AwHUD_Alien_ChangeHudType_Params
{
	unsigned char                                      Type;                                                     // (Parm)
};

// Function WMission.wHUD_Alien.DrawAlienCoolTimeSkillSlot
struct AwHUD_Alien_DrawAlienCoolTimeSkillSlot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawAlienModeSkillSlot
struct AwHUD_Alien_DrawAlienModeSkillSlot_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawDisplaySelectAlienMenu
struct AwHUD_Alien_DrawDisplaySelectAlienMenu_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawObjectives
struct AwHUD_Alien_DrawObjectives_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawResultScore
struct AwHUD_Alien_DrawResultScore_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawSpectatingHud
struct AwHUD_Alien_DrawSpectatingHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawHudPassA_Score
struct AwHUD_Alien_DrawHudPassA_Score_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.IsPickupWeapon
struct AwHUD_Alien_IsPickupWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Alien.EnableWeaponSlot5Hud
struct AwHUD_Alien_EnableWeaponSlot5Hud_Params
{
	int                                                nWeaponID;                                                // (Parm)
};

// Function WMission.wHUD_Alien.DrawAlienDisplayBackScreen
struct AwHUD_Alien_DrawAlienDisplayBackScreen_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawHumanDisplayBackScreen
struct AwHUD_Alien_DrawHumanDisplayBackScreen_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawAlienDisplyHud
struct AwHUD_Alien_DrawAlienDisplyHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawSpecialModeIcon
struct AwHUD_Alien_DrawSpecialModeIcon_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
};

// Function WMission.wHUD_Alien.UpdateNameTagInfo
struct AwHUD_Alien_UpdateNameTagInfo_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AwPawn*                                      curPawn;                                                  // (Parm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
};

// Function WMission.wHUD_Alien.DrawNametagsScript
struct AwHUD_Alien_DrawNametagsScript_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bSpectateMode;                                            // (Parm)
	bool                                               drawAlways;                                               // (OptionalParm, Parm)
};

// Function WMission.wHUD_Alien.DrawHumanDisplyHud
struct AwHUD_Alien_DrawHumanDisplyHud_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawDisplaySelectMenu
struct AwHUD_Alien_DrawDisplaySelectMenu_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawBackScreen
struct AwHUD_Alien_DrawBackScreen_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawDisplayHUD
struct AwHUD_Alien_DrawDisplayHUD_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.CalculateHPBar
struct AwHUD_Alien_CalculateHPBar_Params
{
	bool                                               bDamage;                                                  // (Parm)
	bool                                               bRecovery;                                                // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHUD_Alien.DrawHpStamina
struct AwHUD_Alien_DrawHpStamina_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bShowSpectating;                                          // (OptionalParm, Parm)
};

// Function WMission.wHUD_Alien.DrawBackDisplayScreen
struct AwHUD_Alien_DrawBackDisplayScreen_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.DrawHudPassA
struct AwHUD_Alien_DrawHudPassA_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHUD_Alien.InitHudPart_SelQuickSlot
struct AwHUD_Alien_InitHudPart_SelQuickSlot_Params
{
};

// Function WMission.wHUD_Alien.Reset
struct AwHUD_Alien_Reset_Params
{
};

// Function WMission.wHUD_Alien.NotifyGRIChanged
struct AwHUD_Alien_NotifyGRIChanged_Params
{
};

// Function WMission.wHUD_Alien.PostBeginPlay
struct AwHUD_Alien_PostBeginPlay_Params
{
};

// Function WMission.wMSGameReplicationInfo.IsGhostChatting
struct AwMSGameReplicationInfo_IsGhostChatting_Params
{
	class AActor*                                      Sender;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameReplicationInfo.GetRoundWinnerString
struct AwMSGameReplicationInfo_GetRoundWinnerString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wMSGameReplicationInfo.SetMaxLives
struct AwMSGameReplicationInfo_SetMaxLives_Params
{
	int                                                iMaxLives;                                                // (Parm)
};

// Function WMission.wMSGameReplicationInfo.GetMaxLives
struct AwMSGameReplicationInfo_GetMaxLives_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameReplicationInfo.IsDefender
struct AwMSGameReplicationInfo_IsDefender_Params
{
	unsigned char                                      Team;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameReplicationInfo.IsPracticeRound
struct AwMSGameReplicationInfo_IsPracticeRound_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameReplicationInfo.GetRemainingTime
struct AwMSGameReplicationInfo_GetRemainingTime_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameReplicationInfo.Timer
struct AwMSGameReplicationInfo_Timer_Params
{
};

// Function WMission.wMSGameReplicationInfo.SetupAssaultObjectivePriority
struct AwMSGameReplicationInfo_SetupAssaultObjectivePriority_Params
{
};

// Function WMission.wMSGameReplicationInfo.PostNetBeginPlay
struct AwMSGameReplicationInfo_PostNetBeginPlay_Params
{
};

// Function WMission.wMSGameReplicationInfo.PreBeginPlay
struct AwMSGameReplicationInfo_PreBeginPlay_Params
{
};

// Function WMission.wScoreBoard_Mission.DrawTeam
struct AwScoreBoard_Mission_DrawTeam_Params
{
	int                                                TeamNum;                                                  // (Parm)
	int                                                PlayerCount;                                              // (Parm)
	int                                                OwnerOffset;                                              // (Parm)
	class UCanvas*                                     Canvas;                                                   // (Parm)
	int                                                FontReduction;                                            // (Parm)
	int                                                BoxSpaceY;                                                // (Parm)
	int                                                PlayerBoxSizeY;                                           // (Parm)
	int                                                HeaderOffsetY;                                            // (Parm)
};

// Function WMission.wScoreBoard_Mission.GetDefaultScoreInfoString
struct AwScoreBoard_Mission_GetDefaultScoreInfoString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wScoreBoard_Mission.GetRestartString
struct AwScoreBoard_Mission_GetRestartString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wScoreBoard_Mission.GetTitleString
struct AwScoreBoard_Mission_GetTitleString_Params
{
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wInfoPod.DrawInfoPod_Texture
struct AwInfoPod_DrawInfoPod_Texture_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     IPScrO;                                                   // (Parm)
};

// Function WMission.wInfoPod.DrawInfoPod_TextBrackets
struct AwInfoPod_DrawInfoPod_TextBrackets_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     IPScrO;                                                   // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WMission.wInfoPod.DrawInfoPod_PlainText
struct AwInfoPod_DrawInfoPod_PlainText_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     IPScreenPos;                                              // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WMission.wInfoPod.Render
struct AwInfoPod_Render_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     IPScreenPos;                                              // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WMission.wInfoPod.IsInfoPodVisible
struct AwInfoPod_IsInfoPodVisible_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APawn*                                       P;                                                        // (Parm)
	struct FVector                                     camLoc;                                                   // (Parm)
	struct FRotator                                    camRot;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wInfoPod.Reset
struct AwInfoPod_Reset_Params
{
};

// Function WMission.wInfoPod.Trigger
struct AwInfoPod_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function WMission.wInfoPod.PostBeginPlay
struct AwInfoPod_PostBeginPlay_Params
{
};

// Function WMission.wTrigger_MSMessageTrigger.PrecacheAnnouncer
struct AwTrigger_MSMessageTrigger_PrecacheAnnouncer_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function WMission.wTrigger_MSMessageTrigger.GetTeamNum
struct AwTrigger_MSMessageTrigger_GetTeamNum_Params
{
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wTrigger_MSMessageTrigger.Trigger
struct AwTrigger_MSMessageTrigger_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function WMission.wObjectivePointingArrow.Render
struct AwObjectivePointingArrow_Render_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class APlayerController*                           PC;                                                       // (Parm)
	class AActor*                                      TrackedActor;                                             // (Parm)
};

// Function WMission.wObjectivePointingArrow.SetYellowColor
struct AwObjectivePointingArrow_SetYellowColor_Params
{
	bool                                               bPulse;                                                   // (Parm)
};

// Function WMission.wObjectivePointingArrow.SetTeamSkin
struct AwObjectivePointingArrow_SetTeamSkin_Params
{
	unsigned char                                      Team;                                                     // (Parm)
	bool                                               bPulse;                                                   // (Parm)
};

// Function WMission.wMSGameInfo.AddGameSpecificActions
struct AwMSGameInfo_AddGameSpecificActions_Params
{
	TArray<class UwAction*>                            Actions;                                                  // (Parm, OutParm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.DoProcessKillMessage
struct AwMSGameInfo_DoProcessKillMessage_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetTotalPlayedTime
struct AwMSGameInfo_GetTotalPlayedTime_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetBootySeedValue
struct AwMSGameInfo_GetBootySeedValue_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.CheckScore
struct AwMSGameInfo_CheckScore_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
};

// Function WMission.wMSGameInfo.CheckLastMan
struct AwMSGameInfo_CheckLastMan_Params
{
	int                                                TeamIndex;                                                // (Parm)
};

// Function WMission.wMSGameInfo.CheckMaxLives
struct AwMSGameInfo_CheckMaxLives_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.EndGameByTeamNoneLeft
struct AwMSGameInfo_EndGameByTeamNoneLeft_Params
{
	class APlayerReplicationInfo*                      Living;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.LeaveLogOtherTeamNoneLeft
struct AwMSGameInfo_LeaveLogOtherTeamNoneLeft_Params
{
	class APlayerReplicationInfo*                      Living;                                                   // (Parm)
};

// Function WMission.wMSGameInfo.lll
struct AwMSGameInfo_lll_Params
{
};

// Function WMission.wMSGameInfo.FindLiving
struct AwMSGameInfo_FindLiving_Params
{
	class APlayerReplicationInfo*                      Living;                                                   // (Parm, OutParm)
	unsigned char                                      bOtherTeamNoneLeft;                                       // (Parm, OutParm)
};

// Function WMission.wMSGameInfo.AllowBecomeActivePlayer
struct AwMSGameInfo_AllowBecomeActivePlayer_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.IsRightTimeForRespawn
struct AwMSGameInfo_IsRightTimeForRespawn_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.IsRespawnRestrictionTime
struct AwMSGameInfo_IsRespawnRestrictionTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.AllowMutator
struct AwMSGameInfo_AllowMutator_Params
{
	struct FString                                     MutatorClassName;                                         // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetDescriptionText
struct AwMSGameInfo_GetDescriptionText_Params
{
	struct FString                                     PropName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.FillPlayInfo
struct AwMSGameInfo_FillPlayInfo_Params
{
	class UPlayInfo*                                   PlayInfo;                                                 // (Parm)
};

// Function WMission.wMSGameInfo.AcceptPlayInfoProperty
struct AwMSGameInfo_AcceptPlayInfoProperty_Params
{
	struct FString                                     PropertyName;                                             // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetServerDetails
struct AwMSGameInfo_GetServerDetails_Params
{
	struct FServerResponseLine                         ServerState;                                              // (Parm, OutParm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.UpdateAnnouncements
struct AwMSGameInfo_UpdateAnnouncements_Params
{
};

// Function WMission.wMSGameInfo.PrecacheGameAnnouncements
struct AwMSGameInfo_PrecacheGameAnnouncements_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function WMission.wMSGameInfo.QueueAnnouncerSound
struct AwMSGameInfo_QueueAnnouncerSound_Params
{
	struct FString                                     ASound;                                                   // (Parm, NeedCtorLink)
	unsigned char                                      AnnouncementLevel;                                        // (Parm)
	unsigned char                                      Team;                                                     // (Parm)
	TEnumAsByte<EAPriority>                            Priority;                                                 // (OptionalParm, Parm)
	unsigned char                                      Switch;                                                   // (OptionalParm, Parm)
};

// Function WMission.wMSGameInfo.AdjustDestroyObjectiveDamage
struct AwMSGameInfo_AdjustDestroyObjectiveDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class AController*                                 instigatedBy;                                             // (Parm)
	class AGameObjective*                              Go;                                                       // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.ReduceDamage
struct AwMSGameInfo_ReduceDamage_Params
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

// Function WMission.wMSGameInfo.SetObjectiveSetted
struct AwMSGameInfo_SetObjectiveSetted_Params
{
	class APawn*                                       TP;                                                       // (Parm)
	struct FName                                       ObjectTag;                                                // (Parm)
	struct FVector                                     FlagLocation;                                             // (Parm)
};

// Function WMission.wMSGameInfo.GetRemainingTime
struct AwMSGameInfo_GetRemainingTime_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.SetRemainingTime
struct AwMSGameInfo_SetRemainingTime_Params
{
	int                                                remain;                                                   // (Parm)
};

// Function WMission.wMSGameInfo.FindPlayerStart
struct AwMSGameInfo_FindPlayerStart_Params
{
	class AController*                                 Player;                                                   // (Parm)
	unsigned char                                      inTeam;                                                   // (OptionalParm, Parm)
	struct FString                                     incomingName;                                             // (OptionalParm, Parm, NeedCtorLink)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetPlayerStartTeam
struct AwMSGameInfo_GetPlayerStartTeam_Params
{
	class ANavigationPoint*                            N;                                                        // (Parm)
	int                                                Team;                                                     // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetDefaultPlayerClass
struct AwMSGameInfo_GetDefaultPlayerClass_Params
{
	class AController*                                 C;                                                        // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.AddDefaultInventory
struct AwMSGameInfo_AddDefaultInventory_Params
{
	class APawn*                                       PlayerPawn;                                               // (Parm)
};

// Function WMission.wMSGameInfo.RestartPlayer
struct AwMSGameInfo_RestartPlayer_Params
{
	class AController*                                 aPlayer;                                                  // (Parm)
};

// Function WMission.wMSGameInfo.ForceRestartPlayer
struct AwMSGameInfo_ForceRestartPlayer_Params
{
	class AController*                                 aPlayer;                                                  // (Parm)
};

// Function WMission.wMSGameInfo.TeamScoreEvent
struct AwMSGameInfo_TeamScoreEvent_Params
{
	int                                                Team;                                                     // (Parm)
	float                                              Points;                                                   // (Parm)
	struct FString                                     Desc;                                                     // (Parm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.ScoreEvent
struct AwMSGameInfo_ScoreEvent_Params
{
	class APlayerReplicationInfo*                      Who;                                                      // (Parm)
	float                                              Points;                                                   // (Parm)
	struct FString                                     Desc;                                                     // (Parm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.KillEvent
struct AwMSGameInfo_KillEvent_Params
{
	struct FString                                     KillType;                                                 // (Parm, NeedCtorLink)
	class APlayerReplicationInfo*                      Killer;                                                   // (Parm)
	class APlayerReplicationInfo*                      Victim;                                                   // (Parm)
	class UClass*                                      Damage;                                                   // (Parm)
};

// Function WMission.wMSGameInfo.SpecialEvent
struct AwMSGameInfo_SpecialEvent_Params
{
	class APlayerReplicationInfo*                      Who;                                                      // (Parm)
	struct FString                                     Desc;                                                     // (Parm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.CriticalPlayer
struct AwMSGameInfo_CriticalPlayer_Params
{
	class AController*                                 Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.VehicleScoreKill
struct AwMSGameInfo_VehicleScoreKill_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class AVehicle*                                    DestroyedVehicle;                                         // (Parm)
	struct FString                                     KillInfo;                                                 // (Parm, OutParm, NeedCtorLink)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.Killed
struct AwMSGameInfo_Killed_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function WMission.wMSGameInfo.TeleportPlayerToSpawn
struct AwMSGameInfo_TeleportPlayerToSpawn_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WMission.wMSGameInfo.NoTranslocatorKeyPressed
struct AwMSGameInfo_NoTranslocatorKeyPressed_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WMission.wMSGameInfo.NewSpawnAreaEnabled
struct AwMSGameInfo_NewSpawnAreaEnabled_Params
{
	bool                                               bDefenders;                                               // (Parm)
};

// Function WMission.wMSGameInfo.CanDisableObjective
struct AwMSGameInfo_CanDisableObjective_Params
{
	class AGameObjective*                              Go;                                                       // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.NeedToRespawnSD
struct AwMSGameInfo_NeedToRespawnSD_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.IsPlaying
struct AwMSGameInfo_IsPlaying_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.IsPracticeRound
struct AwMSGameInfo_IsPracticeRound_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.IsPlayingIntro
struct AwMSGameInfo_IsPlayingIntro_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetDefenderNum
struct AwMSGameInfo_GetDefenderNum_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.GetAttackingTeam
struct AwMSGameInfo_GetAttackingTeam_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.IsAttackingTeam
struct AwMSGameInfo_IsAttackingTeam_Params
{
	int                                                TeamNumber;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.BeginNewPairOfRounds
struct AwMSGameInfo_BeginNewPairOfRounds_Params
{
};

// Function WMission.wMSGameInfo.BeginRound
struct AwMSGameInfo_BeginRound_Params
{
	bool                                               bNoReset;                                                 // (OptionalParm, Parm)
};

// Function WMission.wMSGameInfo.DestoryPawns
struct AwMSGameInfo_DestoryPawns_Params
{
};

// Function WMission.wMSGameInfo.ProcessSwitchTeam
struct AwMSGameInfo_ProcessSwitchTeam_Params
{
	bool                                               bNoReset;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.SetRoundTimeLimit
struct AwMSGameInfo_SetRoundTimeLimit_Params
{
};

// Function WMission.wMSGameInfo.InitializeGameInfo
struct AwMSGameInfo_InitializeGameInfo_Params
{
	bool                                               bNoReset;                                                 // (Parm)
	bool                                               bChangeTeam;                                              // (Parm)
};

// Function WMission.wMSGameInfo.AnnounceSwitchTeam
struct AwMSGameInfo_AnnounceSwitchTeam_Params
{
};

// Function WMission.wMSGameInfo.NewRoundSwitchTeam
struct AwMSGameInfo_NewRoundSwitchTeam_Params
{
};

// Function WMission.wMSGameInfo.ResetLevel
struct AwMSGameInfo_ResetLevel_Params
{
	bool                                               hiddenAll;                                                // (OptionalParm, Parm)
};

// Function WMission.wMSGameInfo.StartNewRound
struct AwMSGameInfo_StartNewRound_Params
{
};

// Function WMission.wMSGameInfo.NewRound
struct AwMSGameInfo_NewRound_Params
{
};

// Function WMission.wMSGameInfo.AnnounceScore
struct AwMSGameInfo_AnnounceScore_Params
{
	int                                                ScoringTeam;                                              // (Parm)
};

// Function WMission.wMSGameInfo.SetRoundWinner
struct AwMSGameInfo_SetRoundWinner_Params
{
	int                                                WinningTeam;                                              // (Parm)
};

// Function WMission.wMSGameInfo.PracticeRoundEnded
struct AwMSGameInfo_PracticeRoundEnded_Params
{
};

// Function WMission.wMSGameInfo.IsRoundLimitReached
struct AwMSGameInfo_IsRoundLimitReached_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.EndRound
struct AwMSGameInfo_EndRound_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	class APawn*                                       Instigator;                                               // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.NotifyEndRound
struct AwMSGameInfo_NotifyEndRound_Params
{
};

// Function WMission.wMSGameInfo.NotifyBeginRound
struct AwMSGameInfo_NotifyBeginRound_Params
{
};

// Function WMission.wMSGameInfo.CalcRoundResultPoints
struct AwMSGameInfo_CalcRoundResultPoints_Params
{
	int                                                ScoringTeam;                                              // (Parm)
};

// Function WMission.wMSGameInfo.ProcessEndGame
struct AwMSGameInfo_ProcessEndGame_Params
{
};

// Function WMission.wMSGameInfo.PlayEndOfMatchMessage
struct AwMSGameInfo_PlayEndOfMatchMessage_Params
{
};

// Function WMission.wMSGameInfo.CheckEndGame
struct AwMSGameInfo_CheckEndGame_Params
{
	class APlayerReplicationInfo*                      Winner;                                                   // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.SceneStarted
struct AwMSGameInfo_SceneStarted_Params
{
	class ASceneManager*                               SM;                                                       // (Parm)
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WMission.wMSGameInfo.ProcessRespawn
struct AwMSGameInfo_ProcessRespawn_Params
{
};

// Function WMission.wMSGameInfo.ExplodeBomb
struct AwMSGameInfo_ExplodeBomb_Params
{
};

// Function WMission.wMSGameInfo.ProcessEndRound
struct AwMSGameInfo_ProcessEndRound_Params
{
};

// Function WMission.wMSGameInfo.GetTimeSecondsLeft
struct AwMSGameInfo_GetTimeSecondsLeft_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.CheckEndGameAfterRoundTimeOver
struct AwMSGameInfo_CheckEndGameAfterRoundTimeOver_Params
{
};

// Function WMission.wMSGameInfo.fEndRound
struct AwMSGameInfo_fEndRound_Params
{
	unsigned char                                      Team;                                                     // (Parm)
};

// Function WMission.wMSGameInfo.OnRoundTimeOverWithoutObjectPlanted
struct AwMSGameInfo_OnRoundTimeOverWithoutObjectPlanted_Params
{
};

// Function WMission.wMSGameInfo.BroadCast_AssaultRole_Message
struct AwMSGameInfo_BroadCast_AssaultRole_Message_Params
{
	class APlayerController*                           C;                                                        // (Parm)
};

// Function WMission.wMSGameInfo.GameObjectDropped
struct AwMSGameInfo_GameObjectDropped_Params
{
	class ADecoration*                                 D;                                                        // (Parm)
};

// Function WMission.wMSGameInfo.DiscardInventory
struct AwMSGameInfo_DiscardInventory_Params
{
	class APawn*                                       Other;                                                    // (Parm)
};

// Function WMission.wMSGameInfo.OnKillingDropOut
struct AwMSGameInfo_OnKillingDropOut_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WMission.wMSGameInfo.Logout
struct AwMSGameInfo_Logout_Params
{
	class AController*                                 Exiting;                                                  // (Parm)
};

// Function WMission.wMSGameInfo.InitGameReplicationInfo
struct AwMSGameInfo_InitGameReplicationInfo_Params
{
};

// Function WMission.wMSGameInfo.StartMatch
struct AwMSGameInfo_StartMatch_Params
{
};

// Function WMission.wMSGameInfo.StartMatchChangedHost
struct AwMSGameInfo_StartMatchChangedHost_Params
{
};

// Function WMission.wMSGameInfo.InitGameOption
struct AwMSGameInfo_InitGameOption_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.InitGame
struct AwMSGameInfo_InitGame_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
};

// Function WMission.wMSGameInfo.Login
struct AwMSGameInfo_Login_Params
{
	struct FString                                     Portal;                                                   // (Parm, NeedCtorLink)
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
	class APlayerController*                           ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.PostBeginPlay
struct AwMSGameInfo_PostBeginPlay_Params
{
};

// Function WMission.wMSGameInfo.ForceObjectiveDefenderTeamIndex
struct AwMSGameInfo_ForceObjectiveDefenderTeamIndex_Params
{
};

// Function WMission.wMSGameInfo.TweakSkill
struct AwMSGameInfo_TweakSkill_Params
{
	class ABot*                                        B;                                                        // (Parm)
};

// Function WMission.wMSGameInfo.NeverAllowTransloc
struct AwMSGameInfo_NeverAllowTransloc_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.AllowTransloc
struct AwMSGameInfo_AllowTransloc_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.DivertSpaceFighter
struct AwMSGameInfo_DivertSpaceFighter_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wMSGameInfo.CheckReady
struct AwMSGameInfo_CheckReady_Params
{
};

// Function WMission.wMSGameInfo.Reset
struct AwMSGameInfo_Reset_Params
{
};

// Function WMission.wGameObject_Bomb.PrecacheAnnouncer
struct AwGameObject_Bomb_PrecacheAnnouncer_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function WMission.wGameObject_Bomb.LogReturned
struct AwGameObject_Bomb_LogReturned_Params
{
};

// Function WMission.wGameObject_Bomb.HolderDied
struct AwGameObject_Bomb_HolderDied_Params
{
};

// Function WMission.wGameObject_Bomb.Landed
struct AwGameObject_Bomb_Landed_Params
{
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WMission.wGameObject_Bomb.Drop
struct AwGameObject_Bomb_Drop_Params
{
	struct FVector                                     NewVel;                                                   // (Parm)
	struct FString                                     sReason;                                                  // (OptionalParm, Parm, NeedCtorLink)
};

// Function WMission.wGameObject_Bomb.ProcessThrowMessage
struct AwGameObject_Bomb_ProcessThrowMessage_Params
{
};

// Function WMission.wGameObject_Bomb.ProcessDropMessage
struct AwGameObject_Bomb_ProcessDropMessage_Params
{
};

// Function WMission.wGameObject_Bomb.ClearHolder
struct AwGameObject_Bomb_ClearHolder_Params
{
};

// Function WMission.wGameObject_Bomb.SetHolder
struct AwGameObject_Bomb_SetHolder_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WMission.wGameObject_Bomb.ProcessSetHolderMessage
struct AwGameObject_Bomb_ProcessSetHolderMessage_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WMission.wGameObject_Bomb.OnSetHolder
struct AwGameObject_Bomb_OnSetHolder_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WMission.wGameObject_Bomb.ValidHolder
struct AwGameObject_Bomb_ValidHolder_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wGameObject_Bomb.PostBeginPlay
struct AwGameObject_Bomb_PostBeginPlay_Params
{
};

// Function WMission.wGameObject_Bomb.CanBePickedUpBy
struct AwGameObject_Bomb_CanBePickedUpBy_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSetObjective.SetActive
struct AwSetObjective_SetActive_Params
{
	bool                                               bActiveStatus;                                            // (Parm)
};

// Function WMission.wSetObjective.Reset
struct AwSetObjective_Reset_Params
{
};

// Function WMission.wSetObjective.RefreshState
struct AwSetObjective_RefreshState_Params
{
};

// Function WMission.wSetObjective.GetObjectiveProgress
struct AwSetObjective_GetObjectiveProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSetObjective.PlayerToucherDied
struct AwSetObjective_PlayerToucherDied_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WMission.wSetObjective.IsRelevant
struct AwSetObjective_IsRelevant_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               bAliveCheck;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSetObjective.UnTouch
struct AwSetObjective_UnTouch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WMission.wSetObjective.Touch
struct AwSetObjective_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WMission.wSetObjective.CanPlant
struct AwSetObjective_CanPlant_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSetObjective.IsPlanting
struct AwSetObjective_IsPlanting_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSetObjective.Tick
struct AwSetObjective_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WMission.wSetObjective.SetDefuseLocation
struct AwSetObjective_SetDefuseLocation_Params
{
	struct FVector                                     loc;                                                      // (Parm)
	struct FName                                       Tag;                                                      // (Parm)
};

// Function WMission.wSetObjective.UsedBy
struct AwSetObjective_UsedBy_Params
{
	class APawn*                                       User;                                                     // (Parm)
};

// Function WMission.wSetObjective.PreBeginPlay
struct AwSetObjective_PreBeginPlay_Params
{
};

// Function WMission.wDiffuseObjective.Reset
struct AwDiffuseObjective_Reset_Params
{
};

// Function WMission.wDiffuseObjective.RefreshState
struct AwDiffuseObjective_RefreshState_Params
{
};

// Function WMission.wDiffuseObjective.GetObjectiveProgress
struct AwDiffuseObjective_GetObjectiveProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wDiffuseObjective.PlayerToucherDied
struct AwDiffuseObjective_PlayerToucherDied_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WMission.wDiffuseObjective.IsRelevant
struct AwDiffuseObjective_IsRelevant_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               bAliveCheck;                                              // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wDiffuseObjective.UnTouch
struct AwDiffuseObjective_UnTouch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WMission.wDiffuseObjective.Touch
struct AwDiffuseObjective_Touch_Params
{
	class AActor*                                      Other;                                                    // (Parm)
};

// Function WMission.wDiffuseObjective.CanDefuse
struct AwDiffuseObjective_CanDefuse_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wDiffuseObjective.IsDefusing
struct AwDiffuseObjective_IsDefusing_Params
{
	class APawn*                                       P;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wDiffuseObjective.Tick
struct AwDiffuseObjective_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WMission.wDiffuseObjective.PlayBombDefusedMessage
struct AwDiffuseObjective_PlayBombDefusedMessage_Params
{
	class APawn*                                       TP;                                                       // (Parm)
};

// Function WMission.wDiffuseObjective.OnBombDiffused
struct AwDiffuseObjective_OnBombDiffused_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WMission.wDiffuseObjective.UpdateBombs
struct AwDiffuseObjective_UpdateBombs_Params
{
};

// Function WMission.wDiffuseObjective.SetBombVisibility
struct AwDiffuseObjective_SetBombVisibility_Params
{
	bool                                               val;                                                      // (Parm)
};

// Function WMission.wDiffuseObjective.UsedBy
struct AwDiffuseObjective_UsedBy_Params
{
	class APawn*                                       User;                                                     // (Parm)
};

// Function WMission.wDiffuseObjective.PreBeginPlay
struct AwDiffuseObjective_PreBeginPlay_Params
{
};

// Function WMission.wObjectiveProgressDisplay.GetObjectiveDescription
struct AwObjectiveProgressDisplay_GetObjectiveDescription_Params
{
	class AGameObjective*                              Go;                                                       // (Parm)
	bool                                               bDefender;                                                // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wObjectiveProgressDisplay.SetObjectiveColor
struct AwObjectiveProgressDisplay_SetObjectiveColor_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	class AGameObjective*                              Go;                                                       // (Parm)
};

// Function WMission.wObjectiveProgressDisplay.AnyOptionalObjectiveCritical
struct AwObjectiveProgressDisplay_AnyOptionalObjectiveCritical_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wObjectiveProgressDisplay.AnyPrimaryObjectivesCritical
struct AwObjectiveProgressDisplay_AnyPrimaryObjectivesCritical_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wObjectiveProgressDisplay.GetGlobalObjectiveProgress
struct AwObjectiveProgressDisplay_GetGlobalObjectiveProgress_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wObjectiveProgressDisplay.GetPrimaryObjectiveCount
struct AwObjectiveProgressDisplay_GetPrimaryObjectiveCount_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wObjectiveProgressDisplay.DrawBigCurrentObjective
struct AwObjectiveProgressDisplay_DrawBigCurrentObjective_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	bool                                               bDefender;                                                // (Parm)
	bool                                               bCheckOverlap;                                            // (Parm)
};

// Function WMission.wObjectiveProgressDisplay.CheckEntry
struct AwObjectiveProgressDisplay_CheckEntry_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FString                                     Entry;                                                    // (Parm, NeedCtorLink)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wObjectiveProgressDisplay.DrawObjectives
struct AwObjectiveProgressDisplay_DrawObjectives_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	struct FVector                                     BoxPivot;                                                 // (Parm)
	bool                                               bDefender;                                                // (Parm)
	bool                                               bGetBoxSize;                                              // (Parm)
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wObjectiveProgressDisplay.PostRender
struct AwObjectiveProgressDisplay_PostRender_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
	float                                              DeltaTime;                                                // (Parm)
	bool                                               bDefender;                                                // (Parm)
};

// Function WMission.wObjectiveProgressDisplay.Initialize
struct AwObjectiveProgressDisplay_Initialize_Params
{
	class AwHUD_Mission*                               H;                                                        // (Parm)
};

// Function WMission.wObjectiveProgressDisplay.UpdateSlideScale
struct AwObjectiveProgressDisplay_UpdateSlideScale_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WMission.wObjectiveProgressDisplay.ShowStatus
struct AwObjectiveProgressDisplay_ShowStatus_Params
{
	bool                                               bShow;                                                    // (Parm)
};

// Function WMission.wAlienController.ReceiveMessage_QuestType4
struct AwAlienController_ReceiveMessage_QuestType4_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	int                                                iRDifficult;                                              // (OptionalParm, Parm)
	int                                                iRRound;                                                  // (OptionalParm, Parm)
};

// Function WMission.wAlienController.ReceiveMessage_QuestType3
struct AwAlienController_ReceiveMessage_QuestType3_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	int                                                iRDifficult;                                              // (OptionalParm, Parm)
	int                                                iRMap;                                                    // (OptionalParm, Parm)
};

// Function WMission.wAlienController.ReceiveMessage_QuestType2
struct AwAlienController_ReceiveMessage_QuestType2_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	int                                                iRMode;                                                   // (OptionalParm, Parm)
	int                                                iRMap;                                                    // (OptionalParm, Parm)
	int                                                iRMin;                                                    // (OptionalParm, Parm)
	int                                                iRSec;                                                    // (OptionalParm, Parm)
};

// Function WMission.wAlienController.ReceiveMessage_QuestType1
struct AwAlienController_ReceiveMessage_QuestType1_Params
{
	class UClass*                                      Message;                                                  // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	int                                                iRWeaponType;                                             // (OptionalParm, Parm)
	int                                                iRweaponId;                                               // (OptionalParm, Parm)
};

// Function WMission.wAlienController.ConsoleTakeHit
struct AwAlienController_ConsoleTakeHit_Params
{
};

// Function WMission.wAlienController.ClientCoolTimeSkillObject
struct AwAlienController_ClientCoolTimeSkillObject_Params
{
	int                                                iSkillID;                                                 // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienController.ClientCallCoolTimeSkill
struct AwAlienController_ClientCallCoolTimeSkill_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WMission.wAlienController.ClientReadyCoolTimeSkill
struct AwAlienController_ClientReadyCoolTimeSkill_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WMission.wAlienController.ProcessUseKey
struct AwAlienController_ProcessUseKey_Params
{
};

// Function WMission.wAlienController.AttackedView
struct AwAlienController_AttackedView_Params
{
	int                                                iWeaponID;                                                // (Parm)
	float                                              fHitGunKick;                                              // (Parm)
	struct FVector                                     vAttacked;                                                // (Parm)
};

// Function WMission.wAlienController.ClientChangeTeam
struct AwAlienController_ClientChangeTeam_Params
{
	unsigned char                                      InvertSideID;                                             // (Parm)
};

// Function WMission.wAlienController.ClientQuickRepairByAlien
struct AwAlienController_ClientQuickRepairByAlien_Params
{
	int                                                PlayerID;                                                 // (Parm)
};

// Function WMission.wAlienController.ClientUpdateDefSuccessFromInfection
struct AwAlienController_ClientUpdateDefSuccessFromInfection_Params
{
	int                                                PlayerID;                                                 // (Parm)
};

// Function WMission.wAlienController.ClientUpdateLevelup
struct AwAlienController_ClientUpdateLevelup_Params
{
	unsigned char                                      byAttackLevelIndex;                                       // (Parm)
};

// Function WMission.wAlienController.ClientUpdate3rdModel
struct AwAlienController_ClientUpdate3rdModel_Params
{
	int                                                PlayerID;                                                 // (Parm)
	TEnumAsByte<EAlienModeType>                        eType;                                                    // (Parm)
	unsigned char                                      bySkinID;                                                 // (Parm)
};

// Function WMission.wAlienController.PlayerTick
struct AwAlienController_PlayerTick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WMission.wAlienController.ServerChangePawn
struct AwAlienController_ServerChangePawn_Params
{
	unsigned char                                      bySkinID;                                                 // (Parm)
};

// Function WMission.wAlienController.ServerSetBase
struct AwAlienController_ServerSetBase_Params
{
};

// Function WMission.wAlienController.OnEndRound
struct AwAlienController_OnEndRound_Params
{
};

// Function WMission.wAlienController.SelectRadioMessage
struct AwAlienController_SelectRadioMessage_Params
{
	int                                                iKey;                                                     // (Parm)
};

// Function WMission.wAlienController.ClientChangeKnockBackState
struct AwAlienController_ClientChangeKnockBackState_Params
{
	struct FVector                                     _vKnockBackDir;                                           // (Parm)
	float                                              _fKnockBackTime;                                          // (Parm)
	float                                              _fKnockBackMomentum;                                      // (Parm)
};

// Function WMission.wAlienController.NotifyTakeHit
struct AwAlienController_NotifyTakeHit_Params
{
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                Damage;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WMission.wAlienController.CallCoolTimeSkill
struct AwAlienController_CallCoolTimeSkill_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WMission.wAlienController.ServerUse
struct AwAlienController_ServerUse_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienController.UpdateHitMoveEffectFromWeapon
struct AwAlienController_UpdateHitMoveEffectFromWeapon_Params
{
	class UwWeaponBaseParams*                          WBP;                                                      // (Parm)
};

// Function WMission.wAlienController.GetHitGunKick
struct AwAlienController_GetHitGunKick_Params
{
	class UwWeaponBaseParams*                          WBP;                                                      // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienController.GetObjType
struct AwAlienController_GetObjType_Params
{
	TEnumAsByte<EAlienModeType>                        ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienController.UnPossess
struct AwAlienController_UnPossess_Params
{
};

// Function WMission.wAlienController.ChangeTeam
struct AwAlienController_ChangeTeam_Params
{
	int                                                N;                                                        // (Parm)
};

// Function WMission.wAlienController.UpdateHPValue
struct AwAlienController_UpdateHPValue_Params
{
	unsigned char                                      bySkinID;                                                 // (Parm)
	TEnumAsByte<EAlienModeType>                        eObjType;                                                 // (Parm)
};

// Function WMission.wAlienController.SetAlienModeType
struct AwAlienController_SetAlienModeType_Params
{
	TEnumAsByte<EAlienModeType>                        eType;                                                    // (Parm)
};

// Function WMission.wAlienController.PawnItemList
struct AwAlienController_PawnItemList_Params
{
};

// Function WMission.wAlienController.ClientReset
struct AwAlienController_ClientReset_Params
{
};

// Function WMission.wAlienController.ClientOnEndWaitingForStart
struct AwAlienController_ClientOnEndWaitingForStart_Params
{
};

// Function WMission.wAlienController.Possess
struct AwAlienController_Possess_Params
{
	class APawn*                                       aPawn;                                                    // (Parm)
};

// Function WMission.wAlienController.GetInfectionLevel
struct AwAlienController_GetInfectionLevel_Params
{
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienController.AddInfectionLevel
struct AwAlienController_AddInfectionLevel_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienController.RemoveSkill_Client
struct AwAlienController_RemoveSkill_Client_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WMission.wAlienController.AddSkill_Client
struct AwAlienController_AddSkill_Client_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WMission.wAlienController.AddSkill
struct AwAlienController_AddSkill_Params
{
	int                                                iSkillID;                                                 // (Parm)
};

// Function WMission.wAlienController.ClientRoundEnded
struct AwAlienController_ClientRoundEnded_Params
{
};

// Function WMission.wAlienController.LocalSetPrecached
struct AwAlienController_LocalSetPrecached_Params
{
};

// Function WMission.wAlienGameReplicationInfo.Reset
struct AwAlienGameReplicationInfo_Reset_Params
{
};

// Function WMission.wAlienGameReplicationInfo.IsCanRespawnTime
struct AwAlienGameReplicationInfo_IsCanRespawnTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameReplicationInfo.GetAttackLevelIndex
struct AwAlienGameReplicationInfo_GetAttackLevelIndex_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameReplicationInfo.GetCurTeamMemberCount
struct AwAlienGameReplicationInfo_GetCurTeamMemberCount_Params
{
	int                                                TeamIndex;                                                // (Parm)
	unsigned char                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameReplicationInfo.GetMaxRound
struct AwAlienGameReplicationInfo_GetMaxRound_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameReplicationInfo.GetCurAlienModeWaitingTimeCount
struct AwAlienGameReplicationInfo_GetCurAlienModeWaitingTimeCount_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameReplicationInfo.GetStartPlayerCountOfCurRound
struct AwAlienGameReplicationInfo_GetStartPlayerCountOfCurRound_Params
{
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHudPart_MinimapAlienGame.IsSameTeamByPRI
struct AwHudPart_MinimapAlienGame_IsSameTeamByPRI_Params
{
	class APlayerReplicationInfo*                      pri1;                                                     // (Parm)
	class APlayerReplicationInfo*                      pri2;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wHudPart_MinimapAlienGame.DrawMinimap_Allies
struct AwHudPart_MinimapAlienGame_DrawMinimap_Allies_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wHudPart_MinimapAlienGame.DrawMinimap_SpecialPositions
struct AwHudPart_MinimapAlienGame_DrawMinimap_SpecialPositions_Params
{
	class UCanvas*                                     C;                                                        // (Parm)
};

// Function WMission.wAMPawn.Tick
struct AwAMPawn_Tick_Params
{
	float                                              DeltaTime;                                                // (Parm)
};

// Function WMission.wAMPawn.PlayDying
struct AwAMPawn_PlayDying_Params
{
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLoc;                                                   // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.UpdateCriticalState
struct AwAMPawn_UpdateCriticalState_Params
{
};

// Function WMission.wAMPawn.GiveHealth
struct AwAMPawn_GiveHealth_Params
{
	int                                                HealAmount;                                               // (Parm)
	int                                                HealMax;                                                  // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAMPawn.ChangeCollisionSize
struct AwAMPawn_ChangeCollisionSize_Params
{
	float                                              fRadius;                                                  // (Parm)
	float                                              fHeight;                                                  // (Parm)
};

// Function WMission.wAMPawn.PlayDirectionalHit
struct AwAMPawn_PlayDirectionalHit_Params
{
	struct FVector                                     HitLoc;                                                   // (Parm)
	bool                                               bUseHitStun;                                              // (OptionalParm, Parm)
	bool                                               bGoreChange;                                              // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.PlayBreathSounds
struct AwAMPawn_PlayBreathSounds_Params
{
};

// Function WMission.wAMPawn.TakeDamageSound
struct AwAMPawn_TakeDamageSound_Params
{
	int                                                LeftHealth;                                               // (Parm)
	int                                                ActualDamage;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	class AController*                                 Killer;                                                   // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.GetDelayedInstigatorController
struct AwAMPawn_GetDelayedInstigatorController_Params
{
	class APawn*                                       instigatedBy;                                             // (Parm)
	class AController*                                 ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAMPawn.ChangeModel
struct AwAMPawn_ChangeModel_Params
{
};

// Function WMission.wAMPawn.ClientChangeModelType
struct AwAMPawn_ClientChangeModelType_Params
{
	TEnumAsByte<EAlienModeType>                        eObjType;                                                 // (Parm)
};

// Function WMission.wAMPawn.ChangeModelType
struct AwAMPawn_ChangeModelType_Params
{
	TEnumAsByte<EAlienModeType>                        eObjType;                                                 // (Parm)
};

// Function WMission.wAMPawn.PlayHit
struct AwAMPawn_PlayHit_Params
{
	float                                              Damage;                                                   // (Parm)
	class APawn*                                       instigatedBy;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.CalcItemUsedTime
struct AwAMPawn_CalcItemUsedTime_Params
{
	class UwMatchUserInfo*                             kUser;                                                    // (Parm)
};

// Function WMission.wAMPawn.PossessedBy
struct AwAMPawn_PossessedBy_Params
{
	class AController*                                 C;                                                        // (Parm)
};

// Function WMission.wAMPawn.Setup
struct AwAMPawn_Setup_Params
{
	struct FPlayerRecord                               Rec;                                                      // (Parm, NeedCtorLink)
	bool                                               bLoadNow;                                                 // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.ClientReStart
struct AwAMPawn_ClientReStart_Params
{
};

// Function WMission.wAMPawn.MakeDefecneSuccessEffect
struct AwAMPawn_MakeDefecneSuccessEffect_Params
{
};

// Function WMission.wAMPawn.MakeAttackLevelEffect
struct AwAMPawn_MakeAttackLevelEffect_Params
{
	unsigned char                                      byAttackLevelIndex;                                       // (Parm)
};

// Function WMission.wAMPawn.MakeShieldEffect
struct AwAMPawn_MakeShieldEffect_Params
{
};

// Function WMission.wAMPawn.CallEffect_PHJ
struct AwAMPawn_CallEffect_PHJ_Params
{
};

// Function WMission.wAMPawn.MakeTransformEffect
struct AwAMPawn_MakeTransformEffect_Params
{
};

// Function WMission.wAMPawn.Destroyed
struct AwAMPawn_Destroyed_Params
{
};

// Function WMission.wAMPawn.ProcessHitFX
struct AwAMPawn_ProcessHitFX_Params
{
};

// Function WMission.wAMPawn.UpdateDied
struct AwAMPawn_UpdateDied_Params
{
	int                                                ActualDamage;                                             // (Parm)
	class AController*                                 Killer;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.Process_TossWeapon_When_Dying
struct AwAMPawn_Process_TossWeapon_When_Dying_Params
{
	class ALevelInfo*                                  levenInfo;                                                // (Parm)
	class APawn*                                       Pawn;                                                     // (Parm)
	class AwWeapon*                                    Weapon;                                                   // (Parm)
};

// Function WMission.wAMPawn.TakeDamage
struct AwAMPawn_TakeDamage_Params
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

// Function WMission.wAMPawn.ServerChangedWeapon
struct AwAMPawn_ServerChangedWeapon_Params
{
	class AwWeapon*                                    OldWeapon;                                                // (Parm)
	class AwWeapon*                                    newWeapon;                                                // (Parm)
};

// Function WMission.wAMPawn.ClientPickupWeapon
struct AwAMPawn_ClientPickupWeapon_Params
{
};

// Function WMission.wAMPawn.ChangedWeapon
struct AwAMPawn_ChangedWeapon_Params
{
};

// Function WMission.wAMPawn.AddDefaultSkills
struct AwAMPawn_AddDefaultSkills_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.AddDefaultInventory
struct AwAMPawn_AddDefaultInventory_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.PlayMelee
struct AwAMPawn_PlayMelee_Params
{
	bool                                               bMeleeKnifeOrButt;                                        // (Parm)
};

// Function WMission.wAMPawn.StartFiring
struct AwAMPawn_StartFiring_Params
{
	bool                                               bHeavy;                                                   // (Parm)
	bool                                               bRapid;                                                   // (Parm)
};

// Function WMission.wAMPawn.GetBloodHitClass
struct AwAMPawn_GetBloodHitClass_Params
{
	bool                                               bHeadShot;                                                // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAMPawn.GetSprintJumpZ
struct AwAMPawn_GetSprintJumpZ_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAMPawn.Alien_PlayBreathSound
struct AwAMPawn_Alien_PlayBreathSound_Params
{
};

// Function WMission.wAMPawn.Alien_TakeDamageSound
struct AwAMPawn_Alien_TakeDamageSound_Params
{
	int                                                LeftHealth;                                               // (Parm)
	int                                                ActualDamage;                                             // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	class AController*                                 Killer;                                                   // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.Alien_GetBloodHitClass
struct AwAMPawn_Alien_GetBloodHitClass_Params
{
	bool                                               bHeadShot;                                                // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAMPawn.Alien_ClientPickupWeapon
struct AwAMPawn_Alien_ClientPickupWeapon_Params
{
};

// Function WMission.wAMPawn.Alien_GetBaseStaminaTime
struct AwAMPawn_Alien_GetBaseStaminaTime_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAMPawn.Alien_GetSprintJumpZ
struct AwAMPawn_Alien_GetSprintJumpZ_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAMPawn.Alien_ServerChangedWeapon
struct AwAMPawn_Alien_ServerChangedWeapon_Params
{
	class AwWeapon*                                    OldWeapon;                                                // (Parm)
	class AwWeapon*                                    newWeapon;                                                // (Parm)
};

// Function WMission.wAMPawn.Alien_ChangedWeapon
struct AwAMPawn_Alien_ChangedWeapon_Params
{
};

// Function WMission.wAMPawn.Alien_PlayDefence
struct AwAMPawn_Alien_PlayDefence_Params
{
};

// Function WMission.wAMPawn.Alien_PlayMelee
struct AwAMPawn_Alien_PlayMelee_Params
{
	bool                                               bMeleeKnifeOrButt;                                        // (Parm)
};

// Function WMission.wAMPawn.Alien_StartFiring
struct AwAMPawn_Alien_StartFiring_Params
{
	bool                                               bHeavy;                                                   // (Parm)
	bool                                               bRapid;                                                   // (Parm)
};

// Function WMission.wAMPawn.Alien_TakeDamage
struct AwAMPawn_Alien_TakeDamage_Params
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

// Function WMission.wAMPawn.Alien_AddDefaultSkills
struct AwAMPawn_Alien_AddDefaultSkills_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.Alien_AddDefaultInventory
struct AwAMPawn_Alien_AddDefaultInventory_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.Alien_InitStatus
struct AwAMPawn_Alien_InitStatus_Params
{
};

// Function WMission.wAMPawn.Human_ClientPickupWeapon
struct AwAMPawn_Human_ClientPickupWeapon_Params
{
};

// Function WMission.wAMPawn.Human_UpdateDied
struct AwAMPawn_Human_UpdateDied_Params
{
	int                                                ActualDamage;                                             // (Parm)
	class AController*                                 Killer;                                                   // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.Human_TakeDamage
struct AwAMPawn_Human_TakeDamage_Params
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

// Function WMission.wAMPawn.Human_AddDefaultSkills
struct AwAMPawn_Human_AddDefaultSkills_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WMission.wAMPawn.Human_AddDefaultInventory
struct AwAMPawn_Human_AddDefaultInventory_Params
{
	bool                                               bQuickslotChange;                                         // (OptionalParm, Parm)
};

// Function WMission.wAlienGameInfo.IsAnyPawnWithinRadius
struct AwAlienGameInfo_IsAnyPawnWithinRadius_Params
{
	class ANavigationPoint*                            N;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.CanSpectate
struct AwAlienGameInfo_CanSpectate_Params
{
	class APlayerController*                           Viewer;                                                   // (Parm)
	bool                                               bOnlySpectator;                                           // (Parm)
	class AActor*                                      ViewTarget;                                               // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.IsRightTimeForRespawn
struct AwAlienGameInfo_IsRightTimeForRespawn_Params
{
	class AController*                                 C;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.AlienGame_Levelup
struct AwAlienGameInfo_AlienGame_Levelup_Params
{
};

// Function WMission.wAlienGameInfo.AlienGame_Respawn
struct AwAlienGameInfo_AlienGame_Respawn_Params
{
	int                                                Num;                                                      // (Parm)
};

// Function WMission.wAlienGameInfo.AlienGame_TimeOver
struct AwAlienGameInfo_AlienGame_TimeOver_Params
{
};

// Function WMission.wAlienGameInfo.AlienGame_HumanWin
struct AwAlienGameInfo_AlienGame_HumanWin_Params
{
};

// Function WMission.wAlienGameInfo.AlienGame_AlienWin
struct AwAlienGameInfo_AlienGame_AlienWin_Params
{
};

// Function WMission.wAlienGameInfo.AlienGame_Exit
struct AwAlienGameInfo_AlienGame_Exit_Params
{
};

// Function WMission.wAlienGameInfo.GetWinTeamAD
struct AwAlienGameInfo_GetWinTeamAD_Params
{
	int                                                winTeam;                                                  // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.GetWinTeam
struct AwAlienGameInfo_GetWinTeam_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.GetRoundEndType
struct AwAlienGameInfo_GetRoundEndType_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.ServerLogEndRound
struct AwAlienGameInfo_ServerLogEndRound_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	class APawn*                                       Instigator;                                               // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function WMission.wAlienGameInfo.GetAttackBuff
struct AwAlienGameInfo_GetAttackBuff_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.NeedPlayers
struct AwAlienGameInfo_NeedPlayers_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.ProcessSwitchTeam
struct AwAlienGameInfo_ProcessSwitchTeam_Params
{
	bool                                               bNoReset;                                                 // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.FindAlienModeStart
struct AwAlienGameInfo_FindAlienModeStart_Params
{
	bool                                               bAlien;                                                   // (Parm)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.FindPlayerStart
struct AwAlienGameInfo_FindPlayerStart_Params
{
	class AController*                                 Player;                                                   // (Parm)
	unsigned char                                      inTeam;                                                   // (OptionalParm, Parm)
	struct FString                                     incomingName;                                             // (OptionalParm, Parm, NeedCtorLink)
	class ANavigationPoint*                            ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.InitializeEveryPlayerStarts
struct AwAlienGameInfo_InitializeEveryPlayerStarts_Params
{
};

// Function WMission.wAlienGameInfo.EndRound
struct AwAlienGameInfo_EndRound_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	class APawn*                                       Instigator;                                               // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function WMission.wAlienGameInfo.IsRoundLimitReached
struct AwAlienGameInfo_IsRoundLimitReached_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.ResetItemDrop
struct AwAlienGameInfo_ResetItemDrop_Params
{
};

// Function WMission.wAlienGameInfo.ExecuteItemDrop
struct AwAlienGameInfo_ExecuteItemDrop_Params
{
};

// Function WMission.wAlienGameInfo.InGameRoundEnd
struct AwAlienGameInfo_InGameRoundEnd_Params
{
};

// Function WMission.wAlienGameInfo.InGameAlienMode
struct AwAlienGameInfo_InGameAlienMode_Params
{
};

// Function WMission.wAlienGameInfo.InGameAppearAlien
struct AwAlienGameInfo_InGameAppearAlien_Params
{
};

// Function WMission.wAlienGameInfo.ProcessGameLogic
struct AwAlienGameInfo_ProcessGameLogic_Params
{
};

// Function WMission.wAlienGameInfo.CheckLives
struct AwAlienGameInfo_CheckLives_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.ReduceDamage
struct AwAlienGameInfo_ReduceDamage_Params
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

// Function WMission.wAlienGameInfo.CheckEndGameAfterRoundTimeOver
struct AwAlienGameInfo_CheckEndGameAfterRoundTimeOver_Params
{
};

// Function WMission.wAlienGameInfo.EndGameByTeamNoneLeft
struct AwAlienGameInfo_EndGameByTeamNoneLeft_Params
{
	class APlayerReplicationInfo*                      Living;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.CheckScore
struct AwAlienGameInfo_CheckScore_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
};

// Function WMission.wAlienGameInfo.CheckMaxLives
struct AwAlienGameInfo_CheckMaxLives_Params
{
	class APlayerReplicationInfo*                      Scorer;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.IsRespawnRestrictionTime
struct AwAlienGameInfo_IsRespawnRestrictionTime_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.CheckLastMan
struct AwAlienGameInfo_CheckLastMan_Params
{
	int                                                TeamIndex;                                                // (Parm)
};

// Function WMission.wAlienGameInfo.ProcessQuickRepairByAlien
struct AwAlienGameInfo_ProcessQuickRepairByAlien_Params
{
	int                                                PlayerID;                                                 // (Parm)
};

// Function WMission.wAlienGameInfo.ProcessDefSuccessFromInfection
struct AwAlienGameInfo_ProcessDefSuccessFromInfection_Params
{
	int                                                PlayerID;                                                 // (Parm)
};

// Function WMission.wAlienGameInfo.ChangeAttackLevel
struct AwAlienGameInfo_ChangeAttackLevel_Params
{
	unsigned char                                      byAttackLevelIndex;                                       // (Parm)
};

// Function WMission.wAlienGameInfo.ChangePawn
struct AwAlienGameInfo_ChangePawn_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
};

// Function WMission.wAlienGameInfo.Killed
struct AwAlienGameInfo_Killed_Params
{
	class AController*                                 Killer;                                                   // (Parm)
	class AController*                                 Killed;                                                   // (Parm)
	class APawn*                                       KilledPawn;                                               // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function WMission.wAlienGameInfo.StartAlienMode
struct AwAlienGameInfo_StartAlienMode_Params
{
};

// Function WMission.wAlienGameInfo.BeginRound
struct AwAlienGameInfo_BeginRound_Params
{
	bool                                               bNoReset;                                                 // (OptionalParm, Parm)
};

// Function WMission.wAlienGameInfo.IsAppropriateRespawnPoint
struct AwAlienGameInfo_IsAppropriateRespawnPoint_Params
{
	class ANavigationPoint*                            N;                                                        // (Parm)
	unsigned char                                      Team;                                                     // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wAlienGameInfo.Logout
struct AwAlienGameInfo_Logout_Params
{
	class AController*                                 Exiting;                                                  // (Parm)
};

// Function WMission.wAlienGameInfo.InitGame
struct AwAlienGameInfo_InitGame_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
};

// Function WMission.wBombObjective.PrecacheAnnouncer
struct AwBombObjective_PrecacheAnnouncer_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function WMission.wBombObjective.Reset
struct AwBombObjective_Reset_Params
{
};

// Function WMission.wBombObjective.BetterObjectiveThan
struct AwBombObjective_BetterObjectiveThan_Params
{
	class AGameObjective*                              Best;                                                     // (Parm)
	unsigned char                                      DesiredTeamNum;                                           // (Parm)
	unsigned char                                      RequesterTeamNum;                                         // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wBombObjective.BotNearObjective
struct AwBombObjective_BotNearObjective_Params
{
	class ABot*                                        B;                                                        // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wBombObjective.SetActive
struct AwBombObjective_SetActive_Params
{
	bool                                               bActiveStatus;                                            // (Parm)
};

// Function WMission.wBombObjective.PreBeginPlay
struct AwBombObjective_PreBeginPlay_Params
{
};

// Function WMission.wMessage_MSKillMessages.ClientReceive
struct AwMessage_MSKillMessages_ClientReceive_Params
{
	class APlayerController*                           P;                                                        // (Parm)
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
};

// Function WMission.wMessage_MSKillMessages.GetString
struct AwMessage_MSKillMessages_GetString_Params
{
	int                                                Switch;                                                   // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_1;                                             // (OptionalParm, Parm)
	class APlayerReplicationInfo*                      RelatedPRI_2;                                             // (OptionalParm, Parm)
	class UObject*                                     OptionalObject;                                           // (OptionalParm, Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function WMission.wMSCinematic_SceneManager.SceneEnded
struct AwMSCinematic_SceneManager_SceneEnded_Params
{
};

// Function WMission.wMSCinematic_SceneManager.ShotEnded
struct AwMSCinematic_SceneManager_ShotEnded_Params
{
	class AwMSCinematic_Camera*                        cam;                                                      // (Parm)
};

// Function WMission.wMSCinematic_SceneManager.PlayScene
struct AwMSCinematic_SceneManager_PlayScene_Params
{
};

// Function WMission.wMSCinematic_SceneManager.Trigger
struct AwMSCinematic_SceneManager_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function WMission.wMSCinematic_SceneManager.PostBeginPlay
struct AwMSCinematic_SceneManager_PostBeginPlay_Params
{
};

// Function WMission.wSDGameInfo.EndGameByTeamNoneLeft
struct AwSDGameInfo_EndGameByTeamNoneLeft_Params
{
	class APlayerReplicationInfo*                      Living;                                                   // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSDGameInfo.AnnounceAlmostWinningTeam
struct AwSDGameInfo_AnnounceAlmostWinningTeam_Params
{
};

// Function WMission.wSDGameInfo.AnnounceWinningTeam
struct AwSDGameInfo_AnnounceWinningTeam_Params
{
};

// Function WMission.wSDGameInfo.GetResultPointRatio_Intervention
struct AwSDGameInfo_GetResultPointRatio_Intervention_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSDGameInfo.SetPRI4Intervention
struct AwSDGameInfo_SetPRI4Intervention_Params
{
	class APlayerReplicationInfo*                      PRI;                                                      // (Parm)
};

// Function WMission.wSDGameInfo.CalcRoundResultPoints
struct AwSDGameInfo_CalcRoundResultPoints_Params
{
	int                                                ScoringTeam;                                              // (Parm)
};

// Function WMission.wSDGameInfo.CalcResultPoints
struct AwSDGameInfo_CalcResultPoints_Params
{
};

// Function WMission.wSDGameInfo.AnnounceMatchInfo
struct AwSDGameInfo_AnnounceMatchInfo_Params
{
};

// Function WMission.wSDGameInfo.AnnounceSwitchTeam
struct AwSDGameInfo_AnnounceSwitchTeam_Params
{
};

// Function WMission.wSDGameInfo.PrecacheGameAnnouncements
struct AwSDGameInfo_PrecacheGameAnnouncements_Params
{
	class AAnnouncerVoice*                             V;                                                        // (Parm)
	bool                                               bRewardSounds;                                            // (Parm)
};

// Function WMission.wSDGameInfo.InitializeSetObjectives
struct AwSDGameInfo_InitializeSetObjectives_Params
{
};

// Function WMission.wSDGameInfo.EndRound
struct AwSDGameInfo_EndRound_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	class APawn*                                       Instigator;                                               // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function WMission.wSDGameInfo.ServerLogEndRound
struct AwSDGameInfo_ServerLogEndRound_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	class APawn*                                       Instigator;                                               // (Parm)
	struct FString                                     Reason;                                                   // (Parm, NeedCtorLink)
};

// Function WMission.wSDGameInfo.GetWinTeamAD
struct AwSDGameInfo_GetWinTeamAD_Params
{
	int                                                winTeam;                                                  // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSDGameInfo.GetWinTeam
struct AwSDGameInfo_GetWinTeam_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSDGameInfo.GetRoundEndType
struct AwSDGameInfo_GetRoundEndType_Params
{
	TEnumAsByte<ERER_Reason>                           RoundEndReason;                                           // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSDGameInfo.CountPlayersByTeam
struct AwSDGameInfo_CountPlayersByTeam_Params
{
	int                                                Team;                                                     // (Parm)
	int                                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSDGameInfo.AnnounceBeginRound
struct AwSDGameInfo_AnnounceBeginRound_Params
{
};

// Function WMission.wSDGameInfo.BeginRound
struct AwSDGameInfo_BeginRound_Params
{
	bool                                               bNoReset;                                                 // (OptionalParm, Parm)
};

// Function WMission.wSDGameInfo.OnBombDiffused
struct AwSDGameInfo_OnBombDiffused_Params
{
	class APawn*                                       TP;                                                       // (Parm)
	struct FName                                       Tag;                                                      // (Parm)
	struct FVector                                     FlagLocation;                                             // (Parm)
};

// Function WMission.wSDGameInfo.SetObjectiveSetted
struct AwSDGameInfo_SetObjectiveSetted_Params
{
	class APawn*                                       TP;                                                       // (Parm)
	struct FName                                       ObjectTag;                                                // (Parm)
	struct FVector                                     FlagLocation;                                             // (Parm)
};

// Function WMission.wSDGameInfo.PlayObjectiveSetVociceBGM
struct AwSDGameInfo_PlayObjectiveSetVociceBGM_Params
{
	class APawn*                                       TP;                                                       // (Parm)
};

// Function WMission.wSDGameInfo.GotoDefusePhase
struct AwSDGameInfo_GotoDefusePhase_Params
{
	struct FName                                       ObjectTag;                                                // (Parm)
};

// Function WMission.wSDGameInfo.InitGame
struct AwSDGameInfo_InitGame_Params
{
	struct FString                                     Options;                                                  // (Parm, NeedCtorLink)
	struct FString                                     Error;                                                    // (Parm, OutParm, NeedCtorLink)
};

// Function WMission.wRandomBonusPack.CanPickupByPRI
struct AwRandomBonusPack_CanPickupByPRI_Params
{
	class AwAlienPlayerReplicationInfo*                PRI;                                                      // (Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wRandomBonusPack.FillWeaponAmmo
struct AwRandomBonusPack_FillWeaponAmmo_Params
{
	class APawn*                                       P;                                                        // (Parm)
};

// Function WMission.wRandomBonusPack.AddWeaponByInvenGroup
struct AwRandomBonusPack_AddWeaponByInvenGroup_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
	class AwWeapon*                                    DestWeapon;                                               // (Parm)
	class AwWeapon*                                    AddWeapon;                                                // (Parm)
};

// Function WMission.wRandomBonusPack.Reset
struct AwRandomBonusPack_Reset_Params
{
};

// Function WMission.wRandomBonusPack.DeleteSuppliesPositions
struct AwRandomBonusPack_DeleteSuppliesPositions_Params
{
};

// Function WMission.wRandomBonusPack.PostNetBeginPlay
struct AwRandomBonusPack_PostNetBeginPlay_Params
{
};

// Function WMission.wObjectiveTankerAlienShield.TakeDamage
struct AwObjectiveTankerAlienShield_TakeDamage_Params
{
	int                                                Damage;                                                   // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     Momentum;                                                 // (Parm)
	class UClass*                                      DamageType;                                               // (Parm)
	int                                                CollisionPart;                                            // (OptionalParm, Parm)
	int                                                WeaponType;                                               // (OptionalParm, Parm)
	bool                                               bWallShot;                                                // (OptionalParm, Parm)
};

// Function WMission.wSkill_Shield.ResetSkill
struct UwSkill_Shield_ResetSkill_Params
{
};

// Function WMission.wSkill_Shield.Client_AddProcess
struct UwSkill_Shield_Client_AddProcess_Params
{
};

// Function WMission.wSkill_Shield.UnuseSkill
struct UwSkill_Shield_UnuseSkill_Params
{
};

// Function WMission.wSkill_Shield.UseSkill
struct UwSkill_Shield_UseSkill_Params
{
};

// Function WMission.wSkill_Shield.CheckSkill
struct UwSkill_Shield_CheckSkill_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WMission.wSkill_Shield.ReadySkill
struct UwSkill_Shield_ReadySkill_Params
{
};

// Function WMission.wSkill_Shield.Initialize
struct UwSkill_Shield_Initialize_Params
{
	class UwSkillBase*                                 SkillBase;                                                // (Parm)
	class UwSkillBaseParam*                            Param;                                                    // (Parm)
};

// Function WMission.wMSCinematic_Camera.Reset
struct AwMSCinematic_Camera_Reset_Params
{
};

// Function WMission.wMSCinematic_Camera.Trigger
struct AwMSCinematic_Camera_Trigger_Params
{
	class AActor*                                      Other;                                                    // (Parm)
	class APawn*                                       EventInstigator;                                          // (Parm)
};

// Function WMission.wMSCinematic_Camera.Timer
struct AwMSCinematic_Camera_Timer_Params
{
};

// Function WMission.wMSCinematic_Camera.SetView
struct AwMSCinematic_Camera_SetView_Params
{
	class AwMSCinematic_SceneManager*                  SM;                                                       // (Parm)
};

// Function WMission.wMSCinematic_Camera.ViewFixedObjective
struct AwMSCinematic_Camera_ViewFixedObjective_Params
{
	class APlayerController*                           PC;                                                       // (Parm)
	class AGameObjective*                              Go;                                                       // (Parm)
};

// Function WMission.wMSCinematic_Camera.PostBeginPlay
struct AwMSCinematic_Camera_PostBeginPlay_Params
{
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
