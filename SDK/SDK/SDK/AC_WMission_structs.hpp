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

#define CONST_MATCH_END_HUD_TYPE                                  2
#define CONST_MAX_SELECT_ALIEN_RESPAWN_TIME                       10
#define CONST_MAX_ITEM_SLOT_COUNT                                 2
#define CONST_ALIEN_HUD_TYPE                                      1
#define CONST_HUMAN_HUD_TYPE                                      0
#define CONST_MIN_ALIEN_CRITICAL_HEALTH                           500
#define CONST_ALIEN_FOV                                           80
#define CONST_HERO_BODY_ITEM_ID                                   90204
#define CONST_MAX_WAIT_END_ROUND_TIME                             10.0f
#define CONST_MaxMSGs                                            8

//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum WMission.wHUD_Alien.eAlienMode_Skill_Type
enum class EeAlienMode_Skill_Type : uint8_t
{
	eAlien_Skill_Infected_DEF      = 0,
	eAlien_Skill_Infected_Point    = 1
};


// Enum WMission.wMSGameReplicationInfo.ERoundWinner
enum class ERoundWinner : uint8_t
{
	ERW_None                       = 0,
	ERW_PracticeRoundEnded         = 1,
	ERW_RedAttacked                = 2,
	ERW_BlueAttacked               = 3,
	ERW_RedDefended                = 4,
	ERW_BlueDefended               = 5,
	ERW_RedMoreObjectives          = 6,
	ERW_BlueMoreObjectives         = 7,
	ERW_RedMoreProgress            = 8,
	ERW_BlueMoreProgress           = 9,
	ERW_RedGotSameOBJFaster        = 10,
	ERW_BlueGotSameOBJFaster       = 11,
	ERW_Draw                       = 12
};


// Enum WMission.wMSGameInfo.ERER_Reason
enum class ERER_Reason : uint8_t
{
	ERER_AttackersWin              = 0,
	ERER_AttackersLose             = 1,
	ERER_AttackersWin_DefendersDied = 2,
	ERER_AttackersLose_AttackersDied = 3,
	ERER_DrawGame                  = 4,
	ERER_Team0                     = 5,
	ERER_Team1                     = 6,
	ERER_AlienMode_AlienWin        = 7,
	ERER_AlienMode_HumanWin        = 8
};


// Enum WMission.wInfoPod.EIP_InfoEffect
enum class EIP_InfoEffect : uint8_t
{
	EIPE_Normal                    = 0,
	EIPE_Blink                     = 1,
	EIPE_Pulse                     = 2
};


// Enum WMission.wInfoPod.EIP_InfoType
enum class EIP_InfoType : uint8_t
{
	EIPT_PlainText                 = 0,
	EIPT_TextBrackets              = 1,
	EIPT_Texture                   = 2
};


// Enum WMission.wInfoPod.EIP_AssaultTeam
enum class EIP_AssaultTeam : uint8_t
{
	EIP_All                        = 0,
	EIP_Attackers                  = 1,
	EIP_Defenders                  = 2
};


// Enum WMission.wTrigger_MSMessageTrigger.EPSM_AssaultTeam
enum class EPSM_AssaultTeam : uint8_t
{
	EMT_Attackers                  = 0,
	EMT_Defenders                  = 1,
	EMT_All                        = 2
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct WMission.wAlienController.CoolTimeSkillObject
// 0x0010
struct FCoolTimeSkillObject
{
	float                                              fCurCoolTime;                                             // 0x0000(0x0004)
	float                                              fCurActiveTime;                                           // 0x0004(0x0004)
	unsigned long                                      bIsActive : 1;                                            // 0x0008(0x0004)
	class UwSkill*                                     SkillObject;                                              // 0x000C(0x0004)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
