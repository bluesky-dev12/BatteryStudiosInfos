#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Constants
//---------------------------------------------------------------------------

#define CONST_BTPageClan_LABEL_COUNT                              15
#define CONST_MAX_QUICKSLOT_COUNT                                4
#define CONST_UserPingRefreshTime                                5
#define CONST_TabCount                                            3
#define CONST_SendPingDelayTime                                  3

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum GUIWarfare.BTNetGUIPage.eUserState
enum class EeUserState : uint8_t
{
	eUState_waiting                = 0,
	eUState_ready                  = 1,
	eUState_playing                = 2,
	eUState_shop                   = 3,
	eUState_auction                = 4,
	eUState_inventory              = 5,
	eUState_mail                   = 6,
	eUState_Tutorial               = 7,
	eUState_MyInfo                 = 8,
	eUState_Lucky                  = 9
};


// Enum GUIWarfare.BTNetMainMenu.GameRoomType
enum class EGameRoomType : uint8_t
{
	GameRoomType_Normal            = 0,
	GameRoomType_Permanent         = 1,
	GameRoomType_ClanPermanent     = 2,
	GameRoomType_Clan              = 3,
	GameRoomType_League            = 4,
	GameRoomType_End               = 5
};


// Enum GUIWarfare.BTNetGUIPageHK.eEquipItemPos
enum class EeEquipItemPos : uint8_t
{
	Pos_Helmet                     = 0,
	Pos_Face                       = 1,
	Pos_BackPack                   = 2,
	Pos_Pouch                      = 3,
	Pos_Camouflage                 = 4,
	Pos_CharAF                     = 5,
	Pos_CharRSA                    = 6,
	Pos_FakeLv                     = 7
};


// Enum GUIWarfare.BTPageRoomLobby.E_MyAction
enum class E_MyAction : uint8_t
{
	E_MY_ACTION_NONE               = 0,
	E_MY_ACTION_INTERVENTION       = 1
};


// Enum GUIWarfare.BTPageServerSelection.EGmType
enum class EGmType : uint8_t
{
	GM_GRADE_NONE                  = 0,
	GM_GRADE_NORMAL                = 1,
	GM_GRADE_ESPORTS               = 2,
	GM_GRADE_PLAYER                = 3
};


// Enum GUIWarfare.BTPageInventory.E_REPAIR_TYPE
enum class E_REPAIR_TYPE : uint8_t
{
	E_REPAIR_ALL                   = 0,
	E_REPAIR_EQUIPPED_ITEM         = 1,
	E_REPAIR_OWNED_ITEM            = 2
};


// Enum GUIWarfare.BTWindowItemExpiredHK.eExpiredBuyType
enum class EeExpiredBuyType : uint8_t
{
	EBT_NONE                       = 0,
	EBT_CCOIN                      = 1,
	EBT_PCOIN                      = 2,
	EBT_POINT                      = 3
};


