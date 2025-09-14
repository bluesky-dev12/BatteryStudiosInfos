#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum WWeapons.wWeaponFireInstallPack.EINSTALL_STATE_TYPE
enum class EINSTALL_STATE_TYPE : uint8_t
{
	EINSTALL_STATE_NONE            = 0,
	EINSTALL_STATE_INSTALLING      = 1,
	EINSTALL_STATE_COMPLETE        = 2
};



}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
