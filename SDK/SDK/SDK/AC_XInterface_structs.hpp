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

#define CONST_DoCounter                                           1
#define CONST_QBTN_Abort                                         64
#define CONST_QBTN_OkCancel                                      3
#define CONST_MaxPlayers                                         32
#define CONST_QBTN_Retry                                         4
#define CONST_QBTN_YesNoCancel                                   50
#define CONST_QBTN_YesNo                                         48
#define CONST_QBTN_AbortRetry                                    68
#define CONST_QBTN_Cancel                                        2
#define CONST_QBTN_Ignore                                        128
#define CONST_QBTN_No                                            32
#define CONST_QBTN_Yes                                           16
#define CONST_QBTN_Continue                                      8
#define CONST_QBTN_Ok                                            1
#define CONST_Counter                                             0
#define CONST_WEAPON_BAR_SIZE                                     9
#define CONST_DefaultDFBotGrade                                  901

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum XInterface.GUIComponent.EClickSound
enum class EClickSound : uint8_t
{
	CS_None                        = 0,
	CS_Click                       = 1,
	CS_Edit                        = 2,
	CS_Up                          = 3,
	CS_Down                        = 4,
	CS_Drag                        = 5,
	CS_Fade                        = 6,
	CS_Hover                       = 7,
	CS_Slide                       = 8,
	CS_Weapon                      = 9
};


// Enum XInterface.GUI.eFontScale
enum class EeFontScale : uint8_t
{
	FNS_Small                      = 0,
	FNS_Medium                     = 1,
	FNS_Large                      = 2
};


// Enum XInterface.GUI.EAnimationType
enum class EAnimationType : uint8_t
{
	AT_Position                    = 0,
	AT_Dimension                   = 1
};


// Enum XInterface.GUI.EOrientation
enum class EOrientation : uint8_t
{
	ORIENT_Vertical                = 0,
	ORIENT_Horizontal              = 1
};


// Enum XInterface.GUI.eCellStyle
enum class EeCellStyle : uint8_t
{
	CELL_FixedSize                 = 0,
	CELL_FixedCount                = 1
};


// Enum XInterface.GUI.eDrawDirection
enum class EeDrawDirection : uint8_t
{
	DRD_LeftToRight                = 0,
	DRD_RightToLeft                = 1,
	DRD_TopToBottom                = 2,
	DRD_BottomToTop                = 3
};


// Enum XInterface.GUI.ePageAlign
enum class EePageAlign : uint8_t
{
	PGA_None                       = 0,
	PGA_Client                     = 1,
	PGA_Left                       = 2,
	PGA_Right                      = 3,
	PGA_Top                        = 4,
	PGA_Bottom                     = 5
};


// Enum XInterface.GUI.eIconPosition
enum class EeIconPosition : uint8_t
{
	ICP_Normal                     = 0,
	ICP_Center                     = 1,
	ICP_Scaled                     = 2,
	ICP_Stretched                  = 3,
	ICP_Bound                      = 4
};


// Enum XInterface.GUI.EMenuRenderStyle
enum class EMenuRenderStyle : uint8_t
{
	MSTY_None                      = 0,
	MSTY_Normal                    = 1,
	MSTY_Masked                    = 2,
	MSTY_Translucent               = 3,
	MSTY_Modulated                 = 4,
	MSTY_Alpha                     = 5,
	MSTY_Additive                  = 6,
	MSTY_Subtractive               = 7,
	MSTY_Particle                  = 8,
	MSTY_AlphaZ                    = 9
};


// Enum XInterface.GUI.eEditMask
enum class EeEditMask : uint8_t
{
	EDM_None                       = 0,
	EDM_Alpha                      = 1,
	EDM_Numeric                    = 2
};


// Enum XInterface.GUI.eImgAlign
enum class EeImgAlign : uint8_t
{
	IMGA_TopLeft                   = 0,
	IMGA_Center                    = 1,
	IMGA_BottomRight               = 2
};


