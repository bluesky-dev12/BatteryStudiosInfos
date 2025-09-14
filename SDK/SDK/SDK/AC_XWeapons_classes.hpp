#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class XWeapons.HitEffect
// 0x0080 (0x0458 - 0x03D8)
class AHitEffect : public AEffects
{
public:
	class UClass*                                      HitEffectDefault;                                         // 0x03D8(0x0004) (Edit)
	class UClass*                                      HitEffectETC;                                             // 0x03DC(0x0004) (Edit)
	class UClass*                                      HitEffectrock;                                            // 0x03E0(0x0004) (Edit)
	class UClass*                                      HitEffectbrick;                                           // 0x03E4(0x0004) (Edit)
	class UClass*                                      HitEffectConcrete;                                        // 0x03E8(0x0004) (Edit)
	class UClass*                                      HitEffectDirt;                                            // 0x03EC(0x0004) (Edit)
	class UClass*                                      HitEffectMetal;                                           // 0x03F0(0x0004) (Edit)
	class UClass*                                      HitEffectMetal_PT;                                        // 0x03F4(0x0004) (Edit)
	class UClass*                                      HitEffectWood;                                            // 0x03F8(0x0004) (Edit)
	class UClass*                                      HitEffectPlant;                                           // 0x03FC(0x0004) (Edit)
	class UClass*                                      HitEffectFlesh;                                           // 0x0400(0x0004) (Edit)
	class UClass*                                      HitEffectIce;                                             // 0x0404(0x0004) (Edit)
	class UClass*                                      HitEffectSnow;                                            // 0x0408(0x0004) (Edit)
	class UClass*                                      HitEffectWater;                                           // 0x040C(0x0004) (Edit)
	class UClass*                                      HitEffectGlass;                                           // 0x0410(0x0004) (Edit)
	class UClass*                                      HitEffectcotton;                                          // 0x0414(0x0004) (Edit)
	class UClass*                                      HitEffect_blood_headshot;                                 // 0x0418(0x0004) (Edit)
	class UClass*                                      HitEffect_Blood;                                          // 0x041C(0x0004) (Edit)
	class UClass*                                      HitEffect_blood_death;                                    // 0x0420(0x0004) (Edit)
	class UClass*                                      HitEffect_blood_spurt;                                    // 0x0424(0x0004) (Edit)
	class UClass*                                      HitEffectCrackWood;                                       // 0x0428(0x0004) (Edit)
	class UClass*                                      HitEffectPlastic;                                         // 0x042C(0x0004) (Edit)
	class UClass*                                      HitEffectPaper;                                           // 0x0430(0x0004) (Edit)
	class UClass*                                      HitEffectRubber;                                          // 0x0434(0x0004) (Edit)
	class UClass*                                      HitEffectCarpet;                                          // 0x0438(0x0004) (Edit)
	class UClass*                                      HitEffectLeaves;                                          // 0x043C(0x0004) (Edit)
	class UClass*                                      HitEffectCloth;                                           // 0x0440(0x0004) (Edit)
	class UClass*                                      HitEffectSand;                                            // 0x0444(0x0004) (Edit)
	class UClass*                                      HitEffectMud;                                             // 0x0448(0x0004) (Edit)
	class UClass*                                      HitEffectWaterFoot;                                       // 0x044C(0x0004) (Edit)
	class UClass*                                      HitEffectWaterWall;                                       // 0x0450(0x0004) (Edit)
	class UClass*                                      alien_tankersheld_hit;                                    // 0x0454(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XWeapons.HitEffect");
		return ptr;
	}


	class UClass* STATIC_GetHitEffectByMaterial(class UMaterial* mVictim);
	class UClass* STATIC_GetHitEffect(class AActor* Victim, const struct FVector& HitLocation, const struct FVector& HitNormal);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
