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

// Class XEffects.HitEffect_Stock_Meleeattack
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Stock_Meleeattack : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Stock_Meleeattack");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.xScorch
// 0x000C (0x0574 - 0x0568)
class AxScorch : public AProjector
{
public:
	float                                              Lifetime;                                                 // 0x0568(0x0004) (Edit)
	float                                              PushBack;                                                 // 0x056C(0x0004) (Edit)
	unsigned long                                      RandomOrient : 1;                                         // 0x0570(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.xScorch");
		return ptr;
	}


	void PostBeginPlay();
	void PreBeginPlay();
};


// Class XEffects.HitEffect_Stock_Meleeattack_Decal
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_Stock_Meleeattack_Decal : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Stock_Meleeattack_Decal");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_Stock_Meleeattack_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Stock_Meleeattack_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Stock_Meleeattack_hit");
		return ptr;
	}

};


// Class XEffects.XWFX_Artillery_explosion
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Artillery_explosion : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Artillery_explosion");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.WFX_ArtilleryTrailSmoke
// 0x0000 (0x0468 - 0x0468)
class AWFX_ArtilleryTrailSmoke : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.WFX_ArtilleryTrailSmoke");
		return ptr;
	}

};


// Class XEffects.Alien_omega_airstrike
// 0x0000 (0x0468 - 0x0468)
class AAlien_omega_airstrike : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_omega_airstrike");
		return ptr;
	}

};


// Class XEffects.RocketCorona
// 0x0000 (0x03D8 - 0x03D8)
class ARocketCorona : public AEffects
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.RocketCorona");
		return ptr;
	}

};


// Class XEffects.RocketMark
// 0x0000 (0x0574 - 0x0574)
class ARocketMark : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.RocketMark");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_SD_Bomb_explosion
// 0x0000 (0x0468 - 0x0468)
class AXWFX_SD_Bomb_explosion : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_SD_Bomb_explosion");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_knife_Meleeattack
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_knife_Meleeattack : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_knife_Meleeattack");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_dirt
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_dirt : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_dirt");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_grass
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_grass : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_grass");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_metal
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_metal : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_metal");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_snow
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_snow : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_snow");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_water
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_water : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_water");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_wood
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_wood : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_wood");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_knife_Meleeattack_Decal
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_knife_Meleeattack_Decal : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_knife_Meleeattack_Decal");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_knife_Meleeattack_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_knife_Meleeattack_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_knife_Meleeattack_hit");
		return ptr;
	}

};


// Class XEffects.WFX_RocketTrailSmoke
// 0x0000 (0x0468 - 0x0468)
class AWFX_RocketTrailSmoke : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.WFX_RocketTrailSmoke");
		return ptr;
	}

};


// Class XEffects.XWFX_Time_C4_explosion
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Time_C4_explosion : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Time_C4_explosion");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Stun_explosion
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Stun_explosion : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Stun_explosion");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.WFX_PinpointBomb_redmark
// 0x0000 (0x0468 - 0x0468)
class AWFX_PinpointBomb_redmark : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.WFX_PinpointBomb_redmark");
		return ptr;
	}

};


// Class XEffects.XWFX_Grenade_smoke
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_smoke : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_smoke");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_heli_attack_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_heli_attack_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_heli_attack_hit");
		return ptr;
	}

};


// Class XEffects.WFX_HeliTrailSmoke
// 0x0000 (0x0468 - 0x0468)
class AWFX_HeliTrailSmoke : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.WFX_HeliTrailSmoke");
		return ptr;
	}

};


// Class XEffects.Alien_Kappa_Lamda_beam
// 0x0000 (0x0468 - 0x0468)
class AAlien_Kappa_Lamda_beam : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Kappa_Lamda_beam");
		return ptr;
	}

};


// Class XEffects.HitEffect_heli_attack_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_heli_attack_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_heli_attack_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.WFX_HeliRocketSmoke
// 0x0000 (0x0468 - 0x0468)
class AWFX_HeliRocketSmoke : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.WFX_HeliRocketSmoke");
		return ptr;
	}

};


// Class XEffects.Alien_Kappa_Lamda_ball
// 0x0000 (0x0468 - 0x0468)
class AAlien_Kappa_Lamda_ball : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Kappa_Lamda_ball");
		return ptr;
	}

};


// Class XEffects.RocketMark_gr
// 0x0000 (0x0574 - 0x0574)
class ARocketMark_gr : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.RocketMark_gr");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_IncGrenade_explosion
// 0x0000 (0x0468 - 0x0468)
class AXWFX_IncGrenade_explosion : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_IncGrenade_explosion");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_IncGrenade_Flame_Ally
// 0x0000 (0x0468 - 0x0468)
class AXWFX_IncGrenade_Flame_Ally : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_IncGrenade_Flame_Ally");
		return ptr;
	}


	void Tick(float DeltaTime);
	void PostBeginPlay();
};


// Class XEffects.XWFX_IncGrenade_Flame_Enemy
// 0x0000 (0x0468 - 0x0468)
class AXWFX_IncGrenade_Flame_Enemy : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_IncGrenade_Flame_Enemy");
		return ptr;
	}


	void Tick(float DeltaTime);
	void PostBeginPlay();
};


