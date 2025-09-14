// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function WGame.wAILevel.ClearReferences
// (Defined, Public)

void AwAILevel::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.ClearReferences");

	AwAILevel_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.BotsLovePeace
// (Defined, Public)

void AwAILevel::BotsLovePeace()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.BotsLovePeace");

	AwAILevel_BotsLovePeace_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.ResetNames
// (Defined, Exec, Public)

void AwAILevel::ResetNames()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.ResetNames");

	AwAILevel_ResetNames_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.GetItemParamByGroupID
// (Defined, Public)
// Parameters:
// int                            GroupID                        (Parm)
// class UwNPCItemGroupParam*     ReturnValue                    (Parm, OutParm, ReturnParm)

class UwNPCItemGroupParam* AwAILevel::GetItemParamByGroupID(int GroupID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.GetItemParamByGroupID");

	AwAILevel_GetItemParamByGroupID_Params params;
	params.GroupID = GroupID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.GetName
// (Defined, Public)
// Parameters:
// int                            NameGroupID                    (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwAILevel::GetName(int NameGroupID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.GetName");

	AwAILevel_GetName_Params params;
	params.NameGroupID = NameGroupID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.KillBot
// (Defined, Public)
// Parameters:
// class AAIController*           Bot                            (Parm)

void AwAILevel::KillBot(class AAIController* Bot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.KillBot");

	AwAILevel_KillBot_Params params;
	params.Bot = Bot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.KillBots
// (Defined, Public)
// Parameters:
// int                            Num                            (Parm)

void AwAILevel::KillBots(int Num)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.KillBots");

	AwAILevel_KillBots_Params params;
	params.Num = Num;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.KillBotsTeam
// (Defined, Public)
// Parameters:
// int                            Num                            (Parm)
// int                            inTeam                         (Parm)

void AwAILevel::KillBotsTeam(int Num, int inTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.KillBotsTeam");

	AwAILevel_KillBotsTeam_Params params;
	params.Num = Num;
	params.inTeam = inTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.RegisterBot
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Bot                            (Parm)

void AwAILevel::RegisterBot(class AwAIBotBase* Bot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.RegisterBot");

	AwAILevel_RegisterBot_Params params;
	params.Bot = Bot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.GetNPCAction
// (Defined, Public)
// Parameters:
// int                            ActionGroupID                  (Parm)
// class UwNPCActions*            ReturnValue                    (Parm, OutParm, ReturnParm)

class UwNPCActions* AwAILevel::GetNPCAction(int ActionGroupID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.GetNPCAction");

	AwAILevel_GetNPCAction_Params params;
	params.ActionGroupID = ActionGroupID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.ActionExists
// (Defined, Public)
// Parameters:
// int                            ActionGroupID                  (Parm)
// string                         Action                         (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAILevel::ActionExists(int ActionGroupID, const string& Action)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.ActionExists");

	AwAILevel_ActionExists_Params params;
	params.ActionGroupID = ActionGroupID;
	params.Action = Action;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.GetNPCParam
// (Defined, Public)
// Parameters:
// int                            Grade                          (Parm)
// class UwNPCParam*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UwNPCParam* AwAILevel::GetNPCParam(int Grade)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.GetNPCParam");

	AwAILevel_GetNPCParam_Params params;
	params.Grade = Grade;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.GetNPCParamByNPCID
// (Defined, Public)
// Parameters:
// int                            NPCID                          (Parm)
// class UwNPCParam*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UwNPCParam* AwAILevel::GetNPCParamByNPCID(int NPCID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.GetNPCParamByNPCID");

	AwAILevel_GetNPCParamByNPCID_Params params;
	params.NPCID = NPCID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.UpdateInfluenceListScript
// (Defined, Public)

void AwAILevel::UpdateInfluenceListScript()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.UpdateInfluenceListScript");

	AwAILevel_UpdateInfluenceListScript_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.UpdateInfluenceList
// (Defined, Public)

void AwAILevel::UpdateInfluenceList()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.UpdateInfluenceList");

	AwAILevel_UpdateInfluenceList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.UpdateInfluenceListNative
// (Native, Public)

void AwAILevel::UpdateInfluenceListNative()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.UpdateInfluenceListNative");

	AwAILevel_UpdateInfluenceListNative_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.UpdateAllNavs
// (Defined, Public)

void AwAILevel::UpdateAllNavs()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.UpdateAllNavs");

	AwAILevel_UpdateAllNavs_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.GetRandomDestFromInfluence
// (Defined, Public)
// Parameters:
// byte                           inTeam                         (Parm)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwAILevel::GetRandomDestFromInfluence(byte inTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.GetRandomDestFromInfluence");

	AwAILevel_GetRandomDestFromInfluence_Params params;
	params.inTeam = inTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.GetRandomDestFromFrontLine
// (Defined, Public)
// Parameters:
// byte                           inTeam                         (Parm)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwAILevel::GetRandomDestFromFrontLine(byte inTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.GetRandomDestFromFrontLine");

	AwAILevel_GetRandomDestFromFrontLine_Params params;
	params.inTeam = inTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAILevel.InitFrontLine
// (Defined, Public)

void AwAILevel::InitFrontLine()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.InitFrontLine");

	AwAILevel_InitFrontLine_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.Tick
// (Defined, Event, Public)
// Parameters:
// float                          dt                             (Parm)

void AwAILevel::Tick(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.Tick");

	AwAILevel_Tick_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.InitInfluenceList
// (Defined, Public)

void AwAILevel::InitInfluenceList()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.InitInfluenceList");

	AwAILevel_InitInfluenceList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.Initialize
// (Defined, Public)

void AwAILevel::Initialize()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.Initialize");

	AwAILevel_Initialize_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAILevel.PreBeginPlay
// (Defined, Event, Public)

void AwAILevel::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAILevel.PreBeginPlay");

	AwAILevel_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wStateData.Create
// (Defined, Static, Public)
// Parameters:
// class UwStateData*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UwStateData* UwStateData::STATIC_Create()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wStateData.Create");

	UwStateData_Create_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.ShortMemory.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void UShortMemory::DisplayDebug(class UCanvas* C, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.DisplayDebug");

	UShortMemory_DisplayDebug_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.ShortMemory.SetOffsetCrouchHeight
// (Defined, Public)
// Parameters:
// float                          fHeight                        (Parm)

void UShortMemory::SetOffsetCrouchHeight(float fHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.SetOffsetCrouchHeight");

	UShortMemory_SetOffsetCrouchHeight_Params params;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.SetOffsetStandHeight
// (Defined, Public)
// Parameters:
// float                          fHeight                        (Parm)

void UShortMemory::SetOffsetStandHeight(float fHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.SetOffsetStandHeight");

	UShortMemory_SetOffsetStandHeight_Params params;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.GetByPawn
// (Defined, Event, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           createIfNotFound               (OptionalParm, Parm)
// class UMemoryItem*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UMemoryItem* UShortMemory::GetByPawn(class APawn* P, bool createIfNotFound)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.GetByPawn");

	UShortMemory_GetByPawn_Params params;
	params.P = P;
	params.createIfNotFound = createIfNotFound;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.ShortMemory.GetByPawn2
// (Defined, Event, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// class UMemoryItem*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UMemoryItem* UShortMemory::GetByPawn2(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.GetByPawn2");

	UShortMemory_GetByPawn2_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.ShortMemory.RemoveByPawn
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void UShortMemory::RemoveByPawn(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.RemoveByPawn");

	UShortMemory_RemoveByPawn_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.RemoveAll
// (Defined, Public)

void UShortMemory::RemoveAll()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.RemoveAll");

	UShortMemory_RemoveAll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.ClearReferences
// (Defined, Public)

void UShortMemory::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.ClearReferences");

	UShortMemory_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.RemoveMemoriesOverRetentionTime
// (Defined, Public)

void UShortMemory::RemoveMemoriesOverRetentionTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.RemoveMemoriesOverRetentionTime");

	UShortMemory_RemoveMemoriesOverRetentionTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.RememberByVision
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UShortMemory::RememberByVision(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.RememberByVision");

	UShortMemory_RememberByVision_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.ShortMemory.RememberBySound
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// float                          Loudness                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UShortMemory::RememberBySound(class APawn* P, float Loudness)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.RememberBySound");

	UShortMemory_RememberBySound_Params params;
	params.P = P;
	params.Loudness = Loudness;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.ShortMemory.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UShortMemory::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.NotifyDestroyed");

	UShortMemory_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.Update
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)

void UShortMemory::Update(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.Update");

	UShortMemory_Update_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ShortMemory.Create
// (Defined, Static, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// float                          inResponseTime                 (Parm)
// class UShortMemory*            ReturnValue                    (Parm, OutParm, ReturnParm)

class UShortMemory* UShortMemory::STATIC_Create(class AwAIBotBase* inOwner, float inResponseTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ShortMemory.Create");

	UShortMemory_Create_Params params;
	params.inOwner = inOwner;
	params.inResponseTime = inResponseTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.MemoryItem.SetOffsetCrouchHeight
// (Defined, Public)
// Parameters:
// float                          fHeight                        (Parm)

void UMemoryItem::SetOffsetCrouchHeight(float fHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.MemoryItem.SetOffsetCrouchHeight");

	UMemoryItem_SetOffsetCrouchHeight_Params params;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.MemoryItem.SetOffsetStandHeight
// (Defined, Public)
// Parameters:
// float                          fHeight                        (Parm)

void UMemoryItem::SetOffsetStandHeight(float fHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.MemoryItem.SetOffsetStandHeight");

	UMemoryItem_SetOffsetStandHeight_Params params;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.MemoryItem.ClearReferences
// (Defined, Public)

void UMemoryItem::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.MemoryItem.ClearReferences");

	UMemoryItem_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.MemoryItem.Update
// (Defined, Public)

void UMemoryItem::Update()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.MemoryItem.Update");

	UMemoryItem_Update_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.MemoryItem.AddKnownPosition
// (Defined, Public)
// Parameters:
// struct FVector                 V                              (Parm)
// float                          t                              (Parm)

void UMemoryItem::AddKnownPosition(const struct FVector& V, float t)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.MemoryItem.AddKnownPosition");

	UMemoryItem_AddKnownPosition_Params params;
	params.V = V;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.MemoryItem.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UMemoryItem::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.MemoryItem.NotifyDestroyed");

	UMemoryItem_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.MemoryItem.Create
// (Defined, Static, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class APawn*                   P                              (Parm)
// class UMemoryItem*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UMemoryItem* UMemoryItem::STATIC_Create(class AwAIBotBase* inOwner, class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.MemoryItem.Create");

	UMemoryItem_Create_Params params;
	params.inOwner = inOwner;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.DisplayDebug_Path
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwAIBotBase::DisplayDebug_Path(class UCanvas* C, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.DisplayDebug_Path");

	AwAIBotBase_DisplayDebug_Path_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wAIBotBase.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwAIBotBase::DisplayDebug(class UCanvas* C, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.DisplayDebug");

	AwAIBotBase_DisplayDebug_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wAIBotBase.SetFireYaw
// (Defined, Public)
// Parameters:
// int                            FireYaw                        (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAIBotBase::SetFireYaw(int FireYaw)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SetFireYaw");

	AwAIBotBase_SetFireYaw_Params params;
	params.FireYaw = FireYaw;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.AdjustAim
// (Defined, Public)
// Parameters:
// struct FFireProperties         FiredAmmunition                (Parm)
// struct FVector                 projStart                      (Parm)
// int                            AimError                       (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AwAIBotBase::AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.AdjustAim");

	AwAIBotBase_AdjustAim_Params params;
	params.FiredAmmunition = FiredAmmunition;
	params.projStart = projStart;
	params.AimError = AimError;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void AwAIBotBase::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.NotifyKilled");

	AwAIBotBase_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.HearNoise
// (Defined, Public)
// Parameters:
// float                          Loudness                       (Parm)
// class AActor*                  NoiseMaker                     (Parm)

void AwAIBotBase::HearNoise(float Loudness, class AActor* NoiseMaker)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.HearNoise");

	AwAIBotBase_HearNoise_Params params;
	params.Loudness = Loudness;
	params.NoiseMaker = NoiseMaker;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.SeeMonster
// (Defined, Event, Public)
// Parameters:
// class APawn*                   SeenPlayer                     (Parm)

void AwAIBotBase::SeeMonster(class APawn* SeenPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SeeMonster");

	AwAIBotBase_SeeMonster_Params params;
	params.SeenPlayer = SeenPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.SeePlayer
// (Defined, Event, Public)
// Parameters:
// class APawn*                   SeenPlayer                     (Parm)

void AwAIBotBase::SeePlayer(class APawn* SeenPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SeePlayer");

	AwAIBotBase_SeePlayer_Params params;
	params.SeenPlayer = SeenPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.NotifyVehicle
// (Defined, Public)
// Parameters:
// class AVehicle*                V                              (Parm)

void AwAIBotBase::NotifyVehicle(class AVehicle* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.NotifyVehicle");

	AwAIBotBase_NotifyVehicle_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.OnMemoryVisibleChanged
// (Defined, Public)

void AwAIBotBase::OnMemoryVisibleChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.OnMemoryVisibleChanged");

	AwAIBotBase_OnMemoryVisibleChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.HandleMessage
// (Defined, Public)
// Parameters:
// string                         Msg                            (Parm, NeedCtorLink)

void AwAIBotBase::HandleMessage(const string& Msg)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.HandleMessage");

	AwAIBotBase_HandleMessage_Params params;
	params.Msg = Msg;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.wClientFlash
// (Defined, Net, Public)
// Parameters:
// float                          fTime                          (Parm)

void AwAIBotBase::wClientFlash(float fTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.wClientFlash");

	AwAIBotBase_wClientFlash_Params params;
	params.fTime = fTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.IsProning
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIBotBase::IsProning()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.IsProning");

	AwAIBotBase_IsProning_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.TryProne
// (Defined, Public)

void AwAIBotBase::TryProne()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.TryProne");

	AwAIBotBase_TryProne_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.IsCrouching
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIBotBase::IsCrouching()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.IsCrouching");

	AwAIBotBase_IsCrouching_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.TryCrouch
// (Defined, Public)

void AwAIBotBase::TryCrouch()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.TryCrouch");

	AwAIBotBase_TryCrouch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.IsStandingUp
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIBotBase::IsStandingUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.IsStandingUp");

	AwAIBotBase_IsStandingUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.TryStandUp
// (Defined, Public)

void AwAIBotBase::TryStandUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.TryStandUp");

	AwAIBotBase_TryStandUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.IsSprinting
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIBotBase::IsSprinting()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.IsSprinting");

	AwAIBotBase_IsSprinting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.SetSprint
// (Defined, Public)
// Parameters:
// bool                           Value                          (Parm)

void AwAIBotBase::SetSprint(bool Value)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SetSprint");

	AwAIBotBase_SetSprint_Params params;
	params.Value = Value;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.PawnDied
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwAIBotBase::PawnDied(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.PawnDied");

	AwAIBotBase_PawnDied_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.ClientOnEndWaitingForStart
// (Defined, Net, NetReliable, Public)

void AwAIBotBase::ClientOnEndWaitingForStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.ClientOnEndWaitingForStart");

	AwAIBotBase_ClientOnEndWaitingForStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.ZeroExtraCost
// (Defined, Public)

void AwAIBotBase::ZeroExtraCost()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.ZeroExtraCost");

	AwAIBotBase_ZeroExtraCost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.CopyNavExtraCost
// (Defined, Public)

void AwAIBotBase::CopyNavExtraCost()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.CopyNavExtraCost");

	AwAIBotBase_CopyNavExtraCost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.UpdateNavDetourExtraCostScript
// (Defined, Public)
// Parameters:
// struct FVector                 S                              (Parm)
// struct FVector                 E                              (Parm)

void AwAIBotBase::UpdateNavDetourExtraCostScript(const struct FVector& S, const struct FVector& E)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.UpdateNavDetourExtraCostScript");

	AwAIBotBase_UpdateNavDetourExtraCostScript_Params params;
	params.S = S;
	params.E = E;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.UpdateNavDetourExtraCost
// (Defined, Public)
// Parameters:
// struct FVector                 S                              (Parm)
// struct FVector                 E                              (Parm)

void AwAIBotBase::UpdateNavDetourExtraCost(const struct FVector& S, const struct FVector& E)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.UpdateNavDetourExtraCost");

	AwAIBotBase_UpdateNavDetourExtraCost_Params params;
	params.S = S;
	params.E = E;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.UpdateNavDetourExtraCostNative
// (Native, Public)
// Parameters:
// struct FVector                 S                              (Parm)
// struct FVector                 E                              (Parm)

void AwAIBotBase::UpdateNavDetourExtraCostNative(const struct FVector& S, const struct FVector& E)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.UpdateNavDetourExtraCostNative");

	AwAIBotBase_UpdateNavDetourExtraCostNative_Params params;
	params.S = S;
	params.E = E;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.InitNavExtraCost
// (Defined, Public)

void AwAIBotBase::InitNavExtraCost()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.InitNavExtraCost");

	AwAIBotBase_InitNavExtraCost_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.Cmd
// (Defined, Exec, Public)
// Parameters:
// string                         P1                             (Parm, NeedCtorLink)
// string                         P2                             (Parm, NeedCtorLink)
// string                         p3                             (Parm, NeedCtorLink)
// string                         p4                             (Parm, NeedCtorLink)
// string                         p5                             (Parm, NeedCtorLink)

void AwAIBotBase::Cmd(const string& P1, const string& P2, const string& p3, const string& p4, const string& p5)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.Cmd");

	AwAIBotBase_Cmd_Params params;
	params.P1 = P1;
	params.P2 = P2;
	params.p3 = p3;
	params.p4 = p4;
	params.p5 = p5;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.EvaluateState
// (Defined, Public)
// Parameters:
// class UwStateData*             S                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwAIBotBase::EvaluateState(class UwStateData* S)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.EvaluateState");

	AwAIBotBase_EvaluateState_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.SetupWStateNative
// (Native, Public)
// Parameters:
// class UwStateData*             S                              (Parm, OutParm)

void AwAIBotBase::SetupWStateNative(class UwStateData** S)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SetupWStateNative");

	AwAIBotBase_SetupWStateNative_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (S != nullptr)
		*S = params.S;
}


// Function WGame.wAIBotBase.NotifyAddDefaultInventory
// (Defined, Public)

void AwAIBotBase::NotifyAddDefaultInventory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.NotifyAddDefaultInventory");

	AwAIBotBase_NotifyAddDefaultInventory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.NotifyAddInventory
// (Defined, Public)
// Parameters:
// class AInventory*              NewItem                        (Parm)

void AwAIBotBase::NotifyAddInventory(class AInventory* NewItem)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.NotifyAddInventory");

	AwAIBotBase_NotifyAddInventory_Params params;
	params.NewItem = NewItem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.SetupWeapons
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwAIBotBase::SetupWeapons(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SetupWeapons");

	AwAIBotBase_SetupWeapons_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.SetPawnClass
// (Net, Public)
// Parameters:
// string                         inClass                        (Parm, NeedCtorLink)
// string                         InCharacter                    (Parm, NeedCtorLink)

void AwAIBotBase::SetPawnClass(const string& inClass, const string& InCharacter)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SetPawnClass");

	AwAIBotBase_SetPawnClass_Params params;
	params.inClass = inClass;
	params.InCharacter = InCharacter;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.SetName
// (Defined, Public)
// Parameters:
// class UwNPCParam*              Param                          (Parm)

void AwAIBotBase::SetName(class UwNPCParam* Param)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.SetName");

	AwAIBotBase_SetName_Params params;
	params.Param = Param;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.InitBot
// (Defined, Public)
// Parameters:
// int                            Grade                          (Parm)

void AwAIBotBase::InitBot(int Grade)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.InitBot");

	AwAIBotBase_InitBot_Params params;
	params.Grade = Grade;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.ClearReferences
// (Defined, Public)

void AwAIBotBase::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.ClearReferences");

	AwAIBotBase_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBotBase.WeaponFireAgain
// (Defined, Public)
// Parameters:
// float                          RefireRate                     (Parm)
// bool                           bFinishedFire                  (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIBotBase::WeaponFireAgain(float RefireRate, bool bFinishedFire)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.WeaponFireAgain");

	AwAIBotBase_WeaponFireAgain_Params params;
	params.RefireRate = RefireRate;
	params.bFinishedFire = bFinishedFire;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBotBase.ReadyToMeleeAttack
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIBotBase::ReadyToMeleeAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBotBase.ReadyToMeleeAttack");

	AwAIBotBase_ReadyToMeleeAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetMutatorClasses
// (Defined, Simulated, Static, Public)
// Parameters:
// string[]                       MutClassNames                  (OptionalParm, Parm, NeedCtorLink)
// class UClass*[]                ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

class UClass*[] UwUtil::STATIC_GetMutatorClasses(string[] MutClassNames)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetMutatorClasses");

	UwUtil_GetMutatorClasses_Params params;
	params.MutClassNames = MutClassNames;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetTeamInfoSalaryFor
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class AUnrealTeamInfo*         UT                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_GetTeamInfoSalaryFor(class AUnrealTeamInfo* UT, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetTeamInfoSalaryFor");

	UwUtil_GetTeamInfoSalaryFor_Params params;
	params.UT = UT;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetTeamSalaryFor
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class UGameProfile*            GP                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_GetTeamSalaryFor(class UGameProfile* GP, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetTeamSalaryFor");

	UwUtil_GetTeamSalaryFor_Params params;
	params.GP = GP;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamArrayTacticsRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// string[]                       Players                        (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamArrayTacticsRating(string[] Players)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamArrayTacticsRating");

	UwUtil_TeamArrayTacticsRating_Params params;
	params.Players = Players;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamInfoTacticsRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class AUnrealTeamInfo*         UT                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamInfoTacticsRating(class AUnrealTeamInfo* UT, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamInfoTacticsRating");

	UwUtil_TeamInfoTacticsRating_Params params;
	params.UT = UT;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamTacticsRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class UGameProfile*            GP                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamTacticsRating(class UGameProfile* GP, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamTacticsRating");

	UwUtil_TeamTacticsRating_Params params;
	params.GP = GP;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamArrayAgilityRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// string[]                       Players                        (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamArrayAgilityRating(string[] Players)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamArrayAgilityRating");

	UwUtil_TeamArrayAgilityRating_Params params;
	params.Players = Players;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamInfoAgilityRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class AUnrealTeamInfo*         UT                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamInfoAgilityRating(class AUnrealTeamInfo* UT, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamInfoAgilityRating");

	UwUtil_TeamInfoAgilityRating_Params params;
	params.UT = UT;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamAgilityRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class UGameProfile*            GP                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamAgilityRating(class UGameProfile* GP, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamAgilityRating");

	UwUtil_TeamAgilityRating_Params params;
	params.GP = GP;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamArrayAggressivenessRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// string[]                       Players                        (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamArrayAggressivenessRating(string[] Players)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamArrayAggressivenessRating");

	UwUtil_TeamArrayAggressivenessRating_Params params;
	params.Players = Players;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamInfoAggressivenessRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class AUnrealTeamInfo*         UT                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamInfoAggressivenessRating(class AUnrealTeamInfo* UT, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamInfoAggressivenessRating");

	UwUtil_TeamInfoAggressivenessRating_Params params;
	params.UT = UT;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamAggressivenessRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class UGameProfile*            GP                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamAggressivenessRating(class UGameProfile* GP, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamAggressivenessRating");

	UwUtil_TeamAggressivenessRating_Params params;
	params.GP = GP;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamArrayAccuracyRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// string[]                       Players                        (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamArrayAccuracyRating(string[] Players)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamArrayAccuracyRating");

	UwUtil_TeamArrayAccuracyRating_Params params;
	params.Players = Players;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamInfoAccuracyRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class AUnrealTeamInfo*         UT                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamInfoAccuracyRating(class AUnrealTeamInfo* UT, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamInfoAccuracyRating");

	UwUtil_TeamInfoAccuracyRating_Params params;
	params.UT = UT;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TeamAccuracyRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// class UGameProfile*            GP                             (Parm)
// int                            lineupsize                     (OptionalParm, Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TeamAccuracyRating(class UGameProfile* GP, int lineupsize)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TeamAccuracyRating");

	UwUtil_TeamAccuracyRating_Params params;
	params.GP = GP;
	params.lineupsize = lineupsize;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.AggressivenessRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FPlayerRecord           PRE                            (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_AggressivenessRating(const struct FPlayerRecord& PRE)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.AggressivenessRating");

	UwUtil_AggressivenessRating_Params params;
	params.PRE = PRE;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.TacticsRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FPlayerRecord           PRE                            (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_TacticsRating(const struct FPlayerRecord& PRE)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.TacticsRating");

	UwUtil_TacticsRating_Params params;
	params.PRE = PRE;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.AgilityRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FPlayerRecord           PRE                            (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_AgilityRating(const struct FPlayerRecord& PRE)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.AgilityRating");

	UwUtil_AgilityRating_Params params;
	params.PRE = PRE;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.AccuracyRating
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FPlayerRecord           PRE                            (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_AccuracyRating(const struct FPlayerRecord& PRE)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.AccuracyRating");

	UwUtil_AccuracyRating_Params params;
	params.PRE = PRE;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.RatingModifier
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// string                         CharacterName                  (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_RatingModifier(const string& CharacterName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.RatingModifier");

	UwUtil_RatingModifier_Params params;
	params.CharacterName = CharacterName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetFavoriteWeaponFor
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FPlayerRecord           PRE                            (Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UwUtil::STATIC_GetFavoriteWeaponFor(const struct FPlayerRecord& PRE)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetFavoriteWeaponFor");

	UwUtil_GetFavoriteWeaponFor_Params params;
	params.PRE = PRE;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetSalaryFor
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// struct FPlayerRecord           PRE                            (Parm, NeedCtorLink)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwUtil::STATIC_GetSalaryFor(const struct FPlayerRecord& PRE)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetSalaryFor");

	UwUtil_GetSalaryFor_Params params;
	params.PRE = PRE;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.FindPlayerRecord
// (Final, Defined, Simulated, Static, Public)
// Parameters:
// string                         CharName                       (Parm, NeedCtorLink)
// struct FPlayerRecord           ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FPlayerRecord UwUtil::STATIC_FindPlayerRecord(const string& CharName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.FindPlayerRecord");

	UwUtil_FindPlayerRecord_Params params;
	params.CharName = CharName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetMutatorList
// (Final, Defined, Static, Public)
// Parameters:
// struct UwUtil_FMutatorRecord[] MutatorRecords                 (Parm, NeedCtorLink)

void UwUtil::STATIC_GetMutatorList(struct UwUtil_FMutatorRecord[] MutatorRecords)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetMutatorList");

	UwUtil_GetMutatorList_Params params;
	params.MutatorRecords = MutatorRecords;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wUtil.LoadDecoText
// (Final, Native, Static, Public)
// Parameters:
// string                         PackageName                    (Parm, NeedCtorLink)
// string                         DecoTextName                   (Parm, NeedCtorLink)
// int                            ColumnCount                    (OptionalParm, Parm)
// class UDecoText*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UDecoText* UwUtil::STATIC_LoadDecoText(const string& PackageName, const string& DecoTextName, int ColumnCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.LoadDecoText");

	UwUtil_LoadDecoText_Params params;
	params.PackageName = PackageName;
	params.DecoTextName = DecoTextName;
	params.ColumnCount = ColumnCount;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.FindUPLPlayerRecord
// (Final, Simulated, Native, Static, Public)
// Parameters:
// string                         CharName                       (Parm, NeedCtorLink)
// struct FPlayerRecord           ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FPlayerRecord UwUtil::STATIC_FindUPLPlayerRecord(const string& CharName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.FindUPLPlayerRecord");

	UwUtil_FindUPLPlayerRecord_Params params;
	params.CharName = CharName;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetPlayerRecord
// (Final, Simulated, Native, Static, Public)
// Parameters:
// int                            Index                          (Parm)
// struct FPlayerRecord           ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FPlayerRecord UwUtil::STATIC_GetPlayerRecord(int Index)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetPlayerRecord");

	UwUtil_GetPlayerRecord_Params params;
	params.Index = Index;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUtil.GetPlayerList
// (Final, Simulated, Native, Static, Public)
// Parameters:
// struct FPlayerRecord[]         PlayerRecords                  (Parm, OutParm, NeedCtorLink)

void UwUtil::STATIC_GetPlayerList(struct FPlayerRecord[]* PlayerRecords)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUtil.GetPlayerList");

	UwUtil_GetPlayerList_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (PlayerRecords != nullptr)
		*PlayerRecords = params.PlayerRecords;
}


// Function WGame.wPlayerInfo.Setup
// (Defined, Static, Public)
// Parameters:
// class AwPawn*                  P                              (Parm)
// struct FPlayerRecord           Rec                            (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwPlayerInfo::STATIC_Setup(class AwPawn* P, const struct FPlayerRecord& Rec)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayerInfo.Setup");

	UwPlayerInfo_Setup_Params params;
	params.P = P;
	params.Rec = Rec;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayerInfo.SetupPawn
// (Defined, Static, Public)
// Parameters:
// class AwPawn*                  P                              (Parm)
// int                            iBodyItemID                    (Parm)
// int                            iHelmetItemID                  (Parm)
// int                            iAcceItemID                    (Parm)
// int                            iBackPackID                    (Parm)
// int                            iPouchID                       (Parm)
// int                            iCamouflageID                  (Parm)
// int                            iTeamIndex                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwPlayerInfo::STATIC_SetupPawn(class AwPawn* P, int iBodyItemID, int iHelmetItemID, int iAcceItemID, int iBackPackID, int iPouchID, int iCamouflageID, int iTeamIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayerInfo.SetupPawn");

	UwPlayerInfo_SetupPawn_Params params;
	params.P = P;
	params.iBodyItemID = iBodyItemID;
	params.iHelmetItemID = iHelmetItemID;
	params.iAcceItemID = iAcceItemID;
	params.iBackPackID = iBackPackID;
	params.iPouchID = iPouchID;
	params.iCamouflageID = iCamouflageID;
	params.iTeamIndex = iTeamIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.SpeciesType.GetOffsetForSequence
// (Defined, Static, Public)
// Parameters:
// FName                          Sequence                       (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int USpeciesType::STATIC_GetOffsetForSequence(const FName& Sequence)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.GetOffsetForSequence");

	USpeciesType_GetOffsetForSequence_Params params;
	params.Sequence = Sequence;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.SpeciesType.Setup
// (Defined, Static, Public)
// Parameters:
// class AwPawn*                  P                              (Parm)
// struct FPlayerRecord           Rec                            (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool USpeciesType::STATIC_Setup(class AwPawn* P, const struct FPlayerRecord& Rec)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.Setup");

	USpeciesType_Setup_Params params;
	params.P = P;
	params.Rec = Rec;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.SpeciesType.SetTeamSkin
// (Defined, Static, Public)
// Parameters:
// class AwPawn*                  P                              (Parm)
// struct FPlayerRecord           Rec                            (Parm, NeedCtorLink)
// int                            TeamNum                        (Parm)

void USpeciesType::STATIC_SetTeamSkin(class AwPawn* P, const struct FPlayerRecord& Rec, int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.SetTeamSkin");

	USpeciesType_SetTeamSkin_Params params;
	params.P = P;
	params.Rec = Rec;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.SpeciesType.GetRagSkelName
// (Defined, Static, Public)
// Parameters:
// string                         MeshName                       (Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string USpeciesType::STATIC_GetRagSkelName(const string& MeshName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.GetRagSkelName");

	USpeciesType_GetRagSkelName_Params params;
	params.MeshName = MeshName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.SpeciesType.ModifyPawn
// (Defined, Static, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void USpeciesType::STATIC_ModifyPawn(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.ModifyPawn");

	USpeciesType_ModifyPawn_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.SpeciesType.ModifyImpartedDamage
// (Defined, Static, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   injured                        (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int USpeciesType::STATIC_ModifyImpartedDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.ModifyImpartedDamage");

	USpeciesType_ModifyImpartedDamage_Params params;
	params.Damage = Damage;
	params.injured = injured;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.Momentum = Momentum;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.SpeciesType.ModifyReceivedDamage
// (Defined, Static, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   injured                        (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int USpeciesType::STATIC_ModifyReceivedDamage(int Damage, class APawn* injured, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.ModifyReceivedDamage");

	USpeciesType_ModifyReceivedDamage_Params params;
	params.Damage = Damage;
	params.injured = injured;
	params.instigatedBy = instigatedBy;
	params.HitLocation = HitLocation;
	params.Momentum = Momentum;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.SpeciesType.LoadResources
// (Defined, Static, Public)
// Parameters:
// struct FPlayerRecord           Rec                            (Parm, NeedCtorLink)
// class ALevelInfo*              Level                          (Parm)
// class APlayerReplicationInfo*  PRI                            (Parm)
// int                            TeamNum                        (Parm)

void USpeciesType::STATIC_LoadResources(const struct FPlayerRecord& Rec, class ALevelInfo* Level, class APlayerReplicationInfo* PRI, int TeamNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.LoadResources");

	USpeciesType_LoadResources_Params params;
	params.Rec = Rec;
	params.Level = Level;
	params.PRI = PRI;
	params.TeamNum = TeamNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.SpeciesType.GetVoiceType
// (Defined, Static, Public)
// Parameters:
// bool                           bIsFemale                      (Parm)
// class ALevelInfo*              Level                          (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string USpeciesType::STATIC_GetVoiceType(bool bIsFemale, class ALevelInfo* Level)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SpeciesType.GetVoiceType");

	USpeciesType_GetVoiceType_Params params;
	params.bIsFemale = bIsFemale;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.AnimNotify_Nemesis_BeamPrepare.Notify
// (Defined, Simulated, Event, Public)
// Parameters:
// class AActor*                  Owner                          (Parm)

void UAnimNotify_Nemesis_BeamPrepare::Notify(class AActor* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.AnimNotify_Nemesis_BeamPrepare.Notify");

	UAnimNotify_Nemesis_BeamPrepare_Notify_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SpawnDSentry
// (Defined, Exec, Public)

void AwPawn::SpawnDSentry()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnDSentry");

	AwPawn_SpawnDSentry_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SpawnSentry
// (Defined, Exec, Public)
// Parameters:
// string                         strCheatTeamID                 (Parm, NeedCtorLink)

void AwPawn::SpawnSentry(const string& strCheatTeamID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnSentry");

	AwPawn_SpawnSentry_Params params;
	params.strCheatTeamID = strCheatTeamID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SkillInit
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwPawn::SkillInit(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SkillInit");

	AwPawn_SkillInit_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ClientSkillDeadPlayer
// (Defined, Net, NetReliable, Simulated, Public)

void AwPawn::ClientSkillDeadPlayer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ClientSkillDeadPlayer");

	AwPawn_ClientSkillDeadPlayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddAllyEffect
// (Defined, Simulated, Public)
// Parameters:
// int                            iSideIndex                     (OptionalParm, Parm)

void AwPawn::AddAllyEffect(int iSideIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddAllyEffect");

	AwPawn_AddAllyEffect_Params params;
	params.iSideIndex = iSideIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.reset_weapon
// (Defined, Exec, Public)

void AwPawn::reset_weapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.reset_weapon");

	AwPawn_reset_weapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.DisplayDebug
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwPawn::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DisplayDebug");

	AwPawn_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wPawn.SetBurning
// (Defined, Public)
// Parameters:
// bool                           bBurn                          (Parm)
// class AwProjectile*            proj                           (Parm)

void AwPawn::SetBurning(bool bBurn, class AwProjectile* proj)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetBurning");

	AwPawn_SetBurning_Params params;
	params.bBurn = bBurn;
	params.proj = proj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetWeaponAttachmentInfo
// (Defined, Simulated, Public)
// Parameters:
// byte                           byFlashCount                   (Parm, OutParm)
// byte                           byFiringMode                   (Parm, OutParm)

void AwPawn::GetWeaponAttachmentInfo(byte* byFlashCount, byte* byFiringMode)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetWeaponAttachmentInfo");

	AwPawn_GetWeaponAttachmentInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (byFlashCount != nullptr)
		*byFlashCount = params.byFlashCount;
	if (byFiringMode != nullptr)
		*byFiringMode = params.byFiringMode;
}


// Function WGame.wPawn.SetWeaponQuickChange
// (Defined, Public)
// Parameters:
// bool                           bOn                            (Parm)

void AwPawn::SetWeaponQuickChange(bool bOn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetWeaponQuickChange");

	AwPawn_SetWeaponQuickChange_Params params;
	params.bOn = bOn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetWeaponQuickReload
// (Defined, Public)
// Parameters:
// bool                           bOn                            (Parm)

void AwPawn::SetWeaponQuickReload(bool bOn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetWeaponQuickReload");

	AwPawn_SetWeaponQuickReload_Params params;
	params.bOn = bOn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetWeaponQuickAimZoom
// (Defined, Public)
// Parameters:
// bool                           bOn                            (Parm)

void AwPawn::SetWeaponQuickAimZoom(bool bOn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetWeaponQuickAimZoom");

	AwPawn_SetWeaponQuickAimZoom_Params params;
	params.bOn = bOn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddWeaponFillAmmoAndMagazine
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::AddWeaponFillAmmoAndMagazine()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddWeaponFillAmmoAndMagazine");

	AwPawn_AddWeaponFillAmmoAndMagazine_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.AddWeaponMagazine
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::AddWeaponMagazine()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddWeaponMagazine");

	AwPawn_AddWeaponMagazine_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.SetRemoveWeaponSkill
// (Defined, Public)
// Parameters:
// class AwWeapon*                W                              (Parm)

void AwPawn::SetRemoveWeaponSkill(class AwWeapon* W)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetRemoveWeaponSkill");

	AwPawn_SetRemoveWeaponSkill_Params params;
	params.W = W;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetAddWeaponSkill
// (Defined, Public)
// Parameters:
// class AwWeapon*                W                              (Parm)
// int                            iaWeaponID                     (Parm)
// int                            iPartsID                       (Parm)

void AwPawn::SetAddWeaponSkill(class AwWeapon* W, int iaWeaponID, int iPartsID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetAddWeaponSkill");

	AwPawn_SetAddWeaponSkill_Params params;
	params.W = W;
	params.iaWeaponID = iaWeaponID;
	params.iPartsID = iPartsID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.RenderFPWeaponAttachment
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwPawn::RenderFPWeaponAttachment(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.RenderFPWeaponAttachment");

	AwPawn_RenderFPWeaponAttachment_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.MakeShellEffect_Rechamber
// (Defined, Simulated, Public)

void AwPawn::MakeShellEffect_Rechamber()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.MakeShellEffect_Rechamber");

	AwPawn_MakeShellEffect_Rechamber_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.MakeShellEffect
// (Defined, Simulated, Public)

void AwPawn::MakeShellEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.MakeShellEffect");

	AwPawn_MakeShellEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ServerCallNoWeaponMessage
// (Defined, Net, NetReliable, Public)
// Parameters:
// byte                           bySlot                         (Parm)

void AwPawn::ServerCallNoWeaponMessage(byte bySlot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ServerCallNoWeaponMessage");

	AwPawn_ServerCallNoWeaponMessage_Params params;
	params.bySlot = bySlot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddNoWeaponChangeMessage
// (Defined, Simulated, Public)
// Parameters:
// byte                           bySlot                         (Parm)

void AwPawn::AddNoWeaponChangeMessage(byte bySlot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddNoWeaponChangeMessage");

	AwPawn_AddNoWeaponChangeMessage_Params params;
	params.bySlot = bySlot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.HandlePickup
// (Defined, Public)
// Parameters:
// class APickup*                 pick                           (Parm)

void AwPawn::HandlePickup(class APickup* pick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.HandlePickup");

	AwPawn_HandlePickup_Params params;
	params.pick = pick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayReload
// (Defined, Simulated, Public)

void AwPawn::PlayReload()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayReload");

	AwPawn_PlayReload_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayRechamber
// (Defined, Simulated, Public)

void AwPawn::PlayRechamber()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayRechamber");

	AwPawn_PlayRechamber_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayMelee
// (Defined, Simulated, Public)
// Parameters:
// bool                           bMeleeKnifeOrButt              (Parm)

void AwPawn::PlayMelee(bool bMeleeKnifeOrButt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayMelee");

	AwPawn_PlayMelee_Params params;
	params.bMeleeKnifeOrButt = bMeleeKnifeOrButt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PostRender2D
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          ScreenLocX                     (Parm)
// float                          ScreenLocY                     (Parm)

void AwPawn::PostRender2D(class UCanvas* C, float ScreenLocX, float ScreenLocY)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PostRender2D");

	AwPawn_PostRender2D_Params params;
	params.C = C;
	params.ScreenLocX = ScreenLocX;
	params.ScreenLocY = ScreenLocY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SpawnSupplyItem
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwPawn::SpawnSupplyItem()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnSupplyItem");

	AwPawn_SpawnSupplyItem_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.SpawnBlackbox
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwPawn::SpawnBlackbox()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnBlackbox");

	AwPawn_SpawnBlackbox_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.SpawnMedals
// (Defined, Public)

void AwPawn::SpawnMedals()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnMedals");

	AwPawn_SpawnMedals_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ClientSwitchToLastWeapon
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// byte                           defuseSwitch                   (OptionalParm, Parm)

void AwPawn::ClientSwitchToLastWeapon(byte defuseSwitch)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ClientSwitchToLastWeapon");

	AwPawn_ClientSwitchToLastWeapon_Params params;
	params.defuseSwitch = defuseSwitch;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ServerQSlotChangeCheck
// (Defined, Net, NetReliable, Public)

void AwPawn::ServerQSlotChangeCheck()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ServerQSlotChangeCheck");

	AwPawn_ServerQSlotChangeCheck_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ClientQSlotChangeCheck
// (Defined, Simulated, Public)

void AwPawn::ClientQSlotChangeCheck()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ClientQSlotChangeCheck");

	AwPawn_ClientQSlotChangeCheck_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddBaseInvenWeapon
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)
// int                            iPos                           (Parm)

void AwPawn::AddBaseInvenWeapon(class UwMatchUserInfo* kUser, int iPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddBaseInvenWeapon");

	AwPawn_AddBaseInvenWeapon_Params params;
	params.kUser = kUser;
	params.iPos = iPos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetSelectedQuickSlotInventory
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)
// bool                           bQuickslotChange               (Parm)

void AwPawn::SetSelectedQuickSlotInventory(class UwMatchUserInfo* kUser, bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetSelectedQuickSlotInventory");

	AwPawn_SetSelectedQuickSlotInventory_Params params;
	params.kUser = kUser;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddWeaponByWeaponLimited
// (Defined, Public)
// Parameters:
// int                            iWeaponID                      (Parm)
// int                            iPartsID                       (Parm)
// struct FBtrDouble              UniqueID                       (Parm)

void AwPawn::AddWeaponByWeaponLimited(int iWeaponID, int iPartsID, const struct FBtrDouble& UniqueID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddWeaponByWeaponLimited");

	AwPawn_AddWeaponByWeaponLimited_Params params;
	params.iWeaponID = iWeaponID;
	params.iPartsID = iPartsID;
	params.UniqueID = UniqueID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetInfiniteAmmoTutorial
// (Defined, Public)
// Parameters:
// bool                           bDeleteGranade                 (OptionalParm, Parm)
// int                            iGranadeCount                  (OptionalParm, Parm)

void AwPawn::SetInfiniteAmmoTutorial(bool bDeleteGranade, int iGranadeCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetInfiniteAmmoTutorial");

	AwPawn_SetInfiniteAmmoTutorial_Params params;
	params.bDeleteGranade = bDeleteGranade;
	params.iGranadeCount = iGranadeCount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetInfiniteAmmo
// (Defined, Public)
// Parameters:
// int                            ammoCount                      (OptionalParm, Parm)

void AwPawn::SetInfiniteAmmo(int ammoCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetInfiniteAmmo");

	AwPawn_SetInfiniteAmmo_Params params;
	params.ammoCount = ammoCount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.CheckWeaponBySubGameMode
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::CheckWeaponBySubGameMode(class UwMatchUserInfo* kUser)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CheckWeaponBySubGameMode");

	AwPawn_CheckWeaponBySubGameMode_Params params;
	params.kUser = kUser;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.AddDefaultInventoryDOA
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwPawn::AddDefaultInventoryDOA(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddDefaultInventoryDOA");

	AwPawn_AddDefaultInventoryDOA_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetGrenadlInvenByWeaponLimited
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UwMatchMaker*            kMM                            (Parm)
// class UwMatchUserInfo*         kUser                          (Parm)
// bool                           IsQuick                        (Parm)

void AwPawn::SetGrenadlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetGrenadlInvenByWeaponLimited");

	AwPawn_SetGrenadlInvenByWeaponLimited_Params params;
	params.i = i;
	params.kMM = kMM;
	params.kUser = kUser;
	params.IsQuick = IsQuick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetFlameThrowerlInvenByWeaponLimited
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UwMatchMaker*            kMM                            (Parm)
// class UwMatchUserInfo*         kUser                          (Parm)
// bool                           IsQuick                        (Parm)

void AwPawn::SetFlameThrowerlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetFlameThrowerlInvenByWeaponLimited");

	AwPawn_SetFlameThrowerlInvenByWeaponLimited_Params params;
	params.i = i;
	params.kMM = kMM;
	params.kUser = kUser;
	params.IsQuick = IsQuick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetMGlInvenByWeaponLimited
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UwMatchMaker*            kMM                            (Parm)
// class UwMatchUserInfo*         kUser                          (Parm)
// bool                           IsQuick                        (Parm)

void AwPawn::SetMGlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetMGlInvenByWeaponLimited");

	AwPawn_SetMGlInvenByWeaponLimited_Params params;
	params.i = i;
	params.kMM = kMM;
	params.kUser = kUser;
	params.IsQuick = IsQuick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetShotGunlInvenByWeaponLimited
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UwMatchMaker*            kMM                            (Parm)
// class UwMatchUserInfo*         kUser                          (Parm)
// bool                           IsQuick                        (Parm)

void AwPawn::SetShotGunlInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetShotGunlInvenByWeaponLimited");

	AwPawn_SetShotGunlInvenByWeaponLimited_Params params;
	params.i = i;
	params.kMM = kMM;
	params.kUser = kUser;
	params.IsQuick = IsQuick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetPistolInvenByWeaponLimited
// (Defined, Public)
// Parameters:
// int                            i                              (Parm)
// class UwMatchMaker*            kMM                            (Parm)
// class UwMatchUserInfo*         kUser                          (Parm)
// bool                           IsQuick                        (Parm)

void AwPawn::SetPistolInvenByWeaponLimited(int i, class UwMatchMaker* kMM, class UwMatchUserInfo* kUser, bool IsQuick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetPistolInvenByWeaponLimited");

	AwPawn_SetPistolInvenByWeaponLimited_Params params;
	params.i = i;
	params.kMM = kMM;
	params.kUser = kUser;
	params.IsQuick = IsQuick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwPawn::AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddDefaultInventory");

	AwPawn_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.RemoveInventoryByDamageType
// (Defined, Public)
// Parameters:
// EeWeaponType                   removeWeaponType               (Parm)

void AwPawn::RemoveInventoryByDamageType(EeWeaponType removeWeaponType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.RemoveInventoryByDamageType");

	AwPawn_RemoveInventoryByDamageType_Params params;
	params.removeWeaponType = removeWeaponType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.RemoveAllInventory
// (Defined, Public)

void AwPawn::RemoveAllInventory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.RemoveAllInventory");

	AwPawn_RemoveAllInventory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ChangeInventoryByQSlot
// (Defined, Public)

void AwPawn::ChangeInventoryByQSlot()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ChangeInventoryByQSlot");

	AwPawn_ChangeInventoryByQSlot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetSlotPosbySkillID
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)
// int                            iSkillID                       (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwPawn::GetSlotPosbySkillID(class UwMatchUserInfo* kUser, int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetSlotPosbySkillID");

	AwPawn_GetSlotPosbySkillID_Params params;
	params.kUser = kUser;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.AddBaseInvenSkill
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)
// int                            iPos                           (Parm)

void AwPawn::AddBaseInvenSkill(class UwMatchUserInfo* kUser, int iPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddBaseInvenSkill");

	AwPawn_AddBaseInvenSkill_Params params;
	params.kUser = kUser;
	params.iPos = iPos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetSelectedQuickSlotSkills
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)

void AwPawn::SetSelectedQuickSlotSkills(class UwMatchUserInfo* kUser)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetSelectedQuickSlotSkills");

	AwPawn_SetSelectedQuickSlotSkills_Params params;
	params.kUser = kUser;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddWeaponFromSkill
// (Defined, Public)
// Parameters:
// struct FBtrDouble              iUniqueID                      (Parm)
// int                            iaWeaponID                     (Parm)

void AwPawn::AddWeaponFromSkill(const struct FBtrDouble& iUniqueID, int iaWeaponID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddWeaponFromSkill");

	AwPawn_AddWeaponFromSkill_Params params;
	params.iUniqueID = iUniqueID;
	params.iaWeaponID = iaWeaponID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddSkillByInventory
// (Defined, Public)
// Parameters:
// class UwMatchUserInfo*         kUser                          (Parm)

void AwPawn::AddSkillByInventory(class UwMatchUserInfo* kUser)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddSkillByInventory");

	AwPawn_AddSkillByInventory_Params params;
	params.kUser = kUser;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AddDefaultSkills
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwPawn::AddDefaultSkills(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddDefaultSkills");

	AwPawn_AddDefaultSkills_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetGibParts
// (Defined, Simulated, Public)
// Parameters:
// int                            iCollisionPart                 (Parm)
// EGibType                       ReturnValue                    (Parm, OutParm, ReturnParm)

EGibType AwPawn::GetGibParts(int iCollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetGibParts");

	AwPawn_GetGibParts_Params params;
	params.iCollisionPart = iCollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.SpawnGoreGiblet
// (Defined, Simulated, Public)
// Parameters:
// int                            iIndex                         (Parm)

void AwPawn::SpawnGoreGiblet(int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnGoreGiblet");

	AwPawn_SpawnGoreGiblet_Params params;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.MakeGorePawn
// (Defined, Simulated, Public)
// Parameters:
// int                            iPart                          (Parm)

void AwPawn::MakeGorePawn(int iPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.MakeGorePawn");

	AwPawn_MakeGorePawn_Params params;
	params.iPart = iPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.EndCrouch
// (Defined, Event, Public)
// Parameters:
// float                          HeightAdjust                   (Parm)

void AwPawn::EndCrouch(float HeightAdjust)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.EndCrouch");

	AwPawn_EndCrouch_Params params;
	params.HeightAdjust = HeightAdjust;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.EndProne
// (Defined, Event, Public)
// Parameters:
// float                          HeightAdjust                   (Parm)

void AwPawn::EndProne(float HeightAdjust)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.EndProne");

	AwPawn_EndProne_Params params;
	params.HeightAdjust = HeightAdjust;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetParts
// (Defined, Simulated, Public)
// Parameters:
// EePlayerParts                  iPartsIndex                    (Parm)
// class UMesh*                   resMesh                        (Parm)
// class UStaticMesh*             resStaticMesh                  (Parm)

void AwPawn::SetParts(EePlayerParts iPartsIndex, class UMesh* resMesh, class UStaticMesh* resStaticMesh)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetParts");

	AwPawn_SetParts_Params params;
	params.iPartsIndex = iPartsIndex;
	params.resMesh = resMesh;
	params.resStaticMesh = resStaticMesh;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetCamouflage
// (Defined, Simulated, Public)
// Parameters:
// int                            iItemID                        (Parm)
// byte                           byTeam                         (Parm)
// class UMaterial*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UMaterial* AwPawn::GetCamouflage(int iItemID, byte byTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetCamouflage");

	AwPawn_GetCamouflage_Params params;
	params.iItemID = iItemID;
	params.byTeam = byTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.SetCamouflage
// (Defined, Simulated, Public)
// Parameters:
// int                            iItemID                        (Parm)
// byte                           byTeam                         (Parm)

void AwPawn::SetCamouflage(int iItemID, byte byTeam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetCamouflage");

	AwPawn_SetCamouflage_Params params;
	params.iItemID = iItemID;
	params.byTeam = byTeam;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ResetAllParts
// (Defined, Simulated, Public)

void AwPawn::ResetAllParts()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ResetAllParts");

	AwPawn_ResetAllParts_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.Died
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwPawn::Died(class AController* Killer, class UClass* DamageType, const struct FVector& HitLocation, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Died");

	AwPawn_Died_Params params;
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


// Function WGame.wPawn.DoDerezEffect
// (Defined, Simulated, Public)

void AwPawn::DoDerezEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DoDerezEffect");

	AwPawn_DoDerezEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetGibClass
// (Defined, Public)
// Parameters:
// EGibType                       gibType                        (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwPawn::GetGibClass(EGibType gibType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetGibClass");

	AwPawn_GetGibClass_Params params;
	params.gibType = gibType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.GetSound
// (Defined, Public)
// Parameters:
// ESoundType                     soundType                      (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwPawn::GetSound(ESoundType soundType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetSound");

	AwPawn_GetSound_Params params;
	params.soundType = soundType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.ClientResetPhysicsBasedAnim
// (Defined, Net, NetReliable, Public)

void AwPawn::ClientResetPhysicsBasedAnim()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ClientResetPhysicsBasedAnim");

	AwPawn_ClientResetPhysicsBasedAnim_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ResetPhysicsBasedAnim
// (Defined, Simulated, Public)

void AwPawn::ResetPhysicsBasedAnim()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ResetPhysicsBasedAnim");

	AwPawn_ResetPhysicsBasedAnim_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.Setup
// (Defined, Simulated, Public)
// Parameters:
// struct FPlayerRecord           Rec                            (Parm, NeedCtorLink)
// bool                           bLoadNow                       (OptionalParm, Parm)

void AwPawn::Setup(const struct FPlayerRecord& Rec, bool bLoadNow)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Setup");

	AwPawn_Setup_Params params;
	params.Rec = Rec;
	params.bLoadNow = bLoadNow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetDefaultCharacter
// (Defined, Simulated, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwPawn::GetDefaultCharacter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetDefaultCharacter");

	AwPawn_GetDefaultCharacter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.ForceDefaultCharacter
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::ForceDefaultCharacter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ForceDefaultCharacter");

	AwPawn_ForceDefaultCharacter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.CheckValidMaleDefault
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::CheckValidMaleDefault()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CheckValidMaleDefault");

	AwPawn_CheckValidMaleDefault_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.CheckValidFemaleDefault
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::CheckValidFemaleDefault()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CheckValidFemaleDefault");

	AwPawn_CheckValidFemaleDefault_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.ClientReStart
// (Defined, Simulated, Public)

void AwPawn::ClientReStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ClientReStart");

	AwPawn_ClientReStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PostNetReceive
// (Defined, Simulated, Event, Public)

void AwPawn::PostNetReceive()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PostNetReceive");

	AwPawn_PostNetReceive_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.NotifyTeamChanged
// (Defined, Simulated, Public)

void AwPawn::NotifyTeamChanged()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.NotifyTeamChanged");

	AwPawn_NotifyTeamChanged_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.DoJump
// (Defined, Public)
// Parameters:
// bool                           bUpdating                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::DoJump(bool bUpdating)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DoJump");

	AwPawn_DoJump_Params params;
	params.bUpdating = bUpdating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.CanMultiJump
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::CanMultiJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CanMultiJump");

	AwPawn_CanMultiJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.CanDoubleJump
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::CanDoubleJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CanDoubleJump");

	AwPawn_CanDoubleJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.DoDoubleJump
// (Defined, Public)
// Parameters:
// bool                           bUpdating                      (Parm)

void AwPawn::DoDoubleJump(bool bUpdating)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DoDoubleJump");

	AwPawn_DoDoubleJump_Params params;
	params.bUpdating = bUpdating;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PerformDodge
// (Defined, Public)
// Parameters:
// EDoubleClickDir                DoubleClickMove                (Parm)
// struct FVector                 Dir                            (Parm)
// struct FVector                 Cross                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::PerformDodge(EDoubleClickDir DoubleClickMove, const struct FVector& Dir, const struct FVector& Cross)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PerformDodge");

	AwPawn_PerformDodge_Params params;
	params.DoubleClickMove = DoubleClickMove;
	params.Dir = Dir;
	params.Cross = Cross;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.Dodge
// (Defined, Public)
// Parameters:
// EDoubleClickDir                DoubleClickMove                (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::Dodge(EDoubleClickDir DoubleClickMove)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Dodge");

	AwPawn_Dodge_Params params;
	params.DoubleClickMove = DoubleClickMove;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.BotDodge
// (Defined, Public)
// Parameters:
// struct FVector                 Dir                            (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwPawn::BotDodge(const struct FVector& Dir)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.BotDodge");

	AwPawn_BotDodge_Params params;
	params.Dir = Dir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.SetInvisibility
// (Defined, Public)
// Parameters:
// float                          Time                           (Parm)

void AwPawn::SetInvisibility(float Time)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetInvisibility");

	AwPawn_SetInvisibility_Params params;
	params.Time = Time;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ServerChangedWeapon
// (Defined, Net, NetReliable, Public)
// Parameters:
// class AwWeapon*                OldWeapon                      (Parm)
// class AwWeapon*                newWeapon                      (Parm)

void AwPawn::ServerChangedWeapon(class AwWeapon* OldWeapon, class AwWeapon* newWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ServerChangedWeapon");

	AwPawn_ServerChangedWeapon_Params params;
	params.OldWeapon = OldWeapon;
	params.newWeapon = newWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ChangedWeapon
// (Defined, Public)

void AwPawn::ChangedWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ChangedWeapon");

	AwPawn_ChangedWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetWeaponOverlay
// (Defined, Public)
// Parameters:
// class UMaterial*               mat                            (Parm)
// float                          Time                           (Parm)
// bool                           override                       (Parm)

void AwPawn::SetWeaponOverlay(class UMaterial* mat, float Time, bool override)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetWeaponOverlay");

	AwPawn_SetWeaponOverlay_Params params;
	params.mat = mat;
	params.Time = Time;
	params.override = override;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.DisableUDamage
// (Defined, Public)

void AwPawn::DisableUDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DisableUDamage");

	AwPawn_DisableUDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.EnableUDamage
// (Defined, Public)
// Parameters:
// float                          Amount                         (Parm)

void AwPawn::EnableUDamage(float Amount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.EnableUDamage");

	AwPawn_EnableUDamage_Params params;
	params.Amount = Amount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.HasUDamage
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::HasUDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.HasUDamage");

	AwPawn_HasUDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.DoCombo
// (Defined, Public)
// Parameters:
// class UClass*                  ComboClass                     (Parm)

void AwPawn::DoCombo(class UClass* ComboClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DoCombo");

	AwPawn_DoCombo_Params params;
	params.ComboClass = ComboClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.DoComboName
// (Defined, Public)
// Parameters:
// string                         ComboClassName                 (Parm, NeedCtorLink)

void AwPawn::DoComboName(const string& ComboClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DoComboName");

	AwPawn_DoComboName_Params params;
	params.ComboClassName = ComboClassName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.InCurrentCombo
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::InCurrentCombo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.InCurrentCombo");

	AwPawn_InCurrentCombo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.AddShieldStrength
// (Defined, Public)
// Parameters:
// int                            ShieldAmount                   (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::AddShieldStrength(int ShieldAmount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AddShieldStrength");

	AwPawn_AddShieldStrength_Params params;
	params.ShieldAmount = ShieldAmount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.CanUseShield
// (Defined, Public)
// Parameters:
// int                            ShieldAmount                   (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwPawn::CanUseShield(int ShieldAmount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CanUseShield");

	AwPawn_CanUseShield_Params params;
	params.ShieldAmount = ShieldAmount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.GetShieldStrength
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwPawn::GetShieldStrength()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetShieldStrength");

	AwPawn_GetShieldStrength_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.GetShieldStrengthMax
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwPawn::GetShieldStrengthMax()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetShieldStrengthMax");

	AwPawn_GetShieldStrengthMax_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.TakeDamageSound
// (Defined, Public)
// Parameters:
// int                            LeftHealth                     (Parm)
// int                            ActualDamage                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// class AController*             Killer                         (OptionalParm, Parm)

void AwPawn::TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.TakeDamageSound");

	AwPawn_TakeDamageSound_Params params;
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


// Function WGame.wPawn.PlayFootStepRight
// (Defined, Simulated, Public)

void AwPawn::PlayFootStepRight()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayFootStepRight");

	AwPawn_PlayFootStepRight_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayFootStepLeft
// (Defined, Simulated, Public)

void AwPawn::PlayFootStepLeft()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayFootStepLeft");

	AwPawn_PlayFootStepLeft_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.FootStepping
// (Defined, Simulated, Public)
// Parameters:
// int                            side                           (Parm)

void AwPawn::FootStepping(int side)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.FootStepping");

	AwPawn_FootStepping_Params params;
	params.side = side;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayEquipHitSound
// (Defined, Simulated, Public)

void AwPawn::PlayEquipHitSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayEquipHitSound");

	AwPawn_PlayEquipHitSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayBreathSound
// (Defined, Simulated, Public)

void AwPawn::PlayBreathSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayBreathSound");

	AwPawn_PlayBreathSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayDirectionalHit
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)
// bool                           bUseHitStun                    (OptionalParm, Parm)
// bool                           bGoreChange                    (OptionalParm, Parm)

void AwPawn::PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayDirectionalHit");

	AwPawn_PlayDirectionalHit_Params params;
	params.HitLoc = HitLoc;
	params.bUseHitStun = bUseHitStun;
	params.bGoreChange = bGoreChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayDirectionalDeath
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)

void AwPawn::PlayDirectionalDeath(const struct FVector& HitLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayDirectionalDeath");

	AwPawn_PlayDirectionalDeath_Params params;
	params.HitLoc = HitLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.KImpact
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// struct FVector                 pos                            (Parm)
// struct FVector                 impactVel                      (Parm)
// struct FVector                 impactNorm                     (Parm)

void AwPawn::KImpact(class AActor* Other, const struct FVector& pos, const struct FVector& impactVel, const struct FVector& impactNorm)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.KImpact");

	AwPawn_KImpact_Params params;
	params.Other = Other;
	params.pos = pos;
	params.impactVel = impactVel;
	params.impactNorm = impactNorm;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayTakeHit
// (Defined, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)

void AwPawn::PlayTakeHit(const struct FVector& HitLocation, int Damage, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayTakeHit");

	AwPawn_PlayTakeHit_Params params;
	params.HitLocation = HitLocation;
	params.Damage = Damage;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ClientDying
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLocation                    (Parm)

void AwPawn::ClientDying(class UClass* DamageType, const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ClientDying");

	AwPawn_ClientDying_Params params;
	params.DamageType = DamageType;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SpawnGibs
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                HitRotation                    (Parm)
// float                          ChunkPerterbation              (Parm)

void AwPawn::SpawnGibs(const struct FRotator& HitRotation, float ChunkPerterbation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnGibs");

	AwPawn_SpawnGibs_Params params;
	params.HitRotation = HitRotation;
	params.ChunkPerterbation = ChunkPerterbation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayDyingAnimation
// (Defined, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)

void AwPawn::PlayDyingAnimation(class UClass* DamageType, const struct FVector& HitLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayDyingAnimation");

	AwPawn_PlayDyingAnimation_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayDying
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwPawn::PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayDying");

	AwPawn_PlayDying_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.RandSpin
// (Final, Defined, Simulated, Public)
// Parameters:
// float                          spinRate                       (Parm)

void AwPawn::RandSpin(float spinRate)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.RandSpin");

	AwPawn_RandSpin_Params params;
	params.spinRate = spinRate;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.KSkelConvulse
// (Defined, Event, Public)

void AwPawn::KSkelConvulse()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.KSkelConvulse");

	AwPawn_KSkelConvulse_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetWeaponAttachment
// (Defined, Simulated, Public)
// Parameters:
// class AwWeaponAttachment*      NewAtt                         (Parm)

void AwPawn::SetWeaponAttachment(class AwWeaponAttachment* NewAtt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetWeaponAttachment");

	AwPawn_SetWeaponAttachment_Params params;
	params.NewAtt = NewAtt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayVictoryAnimation
// (Defined, Public)

void AwPawn::PlayVictoryAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayVictoryAnimation");

	AwPawn_PlayVictoryAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.CheckProneAni
// (Defined, Simulated, Event, Public)
// Parameters:
// bool                           bGoProne                       (Parm)

void AwPawn::CheckProneAni(bool bGoProne)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CheckProneAni");

	AwPawn_CheckProneAni_Params params;
	params.bGoProne = bGoProne;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ServerThrowsWeaponAnim
// (Defined, Net, NetReliable, Public)
// Parameters:
// bool                           bQuick                         (Parm)

void AwPawn::ServerThrowsWeaponAnim(bool bQuick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ServerThrowsWeaponAnim");

	AwPawn_ServerThrowsWeaponAnim_Params params;
	params.bQuick = bQuick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ServerPlayPutdownWeaponAnim
// (Defined, Net, NetReliable, Public)
// Parameters:
// bool                           bQuick                         (Parm)

void AwPawn::ServerPlayPutdownWeaponAnim(bool bQuick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ServerPlayPutdownWeaponAnim");

	AwPawn_ServerPlayPutdownWeaponAnim_Params params;
	params.bQuick = bQuick;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayWeaponSwitch
// (Defined, Public)
// Parameters:
// class AwWeapon*                newWeapon                      (Parm)

void AwPawn::PlayWeaponSwitch(class AwWeapon* newWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayWeaponSwitch");

	AwPawn_PlayWeaponSwitch_Params params;
	params.newWeapon = newWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AnimEnd
// (Defined, Simulated, Event, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwPawn::AnimEnd(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AnimEnd");

	AwPawn_AnimEnd_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ScriptPlayIdle
// (Defined, Simulated, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwPawn::ScriptPlayIdle(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ScriptPlayIdle");

	AwPawn_ScriptPlayIdle_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.InitialPlayer
// (Defined, Simulated, Event, Public)

void AwPawn::InitialPlayer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.InitialPlayer");

	AwPawn_InitialPlayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetIsFiring
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::GetIsFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetIsFiring");

	AwPawn_GetIsFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.StopFiring
// (Defined, Simulated, Public)

void AwPawn::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.StopFiring");

	AwPawn_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.StartFiring
// (Defined, Simulated, Public)
// Parameters:
// bool                           bHeavy                         (Parm)
// bool                           bRapid                         (Parm)

void AwPawn::StartFiring(bool bHeavy, bool bRapid)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.StartFiring");

	AwPawn_StartFiring_Params params;
	params.bHeavy = bHeavy;
	params.bRapid = bRapid;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetAnimAction
// (Defined, Simulated, Event, Public)
// Parameters:
// FName                          NewAction                      (Parm)
// bool                           bNoBlendAnim                   (OptionalParm, Parm)

void AwPawn::SetAnimAction(const FName& NewAction, bool bNoBlendAnim)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetAnimAction");

	AwPawn_SetAnimAction_Params params;
	params.NewAction = NewAction;
	params.bNoBlendAnim = bNoBlendAnim;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.FindValidTaunt
// (Defined, Simulated, Public)
// Parameters:
// FName                          Sequence                       (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::FindValidTaunt(FName* Sequence)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.FindValidTaunt");

	AwPawn_FindValidTaunt_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Sequence != nullptr)
		*Sequence = params.Sequence;

	return params.ReturnValue;
}


// Function WGame.wPawn.PlayDoubleJump
// (Defined, Simulated, Public)

void AwPawn::PlayDoubleJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayDoubleJump");

	AwPawn_PlayDoubleJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetAnimSequence
// (Defined, Simulated, Public)
// Parameters:
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwPawn::GetAnimSequence()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetAnimSequence");

	AwPawn_GetAnimSequence_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.Landed
// (Defined, Event, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)

void AwPawn::Landed(const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Landed");

	AwPawn_Landed_Params params;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayLandedSound
// (Defined, Event, Public)
// Parameters:
// int                            SurfType                       (Parm)

void AwPawn::PlayLandedSound(int SurfType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayLandedSound");

	AwPawn_PlayLandedSound_Params params;
	params.SurfType = SurfType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetOffhandBoneFor
// (Defined, Public)
// Parameters:
// class AInventory*              i                              (Parm)
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwPawn::GetOffhandBoneFor(class AInventory* i)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetOffhandBoneFor");

	AwPawn_GetOffhandBoneFor_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.GetWeaponBoneFor
// (Defined, Public)
// Parameters:
// class AInventory*              i                              (Parm)
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwPawn::GetWeaponBoneFor(class AInventory* i)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetWeaponBoneFor");

	AwPawn_GetWeaponBoneFor_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.CheckReflect
// (Defined, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 RefNormal                      (Parm, OutParm)
// int                            Damage                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::CheckReflect(const struct FVector& HitLocation, int Damage, struct FVector* RefNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CheckReflect");

	AwPawn_CheckReflect_Params params;
	params.HitLocation = HitLocation;
	params.Damage = Damage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (RefNormal != nullptr)
		*RefNormal = params.RefNormal;

	return params.ReturnValue;
}


// Function WGame.wPawn.PlayHit
// (Defined, Public)
// Parameters:
// float                          Damage                         (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwPawn::PlayHit(float Damage, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayHit");

	AwPawn_PlayHit_Params params;
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


// Function WGame.wPawn.PostNetBeginPlay
// (Defined, Simulated, Public)

void AwPawn::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PostNetBeginPlay");

	AwPawn_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.InitMyParam
// (Defined, Simulated, Public)

void AwPawn::InitMyParam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.InitMyParam");

	AwPawn_InitMyParam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PostBeginPlay
// (Defined, Simulated, Public)

void AwPawn::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PostBeginPlay");

	AwPawn_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.WithinRadius
// (Defined, Simulated, Public)

void AwPawn::WithinRadius()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.WithinRadius");

	AwPawn_WithinRadius_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetProximityFuze
// (Defined, Public)
// Parameters:
// bool                           bProximity                     (Parm)
// class AwPawn*                  aiBot                          (Parm)

void AwPawn::SetProximityFuze(bool bProximity, class AwPawn* aiBot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetProximityFuze");

	AwPawn_SetProximityFuze_Params params;
	params.bProximity = bProximity;
	params.aiBot = aiBot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.TickDamageWithinRadius
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwPawn::TickDamageWithinRadius(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.TickDamageWithinRadius");

	AwPawn_TickDamageWithinRadius_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.Tick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwPawn::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Tick");

	AwPawn_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.TestVersion_SetParameters
// (Defined, Simulated, Public)

void AwPawn::TestVersion_SetParameters()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.TestVersion_SetParameters");

	AwPawn_TestVersion_SetParameters_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.TickDeRes
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwPawn::TickDeRes(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.TickDeRes");

	AwPawn_TickDeRes_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetOverlayMaterial
// (Defined, Simulated, Public)
// Parameters:
// class UMaterial*               mat                            (Parm)
// float                          Time                           (Parm)
// bool                           bOverride                      (Parm)

void AwPawn::SetOverlayMaterial(class UMaterial* mat, float Time, bool bOverride)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetOverlayMaterial");

	AwPawn_SetOverlayMaterial_Params params;
	params.mat = mat;
	params.Time = Time;
	params.bOverride = bOverride;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.StartDeRes
// (Defined, Simulated, Public)

void AwPawn::StartDeRes()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.StartDeRes");

	AwPawn_StartDeRes_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.DoDamageFX
// (Defined, Public)
// Parameters:
// FName                          BoneName                       (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FRotator                R                              (Parm)
// struct FVector                 HitLoc                         (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwPawn::DoDamageFX(const FName& BoneName, int Damage, class UClass* DamageType, const struct FRotator& R, const struct FVector& HitLoc, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DoDamageFX");

	AwPawn_DoDamageFX_Params params;
	params.BoneName = BoneName;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.R = R;
	params.HitLoc = HitLoc;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.CalcHitLoc
// (Defined, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)
// struct FVector                 hitRay                         (Parm)
// FName                          BoneName                       (Parm, OutParm)
// float                          dist                           (Parm, OutParm)

void AwPawn::CalcHitLoc(const struct FVector& HitLoc, const struct FVector& hitRay, FName* BoneName, float* dist)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.CalcHitLoc");

	AwPawn_CalcHitLoc_Params params;
	params.HitLoc = HitLoc;
	params.hitRay = hitRay;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (BoneName != nullptr)
		*BoneName = params.BoneName;
	if (dist != nullptr)
		*dist = params.dist;
}


// Function WGame.wPawn.HideBone
// (Defined, Simulated, Public)
// Parameters:
// FName                          BoneName                       (Parm)

void AwPawn::HideBone(const FName& BoneName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.HideBone");

	AwPawn_HideBone_Params params;
	params.BoneName = BoneName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetBloodHitClass
// (Defined, Simulated, Public)
// Parameters:
// ECollisionPartsType            collisionParts                 (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwPawn::GetBloodHitClass(ECollisionPartsType collisionParts)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetBloodHitClass");

	AwPawn_GetBloodHitClass_Params params;
	params.collisionParts = collisionParts;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.ProcessHitFX
// (Defined, Simulated, Public)

void AwPawn::ProcessHitFX()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ProcessHitFX");

	AwPawn_ProcessHitFX_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SpawnGiblet
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  GibClass                       (Parm)
// struct FVector                 Location                       (Parm)
// struct FRotator                Rotation                       (Parm)
// float                          GibPerterbation                (Parm)
// struct FVector                 GibVelocity                    (Parm)

void AwPawn::SpawnGiblet(class UClass* GibClass, const struct FVector& Location, const struct FRotator& Rotation, float GibPerterbation, const struct FVector& GibVelocity)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SpawnGiblet");

	AwPawn_SpawnGiblet_Params params;
	params.GibClass = GibClass;
	params.Location = Location;
	params.Rotation = Rotation;
	params.GibPerterbation = GibPerterbation;
	params.GibVelocity = GibVelocity;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SetHeadScale
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          NewScale                       (Parm)

void AwPawn::SetHeadScale(float NewScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SetHeadScale");

	AwPawn_SetHeadScale_Params params;
	params.NewScale = NewScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AttachEffect
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  EmitterClass                   (Parm)
// FName                          BoneName                       (Parm)
// struct FVector                 Location                       (Parm)
// struct FRotator                Rotation                       (Parm)

void AwPawn::AttachEffect(class UClass* EmitterClass, const FName& BoneName, const struct FVector& Location, const struct FRotator& Rotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AttachEffect");

	AwPawn_AttachEffect_Params params;
	params.EmitterClass = EmitterClass;
	params.BoneName = BoneName;
	params.Location = Location;
	params.Rotation = Rotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.StopDriving
// (Defined, Simulated, Public)
// Parameters:
// class AVehicle*                V                              (Parm)

void AwPawn::StopDriving(class AVehicle* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.StopDriving");

	AwPawn_StopDriving_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.StartDriving
// (Defined, Simulated, Public)
// Parameters:
// class AVehicle*                V                              (Parm)

void AwPawn::StartDriving(class AVehicle* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.StartDriving");

	AwPawn_StartDriving_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.TickDamage
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwPawn::TickDamage(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.TickDamage");

	AwPawn_TickDamage_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.TickFX
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwPawn::TickFX(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.TickFX");

	AwPawn_TickFX_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.RemovePowerups
// (Defined, Public)

void AwPawn::RemovePowerups()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.RemovePowerups");

	AwPawn_RemovePowerups_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetTeam
// (Defined, Public)
// Parameters:
// class ATeamInfo*               ReturnValue                    (Parm, OutParm, ReturnParm)

class ATeamInfo* AwPawn::GetTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetTeam");

	AwPawn_GetTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.GetTeamNum
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwPawn::GetTeamNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetTeamNum");

	AwPawn_GetTeamNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.GetKillerController
// (Defined, Public)
// Parameters:
// class AController*             ReturnValue                    (Parm, OutParm, ReturnParm)

class AController* AwPawn::GetKillerController()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetKillerController");

	AwPawn_GetKillerController_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.Gasp
// (Defined, Public)

void AwPawn::Gasp()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Gasp");

	AwPawn_Gasp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayDyingSound
// (Defined, Public)

void AwPawn::PlayDyingSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayDyingSound");

	AwPawn_PlayDyingSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayMoverHitSound
// (Defined, Public)

void AwPawn::PlayMoverHitSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayMoverHitSound");

	AwPawn_PlayMoverHitSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayTeleportEffect
// (Defined, Public)
// Parameters:
// bool                           bOut                           (Parm)
// bool                           bSound                         (Parm)

void AwPawn::PlayTeleportEffect(bool bOut, bool bSound)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayTeleportEffect");

	AwPawn_PlayTeleportEffect_Params params;
	params.bOut = bOut;
	params.bSound = bSound;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.DeactivateSpawnProtection
// (Defined, Public)

void AwPawn::DeactivateSpawnProtection()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DeactivateSpawnProtection");

	AwPawn_DeactivateSpawnProtection_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AdjustedStrength
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwPawn::AdjustedStrength()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AdjustedStrength");

	AwPawn_AdjustedStrength_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.PhysicsVolumeChange
// (Defined, Simulated, Event, Public)
// Parameters:
// class APhysicsVolume*          NewVolume                      (Parm)

void AwPawn::PhysicsVolumeChange(class APhysicsVolume* NewVolume)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PhysicsVolumeChange");

	AwPawn_PhysicsVolumeChange_Params params;
	params.NewVolume = NewVolume;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.RemoveFlamingEffects
// (Defined, Simulated, Public)

void AwPawn::RemoveFlamingEffects()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.RemoveFlamingEffects");

	AwPawn_RemoveFlamingEffects_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.Destroyed
// (Defined, Simulated, Public)

void AwPawn::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Destroyed");

	AwPawn_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AssignInitialPose
// (Defined, Simulated, Public)

void AwPawn::AssignInitialPose()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AssignInitialPose");

	AwPawn_AssignInitialPose_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.DoTranslocateOut
// (Defined, Public)
// Parameters:
// struct FVector                 PrevLocation                   (Parm)

void AwPawn::DoTranslocateOut(const struct FVector& PrevLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.DoTranslocateOut");

	AwPawn_DoTranslocateOut_Params params;
	params.PrevLocation = PrevLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.WasPlayerPawn
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPawn::WasPlayerPawn()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.WasPlayerPawn");

	AwPawn_WasPlayerPawn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.UnPossessed
// (Defined, Public)

void AwPawn::UnPossessed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.UnPossessed");

	AwPawn_UnPossessed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PossessedBy
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AwPawn::PossessedBy(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PossessedBy");

	AwPawn_PossessedBy_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.GetPlacedRoster
// (Defined, Public)
// Parameters:
// class URosterEntry*            ReturnValue                    (Parm, OutParm, ReturnParm)

class URosterEntry* AwPawn::GetPlacedRoster()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.GetPlacedRoster");

	AwPawn_GetPlacedRoster_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawn.PlayWaiting
// (Defined, Simulated, Public)

void AwPawn::PlayWaiting()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayWaiting");

	AwPawn_PlayWaiting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.AltFire
// (Defined, Simulated, Public)
// Parameters:
// float                          f                              (OptionalParm, Parm)

void AwPawn::AltFire(float f)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.AltFire");

	AwPawn_AltFire_Params params;
	params.f = f;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.Fire
// (Defined, Simulated, Public)
// Parameters:
// float                          f                              (OptionalParm, Parm)

void AwPawn::Fire(float f)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.Fire");

	AwPawn_Fire_Params params;
	params.f = f;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.ClientWeaponReset
// (Defined, Net, NetReliable, Simulated, Public)

void AwPawn::ClientWeaponReset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.ClientWeaponReset");

	AwPawn_ClientWeaponReset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.SimulatedSetRotation
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                R                              (Parm)

void AwPawn::SimulatedSetRotation(const struct FRotator& R)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.SimulatedSetRotation");

	AwPawn_SimulatedSetRotation_Params params;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawn.PlayTurretIdleAnim
// (Defined, Simulated, Public)
// Parameters:
// bool                           UpDown                         (OptionalParm, Parm)

void AwPawn::PlayTurretIdleAnim(bool UpDown)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawn.PlayTurretIdleAnim");

	AwPawn_PlayTurretIdleAnim_Params params;
	params.UpDown = UpDown;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.StartDeRes
// (Defined, Simulated, Public)

void AwMonster::StartDeRes()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.StartDeRes");

	AwMonster_StartDeRes_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.ProcessHitFX
// (Defined, Simulated, Public)

void AwMonster::ProcessHitFX()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.ProcessHitFX");

	AwMonster_ProcessHitFX_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.CreateGib
// (Defined, Public)
// Parameters:
// FName                          BoneName                       (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FRotator                R                              (Parm)

void AwMonster::CreateGib(const FName& BoneName, class UClass* DamageType, const struct FRotator& R)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.CreateGib");

	AwMonster_CreateGib_Params params;
	params.BoneName = BoneName;
	params.DamageType = DamageType;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.SetAnimAction
// (Defined, Simulated, Event, Public)
// Parameters:
// FName                          NewAction                      (Parm)
// bool                           bNoBlendAnim                   (OptionalParm, Parm)

void AwMonster::SetAnimAction(const FName& NewAction, bool bNoBlendAnim)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.SetAnimAction");

	AwMonster_SetAnimAction_Params params;
	params.NewAction = NewAction;
	params.bNoBlendAnim = bNoBlendAnim;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.PlayVictoryAnimation
// (Defined, Public)

void AwMonster::PlayVictoryAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PlayVictoryAnimation");

	AwMonster_PlayVictoryAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.MeleeDamageTarget
// (Defined, Public)
// Parameters:
// int                            hitdamage                      (Parm)
// struct FVector                 pushdir                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::MeleeDamageTarget(int hitdamage, const struct FVector& pushdir)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.MeleeDamageTarget");

	AwMonster_MeleeDamageTarget_Params params;
	params.hitdamage = hitdamage;
	params.pushdir = pushdir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.PlayDyingSound
// (Defined, Public)

void AwMonster::PlayDyingSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PlayDyingSound");

	AwMonster_PlayDyingSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.PlayDying
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwMonster::PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PlayDying");

	AwMonster_PlayDying_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.PlayTakeHit
// (Defined, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)

void AwMonster::PlayTakeHit(const struct FVector& HitLocation, int Damage, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PlayTakeHit");

	AwMonster_PlayTakeHit_Params params;
	params.HitLocation = HitLocation;
	params.Damage = Damage;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.IsPlayerPawn
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::IsPlayerPawn()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.IsPlayerPawn");

	AwMonster_IsPlayerPawn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.SetMovementPhysics
// (Defined, Public)

void AwMonster::SetMovementPhysics()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.SetMovementPhysics");

	AwMonster_SetMovementPhysics_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.AnimEnd
// (Defined, Simulated, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwMonster::AnimEnd(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.AnimEnd");

	AwMonster_AnimEnd_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.PlayVictory
// (Public)

void AwMonster::PlayVictory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PlayVictory");

	AwMonster_PlayVictory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.Destroyed
// (Defined, Public)

void AwMonster::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.Destroyed");

	AwMonster_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.PlayChallengeSound
// (Defined, Public)

void AwMonster::PlayChallengeSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PlayChallengeSound");

	AwMonster_PlayChallengeSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.AssignInitialPose
// (Defined, Simulated, Public)

void AwMonster::AssignInitialPose()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.AssignInitialPose");

	AwMonster_AssignInitialPose_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.SameSpeciesAs
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::SameSpeciesAs(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.SameSpeciesAs");

	AwMonster_SameSpeciesAs_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.LandThump
// (Defined, Public)

void AwMonster::LandThump()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.LandThump");

	AwMonster_LandThump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.PostBeginPlay
// (Defined, Event, Public)

void AwMonster::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PostBeginPlay");

	AwMonster_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.FireProjectile
// (Defined, Public)

void AwMonster::FireProjectile()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.FireProjectile");

	AwMonster_FireProjectile_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.GetFireStart
// (Defined, Public)
// Parameters:
// struct FVector                 X                              (Parm)
// struct FVector                 Y                              (Parm)
// struct FVector                 Z                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwMonster::GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.GetFireStart");

	AwMonster_GetFireStart_Params params;
	params.X = X;
	params.Y = Y;
	params.Z = Z;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.RangedAttackTime
// (Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwMonster::RangedAttackTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.RangedAttackTime");

	AwMonster_RangedAttackTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.HasRangedAttack
// (Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::HasRangedAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.HasRangedAttack");

	AwMonster_HasRangedAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.PreferMelee
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::PreferMelee()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PreferMelee");

	AwMonster_PreferMelee_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.Fire
// (Defined, Public)
// Parameters:
// float                          f                              (OptionalParm, Parm)

void AwMonster::Fire(float f)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.Fire");

	AwMonster_Fire_Params params;
	params.f = f;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.IsHeadShot
// (Defined, Public)
// Parameters:
// struct FVector                 loc                            (Parm)
// struct FVector                 ray                            (Parm)
// float                          AdditionalScale                (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::IsHeadShot(const struct FVector& loc, const struct FVector& ray, float AdditionalScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.IsHeadShot");

	AwMonster_IsHeadShot_Params params;
	params.loc = loc;
	params.ray = ray;
	params.AdditionalScale = AdditionalScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.ForceDefaultCharacter
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::ForceDefaultCharacter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.ForceDefaultCharacter");

	AwMonster_ForceDefaultCharacter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.TurnOff
// (Defined, Simulated, Public)

void AwMonster::TurnOff()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.TurnOff");

	AwMonster_TurnOff_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.GetChargingDist
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwMonster::GetChargingDist()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.GetChargingDist");

	AwMonster_GetChargingDist_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.RecommendSplashDamage
// (Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::RecommendSplashDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.RecommendSplashDamage");

	AwMonster_RecommendSplashDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.GetDamageRadius
// (Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwMonster::GetDamageRadius()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.GetDamageRadius");

	AwMonster_GetDamageRadius_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.SplashDamage
// (Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::SplashDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.SplashDamage");

	AwMonster_SplashDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.StopFiring
// (Public)

void AwMonster::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.StopFiring");

	AwMonster_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.CanAttack
// (Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonster::CanAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.CanAttack");

	AwMonster_CanAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonster.RangedAttack
// (Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwMonster::RangedAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.RangedAttack");

	AwMonster_RangedAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwMonster::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.PostNetBeginPlay");

	AwMonster_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonster.SetBotMesh
// (Defined, Simulated, Public)

void AwMonster::SetBotMesh()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonster.SetBotMesh");

	AwMonster_SetBotMesh_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.Process_TossWeapon_When_Dying
// (Defined, Public)
// Parameters:
// class ALevelInfo*              levenInfo                      (Parm)
// class APawn*                   Pawn                           (Parm)
// class AwWeapon*                Weapon                         (Parm)

void AwDefenceBoss::Process_TossWeapon_When_Dying(class ALevelInfo* levenInfo, class APawn* Pawn, class AwWeapon* Weapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.Process_TossWeapon_When_Dying");

	AwDefenceBoss_Process_TossWeapon_When_Dying_Params params;
	params.levenInfo = levenInfo;
	params.Pawn = Pawn;
	params.Weapon = Weapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.FootStepping
// (Defined, Simulated, Public)
// Parameters:
// int                            side                           (Parm)

void AwDefenceBoss::FootStepping(int side)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.FootStepping");

	AwDefenceBoss_FootStepping_Params params;
	params.side = side;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.EffectExplosion
// (Defined, Simulated, Public)

void AwDefenceBoss::EffectExplosion()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.EffectExplosion");

	AwDefenceBoss_EffectExplosion_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.PlayDying
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwDefenceBoss::PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.PlayDying");

	AwDefenceBoss_PlayDying_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.SetAnimAction
// (Defined, Simulated, Event, Public)
// Parameters:
// FName                          NewAction                      (Parm)
// bool                           bNoBlendAnim                   (OptionalParm, Parm)

void AwDefenceBoss::SetAnimAction(const FName& NewAction, bool bNoBlendAnim)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.SetAnimAction");

	AwDefenceBoss_SetAnimAction_Params params;
	params.NewAction = NewAction;
	params.bNoBlendAnim = bNoBlendAnim;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.SpawnLastAttackEffect
// (Defined, Simulated, Public)

void AwDefenceBoss::SpawnLastAttackEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.SpawnLastAttackEffect");

	AwDefenceBoss_SpawnLastAttackEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.TakeDamage
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

void AwDefenceBoss::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.TakeDamage");

	AwDefenceBoss_TakeDamage_Params params;
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


// Function WGame.wDefenceBoss.Tick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwDefenceBoss::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.Tick");

	AwDefenceBoss_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.ServerTick
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwDefenceBoss::ServerTick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.ServerTick");

	AwDefenceBoss_ServerTick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.PatternTick
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwDefenceBoss::PatternTick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.PatternTick");

	AwDefenceBoss_PatternTick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.Bump
// (Defined, Singular, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwDefenceBoss::Bump(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.Bump");

	AwDefenceBoss_Bump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.FinalMeleeAttack
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwDefenceBoss::FinalMeleeAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.FinalMeleeAttack");

	AwDefenceBoss_FinalMeleeAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.RangedAttack
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwDefenceBoss::RangedAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.RangedAttack");

	AwDefenceBoss_RangedAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.LastMeleeAttack
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwDefenceBoss::LastMeleeAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.LastMeleeAttack");

	AwDefenceBoss_LastMeleeAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.StartCharging
// (Defined, Public)

void AwDefenceBoss::StartCharging()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.StartCharging");

	AwDefenceBoss_StartCharging_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.RangedAttackTime
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwDefenceBoss::RangedAttackTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.RangedAttackTime");

	AwDefenceBoss_RangedAttackTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.GetFireStart
// (Defined, Public)
// Parameters:
// struct FVector                 X                              (Parm)
// struct FVector                 Y                              (Parm)
// struct FVector                 Z                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwDefenceBoss::GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.GetFireStart");

	AwDefenceBoss_GetFireStart_Params params;
	params.X = X;
	params.Y = Y;
	params.Z = Z;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.GetFireBack
// (Defined, Public)
// Parameters:
// struct FVector                 X                              (Parm)
// struct FVector                 Y                              (Parm)
// struct FVector                 Z                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwDefenceBoss::GetFireBack(const struct FVector& X, const struct FVector& Y, const struct FVector& Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.GetFireBack");

	AwDefenceBoss_GetFireBack_Params params;
	params.X = X;
	params.Y = Y;
	params.Z = Z;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.PlayVictory
// (Defined, Public)

void AwDefenceBoss::PlayVictory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.PlayVictory");

	AwDefenceBoss_PlayVictory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.PlayDirectionalHit
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)
// bool                           bUseHitStun                    (OptionalParm, Parm)
// bool                           bGoreChange                    (OptionalParm, Parm)

void AwDefenceBoss::PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.PlayDirectionalHit");

	AwDefenceBoss_PlayDirectionalHit_Params params;
	params.HitLoc = HitLoc;
	params.bUseHitStun = bUseHitStun;
	params.bGoreChange = bGoreChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.PlayDirectionalDeath
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)

void AwDefenceBoss::PlayDirectionalDeath(const struct FVector& HitLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.PlayDirectionalDeath");

	AwDefenceBoss_PlayDirectionalDeath_Params params;
	params.HitLoc = HitLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.AnimEnd
// (Defined, Simulated, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwDefenceBoss::AnimEnd(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.AnimEnd");

	AwDefenceBoss_AnimEnd_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.WingBeat
// (Defined, Public)

void AwDefenceBoss::WingBeat()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.WingBeat");

	AwDefenceBoss_WingBeat_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.SetMovementPhysics
// (Defined, Public)

void AwDefenceBoss::SetMovementPhysics()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.SetMovementPhysics");

	AwDefenceBoss_SetMovementPhysics_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwDefenceBoss::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.PostBeginPlay");

	AwDefenceBoss_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.FireProjectile
// (Defined, Public)

void AwDefenceBoss::FireProjectile()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.FireProjectile");

	AwDefenceBoss_FireProjectile_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.FireProjectile_Beam
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDefenceBoss::FireProjectile_Beam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.FireProjectile_Beam");

	AwDefenceBoss_FireProjectile_Beam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.FireBeam
// (Defined, Simulated, Public)

void AwDefenceBoss::FireBeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.FireBeam");

	AwDefenceBoss_FireBeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.StopPrepareBeamEffect
// (Defined, Simulated, Public)

void AwDefenceBoss::StopPrepareBeamEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.StopPrepareBeamEffect");

	AwDefenceBoss_StopPrepareBeamEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.SpawnPrepareBeamEffect
// (Defined, Simulated, Public)

void AwDefenceBoss::SpawnPrepareBeamEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.SpawnPrepareBeamEffect");

	AwDefenceBoss_SpawnPrepareBeamEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.GetRandDirection
// (Defined, Public)
// Parameters:
// struct FRotator                InRotation                     (Parm)
// int                            iDegreeX                       (Parm)
// int                            iDegreeY                       (Parm)
// int                            iDegreeZ                       (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwDefenceBoss::GetRandDirection(const struct FRotator& InRotation, int iDegreeX, int iDegreeY, int iDegreeZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.GetRandDirection");

	AwDefenceBoss_GetRandDirection_Params params;
	params.InRotation = InRotation;
	params.iDegreeX = iDegreeX;
	params.iDegreeY = iDegreeY;
	params.iDegreeZ = iDegreeZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.FireProjectile_Rocket
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDefenceBoss::FireProjectile_Rocket()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.FireProjectile_Rocket");

	AwDefenceBoss_FireProjectile_Rocket_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.FireProjectile_Rocket2
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDefenceBoss::FireProjectile_Rocket2()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.FireProjectile_Rocket2");

	AwDefenceBoss_FireProjectile_Rocket2_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.ReadyToRocket
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDefenceBoss::ReadyToRocket()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.ReadyToRocket");

	AwDefenceBoss_ReadyToRocket_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.ReadyToBeam
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDefenceBoss::ReadyToBeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.ReadyToBeam");

	AwDefenceBoss_ReadyToBeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.RemainTimeRangedAttack
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwDefenceBoss::RemainTimeRangedAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.RemainTimeRangedAttack");

	AwDefenceBoss_RemainTimeRangedAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.ReadyToRangedAttack
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwDefenceBoss::ReadyToRangedAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.ReadyToRangedAttack");

	AwDefenceBoss_ReadyToRangedAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.GetChargingDist
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwDefenceBoss::GetChargingDist()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.GetChargingDist");

	AwDefenceBoss_GetChargingDist_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.Destroyed
// (Defined, Simulated, Public)

void AwDefenceBoss::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.Destroyed");

	AwDefenceBoss_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBoss.Create
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              Level                          (Parm)
// byte                           TeamNum                        (Parm)
// int                            Grade                          (Parm)
// int                            RegenLoc                       (Parm)
// class AwDefenceBoss*           ReturnValue                    (Parm, OutParm, ReturnParm)

class AwDefenceBoss* AwDefenceBoss::STATIC_Create(class ALevelInfo* Level, byte TeamNum, int Grade, int RegenLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.Create");

	AwDefenceBoss_Create_Params params;
	params.Level = Level;
	params.TeamNum = TeamNum;
	params.Grade = Grade;
	params.RegenLoc = RegenLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBoss.GetFlyingPathNode
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              Level                          (Parm)
// int                            idx                            (Parm)
// int                            RegenLoc                       (OptionalParm, Parm)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwDefenceBoss::STATIC_GetFlyingPathNode(class ALevelInfo* Level, int idx, int RegenLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBoss.GetFlyingPathNode");

	AwDefenceBoss_GetFlyingPathNode_Params params;
	params.Level = Level;
	params.idx = idx;
	params.RegenLoc = RegenLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.AnimNotify_Nemesis_BeamFire.Notify
// (Defined, Simulated, Event, Public)
// Parameters:
// class AActor*                  Owner                          (Parm)

void UAnimNotify_Nemesis_BeamFire::Notify(class AActor* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.AnimNotify_Nemesis_BeamFire.Notify");

	UAnimNotify_Nemesis_BeamFire_Notify_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.GetUniqueID
// (Defined, Public)
// Parameters:
// int                            iItemID                        (Parm)
// struct FBtrDouble              ReturnValue                    (Parm, OutParm, ReturnParm)

struct FBtrDouble AwPlayer::GetUniqueID(int iItemID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.GetUniqueID");

	AwPlayer_GetUniqueID_Params params;
	params.iItemID = iItemID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.SetItemCount
// (Defined, Public)
// Parameters:
// int                            iItemID                        (Parm)
// int                            RemainCount                    (Parm)

void AwPlayer::SetItemCount(int iItemID, int RemainCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SetItemCount");

	AwPlayer_SetItemCount_Params params;
	params.iItemID = iItemID;
	params.RemainCount = RemainCount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.GetItemCount
// (Defined, Public)
// Parameters:
// int                            iItemID                        (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwPlayer::GetItemCount(int iItemID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.GetItemCount");

	AwPlayer_GetItemCount_Params params;
	params.iItemID = iItemID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.ServerReqNowRespawn
// (Defined, Net, NetReliable, Public)
// Parameters:
// struct FBtrDouble              iUniqueID                      (Parm)

void AwPlayer::ServerReqNowRespawn(const struct FBtrDouble& iUniqueID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerReqNowRespawn");

	AwPlayer_ServerReqNowRespawn_Params params;
	params.iUniqueID = iUniqueID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerReqUsingItem
// (Defined, Public)
// Parameters:
// int                            iItemID                        (Parm)
// struct FBtrDouble              iUniqueID                      (Parm)

void AwPlayer::ServerReqUsingItem(int iItemID, const struct FBtrDouble& iUniqueID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerReqUsingItem");

	AwPlayer_ServerReqUsingItem_Params params;
	params.iItemID = iItemID;
	params.iUniqueID = iUniqueID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.UsingItem_Slot8
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::UsingItem_Slot8()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.UsingItem_Slot8");

	AwPlayer_UsingItem_Slot8_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.UsingItem_Slot7
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::UsingItem_Slot7()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.UsingItem_Slot7");

	AwPlayer_UsingItem_Slot7_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.ReqUsingItem
// (Defined, Public)
// Parameters:
// byte                           byKey                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::ReqUsingItem(byte byKey)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ReqUsingItem");

	AwPlayer_ReqUsingItem_Params params;
	params.byKey = byKey;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.MakeItemBox
// (Defined, Exec, Public)
// Parameters:
// string                         t                              (Parm, NeedCtorLink)

void AwPlayer::MakeItemBox(const string& t)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.MakeItemBox");

	AwPlayer_MakeItemBox_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.AnimRate
// (Defined, Exec, Public)
// Parameters:
// float                          fAnimRate                      (Parm)

void AwPlayer::AnimRate(float fAnimRate)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.AnimRate");

	AwPlayer_AnimRate_Params params;
	params.fAnimRate = fAnimRate;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.UseRagdoll
// (Defined, Exec, Public)
// Parameters:
// bool                           bUse                           (Parm)

void AwPlayer::UseRagdoll(bool bUse)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.UseRagdoll");

	AwPlayer_UseRagdoll_Params params;
	params.bUse = bUse;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.BodyRot_BR
// (Defined, Exec, Public)
// Parameters:
// float                          fR                             (Parm)

void AwPlayer::BodyRot_BR(float fR)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.BodyRot_BR");

	AwPlayer_BodyRot_BR_Params params;
	params.fR = fR;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.BodyRot_BL
// (Defined, Exec, Public)
// Parameters:
// float                          fR                             (Parm)

void AwPlayer::BodyRot_BL(float fR)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.BodyRot_BL");

	AwPlayer_BodyRot_BL_Params params;
	params.fR = fR;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.BodyRot_FR
// (Defined, Exec, Public)
// Parameters:
// float                          fR                             (Parm)

void AwPlayer::BodyRot_FR(float fR)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.BodyRot_FR");

	AwPlayer_BodyRot_FR_Params params;
	params.fR = fR;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.BodyRot_FL
// (Defined, Exec, Public)
// Parameters:
// float                          fR                             (Parm)

void AwPlayer::BodyRot_FL(float fR)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.BodyRot_FL");

	AwPlayer_BodyRot_FL_Params params;
	params.fR = fR;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_CBR
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_CBR(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_CBR");

	AwPlayer_Rot_CBR_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_CBL
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_CBL(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_CBL");

	AwPlayer_Rot_CBL_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_CFR
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_CFR(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_CFR");

	AwPlayer_Rot_CFR_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_CFL
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_CFL(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_CFL");

	AwPlayer_Rot_CFL_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_BR
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_BR(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_BR");

	AwPlayer_Rot_BR_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_BL
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_BL(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_BL");

	AwPlayer_Rot_BL_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_FR
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_FR(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_FR");

	AwPlayer_Rot_FR_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Rot_FL
// (Defined, Exec, Public)
// Parameters:
// string                         fX                             (Parm, NeedCtorLink)
// string                         fY                             (Parm, NeedCtorLink)
// string                         fZ                             (Parm, NeedCtorLink)

void AwPlayer::Rot_FL(const string& fX, const string& fY, const string& fZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Rot_FL");

	AwPlayer_Rot_FL_Params params;
	params.fX = fX;
	params.fY = fY;
	params.fZ = fZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ShowRot
// (Defined, Exec, Public)

void AwPlayer::ShowRot()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ShowRot");

	AwPlayer_ShowRot_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.RenderSpectatorFPWeapon
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// bool                           bClearedZBuffer                (Parm)

void AwPlayer::RenderSpectatorFPWeapon(class UCanvas* Canvas, bool bClearedZBuffer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.RenderSpectatorFPWeapon");

	AwPlayer_RenderSpectatorFPWeapon_Params params;
	params.Canvas = Canvas;
	params.bClearedZBuffer = bClearedZBuffer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ChangeMouseSenseAim
// (Defined, Simulated, Public)
// Parameters:
// float                          dt                             (Parm)

void AwPlayer::ChangeMouseSenseAim(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ChangeMouseSenseAim");

	AwPlayer_ChangeMouseSenseAim_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ChangeMouseSense
// (Defined, Simulated, Public)
// Parameters:
// float                          dt                             (Parm)

void AwPlayer::ChangeMouseSense(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ChangeMouseSense");

	AwPlayer_ChangeMouseSense_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.MouseSenseDownAim
// (Defined, Exec, Public)

void AwPlayer::MouseSenseDownAim()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.MouseSenseDownAim");

	AwPlayer_MouseSenseDownAim_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.MouseSenseUpAim
// (Defined, Exec, Public)

void AwPlayer::MouseSenseUpAim()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.MouseSenseUpAim");

	AwPlayer_MouseSenseUpAim_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.MouseSenseDown
// (Defined, Exec, Public)

void AwPlayer::MouseSenseDown()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.MouseSenseDown");

	AwPlayer_MouseSenseDown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.MouseSenseUp
// (Defined, Exec, Public)

void AwPlayer::MouseSenseUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.MouseSenseUp");

	AwPlayer_MouseSenseUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.RemoveSkill_Client
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwPlayer::RemoveSkill_Client(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.RemoveSkill_Client");

	AwPlayer_RemoveSkill_Client_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.RemoveSkill
// (Defined, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwPlayer::RemoveSkill(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.RemoveSkill");

	AwPlayer_RemoveSkill_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ClientReStart
// (Defined, Net, NetReliable, Public)
// Parameters:
// class APawn*                   NewPawn                        (Parm)

void AwPlayer::ClientReStart(class APawn* NewPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ClientReStart");

	AwPlayer_ClientReStart_Params params;
	params.NewPawn = NewPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ApplySkill_Client
// (Defined, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwPlayer::ApplySkill_Client(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ApplySkill_Client");

	AwPlayer_ApplySkill_Client_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.AddSkill_Client
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwPlayer::AddSkill_Client(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.AddSkill_Client");

	AwPlayer_AddSkill_Client_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SkillInit_Server
// (Defined, Net, NetReliable, Public)
// Parameters:
// bool                           bQuickslotChange               (Parm)

void AwPlayer::SkillInit_Server(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SkillInit_Server");

	AwPlayer_SkillInit_Server_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.AddSkill
// (Defined, Public)
// Parameters:
// int                            iSkillID                       (Parm)

void AwPlayer::AddSkill(int iSkillID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.AddSkill");

	AwPlayer_AddSkill_Params params;
	params.iSkillID = iSkillID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ShowResultMenu
// (Defined, Simulated, Public)

void AwPlayer::ShowResultMenu()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ShowResultMenu");

	AwPlayer_ShowResultMenu_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.HIJTest00
// (Defined, Exec, Public)

void AwPlayer::HIJTest00()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.HIJTest00");

	AwPlayer_HIJTest00_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.PartsTest
// (Defined, Exec, Public)

void AwPlayer::PartsTest()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PartsTest");

	AwPlayer_PartsTest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.tT
// (Defined, Exec, Public)
// Parameters:
// float                          fRate                          (Parm)

void AwPlayer::tT(float fRate)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.tT");

	AwPlayer_tT_Params params;
	params.fRate = fRate;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.TTT
// (Defined, Exec, Public)

void AwPlayer::TTT()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.TTT");

	AwPlayer_TTT_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.HIJ
// (Defined, Exec, Public)

void AwPlayer::HIJ()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.HIJ");

	AwPlayer_HIJ_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerWarp
// (Defined, Net, NetReliable, Public)

void AwPlayer::ServerWarp()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerWarp");

	AwPlayer_ServerWarp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Warp
// (Defined, Exec, Public)

void AwPlayer::Warp()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Warp");

	AwPlayer_Warp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ActivateSupplyItem
// (Defined, Simulated, Public)
// Parameters:
// class AController*             callingController              (Parm)
// ESUPPLY_ITEM_TYPE              eSupplyItemType                (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::ActivateSupplyItem(class AController* callingController, ESUPPLY_ITEM_TYPE eSupplyItemType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ActivateSupplyItem");

	AwPlayer_ActivateSupplyItem_Params params;
	params.callingController = callingController;
	params.eSupplyItemType = eSupplyItemType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.CanUseActivateSupplyItem
// (Defined, Public)
// Parameters:
// class AController*             callingController              (Parm)
// ESUPPLY_ITEM_TYPE              eSupplyItemType                (Parm)
// bool                           bShowMessage                   (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::CanUseActivateSupplyItem(class AController* callingController, ESUPPLY_ITEM_TYPE eSupplyItemType, bool bShowMessage)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.CanUseActivateSupplyItem");

	AwPlayer_CanUseActivateSupplyItem_Params params;
	params.callingController = callingController;
	params.eSupplyItemType = eSupplyItemType;
	params.bShowMessage = bShowMessage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.UAV
// (Defined, Exec, Public)

void AwPlayer::UAV()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.UAV");

	AwPlayer_UAV_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.DoAirStrikeFire
// (Defined, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)

void AwPlayer::DoAirStrikeFire(const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.DoAirStrikeFire");

	AwPlayer_DoAirStrikeFire_Params params;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.IsActiveMyTeamSentryGun
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::IsActiveMyTeamSentryGun()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.IsActiveMyTeamSentryGun");

	AwPlayer_IsActiveMyTeamSentryGun_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.IsActiveUAV
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::IsActiveUAV()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.IsActiveUAV");

	AwPlayer_IsActiveUAV_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.IsActiveHelicopter
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::IsActiveHelicopter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.IsActiveHelicopter");

	AwPlayer_IsActiveHelicopter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.IsActiveAirFire
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::IsActiveAirFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.IsActiveAirFire");

	AwPlayer_IsActiveAirFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.heli
// (Defined, Exec, Public)

void AwPlayer::heli()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.heli");

	AwPlayer_heli_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.c4
// (Defined, Exec, Public)

void AwPlayer::c4()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.c4");

	AwPlayer_c4_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.art
// (Defined, Exec, Public)

void AwPlayer::art()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.art");

	AwPlayer_art_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerCallSentryGunInstall
// (Defined, Net, NetReliable, Public)
// Parameters:
// class AController*             callingController              (Parm)

void AwPlayer::ServerCallSentryGunInstall(class AController* callingController)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerCallSentryGunInstall");

	AwPlayer_ServerCallSentryGunInstall_Params params;
	params.callingController = callingController;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerCallAirStrike
// (Defined, Net, NetReliable, Public)
// Parameters:
// class AController*             Caller                         (OptionalParm, Parm)

void AwPlayer::ServerCallAirStrike(class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerCallAirStrike");

	AwPlayer_ServerCallAirStrike_Params params;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerCallHelicopter
// (Defined, Net, NetReliable, Public)
// Parameters:
// class APawn*                   lastHeliPawn                   (OptionalParm, Parm)
// class AController*             Caller                         (OptionalParm, Parm)

void AwPlayer::ServerCallHelicopter(class APawn* lastHeliPawn, class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerCallHelicopter");

	AwPlayer_ServerCallHelicopter_Params params;
	params.lastHeliPawn = lastHeliPawn;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Check
// (Defined, Exec, Public)

void AwPlayer::Check()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Check");

	AwPlayer_Check_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ShowBindings
// (Defined, Simulated, Exec, Public)

void AwPlayer::ShowBindings()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ShowBindings");

	AwPlayer_ShowBindings_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ShowAliases
// (Defined, Simulated, Exec, Public)

void AwPlayer::ShowAliases()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ShowAliases");

	AwPlayer_ShowAliases_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.InitializeVoiceChat
// (Defined, Simulated, Public)

void AwPlayer::InitializeVoiceChat()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.InitializeVoiceChat");

	AwPlayer_InitializeVoiceChat_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ClientReceiveBan
// (Defined, Net, NetReliable, Public)
// Parameters:
// string                         BanInfo                        (Parm, NeedCtorLink)

void AwPlayer::ClientReceiveBan(const string& BanInfo)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ClientReceiveBan");

	AwPlayer_ClientReceiveBan_Params params;
	params.BanInfo = BanInfo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerRequestBanInfo
// (Defined, Net, NetReliable, Public)
// Parameters:
// int                            PlayerID                       (Parm)

void AwPlayer::ServerRequestBanInfo(int PlayerID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerRequestBanInfo");

	AwPlayer_ServerRequestBanInfo_Params params;
	params.PlayerID = PlayerID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerSpecViewGoal
// (Defined, Net, NetReliable, Public)

void AwPlayer::ServerSpecViewGoal()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerSpecViewGoal");

	AwPlayer_ServerSpecViewGoal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SpecViewGoal
// (Defined, Exec, Public)

void AwPlayer::SpecViewGoal()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SpecViewGoal");

	AwPlayer_SpecViewGoal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerRequestPlayerInfo
// (Defined, Net, NetReliable, Public)

void AwPlayer::ServerRequestPlayerInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerRequestPlayerInfo");

	AwPlayer_ServerRequestPlayerInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.AdminMenu
// (Defined, Net, NetReliable, Exec, Public)
// Parameters:
// string                         CommandLine                    (Parm, NeedCtorLink)

void AwPlayer::AdminMenu(const string& CommandLine)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.AdminMenu");

	AwPlayer_AdminMenu_Params params;
	params.CommandLine = CommandLine;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.PostNetReceive
// (Defined, Simulated, Event, Public)

void AwPlayer::PostNetReceive()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PostNetReceive");

	AwPlayer_PostNetReceive_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.NeedNetNotify
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::NeedNetNotify()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.NeedNetNotify");

	AwPlayer_NeedNetNotify_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.ChangeCharacter
// (Defined, Exec, Public)
// Parameters:
// string                         newCharacter                   (Parm, NeedCtorLink)

void AwPlayer::ChangeCharacter(const string& newCharacter)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ChangeCharacter");

	AwPlayer_ChangeCharacter_Params params;
	params.newCharacter = newCharacter;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwPlayer::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Possess");

	AwPlayer_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SetPawnFemale
// (Defined, Public)

void AwPlayer::SetPawnFemale()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SetPawnFemale");

	AwPlayer_SetPawnFemale_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SetPlayerEquipInfo
// (Defined, Simulated, Public)

void AwPlayer::SetPlayerEquipInfo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SetPlayerEquipInfo");

	AwPlayer_SetPlayerEquipInfo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SetPawnClass
// (Defined, Net, Public)
// Parameters:
// string                         inClass                        (Parm, NeedCtorLink)
// string                         InCharacter                    (Parm, NeedCtorLink)

void AwPlayer::SetPawnClass(const string& inClass, const string& InCharacter)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SetPawnClass");

	AwPlayer_SetPawnClass_Params params;
	params.inClass = inClass;
	params.InCharacter = InCharacter;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.PawnDied
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwPlayer::PawnDied(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PawnDied");

	AwPlayer_PawnDied_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.CameraTrack
// (Defined, Public)
// Parameters:
// class APawn*                   Target                         (Parm)
// float                          DeltaTime                      (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AwPlayer::CameraTrack(class APawn* Target, float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.CameraTrack");

	AwPlayer_CameraTrack_Params params;
	params.Target = Target;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.LineOfSight
// (Defined, Public)
// Parameters:
// int                            C                              (Parm)
// class APawn*                   Target                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::LineOfSight(int C, class APawn* Target)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.LineOfSight");

	AwPlayer_LineOfSight_Params params;
	params.C = C;
	params.Target = Target;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.PickNextBot
// (Defined, Public)
// Parameters:
// class APawn*                   current                        (Parm)
// class APawn*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class APawn* AwPlayer::PickNextBot(class APawn* current)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PickNextBot");

	AwPlayer_PickNextBot_Params params;
	params.current = current;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.FindFloatingCam
// (Defined, Public)
// Parameters:
// class APawn*                   Target                         (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwPlayer::FindFloatingCam(class APawn* Target)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.FindFloatingCam");

	AwPlayer_FindFloatingCam_Params params;
	params.Target = Target;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.FindFixedCam
// (Defined, Public)
// Parameters:
// class APawn*                   Target                         (Parm)
// int                            newcam                         (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::FindFixedCam(class APawn* Target, int* newcam)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.FindFixedCam");

	AwPlayer_FindFixedCam_Params params;
	params.Target = Target;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (newcam != nullptr)
		*newcam = params.newcam;

	return params.ReturnValue;
}


// Function WGame.wPlayer.FillCameraList
// (Defined, Public)

void AwPlayer::FillCameraList()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.FillCameraList");

	AwPlayer_FillCameraList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerDoCombo
// (Defined, Net, NetReliable, Public)
// Parameters:
// class UClass*                  ComboClass                     (Parm)

void AwPlayer::ServerDoCombo(class UClass* ComboClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerDoCombo");

	AwPlayer_ServerDoCombo_Params params;
	params.ComboClass = ComboClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.DoCombo
// (Defined, Public)
// Parameters:
// class UClass*                  ComboClass                     (Parm)

void AwPlayer::DoCombo(class UClass* ComboClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.DoCombo");

	AwPlayer_DoCombo_Params params;
	params.ComboClass = ComboClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerPlayWeaponNullSound
// (Defined, Net, NetReliable, Public)
// Parameters:
// class AwWeapon*                Wpn                            (Parm)
// ESoundSlot                     Slot                           (Parm)
// bool                           UseStereo                      (OptionalParm, Parm)

void AwPlayer::ServerPlayWeaponNullSound(class AwWeapon* Wpn, ESoundSlot Slot, bool UseStereo)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerPlayWeaponNullSound");

	AwPlayer_ServerPlayWeaponNullSound_Params params;
	params.Wpn = Wpn;
	params.Slot = Slot;
	params.UseStereo = UseStereo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ProcessQuickGrenadeKey2
// (Defined, Public)

void AwPlayer::ProcessQuickGrenadeKey2()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ProcessQuickGrenadeKey2");

	AwPlayer_ProcessQuickGrenadeKey2_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ProcessQuickGrenadeKey
// (Defined, Public)

void AwPlayer::ProcessQuickGrenadeKey()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ProcessQuickGrenadeKey");

	AwPlayer_ProcessQuickGrenadeKey_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ProcessSwitchDemoPack
// (Defined, Public)
// Parameters:
// byte                           byUsed                         (Parm, OutParm)
// bool                           hasBomb                        (Parm)
// bool                           bSettingBomb                   (Parm)

void AwPlayer::ProcessSwitchDemoPack(bool hasBomb, bool bSettingBomb, byte* byUsed)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ProcessSwitchDemoPack");

	AwPlayer_ProcessSwitchDemoPack_Params params;
	params.hasBomb = hasBomb;
	params.bSettingBomb = bSettingBomb;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (byUsed != nullptr)
		*byUsed = params.byUsed;
}


// Function WGame.wPlayer.ProcessSetObjective
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::ProcessSetObjective()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ProcessSetObjective");

	AwPlayer_ProcessSetObjective_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.ProcessUseKey
// (Defined, Public)

void AwPlayer::ProcessUseKey()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ProcessUseKey");

	AwPlayer_ProcessUseKey_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.PlayerTick
// (Defined, Event, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwPlayer::PlayerTick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PlayerTick");

	AwPlayer_PlayerTick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.NotifyTakeHit
// (Defined, Public)
// Parameters:
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwPlayer::NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.NotifyTakeHit");

	AwPlayer_NotifyTakeHit_Params params;
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


// Function WGame.wPlayer.ClientReceiveCombo
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// string                         NewCombo                       (Parm, NeedCtorLink)

void AwPlayer::ClientReceiveCombo(const string& NewCombo)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ClientReceiveCombo");

	AwPlayer_ClientReceiveCombo_Params params;
	params.NewCombo = NewCombo;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerSetClassicTrans
// (Defined, Net, NetReliable, Public)
// Parameters:
// bool                           B                              (Parm)

void AwPlayer::ServerSetClassicTrans(bool B)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerSetClassicTrans");

	AwPlayer_ServerSetClassicTrans_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwPlayer::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PostNetBeginPlay");

	AwPlayer_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwPlayer::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PostBeginPlay");

	AwPlayer_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.L33TPhrase
// (Defined, Net, Exec, Public)
// Parameters:
// int                            phraseNum                      (Parm)

void AwPlayer::L33TPhrase(int phraseNum)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.L33TPhrase");

	AwPlayer_L33TPhrase_Params params;
	params.phraseNum = phraseNum;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.RateWeapon
// (Defined, Simulated, Public)
// Parameters:
// class AwWeapon*                W                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwPlayer::RateWeapon(class AwWeapon* W)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.RateWeapon");

	AwPlayer_RateWeapon_Params params;
	params.W = W;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.PlayBeepSound
// (Defined, Simulated, Public)

void AwPlayer::PlayBeepSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.PlayBeepSound");

	AwPlayer_PlayBeepSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.StopFiring
// (Defined, Public)

void AwPlayer::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.StopFiring");

	AwPlayer_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ClientReceiveMapName
// (Defined, Net, NetReliable, Public)
// Parameters:
// string                         NewMap                         (Parm, NeedCtorLink)

void AwPlayer::ClientReceiveMapName(const string& NewMap)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ClientReceiveMapName");

	AwPlayer_ClientReceiveMapName_Params params;
	params.NewMap = NewMap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerRequestMapList
// (Defined, Net, NetReliable, Public)

void AwPlayer::ServerRequestMapList()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerRequestMapList");

	AwPlayer_ServerRequestMapList_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ClientReceiveResultMenu
// (Defined, Simulated, Public)
// Parameters:
// string                         MenuClass                      (Parm, NeedCtorLink)

void AwPlayer::ClientReceiveResultMenu(const string& MenuClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ClientReceiveResultMenu");

	AwPlayer_ClientReceiveResultMenu_Params params;
	params.MenuClass = MenuClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ClientReceiveRule
// (Defined, Net, NetReliable, Public)
// Parameters:
// string                         NewRule                        (Parm, NeedCtorLink)

void AwPlayer::ClientReceiveRule(const string& NewRule)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ClientReceiveRule");

	AwPlayer_ClientReceiveRule_Params params;
	params.NewRule = NewRule;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ServerRequestRules
// (Defined, Net, NetReliable, Public)

void AwPlayer::ServerRequestRules()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerRequestRules");

	AwPlayer_ServerRequestRules_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.GetPhysicsString
// (Defined, Simulated, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwPlayer::GetPhysicsString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.GetPhysicsString");

	AwPlayer_GetPhysicsString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.GetRoleString
// (Defined, Simulated, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwPlayer::GetRoleString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.GetRoleString");

	AwPlayer_GetRoleString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.DebugMessage
// (Defined, Simulated, Public)
// Parameters:
// string                         DebugString                    (Parm, NeedCtorLink)
// FName                          Type                           (OptionalParm, Parm)

void AwPlayer::DebugMessage(const string& DebugString, const FName& Type)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.DebugMessage");

	AwPlayer_DebugMessage_Params params;
	params.DebugString = DebugString;
	params.Type = Type;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.CheckPriority
// (Defined, Exec, Public)

void AwPlayer::CheckPriority()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.CheckPriority");

	AwPlayer_CheckPriority_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.InInventoryRebuildSkipList
// (Defined, Public)
// Parameters:
// class AwWeapon*                W                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwPlayer::InInventoryRebuildSkipList(class AwWeapon* W)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.InInventoryRebuildSkipList");

	AwPlayer_InInventoryRebuildSkipList_Params params;
	params.W = W;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.ServerRequestWeapon
// (Defined, Net, NetReliable, Public)
// Parameters:
// int                            iWeaponID                      (Parm)

void AwPlayer::ServerRequestWeapon(int iWeaponID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ServerRequestWeapon");

	AwPlayer_ServerRequestWeapon_Params params;
	params.iWeaponID = iWeaponID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SetSpeed
// (Defined, Exec, Public)
// Parameters:
// float                          factor                         (Parm)

void AwPlayer::SetSpeed(float factor)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SetSpeed");

	AwPlayer_SetSpeed_Params params;
	params.factor = factor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ResetNames
// (Defined, Exec, Public)

void AwPlayer::ResetNames()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ResetNames");

	AwPlayer_ResetNames_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.setcmd
// (Defined, Exec, Public)
// Parameters:
// string                         targetName                     (Parm, NeedCtorLink)

void AwPlayer::setcmd(const string& targetName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.setcmd");

	AwPlayer_setcmd_Params params;
	params.targetName = targetName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.Cmd
// (Defined, Exec, Public)
// Parameters:
// string                         P1                             (Parm, NeedCtorLink)
// string                         P2                             (Parm, NeedCtorLink)
// string                         p3                             (Parm, NeedCtorLink)
// string                         p4                             (Parm, NeedCtorLink)
// string                         p5                             (Parm, NeedCtorLink)

void AwPlayer::Cmd(const string& P1, const string& P2, const string& p3, const string& p4, const string& p5)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.Cmd");

	AwPlayer_Cmd_Params params;
	params.P1 = P1;
	params.P2 = P2;
	params.p3 = p3;
	params.p4 = p4;
	params.p5 = p5;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SetDoTraceNativeInstant
// (Defined, Exec, Public)
// Parameters:
// bool                           val                            (Parm)

void AwPlayer::SetDoTraceNativeInstant(bool val)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SetDoTraceNativeInstant");

	AwPlayer_SetDoTraceNativeInstant_Params params;
	params.val = val;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.SetFovSpeed
// (Defined, Exec, Public)
// Parameters:
// float                          V                              (Parm)

void AwPlayer::SetFovSpeed(float V)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.SetFovSpeed");

	AwPlayer_SetFovSpeed_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.GetFovSpeed
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwPlayer::GetFovSpeed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.GetFovSpeed");

	AwPlayer_GetFovSpeed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayer.ShowPathToActor
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwPlayer::ShowPathToActor(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ShowPathToActor");

	AwPlayer_ShowPathToActor_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ProcessMapName
// (Public, Delegate)
// Parameters:
// string                         NewMap                         (Parm, NeedCtorLink)

void AwPlayer::ProcessMapName(const string& NewMap)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ProcessMapName");

	AwPlayer_ProcessMapName_Params params;
	params.NewMap = NewMap;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayer.ProcessRule
// (Public, Delegate)
// Parameters:
// string                         NewRule                        (Parm, NeedCtorLink)

void AwPlayer::ProcessRule(const string& NewRule)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayer.ProcessRule");

	AwPlayer_ProcessRule_Params params;
	params.NewRule = NewRule;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSupplyPack.CanPickUp
// (Defined, Public)
// Parameters:
// class APawn*                   Pawn                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwSupplyPack::CanPickUp(class APawn* Pawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSupplyPack.CanPickUp");

	AwSupplyPack_CanPickUp_Params params;
	params.Pawn = Pawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wSupplyPack.Landed
// (Defined, Event, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)

void AwSupplyPack::Landed(const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSupplyPack.Landed");

	AwSupplyPack_Landed_Params params;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHealthPack.GetHealMax
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwHealthPack::GetHealMax(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHealthPack.GetHealMax");

	AwHealthPack_GetHealMax_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHealthPack.Reset
// (Defined, Public)

void AwHealthPack::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHealthPack.Reset");

	AwHealthPack_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHealthPack.DisplayEvent
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwHealthPack::DisplayEvent(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHealthPack.DisplayEvent");

	AwHealthPack_DisplayEvent_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHealthPack.DeleteSuppliesPositions
// (Defined, Net, NetReliable, Public)

void AwHealthPack::DeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHealthPack.DeleteSuppliesPositions");

	AwHealthPack_DeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHealthPack.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwHealthPack::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHealthPack.PostNetBeginPlay");

	AwHealthPack_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHealthPack.UpdateHUD
// (Defined, Simulated, Static, Public)
// Parameters:
// class AHUD*                    H                              (Parm)

void AwHealthPack::STATIC_UpdateHUD(class AHUD* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHealthPack.UpdateHUD");

	AwHealthPack_UpdateHUD_Params params;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wUAVPack.CanPickUp
// (Defined, Public)
// Parameters:
// class APawn*                   Pawn                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwUAVPack::CanPickUp(class APawn* Pawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUAVPack.CanPickUp");

	AwUAVPack_CanPickUp_Params params;
	params.Pawn = Pawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wUAVPack.AnnouncePickup
// (Defined, Public)
// Parameters:
// class APawn*                   Receiver                       (Parm)

void AwUAVPack::AnnouncePickup(class APawn* Receiver)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUAVPack.AnnouncePickup");

	AwUAVPack_AnnouncePickup_Params params;
	params.Receiver = Receiver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wUAVPack.Reset
// (Defined, Public)

void AwUAVPack::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUAVPack.Reset");

	AwUAVPack_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wUAVPack.DeleteSuppliesPositions
// (Defined, Public)

void AwUAVPack::DeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUAVPack.DeleteSuppliesPositions");

	AwUAVPack_DeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wUAVPack.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwUAVPack::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUAVPack.PostNetBeginPlay");

	AwUAVPack_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wUAVPack.DisplayEvent
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwUAVPack::DisplayEvent(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUAVPack.DisplayEvent");

	AwUAVPack_DisplayEvent_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wUAVPack.UpdateHUD
// (Defined, Simulated, Static, Public)
// Parameters:
// class AHUD*                    H                              (Parm)

void AwUAVPack::STATIC_UpdateHUD(class AHUD* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wUAVPack.UpdateHUD");

	AwUAVPack_UpdateHUD_Params params;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHeliPack.CanPickUp
// (Defined, Public)
// Parameters:
// class APawn*                   Pawn                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHeliPack::CanPickUp(class APawn* Pawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHeliPack.CanPickUp");

	AwHeliPack_CanPickUp_Params params;
	params.Pawn = Pawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHeliPack.AnnouncePickup
// (Defined, Public)
// Parameters:
// class APawn*                   Receiver                       (Parm)

void AwHeliPack::AnnouncePickup(class APawn* Receiver)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHeliPack.AnnouncePickup");

	AwHeliPack_AnnouncePickup_Params params;
	params.Receiver = Receiver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHeliPack.Reset
// (Defined, Public)

void AwHeliPack::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHeliPack.Reset");

	AwHeliPack_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHeliPack.DeleteSuppliesPositions
// (Defined, Public)

void AwHeliPack::DeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHeliPack.DeleteSuppliesPositions");

	AwHeliPack_DeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHeliPack.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwHeliPack::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHeliPack.PostNetBeginPlay");

	AwHeliPack_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHeliPack.DisplayEvent
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwHeliPack::DisplayEvent(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHeliPack.DisplayEvent");

	AwHeliPack_DisplayEvent_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHeliPack.UpdateHUD
// (Defined, Simulated, Static, Public)
// Parameters:
// class AHUD*                    H                              (Parm)

void AwHeliPack::STATIC_UpdateHUD(class AHUD* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHeliPack.UpdateHUD");

	AwHeliPack_UpdateHUD_Params params;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBombingPack.CanPickUpPack
// (Defined, Static, Public)
// Parameters:
// class APawn*                   Pawn                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBombingPack::STATIC_CanPickUpPack(class APawn* Pawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBombingPack.CanPickUpPack");

	AwBombingPack_CanPickUpPack_Params params;
	params.Pawn = Pawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBombingPack.AnnouncePickup
// (Defined, Public)
// Parameters:
// class APawn*                   Receiver                       (Parm)

void AwBombingPack::AnnouncePickup(class APawn* Receiver)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBombingPack.AnnouncePickup");

	AwBombingPack_AnnouncePickup_Params params;
	params.Receiver = Receiver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBombingPack.Reset
// (Defined, Public)

void AwBombingPack::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBombingPack.Reset");

	AwBombingPack_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBombingPack.DeleteSuppliesPositions
// (Defined, Public)

void AwBombingPack::DeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBombingPack.DeleteSuppliesPositions");

	AwBombingPack_DeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBombingPack.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwBombingPack::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBombingPack.PostNetBeginPlay");

	AwBombingPack_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBombingPack.UpdateHUD
// (Defined, Simulated, Static, Public)
// Parameters:
// class AHUD*                    H                              (Parm)

void AwBombingPack::STATIC_UpdateHUD(class AHUD* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBombingPack.UpdateHUD");

	AwBombingPack_UpdateHUD_Params params;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPack.CanPickUp
// (Defined, Public)
// Parameters:
// class APawn*                   Pawn                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwSentryGunPack::CanPickUp(class APawn* Pawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPack.CanPickUp");

	AwSentryGunPack_CanPickUp_Params params;
	params.Pawn = Pawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wSentryGunPack.AnnouncePickup
// (Defined, Public)
// Parameters:
// class APawn*                   Receiver                       (Parm)

void AwSentryGunPack::AnnouncePickup(class APawn* Receiver)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPack.AnnouncePickup");

	AwSentryGunPack_AnnouncePickup_Params params;
	params.Receiver = Receiver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPack.Reset
// (Defined, Public)

void AwSentryGunPack::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPack.Reset");

	AwSentryGunPack_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPack.DeleteSuppliesPositions
// (Defined, Public)

void AwSentryGunPack::DeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPack.DeleteSuppliesPositions");

	AwSentryGunPack_DeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPack.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwSentryGunPack::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPack.PostNetBeginPlay");

	AwSentryGunPack_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPack.DisplayEvent
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwSentryGunPack::DisplayEvent(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPack.DisplayEvent");

	AwSentryGunPack_DisplayEvent_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPack.UpdateHUD
// (Defined, Simulated, Static, Public)
// Parameters:
// class AHUD*                    H                              (Parm)

void AwSentryGunPack::STATIC_UpdateHUD(class AHUD* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPack.UpdateHUD");

	AwSentryGunPack_UpdateHUD_Params params;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMedalPack.Reset
// (Defined, Public)

void AwMedalPack::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMedalPack.Reset");

	AwMedalPack_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMedalPack.DisplayEvent
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwMedalPack::DisplayEvent(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMedalPack.DisplayEvent");

	AwMedalPack_DisplayEvent_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMedalPack.DeleteSuppliesPositions
// (Defined, Net, NetReliable, Public)

void AwMedalPack::DeleteSuppliesPositions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMedalPack.DeleteSuppliesPositions");

	AwMedalPack_DeleteSuppliesPositions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMedalPack.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwMedalPack::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMedalPack.PostNetBeginPlay");

	AwMedalPack_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMedalPack.UpdateHUD
// (Defined, Simulated, Static, Public)
// Parameters:
// class AHUD*                    H                              (Parm)

void AwMedalPack::STATIC_UpdateHUD(class AHUD* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMedalPack.UpdateHUD");

	AwMedalPack_UpdateHUD_Params params;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.GameHasEnded
// (Defined, Public)

void AwBotVehicleController::GameHasEnded()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.GameHasEnded");

	AwBotVehicleController_GameHasEnded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.Stopped
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::Stopped()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.Stopped");

	AwBotVehicleController_Stopped_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.IsHunting
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::IsHunting()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.IsHunting");

	AwBotVehicleController_IsHunting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.IsStrafing
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::IsStrafing()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.IsStrafing");

	AwBotVehicleController_IsStrafing_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.DefendMelee
// (Defined, Public)
// Parameters:
// float                          dist                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::DefendMelee(float dist)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.DefendMelee");

	AwBotVehicleController_DefendMelee_Params params;
	params.dist = dist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.DoTacticalMove
// (Defined, Public)

void AwBotVehicleController::DoTacticalMove()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.DoTacticalMove");

	AwBotVehicleController_DoTacticalMove_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.DoCharge
// (Defined, Public)

void AwBotVehicleController::DoCharge()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.DoCharge");

	AwBotVehicleController_DoCharge_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.DoStakeOut
// (Defined, Public)

void AwBotVehicleController::DoStakeOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.DoStakeOut");

	AwBotVehicleController_DoStakeOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.Celebrate
// (Defined, Public)

void AwBotVehicleController::Celebrate()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.Celebrate");

	AwBotVehicleController_Celebrate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.Formation
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::Formation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.Formation");

	AwBotVehicleController_Formation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.NotifyTakeHit
// (Defined, Public)
// Parameters:
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwBotVehicleController::NotifyTakeHit(class APawn* instigatedBy, const struct FVector& HitLocation, int Damage, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NotifyTakeHit");

	AwBotVehicleController_NotifyTakeHit_Params params;
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


// Function WGame.wBotVehicleController.GetTeamNum
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwBotVehicleController::GetTeamNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.GetTeamNum");

	AwBotVehicleController_GetTeamNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.GetNextPathForMoveTarget
// (Defined, Public)

void AwBotVehicleController::GetNextPathForMoveTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.GetNextPathForMoveTarget");

	AwBotVehicleController_GetNextPathForMoveTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.GetHeli
// (Defined, Public)
// Parameters:
// class AwHelicopter*            ReturnValue                    (Parm, OutParm, ReturnParm)

class AwHelicopter* AwBotVehicleController::GetHeli()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.GetHeli");

	AwBotVehicleController_GetHeli_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.damageAttitudeTo
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// float                          Damage                         (Parm)

void AwBotVehicleController::damageAttitudeTo(class APawn* Other, float Damage)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.damageAttitudeTo");

	AwBotVehicleController_damageAttitudeTo_Params params;
	params.Other = Other;
	params.Damage = Damage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.Desireability
// (Defined, Event, Public)
// Parameters:
// class APickup*                 P                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwBotVehicleController::Desireability(class APickup* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.Desireability");

	AwBotVehicleController_Desireability_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.FaceActor
// (Defined, Public)
// Parameters:
// float                          StrafingModifier               (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwBotVehicleController::FaceActor(float StrafingModifier)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.FaceActor");

	AwBotVehicleController_FaceActor_Params params;
	params.StrafingModifier = StrafingModifier;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.ShouldStrafeTo
// (Defined, Public)
// Parameters:
// class AActor*                  WayPoint                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::ShouldStrafeTo(class AActor* WayPoint)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.ShouldStrafeTo");

	AwBotVehicleController_ShouldStrafeTo_Params params;
	params.WayPoint = WayPoint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.FaceMoveTarget
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwBotVehicleController::FaceMoveTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.FaceMoveTarget");

	AwBotVehicleController_FaceMoveTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void AwBotVehicleController::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NotifyKilled");

	AwBotVehicleController_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.TryToDuck
// (Defined, Public)
// Parameters:
// struct FVector                 duckDir                        (Parm)
// bool                           bReversed                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::TryToDuck(const struct FVector& duckDir, bool bReversed)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.TryToDuck");

	AwBotVehicleController_TryToDuck_Params params;
	params.duckDir = duckDir;
	params.bReversed = bReversed;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.ReceiveWarning
// (Defined, Public)
// Parameters:
// class APawn*                   shooter                        (Parm)
// float                          projSpeed                      (Parm)
// struct FVector                 FireDir                        (Parm)

void AwBotVehicleController::ReceiveWarning(class APawn* shooter, float projSpeed, const struct FVector& FireDir)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.ReceiveWarning");

	AwBotVehicleController_ReceiveWarning_Params params;
	params.shooter = shooter;
	params.projSpeed = projSpeed;
	params.FireDir = FireDir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.AdjustAim
// (Defined, Public)
// Parameters:
// struct FFireProperties         FiredAmmunition                (Parm)
// struct FVector                 projStart                      (Parm)
// int                            AimError                       (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AwBotVehicleController::AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.AdjustAim");

	AwBotVehicleController_AdjustAim_Params params;
	params.FiredAmmunition = FiredAmmunition;
	params.projStart = projStart;
	params.AimError = AimError;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.AdjustAimError
// (Defined, Public)
// Parameters:
// float                          AimError                       (Parm)
// float                          TargetDist                     (Parm)
// bool                           bDefendMelee                   (Parm)
// bool                           bInstantProj                   (Parm)
// bool                           bLeadTargetNow                 (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwBotVehicleController::AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.AdjustAimError");

	AwBotVehicleController_AdjustAimError_Params params;
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


// Function WGame.wBotVehicleController.CheckFutureSight
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::CheckFutureSight(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.CheckFutureSight");

	AwBotVehicleController_CheckFutureSight_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.NearWall
// (Defined, Public)
// Parameters:
// float                          walldist                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::NearWall(float walldist)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NearWall");

	AwBotVehicleController_NearWall_Params params;
	params.walldist = walldist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.NeedToTurn
// (Defined, Public)
// Parameters:
// struct FVector                 targ                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::NeedToTurn(const struct FVector& targ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NeedToTurn");

	AwBotVehicleController_NeedToTurn_Params params;
	params.targ = targ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.FindBestPathToward
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           bCheckedReach                  (Parm)
// bool                           bAllowDetour                   (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::FindBestPathToward(class AActor* A, bool bCheckedReach, bool bAllowDetour)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.FindBestPathToward");

	AwBotVehicleController_FindBestPathToward_Params params;
	params.A = A;
	params.bCheckedReach = bCheckedReach;
	params.bAllowDetour = bAllowDetour;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.NotifyLanded
// (Defined, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::NotifyLanded(const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NotifyLanded");

	AwBotVehicleController_NotifyLanded_Params params;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.SetFall
// (Defined, Public)

void AwBotVehicleController::SetFall()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SetFall");

	AwBotVehicleController_SetFall_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.NotifyBump
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::NotifyBump(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NotifyBump");

	AwBotVehicleController_NotifyBump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.AdjustAround
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::AdjustAround(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.AdjustAround");

	AwBotVehicleController_AdjustAround_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.CancelCampFor
// (Public)
// Parameters:
// class AController*             C                              (Parm)

void AwBotVehicleController::CancelCampFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.CancelCampFor");

	AwBotVehicleController_CancelCampFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.Restart
// (Defined, Public)

void AwBotVehicleController::Restart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.Restart");

	AwBotVehicleController_Restart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.TestDirection
// (Defined, Public)
// Parameters:
// struct FVector                 Dir                            (Parm)
// struct FVector                 pick                           (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::TestDirection(const struct FVector& Dir, struct FVector* pick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.TestDirection");

	AwBotVehicleController_TestDirection_Params params;
	params.Dir = Dir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (pick != nullptr)
		*pick = params.pick;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.FindRoamDest
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::FindRoamDest()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.FindRoamDest");

	AwBotVehicleController_FindRoamDest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.SoakStop
// (Defined, Event, Public)
// Parameters:
// string                         problem                        (Parm, NeedCtorLink)

void AwBotVehicleController::SoakStop(const string& problem)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SoakStop");

	AwBotVehicleController_SoakStop_Params params;
	params.problem = problem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.DoRangedAttackOn
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwBotVehicleController::DoRangedAttackOn(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.DoRangedAttackOn");

	AwBotVehicleController_DoRangedAttackOn_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.EnemyVisible
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::EnemyVisible()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.EnemyVisible");

	AwBotVehicleController_EnemyVisible_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.DoWaitForLanding
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::DoWaitForLanding()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.DoWaitForLanding");

	AwBotVehicleController_DoWaitForLanding_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.ExecuteWhatToDoNext
// (Defined, Public)

void AwBotVehicleController::ExecuteWhatToDoNext()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.ExecuteWhatToDoNext");

	AwBotVehicleController_ExecuteWhatToDoNext_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.GetEnemyName
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwBotVehicleController::GetEnemyName()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.GetEnemyName");

	AwBotVehicleController_GetEnemyName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.GetOldEnemyName
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwBotVehicleController::GetOldEnemyName()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.GetOldEnemyName");

	AwBotVehicleController_GetOldEnemyName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.TryToWalk
// (Defined, Public)

void AwBotVehicleController::TryToWalk()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.TryToWalk");

	AwBotVehicleController_TryToWalk_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.WhatToDoNext
// (Defined, Public)
// Parameters:
// byte                           CallingByte                    (Parm)

void AwBotVehicleController::WhatToDoNext(byte CallingByte)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.WhatToDoNext");

	AwBotVehicleController_WhatToDoNext_Params params;
	params.CallingByte = CallingByte;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.SetPeripheralVision
// (Defined, Public)

void AwBotVehicleController::SetPeripheralVision()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SetPeripheralVision");

	AwBotVehicleController_SetPeripheralVision_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.SetMaxDesiredSpeed
// (Defined, Public)

void AwBotVehicleController::SetMaxDesiredSpeed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SetMaxDesiredSpeed");

	AwBotVehicleController_SetMaxDesiredSpeed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.ResetSkill
// (Defined, Public)

void AwBotVehicleController::ResetSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.ResetSkill");

	AwBotVehicleController_ResetSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.InitializeSkill
// (Defined, Public)
// Parameters:
// float                          InSkill                        (Parm)

void AwBotVehicleController::InitializeSkill(float InSkill)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.InitializeSkill");

	AwBotVehicleController_InitializeSkill_Params params;
	params.InSkill = InSkill;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwBotVehicleController::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.Possess");

	AwBotVehicleController_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.NotifyMissedJump
// (Defined, Event, Public)

void AwBotVehicleController::NotifyMissedJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NotifyMissedJump");

	AwBotVehicleController_NotifyMissedJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.NotifyPhysicsVolumeChange
// (Defined, Public)
// Parameters:
// class APhysicsVolume*          NewVolume                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::NotifyPhysicsVolumeChange(class APhysicsVolume* NewVolume)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.NotifyPhysicsVolumeChange");

	AwBotVehicleController_NotifyPhysicsVolumeChange_Params params;
	params.NewVolume = NewVolume;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.StrafeFromDamage
// (Public)
// Parameters:
// float                          Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// bool                           bFindDest                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::StrafeFromDamage(float Damage, class UClass* DamageType, bool bFindDest)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.StrafeFromDamage");

	AwBotVehicleController_StrafeFromDamage_Params params;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.bFindDest = bFindDest;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.EnemyChanged
// (Defined, Public)
// Parameters:
// bool                           bNewEnemyVisible               (Parm)

void AwBotVehicleController::EnemyChanged(bool bNewEnemyVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.EnemyChanged");

	AwBotVehicleController_EnemyChanged_Params params;
	params.bNewEnemyVisible = bNewEnemyVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.SetEnemyInfo
// (Defined, Public)
// Parameters:
// bool                           bNewEnemyVisible               (Parm)

void AwBotVehicleController::SetEnemyInfo(bool bNewEnemyVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SetEnemyInfo");

	AwBotVehicleController_SetEnemyInfo_Params params;
	params.bNewEnemyVisible = bNewEnemyVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwBotVehicleController::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.Trigger");

	AwBotVehicleController_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.CheckIfShouldCrouch
// (Defined, Public)
// Parameters:
// struct FVector                 StartPosition                  (Parm)
// struct FVector                 TargetPosition                 (Parm)
// float                          Probability                    (Parm)

void AwBotVehicleController::CheckIfShouldCrouch(const struct FVector& StartPosition, const struct FVector& TargetPosition, float Probability)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.CheckIfShouldCrouch");

	AwBotVehicleController_CheckIfShouldCrouch_Params params;
	params.StartPosition = StartPosition;
	params.TargetPosition = TargetPosition;
	params.Probability = Probability;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.ClearShot
// (Defined, Public)
// Parameters:
// struct FVector                 TargetLoc                      (Parm)
// bool                           bImmediateFire                 (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::ClearShot(const struct FVector& TargetLoc, bool bImmediateFire)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.ClearShot");

	AwBotVehicleController_ClearShot_Params params;
	params.TargetLoc = TargetLoc;
	params.bImmediateFire = bImmediateFire;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.SeePlayer
// (Defined, Event, Public)
// Parameters:
// class APawn*                   SeenPlayer                     (Parm)

void AwBotVehicleController::SeePlayer(class APawn* SeenPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SeePlayer");

	AwBotVehicleController_SeePlayer_Params params;
	params.SeenPlayer = SeenPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.HearNoise
// (Defined, Public)
// Parameters:
// float                          Loudness                       (Parm)
// class AActor*                  NoiseMaker                     (Parm)

void AwBotVehicleController::HearNoise(float Loudness, class AActor* NoiseMaker)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.HearNoise");

	AwBotVehicleController_HearNoise_Params params;
	params.Loudness = Loudness;
	params.NoiseMaker = NoiseMaker;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.SetEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   NewEnemy                       (Parm)
// bool                           bHateMonster                   (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::SetEnemy(class APawn* NewEnemy, bool bHateMonster)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SetEnemy");

	AwBotVehicleController_SetEnemy_Params params;
	params.NewEnemy = NewEnemy;
	params.bHateMonster = bHateMonster;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.ChangeEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   NewEnemy                       (Parm)
// bool                           bCanSeeNewEnemy                (Parm)

void AwBotVehicleController::ChangeEnemy(class APawn* NewEnemy, bool bCanSeeNewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.ChangeEnemy");

	AwBotVehicleController_ChangeEnemy_Params params;
	params.NewEnemy = NewEnemy;
	params.bCanSeeNewEnemy = bCanSeeNewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.FindNewEnemy
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::FindNewEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.FindNewEnemy");

	AwBotVehicleController_FindNewEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwBotVehicleController::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.DisplayDebug");

	AwBotVehicleController_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wBotVehicleController.StopFiring
// (Defined, Public)

void AwBotVehicleController::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.StopFiring");

	AwBotVehicleController_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.CanAttack
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::CanAttack(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.CanAttack");

	AwBotVehicleController_CanAttack_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.FireWeaponAt
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicleController::FireWeaponAt(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.FireWeaponAt");

	AwBotVehicleController_FireWeaponAt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicleController.TimedFireWeaponAtEnemy
// (Defined, Public)

void AwBotVehicleController::TimedFireWeaponAtEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.TimedFireWeaponAtEnemy");

	AwBotVehicleController_TimedFireWeaponAtEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.WaitForMover
// (Defined, Public)
// Parameters:
// class AMover*                  M                              (Parm)

void AwBotVehicleController::WaitForMover(class AMover* M)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.WaitForMover");

	AwBotVehicleController_WaitForMover_Params params;
	params.M = M;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.SetCombatTimer
// (Defined, Public)

void AwBotVehicleController::SetCombatTimer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.SetCombatTimer");

	AwBotVehicleController_SetCombatTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.FearThisSpot
// (Defined, Public)
// Parameters:
// class AAvoidMarker*            aSpot                          (Parm)

void AwBotVehicleController::FearThisSpot(class AAvoidMarker* aSpot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.FearThisSpot");

	AwBotVehicleController_FearThisSpot_Params params;
	params.aSpot = aSpot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicleController.PostBeginPlay
// (Defined, Public)

void AwBotVehicleController::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicleController.PostBeginPlay");

	AwBotVehicleController_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPawnSoundGroup.GetEquipHitSound
// (Defined, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UwPawnSoundGroup::STATIC_GetEquipHitSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawnSoundGroup.GetEquipHitSound");

	UwPawnSoundGroup_GetEquipHitSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawnSoundGroup.GetBreathSound
// (Defined, Static, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UwPawnSoundGroup::STATIC_GetBreathSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawnSoundGroup.GetBreathSound");

	UwPawnSoundGroup_GetBreathSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawnSoundGroup.GetSound
// (Defined, Static, Public)
// Parameters:
// ESoundType                     soundType                      (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UwPawnSoundGroup::STATIC_GetSound(ESoundType soundType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawnSoundGroup.GetSound");

	UwPawnSoundGroup_GetSound_Params params;
	params.soundType = soundType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawnSoundGroup.GetLandedSound3d
// (Defined, Static, Public)
// Parameters:
// int                            SurfType                       (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UwPawnSoundGroup::STATIC_GetLandedSound3d(int SurfType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawnSoundGroup.GetLandedSound3d");

	UwPawnSoundGroup_GetLandedSound3d_Params params;
	params.SurfType = SurfType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawnSoundGroup.GetLandedSound2D
// (Defined, Static, Public)
// Parameters:
// int                            SurfType                       (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UwPawnSoundGroup::STATIC_GetLandedSound2D(int SurfType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawnSoundGroup.GetLandedSound2D");

	UwPawnSoundGroup_GetLandedSound2D_Params params;
	params.SurfType = SurfType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawnSoundGroup.GetDeathSound
// (Defined, Static, Public)
// Parameters:
// class USound*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class USound* UwPawnSoundGroup::STATIC_GetDeathSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawnSoundGroup.GetDeathSound");

	UwPawnSoundGroup_GetDeathSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPawnSoundGroup.GetHitSound
// (Defined, Static, Public)
// Parameters:
// class USound*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class USound* UwPawnSoundGroup::STATIC_GetHitSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPawnSoundGroup.GetHitSound");

	UwPawnSoundGroup_GetHitSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Combo.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void ACombo::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Combo.Tick");

	ACombo_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Combo.StopEffect
// (Public)
// Parameters:
// class AwPawn*                  P                              (Parm)

void ACombo::StopEffect(class AwPawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Combo.StopEffect");

	ACombo_StopEffect_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Combo.StartEffect
// (Public)
// Parameters:
// class AwPawn*                  P                              (Parm)

void ACombo::StartEffect(class AwPawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Combo.StartEffect");

	ACombo_StartEffect_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Combo.Destroyed
// (Defined, Public)

void ACombo::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Combo.Destroyed");

	ACombo_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Combo.AdrenalineEmpty
// (Defined, Public)

void ACombo::AdrenalineEmpty()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Combo.AdrenalineEmpty");

	ACombo_AdrenalineEmpty_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Combo.PostBeginPlay
// (Defined, Public)

void ACombo::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Combo.PostBeginPlay");

	ACombo_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.MakeMeleeHitEffect
// (Defined, Simulated, Public)

void AwWeaponAttachment::MakeMeleeHitEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.MakeMeleeHitEffect");

	AwWeaponAttachment_MakeMeleeHitEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.Timer
// (Defined, Simulated, Public)

void AwWeaponAttachment::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.Timer");

	AwWeaponAttachment_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.InitFor
// (Defined, Public)
// Parameters:
// class AInventory*              i                              (Parm)

void AwWeaponAttachment::InitFor(class AInventory* i)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.InitFor");

	AwWeaponAttachment_InitFor_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.WeaponLight
// (Defined, Simulated, Public)

void AwWeaponAttachment::WeaponLight()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.WeaponLight");

	AwWeaponAttachment_WeaponLight_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.GetTipLocation
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwWeaponAttachment::GetTipLocation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.GetTipLocation");

	AwWeaponAttachment_GetTipLocation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wWeaponAttachment.PostNetBeginPlay
// (Defined, Simulated, Public)

void AwWeaponAttachment::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.PostNetBeginPlay");

	AwWeaponAttachment_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.ThirdPersonEffects
// (Defined, Simulated, Event, Public)

void AwWeaponAttachment::ThirdPersonEffects()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.ThirdPersonEffects");

	AwWeaponAttachment_ThirdPersonEffects_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.UpdateHit
// (Defined, Public)
// Parameters:
// class AActor*                  HitActor                       (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)
// class UMaterial*               HitMaterial                    (Parm)

void AwWeaponAttachment::UpdateHit(class AActor* HitActor, const struct FVector& HitLocation, const struct FVector& HitNormal, class UMaterial* HitMaterial)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.UpdateHit");

	AwWeaponAttachment_UpdateHit_Params params;
	params.HitActor = HitActor;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;
	params.HitMaterial = HitMaterial;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.UpdatePenetrateHit
// (Defined, Public)
// Parameters:
// class AActor*                  mHitActor                      (Parm)
// struct FVector                 mHitLocation                   (Parm)
// struct FVector                 mHitNormal                     (Parm)
// class UMaterial*               mHitMaterial                   (Parm)
// int                            mLastHitIdx                    (Parm)

void AwWeaponAttachment::UpdatePenetrateHit(class AActor* mHitActor, const struct FVector& mHitLocation, const struct FVector& mHitNormal, class UMaterial* mHitMaterial, int mLastHitIdx)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.UpdatePenetrateHit");

	AwWeaponAttachment_UpdatePenetrateHit_Params params;
	params.mHitActor = mHitActor;
	params.mHitLocation = mHitLocation;
	params.mHitNormal = mHitNormal;
	params.mHitMaterial = mHitMaterial;
	params.mLastHitIdx = mLastHitIdx;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.Hide
// (Defined, Simulated, Public)
// Parameters:
// bool                           NewbHidden                     (Parm)

void AwWeaponAttachment::Hide(bool NewbHidden)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.Hide");

	AwWeaponAttachment_Hide_Params params;
	params.NewbHidden = NewbHidden;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.GetHitInfo
// (Defined, Simulated, Public)
// Parameters:
// int                            nIndex                         (Parm)
// int                            i                              (Parm)

void AwWeaponAttachment::GetHitInfo(int nIndex, int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.GetHitInfo");

	AwWeaponAttachment_GetHitInfo_Params params;
	params.nIndex = nIndex;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponAttachment.MakeSpawnShell
// (Simulated, Public)
// Parameters:
// bool                           bRechamber                     (OptionalParm, Parm)

void AwWeaponAttachment::MakeSpawnShell(bool bRechamber)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponAttachment.MakeSpawnShell");

	AwWeaponAttachment_MakeSpawnShell_Params params;
	params.bRechamber = bRechamber;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.PlayLandedSound
// (Defined, Event, Public)
// Parameters:
// int                            SurfType                       (Parm)

void AwAIPawn::PlayLandedSound(int SurfType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.PlayLandedSound");

	AwAIPawn_PlayLandedSound_Params params;
	params.SurfType = SurfType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.CheckEntryVehicle
// (Defined, Public)

void AwAIPawn::CheckEntryVehicle()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.CheckEntryVehicle");

	AwAIPawn_CheckEntryVehicle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.Tick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          dt                             (Parm)

void AwAIPawn::Tick(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.Tick");

	AwAIPawn_Tick_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.UpdateCannotFindPath
// (Defined, Public)

void AwAIPawn::UpdateCannotFindPath()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.UpdateCannotFindPath");

	AwAIPawn_UpdateCannotFindPath_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.LogCannotFindPath
// (Defined, Public)
// Parameters:
// class AActor*                  Dest                           (Parm)

void AwAIPawn::LogCannotFindPath(class AActor* Dest)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.LogCannotFindPath");

	AwAIPawn_LogCannotFindPath_Params params;
	params.Dest = Dest;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.SetCannotFIndPath
// (Defined, Public)
// Parameters:
// class AActor*                  Dest                           (Parm)

void AwAIPawn::SetCannotFIndPath(class AActor* Dest)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.SetCannotFIndPath");

	AwAIPawn_SetCannotFIndPath_Params params;
	params.Dest = Dest;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.NotifyAddDefaultInventory
// (Defined, Public)

void AwAIPawn::NotifyAddDefaultInventory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.NotifyAddDefaultInventory");

	AwAIPawn_NotifyAddDefaultInventory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIPawn.AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAIPawn::AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIPawn.AddDefaultInventory");

	AwAIPawn_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wRosterEntry.InitBot
// (Defined, Public)
// Parameters:
// class ABot*                    B                              (Parm)

void UwRosterEntry::InitBot(class ABot* B)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wRosterEntry.InitBot");

	UwRosterEntry_InitBot_Params params;
	params.B = B;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wRosterEntry.PrecacheRosterFor
// (Defined, Public)
// Parameters:
// class AUnrealTeamInfo*         t                              (Parm)

void UwRosterEntry::PrecacheRosterFor(class AUnrealTeamInfo* t)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wRosterEntry.PrecacheRosterFor");

	UwRosterEntry_PrecacheRosterFor_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wRosterEntry.CreateRosterEntryCharacter
// (Defined, Static, Public)
// Parameters:
// string                         CharName                       (Parm, NeedCtorLink)
// class UwRosterEntry*           ReturnValue                    (Parm, OutParm, ReturnParm)

class UwRosterEntry* UwRosterEntry::STATIC_CreateRosterEntryCharacter(const string& CharName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wRosterEntry.CreateRosterEntryCharacter");

	UwRosterEntry_CreateRosterEntryCharacter_Params params;
	params.CharName = CharName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wRosterEntry.CreateRosterEntry
// (Defined, Static, Public)
// Parameters:
// int                            prIdx                          (Parm)
// class UwRosterEntry*           ReturnValue                    (Parm, OutParm, ReturnParm)

class UwRosterEntry* UwRosterEntry::STATIC_CreateRosterEntry(int prIdx)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wRosterEntry.CreateRosterEntry");

	UwRosterEntry_CreateRosterEntry_Params params;
	params.prIdx = prIdx;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.SPECIES_Merc.GetRagSkelName
// (Defined, Static, Public)
// Parameters:
// string                         MeshName                       (Parm, NeedCtorLink)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string USPECIES_Merc::STATIC_GetRagSkelName(const string& MeshName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.SPECIES_Merc.GetRagSkelName");

	USPECIES_Merc_GetRagSkelName_Params params;
	params.MeshName = MeshName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBot.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwBot::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBot.Possess");

	AwBot_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBot.SetPawnClass
// (Defined, Net, Public)
// Parameters:
// string                         inClass                        (Parm, NeedCtorLink)
// string                         InCharacter                    (Parm, NeedCtorLink)

void AwBot::SetPawnClass(const string& inClass, const string& InCharacter)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBot.SetPawnClass");

	AwBot_SetPawnClass_Params params;
	params.inClass = inClass;
	params.InCharacter = InCharacter;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.GameHasEnded
// (Defined, Public)

void AwMonsterController::GameHasEnded()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.GameHasEnded");

	AwMonsterController_GameHasEnded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.Stopped
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::Stopped()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.Stopped");

	AwMonsterController_Stopped_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.IsHunting
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::IsHunting()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.IsHunting");

	AwMonsterController_IsHunting_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.IsStrafing
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::IsStrafing()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.IsStrafing");

	AwMonsterController_IsStrafing_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.DefendMelee
// (Defined, Public)
// Parameters:
// float                          dist                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::DefendMelee(float dist)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DefendMelee");

	AwMonsterController_DefendMelee_Params params;
	params.dist = dist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.DoTacticalMove
// (Defined, Public)

void AwMonsterController::DoTacticalMove()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DoTacticalMove");

	AwMonsterController_DoTacticalMove_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.DoCharge
// (Defined, Public)

void AwMonsterController::DoCharge()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DoCharge");

	AwMonsterController_DoCharge_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.DoStakeOut
// (Defined, Public)

void AwMonsterController::DoStakeOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DoStakeOut");

	AwMonsterController_DoStakeOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.Celebrate
// (Defined, Public)

void AwMonsterController::Celebrate()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.Celebrate");

	AwMonsterController_Celebrate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.Formation
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::Formation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.Formation");

	AwMonsterController_Formation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.damageAttitudeTo
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// float                          Damage                         (Parm)

void AwMonsterController::damageAttitudeTo(class APawn* Other, float Damage)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.damageAttitudeTo");

	AwMonsterController_damageAttitudeTo_Params params;
	params.Other = Other;
	params.Damage = Damage;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.Desireability
// (Defined, Event, Public)
// Parameters:
// class APickup*                 P                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwMonsterController::Desireability(class APickup* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.Desireability");

	AwMonsterController_Desireability_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.WanderOrCamp
// (Defined, Public)
// Parameters:
// bool                           bMayCrouch                     (Parm)

void AwMonsterController::WanderOrCamp(bool bMayCrouch)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.WanderOrCamp");

	AwMonsterController_WanderOrCamp_Params params;
	params.bMayCrouch = bMayCrouch;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.FaceActor
// (Defined, Public)
// Parameters:
// float                          StrafingModifier               (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwMonsterController::FaceActor(float StrafingModifier)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FaceActor");

	AwMonsterController_FaceActor_Params params;
	params.StrafingModifier = StrafingModifier;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.ShouldStrafeTo
// (Defined, Public)
// Parameters:
// class AActor*                  WayPoint                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::ShouldStrafeTo(class AActor* WayPoint)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.ShouldStrafeTo");

	AwMonsterController_ShouldStrafeTo_Params params;
	params.WayPoint = WayPoint;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.FaceMoveTarget
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwMonsterController::FaceMoveTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FaceMoveTarget");

	AwMonsterController_FaceMoveTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void AwMonsterController::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.NotifyKilled");

	AwMonsterController_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.TryToDuck
// (Defined, Public)
// Parameters:
// struct FVector                 duckDir                        (Parm)
// bool                           bReversed                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::TryToDuck(const struct FVector& duckDir, bool bReversed)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.TryToDuck");

	AwMonsterController_TryToDuck_Params params;
	params.duckDir = duckDir;
	params.bReversed = bReversed;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.ReceiveWarning
// (Defined, Public)
// Parameters:
// class APawn*                   shooter                        (Parm)
// float                          projSpeed                      (Parm)
// struct FVector                 FireDir                        (Parm)

void AwMonsterController::ReceiveWarning(class APawn* shooter, float projSpeed, const struct FVector& FireDir)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.ReceiveWarning");

	AwMonsterController_ReceiveWarning_Params params;
	params.shooter = shooter;
	params.projSpeed = projSpeed;
	params.FireDir = FireDir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.AdjustAim
// (Defined, Public)
// Parameters:
// struct FFireProperties         FiredAmmunition                (Parm)
// struct FVector                 projStart                      (Parm)
// int                            AimError                       (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AwMonsterController::AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.AdjustAim");

	AwMonsterController_AdjustAim_Params params;
	params.FiredAmmunition = FiredAmmunition;
	params.projStart = projStart;
	params.AimError = AimError;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.AdjustAimError
// (Defined, Public)
// Parameters:
// float                          AimError                       (Parm)
// float                          TargetDist                     (Parm)
// bool                           bDefendMelee                   (Parm)
// bool                           bInstantProj                   (Parm)
// bool                           bLeadTargetNow                 (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwMonsterController::AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.AdjustAimError");

	AwMonsterController_AdjustAimError_Params params;
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


// Function WGame.wMonsterController.CheckFutureSight
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::CheckFutureSight(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.CheckFutureSight");

	AwMonsterController_CheckFutureSight_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.NearWall
// (Defined, Public)
// Parameters:
// float                          walldist                       (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::NearWall(float walldist)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.NearWall");

	AwMonsterController_NearWall_Params params;
	params.walldist = walldist;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.NeedToTurn
// (Defined, Public)
// Parameters:
// struct FVector                 targ                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::NeedToTurn(const struct FVector& targ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.NeedToTurn");

	AwMonsterController_NeedToTurn_Params params;
	params.targ = targ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.FindBestPathToward
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           bCheckedReach                  (Parm)
// bool                           bAllowDetour                   (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::FindBestPathToward(class AActor* A, bool bCheckedReach, bool bAllowDetour)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FindBestPathToward");

	AwMonsterController_FindBestPathToward_Params params;
	params.A = A;
	params.bCheckedReach = bCheckedReach;
	params.bAllowDetour = bAllowDetour;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.NotifyLanded
// (Defined, Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::NotifyLanded(const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.NotifyLanded");

	AwMonsterController_NotifyLanded_Params params;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.SetFall
// (Defined, Public)

void AwMonsterController::SetFall()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SetFall");

	AwMonsterController_SetFall_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.NotifyBump
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::NotifyBump(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.NotifyBump");

	AwMonsterController_NotifyBump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.DirectedWander
// (Defined, Public)
// Parameters:
// struct FVector                 WanderDir                      (Parm)

void AwMonsterController::DirectedWander(const struct FVector& WanderDir)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DirectedWander");

	AwMonsterController_DirectedWander_Params params;
	params.WanderDir = WanderDir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.AdjustAround
// (Defined, Public)
// Parameters:
// class APawn*                   Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::AdjustAround(class APawn* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.AdjustAround");

	AwMonsterController_AdjustAround_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.CancelCampFor
// (Public)
// Parameters:
// class AController*             C                              (Parm)

void AwMonsterController::CancelCampFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.CancelCampFor");

	AwMonsterController_CancelCampFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.Restart
// (Defined, Public)

void AwMonsterController::Restart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.Restart");

	AwMonsterController_Restart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.TestDirection
// (Defined, Public)
// Parameters:
// struct FVector                 Dir                            (Parm)
// struct FVector                 pick                           (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::TestDirection(const struct FVector& Dir, struct FVector* pick)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.TestDirection");

	AwMonsterController_TestDirection_Params params;
	params.Dir = Dir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (pick != nullptr)
		*pick = params.pick;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.FindRoamDest
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::FindRoamDest()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FindRoamDest");

	AwMonsterController_FindRoamDest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.SoakStop
// (Defined, Event, Public)
// Parameters:
// string                         problem                        (Parm, NeedCtorLink)

void AwMonsterController::SoakStop(const string& problem)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SoakStop");

	AwMonsterController_SoakStop_Params params;
	params.problem = problem;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.ChooseAttackMode
// (Defined, Public)

void AwMonsterController::ChooseAttackMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.ChooseAttackMode");

	AwMonsterController_ChooseAttackMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.DoRangedAttackOn
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwMonsterController::DoRangedAttackOn(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DoRangedAttackOn");

	AwMonsterController_DoRangedAttackOn_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.FightEnemy
// (Defined, Public)
// Parameters:
// bool                           bCanCharge                     (Parm)

void AwMonsterController::FightEnemy(bool bCanCharge)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FightEnemy");

	AwMonsterController_FightEnemy_Params params;
	params.bCanCharge = bCanCharge;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.EnemyVisible
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::EnemyVisible()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.EnemyVisible");

	AwMonsterController_EnemyVisible_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.DoWaitForLanding
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::DoWaitForLanding()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DoWaitForLanding");

	AwMonsterController_DoWaitForLanding_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.ExecuteWhatToDoNext
// (Defined, Public)

void AwMonsterController::ExecuteWhatToDoNext()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.ExecuteWhatToDoNext");

	AwMonsterController_ExecuteWhatToDoNext_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.GetEnemyName
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwMonsterController::GetEnemyName()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.GetEnemyName");

	AwMonsterController_GetEnemyName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.GetOldEnemyName
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwMonsterController::GetOldEnemyName()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.GetOldEnemyName");

	AwMonsterController_GetOldEnemyName_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.TryToWalk
// (Defined, Public)

void AwMonsterController::TryToWalk()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.TryToWalk");

	AwMonsterController_TryToWalk_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.WhatToDoNext
// (Defined, Public)
// Parameters:
// byte                           CallingByte                    (Parm)

void AwMonsterController::WhatToDoNext(byte CallingByte)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.WhatToDoNext");

	AwMonsterController_WhatToDoNext_Params params;
	params.CallingByte = CallingByte;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.SetPeripheralVision
// (Defined, Public)

void AwMonsterController::SetPeripheralVision()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SetPeripheralVision");

	AwMonsterController_SetPeripheralVision_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.SetMaxDesiredSpeed
// (Defined, Public)

void AwMonsterController::SetMaxDesiredSpeed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SetMaxDesiredSpeed");

	AwMonsterController_SetMaxDesiredSpeed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.ResetSkill
// (Defined, Public)

void AwMonsterController::ResetSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.ResetSkill");

	AwMonsterController_ResetSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.InitializeSkill
// (Defined, Public)
// Parameters:
// float                          InSkill                        (Parm)

void AwMonsterController::InitializeSkill(float InSkill)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.InitializeSkill");

	AwMonsterController_InitializeSkill_Params params;
	params.InSkill = InSkill;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwMonsterController::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.Possess");

	AwMonsterController_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.NotifyMissedJump
// (Defined, Event, Public)

void AwMonsterController::NotifyMissedJump()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.NotifyMissedJump");

	AwMonsterController_NotifyMissedJump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.NotifyPhysicsVolumeChange
// (Defined, Public)
// Parameters:
// class APhysicsVolume*          NewVolume                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::NotifyPhysicsVolumeChange(class APhysicsVolume* NewVolume)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.NotifyPhysicsVolumeChange");

	AwMonsterController_NotifyPhysicsVolumeChange_Params params;
	params.NewVolume = NewVolume;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.StrafeFromDamage
// (Public)
// Parameters:
// float                          Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)
// bool                           bFindDest                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::StrafeFromDamage(float Damage, class UClass* DamageType, bool bFindDest)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.StrafeFromDamage");

	AwMonsterController_StrafeFromDamage_Params params;
	params.Damage = Damage;
	params.DamageType = DamageType;
	params.bFindDest = bFindDest;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.EnemyChanged
// (Defined, Public)
// Parameters:
// bool                           bNewEnemyVisible               (Parm)

void AwMonsterController::EnemyChanged(bool bNewEnemyVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.EnemyChanged");

	AwMonsterController_EnemyChanged_Params params;
	params.bNewEnemyVisible = bNewEnemyVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.SetEnemyInfo
// (Defined, Public)
// Parameters:
// bool                           bNewEnemyVisible               (Parm)

void AwMonsterController::SetEnemyInfo(bool bNewEnemyVisible)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SetEnemyInfo");

	AwMonsterController_SetEnemyInfo_Params params;
	params.bNewEnemyVisible = bNewEnemyVisible;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.Trigger
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwMonsterController::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.Trigger");

	AwMonsterController_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.CheckIfShouldCrouch
// (Defined, Public)
// Parameters:
// struct FVector                 StartPosition                  (Parm)
// struct FVector                 TargetPosition                 (Parm)
// float                          Probability                    (Parm)

void AwMonsterController::CheckIfShouldCrouch(const struct FVector& StartPosition, const struct FVector& TargetPosition, float Probability)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.CheckIfShouldCrouch");

	AwMonsterController_CheckIfShouldCrouch_Params params;
	params.StartPosition = StartPosition;
	params.TargetPosition = TargetPosition;
	params.Probability = Probability;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.ClearShot
// (Defined, Public)
// Parameters:
// struct FVector                 TargetLoc                      (Parm)
// bool                           bImmediateFire                 (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::ClearShot(const struct FVector& TargetLoc, bool bImmediateFire)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.ClearShot");

	AwMonsterController_ClearShot_Params params;
	params.TargetLoc = TargetLoc;
	params.bImmediateFire = bImmediateFire;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.SeePlayer
// (Defined, Event, Public)
// Parameters:
// class APawn*                   SeenPlayer                     (Parm)

void AwMonsterController::SeePlayer(class APawn* SeenPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SeePlayer");

	AwMonsterController_SeePlayer_Params params;
	params.SeenPlayer = SeenPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.HearNoise
// (Defined, Public)
// Parameters:
// float                          Loudness                       (Parm)
// class AActor*                  NoiseMaker                     (Parm)

void AwMonsterController::HearNoise(float Loudness, class AActor* NoiseMaker)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.HearNoise");

	AwMonsterController_HearNoise_Params params;
	params.Loudness = Loudness;
	params.NoiseMaker = NoiseMaker;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.SetEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   NewEnemy                       (Parm)
// bool                           bHateMonster                   (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::SetEnemy(class APawn* NewEnemy, bool bHateMonster)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SetEnemy");

	AwMonsterController_SetEnemy_Params params;
	params.NewEnemy = NewEnemy;
	params.bHateMonster = bHateMonster;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.ChangeEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   NewEnemy                       (Parm)
// bool                           bCanSeeNewEnemy                (Parm)

void AwMonsterController::ChangeEnemy(class APawn* NewEnemy, bool bCanSeeNewEnemy)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.ChangeEnemy");

	AwMonsterController_ChangeEnemy_Params params;
	params.NewEnemy = NewEnemy;
	params.bCanSeeNewEnemy = bCanSeeNewEnemy;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.FindNewEnemy
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::FindNewEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FindNewEnemy");

	AwMonsterController_FindNewEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwMonsterController::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.DisplayDebug");

	AwMonsterController_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wMonsterController.StopFiring
// (Defined, Public)

void AwMonsterController::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.StopFiring");

	AwMonsterController_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.CanAttack
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::CanAttack(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.CanAttack");

	AwMonsterController_CanAttack_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.FireWeaponAt
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwMonsterController::FireWeaponAt(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FireWeaponAt");

	AwMonsterController_FireWeaponAt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wMonsterController.TimedFireWeaponAtEnemy
// (Defined, Public)

void AwMonsterController::TimedFireWeaponAtEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.TimedFireWeaponAtEnemy");

	AwMonsterController_TimedFireWeaponAtEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.WaitForMover
// (Defined, Public)
// Parameters:
// class AMover*                  M                              (Parm)

void AwMonsterController::WaitForMover(class AMover* M)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.WaitForMover");

	AwMonsterController_WaitForMover_Params params;
	params.M = M;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.SetCombatTimer
// (Defined, Public)

void AwMonsterController::SetCombatTimer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.SetCombatTimer");

	AwMonsterController_SetCombatTimer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.FearThisSpot
// (Defined, Public)
// Parameters:
// class AAvoidMarker*            aSpot                          (Parm)

void AwMonsterController::FearThisSpot(class AAvoidMarker* aSpot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.FearThisSpot");

	AwMonsterController_FearThisSpot_Params params;
	params.aSpot = aSpot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wMonsterController.PostBeginPlay
// (Defined, Public)

void AwMonsterController::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wMonsterController.PostBeginPlay");

	AwMonsterController_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBossController.FindRandEnemy
// (Defined, Public)
// Parameters:
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwDefenceBossController::FindRandEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.FindRandEnemy");

	AwDefenceBossController_FindRandEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBossController.FightEnemy
// (Defined, Public)
// Parameters:
// bool                           bCanCharge                     (Parm)

void AwDefenceBossController::FightEnemy(bool bCanCharge)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.FightEnemy");

	AwDefenceBossController_FightEnemy_Params params;
	params.bCanCharge = bCanCharge;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBossController.WanderOrCamp
// (Defined, Public)
// Parameters:
// bool                           bMayCrouch                     (Parm)

void AwDefenceBossController::WanderOrCamp(bool bMayCrouch)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.WanderOrCamp");

	AwDefenceBossController_WanderOrCamp_Params params;
	params.bMayCrouch = bMayCrouch;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBossController.TimedFireWeaponAtTarget
// (Defined, Public)

void AwDefenceBossController::TimedFireWeaponAtTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.TimedFireWeaponAtTarget");

	AwDefenceBossController_TimedFireWeaponAtTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBossController.DoCharge
// (Defined, Public)

void AwDefenceBossController::DoCharge()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.DoCharge");

	AwDefenceBossController_DoCharge_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBossController.GetTeamNum
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwDefenceBossController::GetTeamNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.GetTeamNum");

	AwDefenceBossController_GetTeamNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDefenceBossController.InitBot
// (Defined, Public)
// Parameters:
// int                            Grade                          (Parm)

void AwDefenceBossController::InitBot(int Grade)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.InitBot");

	AwDefenceBossController_InitBot_Params params;
	params.Grade = Grade;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBossController.ResetSkill
// (Defined, Public)

void AwDefenceBossController::ResetSkill()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.ResetSkill");

	AwDefenceBossController_ResetSkill_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDefenceBossController.OnBeginRound
// (Defined, Public)

void AwDefenceBossController::OnBeginRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDefenceBossController.OnBeginRound");

	AwDefenceBossController_OnBeginRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket.PostBeginPlay
// (Defined, Simulated, Public)

void AwSeekingRocket::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket.PostBeginPlay");

	AwSeekingRocket_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket.Timer
// (Defined, Simulated, Public)

void AwSeekingRocket::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket.Timer");

	AwSeekingRocket_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction.ClearReferences
// (Public)

void UwAction::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction.ClearReferences");

	UwAction_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction.WriteFutureState
// (Defined, Public)
// Parameters:
// class UwFutureState*           fs                             (Parm, OutParm)

void UwAction::WriteFutureState(class UwFutureState** fs)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction.WriteFutureState");

	UwAction_WriteFutureState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (fs != nullptr)
		*fs = params.fs;
}


// Function WGame.wAction.Sim_PostEffect
// (Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction.Sim_PostEffect");

	UwAction_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction.Sim_PreEffect
// (Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction.Sim_PreEffect");

	UwAction_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction.Sim_GetTime
// (Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction.Sim_GetTime");

	UwAction_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction.CheckRequirement
// (Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction.CheckRequirement");

	UwAction_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction.GetGoal
// (Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction.GetGoal");

	UwAction_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wActionContainer.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UwActionContainer::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.ToString");

	UwActionContainer_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wActionContainer.FreeActionContainers
// (Defined, Public)

void UwActionContainer::FreeActionContainers()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.FreeActionContainers");

	UwActionContainer_FreeActionContainers_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wActionContainer.FreeActions
// (Defined, Public)

void UwActionContainer::FreeActions()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.FreeActions");

	UwActionContainer_FreeActions_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wActionContainer.FreeAll
// (Defined, Public)

void UwActionContainer::FreeAll()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.FreeAll");

	UwActionContainer_FreeAll_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wActionContainer.WriteFutureState
// (Defined, Public)
// Parameters:
// class UwFutureState*           fs                             (Parm, OutParm)

void UwActionContainer::WriteFutureState(class UwFutureState** fs)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.WriteFutureState");

	UwActionContainer_WriteFutureState_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (fs != nullptr)
		*fs = params.fs;
}


// Function WGame.wActionContainer.Includes
// (Defined, Public)
// Parameters:
// class UwAction*                testAction                     (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwActionContainer::Includes(class UwAction* testAction)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.Includes");

	UwActionContainer_Includes_Params params;
	params.testAction = testAction;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wActionContainer.AddSubContainer
// (Defined, Public)
// Parameters:
// class UwAction*                inAction                       (Parm)
// class UwActionContainer*       ReturnValue                    (Parm, OutParm, ReturnParm)

class UwActionContainer* UwActionContainer::AddSubContainer(class UwAction* inAction)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.AddSubContainer");

	UwActionContainer_AddSubContainer_Params params;
	params.inAction = inAction;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wActionContainer.ClearReferences
// (Defined, Public)

void UwActionContainer::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.ClearReferences");

	UwActionContainer_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wActionContainer.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UwActionContainer*       ReturnValue                    (Parm, OutParm, ReturnParm)

class UwActionContainer* UwActionContainer::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionContainer.Init");

	UwActionContainer_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.SetFocus
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal::SetFocus()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.SetFocus");

	UGoal_SetFocus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.SetFocusValue");

	UGoal_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.SetFocusValueToTarget
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal::SetFocusValueToTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.SetFocusValueToTarget");

	UGoal_SetFocusValueToTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.ToString");

	UGoal_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Level                          (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void UGoal::DisplayDebug(class UCanvas* C, int Level, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.DisplayDebug");

	UGoal_DisplayDebug_Params params;
	params.C = C;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.Goal.HandleMessage
// (Defined, Public)
// Parameters:
// string                         Msg                            (Parm, NeedCtorLink)

void UGoal::HandleMessage(const string& Msg)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.HandleMessage");

	UGoal_HandleMessage_Params params;
	params.Msg = Msg;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.End
// (Defined, Public)

void UGoal::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.End");

	UGoal_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.ProcessSubGoals
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal::ProcessSubGoals(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.ProcessSubGoals");

	UGoal_ProcessSubGoals_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.ActualWork");

	UGoal_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.Process
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal::Process(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.Process");

	UGoal_Process_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal.StartIfNotStarted
// (Defined, Public)

void UGoal::StartIfNotStarted()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.StartIfNotStarted");

	UGoal_StartIfNotStarted_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.Start
// (Defined, Public)

void UGoal::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.Start");

	UGoal_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.ClearSubgoals
// (Defined, Public)
// Parameters:
// bool                           free                           (OptionalParm, Parm)

void UGoal::ClearSubgoals(bool free)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.ClearSubgoals");

	UGoal_ClearSubgoals_Params params;
	params.free = free;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.AddSubgoal
// (Defined, Public)
// Parameters:
// class UGoal*                   inGoal                         (Parm)

void UGoal::AddSubgoal(class UGoal* inGoal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.AddSubgoal");

	UGoal_AddSubgoal_Params params;
	params.inGoal = inGoal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.NotifyDestroyed");

	UGoal_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.ClearReferences
// (Defined, Public)

void UGoal::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.ClearReferences");

	UGoal_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal.InitBase
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)

void UGoal::InitBase(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal.InitBase");

	UGoal_InitBase_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlanMaster._request
// (Defined, Private)
// Parameters:
// int                            i                              (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwPlanMaster::_request(int i)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlanMaster._request");

	UwPlanMaster__request_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlanMaster.RequestItr
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwPlanMaster::RequestItr()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlanMaster.RequestItr");

	UwPlanMaster_RequestItr_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlanMaster.RequestUpdateItr
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwPlanMaster::RequestUpdateItr()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlanMaster.RequestUpdateItr");

	UwPlanMaster_RequestUpdateItr_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlanMaster.Update
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)

void UwPlanMaster::Update(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlanMaster.Update");

	UwPlanMaster_Update_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlanMaster.Create
// (Defined, Static, Public)
// Parameters:
// class AwAILevel*               inLevel                        (Parm)
// class UwPlanMaster*            ReturnValue                    (Parm, OutParm, ReturnParm)

class UwPlanMaster* UwPlanMaster::STATIC_Create(class AwAILevel* inLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlanMaster.Create");

	UwPlanMaster_Create_Params params;
	params.inLevel = inLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.StartDeRes
// (Defined, Simulated, Public)

void AwBotVehicle::StartDeRes()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.StartDeRes");

	AwBotVehicle_StartDeRes_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.CreateGib
// (Defined, Public)
// Parameters:
// FName                          BoneName                       (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FRotator                R                              (Parm)

void AwBotVehicle::CreateGib(const FName& BoneName, class UClass* DamageType, const struct FRotator& R)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.CreateGib");

	AwBotVehicle_CreateGib_Params params;
	params.BoneName = BoneName;
	params.DamageType = DamageType;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.SetAnimAction
// (Defined, Simulated, Event, Public)
// Parameters:
// FName                          NewAction                      (Parm)
// bool                           bNoBlendAnim                   (OptionalParm, Parm)

void AwBotVehicle::SetAnimAction(const FName& NewAction, bool bNoBlendAnim)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.SetAnimAction");

	AwBotVehicle_SetAnimAction_Params params;
	params.NewAction = NewAction;
	params.bNoBlendAnim = bNoBlendAnim;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.PlayVictoryAnimation
// (Defined, Public)

void AwBotVehicle::PlayVictoryAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PlayVictoryAnimation");

	AwBotVehicle_PlayVictoryAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.MeleeDamageTarget
// (Defined, Public)
// Parameters:
// int                            hitdamage                      (Parm)
// struct FVector                 pushdir                        (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::MeleeDamageTarget(int hitdamage, const struct FVector& pushdir)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.MeleeDamageTarget");

	AwBotVehicle_MeleeDamageTarget_Params params;
	params.hitdamage = hitdamage;
	params.pushdir = pushdir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.PlayDyingSound
// (Defined, Public)

void AwBotVehicle::PlayDyingSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PlayDyingSound");

	AwBotVehicle_PlayDyingSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.PlayDying
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwBotVehicle::PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PlayDying");

	AwBotVehicle_PlayDying_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.PlayTakeHit
// (Defined, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// int                            Damage                         (Parm)
// class UClass*                  DamageType                     (Parm)

void AwBotVehicle::PlayTakeHit(const struct FVector& HitLocation, int Damage, class UClass* DamageType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PlayTakeHit");

	AwBotVehicle_PlayTakeHit_Params params;
	params.HitLocation = HitLocation;
	params.Damage = Damage;
	params.DamageType = DamageType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.IsPlayerPawn
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::IsPlayerPawn()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.IsPlayerPawn");

	AwBotVehicle_IsPlayerPawn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.SetMovementPhysics
// (Defined, Public)

void AwBotVehicle::SetMovementPhysics()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.SetMovementPhysics");

	AwBotVehicle_SetMovementPhysics_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.AnimEnd
// (Defined, Simulated, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwBotVehicle::AnimEnd(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.AnimEnd");

	AwBotVehicle_AnimEnd_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.PlayVictory
// (Public)

void AwBotVehicle::PlayVictory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PlayVictory");

	AwBotVehicle_PlayVictory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.Destroyed
// (Defined, Public)

void AwBotVehicle::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.Destroyed");

	AwBotVehicle_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.PlayChallengeSound
// (Defined, Public)

void AwBotVehicle::PlayChallengeSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PlayChallengeSound");

	AwBotVehicle_PlayChallengeSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.AssignInitialPose
// (Defined, Simulated, Public)

void AwBotVehicle::AssignInitialPose()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.AssignInitialPose");

	AwBotVehicle_AssignInitialPose_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.SameSpeciesAs
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::SameSpeciesAs(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.SameSpeciesAs");

	AwBotVehicle_SameSpeciesAs_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.LandThump
// (Defined, Public)

void AwBotVehicle::LandThump()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.LandThump");

	AwBotVehicle_LandThump_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.SpawnGiblet
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  GibClass                       (Parm)
// struct FVector                 Location                       (Parm)
// struct FRotator                Rotation                       (Parm)
// float                          GibPerterbation                (Parm)
// struct FVector                 GibVelocity                    (Parm)

void AwBotVehicle::SpawnGiblet(class UClass* GibClass, const struct FVector& Location, const struct FRotator& Rotation, float GibPerterbation, const struct FVector& GibVelocity)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.SpawnGiblet");

	AwBotVehicle_SpawnGiblet_Params params;
	params.GibClass = GibClass;
	params.Location = Location;
	params.Rotation = Rotation;
	params.GibPerterbation = GibPerterbation;
	params.GibVelocity = GibVelocity;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.PostBeginPlay
// (Defined, Event, Public)

void AwBotVehicle::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PostBeginPlay");

	AwBotVehicle_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.FireProjectile
// (Defined, Public)

void AwBotVehicle::FireProjectile()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.FireProjectile");

	AwBotVehicle_FireProjectile_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.GetFireStart
// (Defined, Public)
// Parameters:
// struct FVector                 X                              (Parm)
// struct FVector                 Y                              (Parm)
// struct FVector                 Z                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwBotVehicle::GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.GetFireStart");

	AwBotVehicle_GetFireStart_Params params;
	params.X = X;
	params.Y = Y;
	params.Z = Z;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.RangedAttackTime
// (Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwBotVehicle::RangedAttackTime()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.RangedAttackTime");

	AwBotVehicle_RangedAttackTime_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.HasRangedAttack
// (Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::HasRangedAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.HasRangedAttack");

	AwBotVehicle_HasRangedAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.PreferMelee
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::PreferMelee()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.PreferMelee");

	AwBotVehicle_PreferMelee_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.Fire
// (Defined, Public)
// Parameters:
// float                          f                              (OptionalParm, Parm)

void AwBotVehicle::Fire(float f)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.Fire");

	AwBotVehicle_Fire_Params params;
	params.f = f;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.IsHeadShot
// (Defined, Public)
// Parameters:
// struct FVector                 loc                            (Parm)
// struct FVector                 ray                            (Parm)
// float                          AdditionalScale                (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::IsHeadShot(const struct FVector& loc, const struct FVector& ray, float AdditionalScale)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.IsHeadShot");

	AwBotVehicle_IsHeadShot_Params params;
	params.loc = loc;
	params.ray = ray;
	params.AdditionalScale = AdditionalScale;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.ForceDefaultCharacter
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::ForceDefaultCharacter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.ForceDefaultCharacter");

	AwBotVehicle_ForceDefaultCharacter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.TurnOff
// (Defined, Simulated, Public)

void AwBotVehicle::TurnOff()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.TurnOff");

	AwBotVehicle_TurnOff_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.RecommendSplashDamage
// (Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::RecommendSplashDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.RecommendSplashDamage");

	AwBotVehicle_RecommendSplashDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.GetDamageRadius
// (Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwBotVehicle::GetDamageRadius()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.GetDamageRadius");

	AwBotVehicle_GetDamageRadius_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.SplashDamage
// (Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::SplashDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.SplashDamage");

	AwBotVehicle_SplashDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.StopFiring
// (Public)

void AwBotVehicle::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.StopFiring");

	AwBotVehicle_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBotVehicle.CanAttack
// (Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBotVehicle::CanAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.CanAttack");

	AwBotVehicle_CanAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBotVehicle.RangedAttack
// (Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwBotVehicle::RangedAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBotVehicle.RangedAttack");

	AwBotVehicle_RangedAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.SpawnHeli
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              Level                          (Parm)
// class AwHelicopter*            lastHeli                       (Parm)
// class AController*             Caller                         (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHelicopter::STATIC_SpawnHeli(class ALevelInfo* Level, class AwHelicopter* lastHeli, class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.SpawnHeli");

	AwHelicopter_SpawnHeli_Params params;
	params.Level = Level;
	params.lastHeli = lastHeli;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopter.GetFlyingPathNode
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              Level                          (Parm)
// int                            idx                            (Parm)
// int                            RegenLoc                       (OptionalParm, Parm)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwHelicopter::STATIC_GetFlyingPathNode(class ALevelInfo* Level, int idx, int RegenLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.GetFlyingPathNode");

	AwHelicopter_GetFlyingPathNode_Params params;
	params.Level = Level;
	params.idx = idx;
	params.RegenLoc = RegenLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopter.GetBloodHitClass
// (Defined, Simulated, Public)
// Parameters:
// ECollisionPartsType            collisionParts                 (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwHelicopter::GetBloodHitClass(ECollisionPartsType collisionParts)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.GetBloodHitClass");

	AwHelicopter_GetBloodHitClass_Params params;
	params.collisionParts = collisionParts;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopter.deleOnReachedDestination
// (Defined, Public)
// Parameters:
// struct FVector                 Dir                            (Parm)
// class AActor*                  GoalActor                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHelicopter::deleOnReachedDestination(const struct FVector& Dir, class AActor* GoalActor)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.deleOnReachedDestination");

	AwHelicopter_deleOnReachedDestination_Params params;
	params.Dir = Dir;
	params.GoalActor = GoalActor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopter.GetWeaponBoneFor
// (Defined, Public)
// Parameters:
// class AInventory*              i                              (Parm)
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwHelicopter::GetWeaponBoneFor(class AInventory* i)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.GetWeaponBoneFor");

	AwHelicopter_GetWeaponBoneFor_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopter.PoundDamageTarget
// (Defined, Public)

void AwHelicopter::PoundDamageTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.PoundDamageTarget");

	AwHelicopter_PoundDamageTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.PunchDamageTarget
// (Defined, Public)

void AwHelicopter::PunchDamageTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.PunchDamageTarget");

	AwHelicopter_PunchDamageTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.GetFireStart
// (Defined, Public)
// Parameters:
// struct FVector                 X                              (Parm)
// struct FVector                 Y                              (Parm)
// struct FVector                 Z                              (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwHelicopter::GetFireStart(const struct FVector& X, const struct FVector& Y, const struct FVector& Z)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.GetFireStart");

	AwHelicopter_GetFireStart_Params params;
	params.X = X;
	params.Y = Y;
	params.Z = Z;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopter.SpawnBelch
// (Defined, Public)

void AwHelicopter::SpawnBelch()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.SpawnBelch");

	AwHelicopter_SpawnBelch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.PlayVictory
// (Defined, Public)

void AwHelicopter::PlayVictory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.PlayVictory");

	AwHelicopter_PlayVictory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.PlayDirectionalHit
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)
// bool                           bUseHitStun                    (OptionalParm, Parm)
// bool                           bGoreChange                    (OptionalParm, Parm)

void AwHelicopter::PlayDirectionalHit(const struct FVector& HitLoc, bool bUseHitStun, bool bGoreChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.PlayDirectionalHit");

	AwHelicopter_PlayDirectionalHit_Params params;
	params.HitLoc = HitLoc;
	params.bUseHitStun = bUseHitStun;
	params.bGoreChange = bGoreChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.PlayDirectionalDeath
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)

void AwHelicopter::PlayDirectionalDeath(const struct FVector& HitLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.PlayDirectionalDeath");

	AwHelicopter_PlayDirectionalDeath_Params params;
	params.HitLoc = HitLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.Falling
// (Defined, Singular, Public)

void AwHelicopter::Falling()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.Falling");

	AwHelicopter_Falling_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.SetMovementPhysics
// (Defined, Public)

void AwHelicopter::SetMovementPhysics()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.SetMovementPhysics");

	AwHelicopter_SetMovementPhysics_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.Dodge
// (Defined, Public)
// Parameters:
// EDoubleClickDir                DoubleClickMove                (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHelicopter::Dodge(EDoubleClickDir DoubleClickMove)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.Dodge");

	AwHelicopter_Dodge_Params params;
	params.DoubleClickMove = DoubleClickMove;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopter.RangedAttack
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void AwHelicopter::RangedAttack(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.RangedAttack");

	AwHelicopter_RangedAttack_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwHelicopter::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.PostBeginPlay");

	AwHelicopter_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.ClientPlayStaySound
// (Defined, Simulated, Public)

void AwHelicopter::ClientPlayStaySound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.ClientPlayStaySound");

	AwHelicopter_ClientPlayStaySound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.ClientPlayMoveSound
// (Defined, Simulated, Public)

void AwHelicopter::ClientPlayMoveSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.ClientPlayMoveSound");

	AwHelicopter_ClientPlayMoveSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.ClientStopAllHeliSound
// (Defined, Net, NetReliable, Simulated, Public)

void AwHelicopter::ClientStopAllHeliSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.ClientStopAllHeliSound");

	AwHelicopter_ClientStopAllHeliSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.StopAllHeliSound
// (Defined, Simulated, Public)

void AwHelicopter::StopAllHeliSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.StopAllHeliSound");

	AwHelicopter_StopAllHeliSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.HeliExplosionWhenDestroyed
// (Defined, Simulated, Public)

void AwHelicopter::HeliExplosionWhenDestroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.HeliExplosionWhenDestroyed");

	AwHelicopter_HeliExplosionWhenDestroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.Destroyed
// (Defined, Event, Public)

void AwHelicopter::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.Destroyed");

	AwHelicopter_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopter.RemoveLevelHelicopter
// (Defined, Simulated, Public)

void AwHelicopter::RemoveLevelHelicopter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopter.RemoveLevelHelicopter");

	AwHelicopter_RemoveLevelHelicopter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ComboMessage.ClientReceive
// (Defined, Simulated, Static, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AComboMessage::STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ComboMessage.ClientReceive");

	AComboMessage_ClientReceive_Params params;
	params.P = P;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.ComboMessage.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AComboMessage::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.ComboMessage.GetString");

	AComboMessage_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayerReplicationInfo.GetPortrait
// (Defined, Simulated, Public)
// Parameters:
// class UMaterial*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UMaterial* AwPlayerReplicationInfo::GetPortrait()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayerReplicationInfo.GetPortrait");

	AwPlayerReplicationInfo_GetPortrait_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPlayerReplicationInfo.UpdateCharacter
// (Defined, Simulated, Event, Public)

void AwPlayerReplicationInfo::UpdateCharacter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayerReplicationInfo.UpdateCharacter");

	AwPlayerReplicationInfo_UpdateCharacter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayerReplicationInfo.SetCharacterName
// (Defined, Simulated, Public)
// Parameters:
// string                         S                              (Parm, NeedCtorLink)

void AwPlayerReplicationInfo::SetCharacterName(const string& S)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayerReplicationInfo.SetCharacterName");

	AwPlayerReplicationInfo_SetCharacterName_Params params;
	params.S = S;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPlayerReplicationInfo.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AwPlayerReplicationInfo::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPlayerReplicationInfo.UpdatePrecacheMaterials");

	AwPlayerReplicationInfo_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.PlayerRecordClass.FillPlayerRecord
// (Defined, Simulated, Static, Public)
// Parameters:
// struct FPlayerRecord           ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FPlayerRecord UPlayerRecordClass::STATIC_FillPlayerRecord()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.PlayerRecordClass.FillPlayerRecord");

	UPlayerRecordClass_FillPlayerRecord_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIBot.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwAIBot::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBot.Possess");

	AwAIBot_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIBot.SetPawnClass
// (Defined, Net, Public)
// Parameters:
// string                         inClass                        (Parm, NeedCtorLink)
// string                         InCharacter                    (Parm, NeedCtorLink)

void AwAIBot::SetPawnClass(const string& inClass, const string& InCharacter)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIBot.SetPawnClass");

	AwAIBot_SetPawnClass_Params params;
	params.inClass = inClass;
	params.InCharacter = InCharacter;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket_Nemesis.wLoadOut_SetStaticMesh
// (Defined, Simulated, Public)
// Parameters:
// class UStaticMesh*             stMesh                         (Parm)

void AwSeekingRocket_Nemesis::wLoadOut_SetStaticMesh(class UStaticMesh* stMesh)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket_Nemesis.wLoadOut_SetStaticMesh");

	AwSeekingRocket_Nemesis_wLoadOut_SetStaticMesh_Params params;
	params.stMesh = stMesh;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket_Nemesis.TakeDamage
// (Defined, Simulated, Public)
// Parameters:
// int                            Damage                         (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void AwSeekingRocket_Nemesis::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket_Nemesis.TakeDamage");

	AwSeekingRocket_Nemesis_TakeDamage_Params params;
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


// Function WGame.wSeekingRocket_Nemesis.SetSpawnEmitter
// (Defined, Simulated, Public)

void AwSeekingRocket_Nemesis::SetSpawnEmitter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket_Nemesis.SetSpawnEmitter");

	AwSeekingRocket_Nemesis_SetSpawnEmitter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket_Nemesis.SetSpeed
// (Defined, Public)
// Parameters:
// float                          fSpeed                         (Parm)

void AwSeekingRocket_Nemesis::SetSpeed(float fSpeed)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket_Nemesis.SetSpeed");

	AwSeekingRocket_Nemesis_SetSpeed_Params params;
	params.fSpeed = fSpeed;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket_Nemesis.Timer
// (Defined, Simulated, Public)

void AwSeekingRocket_Nemesis::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket_Nemesis.Timer");

	AwSeekingRocket_Nemesis_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket_Nemesis.HurtRadius
// (Defined, Simulated, Public)
// Parameters:
// float                          DamageAmount                   (Parm)
// float                          DamageRadius                   (Parm)
// class UClass*                  DamageType                     (Parm)
// float                          Momentum                       (Parm)
// struct FVector                 HitLocation                    (Parm)

void AwSeekingRocket_Nemesis::HurtRadius(float DamageAmount, float DamageRadius, class UClass* DamageType, float Momentum, const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket_Nemesis.HurtRadius");

	AwSeekingRocket_Nemesis_HurtRadius_Params params;
	params.DamageAmount = DamageAmount;
	params.DamageRadius = DamageRadius;
	params.DamageType = DamageType;
	params.Momentum = Momentum;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingRocket_Nemesis.Touch
// (Defined, Singular, Simulated, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwSeekingRocket_Nemesis::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingRocket_Nemesis.Touch");

	AwSeekingRocket_Nemesis_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingIncenRocket_Nemesis.Explode
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)

void AwSeekingIncenRocket_Nemesis::Explode(const struct FVector& HitLocation, const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingIncenRocket_Nemesis.Explode");

	AwSeekingIncenRocket_Nemesis_Explode_Params params;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSeekingIncenRocket_Nemesis.SplashGrenades
// (Defined, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)

void AwSeekingIncenRocket_Nemesis::SplashGrenades(const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSeekingIncenRocket_Nemesis.SplashGrenades");

	AwSeekingIncenRocket_Nemesis_SplashGrenades_Params params;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wIncendiaryRocket.Explode
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)

void AwIncendiaryRocket::Explode(const struct FVector& HitLocation, const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wIncendiaryRocket.Explode");

	AwIncendiaryRocket_Explode_Params params;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wIncendiaryRocket.Destroyed
// (Defined, Simulated, Public)

void AwIncendiaryRocket::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wIncendiaryRocket.Destroyed");

	AwIncendiaryRocket_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wIncendiaryRocket.SpawnTrail
// (Defined, Simulated, Public)

void AwIncendiaryRocket::SpawnTrail()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wIncendiaryRocket.SpawnTrail");

	AwIncendiaryRocket_SpawnTrail_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wIncendiaryRocket.SetSpawnEmitter
// (Defined, Simulated, Public)

void AwIncendiaryRocket::SetSpawnEmitter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wIncendiaryRocket.SetSpawnEmitter");

	AwIncendiaryRocket_SetSpawnEmitter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wIncendiaryRocket.SplashGrenades
// (Defined, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)

void AwIncendiaryRocket::SplashGrenades(const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wIncendiaryRocket.SplashGrenades");

	AwIncendiaryRocket_SplashGrenades_Params params;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wIncendiaryRocket.HurtRadius
// (Defined, Simulated, Public)
// Parameters:
// float                          DamageAmount                   (Parm)
// float                          DamageRadius                   (Parm)
// class UClass*                  DamageType                     (Parm)
// float                          Momentum                       (Parm)
// struct FVector                 HitLocation                    (Parm)

void AwIncendiaryRocket::HurtRadius(float DamageAmount, float DamageRadius, class UClass* DamageType, float Momentum, const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wIncendiaryRocket.HurtRadius");

	AwIncendiaryRocket_HurtRadius_Params params;
	params.DamageAmount = DamageAmount;
	params.DamageRadius = DamageRadius;
	params.DamageType = DamageType;
	params.Momentum = Momentum;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_PlanAndExec::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.ToString");

	UGoal_PlanAndExec_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_PlanAndExec.HandleMessage
// (Defined, Public)
// Parameters:
// string                         Msg                            (Parm, NeedCtorLink)

void UGoal_PlanAndExec::HandleMessage(const string& Msg)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.HandleMessage");

	UGoal_PlanAndExec_HandleMessage_Params params;
	params.Msg = Msg;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_PlanAndExec::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.ActualWork");

	UGoal_PlanAndExec_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_PlanAndExec.Start
// (Defined, Public)

void UGoal_PlanAndExec::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.Start");

	UGoal_PlanAndExec_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.LogFlag
// (Defined, Public)

void UGoal_PlanAndExec::LogFlag()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.LogFlag");

	UGoal_PlanAndExec_LogFlag_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.LogPlan
// (Defined, Public)
// Parameters:
// int                            tries                          (Parm)
// float                          planScore                      (Parm)
// class UwActionContainer*       Plan                           (Parm, OutParm)

void UGoal_PlanAndExec::LogPlan(int tries, float planScore, class UwActionContainer** Plan)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.LogPlan");

	UGoal_PlanAndExec_LogPlan_Params params;
	params.tries = tries;
	params.planScore = planScore;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Plan != nullptr)
		*Plan = params.Plan;
}


// Function WGame.Goal_PlanAndExec.LookForBetterPlan
// (Defined, Public)
// Parameters:
// int                            tries                          (Parm)

void UGoal_PlanAndExec::LookForBetterPlan(int tries)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.LookForBetterPlan");

	UGoal_PlanAndExec_LookForBetterPlan_Params params;
	params.tries = tries;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.Replan
// (Defined, Public)

void UGoal_PlanAndExec::Replan()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.Replan");

	UGoal_PlanAndExec_Replan_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.DecidePurposeToActivate
// (Defined, Public)

void UGoal_PlanAndExec::DecidePurposeToActivate()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.DecidePurposeToActivate");

	UGoal_PlanAndExec_DecidePurposeToActivate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.InitPurposes
// (Defined, Public)

void UGoal_PlanAndExec::InitPurposes()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.InitPurposes");

	UGoal_PlanAndExec_InitPurposes_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.ClearReferences
// (Defined, Public)

void UGoal_PlanAndExec::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.ClearReferences");

	UGoal_PlanAndExec_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PlanAndExec.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UwActionPlanner*         inPlaner                       (Parm)
// class UGoal_PlanAndExec*       ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_PlanAndExec* UGoal_PlanAndExec::Init(class AwAIBotBase* inOwner, class UwActionPlanner* inPlaner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PlanAndExec.Init");

	UGoal_PlanAndExec_Init_Params params;
	params.inOwner = inOwner;
	params.inPlaner = inPlaner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Fire.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Fire::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.ToString");

	UGoal_Fire_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Fire.End
// (Defined, Public)

void UGoal_Fire::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.End");

	UGoal_Fire_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Fire.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Fire::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.ActualWork");

	UGoal_Fire_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Fire.Start
// (Defined, Public)

void UGoal_Fire::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.Start");

	UGoal_Fire_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Fire.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_Fire::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.SetFocusValue");

	UGoal_Fire_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Fire.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_Fire::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.NotifyDestroyed");

	UGoal_Fire_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Fire.ClearReferences
// (Defined, Public)

void UGoal_Fire::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.ClearReferences");

	UGoal_Fire_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Fire.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class AActor*                  inTarget                       (Parm)
// bool                           inDoAim                        (Parm)
// int                            inFireCount                    (Parm)
// class UGoal_Fire*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Fire* UGoal_Fire::Init(class AwAIBotBase* inOwner, class AActor* inTarget, bool inDoAim, int inFireCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fire.Init");

	UGoal_Fire_Init_Params params;
	params.inOwner = inOwner;
	params.inTarget = inTarget;
	params.inDoAim = inDoAim;
	params.inFireCount = inFireCount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MovePathToward.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_MovePathToward::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MovePathToward.NotifyDestroyed");

	UGoal_MovePathToward_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MovePathToward.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_MovePathToward::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MovePathToward.ToString");

	UGoal_MovePathToward_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MovePathToward.AddGoalMoveToward
// (Defined, Public)
// Parameters:
// int                            stackLevel                     (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_MovePathToward::AddGoalMoveToward(int stackLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MovePathToward.AddGoalMoveToward");

	UGoal_MovePathToward_AddGoalMoveToward_Params params;
	params.stackLevel = stackLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MovePathToward.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_MovePathToward::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MovePathToward.ActualWork");

	UGoal_MovePathToward_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MovePathToward.Start
// (Defined, Public)

void UGoal_MovePathToward::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MovePathToward.Start");

	UGoal_MovePathToward_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MovePathToward.ClearReferences
// (Defined, Public)

void UGoal_MovePathToward::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MovePathToward.ClearReferences");

	UGoal_MovePathToward_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MovePathToward.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class AActor*                  inDestination                  (Parm)
// float                          inReachRadius                  (OptionalParm, Parm)
// class UGoal_MovePathToward*    ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_MovePathToward* UGoal_MovePathToward::Init(class AwAIBotBase* inOwner, class AActor* inDestination, float inReachRadius)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MovePathToward.Init");

	UGoal_MovePathToward_Init_Params params;
	params.inOwner = inOwner;
	params.inDestination = inDestination;
	params.inReachRadius = inReachRadius;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Roam.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Roam::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Roam.ToString");

	UGoal_Roam_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Roam.AddGoalMovePathToward
// (Defined, Public)

void UGoal_Roam::AddGoalMovePathToward()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Roam.AddGoalMovePathToward");

	UGoal_Roam_AddGoalMovePathToward_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Roam.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Roam::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Roam.ActualWork");

	UGoal_Roam_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Roam.Start
// (Defined, Public)

void UGoal_Roam::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Roam.Start");

	UGoal_Roam_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Roam.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_Roam*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Roam* UGoal_Roam::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Roam.Init");

	UGoal_Roam_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Shoot.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Shoot::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Shoot.ToString");

	UGoal_Shoot_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Shoot.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Shoot::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Shoot.ActualWork");

	UGoal_Shoot_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Shoot.Start
// (Defined, Public)

void UGoal_Shoot::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Shoot.Start");

	UGoal_Shoot_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Shoot.ClearReferences
// (Defined, Public)

void UGoal_Shoot::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Shoot.ClearReferences");

	UGoal_Shoot_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Shoot.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class AActor*                  inTarget                       (Parm)
// bool                           inDoAim                        (Parm)
// class UGoal_Shoot*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Shoot* UGoal_Shoot::Init(class AwAIBotBase* inOwner, class AActor* inTarget, bool inDoAim)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Shoot.Init");

	UGoal_Shoot_Init_Params params;
	params.inOwner = inOwner;
	params.inTarget = inTarget;
	params.inDoAim = inDoAim;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Test.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Test::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Test.ToString");

	UGoal_Test_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Test.AddGoal
// (Defined, Public)

void UGoal_Test::AddGoal()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Test.AddGoal");

	UGoal_Test_AddGoal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Test.GetReachableRandomTarget
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* UGoal_Test::GetReachableRandomTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Test.GetReachableRandomTarget");

	UGoal_Test_GetReachableRandomTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Test.End
// (Defined, Public)

void UGoal_Test::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Test.End");

	UGoal_Test_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Test.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Test::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Test.ActualWork");

	UGoal_Test_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Test.Start
// (Defined, Public)

void UGoal_Test::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Test.Start");

	UGoal_Test_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Test.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_Test*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Test* UGoal_Test::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Test.Init");

	UGoal_Test_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPurpose.GetActivationScore
// (Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwPurpose::GetActivationScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPurpose.GetActivationScore");

	UwPurpose_GetActivationScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPurpose.Evaluate
// (Public)
// Parameters:
// class UwStateData*             S                              (Parm, OutParm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwPurpose::Evaluate(class UwStateData** S)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPurpose.Evaluate");

	UwPurpose_Evaluate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (S != nullptr)
		*S = params.S;

	return params.ReturnValue;
}


// Function WGame.wPurpose.Create
// (Defined, Static, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UwPurpose*               ReturnValue                    (Parm, OutParm, ReturnParm)

class UwPurpose* UwPurpose::STATIC_Create(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPurpose.Create");

	UwPurpose_Create_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPurposeExplore.GetActivationScore
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwPurposeExplore::GetActivationScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPurposeExplore.GetActivationScore");

	UwPurposeExplore_GetActivationScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPurposeExplore.Evaluate
// (Defined, Public)
// Parameters:
// class UwStateData*             S                              (Parm, OutParm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwPurposeExplore::Evaluate(class UwStateData** S)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPurposeExplore.Evaluate");

	UwPurposeExplore_Evaluate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (S != nullptr)
		*S = params.S;

	return params.ReturnValue;
}


// Function WGame.wActionPlanner.Plan
// (Defined, Public)
// Parameters:
// class UwPurpose*               purpose                        (Parm)
// int                            tries                          (Parm)
// float                          bestPlanScore                  (Parm, OutParm)
// class UwActionContainer*       ReturnValue                    (Parm, OutParm, ReturnParm)

class UwActionContainer* UwActionPlanner::Plan(class UwPurpose* purpose, int tries, float* bestPlanScore)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.Plan");

	UwActionPlanner_Plan_Params params;
	params.purpose = purpose;
	params.tries = tries;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (bestPlanScore != nullptr)
		*bestPlanScore = params.bestPlanScore;

	return params.ReturnValue;
}


// Function WGame.wActionPlanner.SubPlan
// (Defined, Protected)
// Parameters:
// int                            Layer                          (Parm)
// class UwActionContainer*       acon                           (Parm, OutParm)
// class UwStateData*             S                              (Parm, OutParm)
// class UwActionLayer*[]         Actions                        (Parm, OutParm, NeedCtorLink)
// class UwPurpose*               purpose                        (Parm)
// float                          parentActionTime               (Parm)

void UwActionPlanner::SubPlan(int Layer, class UwPurpose* purpose, float parentActionTime, class UwActionContainer** acon, class UwStateData** S, class UwActionLayer*[]* Actions)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.SubPlan");

	UwActionPlanner_SubPlan_Params params;
	params.Layer = Layer;
	params.purpose = purpose;
	params.parentActionTime = parentActionTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (acon != nullptr)
		*acon = params.acon;
	if (S != nullptr)
		*S = params.S;
	if (Actions != nullptr)
		*Actions = params.Actions;
}


// Function WGame.wActionPlanner.GetActionCandidatesByLayer
// (Defined, Protected)
// Parameters:
// class UwAction*[]              rawActions                     (Parm, OutParm, NeedCtorLink)
// class UwActionLayer*[]         actionsByLayer                 (Parm, OutParm, NeedCtorLink)

void UwActionPlanner::GetActionCandidatesByLayer(class UwAction*[]* rawActions, class UwActionLayer*[]* actionsByLayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.GetActionCandidatesByLayer");

	UwActionPlanner_GetActionCandidatesByLayer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (rawActions != nullptr)
		*rawActions = params.rawActions;
	if (actionsByLayer != nullptr)
		*actionsByLayer = params.actionsByLayer;
}


// Function WGame.wActionPlanner.GetActionCandidates
// (Defined, Protected)
// Parameters:
// class UwAction*[]              Actions                        (Parm, OutParm, NeedCtorLink)

void UwActionPlanner::GetActionCandidates(class UwAction*[]* Actions)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.GetActionCandidates");

	UwActionPlanner_GetActionCandidates_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Actions != nullptr)
		*Actions = params.Actions;
}


// Function WGame.wActionPlanner.GetActionCandidates_Pick
// (Defined, Protected)
// Parameters:
// class UwAction*[]              Actions                        (Parm, OutParm, NeedCtorLink)

void UwActionPlanner::GetActionCandidates_Pick(class UwAction*[]* Actions)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.GetActionCandidates_Pick");

	UwActionPlanner_GetActionCandidates_Pick_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Actions != nullptr)
		*Actions = params.Actions;
}


// Function WGame.wActionPlanner.GetActionCandidates_SwitchWeapon
// (Defined, Protected)
// Parameters:
// class UwAction*[]              Actions                        (Parm, OutParm, NeedCtorLink)

void UwActionPlanner::GetActionCandidates_SwitchWeapon(class UwAction*[]* Actions)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.GetActionCandidates_SwitchWeapon");

	UwActionPlanner_GetActionCandidates_SwitchWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Actions != nullptr)
		*Actions = params.Actions;
}


// Function WGame.wActionPlanner.ClearReferences
// (Defined, Public)

void UwActionPlanner::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.ClearReferences");

	UwActionPlanner_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wActionPlanner.Create
// (Defined, Static, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UwNPCActions*            Actions                        (Parm)
// class UwActionPlanner*         ReturnValue                    (Parm, OutParm, ReturnParm)

class UwActionPlanner* UwActionPlanner::STATIC_Create(class AwAIBotBase* inOwner, class UwNPCActions* Actions)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionPlanner.Create");

	UwActionPlanner_Create_Params params;
	params.inOwner = inOwner;
	params.Actions = Actions;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wFutureState.Init
// (Defined, Public)

void UwFutureState::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wFutureState.Init");

	UwFutureState_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wFutureState.Create
// (Defined, Static, Public)
// Parameters:
// class UwFutureState*           ReturnValue                    (Parm, OutParm, ReturnParm)

class UwFutureState* UwFutureState::STATIC_Create()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wFutureState.Create");

	UwFutureState_Create_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.TargetingSystem.ClearReferences
// (Defined, Public)

void UTargetingSystem::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.TargetingSystem.ClearReferences");

	UTargetingSystem_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.TargetingSystem.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void UTargetingSystem::DisplayDebug(class UCanvas* C, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.TargetingSystem.DisplayDebug");

	UTargetingSystem_DisplayDebug_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.TargetingSystem.Update
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)

void UTargetingSystem::Update(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.TargetingSystem.Update");

	UTargetingSystem_Update_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.TargetingSystem.GetTarget
// (Defined, Public)
// Parameters:
// class UMemoryItem*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UMemoryItem* UTargetingSystem::GetTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.TargetingSystem.GetTarget");

	UTargetingSystem_GetTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.TargetingSystem.InitEvaluator
// (Defined, Public)

void UTargetingSystem::InitEvaluator()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.TargetingSystem.InitEvaluator");

	UTargetingSystem_InitEvaluator_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.TargetingSystem.Create
// (Defined, Static, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UTargetingSystem*        ReturnValue                    (Parm, OutParm, ReturnParm)

class UTargetingSystem* UTargetingSystem::STATIC_Create(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.TargetingSystem.Create");

	UTargetingSystem_Create_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.OnEndRound
// (Defined, Public)

void AwHelicopterController::OnEndRound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.OnEndRound");

	AwHelicopterController_OnEndRound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.PawnDied
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwHelicopterController::PawnDied(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.PawnDied");

	AwHelicopterController_PawnDied_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.ClientOnEndWaitingForStart
// (Defined, Net, NetReliable, Public)

void AwHelicopterController::ClientOnEndWaitingForStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.ClientOnEndWaitingForStart");

	AwHelicopterController_ClientOnEndWaitingForStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.Disappear
// (Defined, Public)

void AwHelicopterController::Disappear()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.Disappear");

	AwHelicopterController_Disappear_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.ServerStopAllSoundByHeli
// (Defined, Net, NetReliable, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwHelicopterController::ServerStopAllSoundByHeli(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.ServerStopAllSoundByHeli");

	AwHelicopterController_ServerStopAllSoundByHeli_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.PlayStaySound
// (Defined, Public)

void AwHelicopterController::PlayStaySound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.PlayStaySound");

	AwHelicopterController_PlayStaySound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.PlayMoveSound
// (Defined, Public)

void AwHelicopterController::PlayMoveSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.PlayMoveSound");

	AwHelicopterController_PlayMoveSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.Decelerate
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)

void AwHelicopterController::Decelerate(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.Decelerate");

	AwHelicopterController_Decelerate_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.Accelerate
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)

void AwHelicopterController::Accelerate(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.Accelerate");

	AwHelicopterController_Accelerate_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.GetEnemy
// (Defined, Public)
// Parameters:
// class APawn*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class APawn* AwHelicopterController::GetEnemy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetEnemy");

	AwHelicopterController_GetEnemy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.GetDotAgainstGround
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHelicopterController::GetDotAgainstGround(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetDotAgainstGround");

	AwHelicopterController_GetDotAgainstGround_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.GetDot
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwHelicopterController::GetDot(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetDot");

	AwHelicopterController_GetDot_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.GetMomentousRandomDest
// (Defined, Public)
// Parameters:
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwHelicopterController::GetMomentousRandomDest()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetMomentousRandomDest");

	AwHelicopterController_GetMomentousRandomDest_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.ProgressFlyingPathNode
// (Defined, Public)

void AwHelicopterController::ProgressFlyingPathNode()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.ProgressFlyingPathNode");

	AwHelicopterController_ProgressFlyingPathNode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.GetNextFlyingPathNode
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwHelicopterController::GetNextFlyingPathNode()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetNextFlyingPathNode");

	AwHelicopterController_GetNextFlyingPathNode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.Degree2Unreal
// (Defined, Public)
// Parameters:
// float                          Angle                          (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwHelicopterController::Degree2Unreal(float Angle)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.Degree2Unreal");

	AwHelicopterController_Degree2Unreal_Params params;
	params.Angle = Angle;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.GetSignedRandom
// (Defined, Public)
// Parameters:
// int                            Min                            (Parm)
// int                            Max                            (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwHelicopterController::GetSignedRandom(int Min, int Max)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetSignedRandom");

	AwHelicopterController_GetSignedRandom_Params params;
	params.Min = Min;
	params.Max = Max;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.AdjustAim
// (Defined, Public)
// Parameters:
// struct FFireProperties         FiredAmmunition                (Parm)
// struct FVector                 projStart                      (Parm)
// int                            AimError                       (Parm)
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AwHelicopterController::AdjustAim(const struct FFireProperties& FiredAmmunition, const struct FVector& projStart, int AimError)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.AdjustAim");

	AwHelicopterController_AdjustAim_Params params;
	params.FiredAmmunition = FiredAmmunition;
	params.projStart = projStart;
	params.AimError = AimError;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.GetPRI
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  ReturnValue                    (Parm, OutParm, ReturnParm)

class APlayerReplicationInfo* AwHelicopterController::GetPRI()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetPRI");

	AwHelicopterController_GetPRI_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.GameHasEnded
// (Defined, Public)

void AwHelicopterController::GameHasEnded()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GameHasEnded");

	AwHelicopterController_GameHasEnded_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.GetTeamNum
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwHelicopterController::GetTeamNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetTeamNum");

	AwHelicopterController_GetTeamNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.GetHeli
// (Defined, Public)
// Parameters:
// class AwHelicopter*            ReturnValue                    (Parm, OutParm, ReturnParm)

class AwHelicopter* AwHelicopterController::GetHeli()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.GetHeli");

	AwHelicopterController_GetHeli_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.NotifyKilled
// (Defined, Public)
// Parameters:
// class AController*             Killer                         (Parm)
// class AController*             Killed                         (Parm)
// class APawn*                   KilledPawn                     (Parm)

void AwHelicopterController::NotifyKilled(class AController* Killer, class AController* Killed, class APawn* KilledPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.NotifyKilled");

	AwHelicopterController_NotifyKilled_Params params;
	params.Killer = Killer;
	params.Killed = Killed;
	params.KilledPawn = KilledPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwHelicopterController::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.Possess");

	AwHelicopterController_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wHelicopterController.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwHelicopterController::DisplayDebug(class UCanvas* C, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.DisplayDebug");

	AwHelicopterController_DisplayDebug_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wHelicopterController.IncY
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwHelicopterController::IncY(class UCanvas* C, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.IncY");

	AwHelicopterController_IncY_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wHelicopterController.Rotator2String
// (Defined, Public)
// Parameters:
// struct FRotator                R                              (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwHelicopterController::Rotator2String(const struct FRotator& R)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.Rotator2String");

	AwHelicopterController_Rotator2String_Params params;
	params.R = R;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.Vector2String
// (Defined, Public)
// Parameters:
// struct FVector                 V                              (Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwHelicopterController::Vector2String(const struct FVector& V)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.Vector2String");

	AwHelicopterController_Vector2String_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.FireWeaponAt
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwHelicopterController::FireWeaponAt(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.FireWeaponAt");

	AwHelicopterController_FireWeaponAt_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wHelicopterController.CancelCampFor
// (Public)
// Parameters:
// class AController*             C                              (Parm)

void AwHelicopterController::CancelCampFor(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wHelicopterController.CancelCampFor");

	AwHelicopterController_CancelCampFor_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.EncroachingOn
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADECO_Barricade::EncroachingOn(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.EncroachingOn");

	ADECO_Barricade_EncroachingOn_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DECO_Barricade.EncroachedBy
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void ADECO_Barricade::EncroachedBy(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.EncroachedBy");

	ADECO_Barricade_EncroachedBy_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.Bump
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void ADECO_Barricade::Bump(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.Bump");

	ADECO_Barricade_Bump_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.Reset
// (Defined, Public)

void ADECO_Barricade::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.Reset");

	ADECO_Barricade_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.IsNearbyBarrel
// (Final, Defined, Simulated, Public)
// Parameters:
// class AActor*                  A                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool ADECO_Barricade::IsNearbyBarrel(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.IsNearbyBarrel");

	ADECO_Barricade_IsNearbyBarrel_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DECO_Barricade.HurtRadius
// (Defined, Simulated, Public)
// Parameters:
// float                          DamageAmount                   (Parm)
// float                          DamageRadius                   (Parm)
// class UClass*                  DamageType                     (Parm)
// float                          Momentum                       (Parm)
// struct FVector                 HitLocation                    (Parm)

void ADECO_Barricade::HurtRadius(float DamageAmount, float DamageRadius, class UClass* DamageType, float Momentum, const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.HurtRadius");

	ADECO_Barricade_HurtRadius_Params params;
	params.DamageAmount = DamageAmount;
	params.DamageRadius = DamageRadius;
	params.DamageType = DamageType;
	params.Momentum = Momentum;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.TimerPop
// (Defined, Public)
// Parameters:
// class AVolumeTimer*            t                              (Parm)

void ADECO_Barricade::TimerPop(class AVolumeTimer* t)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.TimerPop");

	ADECO_Barricade_TimerPop_Params params;
	params.t = t;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.CheckNearbyBarrels
// (Defined, Public)

void ADECO_Barricade::CheckNearbyBarrels()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.CheckNearbyBarrels");

	ADECO_Barricade_CheckNearbyBarrels_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.TakeDamage
// (Defined, Public)
// Parameters:
// int                            NDamage                        (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 Momentum                       (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// bool                           bWallShot                      (OptionalParm, Parm)

void ADECO_Barricade::TakeDamage(int NDamage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.TakeDamage");

	ADECO_Barricade_TakeDamage_Params params;
	params.NDamage = NDamage;
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


// Function WGame.DECO_Barricade.SetDelayedDamageInstigatorController
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void ADECO_Barricade::SetDelayedDamageInstigatorController(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.SetDelayedDamageInstigatorController");

	ADECO_Barricade_SetDelayedDamageInstigatorController_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void ADECO_Barricade::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.PostNetBeginPlay");

	ADECO_Barricade_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.PostBeginPlay
// (Defined, Public)

void ADECO_Barricade::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.PostBeginPlay");

	ADECO_Barricade_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.TickDamage
// (Defined, Simulated, Public)

void ADECO_Barricade::TickDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.TickDamage");

	ADECO_Barricade_TickDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.SetBurning
// (Defined, Public)
// Parameters:
// bool                           bBurn                          (Parm)
// class AwProjectile*            proj                           (Parm)

void ADECO_Barricade::SetBurning(bool bBurn, class AwProjectile* proj)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.SetBurning");

	ADECO_Barricade_SetBurning_Params params;
	params.bBurn = bBurn;
	params.proj = proj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.BaseChange
// (Singular, Public)

void ADECO_Barricade::BaseChange()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.BaseChange");

	ADECO_Barricade_BaseChange_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.PhysicsVolumeChange
// (Singular, Public)
// Parameters:
// class APhysicsVolume*          NewVolume                      (Parm)

void ADECO_Barricade::PhysicsVolumeChange(class APhysicsVolume* NewVolume)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.PhysicsVolumeChange");

	ADECO_Barricade_PhysicsVolumeChange_Params params;
	params.NewVolume = NewVolume;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.HitWall
// (Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)
// class AActor*                  Wall                           (Parm)
// class UMaterial*               HitMaterial                    (Parm)

void ADECO_Barricade::HitWall(const struct FVector& HitNormal, class AActor* Wall, class UMaterial* HitMaterial)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.HitWall");

	ADECO_Barricade_HitWall_Params params;
	params.HitNormal = HitNormal;
	params.Wall = Wall;
	params.HitMaterial = HitMaterial;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DECO_Barricade.Landed
// (Public)
// Parameters:
// struct FVector                 HitNormal                      (Parm)

void ADECO_Barricade::Landed(const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DECO_Barricade.Landed");

	ADECO_Barricade_Landed_Params params;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MoveToward.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_MoveToward::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.ToString");

	UGoal_MoveToward_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToward.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_MoveToward::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.NotifyDestroyed");

	UGoal_MoveToward_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MoveToward.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_MoveToward::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.SetFocusValue");

	UGoal_MoveToward_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToward.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_MoveToward::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.ActualWork");

	UGoal_MoveToward_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToward.doSprint
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_MoveToward::doSprint()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.doSprint");

	UGoal_MoveToward_doSprint_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToward.Start
// (Defined, Public)

void UGoal_MoveToward::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.Start");

	UGoal_MoveToward_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MoveToward.PassedCheckPoint
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_MoveToward::PassedCheckPoint()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.PassedCheckPoint");

	UGoal_MoveToward_PassedCheckPoint_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToward.ClearReferences
// (Defined, Public)

void UGoal_MoveToward::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.ClearReferences");

	UGoal_MoveToward_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MoveToward.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class AActor*                  inDestination                  (Parm)
// class AActor*                  inFocus                        (Parm)
// float                          inReachRadius                  (OptionalParm, Parm)
// bool                           inSprint                       (OptionalParm, Parm)
// bool                           inCrouch                       (OptionalParm, Parm)
// bool                           inProne                        (OptionalParm, Parm)
// class UGoal_MoveToward*        ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_MoveToward* UGoal_MoveToward::Init(class AwAIBotBase* inOwner, class AActor* inDestination, class AActor* inFocus, float inReachRadius, bool inSprint, bool inCrouch, bool inProne)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToward.Init");

	UGoal_MoveToward_Init_Params params;
	params.inOwner = inOwner;
	params.inDestination = inDestination;
	params.inFocus = inFocus;
	params.inReachRadius = inReachRadius;
	params.inSprint = inSprint;
	params.inCrouch = inCrouch;
	params.inProne = inProne;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE.Evaluate
// (Defined, Public)
// Parameters:
// class UMemoryItem*             mi                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UDAE::Evaluate(class UMemoryItem* mi)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE.Evaluate");

	UDAE_Evaluate_Params params;
	params.mi = mi;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_Multiple.Evaluate
// (Defined, Public)
// Parameters:
// class UMemoryItem*             mi                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UDAE_Multiple::Evaluate(class UMemoryItem* mi)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_Multiple.Evaluate");

	UDAE_Multiple_Evaluate_Params params;
	params.mi = mi;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_Multiple.Add
// (Defined, Public)
// Parameters:
// float                          factor                         (Parm)
// class UDAE*                    inDAE                          (Parm)

void UDAE_Multiple::Add(float factor, class UDAE* inDAE)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_Multiple.Add");

	UDAE_Multiple_Add_Params params;
	params.factor = factor;
	params.inDAE = inDAE;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.DAE_Multiple.Create
// (Defined, Static, Public)
// Parameters:
// class UDAE_Multiple*           ReturnValue                    (Parm, OutParm, ReturnParm)

class UDAE_Multiple* UDAE_Multiple::STATIC_Create()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_Multiple.Create");

	UDAE_Multiple_Create_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_InSight.Evaluate
// (Defined, Public)
// Parameters:
// class UMemoryItem*             mi                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UDAE_InSight::Evaluate(class UMemoryItem* mi)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_InSight.Evaluate");

	UDAE_InSight_Evaluate_Params params;
	params.mi = mi;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_InSight.Create
// (Defined, Static, Public)
// Parameters:
// bool                           bFailAllEvaluation             (Parm)
// class AwAIBotBase*             inOwner                        (Parm)
// class UDAE_InSight*            ReturnValue                    (Parm, OutParm, ReturnParm)

class UDAE_InSight* UDAE_InSight::STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_InSight.Create");

	UDAE_InSight_Create_Params params;
	params.bFailAllEvaluation = bFailAllEvaluation;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_Visibility.Evaluate
// (Defined, Public)
// Parameters:
// class UMemoryItem*             mi                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UDAE_Visibility::Evaluate(class UMemoryItem* mi)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_Visibility.Evaluate");

	UDAE_Visibility_Evaluate_Params params;
	params.mi = mi;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_Visibility.Create
// (Defined, Static, Public)
// Parameters:
// bool                           bFailAllEvaluation             (Parm)
// class AwAIBotBase*             inOwner                        (Parm)
// class UDAE_Visibility*         ReturnValue                    (Parm, OutParm, ReturnParm)

class UDAE_Visibility* UDAE_Visibility::STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_Visibility.Create");

	UDAE_Visibility_Create_Params params;
	params.bFailAllEvaluation = bFailAllEvaluation;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_Proximity.Evaluate
// (Defined, Public)
// Parameters:
// class UMemoryItem*             mi                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UDAE_Proximity::Evaluate(class UMemoryItem* mi)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_Proximity.Evaluate");

	UDAE_Proximity_Evaluate_Params params;
	params.mi = mi;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_Proximity.Create
// (Defined, Static, Public)
// Parameters:
// bool                           bFailAllEvaluation             (Parm)
// class AwAIBotBase*             inOwner                        (Parm)
// float                          inMaxDistance                  (Parm)
// class UDAE_Proximity*          ReturnValue                    (Parm, OutParm, ReturnParm)

class UDAE_Proximity* UDAE_Proximity::STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner, float inMaxDistance)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_Proximity.Create");

	UDAE_Proximity_Create_Params params;
	params.bFailAllEvaluation = bFailAllEvaluation;
	params.inOwner = inOwner;
	params.inMaxDistance = inMaxDistance;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_IsTurret.Evaluate
// (Defined, Public)
// Parameters:
// class UMemoryItem*             mi                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UDAE_IsTurret::Evaluate(class UMemoryItem* mi)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_IsTurret.Evaluate");

	UDAE_IsTurret_Evaluate_Params params;
	params.mi = mi;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_IsTurret.Create
// (Defined, Static, Public)
// Parameters:
// bool                           bFailAllEvaluation             (Parm)
// class UDAE_IsTurret*           ReturnValue                    (Parm, OutParm, ReturnParm)

class UDAE_IsTurret* UDAE_IsTurret::STATIC_Create(bool bFailAllEvaluation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_IsTurret.Create");

	UDAE_IsTurret_Create_Params params;
	params.bFailAllEvaluation = bFailAllEvaluation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_RecentTarget.Evaluate
// (Defined, Public)
// Parameters:
// class UMemoryItem*             mi                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UDAE_RecentTarget::Evaluate(class UMemoryItem* mi)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_RecentTarget.Evaluate");

	UDAE_RecentTarget_Evaluate_Params params;
	params.mi = mi;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.DAE_RecentTarget.Create
// (Defined, Static, Public)
// Parameters:
// bool                           bFailAllEvaluation             (Parm)
// class AwAIBotBase*             inOwner                        (Parm)
// float                          InTime                         (Parm)
// class UDAE_RecentTarget*       ReturnValue                    (Parm, OutParm, ReturnParm)

class UDAE_RecentTarget* UDAE_RecentTarget::STATIC_Create(bool bFailAllEvaluation, class AwAIBotBase* inOwner, float InTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.DAE_RecentTarget.Create");

	UDAE_RecentTarget_Create_Params params;
	params.bFailAllEvaluation = bFailAllEvaluation;
	params.inOwner = inOwner;
	params.InTime = InTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Empty.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Empty::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Empty.Sim_PostEffect");

	UwAction_Empty_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Empty.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Empty::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Empty.Sim_PreEffect");

	UwAction_Empty_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Empty.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_Empty::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Empty.Sim_GetTime");

	UwAction_Empty_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Empty.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_Empty::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Empty.CheckRequirement");

	UwAction_Empty_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Empty.Init
// (Defined, Public)
// Parameters:
// class UwAction_Empty*          ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_Empty* UwAction_Empty::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Empty.Init");

	UwAction_Empty_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wActionLayer.Init
// (Defined, Public)
// Parameters:
// class UwActionLayer*           ReturnValue                    (Parm, OutParm, ReturnParm)

class UwActionLayer* UwActionLayer::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wActionLayer.Init");

	UwActionLayer_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Fire.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_Fire::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.GetGoal");

	UwAction_Fire_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Fire.GetWeaponMultiplier
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int UwAction_Fire::GetWeaponMultiplier(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.GetWeaponMultiplier");

	UwAction_Fire_GetWeaponMultiplier_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Fire.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Fire::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.Sim_PostEffect");

	UwAction_Fire_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Fire.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Fire::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.Sim_PreEffect");

	UwAction_Fire_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Fire.CalcDamage
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_Fire::CalcDamage(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.CalcDamage");

	UwAction_Fire_CalcDamage_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Fire.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_Fire::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.Sim_GetTime");

	UwAction_Fire_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Fire.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_Fire::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.CheckRequirement");

	UwAction_Fire_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Fire.Init
// (Defined, Public)
// Parameters:
// class UwAction_Fire*           ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_Fire* UwAction_Fire::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Fire.Init");

	UwAction_Fire_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Reload.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_Reload::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Reload.GetGoal");

	UwAction_Reload_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Reload.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Reload::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Reload.Sim_PostEffect");

	UwAction_Reload_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Reload.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Reload::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Reload.Sim_PreEffect");

	UwAction_Reload_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Reload.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_Reload::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Reload.Sim_GetTime");

	UwAction_Reload_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Reload.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_Reload::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Reload.CheckRequirement");

	UwAction_Reload_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Reload.Init
// (Defined, Public)
// Parameters:
// class UwAction_Reload*         ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_Reload* UwAction_Reload::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Reload.Init");

	UwAction_Reload_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Explore.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_Explore::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Explore.GetGoal");

	UwAction_Explore_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Explore.CalcMeetNewEnemyProbability
// (Defined, Static, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_Explore::STATIC_CalcMeetNewEnemyProbability(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Explore.CalcMeetNewEnemyProbability");

	UwAction_Explore_CalcMeetNewEnemyProbability_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Explore.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Explore::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Explore.Sim_PostEffect");

	UwAction_Explore_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Explore.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_Explore::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Explore.Sim_PreEffect");

	UwAction_Explore_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_Explore.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_Explore::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Explore.Sim_GetTime");

	UwAction_Explore_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Explore.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_Explore::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Explore.CheckRequirement");

	UwAction_Explore_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_Explore.Init
// (Defined, Public)
// Parameters:
// class UwAction_Explore*        ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_Explore* UwAction_Explore::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_Explore.Init");

	UwAction_Explore_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ExploreTutorial.CalcMeetNewEnemyProbability
// (Defined, Static, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_ExploreTutorial::STATIC_CalcMeetNewEnemyProbability(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ExploreTutorial.CalcMeetNewEnemyProbability");

	UwAction_ExploreTutorial_CalcMeetNewEnemyProbability_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ExploreTutorial.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_ExploreTutorial::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ExploreTutorial.CheckRequirement");

	UwAction_ExploreTutorial_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_IdleHands.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_IdleHands::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_IdleHands.GetGoal");

	UwAction_IdleHands_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_IdleHands.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_IdleHands::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_IdleHands.Sim_PostEffect");

	UwAction_IdleHands_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_IdleHands.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_IdleHands::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_IdleHands.Sim_PreEffect");

	UwAction_IdleHands_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_IdleHands.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_IdleHands::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_IdleHands.Sim_GetTime");

	UwAction_IdleHands_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_IdleHands.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_IdleHands::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_IdleHands.CheckRequirement");

	UwAction_IdleHands_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_IdleHands.Init
// (Defined, Public)
// Parameters:
// float                          inIdleTime                     (Parm)
// class UwAction_IdleHands*      ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_IdleHands* UwAction_IdleHands::Init(float inIdleTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_IdleHands.Init");

	UwAction_IdleHands_Init_Params params;
	params.inIdleTime = inIdleTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ApproachAndMelee.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_ApproachAndMelee::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ApproachAndMelee.GetGoal");

	UwAction_ApproachAndMelee_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ApproachAndMelee.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_ApproachAndMelee::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ApproachAndMelee.Sim_PostEffect");

	UwAction_ApproachAndMelee_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_ApproachAndMelee.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_ApproachAndMelee::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ApproachAndMelee.Sim_PreEffect");

	UwAction_ApproachAndMelee_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_ApproachAndMelee.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_ApproachAndMelee::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ApproachAndMelee.Sim_GetTime");

	UwAction_ApproachAndMelee_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ApproachAndMelee.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_ApproachAndMelee::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ApproachAndMelee.CheckRequirement");

	UwAction_ApproachAndMelee_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ApproachAndMelee.Init
// (Defined, Public)
// Parameters:
// class UwAction_ApproachAndMelee* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_ApproachAndMelee* UwAction_ApproachAndMelee::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ApproachAndMelee.Init");

	UwAction_ApproachAndMelee_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToEnemyInfluence.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_MoveToEnemyInfluence::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToEnemyInfluence.GetGoal");

	UwAction_MoveToEnemyInfluence_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToEnemyInfluence.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_MoveToEnemyInfluence::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToEnemyInfluence.Sim_PostEffect");

	UwAction_MoveToEnemyInfluence_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_MoveToEnemyInfluence.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_MoveToEnemyInfluence::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToEnemyInfluence.Sim_PreEffect");

	UwAction_MoveToEnemyInfluence_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_MoveToEnemyInfluence.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_MoveToEnemyInfluence::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToEnemyInfluence.Sim_GetTime");

	UwAction_MoveToEnemyInfluence_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToEnemyInfluence.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_MoveToEnemyInfluence::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToEnemyInfluence.CheckRequirement");

	UwAction_MoveToEnemyInfluence_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToEnemyInfluence.Init
// (Defined, Public)
// Parameters:
// class UwAction_MoveToEnemyInfluence* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_MoveToEnemyInfluence* UwAction_MoveToEnemyInfluence::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToEnemyInfluence.Init");

	UwAction_MoveToEnemyInfluence_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToSeeTarget.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_MoveToSeeTarget::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToSeeTarget.GetGoal");

	UwAction_MoveToSeeTarget_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToSeeTarget.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_MoveToSeeTarget::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToSeeTarget.Sim_PostEffect");

	UwAction_MoveToSeeTarget_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_MoveToSeeTarget.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_MoveToSeeTarget::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToSeeTarget.Sim_PreEffect");

	UwAction_MoveToSeeTarget_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_MoveToSeeTarget.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_MoveToSeeTarget::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToSeeTarget.Sim_GetTime");

	UwAction_MoveToSeeTarget_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToSeeTarget.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_MoveToSeeTarget::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToSeeTarget.CheckRequirement");

	UwAction_MoveToSeeTarget_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MoveToSeeTarget.Init
// (Defined, Public)
// Parameters:
// class UwAction_MoveToSeeTarget* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_MoveToSeeTarget* UwAction_MoveToSeeTarget::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MoveToSeeTarget.Init");

	UwAction_MoveToSeeTarget_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_LookAround.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_LookAround::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_LookAround.GetGoal");

	UwAction_LookAround_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_LookAround.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_LookAround::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_LookAround.Sim_PostEffect");

	UwAction_LookAround_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_LookAround.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_LookAround::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_LookAround.Sim_PreEffect");

	UwAction_LookAround_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_LookAround.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_LookAround::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_LookAround.Sim_GetTime");

	UwAction_LookAround_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_LookAround.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_LookAround::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_LookAround.CheckRequirement");

	UwAction_LookAround_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_LookAround.Init
// (Defined, Public)
// Parameters:
// float                          inDuration                     (Parm)
// class UwAction_LookAround*     ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_LookAround* UwAction_LookAround::Init(float inDuration)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_LookAround.Init");

	UwAction_LookAround_Init_Params params;
	params.inDuration = inDuration;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseHelicopter.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_UseHelicopter::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseHelicopter.GetGoal");

	UwAction_UseHelicopter_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseHelicopter.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_UseHelicopter::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseHelicopter.Sim_PostEffect");

	UwAction_UseHelicopter_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_UseHelicopter.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_UseHelicopter::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseHelicopter.Sim_PreEffect");

	UwAction_UseHelicopter_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_UseHelicopter.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_UseHelicopter::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseHelicopter.Sim_GetTime");

	UwAction_UseHelicopter_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseHelicopter.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_UseHelicopter::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseHelicopter.CheckRequirement");

	UwAction_UseHelicopter_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseHelicopter.Init
// (Defined, Public)
// Parameters:
// class UwAction_UseHelicopter*  ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_UseHelicopter* UwAction_UseHelicopter::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseHelicopter.Init");

	UwAction_UseHelicopter_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseAIrstrikeRealTime.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_UseAIrstrikeRealTime::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseAIrstrikeRealTime.GetGoal");

	UwAction_UseAIrstrikeRealTime_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseAIrstrikeRealTime.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_UseAIrstrikeRealTime::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseAIrstrikeRealTime.Sim_PostEffect");

	UwAction_UseAIrstrikeRealTime_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_UseAIrstrikeRealTime.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_UseAIrstrikeRealTime::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseAIrstrikeRealTime.Sim_PreEffect");

	UwAction_UseAIrstrikeRealTime_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_UseAIrstrikeRealTime.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_UseAIrstrikeRealTime::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseAIrstrikeRealTime.Sim_GetTime");

	UwAction_UseAIrstrikeRealTime_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseAIrstrikeRealTime.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_UseAIrstrikeRealTime::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseAIrstrikeRealTime.CheckRequirement");

	UwAction_UseAIrstrikeRealTime_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseAIrstrikeRealTime.Init
// (Defined, Public)
// Parameters:
// class UwAction_UseAIrstrikeRealTime* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_UseAIrstrikeRealTime* UwAction_UseAIrstrikeRealTime::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseAIrstrikeRealTime.Init");

	UwAction_UseAIrstrikeRealTime_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseUAV.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_UseUAV::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseUAV.GetGoal");

	UwAction_UseUAV_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseUAV.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_UseUAV::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseUAV.Sim_PostEffect");

	UwAction_UseUAV_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_UseUAV.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_UseUAV::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseUAV.Sim_PreEffect");

	UwAction_UseUAV_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_UseUAV.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_UseUAV::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseUAV.Sim_GetTime");

	UwAction_UseUAV_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseUAV.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_UseUAV::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseUAV.CheckRequirement");

	UwAction_UseUAV_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_UseUAV.Init
// (Defined, Public)
// Parameters:
// class UwAction_UseUAV*         ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_UseUAV* UwAction_UseUAV::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_UseUAV.Init");

	UwAction_UseUAV_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MeleeNoTarget.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_MeleeNoTarget::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MeleeNoTarget.GetGoal");

	UwAction_MeleeNoTarget_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MeleeNoTarget.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_MeleeNoTarget::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MeleeNoTarget.Sim_PostEffect");

	UwAction_MeleeNoTarget_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_MeleeNoTarget.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_MeleeNoTarget::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MeleeNoTarget.Sim_PreEffect");

	UwAction_MeleeNoTarget_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_MeleeNoTarget.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_MeleeNoTarget::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MeleeNoTarget.Sim_GetTime");

	UwAction_MeleeNoTarget_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MeleeNoTarget.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_MeleeNoTarget::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MeleeNoTarget.CheckRequirement");

	UwAction_MeleeNoTarget_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_MeleeNoTarget.Init
// (Defined, Public)
// Parameters:
// class UwAction_MeleeNoTarget*  ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_MeleeNoTarget* UwAction_MeleeNoTarget::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_MeleeNoTarget.Init");

	UwAction_MeleeNoTarget_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_AimSpecificParts.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_AimSpecificParts::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_AimSpecificParts.GetGoal");

	UwAction_AimSpecificParts_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_AimSpecificParts.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_AimSpecificParts::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_AimSpecificParts.Sim_PostEffect");

	UwAction_AimSpecificParts_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_AimSpecificParts.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_AimSpecificParts::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_AimSpecificParts.Sim_PreEffect");

	UwAction_AimSpecificParts_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_AimSpecificParts.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_AimSpecificParts::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_AimSpecificParts.Sim_GetTime");

	UwAction_AimSpecificParts_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_AimSpecificParts.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_AimSpecificParts::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_AimSpecificParts.CheckRequirement");

	UwAction_AimSpecificParts_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_AimSpecificParts.Init
// (Defined, Public)
// Parameters:
// class UwAction_AimSpecificParts* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_AimSpecificParts* UwAction_AimSpecificParts::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_AimSpecificParts.Init");

	UwAction_AimSpecificParts_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_FireSpecialTarget.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_FireSpecialTarget::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_FireSpecialTarget.GetGoal");

	UwAction_FireSpecialTarget_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_FireSpecialTarget.CalcDamage
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_FireSpecialTarget::CalcDamage(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_FireSpecialTarget.CalcDamage");

	UwAction_FireSpecialTarget_CalcDamage_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_FireSpecialTarget.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_FireSpecialTarget::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_FireSpecialTarget.Sim_GetTime");

	UwAction_FireSpecialTarget_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_FireSpecialTarget.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_FireSpecialTarget::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_FireSpecialTarget.CheckRequirement");

	UwAction_FireSpecialTarget_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_FireSpecialTarget.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UwAction_FireSpecialTarget::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_FireSpecialTarget.NotifyDestroyed");

	UwAction_FireSpecialTarget_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_FireSpecialTarget.Init2
// (Defined, Public)
// Parameters:
// class AActor*                  inTarget                       (Parm)
// float                          inDmgFactor                    (Parm)
// class UwAction_FireSpecialTarget* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_FireSpecialTarget* UwAction_FireSpecialTarget::Init2(class AActor* inTarget, float inDmgFactor)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_FireSpecialTarget.Init2");

	UwAction_FireSpecialTarget_Init2_Params params;
	params.inTarget = inTarget;
	params.inDmgFactor = inDmgFactor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickTarget.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_PickTarget::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickTarget.GetGoal");

	UwAction_PickTarget_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickTarget.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickTarget::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickTarget.Sim_PostEffect");

	UwAction_PickTarget_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickTarget.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickTarget::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickTarget.Sim_PreEffect");

	UwAction_PickTarget_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickTarget.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_PickTarget::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickTarget.Sim_GetTime");

	UwAction_PickTarget_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickTarget.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_PickTarget::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickTarget.CheckRequirement");

	UwAction_PickTarget_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickTarget.ClearReferences
// (Defined, Public)

void UwAction_PickTarget::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickTarget.ClearReferences");

	UwAction_PickTarget_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickTarget.Init
// (Defined, Public)
// Parameters:
// class UMemoryItem*             inTarget                       (Parm)
// class UwAction_PickTarget*     ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_PickTarget* UwAction_PickTarget::Init(class UMemoryItem* inTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickTarget.Init");

	UwAction_PickTarget_Init_Params params;
	params.inTarget = inTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ThrowGrenadeRealTime.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_ThrowGrenadeRealTime::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ThrowGrenadeRealTime.GetGoal");

	UwAction_ThrowGrenadeRealTime_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ThrowGrenadeRealTime.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_ThrowGrenadeRealTime::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ThrowGrenadeRealTime.Sim_PostEffect");

	UwAction_ThrowGrenadeRealTime_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_ThrowGrenadeRealTime.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_ThrowGrenadeRealTime::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ThrowGrenadeRealTime.Sim_PreEffect");

	UwAction_ThrowGrenadeRealTime_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_ThrowGrenadeRealTime.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_ThrowGrenadeRealTime::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ThrowGrenadeRealTime.Sim_GetTime");

	UwAction_ThrowGrenadeRealTime_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ThrowGrenadeRealTime.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_ThrowGrenadeRealTime::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ThrowGrenadeRealTime.CheckRequirement");

	UwAction_ThrowGrenadeRealTime_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_ThrowGrenadeRealTime.Init
// (Defined, Public)
// Parameters:
// class UwAction_ThrowGrenadeRealTime* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_ThrowGrenadeRealTime* UwAction_ThrowGrenadeRealTime::Init()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_ThrowGrenadeRealTime.Init");

	UwAction_ThrowGrenadeRealTime_Init_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHealth.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UwAction_PickHealth::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.NotifyDestroyed");

	UwAction_PickHealth_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHealth.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_PickHealth::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.GetGoal");

	UwAction_PickHealth_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHealth.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickHealth::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.Sim_PostEffect");

	UwAction_PickHealth_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHealth.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickHealth::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.Sim_PreEffect");

	UwAction_PickHealth_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHealth.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_PickHealth::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.Sim_GetTime");

	UwAction_PickHealth_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHealth.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_PickHealth::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.CheckRequirement");

	UwAction_PickHealth_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHealth.ClearReferences
// (Defined, Public)

void UwAction_PickHealth::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.ClearReferences");

	UwAction_PickHealth_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHealth.Init
// (Defined, Public)
// Parameters:
// class APickup*                 inPack                         (Parm)
// class UwAction_PickHealth*     ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_PickHealth* UwAction_PickHealth::Init(class APickup* inPack)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHealth.Init");

	UwAction_PickHealth_Init_Params params;
	params.inPack = inPack;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHelicopter.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UwAction_PickHelicopter::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.NotifyDestroyed");

	UwAction_PickHelicopter_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHelicopter.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_PickHelicopter::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.GetGoal");

	UwAction_PickHelicopter_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHelicopter.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickHelicopter::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.Sim_PostEffect");

	UwAction_PickHelicopter_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHelicopter.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickHelicopter::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.Sim_PreEffect");

	UwAction_PickHelicopter_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHelicopter.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_PickHelicopter::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.Sim_GetTime");

	UwAction_PickHelicopter_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHelicopter.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_PickHelicopter::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.CheckRequirement");

	UwAction_PickHelicopter_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickHelicopter.ClearReferences
// (Defined, Public)

void UwAction_PickHelicopter::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.ClearReferences");

	UwAction_PickHelicopter_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickHelicopter.Init
// (Defined, Public)
// Parameters:
// class APickup*                 inPack                         (Parm)
// class UwAction_PickHelicopter* ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_PickHelicopter* UwAction_PickHelicopter::Init(class APickup* inPack)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickHelicopter.Init");

	UwAction_PickHelicopter_Init_Params params;
	params.inPack = inPack;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickAirstrike.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UwAction_PickAirstrike::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.NotifyDestroyed");

	UwAction_PickAirstrike_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickAirstrike.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_PickAirstrike::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.GetGoal");

	UwAction_PickAirstrike_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickAirstrike.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickAirstrike::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.Sim_PostEffect");

	UwAction_PickAirstrike_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickAirstrike.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickAirstrike::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.Sim_PreEffect");

	UwAction_PickAirstrike_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickAirstrike.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_PickAirstrike::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.Sim_GetTime");

	UwAction_PickAirstrike_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickAirstrike.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_PickAirstrike::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.CheckRequirement");

	UwAction_PickAirstrike_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickAirstrike.ClearReferences
// (Defined, Public)

void UwAction_PickAirstrike::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.ClearReferences");

	UwAction_PickAirstrike_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickAirstrike.Init
// (Defined, Public)
// Parameters:
// class APickup*                 inPack                         (Parm)
// class UwAction_PickAirstrike*  ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_PickAirstrike* UwAction_PickAirstrike::Init(class APickup* inPack)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickAirstrike.Init");

	UwAction_PickAirstrike_Init_Params params;
	params.inPack = inPack;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickUAV.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UwAction_PickUAV::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.NotifyDestroyed");

	UwAction_PickUAV_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickUAV.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_PickUAV::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.GetGoal");

	UwAction_PickUAV_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickUAV.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickUAV::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.Sim_PostEffect");

	UwAction_PickUAV_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickUAV.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_PickUAV::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.Sim_PreEffect");

	UwAction_PickUAV_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickUAV.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_PickUAV::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.Sim_GetTime");

	UwAction_PickUAV_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickUAV.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_PickUAV::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.CheckRequirement");

	UwAction_PickUAV_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_PickUAV.ClearReferences
// (Defined, Public)

void UwAction_PickUAV::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.ClearReferences");

	UwAction_PickUAV_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_PickUAV.Init
// (Defined, Public)
// Parameters:
// class APickup*                 inPack                         (Parm)
// class UwAction_PickUAV*        ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_PickUAV* UwAction_PickUAV::Init(class APickup* inPack)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_PickUAV.Init");

	UwAction_PickUAV_Init_Params params;
	params.inPack = inPack;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_SwitchWeapon.GetGoal
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             Owner                          (Parm)
// class UGoal*                   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal* UwAction_SwitchWeapon::GetGoal(class AwAIBotBase* Owner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.GetGoal");

	UwAction_SwitchWeapon_GetGoal_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_SwitchWeapon.Sim_PostEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_SwitchWeapon::Sim_PostEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.Sim_PostEffect");

	UwAction_SwitchWeapon_Sim_PostEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_SwitchWeapon.Sim_PreEffect
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)

void UwAction_SwitchWeapon::Sim_PreEffect(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.Sim_PreEffect");

	UwAction_SwitchWeapon_Sim_PreEffect_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_SwitchWeapon.Sim_GetTime
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwAction_SwitchWeapon::Sim_GetTime(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.Sim_GetTime");

	UwAction_SwitchWeapon_Sim_GetTime_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_SwitchWeapon.CheckRequirement
// (Defined, Public)
// Parameters:
// class UwStateData*             ws                             (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwAction_SwitchWeapon::CheckRequirement(class UwStateData* ws)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.CheckRequirement");

	UwAction_SwitchWeapon_CheckRequirement_Params params;
	params.ws = ws;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAction_SwitchWeapon.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UwAction_SwitchWeapon::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.NotifyDestroyed");

	UwAction_SwitchWeapon_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_SwitchWeapon.ClearReferences
// (Defined, Public)

void UwAction_SwitchWeapon::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.ClearReferences");

	UwAction_SwitchWeapon_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAction_SwitchWeapon.Init
// (Defined, Public)
// Parameters:
// class AwWeapon*                inWeapon                       (Parm)
// class UwAction_SwitchWeapon*   ReturnValue                    (Parm, OutParm, ReturnParm)

class UwAction_SwitchWeapon* UwAction_SwitchWeapon::Init(class AwWeapon* inWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAction_SwitchWeapon.Init");

	UwAction_SwitchWeapon_Init_Params params;
	params.inWeapon = inWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPlan.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_ExecPlan::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.ToString");

	UGoal_ExecPlan_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPlan.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_ExecPlan::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.SetFocusValue");

	UGoal_ExecPlan_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPlan.End
// (Defined, Public)

void UGoal_ExecPlan::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.End");

	UGoal_ExecPlan_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPlan.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_ExecPlan::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.ActualWork");

	UGoal_ExecPlan_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPlan.GetProgress
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGoal_ExecPlan::GetProgress()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.GetProgress");

	UGoal_ExecPlan_GetProgress_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPlan.InitSubGoals
// (Defined, Public)

void UGoal_ExecPlan::InitSubGoals()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.InitSubGoals");

	UGoal_ExecPlan_InitSubGoals_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPlan.Start
// (Defined, Public)

void UGoal_ExecPlan::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.Start");

	UGoal_ExecPlan_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPlan.ClearReferences
// (Defined, Public)

void UGoal_ExecPlan::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.ClearReferences");

	UGoal_ExecPlan_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPlan.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UwActionContainer*       inPlan                         (Parm)
// class UGoal_ExecPlan*          ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_ExecPlan* UGoal_ExecPlan::Init(class AwAIBotBase* inOwner, class UwActionContainer* inPlan)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPlan.Init");

	UGoal_ExecPlan_Init_Params params;
	params.inOwner = inOwner;
	params.inPlan = inPlan;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Stay.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Stay::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Stay.ToString");

	UGoal_Stay_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Stay.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Stay::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Stay.ActualWork");

	UGoal_Stay_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Stay.Start
// (Defined, Public)

void UGoal_Stay::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Stay.Start");

	UGoal_Stay_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Stay.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// float                          inStayLength                   (Parm)
// class UGoal_Stay*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Stay* UGoal_Stay::Init(class AwAIBotBase* inOwner, float inStayLength)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Stay.Init");

	UGoal_Stay_Init_Params params;
	params.inOwner = inOwner;
	params.inStayLength = inStayLength;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchWeapon.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_SwitchWeapon::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchWeapon.ToString");

	UGoal_SwitchWeapon_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchWeapon.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_SwitchWeapon::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchWeapon.SetFocusValue");

	UGoal_SwitchWeapon_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchWeapon.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_SwitchWeapon::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchWeapon.ActualWork");

	UGoal_SwitchWeapon_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchWeapon.Start
// (Defined, Public)

void UGoal_SwitchWeapon::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchWeapon.Start");

	UGoal_SwitchWeapon_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchWeapon.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// byte                           InGroup                        (Parm)
// class UGoal_SwitchWeapon*      ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_SwitchWeapon* UGoal_SwitchWeapon::Init(class AwAIBotBase* inOwner, byte InGroup)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchWeapon.Init");

	UGoal_SwitchWeapon_Init_Params params;
	params.inOwner = inOwner;
	params.InGroup = InGroup;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MeleeNoTarget.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_MeleeNoTarget::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MeleeNoTarget.ToString");

	UGoal_MeleeNoTarget_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MeleeNoTarget.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_MeleeNoTarget::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MeleeNoTarget.ActualWork");

	UGoal_MeleeNoTarget_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MeleeNoTarget.Start
// (Defined, Public)

void UGoal_MeleeNoTarget::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MeleeNoTarget.Start");

	UGoal_MeleeNoTarget_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MeleeNoTarget.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_MeleeNoTarget::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MeleeNoTarget.NotifyDestroyed");

	UGoal_MeleeNoTarget_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MeleeNoTarget.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// int                            inMeleeCount                   (Parm)
// class UGoal_MeleeNoTarget*     ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_MeleeNoTarget* UGoal_MeleeNoTarget::Init(class AwAIBotBase* inOwner, int inMeleeCount)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MeleeNoTarget.Init");

	UGoal_MeleeNoTarget_Init_Params params;
	params.inOwner = inOwner;
	params.inMeleeCount = inMeleeCount;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToEnemyInfluence.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_MoveToEnemyInfluence::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToEnemyInfluence.ToString");

	UGoal_MoveToEnemyInfluence_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToEnemyInfluence.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_MoveToEnemyInfluence::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToEnemyInfluence.ActualWork");

	UGoal_MoveToEnemyInfluence_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToEnemyInfluence.Start
// (Defined, Public)

void UGoal_MoveToEnemyInfluence::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToEnemyInfluence.Start");

	UGoal_MoveToEnemyInfluence_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MoveToEnemyInfluence.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_MoveToEnemyInfluence* ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_MoveToEnemyInfluence* UGoal_MoveToEnemyInfluence::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToEnemyInfluence.Init");

	UGoal_MoveToEnemyInfluence_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_LookAround.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_LookAround::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_LookAround.ToString");

	UGoal_LookAround_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_LookAround.End
// (Defined, Public)

void UGoal_LookAround::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_LookAround.End");

	UGoal_LookAround_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_LookAround.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_LookAround::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_LookAround.SetFocusValue");

	UGoal_LookAround_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_LookAround.NextFocusTarget
// (Defined, Public)

void UGoal_LookAround::NextFocusTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_LookAround.NextFocusTarget");

	UGoal_LookAround_NextFocusTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_LookAround.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_LookAround::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_LookAround.ActualWork");

	UGoal_LookAround_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_LookAround.Start
// (Defined, Public)

void UGoal_LookAround::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_LookAround.Start");

	UGoal_LookAround_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_LookAround.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// float                          inDuration                     (Parm)
// class UGoal_LookAround*        ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_LookAround* UGoal_LookAround::Init(class AwAIBotBase* inOwner, float inDuration)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_LookAround.Init");

	UGoal_LookAround_Init_Params params;
	params.inOwner = inOwner;
	params.inDuration = inDuration;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Reload.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Reload::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Reload.ToString");

	UGoal_Reload_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Reload.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_Reload::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Reload.SetFocusValue");

	UGoal_Reload_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Reload.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Reload::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Reload.ActualWork");

	UGoal_Reload_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Reload.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_Reload::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Reload.NotifyDestroyed");

	UGoal_Reload_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Reload.Start
// (Defined, Public)

void UGoal_Reload::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Reload.Start");

	UGoal_Reload_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Reload.ClearReferences
// (Defined, Public)

void UGoal_Reload::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Reload.ClearReferences");

	UGoal_Reload_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Reload.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_Reload*            ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Reload* UGoal_Reload::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Reload.Init");

	UGoal_Reload_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_UseAirstrikeRealTime.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_UseAirstrikeRealTime::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_UseAirstrikeRealTime.ToString");

	UGoal_UseAirstrikeRealTime_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_UseAirstrikeRealTime.GetTarget
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* UGoal_UseAirstrikeRealTime::GetTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_UseAirstrikeRealTime.GetTarget");

	UGoal_UseAirstrikeRealTime_GetTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_UseAirstrikeRealTime.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_UseAirstrikeRealTime::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_UseAirstrikeRealTime.ActualWork");

	UGoal_UseAirstrikeRealTime_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_UseAirstrikeRealTime.Start
// (Defined, Public)

void UGoal_UseAirstrikeRealTime::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_UseAirstrikeRealTime.Start");

	UGoal_UseAirstrikeRealTime_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_UseAirstrikeRealTime.ClearReferences
// (Defined, Public)

void UGoal_UseAirstrikeRealTime::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_UseAirstrikeRealTime.ClearReferences");

	UGoal_UseAirstrikeRealTime_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_UseAirstrikeRealTime.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_UseAirstrikeRealTime* ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_UseAirstrikeRealTime* UGoal_UseAirstrikeRealTime::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_UseAirstrikeRealTime.Init");

	UGoal_UseAirstrikeRealTime_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_AimSpecificParts.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_AimSpecificParts::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_AimSpecificParts.ToString");

	UGoal_AimSpecificParts_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_AimSpecificParts.End
// (Defined, Public)

void UGoal_AimSpecificParts::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_AimSpecificParts.End");

	UGoal_AimSpecificParts_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_AimSpecificParts.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_AimSpecificParts::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_AimSpecificParts.SetFocusValue");

	UGoal_AimSpecificParts_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_AimSpecificParts.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_AimSpecificParts::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_AimSpecificParts.ActualWork");

	UGoal_AimSpecificParts_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_AimSpecificParts.Start
// (Defined, Public)

void UGoal_AimSpecificParts::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_AimSpecificParts.Start");

	UGoal_AimSpecificParts_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_AimSpecificParts.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_AimSpecificParts*  ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_AimSpecificParts* UGoal_AimSpecificParts::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_AimSpecificParts.Init");

	UGoal_AimSpecificParts_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToSeeTarget.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_MoveToSeeTarget::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToSeeTarget.ToString");

	UGoal_MoveToSeeTarget_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToSeeTarget.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_MoveToSeeTarget::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToSeeTarget.ActualWork");

	UGoal_MoveToSeeTarget_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_MoveToSeeTarget.Start
// (Defined, Public)

void UGoal_MoveToSeeTarget::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToSeeTarget.Start");

	UGoal_MoveToSeeTarget_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_MoveToSeeTarget.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_MoveToSeeTarget*   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_MoveToSeeTarget* UGoal_MoveToSeeTarget::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_MoveToSeeTarget.Init");

	UGoal_MoveToSeeTarget_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndUse.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_SwitchAndUse::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndUse.ToString");

	UGoal_SwitchAndUse_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndUse.End
// (Defined, Public)

void UGoal_SwitchAndUse::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndUse.End");

	UGoal_SwitchAndUse_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndUse.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_SwitchAndUse::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndUse.ActualWork");

	UGoal_SwitchAndUse_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndUse.Start
// (Defined, Public)

void UGoal_SwitchAndUse::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndUse.Start");

	UGoal_SwitchAndUse_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndUse.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// int                            InGroup                        (Parm)
// class UGoal_SwitchAndUse*      ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_SwitchAndUse* UGoal_SwitchAndUse::Init(class AwAIBotBase* inOwner, int InGroup)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndUse.Init");

	UGoal_SwitchAndUse_Init_Params params;
	params.inOwner = inOwner;
	params.InGroup = InGroup;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ApproachAndMelee.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_ApproachAndMelee::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ApproachAndMelee.ToString");

	UGoal_ApproachAndMelee_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ApproachAndMelee.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_ApproachAndMelee::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ApproachAndMelee.ActualWork");

	UGoal_ApproachAndMelee_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ApproachAndMelee.Start
// (Defined, Public)

void UGoal_ApproachAndMelee::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ApproachAndMelee.Start");

	UGoal_ApproachAndMelee_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ApproachAndMelee.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_ApproachAndMelee::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ApproachAndMelee.NotifyDestroyed");

	UGoal_ApproachAndMelee_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ApproachAndMelee.ClearReferences
// (Defined, Public)

void UGoal_ApproachAndMelee::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ApproachAndMelee.ClearReferences");

	UGoal_ApproachAndMelee_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ApproachAndMelee.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class APawn*                   inTarget                       (Parm)
// class UGoal_ApproachAndMelee*  ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_ApproachAndMelee* UGoal_ApproachAndMelee::Init(class AwAIBotBase* inOwner, class APawn* inTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ApproachAndMelee.Init");

	UGoal_ApproachAndMelee_Init_Params params;
	params.inOwner = inOwner;
	params.inTarget = inTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_PickTarget.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_PickTarget::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PickTarget.ToString");

	UGoal_PickTarget_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_PickTarget.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_PickTarget::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PickTarget.ActualWork");

	UGoal_PickTarget_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_PickTarget.Start
// (Defined, Public)

void UGoal_PickTarget::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PickTarget.Start");

	UGoal_PickTarget_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PickTarget.ClearReferences
// (Defined, Public)

void UGoal_PickTarget::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PickTarget.ClearReferences");

	UGoal_PickTarget_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_PickTarget.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UMemoryItem*             inMI                           (Parm)
// class UGoal_PickTarget*        ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_PickTarget* UGoal_PickTarget::Init(class AwAIBotBase* inOwner, class UMemoryItem* inMI)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_PickTarget.Init");

	UGoal_PickTarget_Init_Params params;
	params.inOwner = inOwner;
	params.inMI = inMI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ThrowGrenadeRealTime.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_ThrowGrenadeRealTime::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ThrowGrenadeRealTime.ToString");

	UGoal_ThrowGrenadeRealTime_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ThrowGrenadeRealTime.GetTarget
// (Defined, Public)
// Parameters:
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* UGoal_ThrowGrenadeRealTime::GetTarget()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ThrowGrenadeRealTime.GetTarget");

	UGoal_ThrowGrenadeRealTime_GetTarget_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ThrowGrenadeRealTime.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_ThrowGrenadeRealTime::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ThrowGrenadeRealTime.ActualWork");

	UGoal_ThrowGrenadeRealTime_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ThrowGrenadeRealTime.Start
// (Defined, Public)

void UGoal_ThrowGrenadeRealTime::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ThrowGrenadeRealTime.Start");

	UGoal_ThrowGrenadeRealTime_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ThrowGrenadeRealTime.ClearReferences
// (Defined, Public)

void UGoal_ThrowGrenadeRealTime::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ThrowGrenadeRealTime.ClearReferences");

	UGoal_ThrowGrenadeRealTime_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ThrowGrenadeRealTime.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_ThrowGrenadeRealTime* ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_ThrowGrenadeRealTime* UGoal_ThrowGrenadeRealTime::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ThrowGrenadeRealTime.Init");

	UGoal_ThrowGrenadeRealTime_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Fail.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Fail::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fail.ToString");

	UGoal_Fail_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Fail.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Fail::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fail.ActualWork");

	UGoal_Fail_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Fail.Start
// (Defined, Public)

void UGoal_Fail::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fail.Start");

	UGoal_Fail_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Fail.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UGoal_Fail*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Fail* UGoal_Fail::Init(class AwAIBotBase* inOwner)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Fail.Init");

	UGoal_Fail_Init_Params params;
	params.inOwner = inOwner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPartialPlan.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_ExecPartialPlan::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.ToString");

	UGoal_ExecPartialPlan_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPartialPlan.DisplayDebug
// (Defined, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// int                            Level                          (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void UGoal_ExecPartialPlan::DisplayDebug(class UCanvas* C, int Level, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.DisplayDebug");

	UGoal_ExecPartialPlan_DisplayDebug_Params params;
	params.C = C;
	params.Level = Level;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.Goal_ExecPartialPlan.SetFocus
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_ExecPartialPlan::SetFocus()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.SetFocus");

	UGoal_ExecPartialPlan_SetFocus_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPartialPlan.ClearSubgoals
// (Defined, Public)
// Parameters:
// bool                           free                           (OptionalParm, Parm)

void UGoal_ExecPartialPlan::ClearSubgoals(bool free)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.ClearSubgoals");

	UGoal_ExecPartialPlan_ClearSubgoals_Params params;
	params.free = free;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPartialPlan.End
// (Defined, Public)

void UGoal_ExecPartialPlan::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.End");

	UGoal_ExecPartialPlan_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPartialPlan.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_ExecPartialPlan::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.ActualWork");

	UGoal_ExecPartialPlan_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPartialPlan.GetNextSubGoal
// (Defined, Public)
// Parameters:
// class UGoal_ExecPartialPlan*   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_ExecPartialPlan* UGoal_ExecPartialPlan::GetNextSubGoal()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.GetNextSubGoal");

	UGoal_ExecPartialPlan_GetNextSubGoal_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPartialPlan.GetProgress
// (Defined, Public)
// Parameters:
// float                          Min                            (Parm)
// float                          Size                           (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UGoal_ExecPartialPlan::GetProgress(float Min, float Size)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.GetProgress");

	UGoal_ExecPartialPlan_GetProgress_Params params;
	params.Min = Min;
	params.Size = Size;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_ExecPartialPlan.Start
// (Defined, Public)

void UGoal_ExecPartialPlan::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.Start");

	UGoal_ExecPartialPlan_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPartialPlan.ClearReferences
// (Defined, Public)

void UGoal_ExecPartialPlan::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.ClearReferences");

	UGoal_ExecPartialPlan_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_ExecPartialPlan.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class UwActionContainer*       inPartialPlan                  (Parm)
// class UGoal_ExecPartialPlan*   ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_ExecPartialPlan* UGoal_ExecPartialPlan::Init(class AwAIBotBase* inOwner, class UwActionContainer* inPartialPlan)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_ExecPartialPlan.Init");

	UGoal_ExecPartialPlan_Init_Params params;
	params.inOwner = inOwner;
	params.inPartialPlan = inPartialPlan;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndFire.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_SwitchAndFire::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndFire.ToString");

	UGoal_SwitchAndFire_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndFire.End
// (Defined, Public)

void UGoal_SwitchAndFire::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndFire.End");

	UGoal_SwitchAndFire_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndFire.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_SwitchAndFire::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndFire.ActualWork");

	UGoal_SwitchAndFire_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndFire.Start
// (Defined, Public)

void UGoal_SwitchAndFire::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndFire.Start");

	UGoal_SwitchAndFire_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndFire.ClearReferences
// (Defined, Public)

void UGoal_SwitchAndFire::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndFire.ClearReferences");

	UGoal_SwitchAndFire_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndFire.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// int                            InGroup                        (Parm)
// class AActor*                  inTarget                       (Parm)
// class UGoal_SwitchAndFire*     ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_SwitchAndFire* UGoal_SwitchAndFire::Init(class AwAIBotBase* inOwner, int InGroup, class AActor* inTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndFire.Init");

	UGoal_SwitchAndFire_Init_Params params;
	params.inOwner = inOwner;
	params.InGroup = InGroup;
	params.inTarget = inTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Melee.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Melee::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Melee.ToString");

	UGoal_Melee_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Melee.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_Melee::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Melee.SetFocusValue");

	UGoal_Melee_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Melee.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Melee::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Melee.ActualWork");

	UGoal_Melee_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Melee.Start
// (Defined, Public)

void UGoal_Melee::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Melee.Start");

	UGoal_Melee_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Melee.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_Melee::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Melee.NotifyDestroyed");

	UGoal_Melee_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Melee.ClearReferences
// (Defined, Public)

void UGoal_Melee::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Melee.ClearReferences");

	UGoal_Melee_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Melee.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class AActor*                  inTarget                       (Parm)
// class UGoal_Melee*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Melee* UGoal_Melee::Init(class AwAIBotBase* inOwner, class AActor* inTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Melee.Init");

	UGoal_Melee_Init_Params params;
	params.inOwner = inOwner;
	params.inTarget = inTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Throw.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Throw::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.ToString");

	UGoal_Throw_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Throw.End
// (Defined, Public)

void UGoal_Throw::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.End");

	UGoal_Throw_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Throw.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_Throw::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.SetFocusValue");

	UGoal_Throw_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Throw.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Throw::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.ActualWork");

	UGoal_Throw_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Throw.GetViewLocation
// (Defined, Static, Public)
// Parameters:
// struct FVector                 curLocation                    (Parm)
// struct FVector                 fallLocation                   (Parm)
// struct FVector                 ViewLocation                   (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_Throw::STATIC_GetViewLocation(const struct FVector& curLocation, const struct FVector& fallLocation, struct FVector* ViewLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.GetViewLocation");

	UGoal_Throw_GetViewLocation_Params params;
	params.curLocation = curLocation;
	params.fallLocation = fallLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ViewLocation != nullptr)
		*ViewLocation = params.ViewLocation;

	return params.ReturnValue;
}


// Function WGame.Goal_Throw.CanThrowTo
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              Level                          (Parm)
// struct FVector                 From                           (Parm)
// struct FVector                 to                             (Parm)
// struct FVector                 View                           (Parm, OutParm)
// bool                           checkUp                        (Parm)
// bool                           checkDown                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_Throw::STATIC_CanThrowTo(class ALevelInfo* Level, const struct FVector& From, const struct FVector& to, bool checkUp, bool checkDown, struct FVector* View)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.CanThrowTo");

	UGoal_Throw_CanThrowTo_Params params;
	params.Level = Level;
	params.From = From;
	params.to = to;
	params.checkUp = checkUp;
	params.checkDown = checkDown;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (View != nullptr)
		*View = params.View;

	return params.ReturnValue;
}


// Function WGame.Goal_Throw.SpawnTrail
// (Defined, Public)
// Parameters:
// struct FVector                 ViewLocation                   (Parm)

void UGoal_Throw::SpawnTrail(const struct FVector& ViewLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.SpawnTrail");

	UGoal_Throw_SpawnTrail_Params params;
	params.ViewLocation = ViewLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Throw.Start
// (Defined, Public)

void UGoal_Throw::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.Start");

	UGoal_Throw_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Throw.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_Throw::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.NotifyDestroyed");

	UGoal_Throw_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Throw.ClearReferences
// (Defined, Public)

void UGoal_Throw::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.ClearReferences");

	UGoal_Throw_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Throw.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class AActor*                  inTarget                       (Parm)
// class UGoal_Throw*             ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Throw* UGoal_Throw::Init(class AwAIBotBase* inOwner, class AActor* inTarget)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Throw.Init");

	UGoal_Throw_Init_Params params;
	params.inOwner = inOwner;
	params.inTarget = inTarget;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndThrow.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_SwitchAndThrow::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndThrow.ToString");

	UGoal_SwitchAndThrow_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndThrow.End
// (Defined, Public)

void UGoal_SwitchAndThrow::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndThrow.End");

	UGoal_SwitchAndThrow_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndThrow.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_SwitchAndThrow::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndThrow.ActualWork");

	UGoal_SwitchAndThrow_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_SwitchAndThrow.Start
// (Defined, Public)

void UGoal_SwitchAndThrow::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndThrow.Start");

	UGoal_SwitchAndThrow_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndThrow.NotifyDestroyed
// (Defined, Public)
// Parameters:
// class AActor*                  A                              (Parm)

void UGoal_SwitchAndThrow::NotifyDestroyed(class AActor* A)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndThrow.NotifyDestroyed");

	UGoal_SwitchAndThrow_NotifyDestroyed_Params params;
	params.A = A;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndThrow.ClearReferences
// (Defined, Public)

void UGoal_SwitchAndThrow::ClearReferences()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndThrow.ClearReferences");

	UGoal_SwitchAndThrow_ClearReferences_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_SwitchAndThrow.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// class AActor*                  inTarget                       (Parm)
// int                            InGroup                        (Parm)
// class UGoal_SwitchAndThrow*    ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_SwitchAndThrow* UGoal_SwitchAndThrow::Init(class AwAIBotBase* inOwner, class AActor* inTarget, int InGroup)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_SwitchAndThrow.Init");

	UGoal_SwitchAndThrow_Init_Params params;
	params.inOwner = inOwner;
	params.inTarget = inTarget;
	params.InGroup = InGroup;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Look.ToString
// (Defined, Public)
// Parameters:
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string UGoal_Look::ToString()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Look.ToString");

	UGoal_Look_ToString_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Look.End
// (Defined, Public)

void UGoal_Look::End()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Look.End");

	UGoal_Look_End_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Look.SetFocusValue
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UGoal_Look::SetFocusValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Look.SetFocusValue");

	UGoal_Look_SetFocusValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Look.ActualWork
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)
// EGoalStatus                    ReturnValue                    (Parm, OutParm, ReturnParm)

EGoalStatus UGoal_Look::ActualWork(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Look.ActualWork");

	UGoal_Look_ActualWork_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.Goal_Look.Start
// (Defined, Public)

void UGoal_Look::Start()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Look.Start");

	UGoal_Look_Start_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.Goal_Look.Init
// (Defined, Public)
// Parameters:
// class AwAIBotBase*             inOwner                        (Parm)
// struct FVector                 inLookLocation                 (Parm)
// class UGoal_Look*              ReturnValue                    (Parm, OutParm, ReturnParm)

class UGoal_Look* UGoal_Look::Init(class AwAIBotBase* inOwner, const struct FVector& inLookLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.Goal_Look.Init");

	UGoal_Look_Init_Params params;
	params.inOwner = inOwner;
	params.inLookLocation = inLookLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wEntryGameInfo.PrecacheGameSkeletalMeshes
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void AwEntryGameInfo::STATIC_PrecacheGameSkeletalMeshes(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wEntryGameInfo.PrecacheGameSkeletalMeshes");

	AwEntryGameInfo_PrecacheGameSkeletalMeshes_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wEntryGameInfo.PrecacheGameStaticMeshes
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void AwEntryGameInfo::STATIC_PrecacheGameStaticMeshes(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wEntryGameInfo.PrecacheGameStaticMeshes");

	AwEntryGameInfo_PrecacheGameStaticMeshes_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wEntryGameInfo.PrecacheGameTextures
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void AwEntryGameInfo::STATIC_PrecacheGameTextures(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wEntryGameInfo.PrecacheGameTextures");

	AwEntryGameInfo_PrecacheGameTextures_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wEntryGameInfo.PostLogin
// (Defined, Event, Public)
// Parameters:
// class APlayerController*       NewPlayer                      (Parm)

void AwEntryGameInfo::PostLogin(class APlayerController* NewPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wEntryGameInfo.PostLogin");

	AwEntryGameInfo_PostLogin_Params params;
	params.NewPlayer = NewPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDeathMessage.ClientReceive
// (Defined, Static, Public)
// Parameters:
// class APlayerController*       P                              (Parm)
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)

void AwDeathMessage::STATIC_ClientReceive(class APlayerController* P, int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDeathMessage.ClientReceive");

	AwDeathMessage_ClientReceive_Params params;
	params.P = P;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wDeathMessage.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwDeathMessage::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDeathMessage.GetString");

	AwDeathMessage_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wDeathMessage.GetConsoleColor
// (Defined, Static, Public)
// Parameters:
// class APlayerReplicationInfo*  RelatedPRI_1                   (Parm)
// struct FColor                  ReturnValue                    (Parm, OutParm, ReturnParm)

struct FColor AwDeathMessage::STATIC_GetConsoleColor(class APlayerReplicationInfo* RelatedPRI_1)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wDeathMessage.GetConsoleColor");

	AwDeathMessage_GetConsoleColor_Params params;
	params.RelatedPRI_1 = RelatedPRI_1;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wWeaponPickup_Location.Reset
// (Defined, Public)

void AwWeaponPickup_Location::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponPickup_Location.Reset");

	AwWeaponPickup_Location_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponPickup_Location.PickWeapon
// (Defined, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwWeaponPickup_Location::PickWeapon(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponPickup_Location.PickWeapon");

	AwWeaponPickup_Location_PickWeapon_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponPickup_Location.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwWeaponPickup_Location::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponPickup_Location.PostNetBeginPlay");

	AwWeaponPickup_Location_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponPickup_Location.PreBeginPlay
// (Defined, Simulated, Event, Public)

void AwWeaponPickup_Location::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponPickup_Location.PreBeginPlay");

	AwWeaponPickup_Location_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponPickup_M2B.PreBeginPlay
// (Defined, Simulated, Event, Public)

void AwWeaponPickup_M2B::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponPickup_M2B.PreBeginPlay");

	AwWeaponPickup_M2B_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wWeaponPickup_RPG7.PreBeginPlay
// (Defined, Simulated, Event, Public)

void AwWeaponPickup_RPG7::PreBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wWeaponPickup_RPG7.PreBeginPlay");

	AwWeaponPickup_RPG7_PreBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AwVehicle::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.UpdatePrecacheMaterials");

	AwVehicle_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.StaticPrecache
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              L                              (Parm)

void AwVehicle::STATIC_StaticPrecache(class ALevelInfo* L)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.StaticPrecache");

	AwVehicle_StaticPrecache_Params params;
	params.L = L;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.PerformTrace
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm, OutParm)
// struct FVector                 HitNormal                      (Parm, OutParm)
// struct FVector                 End                            (Parm)
// struct FVector                 Start                          (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwVehicle::PerformTrace(const struct FVector& End, const struct FVector& Start, struct FVector* HitLocation, struct FVector* HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.PerformTrace");

	AwVehicle_PerformTrace_Params params;
	params.End = End;
	params.Start = Start;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (HitLocation != nullptr)
		*HitLocation = params.HitLocation;
	if (HitNormal != nullptr)
		*HitNormal = params.HitNormal;

	return params.ReturnValue;
}


// Function WGame.wVehicle.CalcWeaponFire
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm, OutParm)
// struct FVector                 HitNormal                      (Parm, OutParm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwVehicle::CalcWeaponFire(struct FVector* HitLocation, struct FVector* HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.CalcWeaponFire");

	AwVehicle_CalcWeaponFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (HitLocation != nullptr)
		*HitLocation = params.HitLocation;
	if (HitNormal != nullptr)
		*HitNormal = params.HitNormal;

	return params.ReturnValue;
}


// Function WGame.wVehicle.GetBotError
// (Defined, Public)
// Parameters:
// struct FVector                 StartLocation                  (Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwVehicle::GetBotError(const struct FVector& StartLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.GetBotError");

	AwVehicle_GetBotError_Params params;
	params.StartLocation = StartLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.GetFireStart
// (Defined, Simulated, Public)
// Parameters:
// float                          XOffset                        (OptionalParm, Parm)
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwVehicle::GetFireStart(float XOffset)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.GetFireStart");

	AwVehicle_GetFireStart_Params params;
	params.XOffset = XOffset;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.GetCrosshairWorldLocation
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwVehicle::GetCrosshairWorldLocation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.GetCrosshairWorldLocation");

	AwVehicle_GetCrosshairWorldLocation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.NotifyEnemyLockedOn
// (Defined, Event, Public)

void AwVehicle::NotifyEnemyLockedOn()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.NotifyEnemyLockedOn");

	AwVehicle_NotifyEnemyLockedOn_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.DrawCrosshairAlignment
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 ScreenPos                      (Parm)

void AwVehicle::DrawCrosshairAlignment(class UCanvas* C, const struct FVector& ScreenPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.DrawCrosshairAlignment");

	AwVehicle_DrawCrosshairAlignment_Params params;
	params.C = C;
	params.ScreenPos = ScreenPos;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.WeaponHitsCrosshairsHL
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwVehicle::WeaponHitsCrosshairsHL()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.WeaponHitsCrosshairsHL");

	AwVehicle_WeaponHitsCrosshairsHL_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.DrawCrosshair
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 ScreenPos                      (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwVehicle::DrawCrosshair(class UCanvas* C, struct FVector* ScreenPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.DrawCrosshair");

	AwVehicle_DrawCrosshair_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ScreenPos != nullptr)
		*ScreenPos = params.ScreenPos;

	return params.ReturnValue;
}


// Function WGame.wVehicle.DrawHealthInfo
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerController*       PC                             (Parm)

void AwVehicle::DrawHealthInfo(class UCanvas* C, class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.DrawHealthInfo");

	AwVehicle_DrawHealthInfo_Params params;
	params.C = C;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.DrawWeaponInfo
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class AHUD*                    H                              (Parm)

void AwVehicle::DrawWeaponInfo(class UCanvas* C, class AHUD* H)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.DrawWeaponInfo");

	AwVehicle_DrawWeaponInfo_Params params;
	params.C = C;
	params.H = H;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.DrawVehicleHUD
// (Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerController*       PC                             (Parm)

void AwVehicle::DrawVehicleHUD(class UCanvas* C, class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.DrawVehicleHUD");

	AwVehicle_DrawVehicleHUD_Params params;
	params.C = C;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.SpecialDrawCrosshair
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwVehicle::SpecialDrawCrosshair(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.SpecialDrawCrosshair");

	AwVehicle_SpecialDrawCrosshair_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.DrawHUD
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)

void AwVehicle::DrawHUD(class UCanvas* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.DrawHUD");

	AwVehicle_DrawHUD_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.GetWeaponBoneFor
// (Defined, Public)
// Parameters:
// class AInventory*              i                              (Parm)
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwVehicle::GetWeaponBoneFor(class AInventory* i)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.GetWeaponBoneFor");

	AwVehicle_GetWeaponBoneFor_Params params;
	params.i = i;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.PlayDying
// (Defined, Simulated, Event, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwVehicle::PlayDying(class UClass* DamageType, const struct FVector& HitLoc, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.PlayDying");

	AwVehicle_PlayDying_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;
	params.CollisionPart = CollisionPart;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.CalcInertia
// (Final, Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)
// float                          FrictionFactor                 (Parm)
// float                          OldValue                       (Parm)
// float                          NewValue                       (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwVehicle::CalcInertia(float DeltaTime, float FrictionFactor, float OldValue, float NewValue)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.CalcInertia");

	AwVehicle_CalcInertia_Params params;
	params.DeltaTime = DeltaTime;
	params.FrictionFactor = FrictionFactor;
	params.OldValue = OldValue;
	params.NewValue = NewValue;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.Explode
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)

void AwVehicle::Explode(const struct FVector& HitLocation, const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.Explode");

	AwVehicle_Explode_Params params;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.TakeDamage
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

void AwVehicle::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.TakeDamage");

	AwVehicle_TakeDamage_Params params;
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


// Function WGame.wVehicle.StopWeaponFiring
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwVehicle::StopWeaponFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.StopWeaponFiring");

	AwVehicle_StopWeaponFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.ClientKDriverLeave
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)

void AwVehicle::ClientKDriverLeave(class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.ClientKDriverLeave");

	AwVehicle_ClientKDriverLeave_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.ClientKDriverEnter
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)

void AwVehicle::ClientKDriverEnter(class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.ClientKDriverEnter");

	AwVehicle_ClientKDriverEnter_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.KDriverLeave
// (Defined, Event, Public)
// Parameters:
// bool                           bForceLeave                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwVehicle::KDriverLeave(bool bForceLeave)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.KDriverLeave");

	AwVehicle_KDriverLeave_Params params;
	params.bForceLeave = bForceLeave;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wVehicle.UnPossessed
// (Defined, Public)

void AwVehicle::UnPossessed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.UnPossessed");

	AwVehicle_UnPossessed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.PossessedBy
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AwVehicle::PossessedBy(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.PossessedBy");

	AwVehicle_PossessedBy_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.AddDefaultInventory
// (Defined, Public)

void AwVehicle::AddDefaultInventory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.AddDefaultInventory");

	AwVehicle_AddDefaultInventory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.Destroyed
// (Defined, Simulated, Event, Public)

void AwVehicle::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.Destroyed");

	AwVehicle_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwVehicle::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.PostBeginPlay");

	AwVehicle_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.Tick
// (Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwVehicle::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.Tick");

	AwVehicle_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.ClientDying
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLocation                    (Parm)

void AwVehicle::ClientDying(class UClass* DamageType, const struct FVector& HitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.ClientDying");

	AwVehicle_ClientDying_Params params;
	params.DamageType = DamageType;
	params.HitLocation = HitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wVehicle.PlayHit
// (Defined, Public)
// Parameters:
// float                          Damage                         (Parm)
// class APawn*                   instigatedBy                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// class UClass*                  DamageType                     (Parm)
// struct FVector                 Momentum                       (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)

void AwVehicle::PlayHit(float Damage, class APawn* instigatedBy, const struct FVector& HitLocation, class UClass* DamageType, const struct FVector& Momentum, int CollisionPart)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wVehicle.PlayHit");

	AwVehicle_PlayHit_Params params;
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


// Function WGame.wTurret.MakeFireNoise
// (Defined, Simulated, Public)

void AwTurret::MakeFireNoise()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.MakeFireNoise");

	AwTurret_MakeFireNoise_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.TakeDamage
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

void AwTurret::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.TakeDamage");

	AwTurret_TakeDamage_Params params;
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


// Function WGame.wTurret.InitBaseRotation
// (Defined, Simulated, Public)

void AwTurret::InitBaseRotation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.InitBaseRotation");

	AwTurret_InitBaseRotation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.PlaceExitingDriver
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::PlaceExitingDriver()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PlaceExitingDriver");

	AwTurret_PlaceExitingDriver_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret.PointOfView
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::PointOfView()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PointOfView");

	AwTurret_PointOfView_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AwTurret::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.UpdatePrecacheMaterials");

	AwTurret_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.StaticPrecache
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              L                              (Parm)

void AwTurret::STATIC_StaticPrecache(class ALevelInfo* L)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.StaticPrecache");

	AwTurret_StaticPrecache_Params params;
	params.L = L;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.KDriverLeave
// (Defined, Event, Public)
// Parameters:
// bool                           bForceLeave                    (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::KDriverLeave(bool bForceLeave)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.KDriverLeave");

	AwTurret_KDriverLeave_Params params;
	params.bForceLeave = bForceLeave;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret.KDriverEnter
// (Defined, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwTurret::KDriverEnter(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.KDriverEnter");

	AwTurret_KDriverEnter_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.ClientKDriverEnter
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)

void AwTurret::ClientKDriverEnter(class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.ClientKDriverEnter");

	AwTurret_ClientKDriverEnter_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.AttachDriver
// (Defined, Simulated, Public)
// Parameters:
// class APawn*                   P                              (Parm)

void AwTurret::AttachDriver(class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.AttachDriver");

	AwTurret_AttachDriver_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.PostZoomAdjust
// (Defined, Simulated, Public)
// Parameters:
// float                          ZoomPct                        (Parm)

void AwTurret::PostZoomAdjust(float ZoomPct)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PostZoomAdjust");

	AwTurret_PostZoomAdjust_Params params;
	params.ZoomPct = ZoomPct;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.DrawCrosshair
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// struct FVector                 ScreenPos                      (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::DrawCrosshair(class UCanvas* C, struct FVector* ScreenPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.DrawCrosshair");

	AwTurret_DrawCrosshair_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ScreenPos != nullptr)
		*ScreenPos = params.ScreenPos;

	return params.ReturnValue;
}


// Function WGame.wTurret.PerformTrace
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm, OutParm)
// struct FVector                 HitNormal                      (Parm, OutParm)
// struct FVector                 End                            (Parm)
// struct FVector                 Start                          (Parm)
// class AActor*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class AActor* AwTurret::PerformTrace(const struct FVector& End, const struct FVector& Start, struct FVector* HitLocation, struct FVector* HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PerformTrace");

	AwTurret_PerformTrace_Params params;
	params.End = End;
	params.Start = Start;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (HitLocation != nullptr)
		*HitLocation = params.HitLocation;
	if (HitNormal != nullptr)
		*HitNormal = params.HitNormal;

	return params.ReturnValue;
}


// Function WGame.wTurret.DrawHealthInfo
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 C                              (Parm)
// class APlayerController*       PC                             (Parm)

void AwTurret::DrawHealthInfo(class UCanvas* C, class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.DrawHealthInfo");

	AwTurret_DrawHealthInfo_Params params;
	params.C = C;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.Explode
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)

void AwTurret::Explode(const struct FVector& HitLocation, const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.Explode");

	AwTurret_Explode_Params params;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.PlayFiring
// (Defined, Simulated, Public)
// Parameters:
// float                          Rate                           (OptionalParm, Parm)
// FName                          FiringMode                     (OptionalParm, Parm)

void AwTurret::PlayFiring(float Rate, const FName& FiringMode)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PlayFiring");

	AwTurret_PlayFiring_Params params;
	params.Rate = Rate;
	params.FiringMode = FiringMode;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.GetViewRotation
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AwTurret::GetViewRotation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.GetViewRotation");

	AwTurret_GetViewRotation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret.SpecialCalcFirstPersonView
// (Defined, Simulated, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)
// class AActor*                  ViewActor                      (Parm, OutParm)
// struct FVector                 CameraLocation                 (Parm, OutParm)
// struct FRotator                CameraRotation                 (Parm, OutParm)

void AwTurret::SpecialCalcFirstPersonView(class APlayerController* PC, class AActor** ViewActor, struct FVector* CameraLocation, struct FRotator* CameraRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.SpecialCalcFirstPersonView");

	AwTurret_SpecialCalcFirstPersonView_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ViewActor != nullptr)
		*ViewActor = params.ViewActor;
	if (CameraLocation != nullptr)
		*CameraLocation = params.CameraLocation;
	if (CameraRotation != nullptr)
		*CameraRotation = params.CameraRotation;
}


// Function WGame.wTurret.SpecialCalcView
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  ViewActor                      (Parm, OutParm)
// struct FVector                 CameraLocation                 (Parm, OutParm)
// struct FRotator                CameraRotation                 (Parm, OutParm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::SpecialCalcView(class AActor** ViewActor, struct FVector* CameraLocation, struct FRotator* CameraRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.SpecialCalcView");

	AwTurret_SpecialCalcView_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (ViewActor != nullptr)
		*ViewActor = params.ViewActor;
	if (CameraLocation != nullptr)
		*CameraLocation = params.CameraLocation;
	if (CameraRotation != nullptr)
		*CameraRotation = params.CameraRotation;

	return params.ReturnValue;
}


// Function WGame.wTurret.TestSetDriverFrame
// (Defined, Simulated, Public)
// Parameters:
// float                          frame                          (Parm)
// float                          UpDownFrame                    (OptionalParm, Parm)

void AwTurret::TestSetDriverFrame(float frame, float UpDownFrame)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.TestSetDriverFrame");

	AwTurret_TestSetDriverFrame_Params params;
	params.frame = frame;
	params.UpDownFrame = UpDownFrame;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.Tick
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwTurret::Tick(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.Tick");

	AwTurret_Tick_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.NotifyAllControllers
// (Defined, Public)
// Parameters:
// float                          dt                             (Parm)

void AwTurret::NotifyAllControllers(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.NotifyAllControllers");

	AwTurret_NotifyAllControllers_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.UpdateRocketAcceleration
// (Defined, Simulated, Public)
// Parameters:
// float                          DeltaTime                      (Parm)
// float                          YawChange                      (Parm)
// float                          PitchChange                    (Parm)

void AwTurret::UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.UpdateRocketAcceleration");

	AwTurret_UpdateRocketAcceleration_Params params;
	params.DeltaTime = DeltaTime;
	params.YawChange = YawChange;
	params.PitchChange = PitchChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.Destroyed
// (Defined, Simulated, Event, Public)

void AwTurret::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.Destroyed");

	AwTurret_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.SetRotateForPlayerView
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                PCRot                          (Parm)

void AwTurret::SetRotateForPlayerView(const struct FRotator& PCRot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.SetRotateForPlayerView");

	AwTurret_SetRotateForPlayerView_Params params;
	params.PCRot = PCRot;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.HasAmmo
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::HasAmmo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.HasAmmo");

	AwTurret_HasAmmo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwTurret::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PostNetBeginPlay");

	AwTurret_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.UnPossessed
// (Defined, Public)

void AwTurret::UnPossessed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.UnPossessed");

	AwTurret_UnPossessed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.PossessedBy
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)

void AwTurret::PossessedBy(class AController* C)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PossessedBy");

	AwTurret_PossessedBy_Params params;
	params.C = C;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwTurret::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PostBeginPlay");

	AwTurret_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.ServerSwitchTurret
// (Defined, Net, NetReliable, Public)
// Parameters:
// bool                           bNextTurret                    (Parm)

void AwTurret::ServerSwitchTurret(bool bNextTurret)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.ServerSwitchTurret");

	AwTurret_ServerSwitchTurret_Params params;
	params.bNextTurret = bNextTurret;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.NextWeapon
// (Defined, Simulated, Public)

void AwTurret::NextWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.NextWeapon");

	AwTurret_NextWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.PrevWeapon
// (Defined, Simulated, Public)

void AwTurret::PrevWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.PrevWeapon");

	AwTurret_PrevWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret.BotDesireability
// (Defined, Public)
// Parameters:
// class AActor*                  S                              (Parm)
// int                            TeamIndex                      (Parm)
// class AActor*                  Objective                      (Parm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float AwTurret::BotDesireability(class AActor* S, int TeamIndex, class AActor* Objective)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.BotDesireability");

	AwTurret_BotDesireability_Params params;
	params.S = S;
	params.TeamIndex = TeamIndex;
	params.Objective = Objective;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret.StronglyRecommended
// (Defined, Public)
// Parameters:
// class AActor*                  S                              (Parm)
// int                            TeamIndex                      (Parm)
// class AActor*                  Objective                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::StronglyRecommended(class AActor* S, int TeamIndex, class AActor* Objective)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.StronglyRecommended");

	AwTurret_StronglyRecommended_Params params;
	params.S = S;
	params.TeamIndex = TeamIndex;
	params.Objective = Objective;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret.RecommendLongRangedAttack
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTurret::RecommendLongRangedAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret.RecommendLongRangedAttack");

	AwTurret_RecommendLongRangedAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret_FNM240.DisplayDebug
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwTurret_FNM240::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.DisplayDebug");

	AwTurret_FNM240_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WGame.wTurret_FNM240.GetViewRotation
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                ReturnValue                    (Parm, OutParm, ReturnParm)

struct FRotator AwTurret_FNM240::GetViewRotation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.GetViewRotation");

	AwTurret_FNM240_GetViewRotation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret_FNM240.TZ
// (Defined, Exec, Public)
// Parameters:
// int                            iZ                             (Parm)

void AwTurret_FNM240::TZ(int iZ)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.TZ");

	AwTurret_FNM240_TZ_Params params;
	params.iZ = iZ;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.ty
// (Defined, Exec, Public)
// Parameters:
// int                            iY                             (Parm)

void AwTurret_FNM240::ty(int iY)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.ty");

	AwTurret_FNM240_ty_Params params;
	params.iY = iY;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.TX
// (Defined, Exec, Public)
// Parameters:
// int                            iX                             (Parm)

void AwTurret_FNM240::TX(int iX)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.TX");

	AwTurret_FNM240_TX_Params params;
	params.iX = iX;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.t
// (Defined, Exec, Public)
// Parameters:
// int                            iType                          (Parm)

void AwTurret_FNM240::t(int iType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.t");

	AwTurret_FNM240_t_Params params;
	params.iType = iType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AwTurret_FNM240::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.UpdatePrecacheMaterials");

	AwTurret_FNM240_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.UpdatePrecacheStaticMeshes
// (Defined, Simulated, Public)

void AwTurret_FNM240::UpdatePrecacheStaticMeshes()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.UpdatePrecacheStaticMeshes");

	AwTurret_FNM240_UpdatePrecacheStaticMeshes_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.StaticPrecache
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              L                              (Parm)

void AwTurret_FNM240::STATIC_StaticPrecache(class ALevelInfo* L)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.StaticPrecache");

	AwTurret_FNM240_StaticPrecache_Params params;
	params.L = L;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.SetExitViewRotation
// (Defined, Public)
// Parameters:
// class APawn*                   Driver                         (Parm)

void AwTurret_FNM240::SetExitViewRotation(class APawn* Driver)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.SetExitViewRotation");

	AwTurret_FNM240_SetExitViewRotation_Params params;
	params.Driver = Driver;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.MakeFireNoise
// (Defined, Simulated, Public)

void AwTurret_FNM240::MakeFireNoise()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.MakeFireNoise");

	AwTurret_FNM240_MakeFireNoise_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.ClientKDriverLeave
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)

void AwTurret_FNM240::ClientKDriverLeave(class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.ClientKDriverLeave");

	AwTurret_FNM240_ClientKDriverLeave_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.ClientKDriverEnter
// (Defined, Net, NetReliable, Simulated, Public)
// Parameters:
// class APlayerController*       PC                             (Parm)

void AwTurret_FNM240::ClientKDriverEnter(class APlayerController* PC)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.ClientKDriverEnter");

	AwTurret_FNM240_ClientKDriverEnter_Params params;
	params.PC = PC;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwTurret_FNM240::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240.PostBeginPlay");

	AwTurret_FNM240_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAmmoSupplyObjective.CheckFillAmmoToWeapon
// (Defined, Public)
// Parameters:
// EeWeaponType                   eType                          (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAmmoSupplyObjective::CheckFillAmmoToWeapon(EeWeaponType eType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAmmoSupplyObjective.CheckFillAmmoToWeapon");

	AwAmmoSupplyObjective_CheckFillAmmoToWeapon_Params params;
	params.eType = eType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAmmoSupplyObjective.ChargeAmmo
// (Defined, Public)
// Parameters:
// class AwPawn*                  P                              (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAmmoSupplyObjective::ChargeAmmo(class AwPawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAmmoSupplyObjective.ChargeAmmo");

	AwAmmoSupplyObjective_ChargeAmmo_Params params;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAmmoSupplyObjective.Touch
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)

void AwAmmoSupplyObjective::Touch(class AActor* Other)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAmmoSupplyObjective.Touch");

	AwAmmoSupplyObjective_Touch_Params params;
	params.Other = Other;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAmmoSupplyObjective.PostBeginPlay
// (Defined, Public)

void AwAmmoSupplyObjective::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAmmoSupplyObjective.PostBeginPlay");

	AwAmmoSupplyObjective_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.RespawnPlayer
// (Defined, Public)
// Parameters:
// class AController*             C                              (Parm)
// bool                           bClearSpecials                 (OptionalParm, Parm)

void AwTeamGame::RespawnPlayer(class AController* C, bool bClearSpecials)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.RespawnPlayer");

	AwTeamGame_RespawnPlayer_Params params;
	params.C = C;
	params.bClearSpecials = bClearSpecials;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.PossessPawn
// (Defined, Protected)
// Parameters:
// class AController*             C                              (Parm)
// class APawn*                   P                              (Parm)

void AwTeamGame::PossessPawn(class AController* C, class APawn* P)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.PossessPawn");

	AwTeamGame_PossessPawn_Params params;
	params.C = C;
	params.P = P;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.SpawnAndPossessPawn
// (Defined, Protected)
// Parameters:
// class AController*             C                              (Parm)
// string                         PawnClassName                  (Parm, NeedCtorLink)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTeamGame::SpawnAndPossessPawn(class AController* C, const string& PawnClassName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.SpawnAndPossessPawn");

	AwTeamGame_SpawnAndPossessPawn_Params params;
	params.C = C;
	params.PawnClassName = PawnClassName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTeamGame.FindPlayerStart
// (Defined, Public)
// Parameters:
// class AController*             Player                         (Parm)
// byte                           inTeam                         (OptionalParm, Parm)
// string                         incomingName                   (OptionalParm, Parm, NeedCtorLink)
// class ANavigationPoint*        ReturnValue                    (Parm, OutParm, ReturnParm)

class ANavigationPoint* AwTeamGame::FindPlayerStart(class AController* Player, byte inTeam, const string& incomingName)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.FindPlayerStart");

	AwTeamGame_FindPlayerStart_Params params;
	params.Player = Player;
	params.inTeam = inTeam;
	params.incomingName = incomingName;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTeamGame.GetGameSpecificPurposes
// (Defined, Public)
// Parameters:
// class AController*             Owner                          (Parm)
// class UObject*[]               purposes                       (Parm, OutParm, NeedCtorLink)

void AwTeamGame::GetGameSpecificPurposes(class AController* Owner, class UObject*[]* purposes)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.GetGameSpecificPurposes");

	AwTeamGame_GetGameSpecificPurposes_Params params;
	params.Owner = Owner;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (purposes != nullptr)
		*purposes = params.purposes;
}


// Function WGame.wTeamGame.EndGame
// (Defined, Public)
// Parameters:
// class APlayerReplicationInfo*  Winner                         (Parm)
// string                         Reason                         (Parm, NeedCtorLink)

void AwTeamGame::EndGame(class APlayerReplicationInfo* Winner, const string& Reason)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.EndGame");

	AwTeamGame_EndGame_Params params;
	params.Winner = Winner;
	params.Reason = Reason;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.statai
// (Defined, Exec, Public)

void AwTeamGame::statai()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.statai");

	AwTeamGame_statai_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.SetOldTeamInfo
// (Defined, Event, Public)
// Parameters:
// class AGameReplicationInfo*    OldGRI                         (Parm)

void AwTeamGame::SetOldTeamInfo(class AGameReplicationInfo* OldGRI)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.SetOldTeamInfo");

	AwTeamGame_SetOldTeamInfo_Params params;
	params.OldGRI = OldGRI;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.GetBootySeedValue
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwTeamGame::GetBootySeedValue()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.GetBootySeedValue");

	AwTeamGame_GetBootySeedValue_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTeamGame.StartMatch
// (Defined, Public)

void AwTeamGame::StartMatch()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.StartMatch");

	AwTeamGame_StartMatch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.CalcResultPoints
// (Defined, Public)

void AwTeamGame::CalcResultPoints()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.CalcResultPoints");

	AwTeamGame_CalcResultPoints_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.InitGame
// (Defined, Event, Public)
// Parameters:
// string                         Options                        (Parm, NeedCtorLink)
// string                         Error                          (Parm, OutParm, NeedCtorLink)

void AwTeamGame::InitGame(const string& Options, string* Error)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.InitGame");

	AwTeamGame_InitGame_Params params;
	params.Options = Options;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (Error != nullptr)
		*Error = params.Error;
}


// Function WGame.wTeamGame.PostLogin
// (Defined, Event, Public)
// Parameters:
// class APlayerController*       NewPlayer                      (Parm)

void AwTeamGame::PostLogin(class APlayerController* NewPlayer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.PostLogin");

	AwTeamGame_PostLogin_Params params;
	params.NewPlayer = NewPlayer;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.PrecacheGameSkeletalMeshes
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void AwTeamGame::STATIC_PrecacheGameSkeletalMeshes(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.PrecacheGameSkeletalMeshes");

	AwTeamGame_PrecacheGameSkeletalMeshes_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.PrecacheGameStaticMeshes
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void AwTeamGame::STATIC_PrecacheGameStaticMeshes(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.PrecacheGameStaticMeshes");

	AwTeamGame_PrecacheGameStaticMeshes_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTeamGame.PrecacheGameTextures
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void AwTeamGame::STATIC_PrecacheGameTextures(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTeamGame.PrecacheGameTextures");

	AwTeamGame_PrecacheGameTextures_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_Base.UpdateOverlay
// (Defined, Simulated, Public)

void AwTurret_Base::UpdateOverlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_Base.UpdateOverlay");

	AwTurret_Base_UpdateOverlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_Base.Timer
// (Defined, Simulated, Event, Public)

void AwTurret_Base::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_Base.Timer");

	AwTurret_Base_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_Base.TakeDamage
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

void AwTurret_Base::TakeDamage(int Damage, class APawn* instigatedBy, const struct FVector& HitLocation, const struct FVector& Momentum, class UClass* DamageType, int CollisionPart, int WeaponType, bool bWallShot)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_Base.TakeDamage");

	AwTurret_Base_TakeDamage_Params params;
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


// Function WGame.wTurret_Base.UpdateSwivelRotation
// (Simulated, Public)
// Parameters:
// struct FRotator                TurretRotation                 (Parm)

void AwTurret_Base::UpdateSwivelRotation(const struct FRotator& TurretRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_Base.UpdateSwivelRotation");

	AwTurret_Base_UpdateSwivelRotation_Params params;
	params.TurretRotation = TurretRotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_Base.UpdateBaseRotation
// (Simulated, Public)
// Parameters:
// struct FRotator                TurretRotation                 (Parm)

void AwTurret_Base::UpdateBaseRotation(const struct FRotator& TurretRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_Base.UpdateBaseRotation");

	AwTurret_Base_UpdateBaseRotation_Params params;
	params.TurretRotation = TurretRotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_Base.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwTurret_Base::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_Base.PostBeginPlay");

	AwTurret_Base_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wPurposeAttackTarget.GetActivationScore
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwPurposeAttackTarget::GetActivationScore()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPurposeAttackTarget.GetActivationScore");

	UwPurposeAttackTarget_GetActivationScore_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wPurposeAttackTarget.Evaluate
// (Defined, Public)
// Parameters:
// class UwStateData*             S                              (Parm, OutParm)
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwPurposeAttackTarget::Evaluate(class UwStateData** S)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wPurposeAttackTarget.Evaluate");

	UwPurposeAttackTarget_Evaluate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (S != nullptr)
		*S = params.S;

	return params.ReturnValue;
}


// Function WGame.wKillerMessagePlus.GetString
// (Defined, Static, Public)
// Parameters:
// int                            Switch                         (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_1                   (OptionalParm, Parm)
// class APlayerReplicationInfo*  RelatedPRI_2                   (OptionalParm, Parm)
// class UObject*                 OptionalObject                 (OptionalParm, Parm)
// string                         ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

string AwKillerMessagePlus::STATIC_GetString(int Switch, class APlayerReplicationInfo* RelatedPRI_1, class APlayerReplicationInfo* RelatedPRI_2, class UObject* OptionalObject)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wKillerMessagePlus.GetString");

	AwKillerMessagePlus_GetString_Params params;
	params.Switch = Switch;
	params.RelatedPRI_1 = RelatedPRI_1;
	params.RelatedPRI_2 = RelatedPRI_2;
	params.OptionalObject = OptionalObject;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wTurret_FNM240_Base.UpdateBaseRotation
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                TurretRotation                 (Parm)

void AwTurret_FNM240_Base::UpdateBaseRotation(const struct FRotator& TurretRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240_Base.UpdateBaseRotation");

	AwTurret_FNM240_Base_UpdateBaseRotation_Params params;
	params.TurretRotation = TurretRotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wTurret_FNM240_Swivel.UpdateSwivelRotation
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                TurretRotation                 (Parm)

void AwTurret_FNM240_Swivel::UpdateSwivelRotation(const struct FRotator& TurretRotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wTurret_FNM240_Swivel.UpdateSwivelRotation");

	AwTurret_FNM240_Swivel_UpdateSwivelRotation_Params params;
	params.TurretRotation = TurretRotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.TakeFallingDamage
// (Defined, Public)

void AwAIDefencePawn::TakeFallingDamage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.TakeFallingDamage");

	AwAIDefencePawn_TakeFallingDamage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.SetCollisionSizeEx
// (Defined, Public)
// Parameters:
// float                          fRadius                        (Parm)
// float                          fHeight                        (Parm)

void AwAIDefencePawn::SetCollisionSizeEx(float fRadius, float fHeight)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.SetCollisionSizeEx");

	AwAIDefencePawn_SetCollisionSizeEx_Params params;
	params.fRadius = fRadius;
	params.fHeight = fHeight;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.SetCollisionRadius
// (Defined, Public)

void AwAIDefencePawn::SetCollisionRadius()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.SetCollisionRadius");

	AwAIDefencePawn_SetCollisionRadius_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.AdjustCollisionSize
// (Defined, Public)

void AwAIDefencePawn::AdjustCollisionSize()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.AdjustCollisionSize");

	AwAIDefencePawn_AdjustCollisionSize_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.EffectExplosion
// (Defined, Simulated, Public)

void AwAIDefencePawn::EffectExplosion()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.EffectExplosion");

	AwAIDefencePawn_EffectExplosion_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.CheckDamageWithinRadius
// (Defined, Simulated, Public)

void AwAIDefencePawn::CheckDamageWithinRadius()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.CheckDamageWithinRadius");

	AwAIDefencePawn_CheckDamageWithinRadius_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.Tick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          dt                             (Parm)

void AwAIDefencePawn::Tick(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.Tick");

	AwAIDefencePawn_Tick_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.deleOnReachedDestination
// (Defined, Public)
// Parameters:
// struct FVector                 Dir                            (Parm)
// class AActor*                  GoalActor                      (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIDefencePawn::deleOnReachedDestination(const struct FVector& Dir, class AActor* GoalActor)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.deleOnReachedDestination");

	AwAIDefencePawn_deleOnReachedDestination_Params params;
	params.Dir = Dir;
	params.GoalActor = GoalActor;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefencePawn.CheckUpdateAnimation
// (Defined, Event, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIDefencePawn::CheckUpdateAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.CheckUpdateAnimation");

	AwAIDefencePawn_CheckUpdateAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefencePawn.PlayLandedSound
// (Defined, Event, Public)
// Parameters:
// int                            SurfType                       (Parm)

void AwAIDefencePawn::PlayLandedSound(int SurfType)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.PlayLandedSound");

	AwAIDefencePawn_PlayLandedSound_Params params;
	params.SurfType = SurfType;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.FootStepping
// (Defined, Simulated, Public)
// Parameters:
// int                            side                           (Parm)

void AwAIDefencePawn::FootStepping(int side)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.FootStepping");

	AwAIDefencePawn_FootStepping_Params params;
	params.side = side;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.SpawnSupplyItem
// (Defined, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAIDefencePawn::SpawnSupplyItem()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.SpawnSupplyItem");

	AwAIDefencePawn_SpawnSupplyItem_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefencePawn.SpawnGibs
// (Defined, Simulated, Public)
// Parameters:
// struct FRotator                HitRotation                    (Parm)
// float                          ChunkPerterbation              (Parm)

void AwAIDefencePawn::SpawnGibs(const struct FRotator& HitRotation, float ChunkPerterbation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.SpawnGibs");

	AwAIDefencePawn_SpawnGibs_Params params;
	params.HitRotation = HitRotation;
	params.ChunkPerterbation = ChunkPerterbation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.SpawnGoreGiblet
// (Defined, Simulated, Public)
// Parameters:
// int                            iIndex                         (Parm)

void AwAIDefencePawn::SpawnGoreGiblet(int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.SpawnGoreGiblet");

	AwAIDefencePawn_SpawnGoreGiblet_Params params;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.PlayMelee
// (Defined, Simulated, Public)
// Parameters:
// bool                           bMeleeKnifeOrButt              (Parm)

void AwAIDefencePawn::PlayMelee(bool bMeleeKnifeOrButt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.PlayMelee");

	AwAIDefencePawn_PlayMelee_Params params;
	params.bMeleeKnifeOrButt = bMeleeKnifeOrButt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.GetBloodHitClass
// (Defined, Simulated, Public)
// Parameters:
// ECollisionPartsType            collisionParts                 (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwAIDefencePawn::GetBloodHitClass(ECollisionPartsType collisionParts)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.GetBloodHitClass");

	AwAIDefencePawn_GetBloodHitClass_Params params;
	params.collisionParts = collisionParts;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefencePawn.AddDefaultSkills
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAIDefencePawn::AddDefaultSkills(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.AddDefaultSkills");

	AwAIDefencePawn_AddDefaultSkills_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.AddWeapon
// (Defined, Public)
// Parameters:
// struct FBtrDouble              iUniqueID                      (Parm)
// int                            iWeaponID                      (Parm)
// int                            iAddPartsID                    (Parm)
// bool                           bPickupChange                  (OptionalParm, Parm)
// int                            iPainting_Item_ID              (OptionalParm, Parm)
// class AwWeapon*                ReturnValue                    (Parm, OutParm, ReturnParm)

class AwWeapon* AwAIDefencePawn::AddWeapon(const struct FBtrDouble& iUniqueID, int iWeaponID, int iAddPartsID, bool bPickupChange, int iPainting_Item_ID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.AddWeapon");

	AwAIDefencePawn_AddWeapon_Params params;
	params.iUniqueID = iUniqueID;
	params.iWeaponID = iWeaponID;
	params.iAddPartsID = iAddPartsID;
	params.bPickupChange = bPickupChange;
	params.iPainting_Item_ID = iPainting_Item_ID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefencePawn.ChangedWeapon
// (Defined, Public)

void AwAIDefencePawn::ChangedWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.ChangedWeapon");

	AwAIDefencePawn_ChangedWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwAIDefencePawn::AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.AddDefaultInventory");

	AwAIDefencePawn_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.PlayDyingAnimation
// (Defined, Public)
// Parameters:
// class UClass*                  DamageType                     (Parm)
// struct FVector                 HitLoc                         (Parm)

void AwAIDefencePawn::PlayDyingAnimation(class UClass* DamageType, const struct FVector& HitLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.PlayDyingAnimation");

	AwAIDefencePawn_PlayDyingAnimation_Params params;
	params.DamageType = DamageType;
	params.HitLoc = HitLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.Process_TossWeapon_When_Dying
// (Defined, Public)
// Parameters:
// class ALevelInfo*              levenInfo                      (Parm)
// class APawn*                   Pawn                           (Parm)
// class AwWeapon*                Weapon                         (Parm)

void AwAIDefencePawn::Process_TossWeapon_When_Dying(class ALevelInfo* levenInfo, class APawn* Pawn, class AwWeapon* Weapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.Process_TossWeapon_When_Dying");

	AwAIDefencePawn_Process_TossWeapon_When_Dying_Params params;
	params.levenInfo = levenInfo;
	params.Pawn = Pawn;
	params.Weapon = Weapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.PostBeginPlay
// (Defined, Simulated, Public)

void AwAIDefencePawn::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.PostBeginPlay");

	AwAIDefencePawn_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.PostNetReceive
// (Defined, Simulated, Event, Public)

void AwAIDefencePawn::PostNetReceive()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.PostNetReceive");

	AwAIDefencePawn_PostNetReceive_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.Setup
// (Defined, Simulated, Public)
// Parameters:
// struct FPlayerRecord           Rec                            (Parm, NeedCtorLink)
// bool                           bLoadNow                       (OptionalParm, Parm)

void AwAIDefencePawn::Setup(const struct FPlayerRecord& Rec, bool bLoadNow)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.Setup");

	AwAIDefencePawn_Setup_Params params;
	params.Rec = Rec;
	params.bLoadNow = bLoadNow;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.InitDefencePawn
// (Defined, Public)
// Parameters:
// class ALevelInfo*              Level                          (Parm)
// int                            Grade                          (Parm)
// int                            RegenLoc                       (Parm)

void AwAIDefencePawn::InitDefencePawn(class ALevelInfo* Level, int Grade, int RegenLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.InitDefencePawn");

	AwAIDefencePawn_InitDefencePawn_Params params;
	params.Level = Level;
	params.Grade = Grade;
	params.RegenLoc = RegenLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.Create
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              Level                          (Parm)
// struct FVector                 Location                       (Parm)
// struct FRotator                Rotation                       (Parm)
// class AwAIDefencePawn*         ReturnValue                    (Parm, OutParm, ReturnParm)

class AwAIDefencePawn* AwAIDefencePawn::STATIC_Create(class ALevelInfo* Level, const struct FVector& Location, const struct FRotator& Rotation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.Create");

	AwAIDefencePawn_Create_Params params;
	params.Level = Level;
	params.Location = Location;
	params.Rotation = Rotation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefencePawn.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwAIDefencePawn::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.PostNetBeginPlay");

	AwAIDefencePawn_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefencePawn.SetBotMesh
// (Defined, Simulated, Public)

void AwAIDefencePawn::SetBotMesh()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefencePawn.SetBotMesh");

	AwAIDefencePawn_SetBotMesh_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.PlayDyingSound
// (Public)

void AwSentryGunPawn::PlayDyingSound()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.PlayDyingSound");

	AwSentryGunPawn_PlayDyingSound_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.TakeDamageSound
// (Defined, Public)
// Parameters:
// int                            LeftHealth                     (Parm)
// int                            ActualDamage                   (Parm)
// struct FVector                 HitLocation                    (Parm)
// class UClass*                  DamageType                     (Parm)
// int                            CollisionPart                  (OptionalParm, Parm)
// int                            WeaponType                     (OptionalParm, Parm)
// class AController*             Killer                         (OptionalParm, Parm)

void AwSentryGunPawn::TakeDamageSound(int LeftHealth, int ActualDamage, const struct FVector& HitLocation, class UClass* DamageType, int CollisionPart, int WeaponType, class AController* Killer)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.TakeDamageSound");

	AwSentryGunPawn_TakeDamageSound_Params params;
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


// Function WGame.wSentryGunPawn.SpawnDebris
// (Defined, Simulated, Public)

void AwSentryGunPawn::SpawnDebris()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.SpawnDebris");

	AwSentryGunPawn_SpawnDebris_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.PlayDirectionalDeath
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLoc                         (Parm)

void AwSentryGunPawn::PlayDirectionalDeath(const struct FVector& HitLoc)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.PlayDirectionalDeath");

	AwSentryGunPawn_PlayDirectionalDeath_Params params;
	params.HitLoc = HitLoc;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.StopFiring
// (Defined, Simulated, Public)

void AwSentryGunPawn::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.StopFiring");

	AwSentryGunPawn_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.GetBloodHitClass
// (Defined, Simulated, Public)
// Parameters:
// ECollisionPartsType            collisionParts                 (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AwSentryGunPawn::GetBloodHitClass(ECollisionPartsType collisionParts)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.GetBloodHitClass");

	AwSentryGunPawn_GetBloodHitClass_Params params;
	params.collisionParts = collisionParts;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wSentryGunPawn.UpdateIdleMuzzle
// (Defined, Simulated, Protected)
// Parameters:
// float                          dt                             (Parm)
// bool                           bYaw                           (Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwSentryGunPawn::UpdateIdleMuzzle(float dt, bool bYaw)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.UpdateIdleMuzzle");

	AwSentryGunPawn_UpdateIdleMuzzle_Params params;
	params.dt = dt;
	params.bYaw = bYaw;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wSentryGunPawn.UpdateMuzzleBoneRotation
// (Defined, Simulated, Protected)
// Parameters:
// float                          dt                             (Parm)
// class APawn*                   targetPawn                     (Parm)
// bool                           bYaw                           (Parm)
// EMUZZLE_ROTATION_RESULT_TYPE   ReturnValue                    (Parm, OutParm, ReturnParm)

EMUZZLE_ROTATION_RESULT_TYPE AwSentryGunPawn::UpdateMuzzleBoneRotation(float dt, class APawn* targetPawn, bool bYaw)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.UpdateMuzzleBoneRotation");

	AwSentryGunPawn_UpdateMuzzleBoneRotation_Params params;
	params.dt = dt;
	params.targetPawn = targetPawn;
	params.bYaw = bYaw;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wSentryGunPawn.Tick_Activate
// (Defined, Simulated, Protected)
// Parameters:
// float                          dt                             (Parm)

void AwSentryGunPawn::Tick_Activate(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.Tick_Activate");

	AwSentryGunPawn_Tick_Activate_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.InitSentryZuzzleRotationParam
// (Defined, Simulated, Protected)

void AwSentryGunPawn::InitSentryZuzzleRotationParam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.InitSentryZuzzleRotationParam");

	AwSentryGunPawn_InitSentryZuzzleRotationParam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.Tick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          Delta                          (Parm)

void AwSentryGunPawn::Tick(float Delta)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.Tick");

	AwSentryGunPawn_Tick_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.RemoveLevelSentryGun
// (Defined, Simulated, Public)

void AwSentryGunPawn::RemoveLevelSentryGun()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.RemoveLevelSentryGun");

	AwSentryGunPawn_RemoveLevelSentryGun_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.Destroyed
// (Defined, Event, Public)

void AwSentryGunPawn::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.Destroyed");

	AwSentryGunPawn_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.UnPossessed
// (Defined, Public)

void AwSentryGunPawn::UnPossessed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.UnPossessed");

	AwSentryGunPawn_UnPossessed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.AddAllyEffect
// (Defined, Simulated, Public)
// Parameters:
// int                            iSideIndex                     (OptionalParm, Parm)

void AwSentryGunPawn::AddAllyEffect(int iSideIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.AddAllyEffect");

	AwSentryGunPawn_AddAllyEffect_Params params;
	params.iSideIndex = iSideIndex;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.AddDefaultInventory
// (Defined, Public)
// Parameters:
// bool                           bQuickslotChange               (OptionalParm, Parm)

void AwSentryGunPawn::AddDefaultInventory(bool bQuickslotChange)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.AddDefaultInventory");

	AwSentryGunPawn_AddDefaultInventory_Params params;
	params.bQuickslotChange = bQuickslotChange;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wSentryGunPawn.PostBeginPlay
// (Defined, Simulated, Event, Public)

void AwSentryGunPawn::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wSentryGunPawn.PostBeginPlay");

	AwSentryGunPawn_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.ForceSpawnVehicle
// (Defined, Public)

void AwBTR_ArrangeTurret::ForceSpawnVehicle()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.ForceSpawnVehicle");

	AwBTR_ArrangeTurret_ForceSpawnVehicle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.ForceDestroyVehicle
// (Defined, Public)

void AwBTR_ArrangeTurret::ForceDestroyVehicle()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.ForceDestroyVehicle");

	AwBTR_ArrangeTurret_ForceDestroyVehicle_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.PrecacheAnnouncer
// (Defined, Simulated, Public)
// Parameters:
// class AAnnouncerVoice*         V                              (Parm)
// bool                           bRewardSounds                  (Parm)

void AwBTR_ArrangeTurret::PrecacheAnnouncer(class AAnnouncerVoice* V, bool bRewardSounds)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.PrecacheAnnouncer");

	AwBTR_ArrangeTurret_PrecacheAnnouncer_Params params;
	params.V = V;
	params.bRewardSounds = bRewardSounds;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.VehicleDestroyed
// (Defined, Event, Public)
// Parameters:
// class AVehicle*                V                              (Parm)

void AwBTR_ArrangeTurret::VehicleDestroyed(class AVehicle* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.VehicleDestroyed");

	AwBTR_ArrangeTurret_VehicleDestroyed_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.VehiclePossessed
// (Defined, Event, Public)
// Parameters:
// class AVehicle*                V                              (Parm)

void AwBTR_ArrangeTurret::VehiclePossessed(class AVehicle* V)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.VehiclePossessed");

	AwBTR_ArrangeTurret_VehiclePossessed_Params params;
	params.V = V;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.Timer
// (Defined, Public)

void AwBTR_ArrangeTurret::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.Timer");

	AwBTR_ArrangeTurret_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.Reset
// (Defined, Public)

void AwBTR_ArrangeTurret::Reset()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.Reset");

	AwBTR_ArrangeTurret_Reset_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.SetVehicleTeam
// (Defined, Public)
// Parameters:
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte AwBTR_ArrangeTurret::SetVehicleTeam()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.SetVehicleTeam");

	AwBTR_ArrangeTurret_SetVehicleTeam_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBTR_ArrangeTurret.VehicleSpawned
// (Defined, Public)

void AwBTR_ArrangeTurret::VehicleSpawned()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.VehicleSpawned");

	AwBTR_ArrangeTurret_VehicleSpawned_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.SpawnBuildEffect
// (Defined, Public)

void AwBTR_ArrangeTurret::SpawnBuildEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.SpawnBuildEffect");

	AwBTR_ArrangeTurret_SpawnBuildEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.SpawnVehicle
// (Defined, Public)
// Parameters:
// bool                           noCollisionFail                (OptionalParm, Parm)

void AwBTR_ArrangeTurret::SpawnVehicle(bool noCollisionFail)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.SpawnVehicle");

	AwBTR_ArrangeTurret_SpawnVehicle_Params params;
	params.noCollisionFail = noCollisionFail;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.Shutdown
// (Defined, Public)

void AwBTR_ArrangeTurret::Shutdown()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.Shutdown");

	AwBTR_ArrangeTurret_Shutdown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.SetEnabled
// (Defined, Public)
// Parameters:
// bool                           bNewEnabled                    (Parm)

void AwBTR_ArrangeTurret::SetEnabled(bool bNewEnabled)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.SetEnabled");

	AwBTR_ArrangeTurret_SetEnabled_Params params;
	params.bNewEnabled = bNewEnabled;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.Trigger
// (Defined, Event, Public)
// Parameters:
// class AActor*                  Other                          (Parm)
// class APawn*                   EventInstigator                (Parm)

void AwBTR_ArrangeTurret::Trigger(class AActor* Other, class APawn* EventInstigator)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.Trigger");

	AwBTR_ArrangeTurret_Trigger_Params params;
	params.Other = Other;
	params.EventInstigator = EventInstigator;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.SelfTriggered
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwBTR_ArrangeTurret::SelfTriggered()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.SelfTriggered");

	AwBTR_ArrangeTurret_SelfTriggered_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wBTR_ArrangeTurret.UpdatePrecacheStaticMeshes
// (Defined, Simulated, Public)

void AwBTR_ArrangeTurret::UpdatePrecacheStaticMeshes()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.UpdatePrecacheStaticMeshes");

	AwBTR_ArrangeTurret_UpdatePrecacheStaticMeshes_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.UpdatePrecacheMaterials
// (Defined, Simulated, Public)

void AwBTR_ArrangeTurret::UpdatePrecacheMaterials()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.UpdatePrecacheMaterials");

	AwBTR_ArrangeTurret_UpdatePrecacheMaterials_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_ArrangeTurret.PostBeginPlay
// (Defined, Simulated, Public)

void AwBTR_ArrangeTurret::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_ArrangeTurret.PostBeginPlay");

	AwBTR_ArrangeTurret_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wBTR_Turret_FNM240.VehicleSpawned
// (Defined, Public)

void AwBTR_Turret_FNM240::VehicleSpawned()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wBTR_Turret_FNM240.VehicleSpawned");

	AwBTR_Turret_FNM240_VehicleSpawned_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.GetTeamNum
// (Defined, Simulated, Public)
// Parameters:
// int                            ReturnValue                    (Parm, OutParm, ReturnParm)

int AwAIDefenceBot::GetTeamNum()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.GetTeamNum");

	AwAIDefenceBot_GetTeamNum_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefenceBot.Possess
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwAIDefenceBot::Possess(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.Possess");

	AwAIDefenceBot_Possess_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.InitBot
// (Defined, Public)
// Parameters:
// int                            Grade                          (Parm)

void AwAIDefenceBot::InitBot(int Grade)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.InitBot");

	AwAIDefenceBot_InitBot_Params params;
	params.Grade = Grade;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.TickStance
// (Defined, Public)
// Parameters:
// float                          DeltaTime                      (Parm)

void AwAIDefenceBot::TickStance(float DeltaTime)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.TickStance");

	AwAIDefenceBot_TickStance_Params params;
	params.DeltaTime = DeltaTime;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.TryProne
// (Defined, Public)

void AwAIDefenceBot::TryProne()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.TryProne");

	AwAIDefenceBot_TryProne_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.TryCrouch
// (Defined, Public)

void AwAIDefenceBot::TryCrouch()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.TryCrouch");

	AwAIDefenceBot_TryCrouch_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.SetupWeapons
// (Defined, Public)
// Parameters:
// class APawn*                   aPawn                          (Parm)

void AwAIDefenceBot::SetupWeapons(class APawn* aPawn)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.SetupWeapons");

	AwAIDefenceBot_SetupWeapons_Params params;
	params.aPawn = aPawn;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.SetPawnClass
// (Defined, Net, Public)
// Parameters:
// string                         inClass                        (Parm, NeedCtorLink)
// string                         InCharacter                    (Parm, NeedCtorLink)

void AwAIDefenceBot::SetPawnClass(const string& inClass, const string& InCharacter)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.SetPawnClass");

	AwAIDefenceBot_SetPawnClass_Params params;
	params.inClass = inClass;
	params.InCharacter = InCharacter;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.NotifyAddDefaultInventory
// (Defined, Public)

void AwAIDefenceBot::NotifyAddDefaultInventory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.NotifyAddDefaultInventory");

	AwAIDefenceBot_NotifyAddDefaultInventory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.CallAirStrike
// (Defined, Net, NetReliable, Public)
// Parameters:
// class AController*             Caller                         (OptionalParm, Parm)

void AwAIDefenceBot::CallAirStrike(class AController* Caller)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.CallAirStrike");

	AwAIDefenceBot_CallAirStrike_Params params;
	params.Caller = Caller;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAIDefenceBot.ReadyToMeleeAttack
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwAIDefenceBot::ReadyToMeleeAttack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot.ReadyToMeleeAttack");

	AwAIDefenceBot_ReadyToMeleeAttack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WGame.wAIDefenceBot_Alpha.NotifyAddDefaultInventory
// (Defined, Public)

void AwAIDefenceBot_Alpha::NotifyAddDefaultInventory()
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAIDefenceBot_Alpha.NotifyAddDefaultInventory");

	AwAIDefenceBot_Alpha_NotifyAddDefaultInventory_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.wAISentryGunController.Tick
// (Defined, Event, Public)
// Parameters:
// float                          dt                             (Parm)

void AwAISentryGunController::Tick(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.wAISentryGunController.Tick");

	AwAISentryGunController_Tick_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.PrecacheGameClient.PrecacheGameSkeletalMeshes
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void UPrecacheGameClient::STATIC_PrecacheGameSkeletalMeshes(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.PrecacheGameClient.PrecacheGameSkeletalMeshes");

	UPrecacheGameClient_PrecacheGameSkeletalMeshes_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.PrecacheGameClient.PrecacheGameStaticMeshes
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void UPrecacheGameClient::STATIC_PrecacheGameStaticMeshes(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.PrecacheGameClient.PrecacheGameStaticMeshes");

	UPrecacheGameClient_PrecacheGameStaticMeshes_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WGame.PrecacheGameClient.PrecacheGameTextures
// (Defined, Static, Public)
// Parameters:
// class ALevelInfo*              myLevel                        (Parm)

void UPrecacheGameClient::STATIC_PrecacheGameTextures(class ALevelInfo* myLevel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WGame.PrecacheGameClient.PrecacheGameTextures");

	UPrecacheGameClient_PrecacheGameTextures_Params params;
	params.myLevel = myLevel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
