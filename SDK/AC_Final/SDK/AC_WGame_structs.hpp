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

#define CONST_BREAKDOWN_EFFECT_GENERATE_HEALTH_RATE               0.25
#define CONST_fServerReqLockTime                                 0.2f
#define CONST_LIFE_TIME_IN_IDLE                                   65
#define CONST_wBotVehicleController_ENEMYLOCATIONFUZZ             1200
#define CONST_InvenSkillStartIndex                                12
#define CONST_wMonsterController_TACTICALHEIGHTADVANTAGE          1220
#define CONST_wMonsterController_MINSTRAFEDIST                    300
#define CONST_fServerReqLockTimeRespawn                          1.1f
#define CONST_MaxComboKeyTime                                     0.35
#define CONST_MinComboKeyTime                                     0.05
#define CONST_wMonsterController_MINVIEWDIST                      300
#define CONST_wMonsterController_ENEMYLOCATIONFUZZ                4500
#define CONST_wBotVehicleController_MINVIEWDIST                   200
#define CONST_wMonsterController_MAXSTAKEOUTDIST                  8000
#define CONST_wBotVehicleController_MINSTRAFEDIST                 200
#define CONST_wBotVehicleController_TACTICALHEIGHTADVANTAGE       320
#define CONST_wBotVehicleController_MAXSTAKEOUTDIST               2000
#define CONST_DEBRIS_COUNT                                        6
#define CONST_VIEW_HEIGHT_BOTOOM_LIMIT                            530
#define CONST_VIEW_HEIGHT_TOP_LIMIT                               530
#define CONST_SENTRYGUN_IDLE_ROTATION_STEP                        5000
#define CONST_SENTRYGUN_ROTATION_STEP                             17000
#define CONST_SENTRYGUN_VIEW_HORIZONTAL_HALF_ANGLE                45.0
#define CONST_SENTRYGUN_VIEW_VERTICAL_HALF_ANGLE                  45.0

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum WGame.wPawnSoundGroup.ESoundType
enum class ESoundType : uint8_t
{
	EST_Land                       = 0,
	EST_CorpseLanded               = 1,
	EST_HitUnderWater              = 2,
	EST_Jump                       = 3,
	EST_LandGrunt                  = 4,
	EST_Gasp                       = 5,
	EST_Drown                      = 6,
	EST_BreatheAgain               = 7,
	EST_Dodge                      = 8,
	EST_DoubleJump                 = 9
};


// Enum WGame.wPawn.eSpecialState
enum class EeSpecialState : uint8_t
{
	SState_Planting                = 0,
	SState_Diffusing               = 1
};


// Enum WGame.wPawn.EFireAnimState
enum class EFireAnimState : uint8_t
{
	FS_None                        = 0,
	FS_PlayOnce                    = 1,
	FS_Looping                     = 2,
	FS_Ready                       = 3
};


// Enum WGame.Goal.EGoalStatus
enum class EGoalStatus : uint8_t
{
	GS_NONE                        = 0,
	GS_WORKING                     = 1,
	GS_FAILED                      = 2,
	GS_COMPLETED                   = 3
};


// Enum WGame.wSentryGunPawn.EMUZZLE_ROTATION_RESULT_TYPE
enum class EMUZZLE_ROTATION_RESULT_TYPE : uint8_t
{
	EMUZZLE_ROTATION_IDLE          = 0,
	EMUZZLE_ROTATION_WORKING       = 1,
	EMUZZLE_ROTATION_TARGETING     = 2
};