// Enum XInterface.GUI.eImgStyle
enum class EeImgStyle : uint8_t
{
	ISTY_Normal                    = 0,
	ISTY_Stretched                 = 1,
	ISTY_Scaled                    = 2,
	ISTY_Bound                     = 3,
	ISTY_Justified                 = 4,
	ISTY_PartialScaled             = 5,
	ISTY_Tiled                     = 6,
	ISTY_CropStretched             = 7
};


// Enum XInterface.GUI.eTextCase
enum class EeTextCase : uint8_t
{
	TXTC_None                      = 0,
	TXTC_Upper                     = 1,
	TXTC_Lower                     = 2
};


// Enum XInterface.GUI.eTextAlign
enum class EeTextAlign : uint8_t
{
	TXTA_Left                      = 0,
	TXTA_Center                    = 1,
	TXTA_Right                     = 2
};


// Enum XInterface.GUI.eDropState
enum class EeDropState : uint8_t
{
	DRP_None                       = 0,
	DRP_Source                     = 1,
	DRP_Target                     = 2,
	DRP_Accept                     = 3,
	DRP_Reject                     = 4
};


// Enum XInterface.GUI.eMenuState
enum class EeMenuState : uint8_t
{
	MSAT_Blurry                    = 0,
	MSAT_Watched                   = 1,
	MSAT_Focused                   = 2,
	MSAT_Pressed                   = 3,
	MSAT_Disabled                  = 4
};


// Enum XInterface.GUIComponent.EParentScaleType
enum class EParentScaleType : uint8_t
{
	SCALE_All                      = 0,
	SCALE_X                        = 1,
	SCALE_Y                        = 2
};


// Enum XInterface.ExtendedConsole.ESpeechMenuState
enum class ESpeechMenuState : uint8_t
{
	SMS_Main                       = 0,
	SMS_VoiceChat                  = 1,
	SMS_Ack                        = 2,
	SMS_FriendFire                 = 3,
	SMS_Order                      = 4,
	SMS_Other                      = 5,
	SMS_Taunt                      = 6,
	SMS_TauntAnim                  = 7,
	SMS_PlayerSelect               = 8,
	SMS_VoiceChatChannel           = 9
};


// Enum XInterface.HudBase.eHUDSOUND
enum class EeHUDSOUND : uint8_t
{
	EHS_QUICKSLOT_TOGGLE           = 0,
	EHS_QUICKSLOT_CHANGE           = 1,
	EHS_MINIMAP_TOGGLE             = 2,
	EHS_QUEST_STATE                = 3,
	EHS_QUEST_COMPLETE             = 4,
	EHS_FRIENDS_ON                 = 5,
	EHS_WHISPER                    = 6
};


// Enum XInterface.wHudPart_DisplayBase.eKeyAlphabet
enum class EeKeyAlphabet : uint8_t
{
	EKA_A                          = 0,
	EKA_B                          = 1,
	EKA_C                          = 2,
	EKA_D                          = 3,
	EKA_E                          = 4,
	EKA_F                          = 5,
	EKA_G                          = 6,
	EKA_H                          = 7,
	EKA_I                          = 8,
	EKA_J                          = 9,
	EKA_K                          = 10,
	EKA_L                          = 11,
	EKA_M                          = 12,
	EKA_N                          = 13,
	EKA_O                          = 14,
	EKA_P                          = 15,
	EKA_Q                          = 16,
	EKA_R                          = 17,
	EKA_S                          = 18,
	EKA_T                          = 19,
	EKA_U                          = 20,
	EKA_V                          = 21,
	EKA_W                          = 22,
	EKA_X                          = 23,
	EKA_Y                          = 24,
	EKA_Z                          = 25
};


