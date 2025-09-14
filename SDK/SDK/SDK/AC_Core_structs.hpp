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

#define CONST_BT_TRUE                                             1
#define CONST_WEAPONID_HELICOPTER                                 5009
#define CONST_WEAPONID_SENTRYGUN_PACK                             5018
#define CONST_ALL_GAMEMODE                                        255
#define CONST_MaxInt                                              0x7fffffff
#define CONST_Pi                                                  3.1415926535897932
#define CONST_ALL_MAP                                             255
#define CONST_RF_Standalone                                       0x00080000
#define CONST_SUPPLY_ITEM_CULL_DISTANCE                           6500
#define CONST_SUPPLY_ITEM_STAY_TIME_HEALTH_PACK                   10
#define CONST_NPCID_SENTRYGUN                                     200
#define CONST_SUPPLY_ITEM_STAY_TIME                               120
#define CONST_ITEMID_DEFAULT_BODY                                 15000
#define CONST_WEAPONID_UAV                                        5010
#define CONST_WEAPONID_BOMBING                                    5006
#define CONST_COMMON_MODE_ITEM                                    0
#define CONST_RF_Transient                                        0x00004000
#define CONST_TEAM_ID_DEFFENCE_MODE_MOB                           1
#define CONST_RF_Transactional                                    0x00000001
#define CONST_TEAM_ID_DEFFENCE_MODE_HUMAN                         0
#define CONST_RF_NotForEdit                                       0x00400000
#define CONST_TEAM_ID_ALIEN_MODE_ALIEN                            1
#define CONST_TEAM_ID_ALIEN_MODE_HUMAN                            0
#define CONST_TEAM_ID_RSA                                         1
#define CONST_TEAM_ID_AF                                          0
#define CONST_TEAM_ID_COUNT                                       2
#define CONST_INVALID_SUPPLY_ITEM_ID                              255
#define CONST_ESUPPLY_ITEM_COUNT                                  5
#define CONST_BT_FALSE                                            0
#define CONST_RF_NotForServer                                     0x00200000
#define CONST_RF_NotForClient                                     0x00100000
#define CONST_RF_Public                                           0x00000004

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum Core.Object.EAPriority
enum class EAPriority : uint8_t
{
	AP_Normal                      = 0,
	AP_NoDuplicates                = 1,
	AP_InstantPlay                 = 2,
	AP_InstantOrQueueSwitch        = 3,
	AP_MustQueue                   = 4
};


// Enum Core.Object.MessageType
enum class EMessageType : uint8_t
{
	MT_CHAT_ALL                    = 0,
	MT_CHAT_TEAM                   = 1,
	MT_CHAT_GHOST_ALL              = 2,
	MT_CHAT_GHOST_TEAM             = 3,
	MT_WHISPER                     = 4,
	MT_CLAN                        = 5,
	MT_SYSTEM                      = 6,
	MT_COMMUNICATION               = 7,
	MT_CHAT_ALL_SELF               = 8,
	MT_CHAT_TEAM_SELF              = 9,
	MT_CHAT_BROADCAST_ITEM         = 10
};


// Enum Core.Object.EAxis
enum class EAxis : uint8_t
{
	AXIS_X                         = 0,
	AXIS_Y                         = 1,
	AXIS_Z                         = 2
};


// Enum Core.Object.EDetailMode
enum class EDetailMode : uint8_t
{
	DM_Low                         = 0,
	DM_High                        = 1,
	DM_SuperHigh                   = 2
};


// Enum Core.Object.EDrawPivot
enum class EDrawPivot : uint8_t
{
	DP_UpperLeft                   = 0,
	DP_UpperMiddle                 = 1,
	DP_UpperRight                  = 2,
	DP_MiddleRight                 = 3,
	DP_LowerRight                  = 4,
	DP_LowerMiddle                 = 5,
	DP_LowerLeft                   = 6,
	DP_MiddleLeft                  = 7,
	DP_MiddleMiddle                = 8
};


// Enum Core.Object.ECamOrientation
enum class ECamOrientation : uint8_t
{
	CAMORIENT_None                 = 0,
	CAMORIENT_LookAtActor          = 1,
	CAMORIENT_FacePath             = 2,
	CAMORIENT_Interpolate          = 3,
	CAMORIENT_Dolly                = 4
};


