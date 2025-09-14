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

// Class WWeapons.wWeaponFireInstallPack
// 0x000C (0x01C0 - 0x01B4)
class UwWeaponFireInstallPack : public UwWeaponFire
{
public:
	TEnumAsByte<EINSTALL_STATE_TYPE>                   m_eInstallState;                                          // 0x01B4(0x0001)
	unsigned char                                      byFirstTick;                                              // 0x01B5(0x0001)
	unsigned char                                      UnknownData00[0x2];                                       // 0x01B6(0x0002) MISSED OFFSET
	float                                              m_fInstallingTime;                                        // 0x01B8(0x0004)
	float                                              m_fInstallingElapsedTime;                                 // 0x01BC(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wWeaponFireInstallPack");
		return ptr;
	}


	bool IsInstalling();
	float GetInstallRate();
	void ModeTick(float dt);
	void StopFiring();
	void ModeDoFire();
	bool AllowFire();
	void wLoadOut();
};


// Class WWeapons.wAirStrikeProj
// 0x0024 (0x04BC - 0x0498)
class AwAirStrikeProj : public AwProjectile
{
public:
	class UwWeaponBaseParams*                          BaseParams_Bomb;                                          // 0x0498(0x0004)
	class UClass*                                      ResParams_Bomb;                                           // 0x049C(0x0004)
	int                                                iCurrBombCnt;                                             // 0x04A0(0x0004) (Net)
	struct FRotator                                    rMasterRot;                                               // 0x04A4(0x000C)
	struct FVector                                     vInvFallingLine;                                          // 0x04B0(0x000C)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wAirStrikeProj");
		return ptr;
	}


	void wLoadOut(int iID);
	void IncreaseBombCnt();
	void ForceBegin();
	class AwProjectile* SpawnProjectile(const struct FVector& Start, const struct FRotator& Dir);
	void SpawnBomb();
	void Destroyed();
};


// Class WWeapons.wWeapon_Turret_FNM240
// 0x0014 (0x089C - 0x0888)
class AwWeapon_Turret_FNM240 : public AwGun
{
public:
	float                                              fOverHeatMin;                                             // 0x0888(0x0004) (Const)
	float                                              fOverHeatMax;                                             // 0x088C(0x0004) (Const)
	float                                              fCallTime;                                                // 0x0890(0x0004)
	float                                              fLastFireTime;                                            // 0x0894(0x0004)
	float                                              weaponID;                                                 // 0x0898(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wWeapon_Turret_FNM240");
		return ptr;
	}


	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void RenderOverlays(class UCanvas* Canvas);
	void Timer();
	void OverHeatDown();
	void OverHeatUp();
	void BringUp(class AwWeapon* PrevWeapon);
	bool HasAmmo();
	unsigned char BestMode();
	void PawnUnpossessed();
	void wLoadOut(int iID, int iAddPartsID);
	void SetResParams(class UClass* wRes);
	void PostNetBeginPlay();
	void PostBeginPlay();
};


// Class WWeapons.wRocketLauncher
// 0x0008 (0x0890 - 0x0888)
class AwRocketLauncher : public AwGun
{
public:
	class AwSkinShell*                                 wWarhead;                                                 // 0x0888(0x0004)
	float                                              fWaitingTime;                                             // 0x088C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wRocketLauncher");
		return ptr;
	}


	bool IsCanUseWeapon();
	bool IsATR();
	bool IsRPG();
	void AnimEnd(int Channel);
	void ServerDoFire();
	void ServerDestroy();
	void StopFire(int Mode);
	void WeaponTick(float dt);
	bool HasAmmoRocket();
	void Destroyed();
	bool PutDown();
	bool Reload();
	void FireOne(int iFireMode);
	void AttWarhead(bool bAttOrDtt);
	void LoadWarhead(class UStaticMesh* stProj);
	void FillToInitialAmmo();
	void SetResParams(class UClass* wRes);
};


