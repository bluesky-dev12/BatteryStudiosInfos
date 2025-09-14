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

// Function UnrealGame.UnrealPawn.SpawnGibs
// (Simulated, Public)
// Parameters:
// struct FRotator                HitRotation                    (Parm)
// float                          ChunkPerterbation              (Parm)

void AUnrealPawn::SpawnGibs(const struct FRotator& HitRotation, float ChunkPerterbation)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.SpawnGibs");

	AUnrealPawn_SpawnGibs_Params params;
	params.HitRotation = HitRotation;
	params.ChunkPerterbation = ChunkPerterbation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.ChunkUp
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                HitRotation                    (Parm)
// float                          ChunkPerterbation              (Parm)

void AUnrealPawn::ChunkUp(const struct FRotator& HitRotation, float ChunkPerterbation)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.ChunkUp");

	AUnrealPawn_ChunkUp_Params params;
	params.HitRotation = HitRotation;
	params.ChunkPerterbation = ChunkPerterbation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.PlayFootStep
// (Defined, Simulated, Public)
// Parameters:
// int                            side                           (Parm)

void AUnrealPawn::PlayFootStep(int side)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.PlayFootStep");

	AUnrealPawn_PlayFootStep_Params params;
	params.side = side;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.IncrementSpree
// (Defined, Public)

void AUnrealPawn::IncrementSpree()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.IncrementSpree");

	AUnrealPawn_IncrementSpree_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.GetSpree
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealPawn::GetSpree()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.GetSpree");

	AUnrealPawn_GetSpree_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.TakeDrowningDamage
// (Defined, Public)

void AUnrealPawn::TakeDrowningDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.TakeDrowningDamage");

	AUnrealPawn_TakeDrowningDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.SetMovementPhysics
// (Defined, Public)

void AUnrealPawn::SetMovementPhysics()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.SetMovementPhysics");

	AUnrealPawn_SetMovementPhysics_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.GetPlacedRoster
// (Defined, Public)
// Parameters:
// class URosterEntry*            ReturnValue                    (Parm, OutParm, ReturnParm)

class URosterEntry* AUnrealPawn::GetPlacedRoster()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.GetPlacedRoster");

	AUnrealPawn_GetPlacedRoster_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.PostNetBeginPlay
// (Defined, Simulated, Public)

void AUnrealPawn::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.PostNetBeginPlay");

	AUnrealPawn_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.PostBeginPlay
// (Defined, Simulated, Public)

void AUnrealPawn::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.PostBeginPlay");

	AUnrealPawn_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.Dodge
// (Defined, Public)
// Parameters:
// TEnumAsByte<EDoubleClickDir>   DoubleClickMove                (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPawn::Dodge(TEnumAsByte<EDoubleClickDir> DoubleClickMove)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.Dodge");

	AUnrealPawn_Dodge_Params params;
	params.DoubleClickMove = DoubleClickMove;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.PerformDodge
// (Public)
// Parameters:
// TEnumAsByte<EDoubleClickDir>   DoubleClickMove                (Parm)
// struct FVector                 Dir                            (Parm)
// struct FVector                 Cross                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPawn::PerformDodge(TEnumAsByte<EDoubleClickDir> DoubleClickMove, const struct FVector& Dir, const struct FVector& Cross)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.PerformDodge");

	AUnrealPawn_PerformDodge_Params params;
	params.DoubleClickMove = DoubleClickMove;
	params.Dir = Dir;
	params.Cross = Cross;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.CreateInventory
// (Defined, Public)
// Parameters:
// struct FString                 InventoryClassName             (Parm, NeedCtorLink)
// class AInventory*              ReturnValue                    (Parm, OutParm, ReturnParm)