// Class XEffects.XWFX_SplitGrenade
// 0x0000 (0x0468 - 0x0468)
class AXWFX_SplitGrenade : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_SplitGrenade");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_SplitGndFragment_explo
// 0x0000 (0x0468 - 0x0468)
class AXWFX_SplitGndFragment_explo : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_SplitGndFragment_explo");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.WFX_PinpointBombTrailSmoke
// 0x0000 (0x0468 - 0x0468)
class AWFX_PinpointBombTrailSmoke : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.WFX_PinpointBombTrailSmoke");
		return ptr;
	}

};


// Class XEffects.XWFX_Grenade_explosion_XMAS
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_XMAS : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_XMAS");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.Event_Cash_Gacha_XMAS_GR_mark_01
// 0x0000 (0x0574 - 0x0574)
class AEvent_Cash_Gacha_XMAS_GR_mark_01 : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Event_Cash_Gacha_XMAS_GR_mark_01");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_SemtexGrenade_explo
// 0x0000 (0x0468 - 0x0468)
class AXWFX_SemtexGrenade_explo : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_SemtexGrenade_explo");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.SemtexGrenade_Glow_Red_3rd
// 0x0000 (0x0468 - 0x0468)
class ASemtexGrenade_Glow_Red_3rd : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SemtexGrenade_Glow_Red_3rd");
		return ptr;
	}

};


// Class XEffects.SemtexGrenade_Glow_Green_1st
// 0x0000 (0x0468 - 0x0468)
class ASemtexGrenade_Glow_Green_1st : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SemtexGrenade_Glow_Green_1st");
		return ptr;
	}

};


// Class XEffects.SemtexGrenade_Glow_Green_3rd
// 0x0000 (0x0468 - 0x0468)
class ASemtexGrenade_Glow_Green_3rd : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SemtexGrenade_Glow_Green_3rd");
		return ptr;
	}

};


// Class XEffects.HitEffect_alien_meleeattack_Left
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_alien_meleeattack_Left : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_meleeattack_Left");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_alien_meleeattack_Right
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_alien_meleeattack_Right : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_meleeattack_Right");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_alien_meleeattack_Right_Decal
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_alien_meleeattack_Right_Decal : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_meleeattack_Right_Decal");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_alien_meleeattack_Right_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_alien_meleeattack_Right_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_meleeattack_Right_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_alien_meleeattack_Left_Decal
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_alien_meleeattack_Left_Decal : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_meleeattack_Left_Decal");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_alien_meleeattack_Left_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_alien_meleeattack_Left_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_meleeattack_Left_hit");
		return ptr;
	}

};


// Class XEffects.XWFX_Grenade_explosion_valentine
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_valentine : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_valentine");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.Event_Cash_Gacha_Valentine_GR_mark_01
// 0x0000 (0x0574 - 0x0574)
class AEvent_Cash_Gacha_Valentine_GR_mark_01 : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Event_Cash_Gacha_Valentine_GR_mark_01");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_alien_Tanker_meleeattack
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_alien_Tanker_meleeattack : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_Tanker_meleeattack");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_alien_Tanker_meleeattack_decal
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_alien_Tanker_meleeattack_decal : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_Tanker_meleeattack_decal");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_alien_Tanker_meleeattack_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_alien_Tanker_meleeattack_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_alien_Tanker_meleeattack_hit");
		return ptr;
	}

};


// Class XEffects.Alien_Nemesis_Beam_explo
// 0x0000 (0x0468 - 0x0468)
class AAlien_Nemesis_Beam_explo : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Nemesis_Beam_explo");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.Alien_Nemesis_Beam
// 0x0000 (0x0468 - 0x0468)
class AAlien_Nemesis_Beam : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Nemesis_Beam");
		return ptr;
	}

};


// Class XEffects.XWFX_Alien_Nemesis_Flame
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Alien_Nemesis_Flame : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Alien_Nemesis_Flame");
		return ptr;
	}


	void Tick(float DeltaTime);
	void PostBeginPlay();
};


// Class XEffects.Alien_Nemesis_Special_ball_explo
// 0x0000 (0x0468 - 0x0468)
class AAlien_Nemesis_Special_ball_explo : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Nemesis_Special_ball_explo");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.Alien_Nemesis_Special_ball
// 0x0000 (0x0468 - 0x0468)
class AAlien_Nemesis_Special_ball : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Nemesis_Special_ball");
		return ptr;
	}

};


// Class XEffects.XWFX_Alien_Nemesis_Special_Flame
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Alien_Nemesis_Special_Flame : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Alien_Nemesis_Special_Flame");
		return ptr;
	}


	void Tick(float DeltaTime);
	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_easter_A
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_easter_A : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_easter_A");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.Event_Cash_Gacha_Easter_GR_mark_01
// 0x0000 (0x0574 - 0x0574)
class AEvent_Cash_Gacha_Easter_GR_mark_01 : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Event_Cash_Gacha_Easter_GR_mark_01");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.XWFX_Grenade_explosion_easter_B
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Grenade_explosion_easter_B : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Grenade_explosion_easter_B");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.Event_Cash_Gacha_Easter_GR_mark_02
// 0x0000 (0x0574 - 0x0574)
class AEvent_Cash_Gacha_Easter_GR_mark_02 : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Event_Cash_Gacha_Easter_GR_mark_02");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.Charater_FX_Strobo_light_Blue
// 0x0000 (0x0468 - 0x0468)
class ACharater_FX_Strobo_light_Blue : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Charater_FX_Strobo_light_Blue");
		return ptr;
	}

};


