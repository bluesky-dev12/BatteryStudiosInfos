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

#define CONST_MPPROPNUM                                           4
#define CONST_AngleConvert                                        0.0000958738
#define CONST_Bot_MINVIEWDIST                                     200
#define CONST_Bot_MINSTRAFEDIST                                   200
#define CONST_Bot_TACTICALHEIGHTADVANTAGE                         320
#define CONST_Bot_ENEMYLOCATIONFUZZ                               1200
#define CONST_DMPROPNUM                                           14
#define CONST_Bot_MAXSTAKEOUTDIST                                 2000
#define CONST_TGPROPNUM                                           5
#define CONST_NOSPEECH                                            2
#define CONST_DMMutator_PROPNUM                                   2
#define CONST_BANNED                                              8
#define CONST_NOVOICE                                             4
#define CONST_NOTEXT                                              1

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum UnrealGame.Bot.EScriptFollow
enum class EScriptFollow : uint8_t
{
	FOLLOWSCRIPT_IgnoreAllStimuli  = 0,
	FOLLOWSCRIPT_IgnoreEnemies     = 1,
	FOLLOWSCRIPT_StayOnScript      = 2,
	FOLLOWSCRIPT_LeaveScriptForCombat = 3
};


// Enum UnrealGame.RosterEntry.EOrders
enum class EOrders : uint8_t
{
	ORDERS_None                    = 0,
	ORDERS_Attack                  = 1,
	ORDERS_Defend                  = 2,
	ORDERS_Freelance               = 3,
	ORDERS_Support                 = 4,
	ORDERS_Roam                    = 5
};


// Enum UnrealGame.DestroyableObjective.EConstraintInstigator
enum class EConstraintInstigator : uint8_t
{
	CI_All                         = 0,
	CI_PawnClass                   = 1
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct UnrealGame.DeathMatch.AddBotInfo
// 0x0028
struct FAddBotInfo
{
	class UClass*                                      BotClass;                                                 // 0x0000(0x0004)
	class AController*                                 callerController;                                         // 0x0004(0x0004)
	int                                                Team;                                                     // 0x0008(0x0004)
	int                                                Grade;                                                    // 0x000C(0x0004)
	int                                                NPCID;                                                    // 0x0010(0x0004)
	int                                                iRegenLocationIndex;                                      // 0x0014(0x0004)
	unsigned long                                      bUseDynamicRegenLocation : 1;                             // 0x0018(0x0004)
	struct FVector                                     v3DynamicRegenLocation;                                   // 0x001C(0x000C)
};

// Struct UnrealGame.GameObjective.ScorerRecord
// 0x0008
struct FScorerRecord
{
	class AController*                                 C;                                                        // 0x0000(0x0004)
	float                                              Pct;                                                      // 0x0004(0x0004)
};

// Struct UnrealGame.HoldObjective.TouchingPlayer
// 0x0008
struct FTouchingPlayer
{
	class AController*                                 C;                                                        // 0x0000(0x0004)
	float                                              TouchTime;                                                // 0x0004(0x0004)
};

// Struct UnrealGame.TeamPlayerReplicationInfo.VehicleStats
// 0x0010
struct FVehicleStats
{
	class UClass*                                      VehicleClass;                                             // 0x0000(0x0004)
	int                                                Kills;                                                    // 0x0004(0x0004)
	int                                                Deaths;                                                   // 0x0008(0x0004)
	int                                                DeathsDriving;                                            // 0x000C(0x0004)
};

// Struct UnrealGame.TeamPlayerReplicationInfo.WeaponStats
// 0x0010
struct FWeaponStats
{
	class UClass*                                      WeaponClass;                                              // 0x0000(0x0004)
	int                                                Kills;                                                    // 0x0004(0x0004)
	int                                                Deaths;                                                   // 0x0008(0x0004)
	int                                                deathsholding;                                            // 0x000C(0x0004)
};

// Struct UnrealGame.CustomBotConfig.CustomConfiguration
// 0x0054
struct FCustomConfiguration
{
	struct FString                                     CharacterName;                                            // 0x0000(0x000C) (Config, NeedCtorLink)
	struct FString                                     PlayerName;                                               // 0x000C(0x000C) (Config, NeedCtorLink)
	struct FString                                     CustomVoice;                                              // 0x0018(0x000C) (Config, NeedCtorLink)
	TEnumAsByte<EPlayerPos>                            CustomOrders;                                             // 0x0024(0x0001) (Config)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0025(0x0003) MISSED OFFSET
	struct FString                                     FavoriteWeapon;                                           // 0x0028(0x000C) (Edit, Config, NeedCtorLink)
	float                                              Aggressiveness;                                           // 0x0034(0x0004) (Edit, Config)
	float                                              Accuracy;                                                 // 0x0038(0x0004) (Edit, Config)
	float                                              CombatStyle;                                              // 0x003C(0x0004) (Edit, Config)
	float                                              StrafingAbility;                                          // 0x0040(0x0004) (Edit, Config)
	float                                              Tactics;                                                  // 0x0044(0x0004) (Edit, Config)
	float                                              ReactionTime;                                             // 0x0048(0x0004) (Edit, Config)
	float                                              Jumpiness;                                                // 0x004C(0x0004) (Edit, Config)
	unsigned long                                      bJumpy : 1;                                               // 0x0050(0x0004) (Config)
};

// Struct UnrealGame.UnrealPlayerChatManager.StoredChatBan
// 0x0010
struct FStoredChatBan
{
	struct FString                                     PlayerHash;                                               // 0x0000(0x000C) (NeedCtorLink)
	unsigned char                                      Restriction;                                              // 0x000C(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x000D(0x0003) MISSED OFFSET
};

// Struct UnrealGame.UnrealPlayerChatManager.ChatBan
// 0x0020
struct AUnrealPlayerChatManager_FChatBan
{
	int                                                PlayerID;                                                 // 0x0000(0x0004)
	struct FString                                     PlayerHash;                                               // 0x0004(0x000C) (NeedCtorLink)
	struct FString                                     PlayerAddress;                                            // 0x0010(0x000C) (NeedCtorLink)
	unsigned char                                      PlayerVoiceMask;                                          // 0x001C(0x0001)
	unsigned char                                      Restriction;                                              // 0x001D(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x001E(0x0002) MISSED OFFSET
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
