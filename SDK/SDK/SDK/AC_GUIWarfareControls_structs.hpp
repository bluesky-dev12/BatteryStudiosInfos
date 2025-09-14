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

#define CONST_CClick                                             3
#define CONST_LabelHeight                                         32
#define CONST_GroupOffsetY                                        38
#define CONST_CSelect                                            5
#define CONST_CDisable                                           4
#define CONST_CFocused                                           2
#define CONST_C_DefaultfontSize                                  10
#define CONST_CMouseOn                                           1
#define CONST_CNormal                                            0
#define CONST_BtnCount                                            9
#define CONST_C_MaxRowCount                                      100
#define CONST_PAINTING_BTN_COUNT                                 5
#define CONST_BTN_COUNT_SUB                                      5
#define CONST_BTN_COUNT_MAIN                                     5
#define CONST_ColumnCount                                         4
#define CONST_WindowBtnHeight                                     33
#define CONST_LineOffsetY                                         13
#define CONST_LineOffsetX                                         10
#define CONST_LabelWidth                                          80
#define CONST_ButtonHeight                                        32
#define CONST_ButtonWidth                                         128
#define CONST_HorzCount                                           5
#define CONST_BTWindowCapsuleGet_BLACKBOX_KEY_ITEMID              17701
#define CONST_MaxItemCount                                        10
#define CONST_BTTPLuckyBlackBox_BLACKBOX_KEY_ITEMID               17701
#define CONST_FontSize                                            9
#define CONST_IcnSize                                            32

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum GUIWarfareControls.BTAutoColumnListHeaderHK.AutoColumnType
enum class EAutoColumnType : uint8_t
{
	E_ACT_STRING                   = 0,
	E_ACT_INT                      = 1,
	E_ACT_FLOAT                    = 2,
	E_ACT_INT_TO_STRING            = 3,
	E_ACT_FLOAT_TO_STRING          = 4,
	E_ACT_INT_TO_IMAGE             = 5,
	E_ACT_FLOAT_TO_IMAGE           = 6,
	E_ACT_CUSTOM                   = 7
};


// Enum GUIWarfareControls.BTTPMessengerHK.E_TAB_MENU_TYPE
enum class EBTTPMessengerHK_E_TAB_MENU_TYPE : uint8_t
{
	TAB_MENU_CONNECTED             = 0,
	TAB_MENU_FRIEND                = 1,
	TAB_MENU_CLAN                  = 2,
	TAB_MENU_PCBANG                = 3,
	TAB_MENU_MAX_COUNT             = 4
};


// Enum GUIWarfareControls.BTContextMenuHK.ContextMenuState
enum class EContextMenuState : uint8_t
{
	E_CM_NORMAL                    = 0,
	E_CM_DISABLE                   = 1
};


// Enum GUIWarfareControls.BTTPTopMenuHK.HEADERBUTTON_TYPE
enum class EHEADERBUTTON_TYPE : uint8_t
{
	HB_TYPE_POSTBOX                = 0,
	HB_TYPE_SHOP                   = 1,
	HB_TYPE_INVENTORY              = 2,
	HB_TYPE_CLAN                   = 3,
	HB_TYPE_OPTION                 = 4,
	HB_TYPE_GOBACK                 = 5,
	HB_TYPE_QUEST                  = 6,
	HB_TYPE_EXIT                   = 7,
	HB_TYPE_LUCKY                  = 8
};