// Class XEffects.xPawnGibGroup
// 0x0048 (0x0074 - 0x002C)
class UxPawnGibGroup : public UObject
{
public:
	TArray<class UClass*>                              Gibs;                                                     // 0x002C(0x000C) (Edit, NeedCtorLink)
	class UClass*                                      BloodHitClass;                                            // 0x0038(0x0004)
	class UClass*                                      BloodHitHeadshotClass;                                    // 0x003C(0x0004)
	class UClass*                                      BloodHitClass_01;                                         // 0x0040(0x0004)
	class UClass*                                      BloodHitClass_02;                                         // 0x0044(0x0004)
	class UClass*                                      Teen_BloodHitClass;                                       // 0x0048(0x0004)
	class UClass*                                      Teen_BloodHitHeadshotClass;                               // 0x004C(0x0004)
	class UClass*                                      Teen_BloodHitClass_01;                                    // 0x0050(0x0004)
	class UClass*                                      Teen_BloodHitClass_02;                                    // 0x0054(0x0004)
	class UClass*                                      BloodGibClass;                                            // 0x0058(0x0004)
	class UClass*                                      BloodEmitClass;                                           // 0x005C(0x0004)
	class UClass*                                      HelicopterHitClass;                                       // 0x0060(0x0004)
	class UClass*                                      IdentificationFriendClass;                                // 0x0064(0x0004)
	struct FString                                     GibSounds;                                                // 0x0068(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.xPawnGibGroup");
		return ptr;
	}


	struct FString STATIC_GibSound();
	class UClass* STATIC_GetBloodEmitClass();
	class UClass* STATIC_GetGibClass(TEnumAsByte<EGibType> gibType);
	void STATIC_PrecacheContent(class ALevelInfo* Level);
};


// Class XEffects.Gib
// 0x0024 (0x03FC - 0x03D8)
class AGib : public AActor
{
public:
	class UClass*                                      GibGroupClass;                                            // 0x03D8(0x0004)
	class UClass*                                      TrailClass;                                               // 0x03DC(0x0004) (Edit)
	class AwEmitter*                                   Trail;                                                    // 0x03E0(0x0004) (Edit)
	float                                              DampenFactor;                                             // 0x03E4(0x0004) (Edit)
	struct FString                                     HitSounds;                                                // 0x03E8(0x000C) (NeedCtorLink)
	unsigned long                                      bFlaming : 1;                                             // 0x03F4(0x0004)
	class UClass*                                      GibBloodClass;                                            // 0x03F8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Gib");
		return ptr;
	}


	void SetTeam(const struct FString& strSTMeshName);
	void SpawnTrail();
	void HitWall(const struct FVector& HitNormal, class AActor* Wall, class UMaterial* HitMaterial);
	void Landed(const struct FVector& HitNormal);
	void RandSpin(float spinRate);
	void Destroyed();
};


// Class XEffects.Alien_Nemesis_LastAttack
// 0x0000 (0x0468 - 0x0468)
class AAlien_Nemesis_LastAttack : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Nemesis_LastAttack");
		return ptr;
	}

};


// Class XEffects.Alien_Nemesis_BeamReserve
// 0x0000 (0x0468 - 0x0468)
class AAlien_Nemesis_BeamReserve : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Nemesis_BeamReserve");
		return ptr;
	}

};


// Class XEffects.Alien_Nemesis_Death
// 0x0000 (0x0468 - 0x0468)
class AAlien_Nemesis_Death : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_Nemesis_Death");
		return ptr;
	}

};


// Class XEffects.HitFlameBig
// 0x0000 (0x05C8 - 0x05C8)
class AHitFlameBig : public AwEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitFlameBig");
		return ptr;
	}


	void PostNetBeginPlay();
	void Timer();
};


// Class XEffects.BloodSpurt
// 0x0028 (0x05F0 - 0x05C8)
class ABloodSpurt : public AwEmitter
{
public:
	class UClass*                                      BloodDecalClass;                                          // 0x05C8(0x0004)
	class UTexture*                                    Splats[0x4];                                              // 0x05CC(0x0004)
	struct FVector                                     HitDir;                                                   // 0x05DC(0x000C) (Net)
	unsigned long                                      bMustShow : 1;                                            // 0x05E8(0x0004) (Net)
	class UClass*                                      HitEffectClass;                                           // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.BloodHit_spurt
// 0x0000 (0x05F0 - 0x05F0)
class ABloodHit_spurt : public ABloodSpurt
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodHit_spurt");
		return ptr;
	}


	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.GibArmL
// 0x0000 (0x03FC - 0x03FC)
class AGibArmL : public AGib
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.GibArmL");
		return ptr;
	}


	void SetTeam(const struct FString& strSTMeshName);
};


// Class XEffects.GibArmR
// 0x0000 (0x03FC - 0x03FC)
class AGibArmR : public AGib
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.GibArmR");
		return ptr;
	}


	void SetTeam(const struct FString& strSTMeshName);
};


// Class XEffects.GibLegL
// 0x0000 (0x03FC - 0x03FC)
class AGibLegL : public AGib
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.GibLegL");
		return ptr;
	}


	void SetTeam(const struct FString& strSTMeshName);
};


// Class XEffects.GibLegR
// 0x0000 (0x03FC - 0x03FC)
class AGibLegR : public AGib
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.GibLegR");
		return ptr;
	}


	void SetTeam(const struct FString& strSTMeshName);
};