// Enum WGame.wBTR_ArrangeTurret.EASVF_TriggeredFunction
enum class EASVF_TriggeredFunction : uint8_t
{
	EAVSF_ToggleEnabled            = 0,
	EAVSF_TriggeredSpawn           = 1,
	EAVSF_SpawnProgress            = 2
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct WGame.wUtil.MutatorRecord
// 0x0054
struct UwUtil_FMutatorRecord
{
	class UClass*                                      mutClass;                                                 // 0x0000(0x0004) (Edit, Const)
	string                                             ClassName;                                                // 0x0004(0x000C) (Edit, Const, NeedCtorLink)
	string                                             FriendlyName;                                             // 0x0010(0x000C) (Edit, Const, NeedCtorLink)
	string                                             Description;                                              // 0x001C(0x000C) (Edit, Const, NeedCtorLink)
	string                                             IconMaterialName;                                         // 0x0028(0x000C) (Edit, Const, NeedCtorLink)
	string                                             ConfigMenuClassName;                                      // 0x0034(0x000C) (Edit, Const, NeedCtorLink)
	string                                             GroupName;                                                // 0x0040(0x000C) (Edit, Const, NeedCtorLink)
	int                                                RecordIndex;                                              // 0x004C(0x0004) (Edit, Const)
	byte                                               bActivated;                                               // 0x0050(0x0001) (Const)
	byte                                               Padding00[0x3];                                           // 0x0051(0x0003) MISSED OFFSET
};

// Struct WGame.wUtil.PlayerRecord
// 0x00FC
struct FPlayerRecord
{
	string                                             DefaultName;                                              // 0x0000(0x000C) (Edit, NeedCtorLink)
	class UClass*                                      Species;                                                  // 0x000C(0x0004) (Edit)
	string                                             MeshName;                                                 // 0x0010(0x000C) (Edit, NeedCtorLink)
	string                                             BodySkinName;                                             // 0x001C(0x000C) (Edit, NeedCtorLink)
	string                                             FaceSkinName;                                             // 0x0028(0x000C) (Edit, NeedCtorLink)
	class UMaterial*                                   Portrait;                                                 // 0x0034(0x0004) (Edit)
	string                                             TextName;                                                 // 0x0038(0x000C) (Edit, NeedCtorLink)
	string                                             VoiceClassName;                                           // 0x0044(0x000C) (Edit, NeedCtorLink)
	string                                             Sex;                                                      // 0x0050(0x000C) (NeedCtorLink)
	string                                             Accuracy;                                                 // 0x005C(0x000C) (NeedCtorLink)
	string                                             Aggressiveness;                                           // 0x0068(0x000C) (NeedCtorLink)
	string                                             StrafingAbility;                                          // 0x0074(0x000C) (NeedCtorLink)
	string                                             CombatStyle;                                              // 0x0080(0x000C) (NeedCtorLink)
	string                                             Tactics;                                                  // 0x008C(0x000C) (NeedCtorLink)
	string                                             ReactionTime;                                             // 0x0098(0x000C) (NeedCtorLink)
	string                                             Jumpiness;                                                // 0x00A4(0x000C) (NeedCtorLink)
	string                                             Race;                                                     // 0x00B0(0x000C) (NeedCtorLink)
	string                                             FavoriteWeapon;                                           // 0x00BC(0x000C) (NeedCtorLink)
	string                                             Menu;                                                     // 0x00C8(0x000C) (NeedCtorLink)
	string                                             Skeleton;                                                 // 0x00D4(0x000C) (NeedCtorLink)
	int                                                RecordIndex;                                              // 0x00E0(0x0004) (Edit, Const)
	string                                             Ragdoll;                                                  // 0x00E4(0x000C) (NeedCtorLink)
	byte                                               BotUse;                                                   // 0x00F0(0x0001)
	byte                                               Padding00[0x3];                                           // 0x00F1(0x0003) MISSED OFFSET
	bool                                               UseSpecular;                                              // 0x00F4(0x0004)
	bool                                               TeamFace;                                                 // 0x00F4(0x0004)
	bool                                               ZeroWeaponOffsets;                                        // 0x00F4(0x0004)
	class UClass*                                      PlayerInfo;                                               // 0x00F8(0x0004) (Edit)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