// Enum Core.Object.ESpawnTeam
enum class ESpawnTeam : uint8_t
{
	EST_ATTACK_TEAM                = 0,
	EST_PROTECT_TEAM               = 1
};


// Enum Core.Object.Scale.ESheerAxis
enum class ESheerAxis : uint8_t
{
	SHEER_None                     = 0,
	SHEER_XY                       = 1,
	SHEER_XZ                       = 2,
	SHEER_YX                       = 3,
	SHEER_YZ                       = 4,
	SHEER_ZX                       = 5,
	SHEER_ZY                       = 6
};


// Enum Core.Object.ESUPPLY_ITEM_TYPE
enum class ESUPPLY_ITEM_TYPE : uint8_t
{
	ESUPPLY_ITEM_HEALTH            = 0,
	ESUPPLY_ITEM_UAV               = 1,
	ESUPPLY_ITEM_HELICOPTER        = 2,
	ESUPPLY_ITEM_BOMBING           = 3,
	ESUPPLY_ITEM_SENTRYGUN         = 4
};


// Enum Core.Object.SLOT_POS
enum class ESLOT_POS : uint8_t
{
	SLOT_POS_MAIN_WEAPON           = 0,
	SLOT_POS_SUB_WEAPON            = 1,
	SLOT_POS_THROW_WEAPON1         = 2,
	SLOT_POS_THROW_WEAPON2         = 3,
	SLOT_POS_QUICK_MAIN_WEAPON1    = 4,
	SLOT_POS_QUICK_MAIN_WEAPON2    = 5,
	SLOT_POS_QUICK_MAIN_WEAPON3    = 6,
	SLOT_POS_QUICK_SUB_WEAPON1     = 7,
	SLOT_POS_QUICK_SUB_WEAPON2     = 8,
	SLOT_POS_QUICK_SUB_WEAPON3     = 9,
	SLOT_POS_QUICK_THROW_WEAPON1   = 10,
	SLOT_POS_QUICK_THROW_WEAPON2   = 11,
	SLOT_POS_QUICK_THROW_WEAPON3   = 12,
	SLOT_POS_INVEN                 = 13,
	SLOT_POS_SKILL1                = 14,
	SLOT_POS_SKILL2                = 15,
	SLOT_POS_SKILL3                = 16,
	SLOT_POS_SKILL4                = 17,
	SLOT_HELMET                    = 18,
	SLOT_FACE_ACCESSORY            = 19,
	SLOT_BACKPACK                  = 20,
	SLOT_SPECIAL_CHAR_AF           = 21,
	SLOT_SPECIAL_CHAR_RSA          = 22,
	SLOT_POS_LEVEL_MARK            = 23,
	SLOT_POS_POUCH                 = 24,
	SLOT_POS_CAMOUFLAGE            = 25,
	SLOT_POS_USE                   = 26,
	SLOT_POS_END                   = 27
};