// Class XEffects.GibHead
// 0x0000 (0x03FC - 0x03FC)
class AGibHead : public AGib
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.GibHead");
		return ptr;
	}


	void SetTeam(const struct FString& strSTMeshName);
};


// Class XEffects.GibOrganicRedTorso
// 0x0000 (0x03FC - 0x03FC)
class AGibOrganicRedTorso : public AGib
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.GibOrganicRedTorso");
		return ptr;
	}

};


// Class XEffects.BloodSpurt_Headshot
// 0x0000 (0x05F0 - 0x05F0)
class ABloodSpurt_Headshot : public ABloodSpurt
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Headshot");
		return ptr;
	}

};


// Class XEffects.BloodSmallHit_A
// 0x0000 (0x05F0 - 0x05F0)
class ABloodSmallHit_A : public ABloodSpurt
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSmallHit_A");
		return ptr;
	}


	void PostNetBeginPlay();
};


// Class XEffects.BloodSmallHit_B
// 0x0000 (0x05F0 - 0x05F0)
class ABloodSmallHit_B : public ABloodSpurt
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSmallHit_B");
		return ptr;
	}


	void PostNetBeginPlay();
};


// Class XEffects.BloodSpurt_Teen
// 0x0028 (0x05F0 - 0x05C8)
class ABloodSpurt_Teen : public AwEmitter
{
public:
	class UClass*                                      BloodDecalClass;                                          // 0x05C8(0x0004)
	class UTexture*                                    Splats[0x4];                                              // 0x05CC(0x0004)
	struct FVector                                     HitDir;                                                   // 0x05DC(0x000C) (Net)
	unsigned long                                      bMustShow : 1;                                            // 0x05E8(0x0004) (Net)
	class UClass*                                      HitEffectClass;                                           // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Teen");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSpurt_Headshot_Teen
// 0x0000 (0x05F0 - 0x05F0)
class ABloodSpurt_Headshot_Teen : public ABloodSpurt_Teen
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Headshot_Teen");
		return ptr;
	}

};


// Class XEffects.BloodExplosion
// 0x0000 (0x05C8 - 0x05C8)
class ABloodExplosion : public AwEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodExplosion");
		return ptr;
	}

};


// Class XEffects.BloodJet
// 0x0004 (0x05CC - 0x05C8)
class ABloodJet : public AwEmitter
{
public:
	class UClass*                                      SplatterClass;                                            // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodJet");
		return ptr;
	}


	void WallSplat();
	void PostNetBeginPlay();
	void Timer();
};


// Class XEffects.HelicopterHitEffect
// 0x0004 (0x05CC - 0x05C8)
class AHelicopterHitEffect : public AwEmitter
{
public:
	class UClass*                                      HitEffectClass;                                           // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HelicopterHitEffect");
		return ptr;
	}


	void PostNetBeginPlay();
};


// Class XEffects.BloodSplatter
// 0x0010 (0x0584 - 0x0574)
class ABloodSplatter : public AxScorch
{
public:
	class UTexture*                                    Splats[0x4];                                              // 0x0574(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSplatter");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_Blood
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Blood : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Blood");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSplatter_Teen
// 0x0010 (0x0584 - 0x0574)
class ABloodSplatter_Teen : public AxScorch
{
public:
	class UTexture*                                    Splats[0x4];                                              // 0x0574(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSplatter_Teen");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_Teen_Blood
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Teen_Blood : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Teen_Blood");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_blood_spurt
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_spurt : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_spurt");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Metal
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Metal : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Metal");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_blood_headshot
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_headshot : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_headshot");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_teen_blood_headshot
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_teen_blood_headshot : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_teen_blood_headshot");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.pclSmoke
// 0x0000 (0x05C8 - 0x05C8)
class ApclSmoke : public AwEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.pclSmoke");
		return ptr;
	}

};


// Class XEffects.TransTrail
// 0x0000 (0x05C8 - 0x05C8)
class ATransTrail : public ApclSmoke
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.TransTrail");
		return ptr;
	}

};


// Class XEffects.TransTrail_Beam
// 0x0000 (0x05C8 - 0x05C8)
class ATransTrail_Beam : public ATransTrail
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.TransTrail_Beam");
		return ptr;
	}

};


// Class XEffects.HitEffect_Teen_blood_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Teen_blood_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Teen_blood_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_teen_blood_headshot_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_teen_blood_headshot_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_teen_blood_headshot_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_blood_headshot_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_blood_headshot_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_headshot_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_Blood_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Blood_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Blood_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_metal_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_metal_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_metal_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_Metal_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Metal_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Metal_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_Concrete_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_Concrete_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Concrete_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_blood_spurt_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_blood_spurt_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_spurt_hit");
		return ptr;
	}

};


// Class XEffects.BG_FX_dust_sand
// 0x0000 (0x0468 - 0x0468)
class ABG_FX_dust_sand : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BG_FX_dust_sand");
		return ptr;
	}

};


// Class XEffects.BG_FX_flares_red
// 0x0000 (0x0468 - 0x0468)
class ABG_FX_flares_red : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BG_FX_flares_red");
		return ptr;
	}

};


// Class XEffects.BG_FX_flares_green
// 0x0000 (0x0468 - 0x0468)
class ABG_FX_flares_green : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BG_FX_flares_green");
		return ptr;
	}

};


// Class XEffects.BG_FX_ItemBox_Artil_red
// 0x0000 (0x0468 - 0x0468)
class ABG_FX_ItemBox_Artil_red : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BG_FX_ItemBox_Artil_red");
		return ptr;
	}

};


