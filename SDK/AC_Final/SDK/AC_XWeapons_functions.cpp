// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

#include "../SDK.hpp"

namespace Classes
{
//---------------------------------------------------------------------------
//Functions
//---------------------------------------------------------------------------

// Function XWeapons.HitEffect.GetHitEffectByMaterial
// (Defined, Static, Public)
// Parameters:
// class UMaterial*               mVictim                        (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AHitEffect::STATIC_GetHitEffectByMaterial(class UMaterial* mVictim)
{
	static auto fn = UObject::FindObject<UFunction>("Function XWeapons.HitEffect.GetHitEffectByMaterial");

	AHitEffect_GetHitEffectByMaterial_Params params;
	params.mVictim = mVictim;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function XWeapons.HitEffect.GetHitEffect
// (Defined, Static, Public)
// Parameters:
// class AActor*                  Victim                         (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)
// class UClass*                  ReturnValue                    (Parm, OutParm, ReturnParm)

class UClass* AHitEffect::STATIC_GetHitEffect(class AActor* Victim, const struct FVector& HitLocation, const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function XWeapons.HitEffect.GetHitEffect");

	AHitEffect_GetHitEffect_Params params;
	params.Victim = Victim;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