// Enum Core.Object.EPage
enum class EPage : uint8_t
{
	EPage_None                     = 0,
	EPage_BackToLastPage           = 1,
	EPage_Logo                     = 2,
	EPage_Login                    = 3,
	EPage_CharacterCreation        = 4,
	EPage_ServerSelection          = 5,
	EPage_Lobby                    = 6,
	EPage_Lobby2                   = 7,
	EPage_Channel                  = 8,
	EPage_GameRoom                 = 9,
	EPage_RoomLobby                = 10,
	EPage_MatchResult              = 11,
	Epage_MatchResult2             = 12,
	Epage_MatchResult_Booty        = 13,
	EPage_ControlTest              = 14,
	EPage_ControlTest2             = 15,
	EPage_ControlTestTab           = 16,
	EPage_ControlTestVerticalTab   = 17,
	EPage_Auction                  = 18,
	EPage_Help                     = 19,
	EPage_Mail                     = 20,
	EPage_Store                    = 21,
	EPage_Inventory                = 22,
	EPage_MyInfo                   = 23,
	EPage_Clan                     = 24,
	EPage_Credit                   = 25,
	EPage_ClanWar                  = 26,
	EPage_Lucky                    = 27
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct Core.Object.FloatBox
// 0x0010
struct FFloatBox
{
	float                                              X1;                                                       // 0x0000(0x0004)
	float                                              Y1;                                                       // 0x0004(0x0004)
	float                                              X2;                                                       // 0x0008(0x0004)
	float                                              Y2;                                                       // 0x000C(0x0004)
};

// Struct Core.Object.Vector
// 0x000C
struct FVector
{
	float                                              X;                                                        // 0x0000(0x0004) (Edit, Config)
	float                                              Y;                                                        // 0x0004(0x0004) (Edit, Config)
	float                                              Z;                                                        // 0x0008(0x0004) (Edit, Config)
};

// Struct Core.Object.Quat
// 0x0010
struct FQuat
{
	float                                              X;                                                        // 0x0000(0x0004) (Edit, Config)
	float                                              Y;                                                        // 0x0004(0x0004) (Edit, Config)
	float                                              Z;                                                        // 0x0008(0x0004) (Edit, Config)
	float                                              W;                                                        // 0x000C(0x0004) (Edit, Config)
};

// Struct Core.Object.Rotator
// 0x000C
struct FRotator
{
	int                                                Pitch;                                                    // 0x0000(0x0004) (Edit, Config)
	int                                                Yaw;                                                      // 0x0004(0x0004) (Edit, Config)
	int                                                Roll;                                                     // 0x0008(0x0004) (Edit, Config)
};

// Struct Core.Object.InterpCurvePoint
// 0x0008
struct FInterpCurvePoint
{
	float                                              InVal;                                                    // 0x0000(0x0004) (Edit)
	float                                              OutVal;                                                   // 0x0004(0x0004) (Edit)
};

// Struct Core.Object.InterpCurve
// 0x000C
struct FInterpCurve
{
	TArray<struct FInterpCurvePoint>                   Points;                                                   // 0x0000(0x000C) (Edit, NeedCtorLink)
};

// Struct Core.Object.BtrDouble
// 0x0008
struct FBtrDouble
{
	int                                                dummy_1_DO_NOT_USE;                                       // 0x0000(0x0004) (Edit, Config)
	int                                                dummy_2_DO_NOT_USE;                                       // 0x0004(0x0004) (Edit, Config)
};

// Struct Core.Object.BtrTime
// 0x0020
struct FBtrTime
{
	int                                                Year;                                                     // 0x0000(0x0004)
	int                                                Month;                                                    // 0x0004(0x0004)
	int                                                DayOfWeek;                                                // 0x0008(0x0004)
	int                                                Day;                                                      // 0x000C(0x0004)
	int                                                Hour;                                                     // 0x0010(0x0004)
	int                                                Minute;                                                   // 0x0014(0x0004)
	int                                                Second;                                                   // 0x0018(0x0004)
	int                                                Milliseconds;                                             // 0x001C(0x0004)
};

// Struct Core.Object.IntBoxWH
// 0x0010
struct FIntBoxWH
{
	int                                                X;                                                        // 0x0000(0x0004)
	int                                                Y;                                                        // 0x0004(0x0004)
	int                                                W;                                                        // 0x0008(0x0004)
	int                                                H;                                                        // 0x000C(0x0004)
};

// Struct Core.Object.Guid
// 0x0010
struct FGuid
{
	int                                                A;                                                        // 0x0000(0x0004)
	int                                                B;                                                        // 0x0004(0x0004)
	int                                                C;                                                        // 0x0008(0x0004)
	int                                                D;                                                        // 0x000C(0x0004)
};

// Struct Core.Object.Coords
// 0x0030
struct FCoords
{
	struct FVector                                     Origin;                                                   // 0x0000(0x000C) (Edit, Config)
	struct FVector                                     XAxis;                                                    // 0x000C(0x000C) (Edit, Config)
	struct FVector                                     YAxis;                                                    // 0x0018(0x000C) (Edit, Config)
	struct FVector                                     ZAxis;                                                    // 0x0024(0x000C) (Edit, Config)
};

// Struct Core.Object.Plane
// 0x0004 (0x0010 - 0x000C)
struct FPlane : public FVector
{
	float                                              W;                                                        // 0x000C(0x0004) (Edit, Config)
};

// Struct Core.Object.Matrix
// 0x0040
struct FMatrix
{
	struct FPlane                                      XPlane;                                                   // 0x0000(0x0010) (Edit)
	struct FPlane                                      YPlane;                                                   // 0x0010(0x0010) (Edit)
	struct FPlane                                      ZPlane;                                                   // 0x0020(0x0010) (Edit)
	struct FPlane                                      WPlane;                                                   // 0x0030(0x0010) (Edit)
};

// Struct Core.Object.IntArray
// 0x000C
struct FIntArray
{
	TArray<int>                                        Values;                                                   // 0x0000(0x000C) (NeedCtorLink)
};

// Struct Core.Object.GameModeInfo
// 0x007C
struct FGameModeInfo
{
	struct FString                                     ClassName;                                                // 0x0000(0x000C) (NeedCtorLink)
	struct FString                                     UserFriendlyName;                                         // 0x000C(0x000C) (NeedCtorLink)
	struct FString                                     ModeDescription;                                          // 0x0018(0x000C) (NeedCtorLink)
	TArray<struct FString>                             TimeLimits;                                               // 0x0024(0x000C) (NeedCtorLink)
	TArray<struct FString>                             Scores;                                                   // 0x0030(0x000C) (NeedCtorLink)
	TArray<struct FString>                             Scores_DefaultTimeLimits;                                 // 0x003C(0x000C) (NeedCtorLink)
	struct FString                                     ScoreDefault;                                             // 0x0048(0x000C) (NeedCtorLink)
	TArray<int>                                        UserCount;                                                // 0x0054(0x000C) (NeedCtorLink)
	int                                                UserCount_Default;                                        // 0x0060(0x0004)
	unsigned long                                      bPlayWithBots : 1;                                        // 0x0064(0x0004)
	int                                                BotUserTeam_Default;                                      // 0x0068(0x0004)
	int                                                BotNum0_Default;                                          // 0x006C(0x0004)
	int                                                BotNum1_Default;                                          // 0x0070(0x0004)
	int                                                BotDifficulty_Default;                                    // 0x0074(0x0004)
	int                                                ModeIndex;                                                // 0x0078(0x0004)
};

// Struct Core.Object.Color
// 0x0004
struct FColor
{
	unsigned char                                      B;                                                        // 0x0000(0x0001) (Edit, Config)
	unsigned char                                      G;                                                        // 0x0001(0x0001) (Edit, Config)
	unsigned char                                      R;                                                        // 0x0002(0x0001) (Edit, Config)
	unsigned char                                      A;                                                        // 0x0003(0x0001) (Edit, Config)