// Class WWeapons.wTurret_FNM240_Fire
// 0x0014 (0x0224 - 0x0210)
class UwTurret_FNM240_Fire : public UwInstantFire
{
public:
	unsigned long                                      bStartFireSound : 1;                                      // 0x0210(0x0004)
	struct FString                                     SoundNotReady;                                            // 0x0214(0x000C) (NeedCtorLink)
	unsigned long                                      bSoundNotReady : 1;                                       // 0x0220(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wTurret_FNM240_Fire");
		return ptr;
	}


	void StopFiring();
	void StartFiring();
	void DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos);
	void ModeTick(float dt);
	void StartMuzzleSmoke();
	void UpdateEmitter();
	void FlashMuzzleFlash();
	void DrawMuzzleFlash(class UCanvas* Canvas);
	void InitEffects();
	bool AllowFire();
	void PlayFiring();
	void Timer();
	void DoFireEffectForClient();
	void DoFireEffect();
	void ModeDoFire();
};


// Class WWeapons.wGunAttachment
// 0x008C (0x116C - 0x10E0)
class AwGunAttachment : public AwWeaponAttachment
{
public:
	class UClass*                                      mMuzFlashClass;                                           // 0x10E0(0x0004)
	class AwEmitter*                                   mMuzFlash3rd;                                             // 0x10E4(0x0004)
	class UClass*                                      mMuzFlashEmitterClass;                                    // 0x10E8(0x0004)
	class UClass*                                      mSmokeClass;                                              // 0x10EC(0x0004)
	class AwEmitter*                                   mSmoke3rd;                                                // 0x10F0(0x0004)
	class UClass*                                      mSmokeEmitterClass;                                       // 0x10F4(0x0004)
	class UClass*                                      mSilencerSmokeClass;                                      // 0x10F8(0x0004)
	class AwEmitter*                                   mSilencerSmoke3rd;                                        // 0x10FC(0x0004)
	class UClass*                                      mSilencerSmokeEmitterClass;                               // 0x1100(0x0004)
	class UClass*                                      mShellCaseEmitterClass;                                   // 0x1104(0x0004)
	class AwEmitter*                                   mShellCaseEmitter;                                        // 0x1108(0x0004)
	class UClass*                                      mTracerClass;                                             // 0x110C(0x0004)
	class AEmitter*                                    mTracer;                                                  // 0x1110(0x0004) (Edit, EditInline)
	class AEmitter*                                    marrTracer[0xA];                                          // 0x1114(0x0004) (Edit, EditInline)
	float                                              mTracerPullback;                                          // 0x113C(0x0004) (Edit)
	float                                              mTracerMinDistance;                                       // 0x1140(0x0004) (Edit)
	float                                              mTracerSpeed;                                             // 0x1144(0x0004) (Edit)
	struct FVector                                     mOldHitLocation;                                          // 0x1148(0x000C)
	class AwSkinShell*                                 wParts[0x3];                                              // 0x1154(0x0004)
	float                                              fPartsCullDistance;                                       // 0x1160(0x0004)
	unsigned char                                      iSelfTraceCount;                                          // 0x1164(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x1165(0x0003) MISSED OFFSET
	unsigned long                                      bAttachSilencer : 1;                                      // 0x1168(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wGunAttachment");
		return ptr;
	}


	void ClearParts();
	void AddParts(int iWeaponID, int iAddPartsID);
	void wLoadOut(int iID, int iAddPartsID);
	void ThirdPersonEffects();
	void FakeThirdPersonEffects(class AActor* HitActor, const struct FVector& HitLocation, const struct FVector& HitNormal, class UMaterial* HitMaterial);
	void FakeUpdateTracer(const struct FVector& LastHitLocation);
	void MakeSmoke();
	struct FName GetBoneNameSilencer();
	struct FName GetBoneNameRotation();
	struct FName GetBoneNameTip();
	void MakeSpawnShell(bool bRechamber);
	void MakeMuzzleFlash();
	void SpawnEmitter(class UClass* EmitterClass);
	void UpdateHit(class AActor* HitActor, const struct FVector& HitLocation, const struct FVector& HitNormal, class UMaterial* HitMaterial);
	void UpdatePenetrateHit(class AActor* mHitActor, const struct FVector& mHitLocation, const struct FVector& mHitNormal, class UMaterial* mHitMaterial, int mLastHitIdx);
	void UpdateTracer();
	struct FVector GetTracerStart();
	void Destroyed();
};


