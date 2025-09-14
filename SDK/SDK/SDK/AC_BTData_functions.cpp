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

// Function BTData.BTNetPlayerData.getNameData
// (Native, Public)
// Parameters:
// struct FString                 category                       (Parm, NeedCtorLink)
// struct FString                 key                            (Parm, NeedCtorLink)
// int                            iIndex                         (Parm)
// struct FName                   ReturnValue                    (Parm, OutParm, ReturnParm)

struct FName UBTNetPlayerData::getNameData(const struct FString& category, const struct FString& key, int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetPlayerData.getNameData");

	UBTNetPlayerData_getNameData_Params params;
	params.category = category;
	params.key = key;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetPlayerData.getData
// (Native, Public)
// Parameters:
// struct FString                 category                       (Parm, NeedCtorLink)
// struct FString                 key                            (Parm, NeedCtorLink)
// int                            iIndex                         (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UBTNetPlayerData::getData(const struct FString& category, const struct FString& key, int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetPlayerData.getData");

	UBTNetPlayerData_getData_Params params;
	params.category = category;
	params.key = key;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetPlayerData.LoadPlayerMoveParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetPlayerData::LoadPlayerMoveParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetPlayerData.LoadPlayerMoveParams");

	UBTNetPlayerData_LoadPlayerMoveParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetPlayerData.LoadPlayerAnimationData
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetPlayerData::LoadPlayerAnimationData()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetPlayerData.LoadPlayerAnimationData");

	UBTNetPlayerData_LoadPlayerAnimationData_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetPlayerData.LoadPlayerPartsData
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetPlayerData::LoadPlayerPartsData()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetPlayerData.LoadPlayerPartsData");

	UBTNetPlayerData_LoadPlayerPartsData_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetMapData.getData
// (Native, Public)
// Parameters:
// struct FString                 category                       (Parm, NeedCtorLink)
// struct FString                 key                            (Parm, NeedCtorLink)
// int                            iIndex                         (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UBTNetMapData::getData(const struct FString& category, const struct FString& key, int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetMapData.getData");

	UBTNetMapData_getData_Params params;
	params.category = category;
	params.key = key;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetMapData.LoadMapData
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetMapData::LoadMapData()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetMapData.LoadMapData");

	UBTNetMapData_LoadMapData_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.ClearNetData
// (Defined, Public)

void UBTNetGameData::ClearNetData()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.ClearNetData");

	UBTNetGameData_ClearNetData_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function BTData.BTNetGameData.LoadDailyQuestRewardParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadDailyQuestRewardParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadDailyQuestRewardParams");

	UBTNetGameData_LoadDailyQuestRewardParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadCapsuleRewardParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadCapsuleRewardParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadCapsuleRewardParams");

	UBTNetGameData_LoadCapsuleRewardParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadModeDOAParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadModeDOAParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadModeDOAParams");

	UBTNetGameData_LoadModeDOAParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadSupplyRandomTable
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadSupplyRandomTable()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadSupplyRandomTable");

	UBTNetGameData_LoadSupplyRandomTable_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadClanLevelInfoParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadClanLevelInfoParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadClanLevelInfoParams");

	UBTNetGameData_LoadClanLevelInfoParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadLevelInfoParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadLevelInfoParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadLevelInfoParams");

	UBTNetGameData_LoadLevelInfoParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadItemBoxParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadItemBoxParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadItemBoxParams");

	UBTNetGameData_LoadItemBoxParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadClanMarkParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadClanMarkParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadClanMarkParams");

	UBTNetGameData_LoadClanMarkParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadDailyQuestParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadDailyQuestParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadDailyQuestParams");

	UBTNetGameData_LoadDailyQuestParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadRandBoxParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadRandBoxParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadRandBoxParams");

	UBTNetGameData_LoadRandBoxParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadQuestParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadQuestParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadQuestParams");

	UBTNetGameData_LoadQuestParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadPaintGroupParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadPaintGroupParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadPaintGroupParams");

	UBTNetGameData_LoadPaintGroupParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadPromotionParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadPromotionParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadPromotionParams");

	UBTNetGameData_LoadPromotionParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadAddPartsGroupParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadAddPartsGroupParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadAddPartsGroupParams");

	UBTNetGameData_LoadAddPartsGroupParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadSkillParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadSkillParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadSkillParams");

	UBTNetGameData_LoadSkillParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadItemResourceParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadItemResourceParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadItemResourceParams");

	UBTNetGameData_LoadItemResourceParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadItemParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadItemParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadItemParams");

	UBTNetGameData_LoadItemParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadWeaponRecoilParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadWeaponRecoilParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadWeaponRecoilParams");

	UBTNetGameData_LoadWeaponRecoilParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadWeaponParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadWeaponParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadWeaponParams");

	UBTNetGameData_LoadWeaponParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadWeaponRes
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadWeaponRes()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadWeaponRes");

	UBTNetGameData_LoadWeaponRes_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.getData
// (Native, Public)
// Parameters:
// struct FString                 category                       (Parm, NeedCtorLink)
// struct FString                 key                            (Parm, NeedCtorLink)
// int                            iIndex                         (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UBTNetGameData::getData(const struct FString& category, const struct FString& key, int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.getData");

	UBTNetGameData_getData_Params params;
	params.category = category;
	params.key = key;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadAllData
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadAllData()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadAllData");

	UBTNetGameData_LoadAllData_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetGameData.LoadAddPaintGroupParams
// (Native, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetGameData::LoadAddPaintGroupParams()
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetGameData.LoadAddPaintGroupParams");

	UBTNetGameData_LoadAddPaintGroupParams_Params params;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetExcelData.getData
// (Native, Public)
// Parameters:
// struct FString                 category                       (Parm, NeedCtorLink)
// struct FString                 key                            (Parm, NeedCtorLink)
// int                            iIndex                         (Parm)
// struct FString                 ReturnValue                    (Parm, OutParm, ReturnParm, NeedCtorLink)

struct FString UBTNetExcelData::getData(const struct FString& category, const struct FString& key, int iIndex)
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetExcelData.getData");

	UBTNetExcelData_getData_Params params;
	params.category = category;
	params.key = key;
	params.iIndex = iIndex;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function BTData.BTNetExcelData.LoadExcelData
// (Native, Public)
// Parameters:
// struct FString                 fileName                       (Parm, NeedCtorLink)
// struct FString                 sheetName                      (Parm, NeedCtorLink)
// int                            numHeadRows                    (Parm)
// int                            numHeadColumns                 (Parm)
// int                            nKeyColumnOrRow                (Parm)
// int                            arrangeType                    (OptionalParm, Parm)
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UBTNetExcelData::LoadExcelData(const struct FString& fileName, const struct FString& sheetName, int numHeadRows, int numHeadColumns, int nKeyColumnOrRow, int arrangeType)
{
	static auto fn = UObject::FindObject<UFunction>("Function BTData.BTNetExcelData.LoadExcelData");

	UBTNetExcelData_LoadExcelData_Params params;
	params.fileName = fileName;
	params.sheetName = sheetName;
	params.numHeadRows = numHeadRows;
	params.numHeadColumns = numHeadColumns;
	params.nKeyColumnOrRow = nKeyColumnOrRow;
	params.arrangeType = arrangeType;

	auto flags = fn->FunctionFlags;
	fn->FunctionFlags |= 0x400;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