// Class XEffects.BG_FX_deco_box_paper01
// 0x0000 (0x0468 - 0x0468)
class ABG_FX_deco_box_paper01 : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BG_FX_deco_box_paper01");
		return ptr;
	}

};


// Class XEffects.BG_FX_eagle
// 0x0000 (0x0468 - 0x0468)
class ABG_FX_eagle : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BG_FX_eagle");
		return ptr;
	}

};


// Class XEffects.Warfare_Tracer
// 0x0000 (0x0468 - 0x0468)
class AWarfare_Tracer : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Warfare_Tracer");
		return ptr;
	}


	void SpawnParticle(int Amount);
};


// Class XEffects.xAlienPawnGidGroup
// 0x003C (0x00B0 - 0x0074)
class UxAlienPawnGidGroup : public UxPawnGibGroup
{
public:
	class UClass*                                      BloodHitClass_Alpha;                                      // 0x0074(0x0004)
	class UClass*                                      BloodHitClass_Gamma;                                      // 0x0078(0x0004)
	class UClass*                                      BloodHitClass_Eta;                                        // 0x007C(0x0004)
	class UClass*                                      BloodHitClass_Kappa;                                      // 0x0080(0x0004)
	class UClass*                                      BloodHitClass_Omega;                                      // 0x0084(0x0004)
	class UClass*                                      TransEffectClass_ToAlien;                                 // 0x0088(0x0004)
	class UClass*                                      TransEffectClass_ToHero;                                  // 0x008C(0x0004)
	class UClass*                                      TransEffectClass_ToAlien_1st;                             // 0x0090(0x0004)
	class UClass*                                      TransEffectClass_ToHero_1st;                              // 0x0094(0x0004)
	class UClass*                                      EffectClass_DefenceSuccessFromInfection;                  // 0x0098(0x0004)
	class UClass*                                      BreathingEffectClass;                                     // 0x009C(0x0004)
	class UClass*                                      LevelupEffectClass[0x3];                                  // 0x00A0(0x0004)
	class UClass*                                      TankerShieldEffectClass;                                  // 0x00AC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.xAlienPawnGidGroup");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
};


// Class XEffects.XWFX_Alien_death_explosion
// 0x0000 (0x0468 - 0x0468)
class AXWFX_Alien_death_explosion : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.XWFX_Alien_death_explosion");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.BloodSpurt_Alien
// 0x0028 (0x05F0 - 0x05C8)
class ABloodSpurt_Alien : public AwEmitter
{
public:
	class UClass*                                      BloodDecalClass;                                          // 0x05C8(0x0004)
	class UTexture*                                    Splats[0x4];                                              // 0x05CC(0x0004)
	struct FVector                                     HitDir;                                                   // 0x05DC(0x000C) (Net)
	unsigned long                                      bMustShow : 1;                                            // 0x05E8(0x0004) (Net)
	class UClass*                                      HitEffectClass;                                           // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Alien");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSpurt_Alien_Gamma
// 0x0028 (0x05F0 - 0x05C8)
class ABloodSpurt_Alien_Gamma : public AwEmitter
{
public:
	class UClass*                                      BloodDecalClass;                                          // 0x05C8(0x0004)
	class UTexture*                                    Splats[0x4];                                              // 0x05CC(0x0004)
	struct FVector                                     HitDir;                                                   // 0x05DC(0x000C) (Net)
	unsigned long                                      bMustShow : 1;                                            // 0x05E8(0x0004) (Net)
	class UClass*                                      HitEffectClass;                                           // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Alien_Gamma");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSpurt_Alien_Eta
// 0x0028 (0x05F0 - 0x05C8)
class ABloodSpurt_Alien_Eta : public AwEmitter
{
public:
	class UClass*                                      BloodDecalClass;                                          // 0x05C8(0x0004)
	class UTexture*                                    Splats[0x4];                                              // 0x05CC(0x0004)
	struct FVector                                     HitDir;                                                   // 0x05DC(0x000C) (Net)
	unsigned long                                      bMustShow : 1;                                            // 0x05E8(0x0004) (Net)
	class UClass*                                      HitEffectClass;                                           // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Alien_Eta");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSpurt_Alien_Kappa
// 0x0028 (0x05F0 - 0x05C8)
class ABloodSpurt_Alien_Kappa : public AwEmitter
{
public:
	class UClass*                                      BloodDecalClass;                                          // 0x05C8(0x0004)
	class UTexture*                                    Splats[0x4];                                              // 0x05CC(0x0004)
	struct FVector                                     HitDir;                                                   // 0x05DC(0x000C) (Net)
	unsigned long                                      bMustShow : 1;                                            // 0x05E8(0x0004) (Net)
	class UClass*                                      HitEffectClass;                                           // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Alien_Kappa");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSpurt_Alien_Omega
// 0x0028 (0x05F0 - 0x05C8)
class ABloodSpurt_Alien_Omega : public AwEmitter
{
public:
	class UClass*                                      BloodDecalClass;                                          // 0x05C8(0x0004)
	class UTexture*                                    Splats[0x4];                                              // 0x05CC(0x0004)
	struct FVector                                     HitDir;                                                   // 0x05DC(0x000C) (Net)
	unsigned long                                      bMustShow : 1;                                            // 0x05E8(0x0004) (Net)
	class UClass*                                      HitEffectClass;                                           // 0x05EC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSpurt_Alien_Omega");
		return ptr;
	}


