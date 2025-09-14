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

#define CONST_EXTEND_SKILLSLOT_ITEMID                             30202
#define CONST_CClick                                             3
#define CONST_LabelHeight                                         32
#define CONST_GroupOffsetY                                        38
#define CONST_CSelect                                            5
#define CONST_CDisable                                           4
#define CONST_CFocused                                           2
#define CONST_C_DefaultfontSize                                  10
#define CONST_BTTPUserDetailInfoNew_LABEL_COUNT                   11
#define CONST_CMouseOn                                           1
#define CONST_BTTPUserClanInfo_LABEL_COUNT                        11
#define CONST_CNormal                                            0
#define CONST_BtnCount                                            9
#define CONST_TOTAL_EFFECT_TIME                                   2
#define CONST_C_MaxRowCount                                      100
#define CONST_PAINTING_BTN_COUNT                                 5
#define CONST_BTTPLuckyBlackBox_BLACKBOX_KEY_ITEMID               17701
#define CONST_MaxItemCount                                        10
#define CONST_EXTEND_QUICKSLOT_ITEMID                             30200
#define CONST_SKILLSLOT_COUNT                                     4
#define CONST_WEAPONSLOT_COUNT                                    5
#define CONST_ITEMSLOT_COUNT                                      9
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


// Enum GUIWarfareControls.BTContextMenuHK.ContextMenuState
enum class EContextMenuState : uint8_t
{
	E_CM_NORMAL                    = 0,
	E_CM_DISABLE                   = 1
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


// Enum GUIWarfareControls.BTTPUserClanInfo.E_CLANEDIT
enum class E_CLANEDIT : uint8_t
{
	ECE_NAME                       = 0,
	ECE_LEVEL                      = 1,
	ECE_PERSON_GRADE               = 2,
	ECE_PERSON_ACTIVITY            = 3,
	ECE_PERSON_MONTH_CONNECT_COUNT = 4,
	ECE_PERSON_SCORE               = 5,
	ECE_CLAN_SCORE                 = 6,
	ECE_CLAN_RANK                  = 7,
	ECE_CLAN_MONTH_RANK            = 8,
	ECE_CLAN_MONTH_CONNECT_RANK    = 9,
	ECE_CLAN_INTRODUCTION          = 10
};


// Enum GUIWarfareControls.BTTPUserDetailInfoNew.E_EDIT
enum class E_EDIT : uint8_t
{
	EE_NICKNAME                    = 0,
	EE_EXP                         = 1,
	EE_CASH                        = 2,
	EE_POINT                       = 3,
	EE_RANKING                     = 4,
	EE_SCORE                       = 5,
	EE_KILLDEATH                   = 6,
	EE_AIMKILL                     = 7,
	EE_HEADSHOT                    = 8,
	EE_TOTALPLAYTIME               = 9,
	EE_DISCONNECT                  = 10
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


// Enum GUIWarfareControls.BTTPInventoryQuickSlotHK.E_ITEMSLOT
enum class E_ITEMSLOT : uint8_t
{
	EIS_MAIN_WEAPON                = 0,
	EIS_SUB_WEAPON                 = 1,
	EIS_THROW_WEAPON_1             = 2,
	EIS_THROW_WEAPON_2             = 3,
	EIS_MELEE_WEAPON               = 4,
	EIS_ACTIVE_SKILL               = 5,
	EIS_PASSIVE_SKILL_1            = 6,
	EIS_PASSIVE_SKILL_2            = 7,
	EIS_PASSIVE_SKILL_3            = 8
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
	string                                             Text;                                                     // 0x0000(0x000C) (NeedCtorLink)
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

// Struct GUIWarfareControls.BTMultiLineEditBoxHK.SelectionArea
// 0x0008
struct UBTMultiLineEditBoxHK_FSelectionArea
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
	string                                             chatText;                                                 // 0x0008(0x000C) (NeedCtorLink)
};

// Struct GUIWarfareControls.BTAutoColumnListDataHK.ACLData
// 0x00AC
struct FACLData
{
	string                                             strValue;                                                 // 0x0000(0x000C) (Edit, NeedCtorLink)
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
	string                                             strValue;                                                 // 0x0000(0x000C) (NeedCtorLink)
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
	bool                                               bCorona;                                                  // 0x0010(0x0004)
	bool                                               bBlood;                                                   // 0x0010(0x0004)
	bool                                               bDecal;                                                   // 0x0010(0x0004)
	bool                                               bVSync;                                                   // 0x0010(0x0004)
	bool                                               bShader;                                                  // 0x0010(0x0004)
	bool                                               bShadows;                                                 // 0x0010(0x0004)
	bool                                               bReflectionMap;                                           // 0x0010(0x0004)
	bool                                               bHDR;                                                     // 0x0010(0x0004)
	bool                                               bDOF;                                                     // 0x0010(0x0004)
	bool                                               bGlow;                                                    // 0x0010(0x0004)
	bool                                               bDynamicLighting;                                         // 0x0010(0x0004)
	int                                                DecalStayScale;                                           // 0x0014(0x0004)
	int                                                PhysicEffect;                                             // 0x0018(0x0004)
	bool                                               bRagDoll;                                                 // 0x001C(0x0004)
	int                                                Antialiasing;                                             // 0x0020(0x0004)
	int                                                LevelOfAnisotropy;                                        // 0x0024(0x0004)
};

// Struct GUIWarfareControls.BTWindowRoomInfoHK.UIRoomInfoStruct
// 0x0050
struct FUIRoomInfoStruct
{
	string                                             RoomName;                                                 // 0x0000(0x000C) (NeedCtorLink)
	string                                             RoomPassword;                                             // 0x000C(0x000C) (NeedCtorLink)
	string                                             MapName;                                                  // 0x0018(0x000C) (NeedCtorLink)
	int                                                GameMode;                                                 // 0x0024(0x0004)
	int                                                TimeLimit;                                                // 0x0028(0x0004)
	int                                                Score;                                                    // 0x002C(0x0004)
	int                                                UserCount;                                                // 0x0030(0x0004)
	int                                                WeaponLimit;                                              // 0x0034(0x0004)
	bool                                               bTeamBalance;                                             // 0x0038(0x0004)
	bool                                               bMultiBomb;                                               // 0x0038(0x0004)
	bool                                               bPlayWithBots;                                            // 0x0038(0x0004)
	int                                                BotUserTeam;                                              // 0x003C(0x0004)
	int                                                BotNum0;                                                  // 0x0040(0x0004)
	int                                                BotNum1;                                                  // 0x0044(0x0004)
	int                                                BotDifficulty;                                            // 0x0048(0x0004)
	bool                                               bResPawnType;                                             // 0x004C(0x0004)
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
	bool                                               bLock;                                                    // 0x0000(0x0004)
	bool                                               bHave;                                                    // 0x0000(0x0004)
	int                                                SaveTab[0x2];                                             // 0x0004(0x0004)
};

// Struct GUIWarfareControls.BTTPAuctionMyAuctionHK.ReqAuctionList
// 0x000C
struct UBTTPAuctionMyAuctionHK_FReqAuctionList
{
	bool                                               bLock;                                                    // 0x0000(0x0004)
	bool                                               bHave;                                                    // 0x0000(0x0004)
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
	bool                                               UseGore;                                                  // 0x0010(0x0004)
	int                                                Brightness;                                               // 0x0014(0x0004)
};

// Struct GUIWarfareControls.BTTPOptionSoundHK.OptionSoundInfo
// 0x0010
struct FOptionSoundInfo
{
	bool                                               bSound;                                                   // 0x0000(0x0004)
	bool                                               bMusic;                                                   // 0x0000(0x0004)
	int                                                SoundVolume;                                              // 0x0004(0x0004)
	int                                                MusicVolume;                                              // 0x0008(0x0004)
	bool                                               bEAXSound;                                                // 0x000C(0x0004)
};

// Struct GUIWarfareControls.BTTPOptionInputHK.OptionInputInfo
// 0x01B0
struct FOptionInputInfo
{
	float                                              MouseSensibility;                                         // 0x0000(0x0004)
	float                                              MouseSensibilityAim;                                      // 0x0004(0x0004)
	bool                                               bMouseInvert;                                             // 0x0008(0x0004)
	bool                                               bMouseAccel;                                              // 0x0008(0x0004)
	bool                                               bMouseRevision;                                           // 0x0008(0x0004)
	bool                                               bStanceToggle;                                            // 0x0008(0x0004)
	bool                                               bUseAdvCamShake;                                          // 0x0008(0x0004)
	bool                                               bUseInverseWeapon;                                        // 0x0008(0x0004)
	string                                             StoreKey[0x23];                                           // 0x000C(0x000C) (NeedCtorLink)
};

// Struct GUIWarfareControls.BTTPOptionInputHK.InputKeyInfo
// 0x0028
struct FInputKeyInfo
{
	int                                                KeyNumber;                                                // 0x0000(0x0004)
	string                                             KeyName;                                                  // 0x0004(0x000C) (NeedCtorLink)
	string                                             LocalizedKeyName;                                         // 0x0010(0x000C) (NeedCtorLink)
	string                                             Alias;                                                    // 0x001C(0x000C) (NeedCtorLink)
};

// Struct GUIWarfareControls.BTTPOptionETCHK.ETCModeInfo
// 0x0020
struct FETCModeInfo
{
	int                                                nVoiceIndex;                                              // 0x0000(0x0004)
	string                                             strVoiceLang;                                             // 0x0004(0x000C) (NeedCtorLink)
	int                                                iMinimapMode;                                             // 0x0010(0x0004)
	int                                                iRecordResolution;                                        // 0x0014(0x0004)
	int                                                iRecordQuality;                                           // 0x0018(0x0004)
	bool                                               bRecordEnable;                                            // 0x001C(0x0004)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