// Enum GUIWarfare.BTPageLucky.E_LUCKY_TAB
enum class E_LUCKY_TAB : uint8_t
{
	ELT_CAPSULE_STORE              = 0,
	ELT_CAPSULE_INVENTORY          = 1,
	ELT_BLACKBOX                   = 2
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct GUIWarfare.BTNetGUIPage.ChatInfo
// 0x001C
struct FChatInfo
{
	int                                                ChatType;                                                 // 0x0000(0x0004)
	string                                             ChatTo;                                                   // 0x0004(0x000C) (NeedCtorLink)
	string                                             chatText;                                                 // 0x0010(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.SendQuickSlotInfo
// 0x003C
struct FSendQuickSlotInfo
{
	byte[]                                             iQuickSlotOrders;                                         // 0x0000(0x000C) (NeedCtorLink)
	int[]                                              iItemIDs;                                                 // 0x000C(0x000C) (NeedCtorLink)
	struct FBtrDouble[]                                dwUniqueIDs;                                              // 0x0018(0x000C) (NeedCtorLink)
	byte[]                                             iSlotPosKeys;                                             // 0x0024(0x000C) (NeedCtorLink)
	byte[]                                             iSlotPosValues;                                           // 0x0030(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.UpdateQuickSlotInfo
// 0x0018
struct FUpdateQuickSlotInfo
{
	byte                                               iQuickSlotIndex;                                          // 0x0000(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0001(0x0003) MISSED OFFSET
	int                                                iItemID;                                                  // 0x0004(0x0004)
	struct FBtrDouble                                  dwUniqueID;                                               // 0x0008(0x0008)
	ESLOT_POS                                          eNewSlotPos;                                              // 0x0010(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0011(0x0003) MISSED OFFSET
	bool                                               bEquipped;                                                // 0x0014(0x0004)
	bool                                               bSendServer;                                              // 0x0014(0x0004)
	bool                                               bIsSkill;                                                 // 0x0014(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.LoginServerStruct
// 0x0018
struct FLoginServerStruct
{
	string                                             szIP;                                                     // 0x0000(0x000C) (NeedCtorLink)
	int                                                iPort;                                                    // 0x000C(0x0004)
	byte                                               iFaild;                                                   // 0x0010(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0011(0x0003) MISSED OFFSET
	float                                              fTimeStamp;                                               // 0x0014(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.WZInvenListProcess
// 0x001C
struct FWZInvenListProcess
{
	bool                                               bLock;                                                    // 0x0000(0x0004)
	int                                                MaxPage;                                                  // 0x0004(0x0004)
	int                                                CurPage;                                                  // 0x0008(0x0004)
	int                                                CountPerPage;                                             // 0x000C(0x0004)
	string                                             StorageType;                                              // 0x0010(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.ServerConnectionInfo
// 0x00B8
struct FServerConnectionInfo
{
	int                                                ServerID;                                                 // 0x0000(0x0004)
	int                                                ChannelID;                                                // 0x0004(0x0004)
	string                                             ServerIP;                                                 // 0x0008(0x000C) (NeedCtorLink)
	int                                                serverPort;                                               // 0x0014(0x0004)
	int                                                ServerDataPort;                                           // 0x0018(0x0004)
	string                                             ServerName;                                               // 0x001C(0x000C) (NeedCtorLink)
	string                                             ServerShortName;                                          // 0x0028(0x000C) (NeedCtorLink)
	string                                             ChannelName;                                              // 0x0034(0x000C) (NeedCtorLink)
	int                                                ServerGroupID;                                            // 0x0040(0x0004)
	string                                             ServerGroupName;                                          // 0x0044(0x000C) (NeedCtorLink)
	int                                                IsClanChannel;                                            // 0x0050(0x0004)
	string                                             ChannelNickName;                                          // 0x0054(0x000C) (NeedCtorLink)
	bool                                               IsDedicatedServer;                                        // 0x0060(0x0004)
	int                                                nCurUser;                                                 // 0x0064(0x0004)
	int                                                nMaxUser;                                                 // 0x0068(0x0004)
	float                                              ChannelOption[0x13];                                      // 0x006C(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.MapNameInfo
// 0x0018
struct FMapNameInfo
{
	string                                             FriendlyName;                                             // 0x0000(0x000C) (NeedCtorLink)
	string                                             fileName;                                                 // 0x000C(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.ChatHistory
// 0x0010
struct FChatHistory
{
	int                                                ChatType;                                                 // 0x0000(0x0004)
	string                                             chatText;                                                 // 0x0004(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.AAS_Struct
// 0x0024
struct FAAS_Struct
{
	byte                                               Level;                                                    // 0x0000(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0001(0x0003) MISSED OFFSET
	bool                                               Activated;                                                // 0x0004(0x0004)
	string                                             Text;                                                     // 0x0008(0x000C) (NeedCtorLink)
	float                                              Time;                                                     // 0x0014(0x0004)
	int                                                iRepeatTime;                                              // 0x0018(0x0004)
	int                                                iCount;                                                   // 0x001C(0x0004)
	float                                              fBeginTime;                                               // 0x0020(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.LevelUpInfoStruct
// 0x0024
struct FLevelUpInfoStruct
{
	bool                                               bLevelUp;                                                 // 0x0000(0x0004)
	bool                                               bCompleteLevelUp;                                         // 0x0000(0x0004)
	int                                                Level;                                                    // 0x0004(0x0004)
	int                                                Exp;                                                      // 0x0008(0x0004)
	int[]                                              ItemID;                                                   // 0x000C(0x000C) (NeedCtorLink)
	int[]                                              PartID;                                                   // 0x0018(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.EachDurabilityWarningItem
// 0x001C
struct FEachDurabilityWarningItem
{
	struct FBtrDouble                                  UniqueID;                                                 // 0x0000(0x0008)
	int                                                ItemID;                                                   // 0x0008(0x0004)
	int                                                SlotPos;                                                  // 0x000C(0x0004)
	int                                                PartID;                                                   // 0x0010(0x0004)
	int                                                Durability;                                               // 0x0014(0x0004)
	int                                                RepairCost;                                               // 0x0018(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.DurabilityWarningItemsStruct
// 0x0010
struct FDurabilityWarningItemsStruct
{
	bool                                               bDurWarningItem;                                          // 0x0000(0x0004)
	bool                                               bReqRepairCost;                                           // 0x0000(0x0004)
	struct FEachDurabilityWarningItem[]                items;                                                    // 0x0004(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTPageServerSelection.ConnectingInfo
// 0x001C
struct FConnectingInfo
{
	int                                                ServerID;                                                 // 0x0000(0x0004)
	int                                                ChannelID;                                                // 0x0004(0x0004)
	string                                             IP;                                                       // 0x0008(0x000C) (NeedCtorLink)
	int                                                Port;                                                     // 0x0014(0x0004)
	int                                                DataPort;                                                 // 0x0018(0x0004)
};

// Struct GUIWarfare.BTPageServerSelection.CheckToReceivedPacket
// 0x0004
struct FCheckToReceivedPacket
{
	bool                                               bItemListEnd;                                             // 0x0000(0x0004)
	bool                                               bSkillListEnd;                                            // 0x0000(0x0004)
	bool                                               bQSListEnd;                                               // 0x0000(0x0004)
	bool                                               bServerTimeEnd;                                           // 0x0000(0x0004)
	bool                                               bGetMyMailBoxState;                                       // 0x0000(0x0004)
	bool                                               bGetServerTimeEnd;                                        // 0x0000(0x0004)
	bool                                               bHashEnd;                                                 // 0x0000(0x0004)
};

// Struct GUIWarfare.BTPageAuction.SearchAuctionItem
// 0x0028
struct FSearchAuctionItem
{
	bool                                               bLock;                                                    // 0x0000(0x0004)
	int                                                Section;                                                  // 0x0004(0x0004)
	string                                             Keyword;                                                  // 0x0008(0x000C) (NeedCtorLink)
	int                                                ItemRank;                                                 // 0x0014(0x0004)
	byte                                               ItemClassify;                                             // 0x0018(0x0001)
	byte                                               IsAvailable;                                              // 0x0019(0x0001)
	byte                                               Padding00[0x2];                                           // 0x001A(0x0002) MISSED OFFSET
	int                                                CurrentPageNum;                                           // 0x001C(0x0004)
	int                                                PagePerCount;                                             // 0x0020(0x0004)
	int                                                SortType;                                                 // 0x0024(0x0004)
};

// Struct GUIWarfare.BTPageMail.ReceiveMode
// 0x0010
struct FReceiveMode
{
	bool                                               bLock;                                                    // 0x0000(0x0004)
	int                                                RequestMailType;                                          // 0x0004(0x0004)
	int                                                RequestItemType;                                          // 0x0008(0x0004)
	int                                                TotalCount;                                               // 0x000C(0x0004)
};

// Struct GUIWarfare.BTWindowItemExpiredHK.BuyExpriedCashInfo
// 0x000C
struct FBuyExpriedCashInfo
{
	int[]                                              CashElements;                                             // 0x0000(0x000C) (NeedCtorLink)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