	void STATIC_PrecacheContent(class ALevelInfo* Level);
	void WallSplat();
	void PostNetBeginPlay();
};


// Class XEffects.Alien_transformation
// 0x0000 (0x0468 - 0x0468)
class AAlien_transformation : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_transformation");
		return ptr;
	}

};


// Class XEffects.Hero_transformation
// 0x0000 (0x0468 - 0x0468)
class AHero_transformation : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Hero_transformation");
		return ptr;
	}

};


// Class XEffects.Alien_transformation_1ST
// 0x0000 (0x0468 - 0x0468)
class AAlien_transformation_1ST : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_transformation_1ST");
		return ptr;
	}

};


// Class XEffects.Hero_transformation_1ST
// 0x0000 (0x0468 - 0x0468)
class AHero_transformation_1ST : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Hero_transformation_1ST");
		return ptr;
	}

};


// Class XEffects.Alien_infection_defence
// 0x0000 (0x0468 - 0x0468)
class AAlien_infection_defence : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Alien_infection_defence");
		return ptr;
	}

};


// Class XEffects.alien_breath
// 0x0000 (0x0468 - 0x0468)
class Aalien_breath : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.alien_breath");
		return ptr;
	}

};


// Class XEffects.Human_level_up_light_01
// 0x0000 (0x0468 - 0x0468)
class AHuman_level_up_light_01 : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Human_level_up_light_01");
		return ptr;
	}

};


// Class XEffects.Human_level_up_light_02
// 0x0000 (0x0468 - 0x0468)
class AHuman_level_up_light_02 : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Human_level_up_light_02");
		return ptr;
	}

};


// Class XEffects.Human_level_up_light_03
// 0x0000 (0x0468 - 0x0468)
class AHuman_level_up_light_03 : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Human_level_up_light_03");
		return ptr;
	}

};


// Class XEffects.alien_tankersheld
// 0x0000 (0x0468 - 0x0468)
class Aalien_tankersheld : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.alien_tankersheld");
		return ptr;
	}

};


// Class XEffects.HitEffect_Default
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Default : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Default");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_ETC
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_ETC : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_ETC");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_rock
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_rock : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_rock");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_brick
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_brick : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_brick");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Concrete
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Concrete : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Concrete");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Dirt
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Dirt : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Dirt");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Metal_PT
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Metal_PT : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Metal_PT");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Wood
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Wood : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Wood");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_plant
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_plant : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_plant");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_flesh
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_flesh : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_flesh");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_snow
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_snow : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_snow");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_water
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_water : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_water");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_glass
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_glass : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_glass");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_cotton
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_cotton : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_cotton");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_blood_death
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_death : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_death");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_CrackWood
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_CrackWood : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_CrackWood");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Plastic
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Plastic : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Plastic");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Paper
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Paper : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Paper");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Rubber
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Rubber : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Rubber");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Carpet
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Carpet : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Carpet");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Leaves
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Leaves : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Leaves");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Cloth
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Cloth : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Cloth");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Sand
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Sand : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Sand");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_Mud
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_Mud : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Mud");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_WaterFoot
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_WaterFoot : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_WaterFoot");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_water_wall
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_water_wall : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_water_wall");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.alien_tankersheld_hit
// 0x000C (0x03E4 - 0x03D8)
class Aalien_tankersheld_hit : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.alien_tankersheld_hit");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_rock_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_rock_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_rock_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_rock_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_rock_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_rock_hit");
		return ptr;
	}

};


// Class XEffects.BloodSplatter_Alien_Gamma
// 0x0010 (0x0584 - 0x0574)
class ABloodSplatter_Alien_Gamma : public AxScorch
{
public:
	class UTexture*                                    Splats[0x4];                                              // 0x0574(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSplatter_Alien_Gamma");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_blood_Alien_Gamma
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_Alien_Gamma : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_Alien_Gamma");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSplatter_Alien_Eta
// 0x0010 (0x0584 - 0x0574)
class ABloodSplatter_Alien_Eta : public AxScorch
{
public:
	class UTexture*                                    Splats[0x4];                                              // 0x0574(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSplatter_Alien_Eta");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_blood_Alien_Eta
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_Alien_Eta : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_Alien_Eta");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSplatter_Alien
// 0x0010 (0x0584 - 0x0574)
class ABloodSplatter_Alien : public AxScorch
{
public:
	class UTexture*                                    Splats[0x4];                                              // 0x0574(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSplatter_Alien");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_blood_Alien
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_Alien : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_Alien");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_blood_Alien_Kappa
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_Alien_Kappa : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_Alien_Kappa");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.BloodSplatter_Alien_Omega
// 0x0010 (0x0584 - 0x0574)
class ABloodSplatter_Alien_Omega : public AxScorch
{
public:
	class UTexture*                                    Splats[0x4];                                              // 0x0574(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.BloodSplatter_Alien_Omega");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_blood_Alien_Omega
// 0x000C (0x03E4 - 0x03D8)
class AHitEffect_blood_Alien_Omega : public AEffects
{
public:
	struct FString                                     ImpactSound;                                              // 0x03D8(0x000C) (NeedCtorLink)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_Alien_Omega");
		return ptr;
	}


