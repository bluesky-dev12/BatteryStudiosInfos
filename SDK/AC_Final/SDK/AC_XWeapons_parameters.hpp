#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Parameters
//---------------------------------------------------------------------------

// Function XWeapons.HitEffect.GetHitEffectByMaterial
struct AHitEffect_GetHitEffectByMaterial_Params
{
	class UMaterial*                                   mVictim;                                                  // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function XWeapons.HitEffect.GetHitEffect
struct AHitEffect_GetHitEffect_Params
{
	class AActor*                                      Victim;                                                   // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
	class UClass*                                      ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
