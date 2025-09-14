#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum XEffects.xPawnGibGroup.EGibType
enum class EGibType : uint8_t
{
	EGT_Arm_L                      = 0,
	EGT_Arm_R                      = 1,
	EGT_Leg_L                      = 2,
	EGT_Leg_R                      = 3,
	EGT_Head                       = 4,
	EGT_Body                       = 5,
	EGT_Mix                        = 6,
	EGT_None                       = 7
};



}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