	void SpawnEffects();
	void PostNetBeginPlay();
};


// Class XEffects.HitEffect_blood_death_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_blood_death_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_death_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_cotton_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_cotton_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_cotton_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_cotton_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_cotton_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_cotton_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_glass_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_glass_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_glass_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_glass_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_glass_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_glass_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_metal_pt_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_metal_pt_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_metal_pt_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_Metal_PT_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Metal_PT_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Metal_PT_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_dirt_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_dirt_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_dirt_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_Dirt_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Dirt_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Dirt_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_ETC_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_ETC_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_ETC_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_ETC_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_ETC_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_ETC_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_flesh_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_flesh_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_flesh_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_flesh_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_flesh_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_flesh_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_plant_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_plant_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_plant_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_plant_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_plant_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_plant_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_snow_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_snow_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_snow_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_snow_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_snow_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_snow_hit");
		return ptr;
	}

};


// Class XEffects.alien_tankersheld_hit_BulletHole
// 0x0000 (0x0574 - 0x0574)
class Aalien_tankersheld_hit_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.alien_tankersheld_hit_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.alien_tankersheld_hiteffect
// 0x0000 (0x0468 - 0x0468)
class Aalien_tankersheld_hiteffect : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.alien_tankersheld_hiteffect");
		return ptr;
	}

};


// Class XEffects.HitEffect_brick_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_brick_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_brick_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_brick_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_brick_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_brick_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_wood_BulletHole
// 0x0000 (0x0574 - 0x0574)
class AHitEffect_wood_BulletHole : public AxScorch
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_wood_BulletHole");
		return ptr;
	}


	void PostBeginPlay();
};


// Class XEffects.HitEffect_Wood_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Wood_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Wood_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_Concrete_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_Concrete_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_Concrete_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_water_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_water_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_water_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_water_wall_hit
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_water_wall_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_water_wall_hit");
		return ptr;
	}

};


// Class XEffects.HitEffect_blood_hit_Alien_Omega
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_blood_hit_Alien_Omega : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_hit_Alien_Omega");
		return ptr;
	}

};


// Class XEffects.HitEffect_blood_hit_Alien_Kappa
// 0x0000 (0x0468 - 0x0468)
class AHitEffect_blood_hit_Alien_Kappa : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.HitEffect_blood_hit_Alien_Kappa");
		return ptr;
	}

};


// Class XEffects.alien_HitEffect_Blood_hit
// 0x0000 (0x0468 - 0x0468)
class Aalien_HitEffect_Blood_hit : public AEmitter
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.alien_HitEffect_Blood_hit");
		return ptr;
	}

};


// Class XEffects.ShellSpewer
// 0x0004 (0x05CC - 0x05C8)
class AShellSpewer : public AwEmitter
{
public:
	class USound*                                      ShellImpactSnd;                                           // 0x05C8(0x0004) (Edit)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
	void CollisionSound();
};


// Class XEffects.ShellSpewer_762
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_762 : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_762");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_762_3rd
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_762_3rd : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_762_3rd");
		return ptr;
	}

};


// Class XEffects.AR_MuzFlash_01_1RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_01_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_01_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_01_3RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_01_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_01_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AssaultMuzzleSmoke
// 0x0004 (0x05CC - 0x05C8)
class AAssaultMuzzleSmoke : public AwEmitter
{
public:
	int                                                mNumPerFire;                                              // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AssaultMuzzleSmoke");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_smoke_3RD
// 0x0000 (0x0468 - 0x0468)
class AAR_MuzFlash_smoke_3RD : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_smoke_3RD");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_127
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_127 : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_127");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_127_3rd
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_127_3rd : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_127_3rd");
		return ptr;
	}

};


// Class XEffects.SR_MuzFlash_02_1RD
// 0x0004 (0x05CC - 0x05C8)
class ASR_MuzFlash_02_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SR_MuzFlash_02_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SR_MuzFlash_02_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASR_MuzFlash_02_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SR_MuzFlash_02_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SR_MuzFlash_smoke_3RD
// 0x0000 (0x0468 - 0x0468)
class ASR_MuzFlash_smoke_3RD : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SR_MuzFlash_smoke_3RD");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_9
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_9 : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_9");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_9_3rd
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_9_3rd : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_9_3rd");
		return ptr;
	}

};


// Class XEffects.Pistol_MuzFlash_01_1rd
// 0x0004 (0x05CC - 0x05C8)
class APistol_MuzFlash_01_1rd : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Pistol_MuzFlash_01_1rd");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.Pistol_MuzFlash_01_3rd
// 0x0004 (0x05CC - 0x05C8)
class APistol_MuzFlash_01_3rd : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Pistol_MuzFlash_01_3rd");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.PistolMuzzleSmoke
// 0x0004 (0x05CC - 0x05C8)
class APistolMuzzleSmoke : public AwEmitter
{
public:
	int                                                mNumPerFire;                                              // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.PistolMuzzleSmoke");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.Pistol_MuzFlash_smoke_3RD
// 0x0000 (0x0468 - 0x0468)
class APistol_MuzFlash_smoke_3RD : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Pistol_MuzFlash_smoke_3RD");
		return ptr;
	}

};


// Class XEffects.EF_Flash_M2B_Fire
// 0x0004 (0x05CC - 0x05C8)
class AEF_Flash_M2B_Fire : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.EF_Flash_M2B_Fire");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.EF_Flash_3rd_M2B_Fire
// 0x0004 (0x05CC - 0x05C8)
class AEF_Flash_3rd_M2B_Fire : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.EF_Flash_3rd_M2B_Fire");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.EF_Flash_3rd_M2B_smoke
// 0x0000 (0x0468 - 0x0468)
class AEF_Flash_3rd_M2B_smoke : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.EF_Flash_3rd_M2B_smoke");
		return ptr;
	}

};