// Class WWeapons.wTurretAttachmet
// 0x0000 (0x116C - 0x116C)
class AwTurretAttachmet : public AwGunAttachment
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wTurretAttachmet");
		return ptr;
	}


	void MakeSmoke();
	void MakeMuzzleFlash();
	struct FVector GetTipLocation();
};


// Class WWeapons.wRocketFire
// 0x0014 (0x01D8 - 0x01C4)
class UwRocketFire : public UwProjectileFire
{
public:
	struct FName                                       Aim_FireAnim;                                             // 0x01C4(0x0004) (Edit)
	struct FName                                       Aim_FireLoopAnim;                                         // 0x01C8(0x0004) (Edit)
	float                                              Aim_FireAnimRate;                                         // 0x01CC(0x0004) (Edit)
	float                                              Aim_FireLoopAnimRate;                                     // 0x01D0(0x0004) (Edit)
	float                                              fWaitingTime;                                             // 0x01D4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wRocketFire");
		return ptr;
	}


	void StartFiring();
	void PlayFiring();
	void ResetInputFire();
	bool IsInputFire();
	bool CheckRPGAimMode();
	void ServerDoFire();
	void StartMuzzleSmoke();
	void FlashMuzzleFlash();
	void NewActiveStartFire();
	void ModeDoFire();
};


// Class WWeapons.wAirStrikeBomb
// 0x0000 (0x04E4 - 0x04E4)
class AwAirStrikeBomb : public AwRocket
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wAirStrikeBomb");
		return ptr;
	}


	void Explode(const struct FVector& HitLocation, const struct FVector& HitNormal);
	void PostBeginPlay();
};


// Class WWeapons.wTelegraphPack
// 0x000C (0x0780 - 0x0774)
class AwTelegraphPack : public AwWeapon
{
public:
	unsigned char                                      byType;                                                   // 0x0774(0x0001)
	unsigned char                                      UnknownData00[0x3];                                       // 0x0775(0x0003) MISSED OFFSET
	unsigned long                                      bUsed : 1;                                                // 0x0778(0x0004)
	struct FName                                       m_naAnim_Plant;                                           // 0x077C(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wTelegraphPack");
		return ptr;
	}


	bool IsCanUseWeapon();
	void ServerDestroy();
	void ChangePrevWeapon();
	void AnimEnd(int Channel);
	void UsedWeapon();
	bool UseWeapon();
	bool CheckTryToDrive();
	void wLoadOut(int iID, int iAddPartsID);
};


// Class WWeapons.wTelegraphPack_Install
// 0x0024 (0x07A4 - 0x0780)
class AwTelegraphPack_Install : public AwTelegraphPack
{
public:
	struct FName                                       m_naAnim_StopPlant;                                       // 0x0780(0x0004)
	struct FString                                     m_FmodSound_Putdown_Plant;                                // 0x0784(0x000C) (NeedCtorLink)
	struct FString                                     m_FmodSound_Putdown_Defuse;                               // 0x0790(0x000C) (NeedCtorLink)
	unsigned long                                      m_bPlayedPutdownSound : 1;                                // 0x079C(0x0004)
	struct FName                                       m_Anim_Test;                                              // 0x07A0(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wTelegraphPack_Install");
		return ptr;
	}


	bool InstallPack();
	void StopPlantAnimation();
	void PlayPlantAnimation();
	bool PutDown();
	bool IsCanUseWeapon();
	void BringUp(class AwWeapon* PrevWeapon);
	void ServerDestroy();
	bool UseWeapon();
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