// Enum XInterface.wHudPart_DisplayBase.eKeySpecial
enum class EeKeySpecial : uint8_t
{
	EKS_SHIFT                      = 0,
	EKS_ALT                        = 1,
	EKS_CTRL                       = 2,
	EKS_SPACE                      = 3,
	EKS_LMOUSE                     = 4,
	EKS_RMOUSE                     = 5,
	EKS_WMOUSE                     = 6
};


// Enum XInterface.wHudPart_DisplayEvent.eDrawMessageState
enum class EeDrawMessageState : uint8_t
{
	DM_None                        = 0,
	DM_Waiting                     = 1,
	DM_GameMode                    = 2,
	DM_Go                          = 3,
	DM_HostChange                  = 4,
	DM_End                         = 5
};


// Enum XInterface.wHudPart_DisplayEvent.SKILL_ARRAY
enum class ESKILL_ARRAY : uint8_t
{
	SKILL_ARRAY_C4                 = 0,
	SKILL_ARRAY_RPG7               = 1,
	SKILL_ARRAY_HELICOPTER         = 2,
	SKILL_ARRAY_AIRSTIRKE          = 3,
	SKILL_ARRAY_UAV                = 4,
	SKILL_ARRAY_HELICOPTER_REQUIRE = 5,
	SKILL_ARRAY_AIRSTIRKE_REQUIRE  = 6,
	SKILL_ARRAY_UAV_REQUIRE        = 7,
	SKILL_ARRAY_HellFire           = 8,
	SKILL_ARRAY_HellFire_Require   = 9,
	SKILL_ARRAY_PinpointFire       = 10,
	SKILL_ARRAY_PinpointFire_Require = 11,
	SKILL_ARRAY_Incen              = 12,
	SKILL_ARRAY_Incen_Require      = 13,
	SKILL_ARRAY_SpiltGrenade       = 14,
	SKILL_ARRAY_SpiltGrenade_Require = 15,
	SKILL_ARRAY_ActiveCommon       = 16,
	SKILL_ARRAY_SENTRYGUN          = 17,
	SKILL_ARRAY_SENTRYGUN_REQUIRE  = 18,
	SKILL_ARRAY_NONE               = 19
};


// Enum XInterface.wHudPart_DisplayEvent.ESD_STATE
enum class ESD_STATE : uint8_t
{
	SET_ENABLE                     = 0,
	SET_DOING                      = 1,
	SET_DONE                       = 2,
	DIFFUSE_ENABLE                 = 3,
	DIFFUSE_DOING                  = 4,
	DIFFUSE_DONE                   = 5
};


// Enum XInterface.xScoreBoardTeamGame.GOAL_SCORE
enum class EGOAL_SCORE : uint8_t
{
	GOAL_100                       = 0
};


// Enum XInterface.xScoreBoardTeamGame.SBGT
enum class ESBGT : uint8_t
{
	GT_TD                          = 0,
	GT_DOMI                        = 1,
	GT_SD                          = 2
};


// Enum XInterface.wHudPart_RadioMessage.ERMType
enum class ERMType : uint8_t
{
	ERMT_SELLECT                   = 0,
	ERMT_COMMAND                   = 1,
	ERMT_STATEMENT                 = 2,
	ERMT_RESPON                    = 3,
	ERMT_NONE                      = 4
};


