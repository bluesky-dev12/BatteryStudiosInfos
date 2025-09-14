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

// Function WMission.wMSPlayerReplicationInfo.Reset
// (Defined, Public)

void AwMSPlayerReplicationInfo::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSPlayerReplicationInfo.Reset");

	AwMSPlayerReplicationInfo_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSPlayerReplicationInfo.CanBotTeleport
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSPlayerReplicationInfo::CanBotTeleport(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSPlayerReplicationInfo.CanBotTeleport");

	AwMSPlayerReplicationInfo_CanBotTeleport_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSPlayerReplicationInfo.Timer
// (Defined, Public)

void AwMSPlayerReplicationInfo::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSPlayerReplicationInfo.Timer");

	AwMSPlayerReplicationInfo_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienPlayerReplicationInfo.Reset
// (Defined, Public)

void AwAlienPlayerReplicationInfo::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienPlayerReplicationInfo.Reset");

	AwAlienPlayerReplicationInfo_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienPlayerReplicationInfo.ServerSetSkinID
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// unsigned char                  bySkinID                       (Parm)

void AwAlienPlayerReplicationInfo::ServerSetSkinID(unsigned char bySkinID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienPlayerReplicationInfo.ServerSetSkinID");

	AwAlienPlayerReplicationInfo_ServerSetSkinID_Params params;
	params.bySkinID = bySkinID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienPlayerReplicationInfo.GetSelectedSkinID
// (Defined, Simulated, Public)
// Parameters:
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char AwAlienPlayerReplicationInfo::GetSelectedSkinID()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienPlayerReplicationInfo.GetSelectedSkinID");

	AwAlienPlayerReplicationInfo_GetSelectedSkinID_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienPlayerReplicationInfo.GetInfectionLevel
// (Defined, Simulated, Public)
// Parameters:
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char AwAlienPlayerReplicationInfo::GetInfectionLevel()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienPlayerReplicationInfo.GetInfectionLevel");

	AwAlienPlayerReplicationInfo_GetInfectionLevel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienPlayerReplicationInfo.SetInfectionLevel
// (Defined, Simulated, Public)
// Parameters:
// unsigned char                  Level                          (Parm)

void AwAlienPlayerReplicationInfo::SetInfectionLevel(unsigned char Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienPlayerReplicationInfo.SetInfectionLevel");

	AwAlienPlayerReplicationInfo_SetInfectionLevel_Params params;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienPlayerReplicationInfo.GetObjType
// (Defined, Simulated, Public)
// Parameters:
// TEnumAsByte<EAlienModeType>    ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<EAlienModeType> AwAlienPlayerReplicationInfo::GetObjType()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienPlayerReplicationInfo.GetObjType");

	AwAlienPlayerReplicationInfo_GetObjType_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienPlayerReplicationInfo.SetObjType
// (Defined, Simulated, Public)
// Parameters:
// TEnumAsByte<EAlienModeType>    eType                          (Parm)

void AwAlienPlayerReplicationInfo::SetObjType(TEnumAsByte<EAlienModeType> eType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienPlayerReplicationInfo.SetObjType");

	AwAlienPlayerReplicationInfo_SetObjType_Params params;
	params.eType = eType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawMissionIcon
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  curPawn                        (Parm)

void AwHUD_Mission::DrawMissionIcon(class UCanvas* C, class AwPawn* curPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawMissionIcon");

	AwHUD_Mission_DrawMissionIcon_Params params;
	params.C = C;
	params.curPawn = curPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawIntroTitle
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawIntroTitle(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawIntroTitle");

	AwHUD_Mission_DrawIntroTitle_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawCinematicHUD
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawCinematicHUD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawCinematicHUD");

	AwHUD_Mission_DrawCinematicHUD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AwHUD_Mission::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.UpdatePrecacheMaterials");

	AwHUD_Mission_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.UpdatePrecacheStaticMeshes
// (Defined, Simulated, Public)

void AwHUD_Mission::UpdatePrecacheStaticMeshes()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.UpdatePrecacheStaticMeshes");

	AwHUD_Mission_UpdatePrecacheStaticMeshes_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.GetInfoString
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwHUD_Mission::GetInfoString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetInfoString");

	AwHUD_Mission_GetInfoString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.CheckCountdown
// (Defined, Public)
// Parameters:
// class AGameReplicationInfo*    GRI                            (Parm)

void AwHUD_Mission::CheckCountdown(class AGameReplicationInfo* GRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.CheckCountdown");

	AwHUD_Mission_CheckCountdown_Params params;
	params.GRI = GRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawPracticeRoundInfo
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawPracticeRoundInfo(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawPracticeRoundInfo");

	AwHUD_Mission_DrawPracticeRoundInfo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.TeamChanged
// (Defined, Simulated, Event, Public)

void AwHUD_Mission::TeamChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.TeamChanged");

	AwHUD_Mission_TeamChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.NotifyGRIChanged
// (Simulated, Public)

void AwHUD_Mission::NotifyGRIChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.NotifyGRIChanged");

	AwHUD_Mission_NotifyGRIChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwHUD_Mission::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.Tick");

	AwHUD_Mission_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawTextWithBackground
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 Text                           (Parm, NeedCtorLink)
// struct FColor                  TextColor                      (Parm)
// float                          XO                             (Parm)
// float                          YO                             (Parm)

void AwHUD_Mission::DrawTextWithBackground(class UCanvas* C, const struct FString& Text, const struct FColor& TextColor, float XO, float YO)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawTextWithBackground");

	AwHUD_Mission_DrawTextWithBackground_Params params;
	params.C = C;
	params.Text = Text;
	params.TextColor = TextColor;
	params.XO = XO;
	params.YO = YO;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.GetScreenCorner
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AActor*                  A                              (Parm)
// struct FVector                 CornerVect                     (Parm)
// struct FVector                 IPScrO                         (Parm)
// struct FRotator                CameraRotation                 (Parm)
// float                          ColExpand                      (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwHUD_Mission::STATIC_GetScreenCorner(class UCanvas* C, class AActor* A, const struct FVector& CornerVect, const struct FVector& IPScrO, const struct FRotator& CameraRotation, float ColExpand)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetScreenCorner");

	AwHUD_Mission_GetScreenCorner_Params params;
	params.C = C;
	params.A = A;
	params.CornerVect = CornerVect;
	params.IPScrO = IPScrO;
	params.CameraRotation = CameraRotation;
	params.ColExpand = ColExpand;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.Draw_2DCollisionBox
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AActor*                  A                              (Parm)
// struct FVector                 ScrPos                         (Parm)
// struct FString                 Description                    (Parm, NeedCtorLink)
// float                          ColExpand                      (Parm)
// bool                           bSizeOverride                  (Parm)

void AwHUD_Mission::STATIC_Draw_2DCollisionBox(class UCanvas* C, class AActor* A, const struct FVector& ScrPos, const struct FString& Description, float ColExpand, bool bSizeOverride)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.Draw_2DCollisionBox");

	AwHUD_Mission_Draw_2DCollisionBox_Params params;
	params.C = C;
	params.A = A;
	params.ScrPos = ScrPos;
	params.Description = Description;
	params.ColExpand = ColExpand;
	params.bSizeOverride = bSizeOverride;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.GetGYRColorRamp
// (Defined, Static, Public)
// Parameters:
// float                          Pct                            (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AwHUD_Mission::STATIC_GetGYRColorRamp(float Pct)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetGYRColorRamp");

	AwHUD_Mission_GetGYRColorRamp_Params params;
	params.Pct = Pct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.GetObjectiveColor
// (Defined, Simulated, Public)
// Parameters:
// class AGameObjective*          Go                             (Parm)
// unsigned char                  bProgressPulsing               (OptionalParm, Parm, OutParm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AwHUD_Mission::GetObjectiveColor(class AGameObjective* Go, unsigned char* bProgressPulsing)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetObjectiveColor");

	AwHUD_Mission_GetObjectiveColor_Params params;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (bProgressPulsing != nullptr)
		*bProgressPulsing = params.bProgressPulsing;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.GetTeamColor
// (Defined, Static, Public)
// Parameters:
// unsigned char                  Team                           (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AwHUD_Mission::STATIC_GetTeamColor(unsigned char Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetTeamColor");

	AwHUD_Mission_GetTeamColor_Params params;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.CustomHUDColorAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Mission::CustomHUDColorAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.CustomHUDColorAllowed");

	AwHUD_Mission_CustomHUDColorAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.DrawCustomHealthInfo
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerController*       PC                             (Parm)
// bool                           bSkaarj                        (Parm)

void AwHUD_Mission::STATIC_DrawCustomHealthInfo(class UCanvas* C, class APlayerController* PC, bool bSkaarj)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawCustomHealthInfo");

	AwHUD_Mission_DrawCustomHealthInfo_Params params;
	params.C = C;
	params.PC = PC;
	params.bSkaarj = bSkaarj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawInfoPods
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawInfoPods(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawInfoPods");

	AwHUD_Mission_DrawInfoPods_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.CanSpawnNotify
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Mission::CanSpawnNotify()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.CanSpawnNotify");

	AwHUD_Mission_CanSpawnNotify_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.GetCurrentObjective
// (Defined, Simulated, Public)
// Parameters:
// class AGameObjective*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AGameObjective* AwHUD_Mission::GetCurrentObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetCurrentObjective");

	AwHUD_Mission_GetCurrentObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.NotifyUpdatedObjective
// (Defined, Simulated, Public)

void AwHUD_Mission::NotifyUpdatedObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.NotifyUpdatedObjective");

	AwHUD_Mission_NotifyUpdatedObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.HighlightCurrentObjective
// (Defined, Simulated, Public)
// Parameters:
// bool                           bShowWayPoint                  (Parm)

void AwHUD_Mission::HighlightCurrentObjective(bool bShowWayPoint)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.HighlightCurrentObjective");

	AwHUD_Mission_HighlightCurrentObjective_Params params;
	params.bShowWayPoint = bShowWayPoint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.AnnouncementPlayed
// (Defined, Event, Public)
// Parameters:
// struct FString                 AnnouncerSound                 (Parm, NeedCtorLink)
// unsigned char                  Switch                         (Parm)

void AwHUD_Mission::AnnouncementPlayed(const struct FString& AnnouncerSound, unsigned char Switch)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.AnnouncementPlayed");

	AwHUD_Mission_AnnouncementPlayed_Params params;
	params.AnnouncerSound = AnnouncerSound;
	params.Switch = Switch;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.IsObjectiveVisible
// (Final, Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AGameObjective*          Target                         (Parm)
// struct FVector                 ScreenPos                      (Parm, OutParm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Mission::IsObjectiveVisible(class UCanvas* C, class AGameObjective* Target, const struct FVector& camLoc, const struct FRotator& camRot, struct FVector* ScreenPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.IsObjectiveVisible");

	AwHUD_Mission_IsObjectiveVisible_Params params;
	params.C = C;
	params.Target = Target;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ScreenPos != nullptr)
		*ScreenPos = params.ScreenPos;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.DrawHealthBar
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 HBScreenPos                    (Parm)
// float                          Health                         (Parm)
// float                          MaxHealth                      (Parm)
// struct FColor                  ObjColor                       (Parm)

void AwHUD_Mission::DrawHealthBar(class UCanvas* C, const struct FVector& HBScreenPos, float Health, float MaxHealth, const struct FColor& ObjColor)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawHealthBar");

	AwHUD_Mission_DrawHealthBar_Params params;
	params.C = C;
	params.HBScreenPos = HBScreenPos;
	params.Health = Health;
	params.MaxHealth = MaxHealth;
	params.ObjColor = ObjColor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.Release_ObjectivePointingArrow
// (Defined, Simulated, Public)

void AwHUD_Mission::Release_ObjectivePointingArrow()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.Release_ObjectivePointingArrow");

	AwHUD_Mission_Release_ObjectivePointingArrow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.Draw3dObjectiveArrow
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::Draw3dObjectiveArrow(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.Draw3dObjectiveArrow");

	AwHUD_Mission_Draw3dObjectiveArrow_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.Release_BehindObjectiveArrows
// (Defined, Simulated, Public)

void AwHUD_Mission::Release_BehindObjectiveArrows()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.Release_BehindObjectiveArrows");

	AwHUD_Mission_Release_BehindObjectiveArrows_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.Get_BehindObjectiveArrow
// (Defined, Simulated, Public)
// Parameters:
// class UTexRotator*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UTexRotator* AwHUD_Mission::Get_BehindObjectiveArrow()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.Get_BehindObjectiveArrow");

	AwHUD_Mission_Get_BehindObjectiveArrow_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.DrawObjectiveIcon
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bOptionalObjective             (Parm)
// float                          PosX                           (Parm)
// float                          PosY                           (Parm)
// float                          tileX                          (Parm)
// float                          tileY                          (Parm)

void AwHUD_Mission::DrawObjectiveIcon(class UCanvas* C, bool bOptionalObjective, float PosX, float PosY, float tileX, float tileY)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawObjectiveIcon");

	AwHUD_Mission_DrawObjectiveIcon_Params params;
	params.C = C;
	params.bOptionalObjective = bOptionalObjective;
	params.PosX = PosX;
	params.PosY = PosY;
	params.tileX = tileX;
	params.tileY = tileY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawObjectiveStatusOverlay
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          Progress                       (Parm)
// bool                           bCriticalFlash                 (Parm)
// struct FVector                 ScreenPos                      (Parm)
// float                          Scale                          (Parm)

void AwHUD_Mission::DrawObjectiveStatusOverlay(class UCanvas* C, float Progress, bool bCriticalFlash, const struct FVector& ScreenPos, float Scale)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawObjectiveStatusOverlay");

	AwHUD_Mission_DrawObjectiveStatusOverlay_Params params;
	params.C = C;
	params.Progress = Progress;
	params.bCriticalFlash = bCriticalFlash;
	params.ScreenPos = ScreenPos;
	params.Scale = Scale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawCriticalObjectiveOverlay
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 ScreenPos                      (Parm)
// float                          Scale                          (Parm)

void AwHUD_Mission::DrawCriticalObjectiveOverlay(class UCanvas* C, const struct FVector& ScreenPos, float Scale)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawCriticalObjectiveOverlay");

	AwHUD_Mission_DrawCriticalObjectiveOverlay_Params params;
	params.C = C;
	params.ScreenPos = ScreenPos;
	params.Scale = Scale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawMiniMap
// (Public)
// Parameters:
// class AwHudPart_MinimapBase*   Minimap                        (Parm)
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawMiniMap(class AwHudPart_MinimapBase* Minimap, class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawMiniMap");

	AwHUD_Mission_DrawMiniMap_Params params;
	params.Minimap = Minimap;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawBigmap_HUD
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawBigmap_HUD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawBigmap_HUD");

	AwHUD_Mission_DrawBigmap_HUD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawMinimap_HUD
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawMinimap_HUD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawMinimap_HUD");

	AwHUD_Mission_DrawMinimap_HUD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.CheckAndDrawProgress
// (Public)
// Parameters:
// class AGameObjective*          Go                             (Parm)
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::CheckAndDrawProgress(class AGameObjective* Go, class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.CheckAndDrawProgress");

	AwHUD_Mission_CheckAndDrawProgress_Params params;
	params.Go = Go;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawProgressMessage
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ProgressPct                    (Parm)

void AwHUD_Mission::DrawProgressMessage(class UCanvas* C, float ProgressPct)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawProgressMessage");

	AwHUD_Mission_DrawProgressMessage_Params params;
	params.C = C;
	params.ProgressPct = ProgressPct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.GetGameObjectIndexByTag
// (Defined, Static, Public)
// Parameters:
// struct FName                   Tag                            (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwHUD_Mission::STATIC_GetGameObjectIndexByTag(const struct FName& Tag)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetGameObjectIndexByTag");

	AwHUD_Mission_GetGameObjectIndexByTag_Params params;
	params.Tag = Tag;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.GetGameObjectIndex
// (Defined, Static, Public)
// Parameters:
// class AGameObjective*          Go                             (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwHUD_Mission::STATIC_GetGameObjectIndex(class AGameObjective* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetGameObjectIndex");

	AwHUD_Mission_GetGameObjectIndex_Params params;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.DrawObjectives
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawObjectives(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawObjectives");

	AwHUD_Mission_DrawObjectives_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.MultiplyColor
// (Defined, Public)
// Parameters:
// struct FColor                  c1                             (Parm, OutParm)
// struct FColor                  c2                             (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AwHUD_Mission::MultiplyColor(const struct FColor& c2, struct FColor* c1)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.MultiplyColor");

	AwHUD_Mission_MultiplyColor_Params params;
	params.c2 = c2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (c1 != nullptr)
		*c1 = params.c1;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.IsOnEdgeOfScreen
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 pos                            (Parm)
// float                          W                              (Parm)
// float                          H                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Mission::IsOnEdgeOfScreen(class UCanvas* C, const struct FVector& pos, float W, float H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.IsOnEdgeOfScreen");

	AwHUD_Mission_IsOnEdgeOfScreen_Params params;
	params.C = C;
	params.pos = pos;
	params.W = W;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.GetRadarDotPosition
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 dist                           (Parm)
// struct FVector                 ViewX                          (Parm)
// struct FVector                 ViewY                          (Parm)
// float                          OffsetScale                    (Parm)
// float                          OffsetY                        (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwHUD_Mission::GetRadarDotPosition(class UCanvas* C, const struct FVector& dist, const struct FVector& ViewX, const struct FVector& ViewY, float OffsetScale, float OffsetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetRadarDotPosition");

	AwHUD_Mission_GetRadarDotPosition_Params params;
	params.C = C;
	params.dist = dist;
	params.ViewX = ViewX;
	params.ViewY = ViewY;
	params.OffsetScale = OffsetScale;
	params.OffsetY = OffsetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.GetRadarDotDist
// (Defined, Public)
// Parameters:
// struct FVector                 dist                           (Parm)
// struct FVector                 ViewX                          (Parm)
// struct FVector                 ViewY                          (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHUD_Mission::GetRadarDotDist(const struct FVector& dist, const struct FVector& ViewX, const struct FVector& ViewY)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.GetRadarDotDist");

	AwHUD_Mission_GetRadarDotDist_Params params;
	params.dist = dist;
	params.ViewX = ViewX;
	params.ViewY = ViewY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.ApplySmartRangeDist
// (Defined, Public)
// Parameters:
// float                          dist                           (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHUD_Mission::ApplySmartRangeDist(float dist)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.ApplySmartRangeDist");

	AwHUD_Mission_ApplySmartRangeDist_Params params;
	params.dist = dist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.DrawRadarPassB
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawRadarPassB(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawRadarPassB");

	AwHUD_Mission_DrawRadarPassB_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawRadarPassA
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawRadarPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawRadarPassA");

	AwHUD_Mission_DrawRadarPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            X                              (Parm)
// int                            Y                              (Parm, OutParm)
// int                            dy                             (Parm)

void AwHUD_Mission::DrawDebug(class UCanvas* C, int X, int dy, int* Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawDebug");

	AwHUD_Mission_DrawDebug_Params params;
	params.C = C;
	params.X = X;
	params.dy = dy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Y != nullptr)
		*Y = params.Y;
}


// Function WMission.wHUD_Mission.DrawSpectatingHud
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawSpectatingHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawSpectatingHud");

	AwHUD_Mission_DrawSpectatingHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.ShowTeamScorePassC
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::ShowTeamScorePassC(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.ShowTeamScorePassC");

	AwHUD_Mission_ShowTeamScorePassC_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.IsVSRelevant
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Mission::IsVSRelevant()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.IsVSRelevant");

	AwHUD_Mission_IsVSRelevant_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.DrawTeamVS
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawTeamVS(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawTeamVS");

	AwHUD_Mission_DrawTeamVS_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.ShowTeamScorePassA
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::ShowTeamScorePassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.ShowTeamScorePassA");

	AwHUD_Mission_ShowTeamScorePassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.UpdateHUD
// (Defined, Simulated, Public)

void AwHUD_Mission::UpdateHUD()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.UpdateHUD");

	AwHUD_Mission_UpdateHUD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.updateScore
// (Defined, Public)

void AwHUD_Mission::updateScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.updateScore");

	AwHUD_Mission_updateScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.UpdateTimer
// (Defined, Simulated, Public)
// Parameters:
// int                            TimeMinutes                    (Parm, OutParm)
// int                            TimeSeconds                    (Parm, OutParm)

void AwHUD_Mission::UpdateTimer(int* TimeMinutes, int* TimeSeconds)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.UpdateTimer");

	AwHUD_Mission_UpdateTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (TimeMinutes != nullptr)
		*TimeMinutes = params.TimeMinutes;
	if (TimeSeconds != nullptr)
		*TimeSeconds = params.TimeSeconds;
}


// Function WMission.wHUD_Mission.UpdateTeamHud
// (Defined, Simulated, Public)

void AwHUD_Mission::UpdateTeamHud()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.UpdateTeamHud");

	AwHUD_Mission_UpdateTeamHud_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.ShouldShowObjectiveBoard
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Mission::ShouldShowObjectiveBoard()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.ShouldShowObjectiveBoard");

	AwHUD_Mission_ShouldShowObjectiveBoard_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Mission.DrawAssaultHUDLayer
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawAssaultHUDLayer(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawAssaultHUDLayer");

	AwHUD_Mission_DrawAssaultHUDLayer_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.CanvasDrawActors
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bClearedZBuffer                (Parm)

void AwHUD_Mission::CanvasDrawActors(class UCanvas* C, bool bClearedZBuffer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.CanvasDrawActors");

	AwHUD_Mission_CanvasDrawActors_Params params;
	params.C = C;
	params.bClearedZBuffer = bClearedZBuffer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawHudPassC
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawHudPassC(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawHudPassC");

	AwHUD_Mission_DrawHudPassC_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawHudPassB
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawHudPassB(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawHudPassB");

	AwHUD_Mission_DrawHudPassB_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawDebugTime
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawDebugTime(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawDebugTime");

	AwHUD_Mission_DrawDebugTime_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawDebugMission
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawDebugMission(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawDebugMission");

	AwHUD_Mission_DrawDebugMission_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.CallEvent
// (Defined, Public)
// Parameters:
// bool                           InvenCheck                     (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHUD_Mission::CallEvent(bool InvenCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.CallEvent");

	AwHUD_Mission_CallEvent_Params params;
	params.InvenCheck = InvenCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawHudPassA
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawHudPassA");

	AwHUD_Mission_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.Destroyed
// (Defined, Simulated, Event, Public)

void AwHUD_Mission::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.Destroyed");

	AwHUD_Mission_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.UpdateOBJ
// (Defined, Simulated, Public)

void AwHUD_Mission::UpdateOBJ()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.UpdateOBJ");

	AwHUD_Mission_UpdateOBJ_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwHUD_Mission::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.PostBeginPlay");

	AwHUD_Mission_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.PrecacheFonts
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::PrecacheFonts(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.PrecacheFonts");

	AwHUD_Mission_PrecacheFonts_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.ShowObjectiveBoard
// (Defined, Exec, Public)

void AwHUD_Mission::ShowObjectiveBoard()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.ShowObjectiveBoard");

	AwHUD_Mission_ShowObjectiveBoard_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawAdrenaline
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawAdrenaline(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawAdrenaline");

	AwHUD_Mission_DrawAdrenaline_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Mission.DrawTimer
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Mission::DrawTimer(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Mission.DrawTimer");

	AwHUD_Mission_DrawTimer_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.ShowRadioMessage_Notify
// (Defined, Exec, Public)

void AwHUD_Alien::ShowRadioMessage_Notify()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.ShowRadioMessage_Notify");

	AwHUD_Alien_ShowRadioMessage_Notify_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.ShowRadioMessage_Alarm
// (Defined, Exec, Public)

void AwHUD_Alien::ShowRadioMessage_Alarm()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.ShowRadioMessage_Alarm");

	AwHUD_Alien_ShowRadioMessage_Alarm_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.ShowRadioMessage
// (Defined, Exec, Public)

void AwHUD_Alien::ShowRadioMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.ShowRadioMessage");

	AwHUD_Alien_ShowRadioMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.LocalizedMessage2
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// bool                           bOption_Push                   (OptionalParm, Parm)
// struct FString                 CriticalString                 (OptionalParm, Parm, NeedCtorLink)

void AwHUD_Alien::LocalizedMessage2(class UClass* Message, int Switch, bool bOption_Push, const struct FString& CriticalString)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.LocalizedMessage2");

	AwHUD_Alien_LocalizedMessage2_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.bOption_Push = bOption_Push;
	params.CriticalString = CriticalString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.ChangeWeaponSlot5Hud
// (Defined, Public)
// Parameters:
// class AwWeapon*                newWeapon                      (Parm)
// bool                           bAddSkill                      (OptionalParm, Parm)

void AwHUD_Alien::ChangeWeaponSlot5Hud(class AwWeapon* newWeapon, bool bAddSkill)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.ChangeWeaponSlot5Hud");

	AwHUD_Alien_ChangeWeaponSlot5Hud_Params params;
	params.newWeapon = newWeapon;
	params.bAddSkill = bAddSkill;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwHUD_Alien::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.Tick");

	AwHUD_Alien_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.CheckPawnOwnerSkill
// (Defined, Public)
// Parameters:
// int                            skillC4                        (Parm, OutParm)
// int                            skillAirStirke                 (Parm, OutParm)
// int                            skillRPG                       (Parm, OutParm)

void AwHUD_Alien::CheckPawnOwnerSkill(int* skillC4, int* skillAirStirke, int* skillRPG)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.CheckPawnOwnerSkill");

	AwHUD_Alien_CheckPawnOwnerSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (skillC4 != nullptr)
		*skillC4 = params.skillC4;
	if (skillAirStirke != nullptr)
		*skillAirStirke = params.skillAirStirke;
	if (skillRPG != nullptr)
		*skillRPG = params.skillRPG;
}


// Function WMission.wHUD_Alien.CallEvent
// (Defined, Public)
// Parameters:
// bool                           InvenCheck                     (OptionalParm, Parm)
// int                            iReservation1                  (OptionalParm, Parm)
// int                            iReservation2                  (OptionalParm, Parm)

void AwHUD_Alien::CallEvent(bool InvenCheck, int iReservation1, int iReservation2)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.CallEvent");

	AwHUD_Alien_CallEvent_Params params;
	params.InvenCheck = InvenCheck;
	params.iReservation1 = iReservation1;
	params.iReservation2 = iReservation2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.UpdateModeEquippedItem
// (Defined, Public)

void AwHUD_Alien::UpdateModeEquippedItem()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.UpdateModeEquippedItem");

	AwHUD_Alien_UpdateModeEquippedItem_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.UpdateModeItemSlot_Human
// (Defined, Public)

void AwHUD_Alien::UpdateModeItemSlot_Human()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.UpdateModeItemSlot_Human");

	AwHUD_Alien_UpdateModeItemSlot_Human_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.UpdateModeItemSlot_Alien
// (Defined, Public)

void AwHUD_Alien::UpdateModeItemSlot_Alien()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.UpdateModeItemSlot_Alien");

	AwHUD_Alien_UpdateModeItemSlot_Alien_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.AddTeamDeathInfo
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)
// float                          FadeTime                       (Parm)
// float                          Duration                       (Parm)

void AwHUD_Alien::AddTeamDeathInfo(class APawn* P, class APlayerReplicationInfo* PRI, float FadeTime, float Duration)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.AddTeamDeathInfo");

	AwHUD_Alien_AddTeamDeathInfo_Params params;
	params.P = P;
	params.PRI = PRI;
	params.FadeTime = FadeTime;
	params.Duration = Duration;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.NotifyHealthInDanger
// (Defined, Public)

void AwHUD_Alien::NotifyHealthInDanger()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.NotifyHealthInDanger");

	AwHUD_Alien_NotifyHealthInDanger_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.OnClientReceiveDeathMessage
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (Parm)
// class APlayerReplicationInfo*  attackerPRI                    (Parm)
// class APlayerReplicationInfo*  victimPRI                      (Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AwHUD_Alien::OnClientReceiveDeathMessage(class APlayerController* P, int Switch, class APlayerReplicationInfo* attackerPRI, class APlayerReplicationInfo* victimPRI, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.OnClientReceiveDeathMessage");

	AwHUD_Alien_OnClientReceiveDeathMessage_Params params;
	params.P = P;
	params.Switch = Switch;
	params.attackerPRI = attackerPRI;
	params.victimPRI = victimPRI;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawSpecialSkillMedal
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Index                          (Parm)
// int                            width                          (Parm)
// int                            Height                         (Parm)
// struct FCalCoordsW             calW                           (Parm)
// int                            PosX                           (Parm)
// int                            PosY                           (Parm)
// float                          curScale                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Alien::DrawSpecialSkillMedal(class UCanvas* C, int Index, int width, int Height, const struct FCalCoordsW& calW, int PosX, int PosY, float curScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawSpecialSkillMedal");

	AwHUD_Alien_DrawSpecialSkillMedal_Params params;
	params.C = C;
	params.Index = Index;
	params.width = width;
	params.Height = Height;
	params.calW = calW;
	params.PosX = PosX;
	params.PosY = PosY;
	params.curScale = curScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Alien.DeleteSuppliesPositions
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  act                            (Parm)

void AwHUD_Alien::DeleteSuppliesPositions(class AActor* act)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DeleteSuppliesPositions");

	AwHUD_Alien_DeleteSuppliesPositions_Params params;
	params.act = act;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.CacheSuppliesPositions
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  act                            (Parm)

void AwHUD_Alien::CacheSuppliesPositions(class AActor* act)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.CacheSuppliesPositions");

	AwHUD_Alien_CacheSuppliesPositions_Params params;
	params.act = act;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.UpdateSelectAlienMenu
// (Defined, Simulated, Public)

void AwHUD_Alien::UpdateSelectAlienMenu()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.UpdateSelectAlienMenu");

	AwHUD_Alien_UpdateSelectAlienMenu_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.ChangeHudType
// (Defined, Public)
// Parameters:
// unsigned char                  Type                           (Parm)

void AwHUD_Alien::ChangeHudType(unsigned char Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.ChangeHudType");

	AwHUD_Alien_ChangeHudType_Params params;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawAlienCoolTimeSkillSlot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawAlienCoolTimeSkillSlot(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawAlienCoolTimeSkillSlot");

	AwHUD_Alien_DrawAlienCoolTimeSkillSlot_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawAlienModeSkillSlot
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawAlienModeSkillSlot(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawAlienModeSkillSlot");

	AwHUD_Alien_DrawAlienModeSkillSlot_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawDisplaySelectAlienMenu
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawDisplaySelectAlienMenu(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawDisplaySelectAlienMenu");

	AwHUD_Alien_DrawDisplaySelectAlienMenu_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawObjectives
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawObjectives(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawObjectives");

	AwHUD_Alien_DrawObjectives_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawResultScore
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawResultScore(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawResultScore");

	AwHUD_Alien_DrawResultScore_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawSpectatingHud
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawSpectatingHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawSpectatingHud");

	AwHUD_Alien_DrawSpectatingHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawHudPassA_Score
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawHudPassA_Score(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawHudPassA_Score");

	AwHUD_Alien_DrawHudPassA_Score_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.IsPickupWeapon
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHUD_Alien::IsPickupWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.IsPickupWeapon");

	AwHUD_Alien_IsPickupWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Alien.EnableWeaponSlot5Hud
// (Defined, Public)
// Parameters:
// int                            nWeaponID                      (Parm)

void AwHUD_Alien::EnableWeaponSlot5Hud(int nWeaponID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.EnableWeaponSlot5Hud");

	AwHUD_Alien_EnableWeaponSlot5Hud_Params params;
	params.nWeaponID = nWeaponID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawAlienDisplayBackScreen
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawAlienDisplayBackScreen(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawAlienDisplayBackScreen");

	AwHUD_Alien_DrawAlienDisplayBackScreen_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawHumanDisplayBackScreen
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawHumanDisplayBackScreen(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawHumanDisplayBackScreen");

	AwHUD_Alien_DrawHumanDisplayBackScreen_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawAlienDisplyHud
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawAlienDisplyHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawAlienDisplyHud");

	AwHUD_Alien_DrawAlienDisplyHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawSpecialModeIcon
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  curPawn                        (Parm)

void AwHUD_Alien::DrawSpecialModeIcon(class UCanvas* C, class AwPawn* curPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawSpecialModeIcon");

	AwHUD_Alien_DrawSpecialModeIcon_Params params;
	params.C = C;
	params.curPawn = curPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.UpdateNameTagInfo
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AwPawn*                  curPawn                        (Parm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)

void AwHUD_Alien::UpdateNameTagInfo(class UCanvas* C, class AwPawn* curPawn, const struct FVector& camLoc, const struct FRotator& camRot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.UpdateNameTagInfo");

	AwHUD_Alien_UpdateNameTagInfo_Params params;
	params.C = C;
	params.curPawn = curPawn;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawNametagsScript
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bSpectateMode                  (Parm)
// bool                           drawAlways                     (OptionalParm, Parm)

void AwHUD_Alien::DrawNametagsScript(class UCanvas* C, bool bSpectateMode, bool drawAlways)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawNametagsScript");

	AwHUD_Alien_DrawNametagsScript_Params params;
	params.C = C;
	params.bSpectateMode = bSpectateMode;
	params.drawAlways = drawAlways;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawHumanDisplyHud
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawHumanDisplyHud(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawHumanDisplyHud");

	AwHUD_Alien_DrawHumanDisplyHud_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawDisplaySelectMenu
// (Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawDisplaySelectMenu(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawDisplaySelectMenu");

	AwHUD_Alien_DrawDisplaySelectMenu_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawBackScreen
// (Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawBackScreen(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawBackScreen");

	AwHUD_Alien_DrawBackScreen_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawDisplayHUD
// (Public, Delegate)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawDisplayHUD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawDisplayHUD");

	AwHUD_Alien_DrawDisplayHUD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.CalculateHPBar
// (Defined, Public)
// Parameters:
// bool                           bDamage                        (Parm)
// bool                           bRecovery                      (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHUD_Alien::CalculateHPBar(bool bDamage, bool bRecovery)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.CalculateHPBar");

	AwHUD_Alien_CalculateHPBar_Params params;
	params.bDamage = bDamage;
	params.bRecovery = bRecovery;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHUD_Alien.DrawHpStamina
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bShowSpectating                (OptionalParm, Parm)

void AwHUD_Alien::DrawHpStamina(class UCanvas* C, bool bShowSpectating)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawHpStamina");

	AwHUD_Alien_DrawHpStamina_Params params;
	params.C = C;
	params.bShowSpectating = bShowSpectating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawBackDisplayScreen
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawBackDisplayScreen(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawBackDisplayScreen");

	AwHUD_Alien_DrawBackDisplayScreen_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.DrawHudPassA
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHUD_Alien::DrawHudPassA(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.DrawHudPassA");

	AwHUD_Alien_DrawHudPassA_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.InitHudPart_SelQuickSlot
// (Defined, Public)

void AwHUD_Alien::InitHudPart_SelQuickSlot()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.InitHudPart_SelQuickSlot");

	AwHUD_Alien_InitHudPart_SelQuickSlot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.Reset
// (Defined, Public)

void AwHUD_Alien::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.Reset");

	AwHUD_Alien_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.NotifyGRIChanged
// (Defined, Simulated, Public)

void AwHUD_Alien::NotifyGRIChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.NotifyGRIChanged");

	AwHUD_Alien_NotifyGRIChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHUD_Alien.PostBeginPlay
// (Defined, Public)

void AwHUD_Alien::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHUD_Alien.PostBeginPlay");

	AwHUD_Alien_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameReplicationInfo.IsGhostChatting
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  Sender                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameReplicationInfo::IsGhostChatting(class AActor* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.IsGhostChatting");

	AwMSGameReplicationInfo_IsGhostChatting_Params params;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameReplicationInfo.GetRoundWinnerString
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwMSGameReplicationInfo::GetRoundWinnerString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.GetRoundWinnerString");

	AwMSGameReplicationInfo_GetRoundWinnerString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameReplicationInfo.SetMaxLives
// (Defined, Simulated, Public)
// Parameters:
// int                            iMaxLives                      (Parm)

void AwMSGameReplicationInfo::SetMaxLives(int iMaxLives)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.SetMaxLives");

	AwMSGameReplicationInfo_SetMaxLives_Params params;
	params.iMaxLives = iMaxLives;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameReplicationInfo.GetMaxLives
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameReplicationInfo::GetMaxLives()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.GetMaxLives");

	AwMSGameReplicationInfo_GetMaxLives_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameReplicationInfo.IsDefender
// (Defined, Simulated, Public)
// Parameters:
// unsigned char                  Team                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameReplicationInfo::IsDefender(unsigned char Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.IsDefender");

	AwMSGameReplicationInfo_IsDefender_Params params;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameReplicationInfo.IsPracticeRound
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameReplicationInfo::IsPracticeRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.IsPracticeRound");

	AwMSGameReplicationInfo_IsPracticeRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameReplicationInfo.GetRemainingTime
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameReplicationInfo::GetRemainingTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.GetRemainingTime");

	AwMSGameReplicationInfo_GetRemainingTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameReplicationInfo.Timer
// (Defined, Simulated, Public)

void AwMSGameReplicationInfo::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.Timer");

	AwMSGameReplicationInfo_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameReplicationInfo.SetupAssaultObjectivePriority
// (Defined, Simulated, Public)

void AwMSGameReplicationInfo::SetupAssaultObjectivePriority()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.SetupAssaultObjectivePriority");

	AwMSGameReplicationInfo_SetupAssaultObjectivePriority_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameReplicationInfo.PostNetBeginPlay
// (Defined, Simulated, Public)

void AwMSGameReplicationInfo::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.PostNetBeginPlay");

	AwMSGameReplicationInfo_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameReplicationInfo.PreBeginPlay
// (Defined, Simulated, Public)

void AwMSGameReplicationInfo::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameReplicationInfo.PreBeginPlay");

	AwMSGameReplicationInfo_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wScoreBoard_Mission.DrawTeam
// (Defined, Public)
// Parameters:
// int                            TeamNum                        (Parm)
// int                            PlayerCount                    (Parm)
// int                            OwnerOffset                    (Parm)
// class UCanvas*                 Canvas                         (Parm)
// int                            FontReduction                  (Parm)
// int                            BoxSpaceY                      (Parm)
// int                            PlayerBoxSizeY                 (Parm)
// int                            HeaderOffsetY                  (Parm)

void AwScoreBoard_Mission::DrawTeam(int TeamNum, int PlayerCount, int OwnerOffset, class UCanvas* Canvas, int FontReduction, int BoxSpaceY, int PlayerBoxSizeY, int HeaderOffsetY)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wScoreBoard_Mission.DrawTeam");

	AwScoreBoard_Mission_DrawTeam_Params params;
	params.TeamNum = TeamNum;
	params.PlayerCount = PlayerCount;
	params.OwnerOffset = OwnerOffset;
	params.Canvas = Canvas;
	params.FontReduction = FontReduction;
	params.BoxSpaceY = BoxSpaceY;
	params.PlayerBoxSizeY = PlayerBoxSizeY;
	params.HeaderOffsetY = HeaderOffsetY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wScoreBoard_Mission.GetDefaultScoreInfoString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwScoreBoard_Mission::GetDefaultScoreInfoString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wScoreBoard_Mission.GetDefaultScoreInfoString");

	AwScoreBoard_Mission_GetDefaultScoreInfoString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wScoreBoard_Mission.GetRestartString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwScoreBoard_Mission::GetRestartString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wScoreBoard_Mission.GetRestartString");

	AwScoreBoard_Mission_GetRestartString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wScoreBoard_Mission.GetTitleString
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwScoreBoard_Mission::GetTitleString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wScoreBoard_Mission.GetTitleString");

	AwScoreBoard_Mission_GetTitleString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wInfoPod.DrawInfoPod_Texture
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 IPScrO                         (Parm)

void AwInfoPod::DrawInfoPod_Texture(class UCanvas* C, const struct FVector& IPScrO)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.DrawInfoPod_Texture");

	AwInfoPod_DrawInfoPod_Texture_Params params;
	params.C = C;
	params.IPScrO = IPScrO;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wInfoPod.DrawInfoPod_TextBrackets
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 IPScrO                         (Parm)
// class APlayerController*       PC                             (Parm)

void AwInfoPod::DrawInfoPod_TextBrackets(class UCanvas* C, const struct FVector& IPScrO, class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.DrawInfoPod_TextBrackets");

	AwInfoPod_DrawInfoPod_TextBrackets_Params params;
	params.C = C;
	params.IPScrO = IPScrO;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wInfoPod.DrawInfoPod_PlainText
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 IPScreenPos                    (Parm)
// class APlayerController*       PC                             (Parm)

void AwInfoPod::DrawInfoPod_PlainText(class UCanvas* C, const struct FVector& IPScreenPos, class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.DrawInfoPod_PlainText");

	AwInfoPod_DrawInfoPod_PlainText_Params params;
	params.C = C;
	params.IPScreenPos = IPScreenPos;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wInfoPod.Render
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 IPScreenPos                    (Parm)
// class APlayerController*       PC                             (Parm)

void AwInfoPod::Render(class UCanvas* C, const struct FVector& IPScreenPos, class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.Render");

	AwInfoPod_Render_Params params;
	params.C = C;
	params.IPScreenPos = IPScreenPos;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wInfoPod.IsInfoPodVisible
// (Final, Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APawn*                   P                              (Parm)
// struct FVector                 camLoc                         (Parm)
// struct FRotator                camRot                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwInfoPod::IsInfoPodVisible(class UCanvas* C, class APawn* P, const struct FVector& camLoc, const struct FRotator& camRot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.IsInfoPodVisible");

	AwInfoPod_IsInfoPodVisible_Params params;
	params.C = C;
	params.P = P;
	params.camLoc = camLoc;
	params.camRot = camRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wInfoPod.Reset
// (Defined, Public)

void AwInfoPod::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.Reset");

	AwInfoPod_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wInfoPod.Trigger
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwInfoPod::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.Trigger");

	AwInfoPod_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wInfoPod.PostBeginPlay
// (Defined, Event, Public)

void AwInfoPod::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wInfoPod.PostBeginPlay");

	AwInfoPod_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wTrigger_MSMessageTrigger.PrecacheAnnouncer
// (Defined, Simulated, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void AwTrigger_MSMessageTrigger::PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wTrigger_MSMessageTrigger.PrecacheAnnouncer");

	AwTrigger_MSMessageTrigger_PrecacheAnnouncer_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wTrigger_MSMessageTrigger.GetTeamNum
// (Defined, Public)
// Parameters:
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char AwTrigger_MSMessageTrigger::GetTeamNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wTrigger_MSMessageTrigger.GetTeamNum");

	AwTrigger_MSMessageTrigger_GetTeamNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wTrigger_MSMessageTrigger.Trigger
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwTrigger_MSMessageTrigger::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wTrigger_MSMessageTrigger.Trigger");

	AwTrigger_MSMessageTrigger_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectivePointingArrow.Render
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerController*       PC                             (Parm)
// class AActor*                  TrackedActor                   (Parm)

void AwObjectivePointingArrow::Render(class UCanvas* C, class APlayerController* PC, class AActor* TrackedActor)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectivePointingArrow.Render");

	AwObjectivePointingArrow_Render_Params params;
	params.C = C;
	params.PC = PC;
	params.TrackedActor = TrackedActor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectivePointingArrow.SetYellowColor
// (Defined, Simulated, Public)
// Parameters:
// bool                           bPulse                         (Parm)

void AwObjectivePointingArrow::SetYellowColor(bool bPulse)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectivePointingArrow.SetYellowColor");

	AwObjectivePointingArrow_SetYellowColor_Params params;
	params.bPulse = bPulse;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectivePointingArrow.SetTeamSkin
// (Defined, Simulated, Public)
// Parameters:
// unsigned char                  Team                           (Parm)
// bool                           bPulse                         (Parm)

void AwObjectivePointingArrow::SetTeamSkin(unsigned char Team, bool bPulse)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectivePointingArrow.SetTeamSkin");

	AwObjectivePointingArrow_SetTeamSkin_Params params;
	params.Team = Team;
	params.bPulse = bPulse;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.AddGameSpecificActions
// (Defined, Public)
// Parameters:
// TArray<class UwAction*>        Actions                        (Parm, OutParm, NeedCtorLink)

void AwMSGameInfo::AddGameSpecificActions(TArray<class UwAction*>* Actions)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AddGameSpecificActions");

	AwMSGameInfo_AddGameSpecificActions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Actions != nullptr)
		*Actions = params.Actions;
}


// Function WMission.wMSGameInfo.DoProcessKillMessage
// (Defined, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::DoProcessKillMessage(class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.DoProcessKillMessage");

	AwMSGameInfo_DoProcessKillMessage_Params params;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetTotalPlayedTime
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::GetTotalPlayedTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetTotalPlayedTime");

	AwMSGameInfo_GetTotalPlayedTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetBootySeedValue
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::GetBootySeedValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetBootySeedValue");

	AwMSGameInfo_GetBootySeedValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.CheckScore
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)

void AwMSGameInfo::CheckScore(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CheckScore");

	AwMSGameInfo_CheckScore_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.CheckLastMan
// (Defined, Public)
// Parameters:
// int                            TeamIndex                      (Parm)

void AwMSGameInfo::CheckLastMan(int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CheckLastMan");

	AwMSGameInfo_CheckLastMan_Params params;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.CheckMaxLives
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::CheckMaxLives(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CheckMaxLives");

	AwMSGameInfo_CheckMaxLives_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.EndGameByTeamNoneLeft
// (Public)
// Parameters:
// class APlayerReplicationInfo*  Living                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::EndGameByTeamNoneLeft(class APlayerReplicationInfo* Living)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.EndGameByTeamNoneLeft");

	AwMSGameInfo_EndGameByTeamNoneLeft_Params params;
	params.Living = Living;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.LeaveLogOtherTeamNoneLeft
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Living                         (Parm)

void AwMSGameInfo::LeaveLogOtherTeamNoneLeft(class APlayerReplicationInfo* Living)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.LeaveLogOtherTeamNoneLeft");

	AwMSGameInfo_LeaveLogOtherTeamNoneLeft_Params params;
	params.Living = Living;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.lll
// (Defined, Exec, Public)

void AwMSGameInfo::lll()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.lll");

	AwMSGameInfo_lll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.FindLiving
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Living                         (Parm, OutParm)
// unsigned char                  bOtherTeamNoneLeft             (Parm, OutParm)

void AwMSGameInfo::FindLiving(class APlayerReplicationInfo** Living, unsigned char* bOtherTeamNoneLeft)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.FindLiving");

	AwMSGameInfo_FindLiving_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Living != nullptr)
		*Living = params.Living;
	if (bOtherTeamNoneLeft != nullptr)
		*bOtherTeamNoneLeft = params.bOtherTeamNoneLeft;
}


// Function WMission.wMSGameInfo.AllowBecomeActivePlayer
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::AllowBecomeActivePlayer(class APlayerController* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AllowBecomeActivePlayer");

	AwMSGameInfo_AllowBecomeActivePlayer_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.IsRightTimeForRespawn
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::IsRightTimeForRespawn(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.IsRightTimeForRespawn");

	AwMSGameInfo_IsRightTimeForRespawn_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.IsRespawnRestrictionTime
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::IsRespawnRestrictionTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.IsRespawnRestrictionTime");

	AwMSGameInfo_IsRespawnRestrictionTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.AllowMutator
// (Defined, Static, Public)
// Parameters:
// struct FString                 MutatorClassName               (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::STATIC_AllowMutator(const struct FString& MutatorClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AllowMutator");

	AwMSGameInfo_AllowMutator_Params params;
	params.MutatorClassName = MutatorClassName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetDescriptionText
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropName                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwMSGameInfo::STATIC_GetDescriptionText(const struct FString& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetDescriptionText");

	AwMSGameInfo_GetDescriptionText_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.FillPlayInfo
// (Defined, Static, Public)
// Parameters:
// class UPlayInfo*               PlayInfo                       (Parm)

void AwMSGameInfo::STATIC_FillPlayInfo(class UPlayInfo* PlayInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.FillPlayInfo");

	AwMSGameInfo_FillPlayInfo_Params params;
	params.PlayInfo = PlayInfo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.AcceptPlayInfoProperty
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropertyName                   (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::STATIC_AcceptPlayInfoProperty(const struct FString& PropertyName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AcceptPlayInfoProperty");

	AwMSGameInfo_AcceptPlayInfoProperty_Params params;
	params.PropertyName = PropertyName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetServerDetails
// (Defined, Public)
// Parameters:
// struct FServerResponseLine     ServerState                    (Parm, OutParm, NeedCtorLink)

void AwMSGameInfo::GetServerDetails(struct FServerResponseLine* ServerState)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetServerDetails");

	AwMSGameInfo_GetServerDetails_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ServerState != nullptr)
		*ServerState = params.ServerState;
}


// Function WMission.wMSGameInfo.UpdateAnnouncements
// (Defined, Simulated, Public)

void AwMSGameInfo::UpdateAnnouncements()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.UpdateAnnouncements");

	AwMSGameInfo_UpdateAnnouncements_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.PrecacheGameAnnouncements
// (Defined, Static, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void AwMSGameInfo::STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.PrecacheGameAnnouncements");

	AwMSGameInfo_PrecacheGameAnnouncements_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.QueueAnnouncerSound
// (Defined, Public)
// Parameters:
// struct FString                 ASound                         (Parm, NeedCtorLink)
// unsigned char                  AnnouncementLevel              (Parm)
// unsigned char                  Team                           (Parm)
// TEnumAsByte<EAPriority>        Priority                       (OptionalParm, Parm)
// unsigned char                  Switch                         (OptionalParm, Parm)

void AwMSGameInfo::QueueAnnouncerSound(const struct FString& ASound, unsigned char AnnouncementLevel, unsigned char Team, TEnumAsByte<EAPriority> Priority, unsigned char Switch)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.QueueAnnouncerSound");

	AwMSGameInfo_QueueAnnouncerSound_Params params;
	params.ASound = ASound;
	params.AnnouncementLevel = AnnouncementLevel;
	params.Team = Team;
	params.Priority = Priority;
	params.Switch = Switch;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.AdjustDestroyObjectiveDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class AController*             instigatedBy                   (Parm)
// class AGameObjective*          Go                             (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::AdjustDestroyObjectiveDamage(int Damage, class AController* instigatedBy, class AGameObjective* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AdjustDestroyObjectiveDamage");

	AwMSGameInfo_AdjustDestroyObjectiveDamage_Params params;
	params.Damage = Damage;
	params.instigatedBy = instigatedBy;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.ReduceDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   injured                        (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm, OutParm)
// class UClass*                  DamageType                     (Parm)
// int                            iWeaponType                    (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ReduceDamage");

	AwMSGameInfo_ReduceDamage_Params params;
	params.Damage = Damage;
	params.injured = injured;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.DamageType = DamageType;
	params.iWeaponType = iWeaponType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Momentum != nullptr)
		*Momentum = params.Momentum;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.SetObjectiveSetted
// (Defined, Public)
// Parameters:
// class APawn*                   TP                             (Parm)
// struct FName                   ObjectTag                      (Parm)
// struct FVector                 FlagLocation                   (Parm)

void AwMSGameInfo::SetObjectiveSetted(class APawn* TP, const struct FName& ObjectTag, const struct FVector& FlagLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.SetObjectiveSetted");

	AwMSGameInfo_SetObjectiveSetted_Params params;
	params.TP = TP;
	params.ObjectTag = ObjectTag;
	params.FlagLocation = FlagLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.GetRemainingTime
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::GetRemainingTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetRemainingTime");

	AwMSGameInfo_GetRemainingTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.SetRemainingTime
// (Defined, Public)
// Parameters:
// int                            remain                         (Parm)

void AwMSGameInfo::SetRemainingTime(int remain)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.SetRemainingTime");

	AwMSGameInfo_SetRemainingTime_Params params;
	params.remain = remain;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.FindPlayerStart
// (Defined, Public)
// Parameters:
// class AController*             Player                         (Parm)
// unsigned char                  inTeam                         (OptionalParm, Parm)
// struct FString                 incomingName                   (OptionalParm, Parm, NeedCtorLink)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwMSGameInfo::FindPlayerStart(class AController* Player, unsigned char inTeam, const struct FString& incomingName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.FindPlayerStart");

	AwMSGameInfo_FindPlayerStart_Params params;
	params.Player = Player;
	params.inTeam = inTeam;
	params.incomingName = incomingName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetPlayerStartTeam
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        N                              (Parm)
// int                            Team                           (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::GetPlayerStartTeam(class ANavigationPoint* N, int Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetPlayerStartTeam");

	AwMSGameInfo_GetPlayerStartTeam_Params params;
	params.N = N;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetDefaultPlayerClass
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwMSGameInfo::GetDefaultPlayerClass(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetDefaultPlayerClass");

	AwMSGameInfo_GetDefaultPlayerClass_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.AddDefaultInventory
// (Defined, Public)
// Parameters:
// class APawn*                   PlayerPawn                     (Parm)

void AwMSGameInfo::AddDefaultInventory(class APawn* PlayerPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AddDefaultInventory");

	AwMSGameInfo_AddDefaultInventory_Params params;
	params.PlayerPawn = PlayerPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.RestartPlayer
// (Defined, Public)
// Parameters:
// class AController*             aPlayer                        (Parm)

void AwMSGameInfo::RestartPlayer(class AController* aPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.RestartPlayer");

	AwMSGameInfo_RestartPlayer_Params params;
	params.aPlayer = aPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ForceRestartPlayer
// (Defined, Public)
// Parameters:
// class AController*             aPlayer                        (Parm)

void AwMSGameInfo::ForceRestartPlayer(class AController* aPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ForceRestartPlayer");

	AwMSGameInfo_ForceRestartPlayer_Params params;
	params.aPlayer = aPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.TeamScoreEvent
// (Defined, Public)
// Parameters:
// int                            Team                           (Parm)
// float                          Points                         (Parm)
// struct FString                 Desc                           (Parm, NeedCtorLink)

void AwMSGameInfo::TeamScoreEvent(int Team, float Points, const struct FString& Desc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.TeamScoreEvent");

	AwMSGameInfo_TeamScoreEvent_Params params;
	params.Team = Team;
	params.Points = Points;
	params.Desc = Desc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ScoreEvent
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Who                            (Parm)
// float                          Points                         (Parm)
// struct FString                 Desc                           (Parm, NeedCtorLink)

void AwMSGameInfo::ScoreEvent(class APlayerReplicationInfo* Who, float Points, const struct FString& Desc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ScoreEvent");

	AwMSGameInfo_ScoreEvent_Params params;
	params.Who = Who;
	params.Points = Points;
	params.Desc = Desc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.KillEvent
// (Defined, Public)
// Parameters:
// struct FString                 KillType                       (Parm, NeedCtorLink)
// class APlayerReplicationInfo*  Killer                         (Parm)
// class APlayerReplicationInfo*  Victim                         (Parm)
// class UClass*                  Damage                         (Parm)

void AwMSGameInfo::KillEvent(const struct FString& KillType, class APlayerReplicationInfo* Killer, class APlayerReplicationInfo* Victim, class UClass* Damage)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.KillEvent");

	AwMSGameInfo_KillEvent_Params params;
	params.KillType = KillType;
	params.Killer = Killer;
	params.Victim = Victim;
	params.Damage = Damage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.SpecialEvent
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Who                            (Parm)
// struct FString                 Desc                           (Parm, NeedCtorLink)

void AwMSGameInfo::SpecialEvent(class APlayerReplicationInfo* Who, const struct FString& Desc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.SpecialEvent");

	AwMSGameInfo_SpecialEvent_Params params;
	params.Who = Who;
	params.Desc = Desc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.CriticalPlayer
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::CriticalPlayer(class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CriticalPlayer");

	AwMSGameInfo_CriticalPlayer_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.VehicleScoreKill
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class AVehicle*                DestroyedVehicle               (Parm)
// struct FString                 KillInfo                       (Parm, OutParm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::VehicleScoreKill(class AController* Killer, class AController* Killed, class AVehicle* DestroyedVehicle, struct FString* KillInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.VehicleScoreKill");

	AwMSGameInfo_VehicleScoreKill_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.DestroyedVehicle = DestroyedVehicle;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (KillInfo != nullptr)
		*KillInfo = params.KillInfo;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.Killed
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwMSGameInfo::Killed(class AController* Killer, class AController* Killed, class APawn* KilledPawn, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.Killed");

	AwMSGameInfo_Killed_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.TeleportPlayerToSpawn
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AwMSGameInfo::TeleportPlayerToSpawn(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.TeleportPlayerToSpawn");

	AwMSGameInfo_TeleportPlayerToSpawn_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.NoTranslocatorKeyPressed
// (Defined, Event, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)

void AwMSGameInfo::NoTranslocatorKeyPressed(class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NoTranslocatorKeyPressed");

	AwMSGameInfo_NoTranslocatorKeyPressed_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.NewSpawnAreaEnabled
// (Defined, Event, Public)
// Parameters:
// bool                           bDefenders                     (Parm)

void AwMSGameInfo::NewSpawnAreaEnabled(bool bDefenders)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NewSpawnAreaEnabled");

	AwMSGameInfo_NewSpawnAreaEnabled_Params params;
	params.bDefenders = bDefenders;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.CanDisableObjective
// (Defined, Public)
// Parameters:
// class AGameObjective*          Go                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::CanDisableObjective(class AGameObjective* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CanDisableObjective");

	AwMSGameInfo_CanDisableObjective_Params params;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.NeedToRespawnSD
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::NeedToRespawnSD()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NeedToRespawnSD");

	AwMSGameInfo_NeedToRespawnSD_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.IsPlaying
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::IsPlaying()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.IsPlaying");

	AwMSGameInfo_IsPlaying_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.IsPracticeRound
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::IsPracticeRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.IsPracticeRound");

	AwMSGameInfo_IsPracticeRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.IsPlayingIntro
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::IsPlayingIntro()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.IsPlayingIntro");

	AwMSGameInfo_IsPlayingIntro_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetDefenderNum
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::GetDefenderNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetDefenderNum");

	AwMSGameInfo_GetDefenderNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.GetAttackingTeam
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::GetAttackingTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetAttackingTeam");

	AwMSGameInfo_GetAttackingTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.IsAttackingTeam
// (Defined, Public)
// Parameters:
// int                            TeamNumber                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::IsAttackingTeam(int TeamNumber)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.IsAttackingTeam");

	AwMSGameInfo_IsAttackingTeam_Params params;
	params.TeamNumber = TeamNumber;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.BeginNewPairOfRounds
// (Defined, Public)

void AwMSGameInfo::BeginNewPairOfRounds()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.BeginNewPairOfRounds");

	AwMSGameInfo_BeginNewPairOfRounds_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.BeginRound
// (Defined, Public)
// Parameters:
// bool                           bNoReset                       (OptionalParm, Parm)

void AwMSGameInfo::BeginRound(bool bNoReset)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.BeginRound");

	AwMSGameInfo_BeginRound_Params params;
	params.bNoReset = bNoReset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.DestoryPawns
// (Defined, Public)

void AwMSGameInfo::DestoryPawns()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.DestoryPawns");

	AwMSGameInfo_DestoryPawns_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ProcessSwitchTeam
// (Defined, Public)
// Parameters:
// bool                           bNoReset                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::ProcessSwitchTeam(bool bNoReset)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ProcessSwitchTeam");

	AwMSGameInfo_ProcessSwitchTeam_Params params;
	params.bNoReset = bNoReset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.SetRoundTimeLimit
// (Defined, Public)

void AwMSGameInfo::SetRoundTimeLimit()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.SetRoundTimeLimit");

	AwMSGameInfo_SetRoundTimeLimit_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.InitializeGameInfo
// (Defined, Public)
// Parameters:
// bool                           bNoReset                       (Parm)
// bool                           bChangeTeam                    (Parm)

void AwMSGameInfo::InitializeGameInfo(bool bNoReset, bool bChangeTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.InitializeGameInfo");

	AwMSGameInfo_InitializeGameInfo_Params params;
	params.bNoReset = bNoReset;
	params.bChangeTeam = bChangeTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.AnnounceSwitchTeam
// (Public)

void AwMSGameInfo::AnnounceSwitchTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AnnounceSwitchTeam");

	AwMSGameInfo_AnnounceSwitchTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.NewRoundSwitchTeam
// (Defined, Public)

void AwMSGameInfo::NewRoundSwitchTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NewRoundSwitchTeam");

	AwMSGameInfo_NewRoundSwitchTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ResetLevel
// (Defined, Public)
// Parameters:
// bool                           hiddenAll                      (OptionalParm, Parm)

void AwMSGameInfo::ResetLevel(bool hiddenAll)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ResetLevel");

	AwMSGameInfo_ResetLevel_Params params;
	params.hiddenAll = hiddenAll;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.StartNewRound
// (Defined, Public)

void AwMSGameInfo::StartNewRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.StartNewRound");

	AwMSGameInfo_StartNewRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.NewRound
// (Defined, Exec, Public)

void AwMSGameInfo::NewRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NewRound");

	AwMSGameInfo_NewRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.AnnounceScore
// (Defined, Public)
// Parameters:
// int                            ScoringTeam                    (Parm)

void AwMSGameInfo::AnnounceScore(int ScoringTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AnnounceScore");

	AwMSGameInfo_AnnounceScore_Params params;
	params.ScoringTeam = ScoringTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.SetRoundWinner
// (Defined, Public)
// Parameters:
// int                            WinningTeam                    (Parm)

void AwMSGameInfo::SetRoundWinner(int WinningTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.SetRoundWinner");

	AwMSGameInfo_SetRoundWinner_Params params;
	params.WinningTeam = WinningTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.PracticeRoundEnded
// (Defined, Public)

void AwMSGameInfo::PracticeRoundEnded()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.PracticeRoundEnded");

	AwMSGameInfo_PracticeRoundEnded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.IsRoundLimitReached
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::IsRoundLimitReached()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.IsRoundLimitReached");

	AwMSGameInfo_IsRoundLimitReached_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.EndRound
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// class APawn*                   Instigator                     (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)

void AwMSGameInfo::EndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.EndRound");

	AwMSGameInfo_EndRound_Params params;
	params.RoundEndReason = RoundEndReason;
	params.Instigator = Instigator;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.NotifyEndRound
// (Defined, Public)

void AwMSGameInfo::NotifyEndRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NotifyEndRound");

	AwMSGameInfo_NotifyEndRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.NotifyBeginRound
// (Defined, Public)

void AwMSGameInfo::NotifyBeginRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NotifyBeginRound");

	AwMSGameInfo_NotifyBeginRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.CalcRoundResultPoints
// (Public)
// Parameters:
// int                            ScoringTeam                    (Parm)

void AwMSGameInfo::CalcRoundResultPoints(int ScoringTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CalcRoundResultPoints");

	AwMSGameInfo_CalcRoundResultPoints_Params params;
	params.ScoringTeam = ScoringTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ProcessEndGame
// (Defined, Public)

void AwMSGameInfo::ProcessEndGame()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ProcessEndGame");

	AwMSGameInfo_ProcessEndGame_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.PlayEndOfMatchMessage
// (Defined, Public)

void AwMSGameInfo::PlayEndOfMatchMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.PlayEndOfMatchMessage");

	AwMSGameInfo_PlayEndOfMatchMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.CheckEndGame
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Winner                         (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::CheckEndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CheckEndGame");

	AwMSGameInfo_CheckEndGame_Params params;
	params.Winner = Winner;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.SceneStarted
// (Defined, Event, Public)
// Parameters:
// class ASceneManager*           SM                             (Parm)
// class AActor*                  Other                          (Parm)

void AwMSGameInfo::SceneStarted(class ASceneManager* SM, class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.SceneStarted");

	AwMSGameInfo_SceneStarted_Params params;
	params.SM = SM;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ProcessRespawn
// (Defined, Public)

void AwMSGameInfo::ProcessRespawn()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ProcessRespawn");

	AwMSGameInfo_ProcessRespawn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ExplodeBomb
// (Defined, Public)

void AwMSGameInfo::ExplodeBomb()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ExplodeBomb");

	AwMSGameInfo_ExplodeBomb_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ProcessEndRound
// (Defined, Public)

void AwMSGameInfo::ProcessEndRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ProcessEndRound");

	AwMSGameInfo_ProcessEndRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.GetTimeSecondsLeft
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwMSGameInfo::GetTimeSecondsLeft()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GetTimeSecondsLeft");

	AwMSGameInfo_GetTimeSecondsLeft_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.CheckEndGameAfterRoundTimeOver
// (Public)

void AwMSGameInfo::CheckEndGameAfterRoundTimeOver()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CheckEndGameAfterRoundTimeOver");

	AwMSGameInfo_CheckEndGameAfterRoundTimeOver_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.fEndRound
// (Defined, Exec, Public)
// Parameters:
// unsigned char                  Team                           (Parm)

void AwMSGameInfo::fEndRound(unsigned char Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.fEndRound");

	AwMSGameInfo_fEndRound_Params params;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.OnRoundTimeOverWithoutObjectPlanted
// (Defined, Public)

void AwMSGameInfo::OnRoundTimeOverWithoutObjectPlanted()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.OnRoundTimeOverWithoutObjectPlanted");

	AwMSGameInfo_OnRoundTimeOverWithoutObjectPlanted_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.BroadCast_AssaultRole_Message
// (Defined, Public)
// Parameters:
// class APlayerController*       C                              (Parm)

void AwMSGameInfo::BroadCast_AssaultRole_Message(class APlayerController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.BroadCast_AssaultRole_Message");

	AwMSGameInfo_BroadCast_AssaultRole_Message_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.GameObjectDropped
// (Defined, Public)
// Parameters:
// class ADecoration*             D                              (Parm)

void AwMSGameInfo::GameObjectDropped(class ADecoration* D)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.GameObjectDropped");

	AwMSGameInfo_GameObjectDropped_Params params;
	params.D = D;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.DiscardInventory
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)

void AwMSGameInfo::DiscardInventory(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.DiscardInventory");

	AwMSGameInfo_DiscardInventory_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.OnKillingDropOut
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwMSGameInfo::OnKillingDropOut(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.OnKillingDropOut");

	AwMSGameInfo_OnKillingDropOut_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.Logout
// (Defined, Public)
// Parameters:
// class AController*             Exiting                        (Parm)

void AwMSGameInfo::Logout(class AController* Exiting)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.Logout");

	AwMSGameInfo_Logout_Params params;
	params.Exiting = Exiting;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.InitGameReplicationInfo
// (Defined, Public)

void AwMSGameInfo::InitGameReplicationInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.InitGameReplicationInfo");

	AwMSGameInfo_InitGameReplicationInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.StartMatch
// (Defined, Public)

void AwMSGameInfo::StartMatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.StartMatch");

	AwMSGameInfo_StartMatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.StartMatchChangedHost
// (Defined, Public)

void AwMSGameInfo::StartMatchChangedHost()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.StartMatchChangedHost");

	AwMSGameInfo_StartMatchChangedHost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.InitGameOption
// (Defined, Public)
// Parameters:
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)

void AwMSGameInfo::InitGameOption(const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.InitGameOption");

	AwMSGameInfo_InitGameOption_Params params;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
}


// Function WMission.wMSGameInfo.InitGame
// (Defined, Event, Public)
// Parameters:
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)

void AwMSGameInfo::InitGame(const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.InitGame");

	AwMSGameInfo_InitGame_Params params;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
}


// Function WMission.wMSGameInfo.Login
// (Defined, Event, Public)
// Parameters:
// struct FString                 Portal                         (Parm, NeedCtorLink)
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)
// class APlayerController*       ReturnValue                    (Parm, OutParm, ReturnParm)

class APlayerController* AwMSGameInfo::Login(const struct FString& Portal, const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.Login");

	AwMSGameInfo_Login_Params params;
	params.Portal = Portal;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.PostBeginPlay
// (Defined, Public)

void AwMSGameInfo::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.PostBeginPlay");

	AwMSGameInfo_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.ForceObjectiveDefenderTeamIndex
// (Defined, Public)

void AwMSGameInfo::ForceObjectiveDefenderTeamIndex()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.ForceObjectiveDefenderTeamIndex");

	AwMSGameInfo_ForceObjectiveDefenderTeamIndex_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.TweakSkill
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void AwMSGameInfo::TweakSkill(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.TweakSkill");

	AwMSGameInfo_TweakSkill_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.NeverAllowTransloc
// (Defined, Static, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::STATIC_NeverAllowTransloc()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.NeverAllowTransloc");

	AwMSGameInfo_NeverAllowTransloc_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.AllowTransloc
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::AllowTransloc()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.AllowTransloc");

	AwMSGameInfo_AllowTransloc_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.DivertSpaceFighter
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMSGameInfo::DivertSpaceFighter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.DivertSpaceFighter");

	AwMSGameInfo_DivertSpaceFighter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSGameInfo.CheckReady
// (Defined, Public)

void AwMSGameInfo::CheckReady()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.CheckReady");

	AwMSGameInfo_CheckReady_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSGameInfo.Reset
// (Defined, Public)

void AwMSGameInfo::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSGameInfo.Reset");

	AwMSGameInfo_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.PrecacheAnnouncer
// (Defined, Simulated, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void AwGameObject_Bomb::PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.PrecacheAnnouncer");

	AwGameObject_Bomb_PrecacheAnnouncer_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.LogReturned
// (Defined, Public)

void AwGameObject_Bomb::LogReturned()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.LogReturned");

	AwGameObject_Bomb_LogReturned_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.HolderDied
// (Defined, Public)

void AwGameObject_Bomb::HolderDied()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.HolderDied");

	AwGameObject_Bomb_HolderDied_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.Landed
// (Defined, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)

void AwGameObject_Bomb::Landed(const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.Landed");

	AwGameObject_Bomb_Landed_Params params;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.Drop
// (Defined, Public)
// Parameters:
// struct FVector                 NewVel                         (Parm)
// struct FString                 sReason                        (OptionalParm, Parm, NeedCtorLink)

void AwGameObject_Bomb::Drop(const struct FVector& NewVel, const struct FString& sReason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.Drop");

	AwGameObject_Bomb_Drop_Params params;
	params.NewVel = NewVel;
	params.sReason = sReason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.ProcessThrowMessage
// (Defined, Public)

void AwGameObject_Bomb::ProcessThrowMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.ProcessThrowMessage");

	AwGameObject_Bomb_ProcessThrowMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.ProcessDropMessage
// (Defined, Public)

void AwGameObject_Bomb::ProcessDropMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.ProcessDropMessage");

	AwGameObject_Bomb_ProcessDropMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.ClearHolder
// (Defined, Public)

void AwGameObject_Bomb::ClearHolder()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.ClearHolder");

	AwGameObject_Bomb_ClearHolder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.SetHolder
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AwGameObject_Bomb::SetHolder(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.SetHolder");

	AwGameObject_Bomb_SetHolder_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.ProcessSetHolderMessage
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AwGameObject_Bomb::ProcessSetHolderMessage(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.ProcessSetHolderMessage");

	AwGameObject_Bomb_ProcessSetHolderMessage_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.OnSetHolder
// (Public)
// Parameters:
// class AController*             C                              (Parm)

void AwGameObject_Bomb::OnSetHolder(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.OnSetHolder");

	AwGameObject_Bomb_OnSetHolder_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.ValidHolder
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwGameObject_Bomb::ValidHolder(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.ValidHolder");

	AwGameObject_Bomb_ValidHolder_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wGameObject_Bomb.PostBeginPlay
// (Defined, Public)

void AwGameObject_Bomb::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.PostBeginPlay");

	AwGameObject_Bomb_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wGameObject_Bomb.CanBePickedUpBy
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwGameObject_Bomb::CanBePickedUpBy(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wGameObject_Bomb.CanBePickedUpBy");

	AwGameObject_Bomb_CanBePickedUpBy_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSetObjective.SetActive
// (Defined, Public)
// Parameters:
// bool                           bActiveStatus                  (Parm)

void AwSetObjective::SetActive(bool bActiveStatus)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.SetActive");

	AwSetObjective_SetActive_Params params;
	params.bActiveStatus = bActiveStatus;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.Reset
// (Defined, Public)

void AwSetObjective::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.Reset");

	AwSetObjective_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.RefreshState
// (Defined, Public)

void AwSetObjective::RefreshState()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.RefreshState");

	AwSetObjective_RefreshState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.GetObjectiveProgress
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwSetObjective::GetObjectiveProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.GetObjectiveProgress");

	AwSetObjective_GetObjectiveProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSetObjective.PlayerToucherDied
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwSetObjective::PlayerToucherDied(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.PlayerToucherDied");

	AwSetObjective_PlayerToucherDied_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.IsRelevant
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           bAliveCheck                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwSetObjective::IsRelevant(class APawn* P, bool bAliveCheck)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.IsRelevant");

	AwSetObjective_IsRelevant_Params params;
	params.P = P;
	params.bAliveCheck = bAliveCheck;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSetObjective.UnTouch
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwSetObjective::UnTouch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.UnTouch");

	AwSetObjective_UnTouch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.Touch
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwSetObjective::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.Touch");

	AwSetObjective_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.CanPlant
// (Defined, Simulated, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwSetObjective::CanPlant(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.CanPlant");

	AwSetObjective_CanPlant_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSetObjective.IsPlanting
// (Defined, Simulated, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwSetObjective::IsPlanting(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.IsPlanting");

	AwSetObjective_IsPlanting_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSetObjective.Tick
// (Defined, Event, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwSetObjective::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.Tick");

	AwSetObjective_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.SetDefuseLocation
// (Defined, Public)
// Parameters:
// struct FVector                 loc                            (Parm)
// struct FName                   Tag                            (Parm)

void AwSetObjective::SetDefuseLocation(const struct FVector& loc, const struct FName& Tag)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.SetDefuseLocation");

	AwSetObjective_SetDefuseLocation_Params params;
	params.loc = loc;
	params.Tag = Tag;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.UsedBy
// (Defined, Event, Public)
// Parameters:
// class APawn*                   User                           (Parm)

void AwSetObjective::UsedBy(class APawn* User)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.UsedBy");

	AwSetObjective_UsedBy_Params params;
	params.User = User;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSetObjective.PreBeginPlay
// (Defined, Simulated, Event, Public)

void AwSetObjective::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSetObjective.PreBeginPlay");

	AwSetObjective_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.Reset
// (Defined, Public)

void AwDiffuseObjective::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.Reset");

	AwDiffuseObjective_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.RefreshState
// (Defined, Public)

void AwDiffuseObjective::RefreshState()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.RefreshState");

	AwDiffuseObjective_RefreshState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.GetObjectiveProgress
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwDiffuseObjective::GetObjectiveProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.GetObjectiveProgress");

	AwDiffuseObjective_GetObjectiveProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wDiffuseObjective.PlayerToucherDied
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwDiffuseObjective::PlayerToucherDied(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.PlayerToucherDied");

	AwDiffuseObjective_PlayerToucherDied_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.IsRelevant
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           bAliveCheck                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDiffuseObjective::IsRelevant(class APawn* P, bool bAliveCheck)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.IsRelevant");

	AwDiffuseObjective_IsRelevant_Params params;
	params.P = P;
	params.bAliveCheck = bAliveCheck;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wDiffuseObjective.UnTouch
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwDiffuseObjective::UnTouch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.UnTouch");

	AwDiffuseObjective_UnTouch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.Touch
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwDiffuseObjective::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.Touch");

	AwDiffuseObjective_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.CanDefuse
// (Defined, Simulated, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDiffuseObjective::CanDefuse(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.CanDefuse");

	AwDiffuseObjective_CanDefuse_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wDiffuseObjective.IsDefusing
// (Defined, Simulated, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDiffuseObjective::IsDefusing(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.IsDefusing");

	AwDiffuseObjective_IsDefusing_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wDiffuseObjective.Tick
// (Defined, Event, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwDiffuseObjective::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.Tick");

	AwDiffuseObjective_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.PlayBombDefusedMessage
// (Defined, Public)
// Parameters:
// class APawn*                   TP                             (Parm)

void AwDiffuseObjective::PlayBombDefusedMessage(class APawn* TP)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.PlayBombDefusedMessage");

	AwDiffuseObjective_PlayBombDefusedMessage_Params params;
	params.TP = TP;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.OnBombDiffused
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwDiffuseObjective::OnBombDiffused(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.OnBombDiffused");

	AwDiffuseObjective_OnBombDiffused_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.UpdateBombs
// (Defined, Public)

void AwDiffuseObjective::UpdateBombs()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.UpdateBombs");

	AwDiffuseObjective_UpdateBombs_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.SetBombVisibility
// (Defined, Public)
// Parameters:
// bool                           val                            (Parm)

void AwDiffuseObjective::SetBombVisibility(bool val)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.SetBombVisibility");

	AwDiffuseObjective_SetBombVisibility_Params params;
	params.val = val;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.UsedBy
// (Defined, Event, Public)
// Parameters:
// class APawn*                   User                           (Parm)

void AwDiffuseObjective::UsedBy(class APawn* User)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.UsedBy");

	AwDiffuseObjective_UsedBy_Params params;
	params.User = User;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wDiffuseObjective.PreBeginPlay
// (Defined, Simulated, Event, Public)

void AwDiffuseObjective::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wDiffuseObjective.PreBeginPlay");

	AwDiffuseObjective_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectiveProgressDisplay.GetObjectiveDescription
// (Defined, Simulated, Public)
// Parameters:
// class AGameObjective*          Go                             (Parm)
// bool                           bDefender                      (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwObjectiveProgressDisplay::GetObjectiveDescription(class AGameObjective* Go, bool bDefender)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.GetObjectiveDescription");

	AwObjectiveProgressDisplay_GetObjectiveDescription_Params params;
	params.Go = Go;
	params.bDefender = bDefender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wObjectiveProgressDisplay.SetObjectiveColor
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AGameObjective*          Go                             (Parm)

void AwObjectiveProgressDisplay::SetObjectiveColor(class UCanvas* C, class AGameObjective* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.SetObjectiveColor");

	AwObjectiveProgressDisplay_SetObjectiveColor_Params params;
	params.C = C;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectiveProgressDisplay.AnyOptionalObjectiveCritical
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwObjectiveProgressDisplay::AnyOptionalObjectiveCritical()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.AnyOptionalObjectiveCritical");

	AwObjectiveProgressDisplay_AnyOptionalObjectiveCritical_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wObjectiveProgressDisplay.AnyPrimaryObjectivesCritical
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwObjectiveProgressDisplay::AnyPrimaryObjectivesCritical()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.AnyPrimaryObjectivesCritical");

	AwObjectiveProgressDisplay_AnyPrimaryObjectivesCritical_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wObjectiveProgressDisplay.GetGlobalObjectiveProgress
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwObjectiveProgressDisplay::GetGlobalObjectiveProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.GetGlobalObjectiveProgress");

	AwObjectiveProgressDisplay_GetGlobalObjectiveProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wObjectiveProgressDisplay.GetPrimaryObjectiveCount
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwObjectiveProgressDisplay::GetPrimaryObjectiveCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.GetPrimaryObjectiveCount");

	AwObjectiveProgressDisplay_GetPrimaryObjectiveCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wObjectiveProgressDisplay.DrawBigCurrentObjective
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// bool                           bDefender                      (Parm)
// bool                           bCheckOverlap                  (Parm)

void AwObjectiveProgressDisplay::DrawBigCurrentObjective(class UCanvas* C, bool bDefender, bool bCheckOverlap)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.DrawBigCurrentObjective");

	AwObjectiveProgressDisplay_DrawBigCurrentObjective_Params params;
	params.C = C;
	params.bDefender = bDefender;
	params.bCheckOverlap = bCheckOverlap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectiveProgressDisplay.CheckEntry
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FString                 Entry                          (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwObjectiveProgressDisplay::CheckEntry(class UCanvas* C, const struct FString& Entry)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.CheckEntry");

	AwObjectiveProgressDisplay_CheckEntry_Params params;
	params.C = C;
	params.Entry = Entry;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wObjectiveProgressDisplay.DrawObjectives
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 BoxPivot                       (Parm)
// bool                           bDefender                      (Parm)
// bool                           bGetBoxSize                    (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwObjectiveProgressDisplay::DrawObjectives(class UCanvas* C, const struct FVector& BoxPivot, bool bDefender, bool bGetBoxSize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.DrawObjectives");

	AwObjectiveProgressDisplay_DrawObjectives_Params params;
	params.C = C;
	params.BoxPivot = BoxPivot;
	params.bDefender = bDefender;
	params.bGetBoxSize = bGetBoxSize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wObjectiveProgressDisplay.PostRender
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          DeltaTime                      (Parm)
// bool                           bDefender                      (Parm)

void AwObjectiveProgressDisplay::PostRender(class UCanvas* C, float DeltaTime, bool bDefender)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.PostRender");

	AwObjectiveProgressDisplay_PostRender_Params params;
	params.C = C;
	params.DeltaTime = DeltaTime;
	params.bDefender = bDefender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectiveProgressDisplay.Initialize
// (Defined, Simulated, Public)
// Parameters:
// class AwHUD_Mission*           H                              (Parm)

void AwObjectiveProgressDisplay::Initialize(class AwHUD_Mission* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.Initialize");

	AwObjectiveProgressDisplay_Initialize_Params params;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectiveProgressDisplay.UpdateSlideScale
// (Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwObjectiveProgressDisplay::UpdateSlideScale(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.UpdateSlideScale");

	AwObjectiveProgressDisplay_UpdateSlideScale_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectiveProgressDisplay.ShowStatus
// (Simulated, Public)
// Parameters:
// bool                           bShow                          (Parm)

void AwObjectiveProgressDisplay::ShowStatus(bool bShow)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveProgressDisplay.ShowStatus");

	AwObjectiveProgressDisplay_ShowStatus_Params params;
	params.bShow = bShow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ReceiveMessage_QuestType4
// (Defined, Simulated, Event, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// int                            iRDifficult                    (OptionalParm, Parm)
// int                            iRRound                        (OptionalParm, Parm)

void AwAlienController::ReceiveMessage_QuestType4(class UClass* Message, int Switch, int iRDifficult, int iRRound)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ReceiveMessage_QuestType4");

	AwAlienController_ReceiveMessage_QuestType4_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.iRDifficult = iRDifficult;
	params.iRRound = iRRound;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ReceiveMessage_QuestType3
// (Defined, Net, NetReliable, Simulated, Event, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// int                            iRDifficult                    (OptionalParm, Parm)
// int                            iRMap                          (OptionalParm, Parm)

void AwAlienController::ReceiveMessage_QuestType3(class UClass* Message, int Switch, int iRDifficult, int iRMap)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ReceiveMessage_QuestType3");

	AwAlienController_ReceiveMessage_QuestType3_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.iRDifficult = iRDifficult;
	params.iRMap = iRMap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ReceiveMessage_QuestType2
// (Defined, Net, NetReliable, Simulated, Event, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// int                            iRMode                         (OptionalParm, Parm)
// int                            iRMap                          (OptionalParm, Parm)
// int                            iRMin                          (OptionalParm, Parm)
// int                            iRSec                          (OptionalParm, Parm)

void AwAlienController::ReceiveMessage_QuestType2(class UClass* Message, int Switch, int iRMode, int iRMap, int iRMin, int iRSec)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ReceiveMessage_QuestType2");

	AwAlienController_ReceiveMessage_QuestType2_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.iRMode = iRMode;
	params.iRMap = iRMap;
	params.iRMin = iRMin;
	params.iRSec = iRSec;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ReceiveMessage_QuestType1
// (Defined, Net, NetReliable, Simulated, Event, Public)
// Parameters:
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// int                            iRWeaponType                   (OptionalParm, Parm)
// int                            iRweaponId                     (OptionalParm, Parm)

void AwAlienController::ReceiveMessage_QuestType1(class UClass* Message, int Switch, int iRWeaponType, int iRweaponId)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ReceiveMessage_QuestType1");

	AwAlienController_ReceiveMessage_QuestType1_Params params;
	params.Message = Message;
	params.Switch = Switch;
	params.iRWeaponType = iRWeaponType;
	params.iRweaponId = iRweaponId;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ConsoleTakeHit
// (Defined, Exec, Public)

void AwAlienController::ConsoleTakeHit()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ConsoleTakeHit");

	AwAlienController_ConsoleTakeHit_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientCoolTimeSkillObject
// (Defined, Simulated, Public)
// Parameters:
// int                            iSkillID                       (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienController::ClientCoolTimeSkillObject(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientCoolTimeSkillObject");

	AwAlienController_ClientCoolTimeSkillObject_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienController.ClientCallCoolTimeSkill
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwAlienController::ClientCallCoolTimeSkill(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientCallCoolTimeSkill");

	AwAlienController_ClientCallCoolTimeSkill_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientReadyCoolTimeSkill
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwAlienController::ClientReadyCoolTimeSkill(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientReadyCoolTimeSkill");

	AwAlienController_ClientReadyCoolTimeSkill_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ProcessUseKey
// (Defined, Public)

void AwAlienController::ProcessUseKey()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ProcessUseKey");

	AwAlienController_ProcessUseKey_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.AttackedView
// (Defined, Public)
// Parameters:
// int                            iWeaponID                      (Parm)
// float                          fHitGunKick                    (Parm)
// struct FVector                 vAttacked                      (Parm)

void AwAlienController::AttackedView(int iWeaponID, float fHitGunKick, const struct FVector& vAttacked)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.AttackedView");

	AwAlienController_AttackedView_Params params;
	params.iWeaponID = iWeaponID;
	params.fHitGunKick = fHitGunKick;
	params.vAttacked = vAttacked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientChangeTeam
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// unsigned char                  InvertSideID                   (Parm)

void AwAlienController::ClientChangeTeam(unsigned char InvertSideID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientChangeTeam");

	AwAlienController_ClientChangeTeam_Params params;
	params.InvertSideID = InvertSideID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientQuickRepairByAlien
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)

void AwAlienController::ClientQuickRepairByAlien(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientQuickRepairByAlien");

	AwAlienController_ClientQuickRepairByAlien_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientUpdateDefSuccessFromInfection
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)

void AwAlienController::ClientUpdateDefSuccessFromInfection(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientUpdateDefSuccessFromInfection");

	AwAlienController_ClientUpdateDefSuccessFromInfection_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientUpdateLevelup
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// unsigned char                  byAttackLevelIndex             (Parm)

void AwAlienController::ClientUpdateLevelup(unsigned char byAttackLevelIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientUpdateLevelup");

	AwAlienController_ClientUpdateLevelup_Params params;
	params.byAttackLevelIndex = byAttackLevelIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientUpdate3rdModel
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)
// TEnumAsByte<EAlienModeType>    eType                          (Parm)
// unsigned char                  bySkinID                       (Parm)

void AwAlienController::ClientUpdate3rdModel(int PlayerID, TEnumAsByte<EAlienModeType> eType, unsigned char bySkinID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientUpdate3rdModel");

	AwAlienController_ClientUpdate3rdModel_Params params;
	params.PlayerID = PlayerID;
	params.eType = eType;
	params.bySkinID = bySkinID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.PlayerTick
// (Defined, Event, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwAlienController::PlayerTick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.PlayerTick");

	AwAlienController_PlayerTick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ServerChangePawn
// (Defined, Net, NetReliable, Public)
// Parameters:
// unsigned char                  bySkinID                       (Parm)

void AwAlienController::ServerChangePawn(unsigned char bySkinID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ServerChangePawn");

	AwAlienController_ServerChangePawn_Params params;
	params.bySkinID = bySkinID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ServerSetBase
// (Defined, Net, NetReliable, Public)

void AwAlienController::ServerSetBase()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ServerSetBase");

	AwAlienController_ServerSetBase_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.OnEndRound
// (Defined, Public)

void AwAlienController::OnEndRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.OnEndRound");

	AwAlienController_OnEndRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.SelectRadioMessage
// (Defined, Public)
// Parameters:
// int                            iKey                           (Parm)

void AwAlienController::SelectRadioMessage(int iKey)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.SelectRadioMessage");

	AwAlienController_SelectRadioMessage_Params params;
	params.iKey = iKey;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientChangeKnockBackState
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// struct FVector                 _vKnockBackDir                 (Parm)
// float                          _fKnockBackTime                (Parm)
// float                          _fKnockBackMomentum            (Parm)

void AwAlienController::ClientChangeKnockBackState(const struct FVector& _vKnockBackDir, float _fKnockBackTime, float _fKnockBackMomentum)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientChangeKnockBackState");

	AwAlienController_ClientChangeKnockBackState_Params params;
	params._vKnockBackDir = _vKnockBackDir;
	params._fKnockBackTime = _fKnockBackTime;
	params._fKnockBackMomentum = _fKnockBackMomentum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.NotifyTakeHit
// (Defined, Public)
// Parameters:
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwAlienController::NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.NotifyTakeHit");

	AwAlienController_NotifyTakeHit_Params params;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.Momentum = Momentum;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.CallCoolTimeSkill
// (Defined, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwAlienController::CallCoolTimeSkill(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.CallCoolTimeSkill");

	AwAlienController_CallCoolTimeSkill_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ServerUse
// (Defined, Net, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienController::ServerUse()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ServerUse");

	AwAlienController_ServerUse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienController.UpdateHitMoveEffectFromWeapon
// (Defined, Public)
// Parameters:
// class UwWeaponBaseParams*      WBP                            (Parm)

void AwAlienController::UpdateHitMoveEffectFromWeapon(class UwWeaponBaseParams* WBP)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.UpdateHitMoveEffectFromWeapon");

	AwAlienController_UpdateHitMoveEffectFromWeapon_Params params;
	params.WBP = WBP;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.GetHitGunKick
// (Defined, Public)
// Parameters:
// class UwWeaponBaseParams*      WBP                            (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwAlienController::GetHitGunKick(class UwWeaponBaseParams* WBP)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.GetHitGunKick");

	AwAlienController_GetHitGunKick_Params params;
	params.WBP = WBP;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienController.GetObjType
// (Defined, Public)
// Parameters:
// TEnumAsByte<EAlienModeType>    ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<EAlienModeType> AwAlienController::GetObjType()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.GetObjType");

	AwAlienController_GetObjType_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienController.UnPossess
// (Defined, Public)

void AwAlienController::UnPossess()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.UnPossess");

	AwAlienController_UnPossess_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ChangeTeam
// (Defined, Public)
// Parameters:
// int                            N                              (Parm)

void AwAlienController::ChangeTeam(int N)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ChangeTeam");

	AwAlienController_ChangeTeam_Params params;
	params.N = N;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.UpdateHPValue
// (Defined, Public)
// Parameters:
// unsigned char                  bySkinID                       (Parm)
// TEnumAsByte<EAlienModeType>    eObjType                       (Parm)

void AwAlienController::UpdateHPValue(unsigned char bySkinID, TEnumAsByte<EAlienModeType> eObjType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.UpdateHPValue");

	AwAlienController_UpdateHPValue_Params params;
	params.bySkinID = bySkinID;
	params.eObjType = eObjType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.SetAlienModeType
// (Defined, Public)
// Parameters:
// TEnumAsByte<EAlienModeType>    eType                          (Parm)

void AwAlienController::SetAlienModeType(TEnumAsByte<EAlienModeType> eType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.SetAlienModeType");

	AwAlienController_SetAlienModeType_Params params;
	params.eType = eType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.PawnItemList
// (Defined, Exec, Public)

void AwAlienController::PawnItemList()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.PawnItemList");

	AwAlienController_PawnItemList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientReset
// (Defined, Net, NetReliable, Event, Public)

void AwAlienController::ClientReset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientReset");

	AwAlienController_ClientReset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientOnEndWaitingForStart
// (Defined, Net, NetReliable, Simulated, Public)

void AwAlienController::ClientOnEndWaitingForStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientOnEndWaitingForStart");

	AwAlienController_ClientOnEndWaitingForStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwAlienController::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.Possess");

	AwAlienController_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.GetInfectionLevel
// (Defined, Public)
// Parameters:
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char AwAlienController::GetInfectionLevel()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.GetInfectionLevel");

	AwAlienController_GetInfectionLevel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienController.AddInfectionLevel
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienController::AddInfectionLevel()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.AddInfectionLevel");

	AwAlienController_AddInfectionLevel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienController.RemoveSkill_Client
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwAlienController::RemoveSkill_Client(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.RemoveSkill_Client");

	AwAlienController_RemoveSkill_Client_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.AddSkill_Client
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwAlienController::AddSkill_Client(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.AddSkill_Client");

	AwAlienController_AddSkill_Client_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.AddSkill
// (Defined, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwAlienController::AddSkill(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.AddSkill");

	AwAlienController_AddSkill_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.ClientRoundEnded
// (Defined, Net, NetReliable, Public)

void AwAlienController::ClientRoundEnded()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.ClientRoundEnded");

	AwAlienController_ClientRoundEnded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienController.LocalSetPrecached
// (Defined, Public)

void AwAlienController::LocalSetPrecached()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienController.LocalSetPrecached");

	AwAlienController_LocalSetPrecached_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameReplicationInfo.Reset
// (Defined, Public)

void AwAlienGameReplicationInfo::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameReplicationInfo.Reset");

	AwAlienGameReplicationInfo_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameReplicationInfo.IsCanRespawnTime
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameReplicationInfo::IsCanRespawnTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameReplicationInfo.IsCanRespawnTime");

	AwAlienGameReplicationInfo_IsCanRespawnTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameReplicationInfo.GetAttackLevelIndex
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameReplicationInfo::GetAttackLevelIndex()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameReplicationInfo.GetAttackLevelIndex");

	AwAlienGameReplicationInfo_GetAttackLevelIndex_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameReplicationInfo.GetCurTeamMemberCount
// (Defined, Simulated, Public)
// Parameters:
// int                            TeamIndex                      (Parm)
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char AwAlienGameReplicationInfo::GetCurTeamMemberCount(int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameReplicationInfo.GetCurTeamMemberCount");

	AwAlienGameReplicationInfo_GetCurTeamMemberCount_Params params;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameReplicationInfo.GetMaxRound
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameReplicationInfo::GetMaxRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameReplicationInfo.GetMaxRound");

	AwAlienGameReplicationInfo_GetMaxRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameReplicationInfo.GetCurAlienModeWaitingTimeCount
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameReplicationInfo::GetCurAlienModeWaitingTimeCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameReplicationInfo.GetCurAlienModeWaitingTimeCount");

	AwAlienGameReplicationInfo_GetCurAlienModeWaitingTimeCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameReplicationInfo.GetStartPlayerCountOfCurRound
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameReplicationInfo::GetStartPlayerCountOfCurRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameReplicationInfo.GetStartPlayerCountOfCurRound");

	AwAlienGameReplicationInfo_GetStartPlayerCountOfCurRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHudPart_MinimapAlienGame.IsSameTeamByPRI
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  pri1                           (Parm)
// class APlayerReplicationInfo*  pri2                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHudPart_MinimapAlienGame::IsSameTeamByPRI(class APlayerReplicationInfo* pri1, class APlayerReplicationInfo* pri2)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHudPart_MinimapAlienGame.IsSameTeamByPRI");

	AwHudPart_MinimapAlienGame_IsSameTeamByPRI_Params params;
	params.pri1 = pri1;
	params.pri2 = pri2;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wHudPart_MinimapAlienGame.DrawMinimap_Allies
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapAlienGame::DrawMinimap_Allies(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHudPart_MinimapAlienGame.DrawMinimap_Allies");

	AwHudPart_MinimapAlienGame_DrawMinimap_Allies_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wHudPart_MinimapAlienGame.DrawMinimap_SpecialPositions
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwHudPart_MinimapAlienGame::DrawMinimap_SpecialPositions(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wHudPart_MinimapAlienGame.DrawMinimap_SpecialPositions");

	AwHudPart_MinimapAlienGame_DrawMinimap_SpecialPositions_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Tick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwAMPawn::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Tick");

	AwAMPawn_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.PlayDying
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwAMPawn::PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.PlayDying");

	AwAMPawn_PlayDying_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.UpdateCriticalState
// (Defined, Public)

void AwAMPawn::UpdateCriticalState()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.UpdateCriticalState");

	AwAMPawn_UpdateCriticalState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.GiveHealth
// (Defined, Public)
// Parameters:
// int                            HealAmount                     (Parm)
// int                            HealMax                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAMPawn::GiveHealth(int HealAmount, int HealMax)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.GiveHealth");

	AwAMPawn_GiveHealth_Params params;
	params.HealAmount = HealAmount;
	params.HealMax = HealMax;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAMPawn.ChangeCollisionSize
// (Defined, Simulated, Public)
// Parameters:
// float                          fRadius                        (Parm)
// float                          fHeight                        (Parm)

void AwAMPawn::ChangeCollisionSize(float fRadius, float fHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ChangeCollisionSize");

	AwAMPawn_ChangeCollisionSize_Params params;
	params.fRadius = fRadius;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.PlayDirectionalHit
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)
// bool                           bUseHitStun                    (OptionalParm, Parm)
// bool                           bGoreChange                    (OptionalParm, Parm)

void AwAMPawn::PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.PlayDirectionalHit");

	AwAMPawn_PlayDirectionalHit_Params params;
	params.HitLoc = HitLoc;
	params.bUseHitStun = bUseHitStun;
	params.bGoreChange = bGoreChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.PlayBreathSounds
// (Defined, Simulated, Public)

void AwAMPawn::PlayBreathSounds()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.PlayBreathSounds");

	AwAMPawn_PlayBreathSounds_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.TakeDamageSound
// (Defined, Public)
// Parameters:
// int                            LeftHealth                     (Parm)
// int                            ActualDamage                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// class AController*             Killer                         (OptionalParm, Parm)

void AwAMPawn::TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.TakeDamageSound");

	AwAMPawn_TakeDamageSound_Params params;
	params.LeftHealth = LeftHealth;
	params.ActualDamage = ActualDamage;
	params.HitLocation = HitLocation;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.Killer = Killer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.GetDelayedInstigatorController
// (Defined, Public)
// Parameters:
// class APawn*                   instigatedBy                   (Parm)
// class AController*             ReturnValue                    (Parm, OutParm, ReturnParm)

class AController* AwAMPawn::GetDelayedInstigatorController(class APawn* instigatedBy)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.GetDelayedInstigatorController");

	AwAMPawn_GetDelayedInstigatorController_Params params;
	params.instigatedBy = instigatedBy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAMPawn.ChangeModel
// (Defined, Simulated, Public)

void AwAMPawn::ChangeModel()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ChangeModel");

	AwAMPawn_ChangeModel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.ClientChangeModelType
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// TEnumAsByte<EAlienModeType>    eObjType                       (Parm)

void AwAMPawn::ClientChangeModelType(TEnumAsByte<EAlienModeType> eObjType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ClientChangeModelType");

	AwAMPawn_ClientChangeModelType_Params params;
	params.eObjType = eObjType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.ChangeModelType
// (Defined, Simulated, Public)
// Parameters:
// TEnumAsByte<EAlienModeType>    eObjType                       (Parm)

void AwAMPawn::ChangeModelType(TEnumAsByte<EAlienModeType> eObjType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ChangeModelType");

	AwAMPawn_ChangeModelType_Params params;
	params.eObjType = eObjType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.PlayHit
// (Defined, Public)
// Parameters:
// float                          Damage                         (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwAMPawn::PlayHit(float Damage, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.PlayHit");

	AwAMPawn_PlayHit_Params params;
	params.Damage = Damage;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.DamageType = DamageType;
	params.Momentum = Momentum;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.CalcItemUsedTime
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)

void AwAMPawn::CalcItemUsedTime(class UwMatchUserInfo* kUser)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.CalcItemUsedTime");

	AwAMPawn_CalcItemUsedTime_Params params;
	params.kUser = kUser;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.PossessedBy
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AwAMPawn::PossessedBy(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.PossessedBy");

	AwAMPawn_PossessedBy_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Setup
// (Defined, Simulated, Public)
// Parameters:
// struct FPlayerRecord           Rec                            (Parm, NeedCtorLink)
// bool                           bLoadNow                       (OptionalParm, Parm)

void AwAMPawn::Setup(const struct FPlayerRecord& Rec, bool bLoadNow)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Setup");

	AwAMPawn_Setup_Params params;
	params.Rec = Rec;
	params.bLoadNow = bLoadNow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.ClientReStart
// (Defined, Simulated, Public)

void AwAMPawn::ClientReStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ClientReStart");

	AwAMPawn_ClientReStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.MakeDefecneSuccessEffect
// (Defined, Simulated, Public)

void AwAMPawn::MakeDefecneSuccessEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.MakeDefecneSuccessEffect");

	AwAMPawn_MakeDefecneSuccessEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.MakeAttackLevelEffect
// (Defined, Simulated, Public)
// Parameters:
// unsigned char                  byAttackLevelIndex             (Parm)

void AwAMPawn::MakeAttackLevelEffect(unsigned char byAttackLevelIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.MakeAttackLevelEffect");

	AwAMPawn_MakeAttackLevelEffect_Params params;
	params.byAttackLevelIndex = byAttackLevelIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.MakeShieldEffect
// (Defined, Simulated, Public)

void AwAMPawn::MakeShieldEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.MakeShieldEffect");

	AwAMPawn_MakeShieldEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.CallEffect_PHJ
// (Defined, Exec, Public)

void AwAMPawn::CallEffect_PHJ()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.CallEffect_PHJ");

	AwAMPawn_CallEffect_PHJ_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.MakeTransformEffect
// (Defined, Simulated, Public)

void AwAMPawn::MakeTransformEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.MakeTransformEffect");

	AwAMPawn_MakeTransformEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Destroyed
// (Defined, Simulated, Public)

void AwAMPawn::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Destroyed");

	AwAMPawn_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.ProcessHitFX
// (Defined, Simulated, Public)

void AwAMPawn::ProcessHitFX()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ProcessHitFX");

	AwAMPawn_ProcessHitFX_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.UpdateDied
// (Defined, Public)
// Parameters:
// int                            ActualDamage                   (Parm)
// class AController*             Killer                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwAMPawn::UpdateDied(int ActualDamage, class AController* Killer, class UClass* DamageType, const struct FVector& HitLocation, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.UpdateDied");

	AwAMPawn_UpdateDied_Params params;
	params.ActualDamage = ActualDamage;
	params.Killer = Killer;
	params.DamageType = DamageType;
	params.HitLocation = HitLocation;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Process_TossWeapon_When_Dying
// (Defined, Public)
// Parameters:
// class ALevelInfo*              levenInfo                      (Parm)
// class APawn*                   Pawn                           (Parm)
// class AwWeapon*                Weapon                         (Parm)

void AwAMPawn::Process_TossWeapon_When_Dying(class ALevelInfo* levenInfo, class APawn* Pawn, class AwWeapon* Weapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Process_TossWeapon_When_Dying");

	AwAMPawn_Process_TossWeapon_When_Dying_Params params;
	params.levenInfo = levenInfo;
	params.Pawn = Pawn;
	params.Weapon = Weapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.TakeDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwAMPawn::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.TakeDamage");

	AwAMPawn_TakeDamage_Params params;
	params.Damage = Damage;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.Momentum = Momentum;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.ServerChangedWeapon
// (Defined, Net, NetReliable, Public)
// Parameters:
// class AwWeapon*                OldWeapon                      (Parm)
// class AwWeapon*                newWeapon                      (Parm)

void AwAMPawn::ServerChangedWeapon(class AwWeapon* OldWeapon, class AwWeapon* newWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ServerChangedWeapon");

	AwAMPawn_ServerChangedWeapon_Params params;
	params.OldWeapon = OldWeapon;
	params.newWeapon = newWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.ClientPickupWeapon
// (Defined, Simulated, Public)

void AwAMPawn::ClientPickupWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ClientPickupWeapon");

	AwAMPawn_ClientPickupWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.ChangedWeapon
// (Defined, Public)

void AwAMPawn::ChangedWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.ChangedWeapon");

	AwAMPawn_ChangedWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.AddDefaultSkills
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAMPawn::AddDefaultSkills(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.AddDefaultSkills");

	AwAMPawn_AddDefaultSkills_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAMPawn::AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.AddDefaultInventory");

	AwAMPawn_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.PlayMelee
// (Defined, Simulated, Public)
// Parameters:
// bool                           bMeleeKnifeOrButt              (Parm)

void AwAMPawn::PlayMelee(bool bMeleeKnifeOrButt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.PlayMelee");

	AwAMPawn_PlayMelee_Params params;
	params.bMeleeKnifeOrButt = bMeleeKnifeOrButt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.StartFiring
// (Defined, Simulated, Public)
// Parameters:
// bool                           bHeavy                         (Parm)
// bool                           bRapid                         (Parm)

void AwAMPawn::StartFiring(bool bHeavy, bool bRapid)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.StartFiring");

	AwAMPawn_StartFiring_Params params;
	params.bHeavy = bHeavy;
	params.bRapid = bRapid;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.GetBloodHitClass
// (Defined, Simulated, Public)
// Parameters:
// bool                           bHeadShot                      (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwAMPawn::GetBloodHitClass(bool bHeadShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.GetBloodHitClass");

	AwAMPawn_GetBloodHitClass_Params params;
	params.bHeadShot = bHeadShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAMPawn.GetSprintJumpZ
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwAMPawn::GetSprintJumpZ()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.GetSprintJumpZ");

	AwAMPawn_GetSprintJumpZ_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAMPawn.Alien_PlayBreathSound
// (Defined, Simulated, Public)

void AwAMPawn::Alien_PlayBreathSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_PlayBreathSound");

	AwAMPawn_Alien_PlayBreathSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_TakeDamageSound
// (Defined, Public)
// Parameters:
// int                            LeftHealth                     (Parm)
// int                            ActualDamage                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// class AController*             Killer                         (OptionalParm, Parm)

void AwAMPawn::Alien_TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_TakeDamageSound");

	AwAMPawn_Alien_TakeDamageSound_Params params;
	params.LeftHealth = LeftHealth;
	params.ActualDamage = ActualDamage;
	params.HitLocation = HitLocation;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.Killer = Killer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_GetBloodHitClass
// (Defined, Simulated, Public)
// Parameters:
// bool                           bHeadShot                      (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwAMPawn::Alien_GetBloodHitClass(bool bHeadShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_GetBloodHitClass");

	AwAMPawn_Alien_GetBloodHitClass_Params params;
	params.bHeadShot = bHeadShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAMPawn.Alien_ClientPickupWeapon
// (Defined, Simulated, Public)

void AwAMPawn::Alien_ClientPickupWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_ClientPickupWeapon");

	AwAMPawn_Alien_ClientPickupWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_GetBaseStaminaTime
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwAMPawn::Alien_GetBaseStaminaTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_GetBaseStaminaTime");

	AwAMPawn_Alien_GetBaseStaminaTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAMPawn.Alien_GetSprintJumpZ
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwAMPawn::Alien_GetSprintJumpZ()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_GetSprintJumpZ");

	AwAMPawn_Alien_GetSprintJumpZ_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAMPawn.Alien_ServerChangedWeapon
// (Defined, Public)
// Parameters:
// class AwWeapon*                OldWeapon                      (Parm)
// class AwWeapon*                newWeapon                      (Parm)

void AwAMPawn::Alien_ServerChangedWeapon(class AwWeapon* OldWeapon, class AwWeapon* newWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_ServerChangedWeapon");

	AwAMPawn_Alien_ServerChangedWeapon_Params params;
	params.OldWeapon = OldWeapon;
	params.newWeapon = newWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_ChangedWeapon
// (Defined, Public)

void AwAMPawn::Alien_ChangedWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_ChangedWeapon");

	AwAMPawn_Alien_ChangedWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_PlayDefence
// (Defined, Simulated, Public)

void AwAMPawn::Alien_PlayDefence()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_PlayDefence");

	AwAMPawn_Alien_PlayDefence_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_PlayMelee
// (Defined, Simulated, Public)
// Parameters:
// bool                           bMeleeKnifeOrButt              (Parm)

void AwAMPawn::Alien_PlayMelee(bool bMeleeKnifeOrButt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_PlayMelee");

	AwAMPawn_Alien_PlayMelee_Params params;
	params.bMeleeKnifeOrButt = bMeleeKnifeOrButt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_StartFiring
// (Defined, Simulated, Public)
// Parameters:
// bool                           bHeavy                         (Parm)
// bool                           bRapid                         (Parm)

void AwAMPawn::Alien_StartFiring(bool bHeavy, bool bRapid)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_StartFiring");

	AwAMPawn_Alien_StartFiring_Params params;
	params.bHeavy = bHeavy;
	params.bRapid = bRapid;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_TakeDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwAMPawn::Alien_TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_TakeDamage");

	AwAMPawn_Alien_TakeDamage_Params params;
	params.Damage = Damage;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.Momentum = Momentum;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_AddDefaultSkills
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAMPawn::Alien_AddDefaultSkills(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_AddDefaultSkills");

	AwAMPawn_Alien_AddDefaultSkills_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAMPawn::Alien_AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_AddDefaultInventory");

	AwAMPawn_Alien_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Alien_InitStatus
// (Defined, Simulated, Public)

void AwAMPawn::Alien_InitStatus()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Alien_InitStatus");

	AwAMPawn_Alien_InitStatus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Human_ClientPickupWeapon
// (Defined, Simulated, Public)

void AwAMPawn::Human_ClientPickupWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Human_ClientPickupWeapon");

	AwAMPawn_Human_ClientPickupWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Human_UpdateDied
// (Defined, Public)
// Parameters:
// int                            ActualDamage                   (Parm)
// class AController*             Killer                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwAMPawn::Human_UpdateDied(int ActualDamage, class AController* Killer, class UClass* DamageType, const struct FVector& HitLocation, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Human_UpdateDied");

	AwAMPawn_Human_UpdateDied_Params params;
	params.ActualDamage = ActualDamage;
	params.Killer = Killer;
	params.DamageType = DamageType;
	params.HitLocation = HitLocation;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Human_TakeDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwAMPawn::Human_TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Human_TakeDamage");

	AwAMPawn_Human_TakeDamage_Params params;
	params.Damage = Damage;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.Momentum = Momentum;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Human_AddDefaultSkills
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAMPawn::Human_AddDefaultSkills(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Human_AddDefaultSkills");

	AwAMPawn_Human_AddDefaultSkills_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAMPawn.Human_AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAMPawn::Human_AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAMPawn.Human_AddDefaultInventory");

	AwAMPawn_Human_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.IsAnyPawnWithinRadius
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        N                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::IsAnyPawnWithinRadius(class ANavigationPoint* N)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.IsAnyPawnWithinRadius");

	AwAlienGameInfo_IsAnyPawnWithinRadius_Params params;
	params.N = N;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.CanSpectate
// (Defined, Public)
// Parameters:
// class APlayerController*       Viewer                         (Parm)
// bool                           bOnlySpectator                 (Parm)
// class AActor*                  ViewTarget                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.CanSpectate");

	AwAlienGameInfo_CanSpectate_Params params;
	params.Viewer = Viewer;
	params.bOnlySpectator = bOnlySpectator;
	params.ViewTarget = ViewTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.IsRightTimeForRespawn
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::IsRightTimeForRespawn(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.IsRightTimeForRespawn");

	AwAlienGameInfo_IsRightTimeForRespawn_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.AlienGame_Levelup
// (Defined, Exec, Public)

void AwAlienGameInfo::AlienGame_Levelup()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.AlienGame_Levelup");

	AwAlienGameInfo_AlienGame_Levelup_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.AlienGame_Respawn
// (Defined, Exec, Public)
// Parameters:
// int                            Num                            (Parm)

void AwAlienGameInfo::AlienGame_Respawn(int Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.AlienGame_Respawn");

	AwAlienGameInfo_AlienGame_Respawn_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.AlienGame_TimeOver
// (Defined, Exec, Public)

void AwAlienGameInfo::AlienGame_TimeOver()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.AlienGame_TimeOver");

	AwAlienGameInfo_AlienGame_TimeOver_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.AlienGame_HumanWin
// (Defined, Exec, Public)

void AwAlienGameInfo::AlienGame_HumanWin()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.AlienGame_HumanWin");

	AwAlienGameInfo_AlienGame_HumanWin_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.AlienGame_AlienWin
// (Defined, Exec, Public)

void AwAlienGameInfo::AlienGame_AlienWin()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.AlienGame_AlienWin");

	AwAlienGameInfo_AlienGame_AlienWin_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.AlienGame_Exit
// (Defined, Exec, Public)

void AwAlienGameInfo::AlienGame_Exit()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.AlienGame_Exit");

	AwAlienGameInfo_AlienGame_Exit_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.GetWinTeamAD
// (Defined, Public)
// Parameters:
// int                            winTeam                        (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameInfo::GetWinTeamAD(int winTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.GetWinTeamAD");

	AwAlienGameInfo_GetWinTeamAD_Params params;
	params.winTeam = winTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.GetWinTeam
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameInfo::GetWinTeam(TEnumAsByte<ERER_Reason> RoundEndReason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.GetWinTeam");

	AwAlienGameInfo_GetWinTeam_Params params;
	params.RoundEndReason = RoundEndReason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.GetRoundEndType
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameInfo::GetRoundEndType(TEnumAsByte<ERER_Reason> RoundEndReason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.GetRoundEndType");

	AwAlienGameInfo_GetRoundEndType_Params params;
	params.RoundEndReason = RoundEndReason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.ServerLogEndRound
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// class APawn*                   Instigator                     (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)

void AwAlienGameInfo::ServerLogEndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ServerLogEndRound");

	AwAlienGameInfo_ServerLogEndRound_Params params;
	params.RoundEndReason = RoundEndReason;
	params.Instigator = Instigator;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.GetAttackBuff
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwAlienGameInfo::GetAttackBuff()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.GetAttackBuff");

	AwAlienGameInfo_GetAttackBuff_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.NeedPlayers
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::NeedPlayers()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.NeedPlayers");

	AwAlienGameInfo_NeedPlayers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.ProcessSwitchTeam
// (Defined, Public)
// Parameters:
// bool                           bNoReset                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::ProcessSwitchTeam(bool bNoReset)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ProcessSwitchTeam");

	AwAlienGameInfo_ProcessSwitchTeam_Params params;
	params.bNoReset = bNoReset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.FindAlienModeStart
// (Defined, Public)
// Parameters:
// bool                           bAlien                         (Parm)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwAlienGameInfo::FindAlienModeStart(bool bAlien)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.FindAlienModeStart");

	AwAlienGameInfo_FindAlienModeStart_Params params;
	params.bAlien = bAlien;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.FindPlayerStart
// (Defined, Public)
// Parameters:
// class AController*             Player                         (Parm)
// unsigned char                  inTeam                         (OptionalParm, Parm)
// struct FString                 incomingName                   (OptionalParm, Parm, NeedCtorLink)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwAlienGameInfo::FindPlayerStart(class AController* Player, unsigned char inTeam, const struct FString& incomingName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.FindPlayerStart");

	AwAlienGameInfo_FindPlayerStart_Params params;
	params.Player = Player;
	params.inTeam = inTeam;
	params.incomingName = incomingName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.InitializeEveryPlayerStarts
// (Defined, Public)

void AwAlienGameInfo::InitializeEveryPlayerStarts()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.InitializeEveryPlayerStarts");

	AwAlienGameInfo_InitializeEveryPlayerStarts_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.EndRound
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// class APawn*                   Instigator                     (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)

void AwAlienGameInfo::EndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.EndRound");

	AwAlienGameInfo_EndRound_Params params;
	params.RoundEndReason = RoundEndReason;
	params.Instigator = Instigator;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.IsRoundLimitReached
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::IsRoundLimitReached()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.IsRoundLimitReached");

	AwAlienGameInfo_IsRoundLimitReached_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.ResetItemDrop
// (Defined, Public)

void AwAlienGameInfo::ResetItemDrop()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ResetItemDrop");

	AwAlienGameInfo_ResetItemDrop_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.ExecuteItemDrop
// (Defined, Public)

void AwAlienGameInfo::ExecuteItemDrop()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ExecuteItemDrop");

	AwAlienGameInfo_ExecuteItemDrop_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.InGameRoundEnd
// (Defined, Public)

void AwAlienGameInfo::InGameRoundEnd()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.InGameRoundEnd");

	AwAlienGameInfo_InGameRoundEnd_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.InGameAlienMode
// (Defined, Public)

void AwAlienGameInfo::InGameAlienMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.InGameAlienMode");

	AwAlienGameInfo_InGameAlienMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.InGameAppearAlien
// (Defined, Public)

void AwAlienGameInfo::InGameAppearAlien()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.InGameAppearAlien");

	AwAlienGameInfo_InGameAppearAlien_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.ProcessGameLogic
// (Public, Delegate)

void AwAlienGameInfo::ProcessGameLogic()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ProcessGameLogic");

	AwAlienGameInfo_ProcessGameLogic_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.CheckLives
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::CheckLives(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.CheckLives");

	AwAlienGameInfo_CheckLives_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.ReduceDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   injured                        (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm, OutParm)
// class UClass*                  DamageType                     (Parm)
// int                            iWeaponType                    (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAlienGameInfo::ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ReduceDamage");

	AwAlienGameInfo_ReduceDamage_Params params;
	params.Damage = Damage;
	params.injured = injured;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.DamageType = DamageType;
	params.iWeaponType = iWeaponType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Momentum != nullptr)
		*Momentum = params.Momentum;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.CheckEndGameAfterRoundTimeOver
// (Defined, Public)

void AwAlienGameInfo::CheckEndGameAfterRoundTimeOver()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.CheckEndGameAfterRoundTimeOver");

	AwAlienGameInfo_CheckEndGameAfterRoundTimeOver_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.EndGameByTeamNoneLeft
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Living                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::EndGameByTeamNoneLeft(class APlayerReplicationInfo* Living)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.EndGameByTeamNoneLeft");

	AwAlienGameInfo_EndGameByTeamNoneLeft_Params params;
	params.Living = Living;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.CheckScore
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)

void AwAlienGameInfo::CheckScore(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.CheckScore");

	AwAlienGameInfo_CheckScore_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.CheckMaxLives
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::CheckMaxLives(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.CheckMaxLives");

	AwAlienGameInfo_CheckMaxLives_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.IsRespawnRestrictionTime
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::IsRespawnRestrictionTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.IsRespawnRestrictionTime");

	AwAlienGameInfo_IsRespawnRestrictionTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.CheckLastMan
// (Defined, Public)
// Parameters:
// int                            TeamIndex                      (Parm)

void AwAlienGameInfo::CheckLastMan(int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.CheckLastMan");

	AwAlienGameInfo_CheckLastMan_Params params;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.ProcessQuickRepairByAlien
// (Defined, Public)
// Parameters:
// int                            PlayerID                       (Parm)

void AwAlienGameInfo::ProcessQuickRepairByAlien(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ProcessQuickRepairByAlien");

	AwAlienGameInfo_ProcessQuickRepairByAlien_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.ProcessDefSuccessFromInfection
// (Defined, Public)
// Parameters:
// int                            PlayerID                       (Parm)

void AwAlienGameInfo::ProcessDefSuccessFromInfection(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ProcessDefSuccessFromInfection");

	AwAlienGameInfo_ProcessDefSuccessFromInfection_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.ChangeAttackLevel
// (Defined, Public)
// Parameters:
// unsigned char                  byAttackLevelIndex             (Parm)

void AwAlienGameInfo::ChangeAttackLevel(unsigned char byAttackLevelIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ChangeAttackLevel");

	AwAlienGameInfo_ChangeAttackLevel_Params params;
	params.byAttackLevelIndex = byAttackLevelIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.ChangePawn
// (Defined, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)

void AwAlienGameInfo::ChangePawn(class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.ChangePawn");

	AwAlienGameInfo_ChangePawn_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.Killed
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwAlienGameInfo::Killed(class AController* Killer, class AController* Killed, class APawn* KilledPawn, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.Killed");

	AwAlienGameInfo_Killed_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.StartAlienMode
// (Defined, Public)

void AwAlienGameInfo::StartAlienMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.StartAlienMode");

	AwAlienGameInfo_StartAlienMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.BeginRound
// (Defined, Public)
// Parameters:
// bool                           bNoReset                       (OptionalParm, Parm)

void AwAlienGameInfo::BeginRound(bool bNoReset)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.BeginRound");

	AwAlienGameInfo_BeginRound_Params params;
	params.bNoReset = bNoReset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.IsAppropriateRespawnPoint
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        N                              (Parm)
// unsigned char                  Team                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAlienGameInfo::IsAppropriateRespawnPoint(class ANavigationPoint* N, unsigned char Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.IsAppropriateRespawnPoint");

	AwAlienGameInfo_IsAppropriateRespawnPoint_Params params;
	params.N = N;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wAlienGameInfo.Logout
// (Defined, Public)
// Parameters:
// class AController*             Exiting                        (Parm)

void AwAlienGameInfo::Logout(class AController* Exiting)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.Logout");

	AwAlienGameInfo_Logout_Params params;
	params.Exiting = Exiting;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wAlienGameInfo.InitGame
// (Defined, Event, Public)
// Parameters:
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)

void AwAlienGameInfo::InitGame(const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wAlienGameInfo.InitGame");

	AwAlienGameInfo_InitGame_Params params;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
}


// Function WMission.wBombObjective.PrecacheAnnouncer
// (Defined, Simulated, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void AwBombObjective::PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wBombObjective.PrecacheAnnouncer");

	AwBombObjective_PrecacheAnnouncer_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wBombObjective.Reset
// (Defined, Public)

void AwBombObjective::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wBombObjective.Reset");

	AwBombObjective_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wBombObjective.BetterObjectiveThan
// (Defined, Public)
// Parameters:
// class AGameObjective*          Best                           (Parm)
// unsigned char                  DesiredTeamNum                 (Parm)
// unsigned char                  RequesterTeamNum               (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBombObjective::BetterObjectiveThan(class AGameObjective* Best, unsigned char DesiredTeamNum, unsigned char RequesterTeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wBombObjective.BetterObjectiveThan");

	AwBombObjective_BetterObjectiveThan_Params params;
	params.Best = Best;
	params.DesiredTeamNum = DesiredTeamNum;
	params.RequesterTeamNum = RequesterTeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wBombObjective.BotNearObjective
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBombObjective::BotNearObjective(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wBombObjective.BotNearObjective");

	AwBombObjective_BotNearObjective_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wBombObjective.SetActive
// (Defined, Public)
// Parameters:
// bool                           bActiveStatus                  (Parm)

void AwBombObjective::SetActive(bool bActiveStatus)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wBombObjective.SetActive");

	AwBombObjective_SetActive_Params params;
	params.bActiveStatus = bActiveStatus;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wBombObjective.PreBeginPlay
// (Defined, Simulated, Event, Public)

void AwBombObjective::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wBombObjective.PreBeginPlay");

	AwBombObjective_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMessage_MSKillMessages.ClientReceive
// (Defined, Simulated, Static, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AwMessage_MSKillMessages::STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMessage_MSKillMessages.ClientReceive");

	AwMessage_MSKillMessages_ClientReceive_Params params;
	params.P = P;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMessage_MSKillMessages.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AwMessage_MSKillMessages::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMessage_MSKillMessages.GetString");

	AwMessage_MSKillMessages_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wMSCinematic_SceneManager.SceneEnded
// (Defined, Event, Public)

void AwMSCinematic_SceneManager::SceneEnded()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_SceneManager.SceneEnded");

	AwMSCinematic_SceneManager_SceneEnded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_SceneManager.ShotEnded
// (Defined, Event, Public)
// Parameters:
// class AwMSCinematic_Camera*    cam                            (Parm)

void AwMSCinematic_SceneManager::ShotEnded(class AwMSCinematic_Camera* cam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_SceneManager.ShotEnded");

	AwMSCinematic_SceneManager_ShotEnded_Params params;
	params.cam = cam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_SceneManager.PlayScene
// (Defined, Public)

void AwMSCinematic_SceneManager::PlayScene()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_SceneManager.PlayScene");

	AwMSCinematic_SceneManager_PlayScene_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_SceneManager.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwMSCinematic_SceneManager::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_SceneManager.Trigger");

	AwMSCinematic_SceneManager_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_SceneManager.PostBeginPlay
// (Defined, Public)

void AwMSCinematic_SceneManager::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_SceneManager.PostBeginPlay");

	AwMSCinematic_SceneManager_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.EndGameByTeamNoneLeft
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Living                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwSDGameInfo::EndGameByTeamNoneLeft(class APlayerReplicationInfo* Living)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.EndGameByTeamNoneLeft");

	AwSDGameInfo_EndGameByTeamNoneLeft_Params params;
	params.Living = Living;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSDGameInfo.AnnounceAlmostWinningTeam
// (Defined, Public)

void AwSDGameInfo::AnnounceAlmostWinningTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.AnnounceAlmostWinningTeam");

	AwSDGameInfo_AnnounceAlmostWinningTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.AnnounceWinningTeam
// (Defined, Public)

void AwSDGameInfo::AnnounceWinningTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.AnnounceWinningTeam");

	AwSDGameInfo_AnnounceWinningTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.GetResultPointRatio_Intervention
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwSDGameInfo::GetResultPointRatio_Intervention(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.GetResultPointRatio_Intervention");

	AwSDGameInfo_GetResultPointRatio_Intervention_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSDGameInfo.SetPRI4Intervention
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)

void AwSDGameInfo::SetPRI4Intervention(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.SetPRI4Intervention");

	AwSDGameInfo_SetPRI4Intervention_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.CalcRoundResultPoints
// (Defined, Public)
// Parameters:
// int                            ScoringTeam                    (Parm)

void AwSDGameInfo::CalcRoundResultPoints(int ScoringTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.CalcRoundResultPoints");

	AwSDGameInfo_CalcRoundResultPoints_Params params;
	params.ScoringTeam = ScoringTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.CalcResultPoints
// (Defined, Public)

void AwSDGameInfo::CalcResultPoints()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.CalcResultPoints");

	AwSDGameInfo_CalcResultPoints_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.AnnounceMatchInfo
// (Defined, Public)

void AwSDGameInfo::AnnounceMatchInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.AnnounceMatchInfo");

	AwSDGameInfo_AnnounceMatchInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.AnnounceSwitchTeam
// (Defined, Public)

void AwSDGameInfo::AnnounceSwitchTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.AnnounceSwitchTeam");

	AwSDGameInfo_AnnounceSwitchTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.PrecacheGameAnnouncements
// (Defined, Static, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void AwSDGameInfo::STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.PrecacheGameAnnouncements");

	AwSDGameInfo_PrecacheGameAnnouncements_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.InitializeSetObjectives
// (Defined, Public)

void AwSDGameInfo::InitializeSetObjectives()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.InitializeSetObjectives");

	AwSDGameInfo_InitializeSetObjectives_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.EndRound
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// class APawn*                   Instigator                     (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)

void AwSDGameInfo::EndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.EndRound");

	AwSDGameInfo_EndRound_Params params;
	params.RoundEndReason = RoundEndReason;
	params.Instigator = Instigator;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.ServerLogEndRound
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// class APawn*                   Instigator                     (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)

void AwSDGameInfo::ServerLogEndRound(TEnumAsByte<ERER_Reason> RoundEndReason, class APawn* Instigator, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.ServerLogEndRound");

	AwSDGameInfo_ServerLogEndRound_Params params;
	params.RoundEndReason = RoundEndReason;
	params.Instigator = Instigator;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.GetWinTeamAD
// (Defined, Public)
// Parameters:
// int                            winTeam                        (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwSDGameInfo::GetWinTeamAD(int winTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.GetWinTeamAD");

	AwSDGameInfo_GetWinTeamAD_Params params;
	params.winTeam = winTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSDGameInfo.GetWinTeam
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwSDGameInfo::GetWinTeam(TEnumAsByte<ERER_Reason> RoundEndReason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.GetWinTeam");

	AwSDGameInfo_GetWinTeam_Params params;
	params.RoundEndReason = RoundEndReason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSDGameInfo.GetRoundEndType
// (Defined, Public)
// Parameters:
// TEnumAsByte<ERER_Reason>       RoundEndReason                 (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwSDGameInfo::GetRoundEndType(TEnumAsByte<ERER_Reason> RoundEndReason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.GetRoundEndType");

	AwSDGameInfo_GetRoundEndType_Params params;
	params.RoundEndReason = RoundEndReason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSDGameInfo.CountPlayersByTeam
// (Defined, Public)
// Parameters:
// int                            Team                           (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwSDGameInfo::CountPlayersByTeam(int Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.CountPlayersByTeam");

	AwSDGameInfo_CountPlayersByTeam_Params params;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSDGameInfo.AnnounceBeginRound
// (Defined, Public)

void AwSDGameInfo::AnnounceBeginRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.AnnounceBeginRound");

	AwSDGameInfo_AnnounceBeginRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.BeginRound
// (Defined, Public)
// Parameters:
// bool                           bNoReset                       (OptionalParm, Parm)

void AwSDGameInfo::BeginRound(bool bNoReset)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.BeginRound");

	AwSDGameInfo_BeginRound_Params params;
	params.bNoReset = bNoReset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.OnBombDiffused
// (Defined, Public)
// Parameters:
// class APawn*                   TP                             (Parm)
// struct FName                   Tag                            (Parm)
// struct FVector                 FlagLocation                   (Parm)

void AwSDGameInfo::OnBombDiffused(class APawn* TP, const struct FName& Tag, const struct FVector& FlagLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.OnBombDiffused");

	AwSDGameInfo_OnBombDiffused_Params params;
	params.TP = TP;
	params.Tag = Tag;
	params.FlagLocation = FlagLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.SetObjectiveSetted
// (Defined, Public)
// Parameters:
// class APawn*                   TP                             (Parm)
// struct FName                   ObjectTag                      (Parm)
// struct FVector                 FlagLocation                   (Parm)

void AwSDGameInfo::SetObjectiveSetted(class APawn* TP, const struct FName& ObjectTag, const struct FVector& FlagLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.SetObjectiveSetted");

	AwSDGameInfo_SetObjectiveSetted_Params params;
	params.TP = TP;
	params.ObjectTag = ObjectTag;
	params.FlagLocation = FlagLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.PlayObjectiveSetVociceBGM
// (Defined, Public)
// Parameters:
// class APawn*                   TP                             (Parm)

void AwSDGameInfo::PlayObjectiveSetVociceBGM(class APawn* TP)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.PlayObjectiveSetVociceBGM");

	AwSDGameInfo_PlayObjectiveSetVociceBGM_Params params;
	params.TP = TP;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.GotoDefusePhase
// (Defined, Public)
// Parameters:
// struct FName                   ObjectTag                      (Parm)

void AwSDGameInfo::GotoDefusePhase(const struct FName& ObjectTag)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.GotoDefusePhase");

	AwSDGameInfo_GotoDefusePhase_Params params;
	params.ObjectTag = ObjectTag;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSDGameInfo.InitGame
// (Defined, Event, Public)
// Parameters:
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)

void AwSDGameInfo::InitGame(const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSDGameInfo.InitGame");

	AwSDGameInfo_InitGame_Params params;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
}


// Function WMission.wRandomBonusPack.CanPickupByPRI
// (Defined, Public)
// Parameters:
// class AwAlienPlayerReplicationInfo* PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwRandomBonusPack::CanPickupByPRI(class AwAlienPlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wRandomBonusPack.CanPickupByPRI");

	AwRandomBonusPack_CanPickupByPRI_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wRandomBonusPack.FillWeaponAmmo
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwRandomBonusPack::FillWeaponAmmo(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wRandomBonusPack.FillWeaponAmmo");

	AwRandomBonusPack_FillWeaponAmmo_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wRandomBonusPack.AddWeaponByInvenGroup
// (Defined, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)
// class AwWeapon*                DestWeapon                     (Parm)
// class AwWeapon*                AddWeapon                      (Parm)

void AwRandomBonusPack::AddWeaponByInvenGroup(class APlayerController* PC, class AwWeapon* DestWeapon, class AwWeapon* AddWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wRandomBonusPack.AddWeaponByInvenGroup");

	AwRandomBonusPack_AddWeaponByInvenGroup_Params params;
	params.PC = PC;
	params.DestWeapon = DestWeapon;
	params.AddWeapon = AddWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wRandomBonusPack.Reset
// (Defined, Public)

void AwRandomBonusPack::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wRandomBonusPack.Reset");

	AwRandomBonusPack_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wRandomBonusPack.DeleteSuppliesPositions
// (Defined, Public)

void AwRandomBonusPack::DeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wRandomBonusPack.DeleteSuppliesPositions");

	AwRandomBonusPack_DeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wRandomBonusPack.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwRandomBonusPack::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wRandomBonusPack.PostNetBeginPlay");

	AwRandomBonusPack_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wObjectiveTankerAlienShield.TakeDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   EventInstigator                (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwObjectiveTankerAlienShield::TakeDamage(int Damage, class APawn* EventInstigator, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wObjectiveTankerAlienShield.TakeDamage");

	AwObjectiveTankerAlienShield_TakeDamage_Params params;
	params.Damage = Damage;
	params.EventInstigator = EventInstigator;
	params.HitLocation = HitLocation;
	params.Momentum = Momentum;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;
	params.WeaponType = WeaponType;
	params.bWallShot = bWallShot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSkill_Shield.ResetSkill
// (Defined, Simulated, Public)

void UwSkill_Shield::ResetSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSkill_Shield.ResetSkill");

	UwSkill_Shield_ResetSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSkill_Shield.Client_AddProcess
// (Defined, Simulated, Public)

void UwSkill_Shield::Client_AddProcess()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSkill_Shield.Client_AddProcess");

	UwSkill_Shield_Client_AddProcess_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSkill_Shield.UnuseSkill
// (Defined, Simulated, Public)

void UwSkill_Shield::UnuseSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSkill_Shield.UnuseSkill");

	UwSkill_Shield_UnuseSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSkill_Shield.UseSkill
// (Defined, Simulated, Public)

void UwSkill_Shield::UseSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSkill_Shield.UseSkill");

	UwSkill_Shield_UseSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSkill_Shield.CheckSkill
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwSkill_Shield::CheckSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSkill_Shield.CheckSkill");

	UwSkill_Shield_CheckSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WMission.wSkill_Shield.ReadySkill
// (Defined, Simulated, Public)

void UwSkill_Shield::ReadySkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSkill_Shield.ReadySkill");

	UwSkill_Shield_ReadySkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wSkill_Shield.Initialize
// (Defined, Simulated, Public)
// Parameters:
// class UwSkillBase*             SkillBase                      (Parm)
// class UwSkillBaseParam*        Param                          (Parm)

void UwSkill_Shield::Initialize(class UwSkillBase* SkillBase, class UwSkillBaseParam* Param)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wSkill_Shield.Initialize");

	UwSkill_Shield_Initialize_Params params;
	params.SkillBase = SkillBase;
	params.Param = Param;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_Camera.Reset
// (Defined, Public)

void AwMSCinematic_Camera::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_Camera.Reset");

	AwMSCinematic_Camera_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_Camera.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwMSCinematic_Camera::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_Camera.Trigger");

	AwMSCinematic_Camera_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_Camera.Timer
// (Defined, Public)

void AwMSCinematic_Camera::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_Camera.Timer");

	AwMSCinematic_Camera_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_Camera.SetView
// (Defined, Public)
// Parameters:
// class AwMSCinematic_SceneManager* SM                             (Parm)

void AwMSCinematic_Camera::SetView(class AwMSCinematic_SceneManager* SM)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_Camera.SetView");

	AwMSCinematic_Camera_SetView_Params params;
	params.SM = SM;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_Camera.ViewFixedObjective
// (Defined, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)
// class AGameObjective*          Go                             (Parm)

void AwMSCinematic_Camera::ViewFixedObjective(class APlayerController* PC, class AGameObjective* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_Camera.ViewFixedObjective");

	AwMSCinematic_Camera_ViewFixedObjective_Params params;
	params.PC = PC;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WMission.wMSCinematic_Camera.PostBeginPlay
// (Defined, Public)

void AwMSCinematic_Camera::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WMission.wMSCinematic_Camera.PostBeginPlay");

	AwMSCinematic_Camera_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