	FColor()
		: R(0), G(0), B(0), A(0)
	{ }

	FColor(unsigned char r, unsigned char g, unsigned char b, unsigned char a)
		: R(r),
		  G(g),
		  B(b),
		  A(a)
	{ }

};

// Struct Core.Object.MessageItem
// 0x0020
struct FMessageItem
{
	struct FString                                     Text;                                                     // 0x0000(0x000C) (NeedCtorLink)
	TEnumAsByte<EMessageType>                          Type;                                                     // 0x000C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
	float                                              TimeWritten;                                              // 0x0010(0x0004)
	int                                                FontSize;                                                 // 0x0014(0x0004)
	struct FColor                                      TextColor;                                                // 0x0018(0x0004)
	float                                              TimeToRemove;                                             // 0x001C(0x0004)
};

// Struct Core.Object.CombatSituationSphere
// 0x0018
struct FCombatSituationSphere
{
	struct FVector                                     vCenterPos;                                               // 0x0000(0x000C)
	float                                              fInRadius;                                                // 0x000C(0x0004)
	float                                              fOutRadius;                                               // 0x0010(0x0004)
	struct FColor                                      kColor;                                                   // 0x0014(0x0004)
};

// Struct Core.Object.CombatSituationArrow
// 0x001C
struct FCombatSituationArrow
{
	struct FVector                                     vPos;                                                     // 0x0000(0x000C)
	struct FRotator                                    rRayDir;                                                  // 0x000C(0x000C)
	struct FColor                                      ArrowColor;                                               // 0x0018(0x0004)
};

// Struct Core.Object.CombatSituationNameTag
// 0x0018
struct FCombatSituationNameTag
{
	struct FVector                                     vPos;                                                     // 0x0000(0x000C)
	struct FString                                     szName;                                                   // 0x000C(0x000C) (NeedCtorLink)
};

// Struct Core.Object.CombatSituationPoint
// 0x0010
struct FCombatSituationPoint
{
	struct FVector                                     vPos;                                                     // 0x0000(0x000C)
	struct FColor                                      PointColor;                                               // 0x000C(0x0004)
};

// Struct Core.Object.CombatSituationLine
// 0x001C
struct FCombatSituationLine
{
	struct FVector                                     vStartPos;                                                // 0x0000(0x000C)
	struct FVector                                     vEndPos;                                                  // 0x000C(0x000C)
	struct FColor                                      LineColor;                                                // 0x0018(0x0004)
};

// Struct Core.Object.TMultiMap
// 0x0014
struct FTMultiMap
{
	struct FPointer                                    FArray_Data;                                              // 0x0000(0x0004) (Transient)
	int                                                FArray_ArrayNum;                                          // 0x0004(0x0004)
	int                                                FArray_ArrayMax;                                          // 0x0008(0x0004)
	struct FPointer                                    TMapBase_Hash;                                            // 0x000C(0x0004) (Transient)
	int                                                TMapBase_HashCount;                                       // 0x0010(0x0004)
};

// Struct Core.Object.CompressedPosition
// 0x0024
struct FCompressedPosition
{
	struct FVector                                     Location;                                                 // 0x0000(0x000C)
	struct FRotator                                    Rotation;                                                 // 0x000C(0x000C)
	struct FVector                                     Velocity;                                                 // 0x0018(0x000C)
};

// Struct Core.Object.Box
// 0x001C
struct FBox
{
	struct FVector                                     Min;                                                      // 0x0000(0x000C)
	struct FVector                                     Max;                                                      // 0x000C(0x000C)
	unsigned char                                      IsValid;                                                  // 0x0018(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0019(0x0003) MISSED OFFSET
};

// Struct Core.Object.BoundingVolume
// 0x0010 (0x002C - 0x001C)
struct FBoundingVolume : public FBox
{
	struct FPlane                                      Sphere;                                                   // 0x001C(0x0010)
};

// Struct Core.Object.FloatBoxWH
// 0x0010
struct FFloatBoxWH
{
	float                                              X;                                                        // 0x0000(0x0004)
	float                                              Y;                                                        // 0x0004(0x0004)
	float                                              W;                                                        // 0x0008(0x0004)
	float                                              H;                                                        // 0x000C(0x0004)
};

// Struct Core.Object.IntBox
// 0x0010
struct FIntBox
{
	int                                                X1;                                                       // 0x0000(0x0004)
	int                                                Y1;                                                       // 0x0004(0x0004)
	int                                                X2;                                                       // 0x0008(0x0004)
	int                                                Y2;                                                       // 0x000C(0x0004)
};

// Struct Core.Object.Scale
// 0x0014
struct FScale
{
	struct FVector                                     Scale;                                                    // 0x0000(0x000C) (Edit, Config)
	float                                              SheerRate;                                                // 0x000C(0x0004) (Edit, Config)
	TEnumAsByte<ESheerAxis>                            SheerAxis;                                                // 0x0010(0x0001) (Edit, Config)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0011(0x0003) MISSED OFFSET
};

// Struct Core.Object.Range
// 0x0008
struct FRange
{
	float                                              Min;                                                      // 0x0000(0x0004) (Edit, Config)
	float                                              Max;                                                      // 0x0004(0x0004) (Edit, Config)
};

// Struct Core.Object.RangeVector
// 0x0018
struct FRangeVector
{
	struct FRange                                      X;                                                        // 0x0000(0x0008) (Edit, Config)
	struct FRange                                      Y;                                                        // 0x0008(0x0008) (Edit, Config)
	struct FRange                                      Z;                                                        // 0x0010(0x0008) (Edit, Config)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
