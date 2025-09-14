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

// Function BTData.BTNetPlayerData.getNameData
struct UBTNetPlayerData_getNameData_Params
{
	struct FString                                     category;                                                 // (Parm, NeedCtorLink)
	struct FString                                     key;                                                      // (Parm, NeedCtorLink)
	int                                                iIndex;                                                   // (Parm)
	struct FName                                       ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetPlayerData.getData
struct UBTNetPlayerData_getData_Params
{
	struct FString                                     category;                                                 // (Parm, NeedCtorLink)
	struct FString                                     key;                                                      // (Parm, NeedCtorLink)
	int                                                iIndex;                                                   // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function BTData.BTNetPlayerData.LoadPlayerMoveParams
struct UBTNetPlayerData_LoadPlayerMoveParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetPlayerData.LoadPlayerAnimationData
struct UBTNetPlayerData_LoadPlayerAnimationData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetPlayerData.LoadPlayerPartsData
struct UBTNetPlayerData_LoadPlayerPartsData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetMapData.getData
struct UBTNetMapData_getData_Params
{
	struct FString                                     category;                                                 // (Parm, NeedCtorLink)
	struct FString                                     key;                                                      // (Parm, NeedCtorLink)
	int                                                iIndex;                                                   // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function BTData.BTNetMapData.LoadMapData
struct UBTNetMapData_LoadMapData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.ClearNetData
struct UBTNetGameData_ClearNetData_Params
{
};

// Function BTData.BTNetGameData.LoadDailyQuestRewardParams
struct UBTNetGameData_LoadDailyQuestRewardParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadCapsuleRewardParams
struct UBTNetGameData_LoadCapsuleRewardParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadModeDOAParams
struct UBTNetGameData_LoadModeDOAParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadSupplyRandomTable
struct UBTNetGameData_LoadSupplyRandomTable_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadClanLevelInfoParams
struct UBTNetGameData_LoadClanLevelInfoParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadLevelInfoParams
struct UBTNetGameData_LoadLevelInfoParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadItemBoxParams
struct UBTNetGameData_LoadItemBoxParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadClanMarkParams
struct UBTNetGameData_LoadClanMarkParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadDailyQuestParams
struct UBTNetGameData_LoadDailyQuestParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadRandBoxParams
struct UBTNetGameData_LoadRandBoxParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadQuestParams
struct UBTNetGameData_LoadQuestParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadPaintGroupParams
struct UBTNetGameData_LoadPaintGroupParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadPromotionParams
struct UBTNetGameData_LoadPromotionParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadAddPartsGroupParams
struct UBTNetGameData_LoadAddPartsGroupParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadSkillParams
struct UBTNetGameData_LoadSkillParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadItemResourceParams
struct UBTNetGameData_LoadItemResourceParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadItemParams
struct UBTNetGameData_LoadItemParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadWeaponRecoilParams
struct UBTNetGameData_LoadWeaponRecoilParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadWeaponParams
struct UBTNetGameData_LoadWeaponParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadWeaponRes
struct UBTNetGameData_LoadWeaponRes_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.getData
struct UBTNetGameData_getData_Params
{
	struct FString                                     category;                                                 // (Parm, NeedCtorLink)
	struct FString                                     key;                                                      // (Parm, NeedCtorLink)
	int                                                iIndex;                                                   // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function BTData.BTNetGameData.LoadAllData
struct UBTNetGameData_LoadAllData_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetGameData.LoadAddPaintGroupParams
struct UBTNetGameData_LoadAddPaintGroupParams_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function BTData.BTNetExcelData.getData
struct UBTNetExcelData_getData_Params
{
	struct FString                                     category;                                                 // (Parm, NeedCtorLink)
	struct FString                                     key;                                                      // (Parm, NeedCtorLink)
	int                                                iIndex;                                                   // (Parm)
	struct FString                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm, NeedCtorLink)
};

// Function BTData.BTNetExcelData.LoadExcelData
struct UBTNetExcelData_LoadExcelData_Params
{
	struct FString                                     fileName;                                                 // (Parm, NeedCtorLink)
	struct FString                                     sheetName;                                                // (Parm, NeedCtorLink)
	int                                                numHeadRows;                                              // (Parm)
	int                                                numHeadColumns;                                           // (Parm)
	int                                                nKeyColumnOrRow;                                          // (Parm)
	int                                                arrangeType;                                              // (OptionalParm, Parm)
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