// Enum GUIWarfareControls.BTROItemBoxHK.EInvenState
enum class EBTROItemBoxHK_EInvenState : uint8_t
{
	E_IB_INVEN                     = 0,
	E_IB_INVEN_BIG                 = 1,
	E_IB_REPAIR                    = 2,
	E_IB_WAREHOUSE                 = 3,
	E_IB_WAREHOUSE_CASH            = 4,
	E_IB_WAREHOUSE_SKILL           = 5,
	E_IB_SHOP                      = 6,
	E_IB_SHOP_BIG                  = 7,
	E_IB_AUCTION                   = 8,
	E_IB_AUCTION_BIG               = 9,
	E_IB_MAIL                      = 10,
	E_IB_POINTBOX                  = 11,
	E_IB_ITEMBOX                   = 12,
	E_IB_PROMOTION                 = 13,
	E_IB_DURABILITY_WARNING        = 14,
	E_IB_EXPIRED_WARNING           = 15,
	E_IB_SHOP_CASH                 = 16,
	E_IB_SHOP_BIG_CASH             = 17,
	E_IB_SHOP_BUY_TERM             = 18,
	E_IB_EQUIP_ITEM                = 19,
	E_IB_REMODEL_SHOP              = 20,
	E_IB_REMODEL_INVEN             = 21,
	E_IB_CAPSULE_INCLUDE           = 22,
	E_IB_CAPSULE                   = 23,
	E_IB_QUICKSLOT                 = 24
};


// Enum GUIWarfareControls.BTCheckBoxHK.CheckBoxStyle
enum class ECheckBoxStyle : uint8_t
{
	E_CB_Left                      = 0,
	E_CB_Right                     = 1
};


// Enum GUIWarfareControls.BTItemListMenuBtn.MenuType
enum class EMenuType : uint8_t
{
	MT_REPAIR                      = 0,
	MT_MODIFY                      = 1,
	MT_SELL                        = 2,
	MT_GIFT                        = 3,
	MT_PURCHASE                    = 4,
	MT_COAST                       = 5,
	MT_EXTEND                      = 6,
	MT_PCOIN                       = 7,
	MT_CCOIN                       = 8,
	MT_POINT                       = 9,
	MT_NONE                        = 10
};


// Enum GUIWarfareControls.BTTPCWMessengerHK.E_TAB_MENU_TYPE
enum class EBTTPCWMessengerHK_E_TAB_MENU_TYPE : uint8_t
{
	TAB_MENU_CONNECTED             = 0,
	TAB_MENU_FRIEND                = 1,
	TAB_MENU_CLAN                  = 2,
	TAB_MENU_PCBANG                = 3,
	TAB_MENU_MAX_COUNT             = 4
};


// Enum GUIWarfareControls.BTScrollProcess.E_NEXTANIMATION_ACTION
enum class E_NEXTANIMATION_ACTION : uint8_t
{
	E_NA_NONE                      = 0,
	E_NA_SET_RIGHT                 = 1,
	E_NA_SET_ORIGIN                = 2
};


// Enum GUIWarfareControls.BTScrollProcess.E_SCROLL_MOVE_TYPE
enum class E_SCROLL_MOVE_TYPE : uint8_t
{
	E_SMT_SCROLL_X1_LEFT           = 0,
	E_SMT_SCROLL_X2_LEFT           = 1,
	E_SMT_SCROLL_X1_RIGHT          = 2,
	E_SMT_HOLD                     = 3
};


// Enum GUIWarfareControls.BTScrollProcess.E_SCROLL_CHECKEND_TYPE
enum class E_SCROLL_CHECKEND_TYPE : uint8_t
{
	E_SCT_TIME                     = 0,
	E_SCT_X1_ONLEFT                = 1,
	E_SCT_X2_ONLEFT                = 2,
	E_SCT_WIDTH_LESSVALUE          = 3,
	E_SCT_WIDTH_MOREVALUE          = 4
};


// Enum GUIWarfareControls.BTROAniItemBoxHK.EInvenState
enum class EBTROAniItemBoxHK_EInvenState : uint8_t
{
	E_IB_INVEN                     = 0,
	E_IB_INVEN_BIG                 = 1,
	E_IB_REPAIR                    = 2,
	E_IB_WAREHOUSE                 = 3,
	E_IB_WAREHOUSE_SKILL           = 4,
	E_IB_SHOP                      = 5,
	E_IB_SHOP_BIG                  = 6,
	E_IB_AUCTION                   = 7,
	E_IB_AUCTION_BIG               = 8,
	E_IB_MAIL                      = 9,
	E_IB_POINTBOX                  = 10,
	E_IB_ITEMBOX                   = 11,
	E_IB_PROMOTION                 = 12,
	E_IB_DURABILITY_WARNING        = 13,
	E_IB_EXPIRED_WARNING           = 14
};