class AInventory* AUnrealPawn::CreateInventory(const struct FString& InventoryClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.CreateInventory");

	AUnrealPawn_CreateInventory_Params params;
	params.InventoryClassName = InventoryClassName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.CustomCreateInventory
// (Defined, Public)
// Parameters:
// struct FString                 WeaponClassName                (Parm, NeedCtorLink)
// class AInventory*              ReturnValue                    (Parm, OutParm, ReturnParm)

class AInventory* AUnrealPawn::CustomCreateInventory(const struct FString& WeaponClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.CustomCreateInventory");

	AUnrealPawn_CustomCreateInventory_Params params;
	params.WeaponClassName = WeaponClassName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AUnrealPawn::AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.AddDefaultInventory");

	AUnrealPawn_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.AddDefaultInventoryDOA
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AUnrealPawn::AddDefaultInventoryDOA(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.AddDefaultInventoryDOA");

	AUnrealPawn_AddDefaultInventoryDOA_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.IsInLoadout
// (Defined, Public)
// Parameters:
// class UClass*                  InventoryClass                 (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPawn::IsInLoadout(class UClass* InventoryClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.IsInLoadout");

	AUnrealPawn_IsInLoadout_Params params;
	params.InventoryClass = InventoryClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.CheckBob
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)
// struct FVector                 Y                              (Parm)

void AUnrealPawn::CheckBob(float DeltaTime, const struct FVector& Y)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.CheckBob");

	AUnrealPawn_CheckBob_Params params;
	params.DeltaTime = DeltaTime;
	params.Y = Y;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.GetWeaponBoneFor
// (Defined, Public)
// Parameters:
// class AInventory*              i                              (Parm)
// struct FName                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FName AUnrealPawn::GetWeaponBoneFor(class AInventory* i)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.GetWeaponBoneFor");

	AUnrealPawn_GetWeaponBoneFor_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.GetDebugName
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealPawn::GetDebugName()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.GetDebugName");

	AUnrealPawn_GetDebugName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.SetAnimAction
// (Defined, Simulated, Event, Public)
// Parameters:
// struct FName                   NewAction                      (Parm)

void AUnrealPawn::SetAnimAction(const struct FName& NewAction)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.SetAnimAction");

	AUnrealPawn_SetAnimAction_Params params;
	params.NewAction = NewAction;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.ShouldUnCrouch
// (Simulated, Public)

void AUnrealPawn::ShouldUnCrouch()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.ShouldUnCrouch");

	AUnrealPawn_ShouldUnCrouch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.EndJump
// (Public)

void AUnrealPawn::EndJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.EndJump");

	AUnrealPawn_EndJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.HoldGameObject
// (Defined, Public)
// Parameters:
// class AGameObject*             gameObj                        (Parm)
// struct FName                   GameObjBone                    (Parm)

void AUnrealPawn::HoldGameObject(class AGameObject* gameObj, const struct FName& GameObjBone)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.HoldGameObject");

	AUnrealPawn_HoldGameObject_Params params;
	params.gameObj = gameObj;
	params.GameObjBone = GameObjBone;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.HoldFlag
// (Defined, Public)
// Parameters:
// class AActor*                  FlagActor                      (Parm)

void AUnrealPawn::HoldFlag(class AActor* FlagActor)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.HoldFlag");

	AUnrealPawn_HoldFlag_Params params;
	params.FlagActor = FlagActor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.BotDodge
// (Defined, Public)
// Parameters:
// struct FVector                 Dir                            (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AUnrealPawn::BotDodge(const struct FVector& Dir)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.BotDodge");

	AUnrealPawn_BotDodge_Params params;
	params.Dir = Dir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.DisplayDebug
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AUnrealPawn::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.DisplayDebug");

	AUnrealPawn_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function UnrealGame.UnrealPawn.gibbedBy
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AUnrealPawn::gibbedBy(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.gibbedBy");

	AUnrealPawn_gibbedBy_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPawn.FindValidTaunt
// (Defined, Simulated, Public)
// Parameters:
// struct FName                   Sequence                       (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPawn::FindValidTaunt(struct FName* Sequence)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.FindValidTaunt");

	AUnrealPawn_FindValidTaunt_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Sequence != nullptr)
		*Sequence = params.Sequence;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPawn.DropFlag
// (Defined, Public)
// Parameters:
// struct FString                 sReason                        (OptionalParm, Parm, NeedCtorLink)

void AUnrealPawn::DropFlag(const struct FString& sReason)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPawn.DropFlag");

	AUnrealPawn_DropFlag_Params params;
	params.sReason = sReason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.RosterEntry.InitBot
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void URosterEntry::InitBot(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.InitBot");

	URosterEntry_InitBot_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.RosterEntry.RecommendAttack
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool URosterEntry::RecommendAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.RecommendAttack");

	URosterEntry_RecommendAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RosterEntry.RecommendFreelance
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool URosterEntry::RecommendFreelance()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.RecommendFreelance");

	URosterEntry_RecommendFreelance_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RosterEntry.RecommendDefense
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool URosterEntry::RecommendDefense()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.RecommendDefense");

	URosterEntry_RecommendDefense_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RosterEntry.NoRecommendation
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool URosterEntry::NoRecommendation()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.NoRecommendation");

	URosterEntry_NoRecommendation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RosterEntry.RecommendSupport
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool URosterEntry::RecommendSupport()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.RecommendSupport");

	URosterEntry_RecommendSupport_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RosterEntry.SetOrders
// (Defined, Public)
// Parameters:
// TEnumAsByte<EPlayerPos>        Position                       (Parm)

void URosterEntry::SetOrders(TEnumAsByte<EPlayerPos> Position)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.SetOrders");

	URosterEntry_SetOrders_Params params;
	params.Position = Position;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.RosterEntry.PrecacheRosterFor
// (Public)
// Parameters:
// class AUnrealTeamInfo*         t                              (Parm)

void URosterEntry::PrecacheRosterFor(class AUnrealTeamInfo* t)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.PrecacheRosterFor");

	URosterEntry_PrecacheRosterFor_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.RosterEntry.Init
// (Defined, Public)

void URosterEntry::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RosterEntry.Init");

	URosterEntry_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.MultiMinPlayers
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealMPGameInfo::MultiMinPlayers()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.MultiMinPlayers");

	AUnrealMPGameInfo_MultiMinPlayers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.GetDescriptionText
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropName                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealMPGameInfo::STATIC_GetDescriptionText(const struct FString& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.GetDescriptionText");

	AUnrealMPGameInfo_GetDescriptionText_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.FillPlayInfo
// (Defined, Static, Public)
// Parameters:
// class UPlayInfo*               PlayInfo                       (Parm)

void AUnrealMPGameInfo::STATIC_FillPlayInfo(class UPlayInfo* PlayInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.FillPlayInfo");

	AUnrealMPGameInfo_FillPlayInfo_Params params;
	params.PlayInfo = PlayInfo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.GenerateBotOptions
// (Defined, Static, Public)
// Parameters:
// bool                           bSinglePlayer                  (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealMPGameInfo::STATIC_GenerateBotOptions(bool bSinglePlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.GenerateBotOptions");

	AUnrealMPGameInfo_GenerateBotOptions_Params params;
	params.bSinglePlayer = bSinglePlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.AdjustBotInterface
// (Defined, Static, Public)
// Parameters:
// bool                           bSinglePlayer                  (Parm)

void AUnrealMPGameInfo::STATIC_AdjustBotInterface(bool bSinglePlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.AdjustBotInterface");

	AUnrealMPGameInfo_AdjustBotInterface_Params params;
	params.bSinglePlayer = bSinglePlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.GetServerDetails
// (Defined, Public)
// Parameters:
// struct FServerResponseLine     ServerState                    (Parm, OutParm, NeedCtorLink)

void AUnrealMPGameInfo::GetServerDetails(struct FServerResponseLine* ServerState)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.GetServerDetails");

	AUnrealMPGameInfo_GetServerDetails_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ServerState != nullptr)
		*ServerState = params.ServerState;
}


// Function UnrealGame.UnrealMPGameInfo.InitPlacedBot
// (Public)
// Parameters:
// class AController*             C                              (Parm)
// class URosterEntry*            R                              (Parm)

void AUnrealMPGameInfo::InitPlacedBot(class AController* C, class URosterEntry* R)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.InitPlacedBot");

	AUnrealMPGameInfo_InitPlacedBot_Params params;
	params.C = C;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.PickupQuery
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// class APickup*                 Item                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealMPGameInfo::PickupQuery(class APawn* Other, class APickup* Item)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.PickupQuery");

	AUnrealMPGameInfo_PickupQuery_Params params;
	params.Other = Other;
	params.Item = Item;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.CanDisableObjective
// (Defined, Public)
// Parameters:
// class AGameObjective*          Go                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealMPGameInfo::CanDisableObjective(class AGameObjective* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.CanDisableObjective");

	AUnrealMPGameInfo_CanDisableObjective_Params params;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.AdjustDestroyObjectiveDamage
// (Defined, Public)
// Parameters:
// int                            Damage                         (Parm)
// class AController*             instigatedBy                   (Parm)
// class AGameObjective*          Go                             (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealMPGameInfo::AdjustDestroyObjectiveDamage(int Damage, class AController* instigatedBy, class AGameObjective* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.AdjustDestroyObjectiveDamage");

	AUnrealMPGameInfo_AdjustDestroyObjectiveDamage_Params params;
	params.Damage = Damage;
	params.instigatedBy = instigatedBy;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.ShowPathTo
// (Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            TeamNum                        (Parm)

void AUnrealMPGameInfo::ShowPathTo(class APlayerController* P, int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ShowPathTo");

	AUnrealMPGameInfo_ShowPathTo_Params params;
	params.P = P;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.CanShowPathTo
// (Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            TeamNum                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealMPGameInfo::CanShowPathTo(class APlayerController* P, int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.CanShowPathTo");

	AUnrealMPGameInfo_CanShowPathTo_Params params;
	params.P = P;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.ForceAddBot
// (Public)

void AUnrealMPGameInfo::ForceAddBot()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ForceAddBot");

	AUnrealMPGameInfo_ForceAddBot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.ChangeLoadOut
// (Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// struct FString                 LoadoutName                    (Parm, NeedCtorLink)

void AUnrealMPGameInfo::ChangeLoadOut(class APlayerController* P, const struct FString& LoadoutName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ChangeLoadOut");

	AUnrealMPGameInfo_ChangeLoadOut_Params params;
	params.P = P;
	params.LoadoutName = LoadoutName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.ScoreGameObject
// (Public)
// Parameters:
// class AController*             C                              (Parm)
// class AGameObject*             Go                             (Parm)

void AUnrealMPGameInfo::ScoreGameObject(class AController* C, class AGameObject* Go)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ScoreGameObject");

	AUnrealMPGameInfo_ScoreGameObject_Params params;
	params.C = C;
	params.Go = Go;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.GetGameObject
// (Public)
// Parameters:
// struct FName                   GameObjectName                 (Parm)
// class AGameObject*             ReturnValue                    (Parm, OutParm, ReturnParm)

class AGameObject* AUnrealMPGameInfo::GetGameObject(const struct FName& GameObjectName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.GetGameObject");

	AUnrealMPGameInfo_GetGameObject_Params params;
	params.GameObjectName = GameObjectName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.FindNewObjectives
// (Public)
// Parameters:
// class AGameObjective*          DisabledObjective              (Parm)

void AUnrealMPGameInfo::FindNewObjectives(class AGameObjective* DisabledObjective)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.FindNewObjectives");

	AUnrealMPGameInfo_FindNewObjectives_Params params;
	params.DisabledObjective = DisabledObjective;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.ObjectiveDisabled
// (Public)
// Parameters:
// class AGameObjective*          DisabledObjective              (Parm)

void AUnrealMPGameInfo::ObjectiveDisabled(class AGameObjective* DisabledObjective)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ObjectiveDisabled");

	AUnrealMPGameInfo_ObjectiveDisabled_Params params;
	params.DisabledObjective = DisabledObjective;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.GetRandomTeamSymbol
// (Defined, Static, Public)
// Parameters:
// int                            Base                           (Parm)
// class UTexture*                ReturnValue                    (Parm, OutParm, ReturnParm)

class UTexture* AUnrealMPGameInfo::STATIC_GetRandomTeamSymbol(int Base)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.GetRandomTeamSymbol");

	AUnrealMPGameInfo_GetRandomTeamSymbol_Params params;
	params.Base = Base;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.RestartGame
// (Defined, Public)

void AUnrealMPGameInfo::RestartGame()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.RestartGame");

	AUnrealMPGameInfo_RestartGame_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.TooManyBots
// (Defined, Public)
// Parameters:
// class AController*             botToRemove                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealMPGameInfo::TooManyBots(class AController* botToRemove)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.TooManyBots");

	AUnrealMPGameInfo_TooManyBots_Params params;
	params.botToRemove = botToRemove;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.SpawnWait
// (Defined, Public)
// Parameters:
// class AAIController*           B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AUnrealMPGameInfo::SpawnWait(class AAIController* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.SpawnWait");

	AUnrealMPGameInfo_SpawnWait_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.ShouldRespawn
// (Defined, Public)
// Parameters:
// class APickup*                 Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealMPGameInfo::ShouldRespawn(class APickup* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ShouldRespawn");

	AUnrealMPGameInfo_ShouldRespawn_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.GetNumPlayers
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealMPGameInfo::GetNumPlayers()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.GetNumPlayers");

	AUnrealMPGameInfo_GetNumPlayers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.TeamScoreEvent
// (Defined, Public)
// Parameters:
// int                            Team                           (Parm)
// float                          Points                         (Parm)
// struct FString                 Desc                           (Parm, NeedCtorLink)

void AUnrealMPGameInfo::TeamScoreEvent(int Team, float Points, const struct FString& Desc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.TeamScoreEvent");

	AUnrealMPGameInfo_TeamScoreEvent_Params params;
	params.Team = Team;
	params.Points = Points;
	params.Desc = Desc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.ScoreEvent
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Who                            (Parm)
// float                          Points                         (Parm)
// struct FString                 Desc                           (Parm, NeedCtorLink)

void AUnrealMPGameInfo::ScoreEvent(class APlayerReplicationInfo* Who, float Points, const struct FString& Desc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ScoreEvent");

	AUnrealMPGameInfo_ScoreEvent_Params params;
	params.Who = Who;
	params.Points = Points;
	params.Desc = Desc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.GameEvent
// (Defined, Public)
// Parameters:
// struct FString                 GEvent                         (Parm, NeedCtorLink)
// struct FString                 Desc                           (Parm, NeedCtorLink)
// class APlayerReplicationInfo*  Who                            (Parm)

void AUnrealMPGameInfo::GameEvent(const struct FString& GEvent, const struct FString& Desc, class APlayerReplicationInfo* Who)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.GameEvent");

	AUnrealMPGameInfo_GameEvent_Params params;
	params.GEvent = GEvent;
	params.Desc = Desc;
	params.Who = Who;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.KillEvent
// (Defined, Public)
// Parameters:
// struct FString                 KillType                       (Parm, NeedCtorLink)
// class APlayerReplicationInfo*  Killer                         (Parm)
// class APlayerReplicationInfo*  Victim                         (Parm)
// class UClass*                  Damage                         (Parm)

void AUnrealMPGameInfo::KillEvent(const struct FString& KillType, class APlayerReplicationInfo* Killer, class APlayerReplicationInfo* Victim, class UClass* Damage)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.KillEvent");

	AUnrealMPGameInfo_KillEvent_Params params;
	params.KillType = KillType;
	params.Killer = Killer;
	params.Victim = Victim;
	params.Damage = Damage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.SpecialEvent
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Who                            (Parm)
// struct FString                 Desc                           (Parm, NeedCtorLink)

void AUnrealMPGameInfo::SpecialEvent(class APlayerReplicationInfo* Who, const struct FString& Desc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.SpecialEvent");

	AUnrealMPGameInfo_SpecialEvent_Params params;
	params.Who = Who;
	params.Desc = Desc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.ChangeVoiceChannel
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// int                            NewChannelIndex                (Parm)
// int                            OldChannelIndex                (Parm)

void AUnrealMPGameInfo::ChangeVoiceChannel(class APlayerReplicationInfo* PRI, int NewChannelIndex, int OldChannelIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.ChangeVoiceChannel");

	AUnrealMPGameInfo_ChangeVoiceChannel_Params params;
	params.PRI = PRI;
	params.NewChannelIndex = NewChannelIndex;
	params.OldChannelIndex = OldChannelIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.InitMaplistHandler
// (Defined, Public)

void AUnrealMPGameInfo::InitMaplistHandler()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.InitMaplistHandler");

	AUnrealMPGameInfo_InitMaplistHandler_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.InitVoiceReplicationInfo
// (Defined, Public)

void AUnrealMPGameInfo::InitVoiceReplicationInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.InitVoiceReplicationInfo");

	AUnrealMPGameInfo_InitVoiceReplicationInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealMPGameInfo.Login
// (Defined, Event, Public)
// Parameters:
// struct FString                 Portal                         (Parm, NeedCtorLink)
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)
// class APlayerController*       ReturnValue                    (Parm, OutParm, ReturnParm)

class APlayerController* AUnrealMPGameInfo::Login(const struct FString& Portal, const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.Login");

	AUnrealMPGameInfo_Login_Params params;
	params.Portal = Portal;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealMPGameInfo.PreLogin
// (Defined, Event, Public)
// Parameters:
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Address                        (Parm, NeedCtorLink)
// struct FString                 PlayerID                       (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)
// struct FString                 FailCode                       (Parm, OutParm, NeedCtorLink)

void AUnrealMPGameInfo::PreLogin(const struct FString& Options, const struct FString& Address, const struct FString& PlayerID, struct FString* Error, struct FString* FailCode)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealMPGameInfo.PreLogin");

	AUnrealMPGameInfo_PreLogin_Params params;
	params.Options = Options;
	params.Address = Address;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
	if (FailCode != nullptr)
		*FailCode = params.FailCode;
}


// Function UnrealGame.Bot.ShouldPerformScript
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::ShouldPerformScript()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ShouldPerformScript");

	ABot_ShouldPerformScript_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ScriptingOverridesAI
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::ScriptingOverridesAI()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ScriptingOverridesAI");

	ABot_ScriptingOverridesAI_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SetNewScript
// (Defined, Public)
// Parameters:
// class AScriptedSequence*       NewScript                      (Parm)

void ABot::SetNewScript(class AScriptedSequence* NewScript)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetNewScript");

	ABot_SetNewScript_Params params;
	params.NewScript = NewScript;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SetEnemyReaction
// (Defined, Public)
// Parameters:
// int                            AlertnessLevel                 (Parm)

void ABot::SetEnemyReaction(int AlertnessLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetEnemyReaction");

	ABot_SetEnemyReaction_Params params;
	params.AlertnessLevel = AlertnessLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.IsShootingObjective
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::IsShootingObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.IsShootingObjective");

	ABot_IsShootingObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.Stopped
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::Stopped()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Stopped");

	ABot_Stopped_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FindViewSpot
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::FindViewSpot()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FindViewSpot");

	ABot_FindViewSpot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.IsHunting
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::IsHunting()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.IsHunting");

	ABot_IsHunting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.IsStrafing
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::IsStrafing()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.IsStrafing");

	ABot_IsStrafing_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.DefendMelee
// (Defined, Public)
// Parameters:
// float                          dist                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::DefendMelee(float dist)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DefendMelee");

	ABot_DefendMelee_Params params;
	params.dist = dist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.DoRetreat
// (Defined, Public)

void ABot::DoRetreat()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DoRetreat");

	ABot_DoRetreat_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.DoTacticalMove
// (Defined, Public)

void ABot::DoTacticalMove()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DoTacticalMove");

	ABot_DoTacticalMove_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.DoCharge
// (Defined, Public)

void ABot::DoCharge()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DoCharge");

	ABot_DoCharge_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.DoStakeOut
// (Defined, Public)

void ABot::DoStakeOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DoStakeOut");

	ABot_DoStakeOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.LoseEnemy
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::LoseEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.LoseEnemy");

	ABot_LoseEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.LostContact
// (Defined, Public)
// Parameters:
// float                          MaxTime                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::LostContact(float MaxTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.LostContact");

	ABot_LostContact_Params params;
	params.MaxTime = MaxTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.GetDesiredOffset
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ABot::GetDesiredOffset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetDesiredOffset");

	ABot_GetDesiredOffset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ForceCelebrate
// (Defined, Public)

void ABot::ForceCelebrate()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ForceCelebrate");

	ABot_ForceCelebrate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.ForceGiveWeapon
// (Defined, Public)

void ABot::ForceGiveWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ForceGiveWeapon");

	ABot_ForceGiveWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.Celebrate
// (Defined, Public)

void ABot::Celebrate()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Celebrate");

	ABot_Celebrate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.RecoverFromBadStateCode
// (Defined, Event, Public)

void ABot::RecoverFromBadStateCode()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.RecoverFromBadStateCode");

	ABot_RecoverFromBadStateCode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.Formation
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::Formation()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Formation");

	ABot_Formation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.IsRetreating
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::IsRetreating()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.IsRetreating");

	ABot_IsRetreating_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.damageAttitudeTo
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// float                          Damage                         (Parm)

void ABot::damageAttitudeTo(class APawn* Other, float Damage)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.damageAttitudeTo");

	ABot_damageAttitudeTo_Params params;
	params.Other = Other;
	params.Damage = Damage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SuperPickupNotSpokenFor
// (Defined, Public)
// Parameters:
// class APickup*                 P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::SuperPickupNotSpokenFor(class APickup* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SuperPickupNotSpokenFor");

	ABot_SuperPickupNotSpokenFor_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SuperDesireability
// (Defined, Event, Public)
// Parameters:
// class APickup*                 P                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ABot::SuperDesireability(class APickup* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SuperDesireability");

	ABot_SuperDesireability_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.Desireability
// (Defined, Event, Public)
// Parameters:
// class APickup*                 P                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ABot::Desireability(class APickup* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Desireability");

	ABot_Desireability_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.NeedWeapon
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::NeedWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NeedWeapon");

	ABot_NeedWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.WanderOrCamp
// (Defined, Public)
// Parameters:
// bool                           bMayCrouch                     (Parm)

void ABot::WanderOrCamp(bool bMayCrouch)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.WanderOrCamp");

	ABot_WanderOrCamp_Params params;
	params.bMayCrouch = bMayCrouch;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.FaceActor
// (Defined, Public)
// Parameters:
// float                          StrafingModifier               (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ABot::FaceActor(float StrafingModifier)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FaceActor");

	ABot_FaceActor_Params params;
	params.StrafingModifier = StrafingModifier;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.AlternateTranslocDest
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ABot::AlternateTranslocDest()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.AlternateTranslocDest");

	ABot_AlternateTranslocDest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ShouldStrafeTo
// (Defined, Public)
// Parameters:
// class AActor*                  WayPoint                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::ShouldStrafeTo(class AActor* WayPoint)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ShouldStrafeTo");

	ABot_ShouldStrafeTo_Params params;
	params.WayPoint = WayPoint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FaceMoveTarget
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ABot::FaceMoveTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FaceMoveTarget");

	ABot_FaceMoveTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void ABot::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyKilled");

	ABot_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.TryToDuck
// (Defined, Public)
// Parameters:
// struct FVector                 duckDir                        (Parm)
// bool                           bReversed                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::TryToDuck(const struct FVector& duckDir, bool bReversed)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.TryToDuck");

	ABot_TryToDuck_Params params;
	params.duckDir = duckDir;
	params.bReversed = bReversed;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ChangeStrafe
// (Public)

void ABot::ChangeStrafe()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ChangeStrafe");

	ABot_ChangeStrafe_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.TryWallDodge
// (Defined, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)
// class AActor*                  HitActor                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::TryWallDodge(const struct FVector& HitNormal, class AActor* HitActor)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.TryWallDodge");

	ABot_TryWallDodge_Params params;
	params.HitNormal = HitNormal;
	params.HitActor = HitActor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.MissedDodge
// (Defined, Event, Public)

void ABot::MissedDodge()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.MissedDodge");

	ABot_MissedDodge_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.NotifyFallingHitWall
// (Defined, Event, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)
// class AActor*                  HitActor                       (Parm)

void ABot::NotifyFallingHitWall(const struct FVector& HitNormal, class AActor* HitActor)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyFallingHitWall");

	ABot_NotifyFallingHitWall_Params params;
	params.HitNormal = HitNormal;
	params.HitActor = HitActor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.ReceiveWarning
// (Defined, Public)
// Parameters:
// class APawn*                   shooter                        (Parm)
// float                          projSpeed                      (Parm)
// struct FVector                 FireDir                        (Parm)

void ABot::ReceiveWarning(class APawn* shooter, float projSpeed, const struct FVector& FireDir)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ReceiveWarning");

	ABot_ReceiveWarning_Params params;
	params.shooter = shooter;
	params.projSpeed = projSpeed;
	params.FireDir = FireDir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.NotifyTakeHit
// (Defined, Public)
// Parameters:
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void ABot::NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyTakeHit");

	ABot_NotifyTakeHit_Params params;
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


// Function UnrealGame.Bot.ReceiveProjectileWarning
// (Defined, Public)
// Parameters:
// class AProjectile*             proj                           (Parm)

void ABot::ReceiveProjectileWarning(class AProjectile* proj)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ReceiveProjectileWarning");

	ABot_ReceiveProjectileWarning_Params params;
	params.proj = proj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.DelayedWarning
// (Defined, Event, Public)

void ABot::DelayedWarning()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DelayedWarning");

	ABot_DelayedWarning_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.AdjustAim
// (Defined, Public)
// Parameters:
// struct FFireProperties         FiredAmmunition                (Parm)
// struct FVector                 projStart                      (Parm)
// int                            AimError                       (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator ABot::AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.AdjustAim");

	ABot_AdjustAim_Params params;
	params.FiredAmmunition = FiredAmmunition;
	params.projStart = projStart;
	params.AimError = AimError;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.AdjustAimError
// (Defined, Public)
// Parameters:
// float                          AimError                       (Parm)
// float                          TargetDist                     (Parm)
// bool                           bDefendMelee                   (Parm)
// bool                           bInstantProj                   (Parm)
// bool                           bLeadTargetNow                 (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ABot::AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.AdjustAimError");

	ABot_AdjustAimError_Params params;
	params.AimError = AimError;
	params.TargetDist = TargetDist;
	params.bDefendMelee = bDefendMelee;
	params.bInstantProj = bInstantProj;
	params.bLeadTargetNow = bLeadTargetNow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.CheckFutureSight
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CheckFutureSight(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CheckFutureSight");

	ABot_CheckFutureSight_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.NearWall
// (Defined, Public)
// Parameters:
// float                          walldist                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::NearWall(float walldist)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NearWall");

	ABot_NearWall_Params params;
	params.walldist = walldist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.NeedToTurn
// (Defined, Public)
// Parameters:
// struct FVector                 targ                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::NeedToTurn(const struct FVector& targ)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NeedToTurn");

	ABot_NeedToTurn_Params params;
	params.targ = targ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FindBestPathToward
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           bCheckedReach                  (Parm)
// bool                           bAllowDetour                   (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::FindBestPathToward(class AActor* A, bool bCheckedReach, bool bAllowDetour)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FindBestPathToward");

	ABot_FindBestPathToward_Params params;
	params.A = A;
	params.bCheckedReach = bCheckedReach;
	params.bAllowDetour = bAllowDetour;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.AllowDetourTo
// (Defined, Event, Public)
// Parameters:
// class ANavigationPoint*        N                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::AllowDetourTo(class ANavigationPoint* N)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.AllowDetourTo");

	ABot_AllowDetourTo_Params params;
	params.N = N;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SetRouteToGoal
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::SetRouteToGoal(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetRouteToGoal");

	ABot_SetRouteToGoal_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.StartMoveToward
// (Defined, Public)
// Parameters:
// class AActor*                  o                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::StartMoveToward(class AActor* o)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.StartMoveToward");

	ABot_StartMoveToward_Params params;
	params.o = o;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.NotifyPostLanded
// (Defined, Event, Public)

void ABot::NotifyPostLanded()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyPostLanded");

	ABot_NotifyPostLanded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.NotifyLanded
// (Defined, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::NotifyLanded(const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyLanded");

	ABot_NotifyLanded_Params params;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SetFall
// (Defined, Public)

void ABot::SetFall()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetFall");

	ABot_SetFall_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.PriorityObjective
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::PriorityObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.PriorityObjective");

	ABot_PriorityObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.NotifyBump
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::NotifyBump(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyBump");

	ABot_NotifyBump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.DirectedWander
// (Defined, Public)
// Parameters:
// struct FVector                 WanderDir                      (Parm)

void ABot::DirectedWander(const struct FVector& WanderDir)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DirectedWander");

	ABot_DirectedWander_Params params;
	params.WanderDir = WanderDir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.AdjustAround
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::AdjustAround(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.AdjustAround");

	ABot_AdjustAround_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ClearPathFor
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void ABot::ClearPathFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ClearPathFor");

	ABot_ClearPathFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.CancelCampFor
// (Public)
// Parameters:
// class AController*             C                              (Parm)

void ABot::CancelCampFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CancelCampFor");

	ABot_CancelCampFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.CheckPathToGoalAround
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CheckPathToGoalAround(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CheckPathToGoalAround");

	ABot_CheckPathToGoalAround_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.Restart
// (Defined, Public)

void ABot::Restart()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Restart");

	ABot_Restart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.TestDirection
// (Defined, Public)
// Parameters:
// struct FVector                 Dir                            (Parm)
// struct FVector                 pick                           (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::TestDirection(const struct FVector& Dir, struct FVector* pick)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.TestDirection");

	ABot_TestDirection_Params params;
	params.Dir = Dir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (pick != nullptr)
		*pick = params.pick;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FindRoamDest
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::FindRoamDest()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FindRoamDest");

	ABot_FindRoamDest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SoakStop
// (Defined, Event, Public)
// Parameters:
// struct FString                 problem                        (Parm, NeedCtorLink)

void ABot::SoakStop(const struct FString& problem)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SoakStop");

	ABot_SoakStop_Params params;
	params.problem = problem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.PickRetreatDestination
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::PickRetreatDestination()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.PickRetreatDestination");

	ABot_PickRetreatDestination_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FindInventoryGoal
// (Defined, Public)
// Parameters:
// float                          BestWeight                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::FindInventoryGoal(float BestWeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FindInventoryGoal");

	ABot_FindInventoryGoal_Params params;
	params.BestWeight = BestWeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FindSuperPickup
// (Defined, Public)
// Parameters:
// float                          MaxDist                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::FindSuperPickup(float MaxDist)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FindSuperPickup");

	ABot_FindSuperPickup_Params params;
	params.MaxDist = MaxDist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ChooseAttackMode
// (Defined, Public)

void ABot::ChooseAttackMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ChooseAttackMode");

	ABot_ChooseAttackMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.DoRangedAttackOn
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void ABot::DoRangedAttackOn(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DoRangedAttackOn");

	ABot_DoRangedAttackOn_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.FightEnemy
// (Defined, Public)
// Parameters:
// bool                           bCanCharge                     (Parm)
// float                          EnemyStrength                  (Parm)

void ABot::FightEnemy(bool bCanCharge, float EnemyStrength)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FightEnemy");

	ABot_FightEnemy_Params params;
	params.bCanCharge = bCanCharge;
	params.EnemyStrength = EnemyStrength;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.VehicleFightEnemy
// (Defined, Public)
// Parameters:
// bool                           bCanCharge                     (Parm)
// float                          EnemyStrength                  (Parm)

void ABot::VehicleFightEnemy(bool bCanCharge, float EnemyStrength)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.VehicleFightEnemy");

	ABot_VehicleFightEnemy_Params params;
	params.bCanCharge = bCanCharge;
	params.EnemyStrength = EnemyStrength;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.EnemyVisible
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::EnemyVisible()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.EnemyVisible");

	ABot_EnemyVisible_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.DoWaitForLanding
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::DoWaitForLanding()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DoWaitForLanding");

	ABot_DoWaitForLanding_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ExecuteWhatToDoNext
// (Defined, Public)

void ABot::ExecuteWhatToDoNext()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ExecuteWhatToDoNext");

	ABot_ExecuteWhatToDoNext_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.GetEnemyName
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ABot::GetEnemyName()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetEnemyName");

	ABot_GetEnemyName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.GetOldEnemyName
// (Defined, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ABot::GetOldEnemyName()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetOldEnemyName");

	ABot_GetOldEnemyName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.WhatToDoNext
// (Defined, Public)
// Parameters:
// unsigned char                  CallingByte                    (Parm)

void ABot::WhatToDoNext(unsigned char CallingByte)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.WhatToDoNext");

	ABot_WhatToDoNext_Params params;
	params.CallingByte = CallingByte;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.WasKilledBy
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)

void ABot::WasKilledBy(class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.WasKilledBy");

	ABot_WasKilledBy_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SetAlertness
// (Defined, Public)
// Parameters:
// float                          NewAlertness                   (Parm)

void ABot::SetAlertness(float NewAlertness)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetAlertness");

	ABot_SetAlertness_Params params;
	params.NewAlertness = NewAlertness;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SetPeripheralVision
// (Defined, Public)

void ABot::SetPeripheralVision()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetPeripheralVision");

	ABot_SetPeripheralVision_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SetMaxDesiredSpeed
// (Defined, Public)

void ABot::SetMaxDesiredSpeed()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetMaxDesiredSpeed");

	ABot_SetMaxDesiredSpeed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.ResetSkill
// (Defined, Public)

void ABot::ResetSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ResetSkill");

	ABot_ResetSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.InitializeSkill
// (Defined, Public)
// Parameters:
// float                          InSkill                        (Parm)

void ABot::InitializeSkill(float InSkill)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.InitializeSkill");

	ABot_InitializeSkill_Params params;
	params.InSkill = InSkill;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void ABot::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Possess");

	ABot_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.Reset
// (Defined, Public)

void ABot::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Reset");

	ABot_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.NotifyMissedJump
// (Defined, Event, Public)

void ABot::NotifyMissedJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyMissedJump");

	ABot_NotifyMissedJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.NotifyJumpApex
// (Defined, Event, Public)

void ABot::NotifyJumpApex()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyJumpApex");

	ABot_NotifyJumpApex_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.MayDodgeToMoveTarget
// (Defined, Event, Public)

void ABot::MayDodgeToMoveTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.MayDodgeToMoveTarget");

	ABot_MayDodgeToMoveTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.NotifyPhysicsVolumeChange
// (Defined, Public)
// Parameters:
// class APhysicsVolume*          NewVolume                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::NotifyPhysicsVolumeChange(class APhysicsVolume* NewVolume)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyPhysicsVolumeChange");

	ABot_NotifyPhysicsVolumeChange_Params params;
	params.NewVolume = NewVolume;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.StrafeFromDamage
// (Public)
// Parameters:
// float                          Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// bool                           bFindDest                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::StrafeFromDamage(float Damage, class UClass* DamageType, bool bFindDest)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.StrafeFromDamage");

	ABot_StrafeFromDamage_Params params;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.bFindDest = bFindDest;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.BotVoiceMessage
// (Defined, Public)
// Parameters:
// struct FName                   MessageType                    (Parm)
// unsigned char                  MessageID                      (Parm)
// class AController*             Sender                         (Parm)

void ABot::BotVoiceMessage(const struct FName& MessageType, unsigned char MessageID, class AController* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.BotVoiceMessage");

	ABot_BotVoiceMessage_Params params;
	params.MessageType = MessageType;
	params.MessageID = MessageID;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.EnemyChanged
// (Defined, Public)
// Parameters:
// bool                           bNewEnemyVisible               (Parm)

void ABot::EnemyChanged(bool bNewEnemyVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.EnemyChanged");

	ABot_EnemyChanged_Params params;
	params.bNewEnemyVisible = bNewEnemyVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SetEnemyInfo
// (Defined, Public)
// Parameters:
// bool                           bNewEnemyVisible               (Parm)

void ABot::SetEnemyInfo(bool bNewEnemyVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetEnemyInfo");

	ABot_SetEnemyInfo_Params params;
	params.bNewEnemyVisible = bNewEnemyVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void ABot::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Trigger");

	ABot_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.RelativeStrength
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ABot::RelativeStrength(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.RelativeStrength");

	ABot_RelativeStrength_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.AssignSquadResponsibility
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::AssignSquadResponsibility()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.AssignSquadResponsibility");

	ABot_AssignSquadResponsibility_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FreeScript
// (Defined, Public)

void ABot::FreeScript()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FreeScript");

	ABot_FreeScript_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.IsSniping
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::IsSniping()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.IsSniping");

	ABot_IsSniping_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.CheckIfShouldCrouch
// (Defined, Public)
// Parameters:
// struct FVector                 StartPosition                  (Parm)
// struct FVector                 TargetPosition                 (Parm)
// float                          Probability                    (Parm)

void ABot::CheckIfShouldCrouch(const struct FVector& StartPosition, const struct FVector& TargetPosition, float Probability)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CheckIfShouldCrouch");

	ABot_CheckIfShouldCrouch_Params params;
	params.StartPosition = StartPosition;
	params.TargetPosition = TargetPosition;
	params.Probability = Probability;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.CanStakeOut
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CanStakeOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CanStakeOut");

	ABot_CanStakeOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ClearShot
// (Defined, Public)
// Parameters:
// struct FVector                 TargetLoc                      (Parm)
// bool                           bImmediateFire                 (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::ClearShot(const struct FVector& TargetLoc, bool bImmediateFire)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ClearShot");

	ABot_ClearShot_Params params;
	params.TargetLoc = TargetLoc;
	params.bImmediateFire = bImmediateFire;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SetAttractionState
// (Defined, Public)

void ABot::SetAttractionState()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetAttractionState");

	ABot_SetAttractionState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SeePlayer
// (Defined, Event, Public)
// Parameters:
// class APawn*                   SeenPlayer                     (Parm)

void ABot::SeePlayer(class APawn* SeenPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SeePlayer");

	ABot_SeePlayer_Params params;
	params.SeenPlayer = SeenPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.HearNoise
// (Defined, Public)
// Parameters:
// float                          Loudness                       (Parm)
// class AActor*                  NoiseMaker                     (Parm)

void ABot::HearNoise(float Loudness, class AActor* NoiseMaker)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.HearNoise");

	ABot_HearNoise_Params params;
	params.Loudness = Loudness;
	params.NoiseMaker = NoiseMaker;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.ClearTemporaryOrders
// (Defined, Public)

void ABot::ClearTemporaryOrders()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ClearTemporaryOrders");

	ABot_ClearTemporaryOrders_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SetTemporaryOrders
// (Defined, Public)
// Parameters:
// struct FName                   NewOrders                      (Parm)
// class AController*             OrderGiver                     (Parm)

void ABot::SetTemporaryOrders(const struct FName& NewOrders, class AController* OrderGiver)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetTemporaryOrders");

	ABot_SetTemporaryOrders_Params params;
	params.NewOrders = NewOrders;
	params.OrderGiver = OrderGiver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SetOrders
// (Defined, Public)
// Parameters:
// struct FName                   NewOrders                      (Parm)
// class AController*             OrderGiver                     (Parm)

void ABot::SetOrders(const struct FName& NewOrders, class AController* OrderGiver)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetOrders");

	ABot_SetOrders_Params params;
	params.NewOrders = NewOrders;
	params.OrderGiver = OrderGiver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.SendMessage
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Recipient                      (Parm)
// struct FName                   MessageType                    (Parm)
// unsigned char                  MessageID                      (Parm)
// float                          wait                           (Parm)
// struct FName                   BroadcastType                  (Parm)

void ABot::SendMessage(class APlayerReplicationInfo* Recipient, const struct FName& MessageType, unsigned char MessageID, float wait, const struct FName& BroadcastType)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SendMessage");

	ABot_SendMessage_Params params;
	params.Recipient = Recipient;
	params.MessageType = MessageType;
	params.MessageID = MessageID;
	params.wait = wait;
	params.BroadcastType = BroadcastType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.GetMessageIndex
// (Defined, Public)
// Parameters:
// struct FName                   PhraseName                     (Parm)
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char ABot::GetMessageIndex(const struct FName& PhraseName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetMessageIndex");

	ABot_GetMessageIndex_Params params;
	params.PhraseName = PhraseName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.YellAt
// (Defined, Public)
// Parameters:
// class APawn*                   Moron                          (Parm)

void ABot::YellAt(class APawn* Moron)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.YellAt");

	ABot_YellAt_Params params;
	params.Moron = Moron;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.GetOrderObject
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ABot::GetOrderObject()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetOrderObject");

	ABot_GetOrderObject_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.GetOrders
// (Defined, Public)
// Parameters:
// struct FName                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FName ABot::GetOrders()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetOrders");

	ABot_GetOrders_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void ABot::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DisplayDebug");

	ABot_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function UnrealGame.Bot.CanCombo
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CanCombo()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CanCombo");

	ABot_CanCombo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.CanComboMoving
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CanComboMoving()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CanComboMoving");

	ABot_CanComboMoving_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ProficientWithWeapon
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::ProficientWithWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ProficientWithWeapon");

	ABot_ProficientWithWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.WeaponPreference
// (Defined, Public)
// Parameters:
// class AwWeapon*                W                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ABot::WeaponPreference(class AwWeapon* W)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.WeaponPreference");

	ABot_WeaponPreference_Params params;
	params.W = W;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.ChangedWeapon
// (Defined, Public)

void ABot::ChangedWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ChangedWeapon");

	ABot_ChangedWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.StopFiring
// (Defined, Public)

void ABot::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.StopFiring");

	ABot_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.CanAttack
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CanAttack(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CanAttack");

	ABot_CanAttack_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.FireWeaponAt
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::FireWeaponAt(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FireWeaponAt");

	ABot_FireWeaponAt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.TimedFireWeaponAtEnemy
// (Defined, Public)

void ABot::TimedFireWeaponAtEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.TimedFireWeaponAtEnemy");

	ABot_TimedFireWeaponAtEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.ShouldFireAgain
// (Defined, Public)
// Parameters:
// float                          RefireRate                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::ShouldFireAgain(float RefireRate)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ShouldFireAgain");

	ABot_ShouldFireAgain_Params params;
	params.RefireRate = RefireRate;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.WeaponFireAgain
// (Defined, Public)
// Parameters:
// float                          RefireRate                     (Parm)
// bool                           bFinishedFire                  (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.WeaponFireAgain");

	ABot_WeaponFireAgain_Params params;
	params.RefireRate = RefireRate;
	params.bFinishedFire = bFinishedFire;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.WaitForMover
// (Defined, Public)
// Parameters:
// class AMover*                  M                              (Parm)

void ABot::WaitForMover(class AMover* M)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.WaitForMover");

	ABot_WaitForMover_Params params;
	params.M = M;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.ImpactJump
// (Defined, Public)

void ABot::ImpactJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ImpactJump");

	ABot_ImpactJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.CanUseTranslocator
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CanUseTranslocator()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CanUseTranslocator");

	ABot_CanUseTranslocator_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.CanImpactJump
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CanImpactJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CanImpactJump");

	ABot_CanImpactJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.RateWeapon
// (Defined, Simulated, Public)
// Parameters:
// class AwWeapon*                W                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ABot::RateWeapon(class AwWeapon* W)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.RateWeapon");

	ABot_RateWeapon_Params params;
	params.W = W;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.UpdatePawnViewPitch
// (Defined, Public)

void ABot::UpdatePawnViewPitch()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.UpdatePawnViewPitch");

	ABot_UpdatePawnViewPitch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.GetMyPlayer
// (Defined, Public)
// Parameters:
// class APawn*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class APawn* ABot::GetMyPlayer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetMyPlayer");

	ABot_GetMyPlayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.InitPlayerReplicationInfo
// (Defined, Public)

void ABot::InitPlayerReplicationInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.InitPlayerReplicationInfo");

	ABot_InitPlayerReplicationInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.DontReuseTaunt
// (Defined, Public)
// Parameters:
// int                            t                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::DontReuseTaunt(int t)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.DontReuseTaunt");

	ABot_DontReuseTaunt_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.AutoTaunt
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::AutoTaunt()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.AutoTaunt");

	ABot_AutoTaunt_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SetCombatTimer
// (Defined, Public)

void ABot::SetCombatTimer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetCombatTimer");

	ABot_SetCombatTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.Startle
// (Defined, Public)
// Parameters:
// class AActor*                  Feared                         (Parm)

void ABot::Startle(class AActor* Feared)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Startle");

	ABot_Startle_Params params;
	params.Feared = Feared;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.FearThisSpot
// (Defined, Public)
// Parameters:
// class AAvoidMarker*            aSpot                          (Parm)

void ABot::FearThisSpot(class AAvoidMarker* aSpot)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.FearThisSpot");

	ABot_FearThisSpot_Params params;
	params.aSpot = aSpot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.TryCombo
// (Defined, Public)
// Parameters:
// struct FString                 ComboName                      (Parm, NeedCtorLink)

void ABot::TryCombo(const struct FString& ComboName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.TryCombo");

	ABot_TryCombo_Params params;
	params.ComboName = ComboName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.CanDoubleJump
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::CanDoubleJump(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.CanDoubleJump");

	ABot_CanDoubleJump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.GetOutOfVehicle
// (Defined, Public)

void ABot::GetOutOfVehicle()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.GetOutOfVehicle");

	ABot_GetOutOfVehicle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.NotifyHitWall
// (Defined, Event, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)
// class AActor*                  Wall                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::NotifyHitWall(const struct FVector& HitNormal, class AActor* Wall)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyHitWall");

	ABot_NotifyHitWall_Params params;
	params.HitNormal = HitNormal;
	params.Wall = Wall;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.SetupSpecialPathAbilities
// (Defined, Event, Public)

void ABot::SetupSpecialPathAbilities()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.SetupSpecialPathAbilities");

	ABot_SetupSpecialPathAbilities_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.ShouldKeepShielding
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ABot::ShouldKeepShielding()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.ShouldKeepShielding");

	ABot_ShouldKeepShielding_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.NotifyAddInventory
// (Defined, Public)
// Parameters:
// class AInventory*              NewItem                        (Parm)

void ABot::NotifyAddInventory(class AInventory* NewItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.NotifyAddInventory");

	ABot_NotifyAddInventory_Params params;
	params.NewItem = NewItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.HasSuperWeapon
// (Defined, Public)
// Parameters:
// class AwWeapon*                ReturnValue                    (Parm, OutParm, ReturnParm)

class AwWeapon* ABot::HasSuperWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.HasSuperWeapon");

	ABot_HasSuperWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.Bot.PostBeginPlay
// (Defined, Public)

void ABot::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.PostBeginPlay");

	ABot_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.Bot.Destroyed
// (Defined, Public)

void ABot::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.Bot.Destroyed");

	ABot_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.FriendlyToward
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::FriendlyToward(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.FriendlyToward");

	ASquadAI_FriendlyToward_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.CautiousAdvance
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::CautiousAdvance(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.CautiousAdvance");

	ASquadAI_CautiousAdvance_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.IsDefending
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::IsDefending(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.IsDefending");

	ASquadAI_IsDefending_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.ClearPathFor
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::ClearPathFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.ClearPathFor");

	ASquadAI_ClearPathFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.PickRetreatDestination
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::PickRetreatDestination(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.PickRetreatDestination");

	ASquadAI_PickRetreatDestination_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.BeDevious
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::BeDevious()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.BeDevious");

	ASquadAI_BeDevious_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void ASquadAI::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.DisplayDebug");

	ASquadAI_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function UnrealGame.SquadAI.PickBotToReassign
// (Defined, Public)
// Parameters:
// class ABot*                    ReturnValue                    (Parm, OutParm, ReturnParm)

class ABot* ASquadAI::PickBotToReassign()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.PickBotToReassign");

	ASquadAI_PickBotToReassign_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.BotSuitability
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ASquadAI::BotSuitability(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.BotSuitability");

	ASquadAI_BotSuitability_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.ShouldDestroyTranslocator
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::ShouldDestroyTranslocator(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.ShouldDestroyTranslocator");

	ASquadAI_ShouldDestroyTranslocator_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.CheckSquadObjectives
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::CheckSquadObjectives(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.CheckSquadObjectives");

	ASquadAI_CheckSquadObjectives_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.OverrideFollowPlayer
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::OverrideFollowPlayer(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.OverrideFollowPlayer");

	ASquadAI_OverrideFollowPlayer_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.CheckSpecialVehicleObjectives
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::CheckSpecialVehicleObjectives(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.CheckSpecialVehicleObjectives");

	ASquadAI_CheckSpecialVehicleObjectives_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.VehicleDesireability
// (Defined, Public)
// Parameters:
// class AVehicle*                V                              (Parm)
// class ABot*                    B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ASquadAI::VehicleDesireability(class AVehicle* V, class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.VehicleDesireability");

	ASquadAI_VehicleDesireability_Params params;
	params.V = V;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.CheckVehicle
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::CheckVehicle(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.CheckVehicle");

	ASquadAI_CheckVehicle_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.BotEnteredVehicle
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ASquadAI::BotEnteredVehicle(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.BotEnteredVehicle");

	ASquadAI_BotEnteredVehicle_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.NeverBail
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::NeverBail(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.NeverBail");

	ASquadAI_NeverBail_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.MaxVehicleDist
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ASquadAI::MaxVehicleDist(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.MaxVehicleDist");

	ASquadAI_MaxVehicleDist_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.AssignSquadResponsibility
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::AssignSquadResponsibility(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AssignSquadResponsibility");

	ASquadAI_AssignSquadResponsibility_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.AddTransientCosts
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// float                          f                              (Parm)

void ASquadAI::AddTransientCosts(class ABot* B, float f)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AddTransientCosts");

	ASquadAI_AddTransientCosts_Params params;
	params.B = B;
	params.f = f;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.AllowTaunt
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::AllowTaunt(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AllowTaunt");

	ASquadAI_AllowTaunt_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.TellBotToFollow
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::TellBotToFollow(class ABot* B, class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.TellBotToFollow");

	ASquadAI_TellBotToFollow_Params params;
	params.B = B;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.PickNewLeader
// (Defined, Public)

void ASquadAI::PickNewLeader()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.PickNewLeader");

	ASquadAI_PickNewLeader_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.GetSize
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ASquadAI::GetSize()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetSize");

	ASquadAI_GetSize_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.GetShortOrderStringFor
// (Defined, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ASquadAI::GetShortOrderStringFor(class ATeamPlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetShortOrderStringFor");

	ASquadAI_GetShortOrderStringFor_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.GetOrderStringFor
// (Defined, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ASquadAI::GetOrderStringFor(class ATeamPlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetOrderStringFor");

	ASquadAI_GetOrderStringFor_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.GetOrders
// (Defined, Public)
// Parameters:
// struct FName                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FName ASquadAI::GetOrders()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetOrders");

	ASquadAI_GetOrders_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.Retask
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ASquadAI::Retask(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.Retask");

	ASquadAI_Retask_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.SetObjective
// (Defined, Public)
// Parameters:
// class AGameObjective*          o                              (Parm)
// bool                           bForceUpdate                   (Parm)

void ASquadAI::SetObjective(class AGameObjective* o, bool bForceUpdate)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetObjective");

	ASquadAI_SetObjective_Params params;
	params.o = o;
	params.bForceUpdate = bForceUpdate;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.SetFreelanceScriptFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ASquadAI::SetFreelanceScriptFor(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetFreelanceScriptFor");

	ASquadAI_SetFreelanceScriptFor_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.SetDefenseScriptFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ASquadAI::SetDefenseScriptFor(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetDefenseScriptFor");

	ASquadAI_SetDefenseScriptFor_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.SwitchBots
// (Defined, Public)
// Parameters:
// class ABot*                    MyBot                          (Parm)
// class ABot*                    OtherBot                       (Parm)

void ASquadAI::SwitchBots(class ABot* MyBot, class ABot* OtherBot)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SwitchBots");

	ASquadAI_SwitchBots_Params params;
	params.MyBot = MyBot;
	params.OtherBot = OtherBot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.AddBot
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ASquadAI::AddBot(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AddBot");

	ASquadAI_AddBot_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.RemoveBot
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ASquadAI::RemoveBot(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.RemoveBot");

	ASquadAI_RemoveBot_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.RemovePlayer
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)

void ASquadAI::RemovePlayer(class APlayerController* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.RemovePlayer");

	ASquadAI_RemovePlayer_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.SetLeader
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void ASquadAI::SetLeader(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetLeader");

	ASquadAI_SetLeader_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.SetFinalStretch
// (Defined, Public)
// Parameters:
// bool                           bValue                         (Parm)

void ASquadAI::SetFinalStretch(bool bValue)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetFinalStretch");

	ASquadAI_SetFinalStretch_Params params;
	params.bValue = bValue;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.FindPathToObjective
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class AActor*                  o                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::FindPathToObjective(class ABot* B, class AActor* o)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.FindPathToObjective");

	ASquadAI_FindPathToObjective_Params params;
	params.B = B;
	params.o = o;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.TryToIntercept
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class APawn*                   P                              (Parm)
// class AActor*                  RouteGoal                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::TryToIntercept(class ABot* B, class APawn* P, class AActor* RouteGoal)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.TryToIntercept");

	ASquadAI_TryToIntercept_Params params;
	params.B = B;
	params.P = P;
	params.RouteGoal = RouteGoal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.SetAlternatePath
// (Defined, Public)
// Parameters:
// bool                           bResetSquad                    (Parm)

void ASquadAI::SetAlternatePath(bool bResetSquad)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetAlternatePath");

	ASquadAI_SetAlternatePath_Params params;
	params.bResetSquad = bResetSquad;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.Initialize
// (Defined, Public)
// Parameters:
// class AUnrealTeamInfo*         t                              (Parm)
// class AGameObjective*          o                              (Parm)
// class AController*             C                              (Parm)

void ASquadAI::Initialize(class AUnrealTeamInfo* t, class AGameObjective* o, class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.Initialize");

	ASquadAI_Initialize_Params params;
	params.t = t;
	params.o = o;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.MergeWith
// (Defined, Public)
// Parameters:
// class ASquadAI*                S                              (Parm)

void ASquadAI::MergeWith(class ASquadAI* S)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.MergeWith");

	ASquadAI_MergeWith_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.CloseToLeader
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::CloseToLeader(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.CloseToLeader");

	ASquadAI_CloseToLeader_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.NearFormationCenter
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::NearFormationCenter(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.NearFormationCenter");

	ASquadAI_NearFormationCenter_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.WanderNearLeader
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::WanderNearLeader(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.WanderNearLeader");

	ASquadAI_WanderNearLeader_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.WaitAtThisPosition
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::WaitAtThisPosition(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.WaitAtThisPosition");

	ASquadAI_WaitAtThisPosition_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.ShouldDeferTo
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::ShouldDeferTo(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.ShouldDeferTo");

	ASquadAI_ShouldDeferTo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.AssessThreat
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class APawn*                   NewThreat                      (Parm)
// bool                           bThreatVisible                 (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ASquadAI::AssessThreat(class ABot* B, class APawn* NewThreat, bool bThreatVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AssessThreat");

	ASquadAI_AssessThreat_Params params;
	params.B = B;
	params.NewThreat = NewThreat;
	params.bThreatVisible = bThreatVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.UnderFire
// (Defined, Public)
// Parameters:
// class APawn*                   NewThreat                      (Parm)
// class ABot*                    Ignored                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::UnderFire(class APawn* NewThreat, class ABot* Ignored)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.UnderFire");

	ASquadAI_UnderFire_Params params;
	params.NewThreat = NewThreat;
	params.Ignored = Ignored;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.ModifyThreat
// (Defined, Public)
// Parameters:
// float                          current                        (Parm)
// class APawn*                   NewThreat                      (Parm)
// bool                           bThreatVisible                 (Parm)
// class ABot*                    B                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ASquadAI::ModifyThreat(float current, class APawn* NewThreat, bool bThreatVisible, class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.ModifyThreat");

	ASquadAI_ModifyThreat_Params params;
	params.current = current;
	params.NewThreat = NewThreat;
	params.bThreatVisible = bThreatVisible;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.FindNewEnemyFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           bSeeEnemy                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::FindNewEnemyFor(class ABot* B, bool bSeeEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.FindNewEnemyFor");

	ASquadAI_FindNewEnemyFor_Params params;
	params.B = B;
	params.bSeeEnemy = bSeeEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void ASquadAI::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.NotifyKilled");

	ASquadAI_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.RemoveEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   E                              (Parm)

void ASquadAI::RemoveEnemy(class APawn* E)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.RemoveEnemy");

	ASquadAI_RemoveEnemy_Params params;
	params.E = E;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.IsOnSquad
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::IsOnSquad(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.IsOnSquad");

	ASquadAI_IsOnSquad_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.PriorityObjective
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char ASquadAI::PriorityObjective(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.PriorityObjective");

	ASquadAI_PriorityObjective_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.SetEnemy
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class APawn*                   NewEnemy                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::SetEnemy(class ABot* B, class APawn* NewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetEnemy");

	ASquadAI_SetEnemy_Params params;
	params.B = B;
	params.NewEnemy = NewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.ValidEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   NewEnemy                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::ValidEnemy(class APawn* NewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.ValidEnemy");

	ASquadAI_ValidEnemy_Params params;
	params.NewEnemy = NewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.AddEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   NewEnemy                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::AddEnemy(class APawn* NewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AddEnemy");

	ASquadAI_AddEnemy_Params params;
	params.NewEnemy = NewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.MustKeepEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   E                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::MustKeepEnemy(class APawn* E)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.MustKeepEnemy");

	ASquadAI_MustKeepEnemy_Params params;
	params.E = E;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.LostEnemy
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::LostEnemy(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.LostEnemy");

	ASquadAI_LostEnemy_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.MergeEnemiesFrom
// (Defined, Public)
// Parameters:
// class ASquadAI*                S                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::MergeEnemiesFrom(class ASquadAI* S)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.MergeEnemiesFrom");

	ASquadAI_MergeEnemiesFrom_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.FormationCenter
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ASquadAI::FormationCenter()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.FormationCenter");

	ASquadAI_FormationCenter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.GetFacingRotation
// (Defined, Public)
// Parameters:
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator ASquadAI::GetFacingRotation()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetFacingRotation");

	ASquadAI_GetFacingRotation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.GetLinkVehicle
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class AVehicle*                ReturnValue                    (Parm, OutParm, ReturnParm)

class AVehicle* ASquadAI::GetLinkVehicle(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetLinkVehicle");

	ASquadAI_GetLinkVehicle_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.GetKeyVehicle
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class AVehicle*                ReturnValue                    (Parm, OutParm, ReturnParm)

class AVehicle* ASquadAI::GetKeyVehicle(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetKeyVehicle");

	ASquadAI_GetKeyVehicle_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.SetFacingActor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ASquadAI::SetFacingActor(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.SetFacingActor");

	ASquadAI_SetFacingActor_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.AllowImpactJumpBy
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::AllowImpactJumpBy(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AllowImpactJumpBy");

	ASquadAI_AllowImpactJumpBy_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.AllowTranslocationBy
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::AllowTranslocationBy(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AllowTranslocationBy");

	ASquadAI_AllowTranslocationBy_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.Destroyed
// (Defined, Public)

void ASquadAI::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.Destroyed");

	ASquadAI_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.GetRestingFormation
// (Defined, Public)
// Parameters:
// class ARestingFormation*       ReturnValue                    (Parm, OutParm, ReturnParm)

class ARestingFormation* ASquadAI::GetRestingFormation()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.GetRestingFormation");

	ASquadAI_GetRestingFormation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.AllowDetourTo
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class ANavigationPoint*        N                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::AllowDetourTo(class ABot* B, class ANavigationPoint* N)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AllowDetourTo");

	ASquadAI_AllowDetourTo_Params params;
	params.B = B;
	params.N = N;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.ShouldSuppressEnemy
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASquadAI::ShouldSuppressEnemy(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.ShouldSuppressEnemy");

	ASquadAI_ShouldSuppressEnemy_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SquadAI.CriticalObjectiveWarning
// (Defined, Public)
// Parameters:
// class APawn*                   NewEnemy                       (Parm)

void ASquadAI::CriticalObjectiveWarning(class APawn* NewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.CriticalObjectiveWarning");

	ASquadAI_CriticalObjectiveWarning_Params params;
	params.NewEnemy = NewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.AssignCombo
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ASquadAI::AssignCombo(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.AssignCombo");

	ASquadAI_AssignCombo_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SquadAI.Reset
// (Defined, Public)

void ASquadAI::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SquadAI.Reset");

	ASquadAI_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.LogReturned
// (Public)

void AGameObject::LogReturned()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.LogReturned");

	AGameObject_LogReturned_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.LogDropped
// (Public)

void AGameObject::LogDropped()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.LogDropped");

	AGameObject_LogDropped_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.LogTaken
// (Public)
// Parameters:
// class AController*             C                              (Parm)

void AGameObject::LogTaken(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.LogTaken");

	AGameObject_LogTaken_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.BaseChange
// (Defined, Singular, Simulated, Public)

void AGameObject::BaseChange()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.BaseChange");

	AGameObject_BaseChange_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.Landed
// (Defined, Public)
// Parameters:
// struct FVector                 HitNormall                     (Parm)

void AGameObject::Landed(const struct FVector& HitNormall)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.Landed");

	AGameObject_Landed_Params params;
	params.HitNormall = HitNormall;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.NotReachableBy
// (Defined, Event, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AGameObject::NotReachableBy(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.NotReachableBy");

	AGameObject_NotReachableBy_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.FellOutOfWorld
// (Defined, Event, Public)
// Parameters:
// TEnumAsByte<EeKillZType>       KillType                       (Parm)

void AGameObject::FellOutOfWorld(TEnumAsByte<EeKillZType> KillType)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.FellOutOfWorld");

	AGameObject_FellOutOfWorld_Params params;
	params.KillType = KillType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.Touch
// (Defined, Singular, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AGameObject::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.Touch");

	AGameObject_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.ValidHolder
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObject::ValidHolder(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.ValidHolder");

	AGameObject_ValidHolder_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObject.IsHome
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObject::IsHome()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.IsHome");

	AGameObject_IsHome_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObject.Position
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AGameObject::Position()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.Position");

	AGameObject_Position_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObject.SetDisable
// (Defined, Protected)
// Parameters:
// bool                           Disable                        (Parm)

void AGameObject::SetDisable(bool Disable)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.SetDisable");

	AGameObject_SetDisable_Params params;
	params.Disable = Disable;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.ClearHolder
// (Defined, Public)

void AGameObject::ClearHolder()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.ClearHolder");

	AGameObject_ClearHolder_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.CalcSetHome
// (Defined, Protected)

void AGameObject::CalcSetHome()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.CalcSetHome");

	AGameObject_CalcSetHome_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.SendHomeDisabled
// (Public)
// Parameters:
// float                          TimeOut                        (Parm)

void AGameObject::SendHomeDisabled(float TimeOut)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.SendHomeDisabled");

	AGameObject_SendHomeDisabled_Params params;
	params.TimeOut = TimeOut;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.SendHome
// (Defined, Public)

void AGameObject::SendHome()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.SendHome");

	AGameObject_SendHome_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.Drop
// (Defined, Public)
// Parameters:
// struct FVector                 NewVel                         (Parm)
// struct FString                 sReason                        (OptionalParm, Parm, NeedCtorLink)

void AGameObject::Drop(const struct FVector& NewVel, const struct FString& sReason)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.Drop");

	AGameObject_Drop_Params params;
	params.NewVel = NewVel;
	params.sReason = sReason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.Score
// (Defined, Public)

void AGameObject::Score()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.Score");

	AGameObject_Score_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.SetHolder
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AGameObject::SetHolder(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.SetHolder");

	AGameObject_SetHolder_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.CanBePickedUpBy
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObject::CanBePickedUpBy(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.CanBePickedUpBy");

	AGameObject_CanBePickedUpBy_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObject.CanBeThrownBy
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObject::CanBeThrownBy(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.CanBeThrownBy");

	AGameObject_CanBeThrownBy_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObject.ForceBegin
// (Defined, Public)

void AGameObject::ForceBegin()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.ForceBegin");

	AGameObject_ForceBegin_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObject.PostBeginPlay
// (Defined, Public)

void AGameObject::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObject.PostBeginPlay");

	AGameObject_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.wViewAttacked
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AUnrealPlayer::wViewAttacked(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.wViewAttacked");

	AUnrealPlayer_wViewAttacked_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.wAttackedView
// (Defined, Public)
// Parameters:
// int                            iPitch                         (Parm)
// int                            iYaw                           (Parm)
// int                            iRoll                          (Parm)

void AUnrealPlayer::wAttackedView(int iPitch, int iYaw, int iRoll)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.wAttackedView");

	AUnrealPlayer_wAttackedView_Params params;
	params.iPitch = iPitch;
	params.iYaw = iYaw;
	params.iRoll = iRoll;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.AttackedView
// (Defined, Public)
// Parameters:
// int                            iWeaponID                      (Parm)
// float                          fHitGunKick                    (Parm)
// struct FVector                 vAttacked                      (Parm)

void AUnrealPlayer::AttackedView(int iWeaponID, float fHitGunKick, const struct FVector& vAttacked)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.AttackedView");

	AUnrealPlayer_AttackedView_Params params;
	params.iWeaponID = iWeaponID;
	params.fHitGunKick = fHitGunKick;
	params.vAttacked = vAttacked;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.RotateByAttacked
// (Defined, Public)
// Parameters:
// struct FVector                 CameraLocation                 (Parm, OutParm)
// struct FRotator                CameraRotation                 (Parm, OutParm)

void AUnrealPlayer::RotateByAttacked(struct FVector* CameraLocation, struct FRotator* CameraRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.RotateByAttacked");

	AUnrealPlayer_RotateByAttacked_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (CameraLocation != nullptr)
		*CameraLocation = params.CameraLocation;
	if (CameraRotation != nullptr)
		*CameraRotation = params.CameraRotation;
}


// Function UnrealGame.UnrealPlayer.DisplayDebug
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AUnrealPlayer::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.DisplayDebug");

	AUnrealPlayer_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function UnrealGame.UnrealPlayer.ClientReceiveBotDebugString
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// struct FString                 DebugString                    (Parm, NeedCtorLink)

void AUnrealPlayer::ClientReceiveBotDebugString(const struct FString& DebugString)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientReceiveBotDebugString");

	AUnrealPlayer_ClientReceiveBotDebugString_Params params;
	params.DebugString = DebugString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerSendBotDebugString
// (Defined, Net, NetReliable, Public)

void AUnrealPlayer::ServerSendBotDebugString()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerSendBotDebugString");

	AUnrealPlayer_ServerSendBotDebugString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.NetDebugBot
// (Defined, Exec, Public)

void AUnrealPlayer::NetDebugBot()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.NetDebugBot");

	AUnrealPlayer_NetDebugBot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerChatDebug
// (Defined, Net, NetReliable, Public)

void AUnrealPlayer::ServerChatDebug()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerChatDebug");

	AUnrealPlayer_ServerChatDebug_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientGameEnded
// (Defined, Net, NetReliable, Public)

void AUnrealPlayer::ClientGameEnded()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientGameEnded");

	AUnrealPlayer_ClientGameEnded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.AutoJoinVoiceChat
// (Defined, Simulated, Public)

void AUnrealPlayer::AutoJoinVoiceChat()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.AutoJoinVoiceChat");

	AUnrealPlayer_AutoJoinVoiceChat_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AUnrealPlayer::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PostNetBeginPlay");

	AUnrealPlayer_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.NeedNetNotify
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayer::NeedNetNotify()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.NeedNetNotify");

	AUnrealPlayer_NeedNetNotify_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayer.SetCustomRewardAnnouncerClass
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 NewAnnouncerClass              (Parm, NeedCtorLink)

void AUnrealPlayer::SetCustomRewardAnnouncerClass(const struct FString& NewAnnouncerClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.SetCustomRewardAnnouncerClass");

	AUnrealPlayer_SetCustomRewardAnnouncerClass_Params params;
	params.NewAnnouncerClass = NewAnnouncerClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.GetCustomRewardAnnouncerClass
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealPlayer::GetCustomRewardAnnouncerClass()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.GetCustomRewardAnnouncerClass");

	AUnrealPlayer_GetCustomRewardAnnouncerClass_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayer.SetCustomStatusAnnouncerClass
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 NewAnnouncerClass              (Parm, NeedCtorLink)

void AUnrealPlayer::SetCustomStatusAnnouncerClass(const struct FString& NewAnnouncerClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.SetCustomStatusAnnouncerClass");

	AUnrealPlayer_SetCustomStatusAnnouncerClass_Params params;
	params.NewAnnouncerClass = NewAnnouncerClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.GetCustomStatusAnnouncerClass
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealPlayer::GetCustomStatusAnnouncerClass()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.GetCustomStatusAnnouncerClass");

	AUnrealPlayer_GetCustomStatusAnnouncerClass_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayer.ShowMidGameMenu
// (Defined, Public)
// Parameters:
// bool                           bPause                         (Parm)

void AUnrealPlayer::ShowMidGameMenu(bool bPause)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ShowMidGameMenu");

	AUnrealPlayer_ShowMidGameMenu_Params params;
	params.bPause = bPause;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerDropFlag
// (Defined, Net, NetReliable, Public)

void AUnrealPlayer::ServerDropFlag()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerDropFlag");

	AUnrealPlayer_ServerDropFlag_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.DropFlag
// (Defined, Exec, Public)

void AUnrealPlayer::DropFlag()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.DropFlag");

	AUnrealPlayer_DropFlag_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PlayWinMessage
// (Defined, Net, NetReliable, Public)
// Parameters:
// bool                           bWinner                        (Parm)

void AUnrealPlayer::PlayWinMessage(bool bWinner)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PlayWinMessage");

	AUnrealPlayer_PlayWinMessage_Params params;
	params.bWinner = bWinner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientPlayTakeHit
// (Defined, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)
// unsigned char                  Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AUnrealPlayer::ClientPlayTakeHit(const struct FVector& HitLoc, unsigned char Damage, class UClass* DamageType, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientPlayTakeHit");

	AUnrealPlayer_ClientPlayTakeHit_Params params;
	params.HitLoc = HitLoc;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.HitSound
// (Defined, Public)

void AUnrealPlayer::HitSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.HitSound");

	AUnrealPlayer_HitSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.NewClientPlayTakeHit
// (Defined, Net, NetReliable, Public)
// Parameters:
// struct FVector                 AttackLoc                      (Parm)
// struct FVector                 HitLoc                         (Parm)
// unsigned char                  Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            iWeaponID                      (OptionalParm, Parm)
// float                          fHitGunKick                    (OptionalParm, Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AUnrealPlayer::NewClientPlayTakeHit(const struct FVector& AttackLoc, const struct FVector& HitLoc, unsigned char Damage, class UClass* DamageType, int iWeaponID, float fHitGunKick, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.NewClientPlayTakeHit");

	AUnrealPlayer_NewClientPlayTakeHit_Params params;
	params.AttackLoc = AttackLoc;
	params.HitLoc = HitLoc;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.iWeaponID = iWeaponID;
	params.fHitGunKick = fHitGunKick;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.NotifyTakeHit
// (Defined, Public)
// Parameters:
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AUnrealPlayer::NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.NotifyTakeHit");

	AUnrealPlayer_NotifyTakeHit_Params params;
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


// Function UnrealGame.UnrealPlayer.ShowLoginMenu
// (Defined, Simulated, Public)

void AUnrealPlayer::ShowLoginMenu()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ShowLoginMenu");

	AUnrealPlayer_ShowLoginMenu_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientReceiveLoginMenu
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// struct FString                 MenuClass                      (Parm, NeedCtorLink)
// bool                           bForce                         (Parm)

void AUnrealPlayer::ClientReceiveLoginMenu(const struct FString& MenuClass, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientReceiveLoginMenu");

	AUnrealPlayer_ClientReceiveLoginMenu_Params params;
	params.MenuClass = MenuClass;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerSetReadyToStart
// (Defined, Net, NetReliable, Public)

void AUnrealPlayer::ServerSetReadyToStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerSetReadyToStart");

	AUnrealPlayer_ServerSetReadyToStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.InitInputSystem
// (Defined, Simulated, Public)

void AUnrealPlayer::InitInputSystem()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.InitInputSystem");

	AUnrealPlayer_InitInputSystem_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PostNetReceive
// (Defined, Simulated, Event, Public)

void AUnrealPlayer::PostNetReceive()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PostNetReceive");

	AUnrealPlayer_PostNetReceive_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PlayStartupMessage
// (Defined, Net, NetReliable, Public)
// Parameters:
// unsigned char                  StartupStage                   (Parm)

void AUnrealPlayer::PlayStartupMessage(unsigned char StartupStage)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PlayStartupMessage");

	AUnrealPlayer_PlayStartupMessage_Params params;
	params.StartupStage = StartupStage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.KickWarning
// (Defined, Event, Public)

void AUnrealPlayer::KickWarning()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.KickWarning");

	AUnrealPlayer_KickWarning_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PlayAnnouncement
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class USound*                  ASound                         (Parm)
// unsigned char                  AnnouncementLevel              (Parm)
// bool                           bForce                         (OptionalParm, Parm)

void AUnrealPlayer::PlayAnnouncement(class USound* ASound, unsigned char AnnouncementLevel, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PlayAnnouncement");

	AUnrealPlayer_PlayAnnouncement_Params params;
	params.ASound = ASound;
	params.AnnouncementLevel = AnnouncementLevel;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PlayRewardAnnouncement
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// struct FName                   AName                          (Parm)
// unsigned char                  AnnouncementLevel              (Parm)
// bool                           bForce                         (OptionalParm, Parm)
// TEnumAsByte<ESoundSlot>        Slot                           (OptionalParm, Parm)
// bool                           isWomanVoice                   (OptionalParm, Parm)

void AUnrealPlayer::PlayRewardAnnouncement(const struct FName& AName, unsigned char AnnouncementLevel, bool bForce, TEnumAsByte<ESoundSlot> Slot, bool isWomanVoice)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PlayRewardAnnouncement");

	AUnrealPlayer_PlayRewardAnnouncement_Params params;
	params.AName = AName;
	params.AnnouncementLevel = AnnouncementLevel;
	params.bForce = bForce;
	params.Slot = Slot;
	params.isWomanVoice = isWomanVoice;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PlayStatusAnnouncement
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// struct FString                 AName                          (Parm, NeedCtorLink)
// unsigned char                  AnnouncementLevel              (Parm)
// bool                           bForce                         (OptionalParm, Parm)

void AUnrealPlayer::PlayStatusAnnouncement(const struct FString& AName, unsigned char AnnouncementLevel, bool bForce)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PlayStatusAnnouncement");

	AUnrealPlayer_PlayStatusAnnouncement_Params params;
	params.AName = AName;
	params.AnnouncementLevel = AnnouncementLevel;
	params.bForce = bForce;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerPlayVehicleHorn
// (Defined, Net, NetReliable, Public)
// Parameters:
// int                            HornIndex                      (Parm)

void AUnrealPlayer::ServerPlayVehicleHorn(int HornIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerPlayVehicleHorn");

	AUnrealPlayer_ServerPlayVehicleHorn_Params params;
	params.HornIndex = HornIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PlayVehicleHorn
// (Defined, Exec, Public)
// Parameters:
// int                            HornIndex                      (Parm)

void AUnrealPlayer::PlayVehicleHorn(int HornIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PlayVehicleHorn");

	AUnrealPlayer_PlayVehicleHorn_Params params;
	params.HornIndex = HornIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerTaunt
// (Defined, Net, NetReliable, Public)
// Parameters:
// struct FName                   AnimName                       (Parm)

void AUnrealPlayer::ServerTaunt(const struct FName& AnimName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerTaunt");

	AUnrealPlayer_ServerTaunt_Params params;
	params.AnimName = AnimName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.TAUNT
// (Defined, Exec, Public)
// Parameters:
// struct FName                   Sequence                       (Parm)

void AUnrealPlayer::TAUNT(const struct FName& Sequence)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.TAUNT");

	AUnrealPlayer_TAUNT_Params params;
	params.Sequence = Sequence;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.RandomTaunt
// (Defined, Exec, Public)

void AUnrealPlayer::RandomTaunt()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.RandomTaunt");

	AUnrealPlayer_RandomTaunt_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.GetMessageIndex
// (Defined, Public)
// Parameters:
// struct FName                   PhraseName                     (Parm)
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char AUnrealPlayer::GetMessageIndex(const struct FName& PhraseName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.GetMessageIndex");

	AUnrealPlayer_GetMessageIndex_Params params;
	params.PhraseName = PhraseName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayer.ServerShowPathToBase
// (Defined, Net, NetReliable, Public)
// Parameters:
// int                            TeamNum                        (Parm)

void AUnrealPlayer::ServerShowPathToBase(int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerShowPathToBase");

	AUnrealPlayer_ServerShowPathToBase_Params params;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.BasePath
// (Defined, Exec, Public)
// Parameters:
// unsigned char                  Num                            (Parm)

void AUnrealPlayer::BasePath(unsigned char Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.BasePath");

	AUnrealPlayer_BasePath_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.SoakPause
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AUnrealPlayer::SoakPause(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.SoakPause");

	AUnrealPlayer_SoakPause_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.SoakBots
// (Defined, Exec, Public)

void AUnrealPlayer::SoakBots()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.SoakBots");

	AUnrealPlayer_SoakBots_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.DontReuseTaunt
// (Defined, Public)
// Parameters:
// int                            t                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayer::DontReuseTaunt(int t)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.DontReuseTaunt");

	AUnrealPlayer_DontReuseTaunt_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayer.AutoTaunt
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayer::AutoTaunt()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.AutoTaunt");

	AUnrealPlayer_AutoTaunt_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayer.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AUnrealPlayer::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.Possess");

	AUnrealPlayer_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ShowAI
// (Defined, Exec, Public)

void AUnrealPlayer::ShowAI()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ShowAI");

	AUnrealPlayer_ShowAI_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.LogMultiKills
// (Defined, Public)
// Parameters:
// float                          Reward                         (Parm)
// bool                           bEnemyKill                     (Parm)

void AUnrealPlayer::LogMultiKills(float Reward, bool bEnemyKill)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.LogMultiKills");

	AUnrealPlayer_LogMultiKills_Params params;
	params.Reward = Reward;
	params.bEnemyKill = bEnemyKill;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientDelayedAnnouncement
// (Defined, Net, NetReliable, Public)
// Parameters:
// class USound*                  AnnouncementSound              (Parm)
// unsigned char                  Delay                          (Parm)

void AUnrealPlayer::ClientDelayedAnnouncement(class USound* AnnouncementSound, unsigned char Delay)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientDelayedAnnouncement");

	AUnrealPlayer_ClientDelayedAnnouncement_Params params;
	params.AnnouncementSound = AnnouncementSound;
	params.Delay = Delay;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientDelayedAnnouncementNamed
// (Defined, Net, NetReliable, Public)
// Parameters:
// struct FName                   Announcement                   (Parm)
// unsigned char                  Delay                          (Parm)

void AUnrealPlayer::ClientDelayedAnnouncementNamed(const struct FName& Announcement, unsigned char Delay)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientDelayedAnnouncementNamed");

	AUnrealPlayer_ClientDelayedAnnouncementNamed_Params params;
	params.Announcement = Announcement;
	params.Delay = Delay;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.AwardAdrenaline
// (Defined, Public)
// Parameters:
// float                          Amount                         (Parm)

void AUnrealPlayer::AwardAdrenaline(float Amount)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.AwardAdrenaline");

	AUnrealPlayer_AwardAdrenaline_Params params;
	params.Amount = Amount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AUnrealPlayer::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.PostBeginPlay");

	AUnrealPlayer_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientSendStats
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// int                            newgoals                       (Parm)
// bool                           bNewFirstBlood                 (Parm)
// int                            newKills                       (Parm)
// int                            newsuicides                    (Parm)
// int                            newFlagTouches                 (Parm)
// int                            newFlagReturns                 (Parm)
// int                            newFlakCount                   (Parm)
// int                            newComboCount                  (Parm)
// int                            newHeadCount                   (Parm)
// int                            newRanOverCount                (Parm)
// int                            newDaredevilPoints             (Parm)

void AUnrealPlayer::ClientSendStats(class ATeamPlayerReplicationInfo* PRI, int newgoals, bool bNewFirstBlood, int newKills, int newsuicides, int newFlagTouches, int newFlagReturns, int newFlakCount, int newComboCount, int newHeadCount, int newRanOverCount, int newDaredevilPoints)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientSendStats");

	AUnrealPlayer_ClientSendStats_Params params;
	params.PRI = PRI;
	params.newgoals = newgoals;
	params.bNewFirstBlood = bNewFirstBlood;
	params.newKills = newKills;
	params.newsuicides = newsuicides;
	params.newFlagTouches = newFlagTouches;
	params.newFlagReturns = newFlagReturns;
	params.newFlakCount = newFlakCount;
	params.newComboCount = newComboCount;
	params.newHeadCount = newHeadCount;
	params.newRanOverCount = newRanOverCount;
	params.newDaredevilPoints = newDaredevilPoints;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientSendCombos
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// unsigned char                  Combos0                        (Parm)
// unsigned char                  Combos1                        (Parm)
// unsigned char                  Combos2                        (Parm)
// unsigned char                  Combos3                        (Parm)
// unsigned char                  Combos4                        (Parm)

void AUnrealPlayer::ClientSendCombos(class ATeamPlayerReplicationInfo* PRI, unsigned char Combos0, unsigned char Combos1, unsigned char Combos2, unsigned char Combos3, unsigned char Combos4)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientSendCombos");

	AUnrealPlayer_ClientSendCombos_Params params;
	params.PRI = PRI;
	params.Combos0 = Combos0;
	params.Combos1 = Combos1;
	params.Combos2 = Combos2;
	params.Combos3 = Combos3;
	params.Combos4 = Combos4;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientSendMultiKills
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// unsigned char                  MultiKills0                    (Parm)
// unsigned char                  MultiKills1                    (Parm)
// unsigned char                  MultiKills2                    (Parm)
// unsigned char                  MultiKills3                    (Parm)
// unsigned char                  MultiKills4                    (Parm)
// unsigned char                  MultiKills5                    (Parm)
// unsigned char                  MultiKills6                    (Parm)

void AUnrealPlayer::ClientSendMultiKills(class ATeamPlayerReplicationInfo* PRI, unsigned char MultiKills0, unsigned char MultiKills1, unsigned char MultiKills2, unsigned char MultiKills3, unsigned char MultiKills4, unsigned char MultiKills5, unsigned char MultiKills6)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientSendMultiKills");

	AUnrealPlayer_ClientSendMultiKills_Params params;
	params.PRI = PRI;
	params.MultiKills0 = MultiKills0;
	params.MultiKills1 = MultiKills1;
	params.MultiKills2 = MultiKills2;
	params.MultiKills3 = MultiKills3;
	params.MultiKills4 = MultiKills4;
	params.MultiKills5 = MultiKills5;
	params.MultiKills6 = MultiKills6;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientSendSprees
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// unsigned char                  Spree0                         (Parm)
// unsigned char                  Spree1                         (Parm)
// unsigned char                  Spree2                         (Parm)
// unsigned char                  Spree3                         (Parm)
// unsigned char                  Spree4                         (Parm)
// unsigned char                  Spree5                         (Parm)

void AUnrealPlayer::ClientSendSprees(class ATeamPlayerReplicationInfo* PRI, unsigned char Spree0, unsigned char Spree1, unsigned char Spree2, unsigned char Spree3, unsigned char Spree4, unsigned char Spree5)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientSendSprees");

	AUnrealPlayer_ClientSendSprees_Params params;
	params.PRI = PRI;
	params.Spree0 = Spree0;
	params.Spree1 = Spree1;
	params.Spree2 = Spree2;
	params.Spree3 = Spree3;
	params.Spree4 = Spree4;
	params.Spree5 = Spree5;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientSendVehicle
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// class UClass*                  V                              (Parm)
// int                            Kills                          (Parm)
// int                            Deaths                         (Parm)
// int                            DeathsDriving                  (Parm)
// int                            i                              (Parm)

void AUnrealPlayer::ClientSendVehicle(class ATeamPlayerReplicationInfo* PRI, class UClass* V, int Kills, int Deaths, int DeathsDriving, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientSendVehicle");

	AUnrealPlayer_ClientSendVehicle_Params params;
	params.PRI = PRI;
	params.V = V;
	params.Kills = Kills;
	params.Deaths = Deaths;
	params.DeathsDriving = DeathsDriving;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ClientSendWeapon
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// class UClass*                  W                              (Parm)
// int                            Kills                          (Parm)
// int                            Deaths                         (Parm)
// int                            deathsholding                  (Parm)
// int                            i                              (Parm)

void AUnrealPlayer::ClientSendWeapon(class ATeamPlayerReplicationInfo* PRI, class UClass* W, int Kills, int Deaths, int deathsholding, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ClientSendWeapon");

	AUnrealPlayer_ClientSendWeapon_Params params;
	params.PRI = PRI;
	params.W = W;
	params.Kills = Kills;
	params.Deaths = Deaths;
	params.deathsholding = deathsholding;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerGetNextVehicleStats
// (Defined, Net, NetReliable, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// int                            i                              (Parm)

void AUnrealPlayer::ServerGetNextVehicleStats(class ATeamPlayerReplicationInfo* PRI, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerGetNextVehicleStats");

	AUnrealPlayer_ServerGetNextVehicleStats_Params params;
	params.PRI = PRI;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerGetNextWeaponStats
// (Defined, Net, NetReliable, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// int                            i                              (Parm)

void AUnrealPlayer::ServerGetNextWeaponStats(class ATeamPlayerReplicationInfo* PRI, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerGetNextWeaponStats");

	AUnrealPlayer_ServerGetNextWeaponStats_Params params;
	params.PRI = PRI;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerUpdateStatArrays
// (Defined, Net, NetReliable, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)

void AUnrealPlayer::ServerUpdateStatArrays(class ATeamPlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerUpdateStatArrays");

	AUnrealPlayer_ServerUpdateStatArrays_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayer.ServerUpdateStats
// (Defined, Net, NetReliable, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)

void AUnrealPlayer::ServerUpdateStats(class ATeamPlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayer.ServerUpdateStats");

	AUnrealPlayer_ServerUpdateStats_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.PermitWeaponChangeInSpecialMode
// (Defined, Public)

void ADeathMatch::PermitWeaponChangeInSpecialMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PermitWeaponChangeInSpecialMode");

	ADeathMatch_PermitWeaponChangeInSpecialMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AnnounceSentryGun
// (Defined, Public)
// Parameters:
// class AController*             Caller                         (Parm)

void ADeathMatch::AnnounceSentryGun(class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AnnounceSentryGun");

	ADeathMatch_AnnounceSentryGun_Params params;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AnnounceUAV
// (Defined, Public)
// Parameters:
// class AController*             Caller                         (Parm)

void ADeathMatch::AnnounceUAV(class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AnnounceUAV");

	ADeathMatch_AnnounceUAV_Params params;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AnnounceHelicopter
// (Defined, Public)
// Parameters:
// class AController*             Caller                         (Parm)

void ADeathMatch::AnnounceHelicopter(class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AnnounceHelicopter");

	ADeathMatch_AnnounceHelicopter_Params params;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AnnounceArtillery
// (Defined, Public)
// Parameters:
// class AController*             Caller                         (Parm)

void ADeathMatch::AnnounceArtillery(class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AnnounceArtillery");

	ADeathMatch_AnnounceArtillery_Params params;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetAllLoadHints
// (Defined, Static, Public)
// Parameters:
// bool                           bThisClassOnly                 (OptionalParm, Parm)
// TArray<struct FString>         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<struct FString> ADeathMatch::STATIC_GetAllLoadHints(bool bThisClassOnly)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetAllLoadHints");

	ADeathMatch_GetAllLoadHints_Params params;
	params.bThisClassOnly = bThisClassOnly;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.GetNextLoadHint
// (Defined, Static, Public)
// Parameters:
// struct FString                 MapName                        (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ADeathMatch::STATIC_GetNextLoadHint(const struct FString& MapName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetNextLoadHint");

	ADeathMatch_GetNextLoadHint_Params params;
	params.MapName = MapName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.SetGrammar
// (Defined, Event, Public)

void ADeathMatch::SetGrammar()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.SetGrammar");

	ADeathMatch_SetGrammar_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.PrecacheGameAnnouncements
// (Defined, Static, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void ADeathMatch::STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PrecacheGameAnnouncements");

	ADeathMatch_PrecacheGameAnnouncements_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.WantsPickups
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::WantsPickups(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.WantsPickups");

	ADeathMatch_WantsPickups_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.EndSpree
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Other                          (Parm)

void ADeathMatch::EndSpree(class AController* Killer, class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.EndSpree");

	ADeathMatch_EndSpree_Params params;
	params.Killer = Killer;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.NotifySpree
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)
// int                            Num                            (Parm)

void ADeathMatch::NotifySpree(class AController* Other, int Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.NotifySpree");

	ADeathMatch_NotifySpree_Params params;
	params.Other = Other;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetDescriptionText
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropName                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ADeathMatch::STATIC_GetDescriptionText(const struct FString& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetDescriptionText");

	ADeathMatch_GetDescriptionText_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.GetDisplayText
// (Defined, Static, Public)
// Parameters:
// struct FString                 PropName                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ADeathMatch::STATIC_GetDisplayText(const struct FString& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetDisplayText");

	ADeathMatch_GetDisplayText_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.FillPlayInfo
// (Defined, Static, Public)
// Parameters:
// class UPlayInfo*               PlayInfo                       (Parm)

void ADeathMatch::STATIC_FillPlayInfo(class UPlayInfo* PlayInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.FillPlayInfo");

	ADeathMatch_FillPlayInfo_Params params;
	params.PlayInfo = PlayInfo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AcceptPlayInfoProperty
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropertyName                   (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::STATIC_AcceptPlayInfoProperty(const struct FString& PropertyName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AcceptPlayInfoProperty");

	ADeathMatch_AcceptPlayInfoProperty_Params params;
	params.PropertyName = PropertyName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.ReviewJumpSpots
// (Defined, Public)
// Parameters:
// struct FName                   TestLabel                      (Parm)

void ADeathMatch::ReviewJumpSpots(const struct FName& TestLabel)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ReviewJumpSpots");

	ADeathMatch_ReviewJumpSpots_Params params;
	params.TestLabel = TestLabel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.addaistrike
// (Defined, Exec, Public)
// Parameters:
// int                            Num                            (Parm)

void ADeathMatch::addaistrike(int Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.addaistrike");

	ADeathMatch_addaistrike_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.addaifire
// (Defined, Exec, Public)
// Parameters:
// struct FString                 Num                            (Parm, NeedCtorLink)
// struct FString                 Team                           (Parm, NeedCtorLink)

void ADeathMatch::addaifire(const struct FString& Num, const struct FString& Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.addaifire");

	ADeathMatch_addaifire_Params params;
	params.Num = Num;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.addai
// (Defined, Exec, Public)
// Parameters:
// struct FString                 Num                            (Parm, NeedCtorLink)
// struct FString                 Team                           (Parm, NeedCtorLink)

void ADeathMatch::addai(const struct FString& Num, const struct FString& Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.addai");

	ADeathMatch_addai_Params params;
	params.Num = Num;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.addaibot
// (Defined, Exec, Public)
// Parameters:
// struct FString                 Num                            (Parm, NeedCtorLink)
// struct FString                 Team                           (Parm, NeedCtorLink)
// struct FString                 Grade                          (Parm, NeedCtorLink)
// struct FString                 NPCID                          (Parm, NeedCtorLink)

void ADeathMatch::addaibot(const struct FString& Num, const struct FString& Team, const struct FString& Grade, const struct FString& NPCID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.addaibot");

	ADeathMatch_addaibot_Params params;
	params.Num = Num;
	params.Team = Team;
	params.Grade = Grade;
	params.NPCID = NPCID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AddwAIBot
// (Defined, Public)
// Parameters:
// struct FString                 strNum                         (Parm, NeedCtorLink)
// struct FString                 strTeam                        (Parm, NeedCtorLink)
// struct FString                 aiClass                        (Parm, NeedCtorLink)
// struct FString                 strGrade                       (OptionalParm, Parm, NeedCtorLink)
// struct FString                 strNPCID                       (OptionalParm, Parm, NeedCtorLink)
// struct FString                 strRegenLocationIndex          (OptionalParm, Parm, NeedCtorLink)
// class AController*             callerController               (OptionalParm, Parm)
// bool                           bUseDynamicRegenLocation       (OptionalParm, Parm)
// struct FVector                 v3DynamicRegenLocation         (OptionalParm, Parm)
// bool                           bUseFakeID                     (OptionalParm, Parm)

void ADeathMatch::AddwAIBot(const struct FString& strNum, const struct FString& strTeam, const struct FString& aiClass, const struct FString& strGrade, const struct FString& strNPCID, const struct FString& strRegenLocationIndex, class AController* callerController, bool bUseDynamicRegenLocation, const struct FVector& v3DynamicRegenLocation, bool bUseFakeID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AddwAIBot");

	ADeathMatch_AddwAIBot_Params params;
	params.strNum = strNum;
	params.strTeam = strTeam;
	params.aiClass = aiClass;
	params.strGrade = strGrade;
	params.strNPCID = strNPCID;
	params.strRegenLocationIndex = strRegenLocationIndex;
	params.callerController = callerController;
	params.bUseDynamicRegenLocation = bUseDynamicRegenLocation;
	params.v3DynamicRegenLocation = v3DynamicRegenLocation;
	params.bUseFakeID = bUseFakeID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.rfAckGetBotID
// (Defined, Public)
// Parameters:
// int                            Result                         (Parm)
// unsigned char                  RequestedAFCount               (Parm)
// unsigned char                  RequestedRSACount              (Parm)
// TArray<int>                    AFBotID                        (Parm, NeedCtorLink)
// TArray<int>                    RSABotID                       (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::rfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.rfAckGetBotID");

	ADeathMatch_rfAckGetBotID_Params params;
	params.Result = Result;
	params.RequestedAFCount = RequestedAFCount;
	params.RequestedRSACount = RequestedRSACount;
	params.AFBotID = AFBotID;
	params.RSABotID = RSABotID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.HandleGetBotID
// (Defined, Public)
// Parameters:
// int                            Team                           (Parm)
// TArray<int>                    BotID                          (Parm, NeedCtorLink)

void ADeathMatch::HandleGetBotID(int Team, TArray<int> BotID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.HandleGetBotID");

	ADeathMatch_HandleGetBotID_Params params;
	params.Team = Team;
	params.BotID = BotID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.EnqueueAddBot
// (Defined, Public)
// Parameters:
// class UClass*                  BotClass                       (Parm)
// class AController*             callerController               (Parm)
// int                            Team                           (Parm)
// int                            Grade                          (Parm)
// int                            NPCID                          (Parm)
// int                            iRegenLocationIndex            (Parm)
// bool                           bUseDynamicRegenLocation       (Parm)
// struct FVector                 v3DynamicRegenLocation         (Parm)

void ADeathMatch::EnqueueAddBot(class UClass* BotClass, class AController* callerController, int Team, int Grade, int NPCID, int iRegenLocationIndex, bool bUseDynamicRegenLocation, const struct FVector& v3DynamicRegenLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.EnqueueAddBot");

	ADeathMatch_EnqueueAddBot_Params params;
	params.BotClass = BotClass;
	params.callerController = callerController;
	params.Team = Team;
	params.Grade = Grade;
	params.NPCID = NPCID;
	params.iRegenLocationIndex = iRegenLocationIndex;
	params.bUseDynamicRegenLocation = bUseDynamicRegenLocation;
	params.v3DynamicRegenLocation = v3DynamicRegenLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.Killaibots
// (Defined, Exec, Public)
// Parameters:
// int                            Num                            (OptionalParm, Parm)

void ADeathMatch::Killaibots(int Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.Killaibots");

	ADeathMatch_Killaibots_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.Kill
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void ADeathMatch::Kill(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.Kill");

	ADeathMatch_Kill_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.KillBots
// (Defined, Exec, Public)
// Parameters:
// int                            Num                            (Parm)

void ADeathMatch::KillBots(int Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.KillBots");

	ADeathMatch_KillBots_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AddBots
// (Defined, Exec, Public)
// Parameters:
// int                            Num                            (Parm)

void ADeathMatch::AddBots(int Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AddBots");

	ADeathMatch_AddBots_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AddNamedBot
// (Defined, Exec, Public)
// Parameters:
// struct FString                 botname                        (Parm, NeedCtorLink)

void ADeathMatch::AddNamedBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AddNamedBot");

	ADeathMatch_AddNamedBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.dobalancebots
// (Defined, Exec, Public)

void ADeathMatch::dobalancebots()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.dobalancebots");

	ADeathMatch_dobalancebots_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.setFakeUID
// (Defined, Exec, Public)

void ADeathMatch::setFakeUID()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.setFakeUID");

	ADeathMatch_setFakeUID_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ReduceDamage
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

int ADeathMatch::ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ReduceDamage");

	ADeathMatch_ReduceDamage_Params params;
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


// Function UnrealGame.DeathMatch.AdjustSkill
// (Defined, Public)
// Parameters:
// class AAIController*           B                              (Parm)
// class APlayerController*       P                              (Parm)
// bool                           bWinner                        (Parm)

void ADeathMatch::AdjustSkill(class AAIController* B, class APlayerController* P, bool bWinner)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AdjustSkill");

	ADeathMatch_AdjustSkill_Params params;
	params.B = B;
	params.P = P;
	params.bWinner = bWinner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ScoreKill
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Other                          (Parm)

void ADeathMatch::ScoreKill(class AController* Killer, class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ScoreKill");

	ADeathMatch_ScoreKill_Params params;
	params.Killer = Killer;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ScoreObjective
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)
// float                          Score                          (Parm)

void ADeathMatch::ScoreObjective(class APlayerReplicationInfo* Scorer, float Score)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ScoreObjective");

	ADeathMatch_ScoreObjective_Params params;
	params.Scorer = Scorer;
	params.Score = Score;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.CheckScore
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)

void ADeathMatch::CheckScore(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CheckScore");

	ADeathMatch_CheckScore_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.CheckMaxLives
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::CheckMaxLives(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CheckMaxLives");

	ADeathMatch_CheckMaxLives_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.RatePlayerStart
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        N                              (Parm)
// unsigned char                  Team                           (Parm)
// class AController*             Player                         (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ADeathMatch::RatePlayerStart(class ANavigationPoint* N, unsigned char Team, class AController* Player)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.RatePlayerStart");

	ADeathMatch_RatePlayerStart_Params params;
	params.N = N;
	params.Team = Team;
	params.Player = Player;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.CheckLives
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::CheckLives(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CheckLives");

	ADeathMatch_CheckLives_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.ChangeHostExtraWork
// (Public)

void ADeathMatch::ChangeHostExtraWork()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ChangeHostExtraWork");

	ADeathMatch_ChangeHostExtraWork_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetUserBackToVehicle
// (Defined, Public)

void ADeathMatch::GetUserBackToVehicle()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetUserBackToVehicle");

	ADeathMatch_GetUserBackToVehicle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ContinueMatch
// (Defined, Public)

void ADeathMatch::ContinueMatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ContinueMatch");

	ADeathMatch_ContinueMatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.RecoverHelicopter
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void ADeathMatch::RecoverHelicopter(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.RecoverHelicopter");

	ADeathMatch_RecoverHelicopter_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.OnKillingDropOut
// (Public)
// Parameters:
// class APawn*                   P                              (Parm)

void ADeathMatch::OnKillingDropOut(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.OnKillingDropOut");

	ADeathMatch_OnKillingDropOut_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.CalcItemUsedTimeAll
// (Defined, Public)

void ADeathMatch::CalcItemUsedTimeAll()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CalcItemUsedTimeAll");

	ADeathMatch_CalcItemUsedTimeAll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ForcedStartMatch
// (Defined, Event, Public)

void ADeathMatch::ForcedStartMatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ForcedStartMatch");

	ADeathMatch_ForcedStartMatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.UpdateVehicles
// (Defined, Public)

void ADeathMatch::UpdateVehicles()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.UpdateVehicles");

	ADeathMatch_UpdateVehicles_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ProcessDefaultInv
// (Defined, Public)

void ADeathMatch::ProcessDefaultInv()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ProcessDefaultInv");

	ADeathMatch_ProcessDefaultInv_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GameAddDefaultInventory
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void ADeathMatch::GameAddDefaultInventory(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GameAddDefaultInventory");

	ADeathMatch_GameAddDefaultInventory_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AnnounceTimesUp
// (Defined, Public)

void ADeathMatch::AnnounceTimesUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AnnounceTimesUp");

	ADeathMatch_AnnounceTimesUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetNetWait
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ADeathMatch::GetNetWait()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetNetWait");

	ADeathMatch_GetNetWait_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.PlayStartupMessage
// (Defined, Public)

void ADeathMatch::PlayStartupMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PlayStartupMessage");

	ADeathMatch_PlayStartupMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.PlayEndOfMatchMessage
// (Defined, Public)

void ADeathMatch::PlayEndOfMatchMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PlayEndOfMatchMessage");

	ADeathMatch_PlayEndOfMatchMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.FindPlayerStart_TU
// (Defined, Public)
// Parameters:
// class AController*             Player                         (Parm)
// unsigned char                  inTeam                         (OptionalParm, Parm)
// struct FString                 incomingName                   (OptionalParm, Parm, NeedCtorLink)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* ADeathMatch::FindPlayerStart_TU(class AController* Player, unsigned char inTeam, const struct FString& incomingName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.FindPlayerStart_TU");

	ADeathMatch_FindPlayerStart_TU_Params params;
	params.Player = Player;
	params.inTeam = inTeam;
	params.incomingName = incomingName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.FindPlayerStart
// (Defined, Public)
// Parameters:
// class AController*             Player                         (Parm)
// unsigned char                  inTeam                         (OptionalParm, Parm)
// struct FString                 incomingName                   (OptionalParm, Parm, NeedCtorLink)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* ADeathMatch::FindPlayerStart(class AController* Player, unsigned char inTeam, const struct FString& incomingName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.FindPlayerStart");

	ADeathMatch_FindPlayerStart_Params params;
	params.Player = Player;
	params.inTeam = inTeam;
	params.incomingName = incomingName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.SetGameEndType
// (Defined, Public)
// Parameters:
// struct FString                 Reason                         (Parm, NeedCtorLink)

void ADeathMatch::SetGameEndType(const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.SetGameEndType");

	ADeathMatch_SetGameEndType_Params params;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.EndGame
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Winner                         (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)

void ADeathMatch::EndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.EndGame");

	ADeathMatch_EndGame_Params params;
	params.Winner = Winner;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AnnounceMatchInfo
// (Defined, Public)

void ADeathMatch::AnnounceMatchInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AnnounceMatchInfo");

	ADeathMatch_AnnounceMatchInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.BalanceBots
// (Defined, Public)

void ADeathMatch::BalanceBots()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.BalanceBots");

	ADeathMatch_BalanceBots_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.StartMatch
// (Defined, Public)

void ADeathMatch::StartMatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.StartMatch");

	ADeathMatch_StartMatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.FindTeamFor
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ADeathMatch::FindTeamFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.FindTeamFor");

	ADeathMatch_FindTeamFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.InitPlacedBot
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class URosterEntry*            R                              (Parm)

void ADeathMatch::InitPlacedBot(class AController* C, class URosterEntry* R)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.InitPlacedBot");

	ADeathMatch_InitPlacedBot_Params params;
	params.C = C;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.InitializeBot
// (Defined, Public)
// Parameters:
// class ABot*                    NewBot                         (Parm)
// class AUnrealTeamInfo*         BotTeam                        (Parm)
// class URosterEntry*            Chosen                         (Parm)

void ADeathMatch::InitializeBot(class ABot* NewBot, class AUnrealTeamInfo* BotTeam, class URosterEntry* Chosen)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.InitializeBot");

	ADeathMatch_InitializeBot_Params params;
	params.NewBot = NewBot;
	params.BotTeam = BotTeam;
	params.Chosen = Chosen;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.SpawnBot
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (OptionalParm, Parm, NeedCtorLink)
// class ABot*                    ReturnValue                    (Parm, OutParm, ReturnParm)

class ABot* ADeathMatch::SpawnBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.SpawnBot");

	ADeathMatch_SpawnBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.PreLoadBot
// (Defined, Public)

void ADeathMatch::PreLoadBot()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PreLoadBot");

	ADeathMatch_PreLoadBot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.PreLoadNamedBot
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (Parm, NeedCtorLink)

void ADeathMatch::PreLoadNamedBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PreLoadNamedBot");

	ADeathMatch_PreLoadNamedBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetBotTeam2
// (Defined, Public)
// Parameters:
// bool                           forceTeam                      (Parm)
// int                            Team                           (Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ADeathMatch::GetBotTeam2(bool forceTeam, int Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetBotTeam2");

	ADeathMatch_GetBotTeam2_Params params;
	params.forceTeam = forceTeam;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.GetBotTeam
// (Defined, Public)
// Parameters:
// int                            TeamBots                       (OptionalParm, Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ADeathMatch::GetBotTeam(int TeamBots)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetBotTeam");

	ADeathMatch_GetBotTeam_Params params;
	params.TeamBots = TeamBots;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.InitTeamSymbols
// (Defined, Public)

void ADeathMatch::InitTeamSymbols()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.InitTeamSymbols");

	ADeathMatch_InitTeamSymbols_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.InitGameReplicationInfo
// (Defined, Public)

void ADeathMatch::InitGameReplicationInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.InitGameReplicationInfo");

	ADeathMatch_InitGameReplicationInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetServerDetails
// (Defined, Public)
// Parameters:
// struct FServerResponseLine     ServerState                    (Parm, OutParm, NeedCtorLink)

void ADeathMatch::GetServerDetails(struct FServerResponseLine* ServerState)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetServerDetails");

	ADeathMatch_GetServerDetails_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ServerState != nullptr)
		*ServerState = params.ServerState;
}


// Function UnrealGame.DeathMatch.NeedPlayers
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::NeedPlayers()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.NeedPlayers");

	ADeathMatch_NeedPlayers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.Logout
// (Defined, Public)
// Parameters:
// class AController*             Exiting                        (Parm)

void ADeathMatch::Logout(class AController* Exiting)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.Logout");

	ADeathMatch_Logout_Params params;
	params.Exiting = Exiting;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AllowBecomeActivePlayer
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::AllowBecomeActivePlayer(class APlayerController* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AllowBecomeActivePlayer");

	ADeathMatch_AllowBecomeActivePlayer_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.BecomeSpectator
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::BecomeSpectator(class APlayerController* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.BecomeSpectator");

	ADeathMatch_BecomeSpectator_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.ChangeName
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)
// struct FString                 S                              (Parm, NeedCtorLink)
// bool                           bNameChange                    (Parm)

void ADeathMatch::ChangeName(class AController* Other, const struct FString& S, bool bNameChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ChangeName");

	ADeathMatch_ChangeName_Params params;
	params.Other = Other;
	params.S = S;
	params.bNameChange = bNameChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ShouldRespawn
// (Defined, Public)
// Parameters:
// class APickup*                 Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::ShouldRespawn(class APickup* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ShouldRespawn");

	ADeathMatch_ShouldRespawn_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.CanSpectate
// (Defined, Public)
// Parameters:
// class APlayerController*       Viewer                         (Parm)
// bool                           bOnlySpectator                 (Parm)
// class AActor*                  ViewTarget                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CanSpectate");

	ADeathMatch_CanSpectate_Params params;
	params.Viewer = Viewer;
	params.bOnlySpectator = bOnlySpectator;
	params.ViewTarget = ViewTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.AddDefaultInventory
// (Defined, Public)
// Parameters:
// class APawn*                   PlayerPawn                     (Parm)

void ADeathMatch::AddDefaultInventory(class APawn* PlayerPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AddDefaultInventory");

	ADeathMatch_AddDefaultInventory_Params params;
	params.PlayerPawn = PlayerPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AddBot
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (OptionalParm, Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::AddBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AddBot");

	ADeathMatch_AddBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.ForceAddBot
// (Defined, Public)

void ADeathMatch::ForceAddBot()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ForceAddBot");

	ADeathMatch_ForceAddBot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.TooManyBots
// (Defined, Public)
// Parameters:
// class AController*             botToRemove                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::TooManyBots(class AController* botToRemove)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.TooManyBots");

	ADeathMatch_TooManyBots_Params params;
	params.botToRemove = botToRemove;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.RestartPlayer
// (Defined, Public)
// Parameters:
// class AController*             aPlayer                        (Parm)

void ADeathMatch::RestartPlayer(class AController* aPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.RestartPlayer");

	ADeathMatch_RestartPlayer_Params params;
	params.aPlayer = aPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.ChangeLoadOut
// (Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// struct FString                 LoadoutName                    (Parm, NeedCtorLink)

void ADeathMatch::ChangeLoadOut(class APlayerController* P, const struct FString& LoadoutName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.ChangeLoadOut");

	ADeathMatch_ChangeLoadOut_Params params;
	params.P = P;
	params.LoadoutName = LoadoutName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.PostLogin
// (Defined, Event, Public)
// Parameters:
// class APlayerController*       NewPlayer                      (Parm)

void ADeathMatch::PostLogin(class APlayerController* NewPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PostLogin");

	ADeathMatch_PostLogin_Params params;
	params.NewPlayer = NewPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.Login
// (Defined, Event, Public)
// Parameters:
// struct FString                 Portal                         (Parm, NeedCtorLink)
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)
// class APlayerController*       ReturnValue                    (Parm, OutParm, ReturnParm)

class APlayerController* ADeathMatch::Login(const struct FString& Portal, const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.Login");

	ADeathMatch_Login_Params params;
	params.Portal = Portal;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.AtCapacity
// (Defined, Public)
// Parameters:
// bool                           bSpectator                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::AtCapacity(bool bSpectator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AtCapacity");

	ADeathMatch_AtCapacity_Params params;
	params.bSpectator = bSpectator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.PlayWinMessage
// (Defined, Public)
// Parameters:
// class APlayerController*       Player                         (Parm)
// bool                           bWinner                        (Parm)

void ADeathMatch::PlayWinMessage(class APlayerController* Player, bool bWinner)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PlayWinMessage");

	ADeathMatch_PlayWinMessage_Params params;
	params.Player = Player;
	params.bWinner = bWinner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.CheckEndGame
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Winner                         (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::CheckEndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CheckEndGame");

	ADeathMatch_CheckEndGame_Params params;
	params.Winner = Winner;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.CheckEndGameCondition
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::CheckEndGameCondition()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CheckEndGameCondition");

	ADeathMatch_CheckEndGameCondition_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.AcceptInventory
// (Defined, Public)
// Parameters:
// class APawn*                   PlayerPawn                     (Parm)

void ADeathMatch::AcceptInventory(class APawn* PlayerPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AcceptInventory");

	ADeathMatch_AcceptInventory_Params params;
	params.PlayerPawn = PlayerPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetMinPlayers
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ADeathMatch::GetMinPlayers()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetMinPlayers");

	ADeathMatch_GetMinPlayers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.TweakSkill
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ADeathMatch::TweakSkill(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.TweakSkill");

	ADeathMatch_TweakSkill_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.InitGame
// (Defined, Event, Public)
// Parameters:
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)

void ADeathMatch::InitGame(const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.InitGame");

	ADeathMatch_InitGame_Params params;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
}


// Function UnrealGame.DeathMatch.AddGameSpecificInventory
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void ADeathMatch::AddGameSpecificInventory(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AddGameSpecificInventory");

	ADeathMatch_AddGameSpecificInventory_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.AllowTransloc
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::AllowTransloc()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.AllowTransloc");

	ADeathMatch_AllowTransloc_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.NeverAllowTransloc
// (Defined, Static, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::STATIC_NeverAllowTransloc()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.NeverAllowTransloc");

	ADeathMatch_NeverAllowTransloc_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.InitLogging
// (Defined, Public)

void ADeathMatch::InitLogging()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.InitLogging");

	ADeathMatch_InitLogging_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.VehicleScoreKill
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class AVehicle*                DestroyedVehicle               (Parm)
// struct FString                 KillInfo                       (Parm, OutParm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ADeathMatch::VehicleScoreKill(class AController* Killer, class AController* Killed, class AVehicle* DestroyedVehicle, struct FString* KillInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.VehicleScoreKill");

	ADeathMatch_VehicleScoreKill_Params params;
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


// Function UnrealGame.DeathMatch.Killed
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void ADeathMatch::Killed(class AController* Killer, class AController* Killed, class APawn* KilledPawn, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.Killed");

	ADeathMatch_Killed_Params params;
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


// Function UnrealGame.DeathMatch.CheckReady
// (Defined, Public)

void ADeathMatch::CheckReady()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.CheckReady");

	ADeathMatch_CheckReady_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.JustStarted
// (Defined, Public)
// Parameters:
// float                          t                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADeathMatch::JustStarted(float t)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.JustStarted");

	ADeathMatch_JustStarted_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.Reset
// (Defined, Public)

void ADeathMatch::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.Reset");

	ADeathMatch_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.OverrideInitialBots
// (Defined, Public)

void ADeathMatch::OverrideInitialBots()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.OverrideInitialBots");

	ADeathMatch_OverrideInitialBots_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.PostBeginPlay
// (Defined, Public)

void ADeathMatch::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PostBeginPlay");

	ADeathMatch_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.PreBeginPlay
// (Defined, Public)

void ADeathMatch::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.PreBeginPlay");

	ADeathMatch_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DeathMatch.GetTimeSecondsLeft
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ADeathMatch::GetTimeSecondsLeft()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.GetTimeSecondsLeft");

	ADeathMatch_GetTimeSecondsLeft_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DeathMatch.SendBgmMessageBeginMatch
// (Defined, Public)

void ADeathMatch::SendBgmMessageBeginMatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DeathMatch.SendBgmMessageBeginMatch");

	ADeathMatch_SendBgmMessageBeginMatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.JumpSpot.TryTranslocator
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AJumpSpot::TryTranslocator(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.JumpSpot.TryTranslocator");

	AJumpSpot_TryTranslocator_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.JumpSpot.SuggestMovePreparation
// (Defined, Event, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AJumpSpot::SuggestMovePreparation(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.JumpSpot.SuggestMovePreparation");

	AJumpSpot_SuggestMovePreparation_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.JumpSpot.SpecialCost
// (Defined, Event, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// class UReachSpec*              Path                           (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AJumpSpot::SpecialCost(class APawn* Other, class UReachSpec* Path)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.JumpSpot.SpecialCost");

	AJumpSpot_SpecialCost_Params params;
	params.Other = Other;
	params.Path = Path;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.JumpSpot.EffectiveDoubleJump
// (Defined, Public)
// Parameters:
// class UReachSpec*              Path                           (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AJumpSpot::EffectiveDoubleJump(class UReachSpec* Path)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.JumpSpot.EffectiveDoubleJump");

	AJumpSpot_EffectiveDoubleJump_Params params;
	params.Path = Path;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.JumpSpot.CanDoubleJump
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AJumpSpot::CanDoubleJump(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.JumpSpot.CanDoubleJump");

	AJumpSpot_CanDoubleJump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.JumpSpot.CanMakeJump
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// float                          JumpHeight                     (Parm)
// float                          GroundSpeed                    (Parm)
// int                            Num                            (Parm)
// class AActor*                  Start                          (Parm)
// bool                           bForceCheck                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AJumpSpot::CanMakeJump(class APawn* Other, float JumpHeight, float GroundSpeed, int Num, class AActor* Start, bool bForceCheck)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.JumpSpot.CanMakeJump");

	AJumpSpot_CanMakeJump_Params params;
	params.Other = Other;
	params.JumpHeight = JumpHeight;
	params.GroundSpeed = GroundSpeed;
	params.Num = Num;
	params.Start = Start;
	params.bForceCheck = bForceCheck;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.JumpSpot.PostBeginPlay
// (Defined, Public)

void AJumpSpot::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.JumpSpot.PostBeginPlay");

	AJumpSpot_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealScriptedSequence.HigherPriorityThan
// (Defined, Public)
// Parameters:
// class AUnrealScriptedSequence* S                              (Parm)
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealScriptedSequence::HigherPriorityThan(class AUnrealScriptedSequence* S, class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealScriptedSequence.HigherPriorityThan");

	AUnrealScriptedSequence_HigherPriorityThan_Params params;
	params.S = S;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealScriptedSequence.BeginPlay
// (Defined, Public)

void AUnrealScriptedSequence::BeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealScriptedSequence.BeginPlay");

	AUnrealScriptedSequence_BeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealScriptedSequence.CheckForErrors
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealScriptedSequence::CheckForErrors()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealScriptedSequence.CheckForErrors");

	AUnrealScriptedSequence_CheckForErrors_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealScriptedSequence.FreeScript
// (Defined, Public)

void AUnrealScriptedSequence::FreeScript()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealScriptedSequence.FreeScript");

	AUnrealScriptedSequence_FreeScript_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealScriptedSequence.Reset
// (Defined, Public)

void AUnrealScriptedSequence::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealScriptedSequence.Reset");

	AUnrealScriptedSequence_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldSpot.FreeScript
// (Defined, Public)

void AHoldSpot::FreeScript()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldSpot.FreeScript");

	AHoldSpot_FreeScript_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldSpot.GetMoveTarget
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AHoldSpot::GetMoveTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldSpot.GetMoveTarget");

	AHoldSpot_GetMoveTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.EndGameTauntFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ATeamGame::EndGameTauntFor(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.EndGameTauntFor");

	ATeamGame_EndGameTauntFor_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.EndGameCommentFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ATeamGame::EndGameCommentFor(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.EndGameCommentFor");

	ATeamGame_EndGameCommentFor_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.PickEndGameTauntFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::PickEndGameTauntFor(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.PickEndGameTauntFor");

	ATeamGame_PickEndGameTauntFor_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.WeakObjectives
// (Defined, Public)

void ATeamGame::WeakObjectives()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.WeakObjectives");

	ATeamGame_WeakObjectives_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.GetAllLoadHints
// (Defined, Static, Public)
// Parameters:
// bool                           bThisClassOnly                 (OptionalParm, Parm)
// TArray<struct FString>         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<struct FString> ATeamGame::STATIC_GetAllLoadHints(bool bThisClassOnly)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetAllLoadHints");

	ATeamGame_GetAllLoadHints_Params params;
	params.bThisClassOnly = bThisClassOnly;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.PostLogin
// (Defined, Event, Public)
// Parameters:
// class APlayerController*       NewPlayer                      (Parm)

void ATeamGame::PostLogin(class APlayerController* NewPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.PostLogin");

	ATeamGame_PostLogin_Params params;
	params.NewPlayer = NewPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.InitVoiceReplicationInfo
// (Defined, Public)

void ATeamGame::InitVoiceReplicationInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.InitVoiceReplicationInfo");

	ATeamGame_InitVoiceReplicationInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.AnnounceScore
// (Defined, Public)
// Parameters:
// int                            ScoringTeam                    (Parm)

void ATeamGame::AnnounceScore(int ScoringTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.AnnounceScore");

	ATeamGame_AnnounceScore_Params params;
	params.ScoringTeam = ScoringTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.AcceptPlayInfoProperty
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropertyName                   (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::STATIC_AcceptPlayInfoProperty(const struct FString& PropertyName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.AcceptPlayInfoProperty");

	ATeamGame_AcceptPlayInfoProperty_Params params;
	params.PropertyName = PropertyName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetDescriptionText
// (Defined, Event, Static, Public)
// Parameters:
// struct FString                 PropName                       (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ATeamGame::STATIC_GetDescriptionText(const struct FString& PropName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetDescriptionText");

	ATeamGame_GetDescriptionText_Params params;
	params.PropName = PropName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.FillPlayInfo
// (Defined, Static, Public)
// Parameters:
// class UPlayInfo*               PlayInfo                       (Parm)

void ATeamGame::STATIC_FillPlayInfo(class UPlayInfo* PlayInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.FillPlayInfo");

	ATeamGame_FillPlayInfo_Params params;
	params.PlayInfo = PlayInfo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.FindNewObjectives
// (Defined, Public)
// Parameters:
// class AGameObjective*          DisabledObjective              (Parm)

void ATeamGame::FindNewObjectives(class AGameObjective* DisabledObjective)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.FindNewObjectives");

	ATeamGame_FindNewObjectives_Params params;
	params.DisabledObjective = DisabledObjective;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.ParseMessageString
// (Defined, Static, Public)
// Parameters:
// class AMutator*                BaseMutator                    (Parm)
// class AController*             Who                            (Parm)
// struct FString                 Message                        (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ATeamGame::STATIC_ParseMessageString(class AMutator* BaseMutator, class AController* Who, const struct FString& Message)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ParseMessageString");

	ATeamGame_ParseMessageString_Params params;
	params.BaseMutator = BaseMutator;
	params.Who = Who;
	params.Message = Message;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.FindTeamDesignation
// (Defined, Static, Public)
// Parameters:
// class AGameReplicationInfo*    GRI                            (Parm)
// class AActor*                  A                              (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ATeamGame::STATIC_FindTeamDesignation(class AGameReplicationInfo* GRI, class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.FindTeamDesignation");

	ATeamGame_FindTeamDesignation_Params params;
	params.GRI = GRI;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.ParseChatPercVar
// (Defined, Static, Public)
// Parameters:
// class AMutator*                BaseMutator                    (Parm)
// class AController*             Who                            (Parm)
// struct FString                 Cmd                            (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ATeamGame::STATIC_ParseChatPercVar(class AMutator* BaseMutator, class AController* Who, const struct FString& Cmd)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ParseChatPercVar");

	ATeamGame_ParseChatPercVar_Params params;
	params.BaseMutator = BaseMutator;
	params.Who = Who;
	params.Cmd = Cmd;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.PlayEndOfMatchMessage
// (Defined, Public)

void ATeamGame::PlayEndOfMatchMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.PlayEndOfMatchMessage");

	ATeamGame_PlayEndOfMatchMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.TooManyBots
// (Defined, Public)
// Parameters:
// class AController*             botToRemove                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::TooManyBots(class AController* botToRemove)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.TooManyBots");

	ATeamGame_TooManyBots_Params params;
	params.botToRemove = botToRemove;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.SameTeam
// (Defined, Public)
// Parameters:
// class AController*             A                              (Parm)
// class AController*             B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::SameTeam(class AController* A, class AController* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.SameTeam");

	ATeamGame_SameTeam_Params params;
	params.A = A;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.ReduceDamage
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

int ATeamGame::ReduceDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, int iWeaponType, struct FVector* Momentum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ReduceDamage");

	ATeamGame_ReduceDamage_Params params;
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


// Function UnrealGame.TeamGame.SetTeamAssistPoint
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Other                          (Parm)

void ATeamGame::SetTeamAssistPoint(class AController* Killer, class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.SetTeamAssistPoint");

	ATeamGame_SetTeamAssistPoint_Params params;
	params.Killer = Killer;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.ScoreKill
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Other                          (Parm)

void ATeamGame::ScoreKill(class AController* Killer, class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ScoreKill");

	ATeamGame_ScoreKill_Params params;
	params.Killer = Killer;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.NearGoal
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::NearGoal(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.NearGoal");

	ATeamGame_NearGoal_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.FindVictimsTarget
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)
// class APawn*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class APawn* ATeamGame::FindVictimsTarget(class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.FindVictimsTarget");

	ATeamGame_FindVictimsTarget_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.CriticalPlayer
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::CriticalPlayer(class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.CriticalPlayer");

	ATeamGame_CriticalPlayer_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.AnnounceAlmostWinningTeam
// (Defined, Public)

void ATeamGame::AnnounceAlmostWinningTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.AnnounceAlmostWinningTeam");

	ATeamGame_AnnounceAlmostWinningTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.AnnounceEndingWinningTeam
// (Defined, Public)

void ATeamGame::AnnounceEndingWinningTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.AnnounceEndingWinningTeam");

	ATeamGame_AnnounceEndingWinningTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.AnnounceWinningTeam
// (Defined, Public)

void ATeamGame::AnnounceWinningTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.AnnounceWinningTeam");

	ATeamGame_AnnounceWinningTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.CheckScore
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)

void ATeamGame::CheckScore(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.CheckScore");

	ATeamGame_CheckScore_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.RatePlayerStart
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        N                              (Parm)
// unsigned char                  Team                           (Parm)
// class AController*             Player                         (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ATeamGame::RatePlayerStart(class ANavigationPoint* N, unsigned char Team, class AController* Player)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.RatePlayerStart");

	ATeamGame_RatePlayerStart_Params params;
	params.N = N;
	params.Team = Team;
	params.Player = Player;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.ChangeTeam
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)
// int                            iTeamID                        (Parm)
// bool                           bNewTeam                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::ChangeTeam(class AController* Other, int iTeamID, bool bNewTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ChangeTeam");

	ATeamGame_ChangeTeam_Params params;
	params.Other = Other;
	params.iTeamID = iTeamID;
	params.bNewTeam = bNewTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetTeamID_by_Balancing
// (Defined, Public)
// Parameters:
// int                            iTeamID                        (Parm)
// class AController*             C                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamGame::GetTeamID_by_Balancing(int iTeamID, class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetTeamID_by_Balancing");

	ATeamGame_GetTeamID_by_Balancing_Params params;
	params.iTeamID = iTeamID;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.FindTeamFor
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ATeamGame::FindTeamFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.FindTeamFor");

	ATeamGame_FindTeamFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetBotTeam2
// (Defined, Public)
// Parameters:
// bool                           forceTeam                      (Parm)
// int                            Team                           (Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ATeamGame::GetBotTeam2(bool forceTeam, int Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetBotTeam2");

	ATeamGame_GetBotTeam2_Params params;
	params.forceTeam = forceTeam;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetBotTeam
// (Defined, Public)
// Parameters:
// int                            TeamBots                       (OptionalParm, Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ATeamGame::GetBotTeam(int TeamBots)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetBotTeam");

	ATeamGame_GetBotTeam_Params params;
	params.TeamBots = TeamBots;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetServerDetails
// (Defined, Public)
// Parameters:
// struct FServerResponseLine     ServerState                    (Parm, OutParm, NeedCtorLink)

void ATeamGame::GetServerDetails(struct FServerResponseLine* ServerState)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetServerDetails");

	ATeamGame_GetServerDetails_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ServerState != nullptr)
		*ServerState = params.ServerState;
}


// Function UnrealGame.TeamGame.CanSpectate
// (Defined, Public)
// Parameters:
// class APlayerController*       Viewer                         (Parm)
// bool                           bOnlySpectator                 (Parm)
// class AActor*                  ViewTarget                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::CanSpectate(class APlayerController* Viewer, bool bOnlySpectator, class AActor* ViewTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.CanSpectate");

	ATeamGame_CanSpectate_Params params;
	params.Viewer = Viewer;
	params.bOnlySpectator = bOnlySpectator;
	params.ViewTarget = ViewTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.SetEndGameFocus
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Winner                         (Parm)

void ATeamGame::SetEndGameFocus(class APlayerReplicationInfo* Winner)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.SetEndGameFocus");

	ATeamGame_SetEndGameFocus_Params params;
	params.Winner = Winner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.CheckEndGame
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Winner                         (Parm)
// struct FString                 Reason                         (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::CheckEndGame(class APlayerReplicationInfo* Winner, const struct FString& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.CheckEndGame");

	ATeamGame_CheckEndGame_Params params;
	params.Winner = Winner;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.IncrementGoalsScored
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)

void ATeamGame::IncrementGoalsScored(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.IncrementGoalsScored");

	ATeamGame_IncrementGoalsScored_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void ATeamGame::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.NotifyKilled");

	ATeamGame_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.RestartPlayer
// (Defined, Public)
// Parameters:
// class AController*             aPlayer                        (Parm)

void ATeamGame::RestartPlayer(class AController* aPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.RestartPlayer");

	ATeamGame_RestartPlayer_Params params;
	params.aPlayer = aPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.ShowPathTo
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            TeamNum                        (Parm)

void ATeamGame::ShowPathTo(class APlayerController* P, int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ShowPathTo");

	ATeamGame_ShowPathTo_Params params;
	params.P = P;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.CanShowPathTo
// (Defined, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            TeamNum                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::CanShowPathTo(class APlayerController* P, int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.CanShowPathTo");

	ATeamGame_CanShowPathTo_Params params;
	params.P = P;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetMinPlayers
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamGame::GetMinPlayers()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetMinPlayers");

	ATeamGame_GetMinPlayers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.InitTeamSymbols
// (Defined, Public)

void ATeamGame::InitTeamSymbols()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.InitTeamSymbols");

	ATeamGame_InitTeamSymbols_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.InitGame
// (Defined, Event, Public)
// Parameters:
// struct FString                 Options                        (Parm, NeedCtorLink)
// struct FString                 Error                          (Parm, OutParm, NeedCtorLink)

void ATeamGame::InitGame(const struct FString& Options, struct FString* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.InitGame");

	ATeamGame_InitGame_Params params;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
}


// Function UnrealGame.TeamGame.GetRedTeam
// (Defined, Public)
// Parameters:
// int                            TeamBots                       (Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ATeamGame::GetRedTeam(int TeamBots)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetRedTeam");

	ATeamGame_GetRedTeam_Params params;
	params.TeamBots = TeamBots;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetBlueTeam
// (Defined, Public)
// Parameters:
// int                            TeamBots                       (Parm)
// class AUnrealTeamInfo*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AUnrealTeamInfo* ATeamGame::GetBlueTeam(int TeamBots)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetBlueTeam");

	ATeamGame_GetBlueTeam_Params params;
	params.TeamBots = TeamBots;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.PreLoadBot
// (Defined, Public)

void ATeamGame::PreLoadBot()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.PreLoadBot");

	ATeamGame_PreLoadBot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.PreLoadNamedBot
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (Parm, NeedCtorLink)

void ATeamGame::PreLoadNamedBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.PreLoadNamedBot");

	ATeamGame_PreLoadNamedBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.OverrideInitialBots
// (Defined, Public)

void ATeamGame::OverrideInitialBots()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.OverrideInitialBots");

	ATeamGame_OverrideInitialBots_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.OtherTeam
// (Defined, Public)
// Parameters:
// class ATeamInfo*               Requester                      (Parm)
// class ATeamInfo*               ReturnValue                    (Parm, OutParm, ReturnParm)

class ATeamInfo* ATeamGame::OtherTeam(class ATeamInfo* Requester)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.OtherTeam");

	ATeamGame_OtherTeam_Params params;
	params.Requester = Requester;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.CheckMaxLives
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Scorer                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::CheckMaxLives(class APlayerReplicationInfo* Scorer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.CheckMaxLives");

	ATeamGame_CheckMaxLives_Params params;
	params.Scorer = Scorer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.UpdateAnnouncements
// (Defined, Simulated, Public)

void ATeamGame::UpdateAnnouncements()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.UpdateAnnouncements");

	ATeamGame_UpdateAnnouncements_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.PrecacheGameAnnouncements
// (Defined, Static, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void ATeamGame::STATIC_PrecacheGameAnnouncements(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.PrecacheGameAnnouncements");

	ATeamGame_PrecacheGameAnnouncements_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.BallCarrierMessage
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamGame::BallCarrierMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.BallCarrierMessage");

	ATeamGame_BallCarrierMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetStatus
// (Defined, Public)
// Parameters:
// class APlayerController*       Sender                         (Parm)
// class ABot*                    B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamGame::GetStatus(class APlayerController* Sender, class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetStatus");

	ATeamGame_GetStatus_Params params;
	params.Sender = Sender;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.ParseVoiceCommand
// (Defined, Public)
// Parameters:
// class APlayerController*       Sender                         (Parm)
// struct FString                 RecognizedString               (Parm, NeedCtorLink)

void ATeamGame::ParseVoiceCommand(class APlayerController* Sender, const struct FString& RecognizedString)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ParseVoiceCommand");

	ATeamGame_ParseVoiceCommand_Params params;
	params.Sender = Sender;
	params.RecognizedString = RecognizedString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.ParseRecipients
// (Defined, Public)
// Parameters:
// int                            RecipientIDs                   (Parm, OutParm)
// int                            NumRecipients                  (Parm, OutParm)
// struct FString                 OrderString                    (Parm, OutParm, NeedCtorLink)

void ATeamGame::ParseRecipients(int* RecipientIDs, int* NumRecipients, struct FString* OrderString)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ParseRecipients");

	ATeamGame_ParseRecipients_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (RecipientIDs != nullptr)
		*RecipientIDs = params.RecipientIDs;
	if (NumRecipients != nullptr)
		*NumRecipients = params.NumRecipients;
	if (OrderString != nullptr)
		*OrderString = params.OrderString;
}


// Function UnrealGame.TeamGame.ParseRecipient
// (Defined, Public)
// Parameters:
// struct FString                 Recipient                      (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamGame::ParseRecipient(const struct FString& Recipient)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ParseRecipient");

	ATeamGame_ParseRecipient_Params params;
	params.Recipient = Recipient;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.ApplyOrder
// (Defined, Public)
// Parameters:
// class APlayerController*       Sender                         (Parm)
// int                            RecipientID                    (Parm)
// int                            OrderID                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamGame::ApplyOrder(class APlayerController* Sender, int RecipientID, int OrderID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ApplyOrder");

	ATeamGame_ApplyOrder_Params params;
	params.Sender = Sender;
	params.RecipientID = RecipientID;
	params.OrderID = OrderID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.ParseOrder
// (Defined, Public)
// Parameters:
// struct FString                 OrderString                    (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamGame::ParseOrder(const struct FString& OrderString)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.ParseOrder");

	ATeamGame_ParseOrder_Params params;
	params.OrderString = OrderString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.StartMatch
// (Defined, Public)

void ATeamGame::StartMatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.StartMatch");

	ATeamGame_StartMatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.GetTeamScores
// (Defined, Public)
// Parameters:
// TArray<int>                    ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<int> ATeamGame::GetTeamScores()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetTeamScores");

	ATeamGame_GetTeamScores_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.GetWaitViewClass
// (Defined, Public)
// Parameters:
// unsigned char                  Team                           (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* ATeamGame::GetWaitViewClass(unsigned char Team)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.GetWaitViewClass");

	ATeamGame_GetWaitViewClass_Params params;
	params.Team = Team;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamGame.SetGrammar
// (Defined, Event, Public)

void ATeamGame::SetGrammar()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.SetGrammar");

	ATeamGame_SetGrammar_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamGame.PostBeginPlay
// (Defined, Public)

void ATeamGame::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamGame.PostBeginPlay");

	ATeamGame_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.SetTeam
// (Defined, Public)
// Parameters:
// unsigned char                  TeamIndex                      (Parm)

void AGameObjective::SetTeam(unsigned char TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.SetTeam");

	AGameObjective_SetTeam_Params params;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.AwardAssaultScore
// (Defined, Public)
// Parameters:
// int                            Score                          (Parm)

void AGameObjective::AwardAssaultScore(int Score)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.AwardAssaultScore");

	AGameObjective_AwardAssaultScore_Params params;
	params.Score = Score;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.ShareScore
// (Defined, Public)
// Parameters:
// int                            Score                          (Parm)
// struct FString                 EventDesc                      (Parm, NeedCtorLink)

void AGameObjective::ShareScore(int Score, const struct FString& EventDesc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.ShareScore");

	AGameObjective_ShareScore_Params params;
	params.Score = Score;
	params.EventDesc = EventDesc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.AddScorer
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// float                          Pct                            (Parm)

void AGameObjective::AddScorer(class AController* C, float Pct)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.AddScorer");

	AGameObjective_AddScorer_Params params;
	params.C = C;
	params.Pct = Pct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AGameObjective::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.UpdatePrecacheMaterials");

	AGameObjective_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.GetObjectiveProgress
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AGameObjective::GetObjectiveProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.GetObjectiveProgress");

	AGameObjective_GetObjectiveProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.SetObjectiveOverlay
// (Defined, Simulated, Public)
// Parameters:
// bool                           bShow                          (Parm)

void AGameObjective::SetObjectiveOverlay(bool bShow)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.SetObjectiveOverlay");

	AGameObjective_SetObjectiveOverlay_Params params;
	params.bShow = bShow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.PostNetReceive
// (Defined, Simulated, Public)

void AGameObjective::PostNetReceive()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.PostNetReceive");

	AGameObjective_PostNetReceive_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.HighlightPhysicalObjective
// (Defined, Public)
// Parameters:
// bool                           bShow                          (Parm)

void AGameObjective::HighlightPhysicalObjective(bool bShow)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.HighlightPhysicalObjective");

	AGameObjective_HighlightPhysicalObjective_Params params;
	params.bShow = bShow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.PrecacheAnnouncer
// (Defined, Simulated, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void AGameObjective::PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.PrecacheAnnouncer");

	AGameObjective_PrecacheAnnouncer_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   Instigator                     (Parm)

void AGameObjective::Trigger(class AActor* Other, class APawn* Instigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.Trigger");

	AGameObjective_Trigger_Params params;
	params.Other = Other;
	params.Instigator = Instigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.CheckPlayCriticalAlarm
// (Defined, Public)

void AGameObjective::CheckPlayCriticalAlarm()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.CheckPlayCriticalAlarm");

	AGameObjective_CheckPlayCriticalAlarm_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.SetCriticalStatus
// (Defined, Public)
// Parameters:
// bool                           bNewCriticalStatus             (Parm)

void AGameObjective::SetCriticalStatus(bool bNewCriticalStatus)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.SetCriticalStatus");

	AGameObjective_SetCriticalStatus_Params params;
	params.bNewCriticalStatus = bNewCriticalStatus;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.IsCritical
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::IsCritical()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.IsCritical");

	AGameObjective_IsCritical_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.IsActive
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::IsActive()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.IsActive");

	AGameObjective_IsActive_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.SetActive
// (Defined, Public)
// Parameters:
// bool                           bActiveStatus                  (Parm)

void AGameObjective::SetActive(bool bActiveStatus)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.SetActive");

	AGameObjective_SetActive_Params params;
	params.bActiveStatus = bActiveStatus;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.Reset
// (Defined, Public)

void AGameObjective::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.Reset");

	AGameObjective_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.BetterObjectiveThan
// (Defined, Public)
// Parameters:
// class AGameObjective*          Best                           (Parm)
// unsigned char                  DesiredTeamNum                 (Parm)
// unsigned char                  RequesterTeamNum               (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::BetterObjectiveThan(class AGameObjective* Best, unsigned char DesiredTeamNum, unsigned char RequesterTeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.BetterObjectiveThan");

	AGameObjective_BetterObjectiveThan_Params params;
	params.Best = Best;
	params.DesiredTeamNum = DesiredTeamNum;
	params.RequesterTeamNum = RequesterTeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.PlayDestructionMessage
// (Defined, Simulated, Public)

void AGameObjective::PlayDestructionMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.PlayDestructionMessage");

	AGameObjective_PlayDestructionMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.DisableObjective
// (Defined, Public)
// Parameters:
// class APawn*                   Instigator                     (Parm)

void AGameObjective::DisableObjective(class APawn* Instigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.DisableObjective");

	AGameObjective_DisableObjective_Params params;
	params.Instigator = Instigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.CompleteObjective
// (Defined, Public)
// Parameters:
// class APawn*                   Instigator                     (Parm)

void AGameObjective::CompleteObjective(class APawn* Instigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.CompleteObjective");

	AGameObjective_CompleteObjective_Params params;
	params.Instigator = Instigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.GetNumDefenders
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AGameObjective::GetNumDefenders()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.GetNumDefenders");

	AGameObjective_GetNumDefenders_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.TellBotHowToDisable
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::TellBotHowToDisable(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.TellBotHowToDisable");

	AGameObjective_TellBotHowToDisable_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.GetHumanReadableName
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AGameObjective::GetHumanReadableName()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.GetHumanReadableName");

	AGameObjective_GetHumanReadableName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.OwnsDefenseScript
// (Defined, Public)
// Parameters:
// class AUnrealScriptedSequence* S                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::OwnsDefenseScript(class AUnrealScriptedSequence* S)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.OwnsDefenseScript");

	AGameObjective_OwnsDefenseScript_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.Timer
// (Defined, Public)

void AGameObjective::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.Timer");

	AGameObjective_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.NearObjective
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::NearObjective(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.NearObjective");

	AGameObjective_NearObjective_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.BotNearObjective
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::BotNearObjective(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.BotNearObjective");

	AGameObjective_BotNearObjective_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.PlayAlarm
// (Public)

void AGameObjective::PlayAlarm()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.PlayAlarm");

	AGameObjective_PlayAlarm_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.UpdateLocationName
// (Defined, Simulated, Public)

void AGameObjective::UpdateLocationName()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.UpdateLocationName");

	AGameObjective_UpdateLocationName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.ForceBegin
// (Defined, Public)

void AGameObjective::ForceBegin()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.ForceBegin");

	AGameObjective_ForceBegin_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.PostBeginPlay
// (Defined, Simulated, Public)

void AGameObjective::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.PostBeginPlay");

	AGameObjective_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.PreBeginPlay
// (Defined, Simulated, Event, Public)

void AGameObjective::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.PreBeginPlay");

	AGameObjective_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.GameObjective.CanDoubleJump
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AGameObjective::CanDoubleJump(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.CanDoubleJump");

	AGameObjective_CanDoubleJump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.GameObjective.GetDifficulty
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AGameObjective::GetDifficulty()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.GameObjective.GetDifficulty");

	AGameObjective_GetDifficulty_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.GetObjectiveProgress
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ADestroyableObjective::GetObjectiveProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.GetObjectiveProgress");

	ADestroyableObjective_GetObjectiveProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.IsCritical
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::IsCritical()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.IsCritical");

	ADestroyableObjective_IsCritical_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.TimerPop
// (Defined, Public)
// Parameters:
// class AVolumeTimer*            t                              (Parm)

void ADestroyableObjective::TimerPop(class AVolumeTimer* t)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.TimerPop");

	ADestroyableObjective_TimerPop_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DestroyableObjective.DisableObjective
// (Defined, Public)
// Parameters:
// class APawn*                   Instigator                     (Parm)

void ADestroyableObjective::DisableObjective(class APawn* Instigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.DisableObjective");

	ADestroyableObjective_DisableObjective_Params params;
	params.Instigator = Instigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DestroyableObjective.HealDamage
// (Defined, Public)
// Parameters:
// int                            Amount                         (Parm)
// class AController*             Healer                         (Parm)
// class UClass*                  DamageType                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::HealDamage(int Amount, class AController* Healer, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.HealDamage");

	ADestroyableObjective_HealDamage_Params params;
	params.Amount = Amount;
	params.Healer = Healer;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.AwardAssaultScore
// (Defined, Public)
// Parameters:
// int                            Score                          (Parm)

void ADestroyableObjective::AwardAssaultScore(int Score)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.AwardAssaultScore");

	ADestroyableObjective_AwardAssaultScore_Params params;
	params.Score = Score;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DestroyableObjective.TakeDamage
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

void ADestroyableObjective::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.TakeDamage");

	ADestroyableObjective_TakeDamage_Params params;
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


// Function UnrealGame.DestroyableObjective.Reset
// (Defined, Public)

void ADestroyableObjective::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.Reset");

	ADestroyableObjective_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DestroyableObjective.TellBotHowToHeal
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::TellBotHowToHeal(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.TellBotHowToHeal");

	ADestroyableObjective_TellBotHowToHeal_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.NearObjective
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::NearObjective(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.NearObjective");

	ADestroyableObjective_NearObjective_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.TellBotHowToDisable
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::TellBotHowToDisable(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.TellBotHowToDisable");

	ADestroyableObjective_TellBotHowToDisable_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.LegitimateTargetOf
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::LegitimateTargetOf(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.LegitimateTargetOf");

	ADestroyableObjective_LegitimateTargetOf_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.KillEnemyFirst
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::KillEnemyFirst(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.KillEnemyFirst");

	ADestroyableObjective_KillEnemyFirst_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.GetShootTarget
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* ADestroyableObjective::GetShootTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.GetShootTarget");

	ADestroyableObjective_GetShootTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.TeamLink
// (Defined, Simulated, Public)
// Parameters:
// int                            TeamNum                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADestroyableObjective::TeamLink(int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.TeamLink");

	ADestroyableObjective_TeamLink_Params params;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.Destroyed
// (Defined, Public)

void ADestroyableObjective::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.Destroyed");

	ADestroyableObjective_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DestroyableObjective.SetDelayedDamageInstigatorController
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void ADestroyableObjective::SetDelayedDamageInstigatorController(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.SetDelayedDamageInstigatorController");

	ADestroyableObjective_SetDelayedDamageInstigatorController_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DestroyableObjective.SpecialCost
// (Defined, Event, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// class UReachSpec*              Path                           (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ADestroyableObjective::SpecialCost(class APawn* Other, class UReachSpec* Path)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.SpecialCost");

	ADestroyableObjective_SpecialCost_Params params;
	params.Other = Other;
	params.Path = Path;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DestroyableObjective.PostBeginPlay
// (Defined, Public)

void ADestroyableObjective::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DestroyableObjective.PostBeginPlay");

	ADestroyableObjective_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.RestingFormation.GetViewPointFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// int                            pos                            (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector ARestingFormation::GetViewPointFor(class ABot* B, int pos)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RestingFormation.GetViewPointFor");

	ARestingFormation_GetViewPointFor_Params params;
	params.B = B;
	params.pos = pos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RestingFormation.GetLocationFor
// (Defined, Public)
// Parameters:
// int                            pos                            (Parm)
// class ABot*                    B                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector ARestingFormation::GetLocationFor(int pos, class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RestingFormation.GetLocationFor");

	ARestingFormation_GetLocationFor_Params params;
	params.pos = pos;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RestingFormation.RecommendPositionFor
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ARestingFormation::RecommendPositionFor(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RestingFormation.RecommendPositionFor");

	ARestingFormation_RecommendPositionFor_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RestingFormation.SetFormation
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// int                            pos                            (Parm)
// bool                           bFullCheck                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ARestingFormation::SetFormation(class ABot* B, int pos, bool bFullCheck)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RestingFormation.SetFormation");

	ARestingFormation_SetFormation_Params params;
	params.B = B;
	params.pos = pos;
	params.bFullCheck = bFullCheck;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.RestingFormation.LeaveFormation
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ARestingFormation::LeaveFormation(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.RestingFormation.LeaveFormation");

	ARestingFormation_LeaveFormation_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamInfo.RemoveFromTeam
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)

void AUnrealTeamInfo::RemoveFromTeam(class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.RemoveFromTeam");

	AUnrealTeamInfo_RemoveFromTeam_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamInfo.SetBotOrders
// (Defined, Public)
// Parameters:
// class ABot*                    NewBot                         (Parm)
// class URosterEntry*            R                              (Parm)

void AUnrealTeamInfo::SetBotOrders(class ABot* NewBot, class URosterEntry* R)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.SetBotOrders");

	AUnrealTeamInfo_SetBotOrders_Params params;
	params.NewBot = NewBot;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamInfo.BelongsOnTeam
// (Defined, Public)
// Parameters:
// class UClass*                  PawnClass                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamInfo::BelongsOnTeam(class UClass* PawnClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.BelongsOnTeam");

	AUnrealTeamInfo_BelongsOnTeam_Params params;
	params.PawnClass = PawnClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.AddToTeam
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamInfo::AddToTeam(class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.AddToTeam");

	AUnrealTeamInfo_AddToTeam_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.GetNamedBot
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (Parm, NeedCtorLink)
// class URosterEntry*            ReturnValue                    (Parm, OutParm, ReturnParm)

class URosterEntry* AUnrealTeamInfo::GetNamedBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.GetNamedBot");

	AUnrealTeamInfo_GetNamedBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.GetNextBot
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (Parm, NeedCtorLink)
// class URosterEntry*            ReturnValue                    (Parm, OutParm, ReturnParm)

class URosterEntry* AUnrealTeamInfo::GetNextBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.GetNextBot");

	AUnrealTeamInfo_GetNextBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.AddNamedBot
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (Parm, NeedCtorLink)

void AUnrealTeamInfo::AddNamedBot(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.AddNamedBot");

	AUnrealTeamInfo_AddNamedBot_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamInfo.AddRandomPlayer
// (Defined, Public)

void AUnrealTeamInfo::AddRandomPlayer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.AddRandomPlayer");

	AUnrealTeamInfo_AddRandomPlayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamInfo.AlreadyExistsEntry
// (Defined, Public)
// Parameters:
// struct FString                 CharacterName                  (Parm, NeedCtorLink)
// bool                           bNoRecursion                   (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamInfo::AlreadyExistsEntry(const struct FString& CharacterName, bool bNoRecursion)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.AlreadyExistsEntry");

	AUnrealTeamInfo_AlreadyExistsEntry_Params params;
	params.CharacterName = CharacterName;
	params.bNoRecursion = bNoRecursion;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.GetRandomPlayer
// (Public)
// Parameters:
// class URosterEntry*            ReturnValue                    (Parm, OutParm, ReturnParm)

class URosterEntry* AUnrealTeamInfo::GetRandomPlayer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.GetRandomPlayer");

	AUnrealTeamInfo_GetRandomPlayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.ChooseBotClass
// (Defined, Public)
// Parameters:
// struct FString                 botname                        (OptionalParm, Parm, NeedCtorLink)
// class URosterEntry*            ReturnValue                    (Parm, OutParm, ReturnParm)

class URosterEntry* AUnrealTeamInfo::ChooseBotClass(const struct FString& botname)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.ChooseBotClass");

	AUnrealTeamInfo_ChooseBotClass_Params params;
	params.botname = botname;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.NeedsBotMoreThan
// (Defined, Public)
// Parameters:
// class AUnrealTeamInfo*         t                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamInfo::NeedsBotMoreThan(class AUnrealTeamInfo* t)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.NeedsBotMoreThan");

	AUnrealTeamInfo_NeedsBotMoreThan_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.NextLoadOut
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  CurrentLoadout                 (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AUnrealTeamInfo::NextLoadOut(class UClass* CurrentLoadout)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.NextLoadOut");

	AUnrealTeamInfo_NextLoadOut_Params params;
	params.CurrentLoadout = CurrentLoadout;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.FillPlayerTeam
// (Public)
// Parameters:
// class UGameProfile*            G                              (Parm)

void AUnrealTeamInfo::FillPlayerTeam(class UGameProfile* G)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.FillPlayerTeam");

	AUnrealTeamInfo_FillPlayerTeam_Params params;
	params.G = G;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamInfo.Initialize
// (Public)
// Parameters:
// int                            TeamBots                       (Parm)

void AUnrealTeamInfo::Initialize(int TeamBots)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.Initialize");

	AUnrealTeamInfo_Initialize_Params params;
	params.TeamBots = TeamBots;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamInfo.AllBotsSpawned
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamInfo::AllBotsSpawned()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.AllBotsSpawned");

	AUnrealTeamInfo_AllBotsSpawned_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.OverrideInitialBots
// (Defined, Public)
// Parameters:
// int                            N                              (Parm)
// class AUnrealTeamInfo*         t                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealTeamInfo::OverrideInitialBots(int N, class AUnrealTeamInfo* t)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.OverrideInitialBots");

	AUnrealTeamInfo_OverrideInitialBots_Params params;
	params.N = N;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamInfo.Reset
// (Defined, Public)

void AUnrealTeamInfo::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamInfo.Reset");

	AUnrealTeamInfo_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.ShootTarget.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AShootTarget::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.ShootTarget.Trigger");

	AShootTarget_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.ShootTarget.TakeDamage
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

void AShootTarget::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.ShootTarget.TakeDamage");

	AShootTarget_TakeDamage_Params params;
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


// Function UnrealGame.ProximityObjective.TellBotHowToDisable
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AProximityObjective::TellBotHowToDisable(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.ProximityObjective.TellBotHowToDisable");

	AProximityObjective_TellBotHowToDisable_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.ProximityObjective.SetActive
// (Defined, Public)
// Parameters:
// bool                           bActiveStatus                  (Parm)

void AProximityObjective::SetActive(bool bActiveStatus)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.ProximityObjective.SetActive");

	AProximityObjective_SetActive_Params params;
	params.bActiveStatus = bActiveStatus;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.ProximityObjective.FindInstigator
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// class APawn*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class APawn* AProximityObjective::FindInstigator(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.ProximityObjective.FindInstigator");

	AProximityObjective_FindInstigator_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.ProximityObjective.IsRelevant
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           bAliveCheck                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AProximityObjective::IsRelevant(class APawn* P, bool bAliveCheck)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.ProximityObjective.IsRelevant");

	AProximityObjective_IsRelevant_Params params;
	params.P = P;
	params.bAliveCheck = bAliveCheck;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.ProximityObjective.Touch
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AProximityObjective::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.ProximityObjective.Touch");

	AProximityObjective_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AHoldObjective::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.UpdatePrecacheMaterials");

	AHoldObjective_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.SetObjectiveOverlay
// (Defined, Simulated, Public)
// Parameters:
// bool                           bShow                          (Parm)

void AHoldObjective::SetObjectiveOverlay(bool bShow)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.SetObjectiveOverlay");

	AHoldObjective_SetObjectiveOverlay_Params params;
	params.bShow = bShow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.IsCritical
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHoldObjective::IsCritical()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.IsCritical");

	AHoldObjective_IsCritical_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.HoldObjective.GetObjectiveProgress
// (Defined, Simulated, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AHoldObjective::GetObjectiveProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.GetObjectiveProgress");

	AHoldObjective_GetObjectiveProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.HoldObjective.Reset
// (Defined, Public)

void AHoldObjective::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.Reset");

	AHoldObjective_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.CompleteObjective
// (Defined, Public)
// Parameters:
// class APawn*                   Instigator                     (Parm)

void AHoldObjective::CompleteObjective(class APawn* Instigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.CompleteObjective");

	AHoldObjective_CompleteObjective_Params params;
	params.Instigator = Instigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   Instigator                     (Parm)

void AHoldObjective::Trigger(class AActor* Other, class APawn* Instigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.Trigger");

	AHoldObjective_Trigger_Params params;
	params.Other = Other;
	params.Instigator = Instigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.AwardAssaultScore
// (Defined, Public)
// Parameters:
// int                            Score                          (Parm)

void AHoldObjective::AwardAssaultScore(int Score)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.AwardAssaultScore");

	AHoldObjective_AwardAssaultScore_Params params;
	params.Score = Score;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.RemoveTouchingPlayer
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AHoldObjective::RemoveTouchingPlayer(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.RemoveTouchingPlayer");

	AHoldObjective_RemoveTouchingPlayer_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.AddNewTouchingPlayer
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AHoldObjective::AddNewTouchingPlayer(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.AddNewTouchingPlayer");

	AHoldObjective_AddNewTouchingPlayer_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.PlayerToucherDied
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AHoldObjective::PlayerToucherDied(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.PlayerToucherDied");

	AHoldObjective_PlayerToucherDied_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.UnTouch
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AHoldObjective::UnTouch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.UnTouch");

	AHoldObjective_UnTouch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.Touch
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AHoldObjective::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.Touch");

	AHoldObjective_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.HoldObjective.TellBotHowToDisable
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AHoldObjective::TellBotHowToDisable(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.TellBotHowToDisable");

	AHoldObjective_TellBotHowToDisable_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.HoldObjective.PostBeginPlay
// (Defined, Simulated, Public)

void AHoldObjective::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.HoldObjective.PostBeginPlay");

	AHoldObjective_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.RemoveFromTeam
// (Defined, Public)
// Parameters:
// class AController*             Other                          (Parm)

void ATeamAI::RemoveFromTeam(class AController* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.RemoveFromTeam");

	ATeamAI_RemoveFromTeam_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.CallForHelp
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ATeamAI::CallForHelp(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.CallForHelp");

	ATeamAI_CallForHelp_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.SetOrders
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// struct FName                   NewOrders                      (Parm)
// class AController*             OrderGiver                     (Parm)

void ATeamAI::SetOrders(class ABot* B, const struct FName& NewOrders, class AController* OrderGiver)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.SetOrders");

	ATeamAI_SetOrders_Params params;
	params.B = B;
	params.NewOrders = NewOrders;
	params.OrderGiver = OrderGiver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.SetBotOrders
// (Defined, Public)
// Parameters:
// class ABot*                    NewBot                         (Parm)
// class URosterEntry*            R                              (Parm)

void ATeamAI::SetBotOrders(class ABot* NewBot, class URosterEntry* R)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.SetBotOrders");

	ATeamAI_SetBotOrders_Params params;
	params.NewBot = NewBot;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.PutOnFreelance
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ATeamAI::PutOnFreelance(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.PutOnFreelance");

	ATeamAI_PutOnFreelance_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.PutOnOffense
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ATeamAI::PutOnOffense(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.PutOnOffense");

	ATeamAI_PutOnOffense_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.PutOnDefense
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamAI::PutOnDefense(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.PutOnDefense");

	ATeamAI_PutOnDefense_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.GetPriorityFreelanceObjective
// (Defined, Public)
// Parameters:
// class AGameObjective*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AGameObjective* ATeamAI::GetPriorityFreelanceObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.GetPriorityFreelanceObjective");

	ATeamAI_GetPriorityFreelanceObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.GetPriorityAttackObjectiveFor
// (Defined, Public)
// Parameters:
// class ASquadAI*                AttackSquad                    (Parm)
// class AGameObjective*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AGameObjective* ATeamAI::GetPriorityAttackObjectiveFor(class ASquadAI* AttackSquad)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.GetPriorityAttackObjectiveFor");

	ATeamAI_GetPriorityAttackObjectiveFor_Params params;
	params.AttackSquad = AttackSquad;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.GetPriorityAttackObjective
// (Defined, Public)
// Parameters:
// class AGameObjective*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AGameObjective* ATeamAI::GetPriorityAttackObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.GetPriorityAttackObjective");

	ATeamAI_GetPriorityAttackObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.GetMostDefendedObjective
// (Defined, Public)
// Parameters:
// class AGameObjective*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AGameObjective* ATeamAI::GetMostDefendedObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.GetMostDefendedObjective");

	ATeamAI_GetMostDefendedObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.GetLeastDefendedObjective
// (Defined, Public)
// Parameters:
// class AGameObjective*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AGameObjective* ATeamAI::GetLeastDefendedObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.GetLeastDefendedObjective");

	ATeamAI_GetLeastDefendedObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.AddSquadWithLeader
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class AGameObjective*          o                              (Parm)
// class ASquadAI*                ReturnValue                    (Parm, OutParm, ReturnParm)

class ASquadAI* ATeamAI::AddSquadWithLeader(class AController* C, class AGameObjective* o)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.AddSquadWithLeader");

	ATeamAI_AddSquadWithLeader_Params params;
	params.C = C;
	params.o = o;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.PutBotOnSquadLedBy
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class ABot*                    B                              (Parm)

void ATeamAI::PutBotOnSquadLedBy(class AController* C, class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.PutBotOnSquadLedBy");

	ATeamAI_PutBotOnSquadLedBy_Params params;
	params.C = C;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.AddHumanSquad
// (Defined, Public)
// Parameters:
// class ASquadAI*                ReturnValue                    (Parm, OutParm, ReturnParm)

class ASquadAI* ATeamAI::AddHumanSquad()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.AddHumanSquad");

	ATeamAI_AddHumanSquad_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.FindHumanSquad
// (Defined, Public)
// Parameters:
// class ASquadAI*                ReturnValue                    (Parm, OutParm, ReturnParm)

class ASquadAI* ATeamAI::FindHumanSquad()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.FindHumanSquad");

	ATeamAI_FindHumanSquad_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.SetObjectiveLists
// (Defined, Public)

void ATeamAI::SetObjectiveLists()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.SetObjectiveLists");

	ATeamAI_SetObjectiveLists_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.FriendlyToward
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamAI::FriendlyToward(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.FriendlyToward");

	ATeamAI_FriendlyToward_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.FindSquadOf
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class ASquadAI*                ReturnValue                    (Parm, OutParm, ReturnParm)

class ASquadAI* ATeamAI::FindSquadOf(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.FindSquadOf");

	ATeamAI_FindSquadOf_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.OnThisTeam
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamAI::OnThisTeam(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.OnThisTeam");

	ATeamAI_OnThisTeam_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.RemoveSquad
// (Defined, Public)
// Parameters:
// class ASquadAI*                Squad                          (Parm)

void ATeamAI::RemoveSquad(class ASquadAI* Squad)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.RemoveSquad");

	ATeamAI_RemoveSquad_Params params;
	params.Squad = Squad;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.FindNewObjectiveFor
// (Defined, Public)
// Parameters:
// class ASquadAI*                S                              (Parm)
// bool                           bForceUpdate                   (Parm)

void ATeamAI::FindNewObjectiveFor(class ASquadAI* S, bool bForceUpdate)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.FindNewObjectiveFor");

	ATeamAI_FindNewObjectiveFor_Params params;
	params.S = S;
	params.bForceUpdate = bForceUpdate;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.FindNewObjectives
// (Defined, Public)
// Parameters:
// class AGameObjective*          DisabledObjective              (Parm)

void ATeamAI::FindNewObjectives(class AGameObjective* DisabledObjective)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.FindNewObjectives");

	ATeamAI_FindNewObjectives_Params params;
	params.DisabledObjective = DisabledObjective;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void ATeamAI::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.NotifyKilled");

	ATeamAI_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.ReAssessStrategy
// (Defined, Public)

void ATeamAI::ReAssessStrategy()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.ReAssessStrategy");

	ATeamAI_ReAssessStrategy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.GetSquadLedBy
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// class ASquadAI*                ReturnValue                    (Parm, OutParm, ReturnParm)

class ASquadAI* ATeamAI::GetSquadLedBy(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.GetSquadLedBy");

	ATeamAI_GetSquadLedBy_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.ClearEnemies
// (Defined, Public)

void ATeamAI::ClearEnemies()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.ClearEnemies");

	ATeamAI_ClearEnemies_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.Reset
// (Defined, Public)

void ATeamAI::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.Reset");

	ATeamAI_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.SuperPickupAvailable
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamAI::SuperPickupAvailable(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.SuperPickupAvailable");

	ATeamAI_SuperPickupAvailable_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamAI.CallForBall
// (Public)
// Parameters:
// class APawn*                   Recipient                      (Parm)

void ATeamAI::CallForBall(class APawn* Recipient)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.CallForBall");

	ATeamAI_CallForBall_Params params;
	params.Recipient = Recipient;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.CriticalObjectiveWarning
// (Public)
// Parameters:
// class AGameObjective*          G                              (Parm)
// class APawn*                   NewEnemy                       (Parm)

void ATeamAI::CriticalObjectiveWarning(class AGameObjective* G, class APawn* NewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.CriticalObjectiveWarning");

	ATeamAI_CriticalObjectiveWarning_Params params;
	params.G = G;
	params.NewEnemy = NewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.Timer
// (Defined, Public)

void ATeamAI::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.Timer");

	ATeamAI_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamAI.PostBeginPlay
// (Defined, Public)

void ATeamAI::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamAI.PostBeginPlay");

	ATeamAI_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleDeathDriving
// (Defined, Public)
// Parameters:
// class UClass*                  V                              (Parm)

void ATeamPlayerReplicationInfo::AddVehicleDeathDriving(class UClass* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleDeathDriving");

	ATeamPlayerReplicationInfo_AddVehicleDeathDriving_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleDeath
// (Defined, Public)
// Parameters:
// class UClass*                  D                              (Parm)

void ATeamPlayerReplicationInfo::AddVehicleDeath(class UClass* D)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleDeath");

	ATeamPlayerReplicationInfo_AddVehicleDeath_Params params;
	params.D = D;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleKill
// (Defined, Public)
// Parameters:
// class UClass*                  D                              (Parm)

void ATeamPlayerReplicationInfo::AddVehicleKill(class UClass* D)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.AddVehicleKill");

	ATeamPlayerReplicationInfo_AddVehicleKill_Params params;
	params.D = D;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.UpdateVehicleStats
// (Defined, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// class UClass*                  V                              (Parm)
// int                            newKills                       (Parm)
// int                            newDeaths                      (Parm)
// int                            newDeathsDriving               (Parm)

void ATeamPlayerReplicationInfo::UpdateVehicleStats(class ATeamPlayerReplicationInfo* PRI, class UClass* V, int newKills, int newDeaths, int newDeathsDriving)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.UpdateVehicleStats");

	ATeamPlayerReplicationInfo_UpdateVehicleStats_Params params;
	params.PRI = PRI;
	params.V = V;
	params.newKills = newKills;
	params.newDeaths = newDeaths;
	params.newDeathsDriving = newDeathsDriving;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponDeathHolding
// (Defined, Public)
// Parameters:
// class UClass*                  W                              (Parm)

void ATeamPlayerReplicationInfo::AddWeaponDeathHolding(class UClass* W)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponDeathHolding");

	ATeamPlayerReplicationInfo_AddWeaponDeathHolding_Params params;
	params.W = W;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponDeath
// (Defined, Public)
// Parameters:
// class UClass*                  D                              (Parm)

void ATeamPlayerReplicationInfo::AddWeaponDeath(class UClass* D)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponDeath");

	ATeamPlayerReplicationInfo_AddWeaponDeath_Params params;
	params.D = D;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponKill
// (Defined, Public)
// Parameters:
// class UClass*                  D                              (Parm)

void ATeamPlayerReplicationInfo::AddWeaponKill(class UClass* D)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.AddWeaponKill");

	ATeamPlayerReplicationInfo_AddWeaponKill_Params params;
	params.D = D;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.UpdateWeaponStats
// (Defined, Simulated, Public)
// Parameters:
// class ATeamPlayerReplicationInfo* PRI                            (Parm)
// class UClass*                  W                              (Parm)
// int                            newKills                       (Parm)
// int                            newDeaths                      (Parm)
// int                            newDeathsHolding               (Parm)

void ATeamPlayerReplicationInfo::UpdateWeaponStats(class ATeamPlayerReplicationInfo* PRI, class UClass* W, int newKills, int newDeaths, int newDeathsHolding)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.UpdateWeaponStats");

	ATeamPlayerReplicationInfo_UpdateWeaponStats_Params params;
	params.PRI = PRI;
	params.W = W;
	params.newKills = newKills;
	params.newDeaths = newDeaths;
	params.newDeathsHolding = newDeathsHolding;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamPlayerReplicationInfo.PostBeginPlay
// (Defined, Simulated, Public)

void ATeamPlayerReplicationInfo::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamPlayerReplicationInfo.PostBeginPlay");

	ATeamPlayerReplicationInfo_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SpecialVehicleObjective.Reset
// (Defined, Public)

void ASpecialVehicleObjective::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SpecialVehicleObjective.Reset");

	ASpecialVehicleObjective_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SpecialVehicleObjective.UnTrigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void ASpecialVehicleObjective::UnTrigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SpecialVehicleObjective.UnTrigger");

	ASpecialVehicleObjective_UnTrigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SpecialVehicleObjective.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void ASpecialVehicleObjective::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SpecialVehicleObjective.Trigger");

	ASpecialVehicleObjective_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SpecialVehicleObjective.IsAccessibleTo
// (Defined, Public)
// Parameters:
// class APawn*                   BotPawn                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ASpecialVehicleObjective::IsAccessibleTo(class APawn* BotPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SpecialVehicleObjective.IsAccessibleTo");

	ASpecialVehicleObjective_IsAccessibleTo_Params params;
	params.BotPawn = BotPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SpecialVehicleObjective.PostBeginPlay
// (Defined, Public)

void ASpecialVehicleObjective::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SpecialVehicleObjective.PostBeginPlay");

	ASpecialVehicleObjective_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.AssaultPath.FindPreviousPath
// (Defined, Public)
// Parameters:
// struct FName                   AlternatePathTag               (Parm)
// class AAssaultPath*            ReturnValue                    (Parm, OutParm, ReturnParm)

class AAssaultPath* AAssaultPath::FindPreviousPath(const struct FName& AlternatePathTag)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AssaultPath.FindPreviousPath");

	AAssaultPath_FindPreviousPath_Params params;
	params.AlternatePathTag = AlternatePathTag;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.AssaultPath.FindNextPath
// (Defined, Public)
// Parameters:
// struct FName                   AlternatePathTag               (Parm)
// class AAssaultPath*            ReturnValue                    (Parm, OutParm, ReturnParm)

class AAssaultPath* AAssaultPath::FindNextPath(const struct FName& AlternatePathTag)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AssaultPath.FindNextPath");

	AAssaultPath_FindNextPath_Params params;
	params.AlternatePathTag = AlternatePathTag;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.AssaultPath.HasPathTag
// (Defined, Public)
// Parameters:
// struct FName                   aPathTag                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AAssaultPath::HasPathTag(const struct FName& aPathTag)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AssaultPath.HasPathTag");

	AAssaultPath_HasPathTag_Params params;
	params.aPathTag = aPathTag;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.AssaultPath.PickTag
// (Defined, Public)
// Parameters:
// struct FName                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FName AAssaultPath::PickTag()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AssaultPath.PickTag");

	AAssaultPath_PickTag_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.AssaultPath.AddTo
// (Defined, Public)
// Parameters:
// class AGameObjective*          o                              (Parm)

void AAssaultPath::AddTo(class AGameObjective* o)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AssaultPath.AddTo");

	AAssaultPath_AddTo_Params params;
	params.o = o;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.AssaultPath.ValidatePathTags
// (Defined, Public)

void AAssaultPath::ValidatePathTags()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AssaultPath.ValidatePathTags");

	AAssaultPath_ValidatePathTags_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.AssaultPath.Trigger
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AAssaultPath::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AssaultPath.Trigger");

	AAssaultPath_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DMStatsScreen.NextStats
// (Defined, Public)

void ADMStatsScreen::NextStats()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMStatsScreen.NextStats");

	ADMStatsScreen_NextStats_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DMStatsScreen.DrawScoreboard
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void ADMStatsScreen::DrawScoreboard(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMStatsScreen.DrawScoreboard");

	ADMStatsScreen_DrawScoreboard_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DMStatsScreen.MakeColorCode
// (Defined, Static, Public)
// Parameters:
// struct FColor                  NewColor                       (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ADMStatsScreen::STATIC_MakeColorCode(const struct FColor& NewColor)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMStatsScreen.MakeColorCode");

	ADMStatsScreen_MakeColorCode_Params params;
	params.NewColor = NewColor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.DestroyVoiceChannel
// (Defined, Simulated, Protected)
// Parameters:
// class AVoiceChatRoom*          Channel                        (Parm)

void AUnrealVoiceReplicationInfo::DestroyVoiceChannel(class AVoiceChatRoom* Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.DestroyVoiceChannel");

	AUnrealVoiceReplicationInfo_DestroyVoiceChannel_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.CreateNewVoiceChannel
// (Defined, Simulated, Protected)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (OptionalParm, Parm)
// class AVoiceChatRoom*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AVoiceChatRoom* AUnrealVoiceReplicationInfo::CreateNewVoiceChannel(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.CreateNewVoiceChannel");

	AUnrealVoiceReplicationInfo_CreateNewVoiceChannel_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.IsMember
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  TestPRI                        (Parm)
// int                            ChannelIndex                   (Parm)
// bool                           bNoCascade                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealVoiceReplicationInfo::IsMember(class APlayerReplicationInfo* TestPRI, int ChannelIndex, bool bNoCascade)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.IsMember");

	AUnrealVoiceReplicationInfo_IsMember_Params params;
	params.TestPRI = TestPRI;
	params.ChannelIndex = ChannelIndex;
	params.bNoCascade = bNoCascade;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetPlayerChannelCount
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealVoiceReplicationInfo::GetPlayerChannelCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetPlayerChannelCount");

	AUnrealVoiceReplicationInfo_GetPlayerChannelCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetPublicChannelCount
// (Defined, Simulated, Public)
// Parameters:
// bool                           bSingleTeam                    (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealVoiceReplicationInfo::GetPublicChannelCount(bool bSingleTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetPublicChannelCount");

	AUnrealVoiceReplicationInfo_GetPublicChannelCount_Params params;
	params.bSingleTeam = bSingleTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetPlayerChannels
// (Defined, Simulated, Public)
// Parameters:
// TArray<class AVoiceChatRoom*>  ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<class AVoiceChatRoom*> AUnrealVoiceReplicationInfo::GetPlayerChannels()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetPlayerChannels");

	AUnrealVoiceReplicationInfo_GetPlayerChannels_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetPublicChannels
// (Defined, Simulated, Public)
// Parameters:
// TArray<class AVoiceChatRoom*>  ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<class AVoiceChatRoom*> AUnrealVoiceReplicationInfo::GetPublicChannels()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetPublicChannels");

	AUnrealVoiceReplicationInfo_GetPublicChannels_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelIndex
// (Defined, Simulated, Event, Public)
// Parameters:
// struct FString                 ChannelTitle                   (Parm, NeedCtorLink)
// int                            TeamIndex                      (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealVoiceReplicationInfo::GetChannelIndex(const struct FString& ChannelTitle, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelIndex");

	AUnrealVoiceReplicationInfo_GetChannelIndex_Params params;
	params.ChannelTitle = ChannelTitle;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelCount
// (Defined, Simulated, Event, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealVoiceReplicationInfo::GetChannelCount()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelCount");

	AUnrealVoiceReplicationInfo_GetChannelCount_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannels
// (Defined, Simulated, Public)
// Parameters:
// TArray<class AVoiceChatRoom*>  ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<class AVoiceChatRoom*> AUnrealVoiceReplicationInfo::GetChannels()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetChannels");

	AUnrealVoiceReplicationInfo_GetChannels_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetMemberChannels
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// TArray<int>                    ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<int> AUnrealVoiceReplicationInfo::GetMemberChannels(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetMemberChannels");

	AUnrealVoiceReplicationInfo_GetMemberChannels_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelMembersAt
// (Defined, Simulated, Public)
// Parameters:
// int                            Index                          (Parm)
// TArray<int>                    ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<int> AUnrealVoiceReplicationInfo::GetChannelMembersAt(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelMembersAt");

	AUnrealVoiceReplicationInfo_GetChannelMembersAt_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelMembers
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ChatRoomName                   (Parm, NeedCtorLink)
// int                            TeamIndex                      (OptionalParm, Parm)
// TArray<int>                    ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<int> AUnrealVoiceReplicationInfo::GetChannelMembers(const struct FString& ChatRoomName, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelMembers");

	AUnrealVoiceReplicationInfo_GetChannelMembers_Params params;
	params.ChatRoomName = ChatRoomName;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelAt
// (Defined, Simulated, Public)
// Parameters:
// int                            Index                          (Parm)
// class AVoiceChatRoom*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AVoiceChatRoom* AUnrealVoiceReplicationInfo::GetChannelAt(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetChannelAt");

	AUnrealVoiceReplicationInfo_GetChannelAt_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.GetChannel
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ChatRoomName                   (Parm, NeedCtorLink)
// int                            TeamIndex                      (OptionalParm, Parm)
// class AVoiceChatRoom*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AVoiceChatRoom* AUnrealVoiceReplicationInfo::GetChannel(const struct FString& ChatRoomName, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.GetChannel");

	AUnrealVoiceReplicationInfo_GetChannel_Params params;
	params.ChatRoomName = ChatRoomName;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.RemoveVoiceChannel
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealVoiceReplicationInfo::RemoveVoiceChannel(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.RemoveVoiceChannel");

	AUnrealVoiceReplicationInfo_RemoveVoiceChannel_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.AddVoiceChannel
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (OptionalParm, Parm)
// class AVoiceChatRoom*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AVoiceChatRoom* AUnrealVoiceReplicationInfo::AddVoiceChannel(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.AddVoiceChannel");

	AUnrealVoiceReplicationInfo_AddVoiceChannel_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.LeaveChannel
// (Defined, Public)
// Parameters:
// struct FString                 ChannelTitle                   (Parm, NeedCtorLink)
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealVoiceReplicationInfo::LeaveChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.LeaveChannel");

	AUnrealVoiceReplicationInfo_LeaveChannel_Params params;
	params.ChannelTitle = ChannelTitle;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.JoinChannelAt
// (Defined, Public)
// Parameters:
// int                            ChannelIndex                   (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)
// struct FString                 Password                       (Parm, NeedCtorLink)
// TEnumAsByte<EJoinChatResult>   ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<EJoinChatResult> AUnrealVoiceReplicationInfo::JoinChannelAt(int ChannelIndex, class APlayerReplicationInfo* PRI, const struct FString& Password)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.JoinChannelAt");

	AUnrealVoiceReplicationInfo_JoinChannelAt_Params params;
	params.ChannelIndex = ChannelIndex;
	params.PRI = PRI;
	params.Password = Password;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.JoinChannel
// (Defined, Public)
// Parameters:
// struct FString                 ChannelTitle                   (Parm, NeedCtorLink)
// class APlayerReplicationInfo*  PRI                            (Parm)
// struct FString                 Password                       (Parm, NeedCtorLink)
// TEnumAsByte<EJoinChatResult>   ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<EJoinChatResult> AUnrealVoiceReplicationInfo::JoinChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI, const struct FString& Password)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.JoinChannel");

	AUnrealVoiceReplicationInfo_JoinChannel_Params params;
	params.ChannelTitle = ChannelTitle;
	params.PRI = PRI;
	params.Password = Password;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.CanJoinChannel
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ChannelTitle                   (Parm, NeedCtorLink)
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealVoiceReplicationInfo::CanJoinChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.CanJoinChannel");

	AUnrealVoiceReplicationInfo_CanJoinChannel_Params params;
	params.ChannelTitle = ChannelTitle;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.RemoveVoiceChatter
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)

void AUnrealVoiceReplicationInfo::RemoveVoiceChatter(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.RemoveVoiceChatter");

	AUnrealVoiceReplicationInfo_RemoveVoiceChatter_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.AddVoiceChatter
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  NewPRI                         (Parm)

void AUnrealVoiceReplicationInfo::AddVoiceChatter(class APlayerReplicationInfo* NewPRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.AddVoiceChatter");

	AUnrealVoiceReplicationInfo_AddVoiceChatter_Params params;
	params.NewPRI = NewPRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.InitChannels
// (Defined, Simulated, Public)

void AUnrealVoiceReplicationInfo::InitChannels()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.InitChannels");

	AUnrealVoiceReplicationInfo_InitChannels_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.SetGRI
// (Defined, Simulated, Event, Public)
// Parameters:
// class AGameReplicationInfo*    NewGRI                         (Parm)

void AUnrealVoiceReplicationInfo::SetGRI(class AGameReplicationInfo* NewGRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.SetGRI");

	AUnrealVoiceReplicationInfo_SetGRI_Params params;
	params.NewGRI = NewGRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AUnrealVoiceReplicationInfo::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.PostNetBeginPlay");

	AUnrealVoiceReplicationInfo_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.PostBeginPlay
// (Defined, Event, Public)

void AUnrealVoiceReplicationInfo::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.PostBeginPlay");

	AUnrealVoiceReplicationInfo_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealVoiceReplicationInfo.DisplayDebug
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AUnrealVoiceReplicationInfo::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealVoiceReplicationInfo.DisplayDebug");

	AUnrealVoiceReplicationInfo_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function UnrealGame.UnrealChatHandler.AcceptBroadcastVoice
// (Defined, Public)
// Parameters:
// class APlayerController*       Receiver                       (Parm)
// class APlayerReplicationInfo*  Sender                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatHandler::AcceptBroadcastVoice(class APlayerController* Receiver, class APlayerReplicationInfo* Sender)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatHandler.AcceptBroadcastVoice");

	AUnrealChatHandler_AcceptBroadcastVoice_Params params;
	params.Receiver = Receiver;
	params.Sender = Sender;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatHandler.AcceptBroadcastSpeech
// (Defined, Public)
// Parameters:
// class APlayerController*       Receiver                       (Parm)
// class APlayerReplicationInfo*  SenderPRI                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatHandler::AcceptBroadcastSpeech(class APlayerController* Receiver, class APlayerReplicationInfo* SenderPRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatHandler.AcceptBroadcastSpeech");

	AUnrealChatHandler_AcceptBroadcastSpeech_Params params;
	params.Receiver = Receiver;
	params.SenderPRI = SenderPRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatHandler.AcceptBroadcastLocalized
// (Defined, Public)
// Parameters:
// class APlayerController*       Receiver                       (Parm)
// class AActor*                  Sender                         (Parm)
// class UClass*                  Message                        (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 obj                            (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatHandler::AcceptBroadcastLocalized(class APlayerController* Receiver, class AActor* Sender, class UClass* Message, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* obj)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatHandler.AcceptBroadcastLocalized");

	AUnrealChatHandler_AcceptBroadcastLocalized_Params params;
	params.Receiver = Receiver;
	params.Sender = Sender;
	params.Message = Message;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.obj = obj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatHandler.AcceptBroadcastText
// (Defined, Public)
// Parameters:
// class APlayerController*       Receiver                       (Parm)
// class APlayerReplicationInfo*  SenderPRI                      (Parm)
// struct FString                 Msg                            (Parm, OutParm, NeedCtorLink)
// struct FName                   Type                           (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatHandler::AcceptBroadcastText(class APlayerController* Receiver, class APlayerReplicationInfo* SenderPRI, const struct FName& Type, struct FString* Msg)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatHandler.AcceptBroadcastText");

	AUnrealChatHandler_AcceptBroadcastText_Params params;
	params.Receiver = Receiver;
	params.SenderPRI = SenderPRI;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Msg != nullptr)
		*Msg = params.Msg;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatHandler.DoChatDebug
// (Defined, Public)

void AUnrealChatHandler::DoChatDebug()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatHandler.DoChatDebug");

	AUnrealChatHandler_DoChatDebug_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatHandler.ToggleChatDebug
// (Defined, Public)

void AUnrealChatHandler::ToggleChatDebug()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatHandler.ToggleChatDebug");

	AUnrealChatHandler_ToggleChatDebug_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.StartupMessage.GotoHud
// (Defined, Static, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AStartupMessage::STATIC_GotoHud(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.StartupMessage.GotoHud");

	AStartupMessage_GotoHud_Params params;
	params.P = P;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.StartupMessage.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AStartupMessage::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.StartupMessage.GetString");

	AStartupMessage_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.StartupMessage.ClientReceive
// (Defined, Simulated, Static, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AStartupMessage::STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.StartupMessage.ClientReceive");

	AStartupMessage_ClientReceive_Params params;
	params.P = P;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.IdleKickWarningMessage.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AIdleKickWarningMessage::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.IdleKickWarningMessage.GetString");

	AIdleKickWarningMessage_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.AnnounceAdrenaline.Timer
// (Defined, Public)

void AAnnounceAdrenaline::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.AnnounceAdrenaline.Timer");

	AAnnounceAdrenaline_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.CustomBotConfig.IndexFor
// (Defined, Static, Public)
// Parameters:
// struct FString                 PlayerName                     (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UCustomBotConfig::STATIC_IndexFor(const struct FString& PlayerName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.IndexFor");

	UCustomBotConfig_IndexFor_Params params;
	params.PlayerName = PlayerName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.CustomBotConfig.AggressivenessRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FCustomConfiguration    cc                             (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UCustomBotConfig::STATIC_AggressivenessRating(const struct FCustomConfiguration& cc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.AggressivenessRating");

	UCustomBotConfig_AggressivenessRating_Params params;
	params.cc = cc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.CustomBotConfig.TacticsRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FCustomConfiguration    cc                             (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UCustomBotConfig::STATIC_TacticsRating(const struct FCustomConfiguration& cc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.TacticsRating");

	UCustomBotConfig_TacticsRating_Params params;
	params.cc = cc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.CustomBotConfig.AgilityRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FCustomConfiguration    cc                             (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UCustomBotConfig::STATIC_AgilityRating(const struct FCustomConfiguration& cc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.AgilityRating");

	UCustomBotConfig_AgilityRating_Params params;
	params.cc = cc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.CustomBotConfig.AccuracyRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FCustomConfiguration    cc                             (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UCustomBotConfig::STATIC_AccuracyRating(const struct FCustomConfiguration& cc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.AccuracyRating");

	UCustomBotConfig_AccuracyRating_Params params;
	params.cc = cc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.CustomBotConfig.RatingModifier
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FString                 CharacterName                  (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UCustomBotConfig::STATIC_RatingModifier(const struct FString& CharacterName)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.RatingModifier");

	UCustomBotConfig_RatingModifier_Params params;
	params.CharacterName = CharacterName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.CustomBotConfig.GetFavoriteWeaponFor
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FCustomConfiguration    cc                             (Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UCustomBotConfig::STATIC_GetFavoriteWeaponFor(const struct FCustomConfiguration& cc)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.GetFavoriteWeaponFor");

	UCustomBotConfig_GetFavoriteWeaponFor_Params params;
	params.cc = cc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.CustomBotConfig.Customize
// (Defined, Static, Public)
// Parameters:
// class URosterEntry*            R                              (Parm)

void UCustomBotConfig::STATIC_Customize(class URosterEntry* R)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.CustomBotConfig.Customize");

	UCustomBotConfig_Customize_Params params;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.KillingSpreeMessage.ClientReceive
// (Defined, Simulated, Static, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AKillingSpreeMessage::STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.KillingSpreeMessage.ClientReceive");

	AKillingSpreeMessage_ClientReceive_Params params;
	params.P = P;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.KillingSpreeMessage.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AKillingSpreeMessage::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.KillingSpreeMessage.GetString");

	AKillingSpreeMessage_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.KillingSpreeMessage.GetRelatedString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AKillingSpreeMessage::STATIC_GetRelatedString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.KillingSpreeMessage.GetRelatedString");

	AKillingSpreeMessage_GetRelatedString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.KillingSpreeMessage.GetFontSize
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (Parm)
// class APlayerReplicationInfo*  RelatedPRI1                    (Parm)
// class APlayerReplicationInfo*  RelatedPRI2                    (Parm)
// class APlayerReplicationInfo*  LocalPlayer                    (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AKillingSpreeMessage::STATIC_GetFontSize(int Switch, class APlayerReplicationInfo* RelatedPRI1, class APlayerReplicationInfo* RelatedPRI2, class APlayerReplicationInfo* LocalPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.KillingSpreeMessage.GetFontSize");

	AKillingSpreeMessage_GetFontSize_Params params;
	params.Switch = Switch;
	params.RelatedPRI1 = RelatedPRI1;
	params.RelatedPRI2 = RelatedPRI2;
	params.LocalPlayer = LocalPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.AssignSquadResponsibility
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::AssignSquadResponsibility(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.AssignSquadResponsibility");

	ADMSquad_AssignSquadResponsibility_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.FriendlyToward
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::FriendlyToward(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.FriendlyToward");

	ADMSquad_FriendlyToward_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.SetEnemy
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// class APawn*                   NewEnemy                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::SetEnemy(class ABot* B, class APawn* NewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.SetEnemy");

	ADMSquad_SetEnemy_Params params;
	params.B = B;
	params.NewEnemy = NewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.GetOrders
// (Defined, Public)
// Parameters:
// struct FName                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FName ADMSquad::GetOrders()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.GetOrders");

	ADMSquad_GetOrders_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.BeDevious
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::BeDevious()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.BeDevious");

	ADMSquad_BeDevious_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.NearFormationCenter
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::NearFormationCenter(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.NearFormationCenter");

	ADMSquad_NearFormationCenter_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.WaitAtThisPosition
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::WaitAtThisPosition(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.WaitAtThisPosition");

	ADMSquad_WaitAtThisPosition_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.CheckSquadObjectives
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::CheckSquadObjectives(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.CheckSquadObjectives");

	ADMSquad_CheckSquadObjectives_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.ShouldDeferTo
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::ShouldDeferTo(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.ShouldDeferTo");

	ADMSquad_ShouldDeferTo_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.RemoveBot
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ADMSquad::RemoveBot(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.RemoveBot");

	ADMSquad_RemoveBot_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DMSquad.AddBot
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ADMSquad::AddBot(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.AddBot");

	ADMSquad_AddBot_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DMSquad.IsDefending
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMSquad::IsDefending(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.IsDefending");

	ADMSquad_IsDefending_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMSquad.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void ADMSquad::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.DisplayDebug");

	ADMSquad_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function UnrealGame.DMSquad.AssignCombo
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void ADMSquad::AssignCombo(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMSquad.AssignCombo");

	ADMSquad_AssignCombo_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.WeaponDamageType.GetWeaponClass
// (Defined, Static, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AWeaponDamageType::STATIC_GetWeaponClass()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.WeaponDamageType.GetWeaponClass");

	AWeaponDamageType_GetWeaponClass_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.LevelGameRules.UpdateGame
// (Defined, Public)
// Parameters:
// class AGameInfo*               G                              (Parm)

void ALevelGameRules::UpdateGame(class AGameInfo* G)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.LevelGameRules.UpdateGame");

	ALevelGameRules_UpdateGame_Params params;
	params.G = G;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.LevelGameRules.PreBeginPlay
// (Defined, Public)

void ALevelGameRules::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.LevelGameRules.PreBeginPlay");

	ALevelGameRules_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayerChatManager.Count
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealPlayerChatManager::Count()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.Count");

	AUnrealPlayerChatManager_Count_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.IsLocal
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::IsLocal()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.IsLocal");

	AUnrealPlayerChatManager_IsLocal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.IsValid
// (Defined, Simulated, Protected)
// Parameters:
// int                            i                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::IsValid(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.IsValid");

	AUnrealPlayerChatManager_IsValid_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.GetHashIndex
// (Defined, Simulated, Protected)
// Parameters:
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealPlayerChatManager::GetHashIndex(const struct FString& PlayerHash)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.GetHashIndex");

	AUnrealPlayerChatManager_GetHashIndex_Params params;
	params.PlayerHash = PlayerHash;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.GetIDIndex
// (Defined, Simulated, Protected)
// Parameters:
// int                            PlayerID                       (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealPlayerChatManager::GetIDIndex(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.GetIDIndex");

	AUnrealPlayerChatManager_GetIDIndex_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.GetPlayerHash
// (Defined, Simulated, Protected)
// Parameters:
// int                            PlayerID                       (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealPlayerChatManager::GetPlayerHash(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.GetPlayerHash");

	AUnrealPlayerChatManager_GetPlayerHash_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.ClientIsBanned
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::ClientIsBanned(const struct FString& PlayerHash)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.ClientIsBanned");

	AUnrealPlayerChatManager_ClientIsBanned_Params params;
	params.PlayerHash = PlayerHash;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.GetPlayerRestriction
// (Defined, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)
// unsigned char                  ReturnValue                    (Parm, OutParm, ReturnParm)

unsigned char AUnrealPlayerChatManager::GetPlayerRestriction(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.GetPlayerRestriction");

	AUnrealPlayerChatManager_GetPlayerRestriction_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.UnMergeRestriction
// (Defined, Simulated, Public)
// Parameters:
// int                            Index                          (Parm)
// unsigned char                  NewType                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::UnMergeRestriction(int Index, unsigned char NewType)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.UnMergeRestriction");

	AUnrealPlayerChatManager_UnMergeRestriction_Params params;
	params.Index = Index;
	params.NewType = NewType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.MergeRestriction
// (Defined, Simulated, Public)
// Parameters:
// int                            Index                          (Parm)
// unsigned char                  NewType                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::MergeRestriction(int Index, unsigned char NewType)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.MergeRestriction");

	AUnrealPlayerChatManager_MergeRestriction_Params params;
	params.Index = Index;
	params.NewType = NewType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.ClearRestrictionID
// (Defined, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)
// unsigned char                  Type                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::ClearRestrictionID(int PlayerID, unsigned char Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.ClearRestrictionID");

	AUnrealPlayerChatManager_ClearRestrictionID_Params params;
	params.PlayerID = PlayerID;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.ClearRestriction
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// unsigned char                  Type                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::ClearRestriction(const struct FString& PlayerHash, unsigned char Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.ClearRestriction");

	AUnrealPlayerChatManager_ClearRestriction_Params params;
	params.PlayerHash = PlayerHash;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.AddRestrictionID
// (Defined, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)
// unsigned char                  Type                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::AddRestrictionID(int PlayerID, unsigned char Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.AddRestrictionID");

	AUnrealPlayerChatManager_AddRestrictionID_Params params;
	params.PlayerID = PlayerID;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.AddRestriction
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// unsigned char                  Type                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::AddRestriction(const struct FString& PlayerHash, unsigned char Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.AddRestriction");

	AUnrealPlayerChatManager_AddRestriction_Params params;
	params.PlayerHash = PlayerHash;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.SetRestrictionID
// (Defined, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)
// unsigned char                  Type                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::SetRestrictionID(int PlayerID, unsigned char Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.SetRestrictionID");

	AUnrealPlayerChatManager_SetRestrictionID_Params params;
	params.PlayerID = PlayerID;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.SetRestriction
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// unsigned char                  Type                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::SetRestriction(const struct FString& PlayerHash, unsigned char Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.SetRestriction");

	AUnrealPlayerChatManager_SetRestriction_Params params;
	params.PlayerHash = PlayerHash;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.IsBanned
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::IsBanned(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.IsBanned");

	AUnrealPlayerChatManager_IsBanned_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.AcceptVoice
// (Defined, Event, Public)
// Parameters:
// class APlayerReplicationInfo*  SenderPRI                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::AcceptVoice(class APlayerReplicationInfo* SenderPRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.AcceptVoice");

	AUnrealPlayerChatManager_AcceptVoice_Params params;
	params.SenderPRI = SenderPRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.AcceptSpeech
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  SenderPRI                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::AcceptSpeech(class APlayerReplicationInfo* SenderPRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.AcceptSpeech");

	AUnrealPlayerChatManager_AcceptSpeech_Params params;
	params.SenderPRI = SenderPRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.AcceptText
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Sender                         (Parm)
// struct FString                 Msg                            (Parm, OutParm, NeedCtorLink)
// struct FName                   Type                           (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::AcceptText(class APlayerReplicationInfo* Sender, const struct FName& Type, struct FString* Msg)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.AcceptText");

	AUnrealPlayerChatManager_AcceptText_Params params;
	params.Sender = Sender;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Msg != nullptr)
		*Msg = params.Msg;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.UnTrackPlayer
// (Defined, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)

void AUnrealPlayerChatManager::UnTrackPlayer(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.UnTrackPlayer");

	AUnrealPlayerChatManager_UnTrackPlayer_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayerChatManager.TrackNewPlayer
// (Defined, Simulated, Public)
// Parameters:
// int                            PlayerID                       (Parm)
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// struct FString                 PlayerAddress                  (Parm, NeedCtorLink)

void AUnrealPlayerChatManager::TrackNewPlayer(int PlayerID, const struct FString& PlayerHash, const struct FString& PlayerAddress)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.TrackNewPlayer");

	AUnrealPlayerChatManager_TrackNewPlayer_Params params;
	params.PlayerID = PlayerID;
	params.PlayerHash = PlayerHash;
	params.PlayerAddress = PlayerAddress;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayerChatManager.ReceiveBanInfo
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 S                              (Parm, NeedCtorLink)

void AUnrealPlayerChatManager::ReceiveBanInfo(const struct FString& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.ReceiveBanInfo");

	AUnrealPlayerChatManager_ReceiveBanInfo_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayerChatManager.StoreChatBan
// (Defined, Simulated, Protected)
// Parameters:
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// unsigned char                  Restriction                    (Parm)

void AUnrealPlayerChatManager::StoreChatBan(const struct FString& PlayerHash, unsigned char Restriction)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.StoreChatBan");

	AUnrealPlayerChatManager_StoreChatBan_Params params;
	params.PlayerHash = PlayerHash;
	params.Restriction = Restriction;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayerChatManager.LoadChatBan
// (Defined, Simulated, Protected)
// Parameters:
// struct FString                 PlayerHash                     (Parm, NeedCtorLink)
// unsigned char                  OutRestriction                 (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealPlayerChatManager::LoadChatBan(const struct FString& PlayerHash, unsigned char* OutRestriction)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.LoadChatBan");

	AUnrealPlayerChatManager_LoadChatBan_Params params;
	params.PlayerHash = PlayerHash;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (OutRestriction != nullptr)
		*OutRestriction = params.OutRestriction;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealPlayerChatManager.LogChatRestriction
// (Defined, Simulated, Public)
// Parameters:
// int                            i                              (Parm)

void AUnrealPlayerChatManager::LogChatRestriction(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.LogChatRestriction");

	AUnrealPlayerChatManager_LogChatRestriction_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealPlayerChatManager.ChatDebug
// (Defined, Simulated, Public)

void AUnrealPlayerChatManager::ChatDebug()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealPlayerChatManager.ChatDebug");

	AUnrealPlayerChatManager_ChatDebug_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UseObjective.TellBotHowToDisable
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUseObjective::TellBotHowToDisable(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UseObjective.TellBotHowToDisable");

	AUseObjective_TellBotHowToDisable_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UseObjective.Touch
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AUseObjective::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UseObjective.Touch");

	AUseObjective_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UseObjective.UsedBy
// (Defined, Event, Public)
// Parameters:
// class APawn*                   User                           (Parm)

void AUseObjective::UsedBy(class APawn* User)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UseObjective.UsedBy");

	AUseObjective_UsedBy_Params params;
	params.User = User;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.WillowWhisp.StartNextPath
// (Defined, Simulated, Public)

void AWillowWhisp::StartNextPath()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.WillowWhisp.StartNextPath");

	AWillowWhisp_StartNextPath_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.WillowWhisp.PostNetBeginPlay
// (Defined, Simulated, Public)

void AWillowWhisp::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.WillowWhisp.PostNetBeginPlay");

	AWillowWhisp_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.WillowWhisp.PostBeginPlay
// (Defined, Public)

void AWillowWhisp::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.WillowWhisp.PostBeginPlay");

	AWillowWhisp_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.DMMutator.GetServerDetails
// (Defined, Public)
// Parameters:
// struct FServerResponseLine     ServerState                    (Parm, OutParm, NeedCtorLink)

void ADMMutator::GetServerDetails(struct FServerResponseLine* ServerState)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMMutator.GetServerDetails");

	ADMMutator_GetServerDetails_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ServerState != nullptr)
		*ServerState = params.ServerState;
}


// Function UnrealGame.DMMutator.AlwaysKeep
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMMutator::AlwaysKeep(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMMutator.AlwaysKeep");

	ADMMutator_AlwaysKeep_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.DMMutator.MutatorIsAllowed
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADMMutator::MutatorIsAllowed()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.DMMutator.MutatorIsAllowed");

	ADMMutator_MutatorIsAllowed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.PickupMessagePlus.ClientReceive
// (Defined, Simulated, Static, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void APickupMessagePlus::STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.PickupMessagePlus.ClientReceive");

	APickupMessagePlus_ClientReceive_Params params;
	params.P = P;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SnipingVolume.Touch
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void ASnipingVolume::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SnipingVolume.Touch");

	ASnipingVolume_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.SnipingVolume.AddDefensePoint
// (Defined, Public)
// Parameters:
// class AUnrealScriptedSequence* S                              (Parm)

void ASnipingVolume::AddDefensePoint(class AUnrealScriptedSequence* S)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SnipingVolume.AddDefensePoint");

	ASnipingVolume_AddDefensePoint_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamVoiceReplicationInfo.GetOpposingTeamChannel
// (Defined, Simulated, Public)
// Parameters:
// int                            ChannelIndex                   (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamVoiceReplicationInfo::GetOpposingTeamChannel(int ChannelIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.GetOpposingTeamChannel");

	ATeamVoiceReplicationInfo_GetOpposingTeamChannel_Params params;
	params.ChannelIndex = ChannelIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.GetTitle
// (Defined, Simulated, Public)
// Parameters:
// class AVoiceChatRoom*          Room                           (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ATeamVoiceReplicationInfo::GetTitle(class AVoiceChatRoom* Room)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.GetTitle");

	ATeamVoiceReplicationInfo_GetTitle_Params params;
	params.Room = Room;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.NotifyTeamChange
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// int                            TeamIndex                      (Parm)

void ATeamVoiceReplicationInfo::NotifyTeamChange(class APlayerReplicationInfo* PRI, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.NotifyTeamChange");

	ATeamVoiceReplicationInfo_NotifyTeamChange_Params params;
	params.PRI = PRI;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamVoiceReplicationInfo.JoinChannelAt
// (Defined, Public)
// Parameters:
// int                            ChannelIndex                   (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)
// struct FString                 Password                       (Parm, NeedCtorLink)
// TEnumAsByte<EJoinChatResult>   ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<EJoinChatResult> ATeamVoiceReplicationInfo::JoinChannelAt(int ChannelIndex, class APlayerReplicationInfo* PRI, const struct FString& Password)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.JoinChannelAt");

	ATeamVoiceReplicationInfo_JoinChannelAt_Params params;
	params.ChannelIndex = ChannelIndex;
	params.PRI = PRI;
	params.Password = Password;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.JoinChannel
// (Defined, Public)
// Parameters:
// struct FString                 ChannelTitle                   (Parm, NeedCtorLink)
// class APlayerReplicationInfo*  PRI                            (Parm)
// struct FString                 Password                       (Parm, NeedCtorLink)
// TEnumAsByte<EJoinChatResult>   ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<EJoinChatResult> ATeamVoiceReplicationInfo::JoinChannel(const struct FString& ChannelTitle, class APlayerReplicationInfo* PRI, const struct FString& Password)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.JoinChannel");

	ATeamVoiceReplicationInfo_JoinChannel_Params params;
	params.ChannelTitle = ChannelTitle;
	params.PRI = PRI;
	params.Password = Password;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.GetChannel
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ChatRoomName                   (Parm, NeedCtorLink)
// int                            TeamIndex                      (OptionalParm, Parm)
// class AVoiceChatRoom*          ReturnValue                    (Parm, OutParm, ReturnParm)

class AVoiceChatRoom* ATeamVoiceReplicationInfo::GetChannel(const struct FString& ChatRoomName, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.GetChannel");

	ATeamVoiceReplicationInfo_GetChannel_Params params;
	params.ChatRoomName = ChatRoomName;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.GetChannelIndex
// (Defined, Simulated, Event, Public)
// Parameters:
// struct FString                 ChannelTitle                   (Parm, NeedCtorLink)
// int                            TeamIndex                      (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamVoiceReplicationInfo::GetChannelIndex(const struct FString& ChannelTitle, int TeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.GetChannelIndex");

	ATeamVoiceReplicationInfo_GetChannelIndex_Params params;
	params.ChannelTitle = ChannelTitle;
	params.TeamIndex = TeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.GetMask
// (Defined, Simulated, Public)
// Parameters:
// class AVoiceChatRoom*          Room                           (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATeamVoiceReplicationInfo::GetMask(class AVoiceChatRoom* Room)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.GetMask");

	ATeamVoiceReplicationInfo_GetMask_Params params;
	params.Room = Room;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.SetMask
// (Defined, Public)
// Parameters:
// class AVoiceChatRoom*          Room                           (Parm)
// int                            NewMask                        (Parm)

void ATeamVoiceReplicationInfo::SetMask(class AVoiceChatRoom* Room, int NewMask)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.SetMask");

	ATeamVoiceReplicationInfo_SetMask_Params params;
	params.Room = Room;
	params.NewMask = NewMask;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TeamVoiceReplicationInfo.ValidRoom
// (Defined, Simulated, Public)
// Parameters:
// class AVoiceChatRoom*          Room                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATeamVoiceReplicationInfo::ValidRoom(class AVoiceChatRoom* Room)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.ValidRoom");

	ATeamVoiceReplicationInfo_ValidRoom_Params params;
	params.Room = Room;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamVoiceReplicationInfo.InitChannels
// (Defined, Simulated, Event, Public)

void ATeamVoiceReplicationInfo::InitChannels()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamVoiceReplicationInfo.InitChannels");

	ATeamVoiceReplicationInfo_InitChannels_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatRoom.RemoveChild
// (Defined, Simulated, Public)
// Parameters:
// class AVoiceChatRoom*          Child                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::RemoveChild(class AVoiceChatRoom* Child)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.RemoveChild");

	AUnrealChatRoom_RemoveChild_Params params;
	params.Child = Child;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.AddChild
// (Defined, Simulated, Public)
// Parameters:
// class AVoiceChatRoom*          NewChild                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::AddChild(class AVoiceChatRoom* NewChild)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.AddChild");

	AUnrealChatRoom_AddChild_Params params;
	params.NewChild = NewChild;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.SetMask
// (Defined, Public)
// Parameters:
// int                            NewMask                        (Parm)

void AUnrealChatRoom::SetMask(int NewMask)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.SetMask");

	AUnrealChatRoom_SetMask_Params params;
	params.NewMask = NewMask;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatRoom.SetTeam
// (Defined, Public)
// Parameters:
// int                            NewTeam                        (Parm)

void AUnrealChatRoom::SetTeam(int NewTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.SetTeam");

	AUnrealChatRoom_SetTeam_Params params;
	params.NewTeam = NewTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatRoom.IsBanned
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::IsBanned(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.IsBanned");

	AUnrealChatRoom_IsBanned_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.RemoveMember
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)

void AUnrealChatRoom::RemoveMember(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.RemoveMember");

	AUnrealChatRoom_RemoveMember_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatRoom.AddMember
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)

void AUnrealChatRoom::AddMember(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.AddMember");

	AUnrealChatRoom_AddMember_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatRoom.LeaveChannel
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  LeavingPRI                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::LeaveChannel(class APlayerReplicationInfo* LeavingPRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.LeaveChannel");

	AUnrealChatRoom_LeaveChannel_Params params;
	params.LeavingPRI = LeavingPRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.JoinChannel
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  NewPRI                         (Parm)
// struct FString                 InPassword                     (Parm, NeedCtorLink)
// TEnumAsByte<EJoinChatResult>   ReturnValue                    (Parm, OutParm, ReturnParm)

TEnumAsByte<EJoinChatResult> AUnrealChatRoom::JoinChannel(class APlayerReplicationInfo* NewPRI, const struct FString& InPassword)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.JoinChannel");

	AUnrealChatRoom_JoinChannel_Params params;
	params.NewPRI = NewPRI;
	params.InPassword = InPassword;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.CanJoinChannel
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::CanJoinChannel(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.CanJoinChannel");

	AUnrealChatRoom_CanJoinChannel_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.IsMember
// (Defined, Simulated, Event, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           bNoCascade                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::IsMember(class APlayerReplicationInfo* PRI, bool bNoCascade)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.IsMember");

	AUnrealChatRoom_IsMember_Params params;
	params.PRI = PRI;
	params.bNoCascade = bNoCascade;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.IsFull
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::IsFull()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.IsFull");

	AUnrealChatRoom_IsFull_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.Count
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealChatRoom::Count()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.Count");

	AUnrealChatRoom_Count_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.IsPrivateChannel
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::IsPrivateChannel()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.IsPrivateChannel");

	AUnrealChatRoom_IsPrivateChannel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.IsPublicChannel
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealChatRoom::IsPublicChannel()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.IsPublicChannel");

	AUnrealChatRoom_IsPublicChannel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.GetMembers
// (Defined, Simulated, Public)
// Parameters:
// TArray<class APlayerReplicationInfo*> ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

TArray<class APlayerReplicationInfo*> AUnrealChatRoom::GetMembers()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.GetMembers");

	AUnrealChatRoom_GetMembers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.GetPassword
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealChatRoom::GetPassword()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.GetPassword");

	AUnrealChatRoom_GetPassword_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.GetTeam
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealChatRoom::GetTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.GetTeam");

	AUnrealChatRoom_GetTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.GetTitle
// (Defined, Simulated, Public)
// Parameters:
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AUnrealChatRoom::GetTitle()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.GetTitle");

	AUnrealChatRoom_GetTitle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.GetMask
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AUnrealChatRoom::GetMask()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.GetMask");

	AUnrealChatRoom_GetMask_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealChatRoom.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AUnrealChatRoom::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.PostNetBeginPlay");

	AUnrealChatRoom_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatRoom.Timer
// (Defined, Simulated, Event, Public)

void AUnrealChatRoom::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.Timer");

	AUnrealChatRoom_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealChatRoom.SetGRI
// (Defined, Simulated, Public)
// Parameters:
// class AGameReplicationInfo*    InGRI                          (Parm)

void AUnrealChatRoom::SetGRI(class AGameReplicationInfo* InGRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealChatRoom.SetGRI");

	AUnrealChatRoom_SetGRI_Params params;
	params.InGRI = InGRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.RemoveTouchingPlayer
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwFlagObjectiveBase::RemoveTouchingPlayer(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.RemoveTouchingPlayer");

	AwFlagObjectiveBase_RemoveTouchingPlayer_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.AddNewTouchingPlayer
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwFlagObjectiveBase::AddNewTouchingPlayer(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.AddNewTouchingPlayer");

	AwFlagObjectiveBase_AddNewTouchingPlayer_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.PlayerToucherDied
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwFlagObjectiveBase::PlayerToucherDied(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.PlayerToucherDied");

	AwFlagObjectiveBase_PlayerToucherDied_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.CheckObjectiveProgress
// (Defined, Simulated, Public)
// Parameters:
// int                            iTeamIndex                     (Parm)

void AwFlagObjectiveBase::CheckObjectiveProgress(int iTeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.CheckObjectiveProgress");

	AwFlagObjectiveBase_CheckObjectiveProgress_Params params;
	params.iTeamIndex = iTeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.ResetCapture
// (Defined, Public)

void AwFlagObjectiveBase::ResetCapture()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.ResetCapture");

	AwFlagObjectiveBase_ResetCapture_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.Reset
// (Defined, Public)

void AwFlagObjectiveBase::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.Reset");

	AwFlagObjectiveBase_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.UnTouch
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwFlagObjectiveBase::UnTouch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.UnTouch");

	AwFlagObjectiveBase_UnTouch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.Touch
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwFlagObjectiveBase::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.Touch");

	AwFlagObjectiveBase_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.RecoverCapturing
// (Defined, Public)

void AwFlagObjectiveBase::RecoverCapturing()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.RecoverCapturing");

	AwFlagObjectiveBase_RecoverCapturing_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.SetActiveTeam
// (Defined, Public)
// Parameters:
// int                            iTeam                          (Parm)

void AwFlagObjectiveBase::SetActiveTeam(int iTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.SetActiveTeam");

	AwFlagObjectiveBase_SetActiveTeam_Params params;
	params.iTeam = iTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.BeginPlay
// (Defined, Simulated, Event, Public)

void AwFlagObjectiveBase::BeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.BeginPlay");

	AwFlagObjectiveBase_BeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.OnUnTouch
// (Public, Delegate)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwFlagObjectiveBase::OnUnTouch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.OnUnTouch");

	AwFlagObjectiveBase_OnUnTouch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.wFlagObjectiveBase.OnTouch
// (Public, Delegate)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwFlagObjectiveBase::OnTouch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.wFlagObjectiveBase.OnTouch");

	AwFlagObjectiveBase_OnTouch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.UnrealTeamChatRoom.NotifyTeamChange
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// int                            NewTeamIndex                   (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamChatRoom::NotifyTeamChange(class APlayerReplicationInfo* PRI, int NewTeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamChatRoom.NotifyTeamChange");

	AUnrealTeamChatRoom_NotifyTeamChange_Params params;
	params.PRI = PRI;
	params.NewTeamIndex = NewTeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamChatRoom.CanJoinChannel
// (Defined, Simulated, Public)
// Parameters:
// class APlayerReplicationInfo*  PRI                            (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamChatRoom::CanJoinChannel(class APlayerReplicationInfo* PRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamChatRoom.CanJoinChannel");

	AUnrealTeamChatRoom_CanJoinChannel_Params params;
	params.PRI = PRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealTeamChatRoom.IsTeamChannel
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AUnrealTeamChatRoom::IsTeamChannel()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealTeamChatRoom.IsTeamChannel");

	AUnrealTeamChatRoom_IsTeamChannel_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.WillowWhispPath.StartNextPath
// (Defined, Simulated, Public)

void AWillowWhispPath::StartNextPath()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.WillowWhispPath.StartNextPath");

	AWillowWhispPath_StartNextPath_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.WillowWhispPath.PostNetBeginPlay
// (Defined, Simulated, Public)

void AWillowWhispPath::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.WillowWhispPath.PostNetBeginPlay");

	AWillowWhispPath_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.WillowWhispPath.PostBeginPlay
// (Defined, Public)

void AWillowWhispPath::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.WillowWhispPath.PostBeginPlay");

	AWillowWhispPath_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.StringMessagePlus.AssembleString
// (Defined, Static, Public)
// Parameters:
// class AHUD*                    myHUD                          (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// struct FString                 MessageString                  (OptionalParm, Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString AStringMessagePlus::STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const struct FString& MessageString)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.StringMessagePlus.AssembleString");

	AStringMessagePlus_AssembleString_Params params;
	params.myHUD = myHUD;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.MessageString = MessageString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SayMessagePlus.GetConsoleColor
// (Defined, Static, Public)
// Parameters:
// class APlayerReplicationInfo*  RelatedPRI_1                   (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor ASayMessagePlus::STATIC_GetConsoleColor(class APlayerReplicationInfo* RelatedPRI_1)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SayMessagePlus.GetConsoleColor");

	ASayMessagePlus_GetConsoleColor_Params params;
	params.RelatedPRI_1 = RelatedPRI_1;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SayMessagePlus.AssembleString
// (Defined, Static, Public)
// Parameters:
// class AHUD*                    myHUD                          (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// struct FString                 MessageString                  (OptionalParm, Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ASayMessagePlus::STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const struct FString& MessageString)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SayMessagePlus.AssembleString");

	ASayMessagePlus_AssembleString_Params params;
	params.myHUD = myHUD;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.MessageString = MessageString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.SayMessagePlus.RenderComplexMessage
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          XL                             (Parm, OutParm)
// float                          YL                             (Parm, OutParm)
// struct FString                 MessageString                  (OptionalParm, Parm, NeedCtorLink)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void ASayMessagePlus::STATIC_RenderComplexMessage(class UCanvas* Canvas, const struct FString& MessageString, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, float* XL, float* YL)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.SayMessagePlus.RenderComplexMessage");

	ASayMessagePlus_RenderComplexMessage_Params params;
	params.Canvas = Canvas;
	params.MessageString = MessageString;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (XL != nullptr)
		*XL = params.XL;
	if (YL != nullptr)
		*YL = params.YL;
}


// Function UnrealGame.TeamSayMessagePlus.AssembleString
// (Defined, Static, Public)
// Parameters:
// class AHUD*                    myHUD                          (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// struct FString                 MessageString                  (OptionalParm, Parm, NeedCtorLink)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString ATeamSayMessagePlus::STATIC_AssembleString(class AHUD* myHUD, int Switch, class APlayerReplicationInfo* RelatedPRI_1, const struct FString& MessageString)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamSayMessagePlus.AssembleString");

	ATeamSayMessagePlus_AssembleString_Params params;
	params.myHUD = myHUD;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.MessageString = MessageString;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TeamSayMessagePlus.RenderComplexMessage
// (Defined, Static, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          XL                             (Parm, OutParm)
// float                          YL                             (Parm, OutParm)
// struct FString                 MessageString                  (OptionalParm, Parm, NeedCtorLink)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void ATeamSayMessagePlus::STATIC_RenderComplexMessage(class UCanvas* Canvas, const struct FString& MessageString, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject, float* XL, float* YL)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TeamSayMessagePlus.RenderComplexMessage");

	ATeamSayMessagePlus_RenderComplexMessage_Params params;
	params.Canvas = Canvas;
	params.MessageString = MessageString;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (XL != nullptr)
		*XL = params.XL;
	if (YL != nullptr)
		*YL = params.YL;
}


// Function UnrealGame.PlayerNameMessage.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString APlayerNameMessage::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.PlayerNameMessage.GetString");

	APlayerNameMessage_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TurretController.GetWaitForTargetTime
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float ATurretController::GetWaitForTargetTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TurretController.GetWaitForTargetTime");

	ATurretController_GetWaitForTargetTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TurretController.IsTurretFiring
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATurretController::IsTurretFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TurretController.IsTurretFiring");

	ATurretController_IsTurretFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TurretController.IsTargetRelevant
// (Defined, Public)
// Parameters:
// class APawn*                   Target                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ATurretController::IsTargetRelevant(class APawn* Target)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TurretController.IsTargetRelevant");

	ATurretController_IsTargetRelevant_Params params;
	params.Target = Target;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TurretController.GetTeamNum
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int ATurretController::GetTeamNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TurretController.GetTeamNum");

	ATurretController_GetTeamNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.TurretController.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void ATurretController::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TurretController.Possess");

	ATurretController_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function UnrealGame.TurretController.AdjustAim
// (Defined, Public)
// Parameters:
// struct FFireProperties         FiredAmmunition                (Parm)
// struct FVector                 projStart                      (Parm)
// int                            AimError                       (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator ATurretController::AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.TurretController.AdjustAim");

	ATurretController_AdjustAim_Params params;
	params.FiredAmmunition = FiredAmmunition;
	params.projStart = projStart;
	params.AimError = AimError;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function UnrealGame.UnrealSecurity.ServerCallback
// (Defined, Net, NetReliable, Event, Public)
// Parameters:
// int                            SecType                        (Parm)
// struct FString                 Data                           (Parm, NeedCtorLink)

void AUnrealSecurity::ServerCallback(int SecType, const struct FString& Data)
{
	static auto fn = UObject::FindObject<UFunction>("Function UnrealGame.UnrealSecurity.ServerCallback");

	AUnrealSecurity_ServerCallback_Params params;
	params.SecType = SecType;
	params.Data = Data;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