// Enum XInterface.GUIScrollText.eScrollState
enum class EeScrollState : uint8_t
{
	STS_None                       = 0,
	STS_Initial                    = 1,
	STS_Char                       = 2,
	STS_EOL                        = 3,
	STS_Repeat                     = 4
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct XInterface.GUIComponent.TimerData
// 0x0010
struct FTimerData
{
	unsigned long                                      bLoop : 1;                                                // 0x0000(0x0004)
	struct FName                                       FuncName;                                                 // 0x0004(0x0004)
	float                                              Rate;                                                     // 0x0008(0x0004)
	float                                              Count;                                                    // 0x000C(0x0004)
};

// Struct XInterface.GUIController.eOwnageMap
// 0x0028
struct FeOwnageMap
{
	int                                                RLevel;                                                   // 0x0000(0x0004)
	struct FString                                     MapName;                                                  // 0x0004(0x000C) (NeedCtorLink)
	struct FString                                     MapDesc;                                                  // 0x0010(0x000C) (NeedCtorLink)
	struct FString                                     MapURL;                                                   // 0x001C(0x000C) (NeedCtorLink)
};

// Struct XInterface.GUIController.ProfileStruct
// 0x0010
struct FProfileStruct
{
	struct FString                                     ProfileName;                                              // 0x0000(0x000C) (NeedCtorLink)
	float                                              ProfileSeconds;                                           // 0x000C(0x0004)
};

// Struct XInterface.GUIController.AutoLoadMenu
// 0x0010
struct FAutoLoadMenu
{
	struct FString                                     MenuClassName;                                            // 0x0000(0x000C) (NeedCtorLink)
	unsigned long                                      bPreInitialize : 1;                                       // 0x000C(0x0004)
};

// Struct XInterface.GUIController.RestoreMenuItem
// 0x0024
struct FRestoreMenuItem
{
	struct FString                                     MenuClassName;                                            // 0x0000(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Param1;                                                   // 0x000C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Param2;                                                   // 0x0018(0x000C) (Edit, NeedCtorLink)
};

// Struct XInterface.GUIController.DesignModeHint
// 0x0018
struct FDesignModeHint
{
	struct FString                                     key;                                                      // 0x0000(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Description;                                              // 0x000C(0x000C) (Edit, Localized, NeedCtorLink)
};

// Struct XInterface.GUIButton.PaddingPercent
// 0x0008
struct FPaddingPercent
{
	float                                              HorzPerc;                                                 // 0x0000(0x0004) (Edit)
	float                                              VertPerc;                                                 // 0x0004(0x0004) (Edit)
};

// Struct XInterface.GUI.GUITabItem
// 0x0024
struct FGUITabItem
{
	struct FString                                     ClassName;                                                // 0x0000(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Caption;                                                  // 0x000C(0x000C) (Edit, Localized, NeedCtorLink)
	struct FString                                     Hint;                                                     // 0x0018(0x000C) (Edit, Localized, NeedCtorLink)
};

// Struct XInterface.GUIMultiColumnList.MultiColumnSortData
// 0x0010
struct FMultiColumnSortData
{
	struct FString                                     SortString;                                               // 0x0000(0x000C) (Edit, Const, EditConst, NeedCtorLink)
	int                                                SortItem;                                                 // 0x000C(0x0004) (Edit, Const, EditConst)
};

// Struct XInterface.GUI.ImageListElem
// 0x000C
struct FImageListElem
{
	int                                                Item;                                                     // 0x0000(0x0004)
	class UMaterial*                                   Image;                                                    // 0x0004(0x0004)
	int                                                Locked;                                                   // 0x0008(0x0004)
};

// Struct XInterface.GUI.GUIListElem
// 0x0020
struct FGUIListElem
{
	struct FString                                     Item;                                                     // 0x0000(0x000C) (NeedCtorLink)
	class UObject*                                     ExtraData;                                                // 0x000C(0x0004)
	struct FString                                     ExtraStrData;                                             // 0x0010(0x000C) (NeedCtorLink)
	unsigned long                                      bSection : 1;                                             // 0x001C(0x0004)
};

// Struct XInterface.HudBase.HudLocalizedMessage
// 0x0050
struct FHudLocalizedMessage
{
	class UClass*                                      Message;                                                  // 0x0000(0x0004)
	struct FString                                     StringMessage;                                            // 0x0004(0x000C) (NeedCtorLink)
	int                                                Switch;                                                   // 0x0010(0x0004)
	class APlayerReplicationInfo*                      RelatedPRI;                                               // 0x0014(0x0004)
	class APlayerReplicationInfo*                      RelatedPRI2;                                              // 0x0018(0x0004)
	class UObject*                                     OptionalObject;                                           // 0x001C(0x0004)
	float                                              EndOfLife;                                                // 0x0020(0x0004)
	float                                              Lifetime;                                                 // 0x0024(0x0004)
	float                                              StartTime;                                                // 0x0028(0x0004)
	class UFont*                                       StringFont;                                               // 0x002C(0x0004)
	struct FColor                                      DrawColor;                                                // 0x0030(0x0004)
	TEnumAsByte<EDrawPivot>                            DrawPivot;                                                // 0x0034(0x0001)
	TEnumAsByte<EStackMode>                            StackMode;                                                // 0x0035(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x0036(0x0002) MISSED OFFSET
	float                                              PosX;                                                     // 0x0038(0x0004)
	float                                              PosY;                                                     // 0x003C(0x0004)
	float                                              dx;                                                       // 0x0040(0x0004)
	float                                              dy;                                                       // 0x0044(0x0004)
	unsigned long                                      Drawn : 1;                                                // 0x0048(0x0004)
	unsigned long                                      PlaySound : 1;                                            // 0x0048(0x0004)
	int                                                iReserve;                                                 // 0x004C(0x0004)
};

// Struct XInterface.wHudPart_KillMessage.KillMessageItem
// 0x00F0
struct FKillMessageItem
{
	class APlayerReplicationInfo*                      KillerPRI;                                                // 0x0000(0x0004)
	class APlayerReplicationInfo*                      victimPRI;                                                // 0x0004(0x0004)
	struct FString                                     KillerName;                                               // 0x0008(0x000C) (NeedCtorLink)
	struct FString                                     VictimName;                                               // 0x0014(0x000C) (NeedCtorLink)
	class UClass*                                      DamageType;                                               // 0x0020(0x0004)
	float                                              TimeToRemove;                                             // 0x0024(0x0004)
	unsigned long                                      NoKillerName : 1;                                         // 0x0028(0x0004)
	unsigned long                                      NoVictimName : 1;                                         // 0x0028(0x0004)
	class UMaterial*                                   Image;                                                    // 0x002C(0x0004)
	struct FIntBoxWH                                   ImageCoord;                                               // 0x0030(0x0010)
	struct FColor                                      KillerColor;                                              // 0x0040(0x0004)
	struct FColor                                      VictimColor;                                              // 0x0044(0x0004)
	unsigned long                                      IsHeadShot : 1;                                           // 0x0048(0x0004)
	unsigned long                                      IsAimShot : 1;                                            // 0x0048(0x0004)
	int                                                NumKillSuccession;                                        // 0x004C(0x0004)
	unsigned long                                      KillerIsBot : 1;                                          // 0x0050(0x0004)
	unsigned long                                      VictimIsBot : 1;                                          // 0x0050(0x0004)
	int                                                iBotType;                                                 // 0x0054(0x0004)
	class UMaterial*                                   ImageKiller;                                              // 0x0058(0x0004)
	class UMaterial*                                   ImageVictim;                                              // 0x005C(0x0004)
	struct FIntBoxWH                                   ImageKillerCoord;                                         // 0x0060(0x0010)
	struct FIntBoxWH                                   ImageVictimCoord;                                         // 0x0070(0x0010)
	unsigned long                                      Cached : 1;                                               // 0x0080(0x0004)
	float                                              CacheFontSize;                                            // 0x0084(0x0004)
	float                                              CacheHeight;                                              // 0x0088(0x0004)
	float                                              CacheTotalWidth;                                          // 0x008C(0x0004)
	float                                              CacheKillerNameWidth;                                     // 0x0090(0x0004)
	float                                              CacheKillerNameHeight;                                    // 0x0094(0x0004)
	float                                              CacheVictimNameWidth;                                     // 0x0098(0x0004)
	float                                              CacheVictimNameHeight;                                    // 0x009C(0x0004)
	float                                              CacheImageWidth;                                          // 0x00A0(0x0004)
	float                                              CacheImageHeight;                                         // 0x00A4(0x0004)
	float                                              CacheKillerNameX1;                                        // 0x00A8(0x0004)
	float                                              CacheKillerNameX2;                                        // 0x00AC(0x0004)
	float                                              CacheImageX1;                                             // 0x00B0(0x0004)
	float                                              CacheImageX2;                                             // 0x00B4(0x0004)
	float                                              CacheVictimNameX1;                                        // 0x00B8(0x0004)
	float                                              CacheVictimNameX2;                                        // 0x00BC(0x0004)
	float                                              CacheHSImageWidth;                                        // 0x00C0(0x0004)
	float                                              CacheHSImageHeight;                                       // 0x00C4(0x0004)
	float                                              CacheHSImageX1;                                           // 0x00C8(0x0004)
	float                                              CacheHSImageX2;                                           // 0x00CC(0x0004)
	float                                              CacheKSImageWidth;                                        // 0x00D0(0x0004)
	float                                              CacheKSImageHeight;                                       // 0x00D4(0x0004)
	float                                              CacheKSImageX1;                                           // 0x00D8(0x0004)
	float                                              CacheKSImageX2;                                           // 0x00DC(0x0004)
	float                                              CacheASImageWidth;                                        // 0x00E0(0x0004)
	float                                              CacheASImageHeight;                                       // 0x00E4(0x0004)
	float                                              CacheASImageX1;                                           // 0x00E8(0x0004)
	float                                              CacheASImageX2;                                           // 0x00EC(0x0004)
};

// Struct XInterface.GUI.AutoLoginInfo
// 0x0034
struct FAutoLoginInfo
{
	struct FString                                     IP;                                                       // 0x0000(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Port;                                                     // 0x000C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     UserName;                                                 // 0x0018(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Password;                                                 // 0x0024(0x000C) (Edit, NeedCtorLink)
	unsigned long                                      bAutologin : 1;                                           // 0x0030(0x0004) (Edit)
};

// Struct XInterface.GUI.GUITreeNode
// 0x0038
struct FGUITreeNode
{
	struct FString                                     Caption;                                                  // 0x0000(0x000C) (Edit, NeedCtorLink)
	struct FString                                     Value;                                                    // 0x000C(0x000C) (Edit, NeedCtorLink)
	struct FString                                     ParentCaption;                                            // 0x0018(0x000C) (Edit, NeedCtorLink)
	struct FString                                     ExtraInfo;                                                // 0x0024(0x000C) (Edit, NeedCtorLink)
	int                                                Level;                                                    // 0x0030(0x0004) (Edit)
	unsigned long                                      bEnabled : 1;                                             // 0x0034(0x0004) (Edit)
};

// Struct XInterface.GUI.MultiSelectListElem
// 0x0028
struct FMultiSelectListElem
{
	struct FString                                     Item;                                                     // 0x0000(0x000C) (NeedCtorLink)
	class UObject*                                     ExtraData;                                                // 0x000C(0x0004)
	struct FString                                     ExtraStrData;                                             // 0x0010(0x000C) (NeedCtorLink)
	unsigned long                                      bSelected : 1;                                            // 0x001C(0x0004)
	int                                                SelectionIndex;                                           // 0x0020(0x0004)
	unsigned long                                      bSection : 1;                                             // 0x0024(0x0004)
};

// Struct XInterface.GUI.APackInfo
// 0x0018
struct FAPackInfo
{
	struct FString                                     PackageName;                                              // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     Description;                                              // 0x000C(0x000C) (Localized, NeedCtorLink)
};

// Struct XInterface.ExtendedConsole.ServerFavorite
// 0x0024
struct FServerFavorite
{
	int                                                ServerID;                                                 // 0x0000(0x0004) (Edit)
	struct FString                                     IP;                                                       // 0x0004(0x000C) (Edit, NeedCtorLink)
	int                                                Port;                                                     // 0x0010(0x0004) (Edit)
	int                                                QueryPort;                                                // 0x0014(0x0004) (Edit)
	struct FString                                     ServerName;                                               // 0x0018(0x000C) (Edit, NeedCtorLink)
};

// Struct XInterface.ExtendedConsole.StoredPassword
// 0x0018
struct FStoredPassword
{
	struct FString                                     Server;                                                   // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     Password;                                                 // 0x000C(0x000C) (NeedCtorLink)
};

// Struct XInterface.ExtendedConsole.ChatStruct
// 0x0010
struct FChatStruct
{
	struct FString                                     Message;                                                  // 0x0000(0x000C) (NeedCtorLink)
	int                                                Team;                                                     // 0x000C(0x0004)
};

// Struct XInterface.UT2MusicManager.PlayListStruct
// 0x001C
struct FPlayListStruct
{
	unsigned long                                      bRepeat : 1;                                              // 0x0000(0x0004) (Config)
	unsigned long                                      bShuffle : 1;                                             // 0x0000(0x0004) (Config)
	struct FString                                     current;                                                  // 0x0004(0x000C) (Config, NeedCtorLink)
	TArray<struct FString>                             Songs;                                                    // 0x0010(0x000C) (Config, NeedCtorLink)
};

// Struct XInterface.HudCDeathmatch.GameNotice
// 0x0020
struct FGameNotice
{
	struct FString                                     sNotice;                                                  // 0x0000(0x000C) (NeedCtorLink)
	float                                              fStartTime;                                               // 0x000C(0x0004)
	float                                              fEndTime;                                                 // 0x0010(0x0004)
	float                                              fLifeTime;                                                // 0x0014(0x0004)
	unsigned long                                      bSendConsole : 1;                                         // 0x0018(0x0004)
	int                                                NoticeStartPosX;                                          // 0x001C(0x0004)
};

// Struct XInterface.HudCDeathmatch.SelfKillMessage
// 0x0030
struct FSelfKillMessage
{
	struct FString                                     KillerName;                                               // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     VictimName;                                               // 0x000C(0x000C) (NeedCtorLink)
	class UClass*                                      Type;                                                     // 0x0018(0x0004)
	float                                              Time;                                                     // 0x001C(0x0004)
	struct FString                                     Message;                                                  // 0x0020(0x000C) (NeedCtorLink)
	struct FColor                                      MessageColor;                                             // 0x002C(0x0004)
};

// Struct XInterface.HudCDeathmatch.DamageIndicationInfo
// 0x001C
struct FDamageIndicationInfo
{
	struct FVector                                     AttackerLocation;                                         // 0x0000(0x000C)
	int                                                Damage;                                                   // 0x000C(0x0004)
	class UClass*                                      DamageType;                                               // 0x0010(0x0004)
	float                                              TimeInserted;                                             // 0x0014(0x0004)
	float                                              TimeToRemove;                                             // 0x0018(0x0004)
};

// Struct XInterface.HudCDeathmatch.AmmoSet
// 0x0058
struct FAmmoSet
{
	class UMaterial*                                   DigitTexture;                                             // 0x0000(0x0004)
	struct FIntBox                                     TextureCoords[0x4];                                       // 0x0004(0x0010)
	int                                                X2;                                                       // 0x0044(0x0004)
	int                                                Y2;                                                       // 0x0048(0x0004)
	int                                                XL;                                                       // 0x004C(0x0004)
	int                                                YL;                                                       // 0x0050(0x0004)
	int                                                ExtraOffsetX;                                             // 0x0054(0x0004)
};

// Struct XInterface.HudCDeathmatch.SkillProperty
// 0x0024
struct FSkillProperty
{
	int                                                iState;                                                   // 0x0000(0x0004)
	int                                                iSlotPos;                                                 // 0x0004(0x0004)
	int                                                iSkillID;                                                 // 0x0008(0x0004)
	int                                                iWeaponID;                                                // 0x000C(0x0004)
	float                                              fActiveTime;                                              // 0x0010(0x0004)
	unsigned long                                      bDrawedIcon : 1;                                          // 0x0014(0x0004)
	unsigned long                                      bDrawed : 1;                                              // 0x0014(0x0004)
	class UMaterial*                                   matIcon[0x2];                                             // 0x0018(0x0004)
	int                                                usedStrCode;                                              // 0x0020(0x0004)
};

// Struct XInterface.HudCDeathmatch.TeamDeathInfo
// 0x0024
struct FTeamDeathInfo
{
	int                                                TeamIndex;                                                // 0x0000(0x0004)
	struct FVector                                     Position;                                                 // 0x0004(0x000C)
	struct FVector                                     HeadPosition;                                             // 0x0010(0x000C)
	float                                              TimeToRemove;                                             // 0x001C(0x0004)
	float                                              TimeToStartFade;                                          // 0x0020(0x0004)
};

// Struct XInterface.HudCDeathmatch.WeaponState
// 0x0008
struct FWeaponState
{
	float                                              PickupTimer;                                              // 0x0000(0x0004)
	unsigned long                                      HasWeapon : 1;                                            // 0x0004(0x0004)
};

// Struct XInterface.wHudPart_MinimapBase.MinimapDeadInfo
// 0x0014
struct FMinimapDeadInfo
{
	int                                                TeamIndex;                                                // 0x0000(0x0004)
	struct FVector                                     Location;                                                 // 0x0004(0x000C)
	float                                              TimeToRemove;                                             // 0x0010(0x0004)
};

// Struct XInterface.wHudPart_MinimapBase.CachedSpecialPosInfo
// 0x001C
struct FCachedSpecialPosInfo
{
	struct FVector                                     pos;                                                      // 0x0000(0x000C)
	class UMaterial*                                   Image;                                                    // 0x000C(0x0004)
	int                                                Index;                                                    // 0x0010(0x0004)
	unsigned long                                      IsDraw : 1;                                               // 0x0014(0x0004)
	class AActor*                                      RefActor;                                                 // 0x0018(0x0004)
};

// Struct XInterface.xScoreBoardTutorial.stTutorialContent
// 0x001C
struct FstTutorialContent
{
	unsigned long                                      bCompleted : 1;                                           // 0x0000(0x0004)
	int                                                iGoal;                                                    // 0x0004(0x0004)
	int                                                iCurrent;                                                 // 0x0008(0x0004)
	int                                                iTutorialID;                                              // 0x000C(0x0004)
	struct FString                                     sContents;                                                // 0x0010(0x000C) (NeedCtorLink)
};

// Struct XInterface.wHudPart_DisplayQuest.SQuest
// 0x0028
struct FSQuest
{
	int                                                iCurProgress;                                             // 0x0000(0x0004)
	int                                                imaxProgress;                                             // 0x0004(0x0004)
	float                                              fStartTime;                                               // 0x0008(0x0004)
	float                                              fEndTime;                                                 // 0x000C(0x0004)
	float                                              fLifeTime;                                                // 0x0010(0x0004)
	unsigned long                                      bDraw : 1;                                                // 0x0014(0x0004)
	struct FString                                     MissionDesc;                                              // 0x0018(0x000C) (NeedCtorLink)
	unsigned long                                      bPlaySound : 1;                                           // 0x0024(0x0004)
};

// Struct XInterface.wHudPart_ItemBuy.stItemInfo
// 0x000C
struct FstItemInfo
{
	int                                                nBuyItemID;                                               // 0x0000(0x0004)
	int                                                nBuyItemPrice;                                            // 0x0004(0x0004)
	unsigned char                                      nBuyItemIndex;                                            // 0x0008(0x0001)
	unsigned char                                      nBuyEnableLevel;                                          // 0x0009(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x000A(0x0002) MISSED OFFSET
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