// Class XEffects.SMG_MuzFlash_01_1RD
// 0x0004 (0x05CC - 0x05C8)
class ASMG_MuzFlash_01_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SMG_MuzFlash_01_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SMG_MuzFlash_01_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASMG_MuzFlash_01_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SMG_MuzFlash_01_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SMG_MuzFlash_smoke_3RD
// 0x0000 (0x0468 - 0x0468)
class ASMG_MuzFlash_smoke_3RD : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SMG_MuzFlash_smoke_3RD");
		return ptr;
	}

};


// Class XEffects.RPG_MuzFlash_1RD
// 0x0000 (0x0468 - 0x0468)
class ARPG_MuzFlash_1RD : public AEmitterFirstPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.RPG_MuzFlash_1RD");
		return ptr;
	}

};


// Class XEffects.RPG_MuzFlash_smoke_F_3RD
// 0x0000 (0x0468 - 0x0468)
class ARPG_MuzFlash_smoke_F_3RD : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.RPG_MuzFlash_smoke_F_3RD");
		return ptr;
	}

};


// Class XEffects.RPG_MuzzleSmoke_1RD
// 0x0004 (0x05CC - 0x05C8)
class ARPG_MuzzleSmoke_1RD : public AwEmitter
{
public:
	int                                                mNumPerFire;                                              // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.RPG_MuzzleSmoke_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_02_1RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_02_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_02_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_02_3RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_02_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_02_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SR_MuzFlash_04_1RD
// 0x0004 (0x05CC - 0x05C8)
class ASR_MuzFlash_04_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SR_MuzFlash_04_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SR_MuzFlash_04_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASR_MuzFlash_04_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SR_MuzFlash_04_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_03_1RD_M4A1
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_03_1RD_M4A1 : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_03_1RD_M4A1");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_03_3RD_M4A1
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_03_3RD_M4A1 : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_03_3RD_M4A1");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SMG_MuzFlash_03_1RD
// 0x0004 (0x05CC - 0x05C8)
class ASMG_MuzFlash_03_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SMG_MuzFlash_03_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SMG_MuzFlash_03_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASMG_MuzFlash_03_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SMG_MuzFlash_03_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SR_MuzFlash_01_1RD
// 0x0004 (0x05CC - 0x05C8)
class ASR_MuzFlash_01_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SR_MuzFlash_01_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SR_MuzFlash_01_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASR_MuzFlash_01_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SR_MuzFlash_01_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SMG_MuzFlash_02_1RD
// 0x0004 (0x05CC - 0x05C8)
class ASMG_MuzFlash_02_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SMG_MuzFlash_02_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SMG_MuzFlash_02_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASMG_MuzFlash_02_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SMG_MuzFlash_02_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.ShellSpewer_MG
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_MG : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_MG");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_MG_3rd
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_MG_3rd : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_MG_3rd");
		return ptr;
	}

};


// Class XEffects.Heli_Gun_MuzFlash_3RD
// 0x0000 (0x0468 - 0x0468)
class AHeli_Gun_MuzFlash_3RD : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Heli_Gun_MuzFlash_3RD");
		return ptr;
	}

};


// Class XEffects.Heli_RPG_MuzFlash_3RD
// 0x0000 (0x0468 - 0x0468)
class AHeli_RPG_MuzFlash_3RD : public AEmitterThirdPerson
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Heli_RPG_MuzFlash_3RD");
		return ptr;
	}

};


// Class XEffects.AR_MuzFlash_04_1RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_04_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_04_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_04_3RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_04_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_04_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_03_1RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_03_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_03_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.AR_MuzFlash_03_3RD
// 0x0004 (0x05CC - 0x05C8)
class AAR_MuzFlash_03_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.AR_MuzFlash_03_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.ShellSpewer_50AE
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_50AE : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_50AE");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_50AE_3rd
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_50AE_3rd : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_50AE_3rd");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_Gage_Red
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_Gage_Red : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_Gage_Red");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_Gage_Red_3rd
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_Gage_Red_3rd : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_Gage_Red_3rd");
		return ptr;
	}

};


// Class XEffects.SG_MuzFlash_01_1RD
// 0x0004 (0x05CC - 0x05C8)
class ASG_MuzFlash_01_1RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SG_MuzFlash_01_1RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.SG_MuzFlash_01_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASG_MuzFlash_01_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.SG_MuzFlash_01_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


// Class XEffects.ShellSpewer_Gage_Blue
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_Gage_Blue : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_Gage_Blue");
		return ptr;
	}

};


// Class XEffects.ShellSpewer_Gage_Blue_3rd
// 0x0000 (0x05CC - 0x05CC)
class AShellSpewer_Gage_Blue_3rd : public AShellSpewer
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.ShellSpewer_Gage_Blue_3rd");
		return ptr;
	}

};


// Class XEffects.Sentry_Gun_MuzFlash_01_3RD
// 0x0004 (0x05CC - 0x05C8)
class ASentry_Gun_MuzFlash_01_3RD : public AwEmitter
{
public:
	int                                                mNumPerFlash;                                             // 0x05C8(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class XEffects.Sentry_Gun_MuzFlash_01_3RD");
		return ptr;
	}


	void Trigger(class AActor* Other, class APawn* EventInstigator);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
