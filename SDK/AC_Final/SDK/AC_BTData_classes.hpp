#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class BTData.BTNetPlayerData
// 0x0000 (0x002C - 0x002C)
class UBTNetPlayerData : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BTData.BTNetPlayerData");
		return ptr;
	}


	FName getNameData(const string& category, const string& key, int iIndex);
	string getData(const string& category, const string& key, int iIndex);
	bool LoadPlayerMoveParams();
	bool LoadPlayerAnimationData();
	bool LoadPlayerPartsData();
};


// Class BTData.BTNetMapData
// 0x0000 (0x002C - 0x002C)
class UBTNetMapData : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BTData.BTNetMapData");
		return ptr;
	}


	string getData(const string& category, const string& key, int iIndex);
	bool LoadMapData();
};


// Class BTData.BTNetGameData
// 0x006C (0x0098 - 0x002C)
class UBTNetGameData : public UObject
{
public:
	struct FBT_ItemShopInfo[]                          NetItemShopInfoList;                                      // 0x002C(0x000C) (NeedCtorLink)
	struct FBT_WeaponInfo[]                            NetWeaponInfoList;                                        // 0x0038(0x000C) (NeedCtorLink)
	struct FBT_Skill[]                                 NetSkillInfoList;                                         // 0x0044(0x000C) (NeedCtorLink)
	struct FBT_PartsGroup[]                            NetPartsGroupList;                                        // 0x0050(0x000C) (NeedCtorLink)
	struct FBT_Promotion[]                             NetPromotionList;                                         // 0x005C(0x000C) (NeedCtorLink)
	struct FBT_ItemBox[]                               NetItemBoxList;                                           // 0x0068(0x000C) (NeedCtorLink)
	struct FBT_LevelInfo[]                             NetLevelInfoList;                                         // 0x0074(0x000C) (NeedCtorLink)
	struct FBT_GameMapInfo[]                           NetGameMapInfoList;                                       // 0x0080(0x000C) (NeedCtorLink)
	struct FBT_PaintGroup[]                            NetPaintGroupList;                                        // 0x008C(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BTData.BTNetGameData");
		return ptr;
	}


	void ClearNetData();
	bool LoadDailyQuestRewardParams();
	bool LoadCapsuleRewardParams();
	bool LoadModeDOAParams();
	bool LoadSupplyRandomTable();
	bool LoadClanLevelInfoParams();
	bool LoadLevelInfoParams();
	bool LoadItemBoxParams();
	bool LoadClanMarkParams();
	bool LoadDailyQuestParams();
	bool LoadRandBoxParams();
	bool LoadQuestParams();
	bool LoadPaintGroupParams();
	bool LoadPromotionParams();
	bool LoadAddPartsGroupParams();
	bool LoadSkillParams();
	bool LoadItemResourceParams();
	bool LoadItemParams();
	bool LoadWeaponRecoilParams();
	bool LoadWeaponParams();
	bool LoadWeaponRes();
	string getData(const string& category, const string& key, int iIndex);
	bool LoadAllData();
	bool LoadAddPaintGroupParams();
};


// Class BTData.BTNetExcelData
// 0x0000 (0x002C - 0x002C)
class UBTNetExcelData : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BTData.BTNetExcelData");
		return ptr;
	}


	string getData(const string& category, const string& key, int iIndex);
	bool LoadExcelData(const string& fileName, const string& sheetName, int numHeadRows, int numHeadColumns, int nKeyColumnOrRow, int arrangeType);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
