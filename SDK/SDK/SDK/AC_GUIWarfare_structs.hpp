#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Constants
//---------------------------------------------------------------------------

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
	struct FString                                     ChatTo;                                                   // 0x0004(0x000C) (NeedCtorLink)
	struct FString                                     chatText;                                                 // 0x0010(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.LoginServerStruct
// 0x0018
struct FLoginServerStruct
{
	struct FString                                     szIP;                                                     // 0x0000(0x000C) (NeedCtorLink)
	int                                                iPort;                                                    // 0x000C(0x0004)
	unsigned char                                      iFaild;                                                   // 0x0010(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0011(0x0003) MISSED OFFSET
	float                                              fTimeStamp;                                               // 0x0014(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.WZInvenListProcess
// 0x001C
struct FWZInvenListProcess
{
	unsigned long                                      bLock : 1;                                                // 0x0000(0x0004)
	int                                                MaxPage;                                                  // 0x0004(0x0004)
	int                                                CurPage;                                                  // 0x0008(0x0004)
	int                                                CountPerPage;                                             // 0x000C(0x0004)
	struct FString                                     StorageType;                                              // 0x0010(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.ServerConnectionInfo
// 0x00B8
struct FServerConnectionInfo
{
	int                                                ServerID;                                                 // 0x0000(0x0004)
	int                                                ChannelID;                                                // 0x0004(0x0004)
	struct FString                                     ServerIP;                                                 // 0x0008(0x000C) (NeedCtorLink)
	int                                                serverPort;                                               // 0x0014(0x0004)
	int                                                ServerDataPort;                                           // 0x0018(0x0004)
	struct FString                                     ServerName;                                               // 0x001C(0x000C) (NeedCtorLink)
	struct FString                                     ServerShortName;                                          // 0x0028(0x000C) (NeedCtorLink)
	struct FString                                     ChannelName;                                              // 0x0034(0x000C) (NeedCtorLink)
	int                                                ServerGroupID;                                            // 0x0040(0x0004)
	struct FString                                     ServerGroupName;                                          // 0x0044(0x000C) (NeedCtorLink)
	int                                                IsClanChannel;                                            // 0x0050(0x0004)
	struct FString                                     ChannelNickName;                                          // 0x0054(0x000C) (NeedCtorLink)
	unsigned long                                      IsDedicatedServer : 1;                                    // 0x0060(0x0004)
	int                                                nCurUser;                                                 // 0x0064(0x0004)
	int                                                nMaxUser;                                                 // 0x0068(0x0004)
	float                                              ChannelOption[0x13];                                      // 0x006C(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.MapNameInfo
// 0x0018
struct FMapNameInfo
{
	struct FString                                     FriendlyName;                                             // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     fileName;                                                 // 0x000C(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.ChatHistory
// 0x0010
struct FChatHistory
{
	int                                                ChatType;                                                 // 0x0000(0x0004)
	struct FString                                     chatText;                                                 // 0x0004(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.AAS_Struct
// 0x0024
struct FAAS_Struct
{
	unsigned char                                      Level;                                                    // 0x0000(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0001(0x0003) MISSED OFFSET
	unsigned long                                      Activated : 1;                                            // 0x0004(0x0004)
	struct FString                                     Text;                                                     // 0x0008(0x000C) (NeedCtorLink)
	float                                              Time;                                                     // 0x0014(0x0004)
	int                                                iRepeatTime;                                              // 0x0018(0x0004)
	int                                                iCount;                                                   // 0x001C(0x0004)
	float                                              fBeginTime;                                               // 0x0020(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.LevelUpInfoStruct
// 0x0024
struct FLevelUpInfoStruct
{
	unsigned long                                      bLevelUp : 1;                                             // 0x0000(0x0004)
	unsigned long                                      bCompleteLevelUp : 1;                                     // 0x0000(0x0004)
	int                                                Level;                                                    // 0x0004(0x0004)
	int                                                Exp;                                                      // 0x0008(0x0004)
	TArray<int>                                        ItemID;                                                   // 0x000C(0x000C) (NeedCtorLink)
	TArray<int>                                        PartID;                                                   // 0x0018(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTNetMainMenu.EachExpiredItem
// 0x0018
struct FEachExpiredItem
{
	int                                                ItemID;                                                   // 0x0000(0x0004)
	int                                                SlotPos;                                                  // 0x0004(0x0004)
	int                                                PartID;                                                   // 0x0008(0x0004)
	struct FBtrDouble                                  UniqueItemID;                                             // 0x000C(0x0008)
	int                                                UniqueSkillID;                                            // 0x0014(0x0004)
};

// Struct GUIWarfare.BTNetMainMenu.ExpiredItemsStruct
// 0x0010
struct FExpiredItemsStruct
{
	unsigned long                                      bExpiredItem : 1;                                         // 0x0000(0x0004)
	TArray<struct FEachExpiredItem>                    items;                                                    // 0x0004(0x000C) (NeedCtorLink)
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
	unsigned long                                      bDurWarningItem : 1;                                      // 0x0000(0x0004)
	unsigned long                                      bReqRepairCost : 1;                                       // 0x0000(0x0004)
	TArray<struct FEachDurabilityWarningItem>          items;                                                    // 0x0004(0x000C) (NeedCtorLink)
};

// Struct GUIWarfare.BTPageServerSelection.ConnectingInfo
// 0x001C
struct FConnectingInfo
{
	int                                                ServerID;                                                 // 0x0000(0x0004)
	int                                                ChannelID;                                                // 0x0004(0x0004)
	struct FString                                     IP;                                                       // 0x0008(0x000C) (NeedCtorLink)
	int                                                Port;                                                     // 0x0014(0x0004)
	int                                                DataPort;                                                 // 0x0018(0x0004)
};

// Struct GUIWarfare.BTPageServerSelection.CheckToReceivedPacket
// 0x0004
struct FCheckToReceivedPacket
{
	unsigned long                                      bItemListEnd : 1;                                         // 0x0000(0x0004)
	unsigned long                                      bSkillListEnd : 1;                                        // 0x0000(0x0004)
	unsigned long                                      bQSListEnd : 1;                                           // 0x0000(0x0004)
	unsigned long                                      bServerTimeEnd : 1;                                       // 0x0000(0x0004)
	unsigned long                                      bGetMyMailBoxState : 1;                                   // 0x0000(0x0004)
	unsigned long                                      bGetServerTimeEnd : 1;                                    // 0x0000(0x0004)
	unsigned long                                      bHashEnd : 1;                                             // 0x0000(0x0004)
};

// Struct GUIWarfare.BTPageAuction.SearchAuctionItem
// 0x0028
struct FSearchAuctionItem
{
	unsigned long                                      bLock : 1;                                                // 0x0000(0x0004)
	int                                                Section;                                                  // 0x0004(0x0004)
	struct FString                                     Keyword;                                                  // 0x0008(0x000C) (NeedCtorLink)
	int                                                ItemRank;                                                 // 0x0014(0x0004)
	unsigned char                                      ItemClassify;                                             // 0x0018(0x0001)
	unsigned char                                      IsAvailable;                                              // 0x0019(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x001A(0x0002) MISSED OFFSET
	int                                                CurrentPageNum;                                           // 0x001C(0x0004)
	int                                                PagePerCount;                                             // 0x0020(0x0004)
	int                                                SortType;                                                 // 0x0024(0x0004)
};

// Struct GUIWarfare.BTPageMail.ReceiveMode
// 0x0010
struct FReceiveMode
{
	unsigned long                                      bLock : 1;                                                // 0x0000(0x0004)
	int                                                RequestMailType;                                          // 0x0004(0x0004)
	int                                                RequestItemType;                                          // 0x0008(0x0004)
	int                                                TotalCount;                                               // 0x000C(0x0004)
};

// Struct GUIWarfare.BTWindowItemExpiredHK.BuyExpriedCashInfo
// 0x000C
struct FBuyExpriedCashInfo
{
	TArray<int>                                        CashElements;                                             // 0x0000(0x000C) (NeedCtorLink)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