// Enum GUIWarfareControls.BTROAniItemBoxHK.E_ANI_END_TYPE
enum class E_ANI_END_TYPE : uint8_t
{
	EAET_NORMAL                    = 0,
	EAET_TOP_REVERT                = 1,
	EAET_TOP_NORMAL                = 2,
	EAET_BOTTOM_REVERT             = 3,
	EAET_BOTTOM_NORMAL             = 4
};


// Enum GUIWarfareControls.BTIconButtonHK.IconHorzOrder
enum class EIconHorzOrder : uint8_t
{
	E_ICON_LEFT                    = 0,
	E_ICON_RIGHT                   = 1
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct GUIWarfareControls.BTWindowAutoResizeHK.StringAndFontSize
// 0x0014
struct FStringAndFontSize
{
	struct FString                                     Text;                                                     // 0x0000(0x000C) (NeedCtorLink)
	int                                                FontSize;                                                 // 0x000C(0x0004)
	struct FColor                                      FontColor;                                                // 0x0010(0x0004)
};

// Struct GUIWarfareControls.BTEditBoxHK.SelectionArea
// 0x0008
struct UBTEditBoxHK_FSelectionArea
{
	int                                                StartPos;                                                 // 0x0000(0x0004) (Edit)
	int                                                EndPos;                                                   // 0x0004(0x0004) (Edit)
};

// Struct GUIWarfareControls.BTTPChatHK.ColoredChatText
// 0x0014
struct FColoredChatText
{
	int                                                ChatPanel;                                                // 0x0000(0x0004)
	struct FColor                                      ChatColor;                                                // 0x0004(0x0004)
	struct FString                                     chatText;                                                 // 0x0008(0x000C) (NeedCtorLink)
};

// Struct GUIWarfareControls.BTMultiLineEditBoxHK.SelectionArea
// 0x0008
struct UBTMultiLineEditBoxHK_FSelectionArea
{
	int                                                StartPos;                                                 // 0x0000(0x0004) (Edit)
	int                                                EndPos;                                                   // 0x0004(0x0004) (Edit)
};

// Struct GUIWarfareControls.BTAutoColumnListDataHK.ACLData
// 0x00AC
struct FACLData
{
	struct FString                                     strValue;                                                 // 0x0000(0x000C) (Edit, NeedCtorLink)
	int                                                IntValue;                                                 // 0x000C(0x0004) (Edit)
	int                                                tempValue;                                                // 0x0010(0x0004) (Edit)
	float                                              floatValue;                                               // 0x0014(0x0004) (Edit)
	struct FImage                                      Image;                                                    // 0x0018(0x0020) (Edit)
	struct FText                                       Text[0x3];                                                // 0x0038(0x001C) (Edit, NeedCtorLink)
	struct FImage                                      ServerGroupImg;                                           // 0x008C(0x0020) (Edit)
};

// Struct GUIWarfareControls.BTAutoColumnListHK.SaveListPos
// 0x0020
struct FSaveListPos
{
	int                                                Top;                                                      // 0x0000(0x0004)
	int                                                Index;                                                    // 0x0004(0x0004)
	int                                                LastSelected;                                             // 0x0008(0x0004)
	int                                                selectIndex;                                              // 0x000C(0x0004)
	int                                                SelectIndexX;                                             // 0x0010(0x0004)
	int                                                SelectIndexY;                                             // 0x0014(0x0004)
	int                                                LastSelectedIndex;                                        // 0x0018(0x0004)
	int                                                LastSelectedIndexHistory;                                 // 0x001C(0x0004)
};

// Struct GUIWarfareControls.BTACLTeamMemberListHK.StrInt_Struct
// 0x0010
struct FStrInt_Struct
{
	struct FString                                     strValue;                                                 // 0x0000(0x000C) (NeedCtorLink)
	int                                                IntValue;                                                 // 0x000C(0x0004)
};

// Struct GUIWarfareControls.BTTPOptionGraphicAdvanceHK.OptionGraphicAdvanceInfo
// 0x0028
struct FOptionGraphicAdvanceInfo
{
	int                                                TextureQuality;                                           // 0x0000(0x0004)
	int                                                BackgroundQuality;                                        // 0x0004(0x0004)
	int                                                LOD;                                                      // 0x0008(0x0004)
	int                                                CharacterShadow;                                          // 0x000C(0x0004)
	unsigned long                                      bVSync : 1;                                               // 0x0010(0x0004)
	unsigned long                                      bShader : 1;                                              // 0x0010(0x0004)
	unsigned long                                      bShadows : 1;                                             // 0x0010(0x0004)
	unsigned long                                      bReflectionMap : 1;                                       // 0x0010(0x0004)
	unsigned long                                      bHDR : 1;                                                 // 0x0010(0x0004)
	unsigned long                                      bDOF : 1;                                                 // 0x0010(0x0004)
	unsigned long                                      bGlow : 1;                                                // 0x0010(0x0004)
	unsigned long                                      bDynamicLighting : 1;                                     // 0x0010(0x0004)
	unsigned long                                      bCorona : 1;                                              // 0x0010(0x0004)
	unsigned long                                      bBlood : 1;                                               // 0x0010(0x0004)
	unsigned long                                      bDecal : 1;                                               // 0x0010(0x0004)
	int                                                DecalStayScale;                                           // 0x0014(0x0004)
	int                                                PhysicEffect;                                             // 0x0018(0x0004)
	unsigned long                                      bRagDoll : 1;                                             // 0x001C(0x0004)
	int                                                Antialiasing;                                             // 0x0020(0x0004)
	int                                                LevelOfAnisotropy;                                        // 0x0024(0x0004)
};

// Struct GUIWarfareControls.BTWindowRoomInfoHK.UIRoomInfoStruct
// 0x0050
struct FUIRoomInfoStruct
{
	struct FString                                     RoomName;                                                 // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     RoomPassword;                                             // 0x000C(0x000C) (NeedCtorLink)
	struct FString                                     MapName;                                                  // 0x0018(0x000C) (NeedCtorLink)
	int                                                GameMode;                                                 // 0x0024(0x0004)
	int                                                TimeLimit;                                                // 0x0028(0x0004)
	int                                                Score;                                                    // 0x002C(0x0004)
	int                                                UserCount;                                                // 0x0030(0x0004)
	int                                                WeaponLimit;                                              // 0x0034(0x0004)
	unsigned long                                      bTeamBalance : 1;                                         // 0x0038(0x0004)
	unsigned long                                      bMultiBomb : 1;                                           // 0x0038(0x0004)
	unsigned long                                      bPlayWithBots : 1;                                        // 0x0038(0x0004)
	int                                                BotUserTeam;                                              // 0x003C(0x0004)
	int                                                BotNum0;                                                  // 0x0040(0x0004)
	int                                                BotNum1;                                                  // 0x0044(0x0004)
	int                                                BotDifficulty;                                            // 0x0048(0x0004)
	unsigned long                                      bResPawnType : 1;                                         // 0x004C(0x0004)
};

// Struct GUIWarfareControls.BTACLServerSelectionHK.ChannelInfo
// 0x004C
struct FChannelInfo
{
	float                                              ChannelOption[0x13];                                      // 0x0000(0x0004)
};

// Struct GUIWarfareControls.BTTPInventoryQuickSlotHK.SaveQuickSlot
// 0x0048
struct FSaveQuickSlot
{
	class UwItemBoxHK*                                 ItemInfo[0x9];                                            // 0x0000(0x0004)
	class UwItemBoxInstanceHK*                         instanceInfo[0x9];                                        // 0x0024(0x0004)
};

// Struct GUIWarfareControls.BTTPAuctionBuyingHK.ReqAuctionList
// 0x000C
struct UBTTPAuctionBuyingHK_FReqAuctionList
{
	unsigned long                                      bLock : 1;                                                // 0x0000(0x0004)
	unsigned long                                      bHave : 1;                                                // 0x0000(0x0004)
	int                                                SaveTab[0x2];                                             // 0x0004(0x0004)
};

// Struct GUIWarfareControls.BTTPAuctionMyAuctionHK.ReqAuctionList
// 0x000C
struct UBTTPAuctionMyAuctionHK_FReqAuctionList
{
	unsigned long                                      bLock : 1;                                                // 0x0000(0x0004)
	unsigned long                                      bHave : 1;                                                // 0x0000(0x0004)
	int                                                SaveTab[0x2];                                             // 0x0004(0x0004)
};

// Struct GUIWarfareControls.BTPageListButtonHK.PageBox
// 0x0014
struct FPageBox
{
	int                                                BeginIndex;                                               // 0x0000(0x0004)
	int                                                EndIndex;                                                 // 0x0004(0x0004)
	int                                                MaxIndex;                                                 // 0x0008(0x0004)
	int                                                ListPerPageCount;                                         // 0x000C(0x0004)
	int                                                CurrentIndex;                                             // 0x0010(0x0004)
};

// Struct GUIWarfareControls.BTTPOptionGraphicHK.DisplayModeInfo
// 0x0018
struct FDisplayModeInfo
{
	int                                                width;                                                    // 0x0000(0x0004)
	int                                                Height;                                                   // 0x0004(0x0004)
	int                                                SupportComboIdx;                                          // 0x0008(0x0004)
	int                                                GraphicQuality;                                           // 0x000C(0x0004)
	unsigned long                                      UseGore : 1;                                              // 0x0010(0x0004)
	int                                                Brightness;                                               // 0x0014(0x0004)
};

// Struct GUIWarfareControls.BTTPOptionSoundHK.OptionSoundInfo
// 0x0010
struct FOptionSoundInfo
{
	unsigned long                                      bSound : 1;                                               // 0x0000(0x0004)
	unsigned long                                      bMusic : 1;                                               // 0x0000(0x0004)
	int                                                SoundVolume;                                              // 0x0004(0x0004)
	int                                                MusicVolume;                                              // 0x0008(0x0004)
	unsigned long                                      bEAXSound : 1;                                            // 0x000C(0x0004)
};

// Struct GUIWarfareControls.BTTPOptionInputHK.OptionInputInfo
// 0x01B0
struct FOptionInputInfo
{
	float                                              MouseSensibility;                                         // 0x0000(0x0004)
	float                                              MouseSensibilityAim;                                      // 0x0004(0x0004)
	unsigned long                                      bMouseInvert : 1;                                         // 0x0008(0x0004)
	unsigned long                                      bMouseAccel : 1;                                          // 0x0008(0x0004)
	unsigned long                                      bMouseRevision : 1;                                       // 0x0008(0x0004)
	unsigned long                                      bStanceToggle : 1;                                        // 0x0008(0x0004)
	unsigned long                                      bUseAdvCamShake : 1;                                      // 0x0008(0x0004)
	unsigned long                                      bUseInverseWeapon : 1;                                    // 0x0008(0x0004)
	struct FString                                     StoreKey[0x23];                                           // 0x000C(0x000C) (NeedCtorLink)
};

// Struct GUIWarfareControls.BTTPOptionInputHK.InputKeyInfo
// 0x0028
struct FInputKeyInfo
{
	int                                                KeyNumber;                                                // 0x0000(0x0004)
	struct FString                                     KeyName;                                                  // 0x0004(0x000C) (NeedCtorLink)
	struct FString                                     LocalizedKeyName;                                         // 0x0010(0x000C) (NeedCtorLink)
	struct FString                                     Alias;                                                    // 0x001C(0x000C) (NeedCtorLink)
};

// Struct GUIWarfareControls.BTTPOptionETCHK.ETCModeInfo
// 0x0020
struct FETCModeInfo
{
	int                                                nVoiceIndex;                                              // 0x0000(0x0004)
	struct FString                                     strVoiceLang;                                             // 0x0004(0x000C) (NeedCtorLink)
	int                                                iMinimapMode;                                             // 0x0010(0x0004)
	int                                                iRecordResolution;                                        // 0x0014(0x0004)
	int                                                iRecordQuality;                                           // 0x0018(0x0004)
	unsigned long                                      bRecordEnable : 1;                                        // 0x001C(0x0004)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
