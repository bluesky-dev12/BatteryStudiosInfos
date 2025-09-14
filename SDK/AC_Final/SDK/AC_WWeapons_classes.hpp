#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class WWeapons.wWeaponFireInstallPack
// 0x0010 (0x01C8 - 0x01B8)
class UwWeaponFireInstallPack : public UwWeaponFire
{
public:
	byte                                               byFirstTick;                                              // 0x01B8(0x0001)
	byte                                               Padding00[0x3];                                           // 0x01B9(0x0003) MISSED OFFSET
	float                                              m_fInstallingTime;                                        // 0x01BC(0x0004)
	float                                              m_fInstallingElapsedTime;                                 // 0x01C0(0x0004)
	bool                                               m_bInstalling;                                            // 0x01C4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wWeaponFireInstallPack");
		return ptr;
	}


	float GetInstallRate();
	void ModeTick(float dt);
	void StopFiring();
	void ModeDoFire();
	bool AllowFire();
	void wLoadOut();
};


// Class WWeapons.wAirStrikeProj
// 0x0024 (0x04C0 - 0x049C)
class AwAirStrikeProj : public AwProjectile
{
public:
	class UwWeaponBaseParams*                          BaseParams_Bomb;                                          // 0x049C(0x0004)
	class UClass*                                      ResParams_Bomb;                                           // 0x04A0(0x0004)
	int                                                iCurrBombCnt;                                             // 0x04A4(0x0004) (Net)
	struct FRotator                                    rMasterRot;                                               // 0x04A8(0x000C)
	struct FVector                                     vInvFallingLine;                                          // 0x04B4(0x000C)

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
// 0x0014 (0x08AC - 0x0898)
class AwWeapon_Turret_FNM240 : public AwGun
{
public:
	float                                              fOverHeatMin;                                             // 0x0898(0x0004) (Const)
	float                                              fOverHeatMax;                                             // 0x089C(0x0004) (Const)
	float                                              fCallTime;                                                // 0x08A0(0x0004)
	float                                              fLastFireTime;                                            // 0x08A4(0x0004)
	float                                              weaponID;                                                 // 0x08A8(0x0004)

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
	byte BestMode();
	void PawnUnpossessed();
	void wLoadOut(int iID, int iAddPartsID);
	void SetResParams(class UClass* wRes);
	void PostNetBeginPlay();
	void PostBeginPlay();
};


// Class WWeapons.wRocketLauncher
// 0x0008 (0x08A0 - 0x0898)
class AwRocketLauncher : public AwGun
{
public:
	class AwSkinShell*                                 wWarhead;                                                 // 0x0898(0x0004)
	float                                              fWaitingTime;                                             // 0x089C(0x0004)

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
// 0x0014 (0x0228 - 0x0214)
class UwTurret_FNM240_Fire : public UwInstantFire
{
public:
	bool                                               bStartFireSound;                                          // 0x0214(0x0004)
	string                                             SoundNotReady;                                            // 0x0218(0x000C) (NeedCtorLink)
	bool                                               bSoundNotReady;                                           // 0x0224(0x0004)

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
// 0x0098 (0x11A0 - 0x1108)
class AwGunAttachment : public AwWeaponAttachment
{
public:
	class UClass*                                      mMuzFlashClass;                                           // 0x1108(0x0004)
	class AwEmitter*                                   mMuzFlash3rd;                                             // 0x110C(0x0004)
	class UClass*                                      mMuzFlashEmitterClass;                                    // 0x1110(0x0004)
	class UClass*                                      mSmokeClass;                                              // 0x1114(0x0004)
	class AwEmitter*                                   mSmoke3rd;                                                // 0x1118(0x0004)
	class UClass*                                      mSmokeEmitterClass;                                       // 0x111C(0x0004)
	class UClass*                                      mSilencerSmokeClass;                                      // 0x1120(0x0004)
	class AwEmitter*                                   mSilencerSmoke3rd;                                        // 0x1124(0x0004)
	class UClass*                                      mSilencerSmokeEmitterClass;                               // 0x1128(0x0004)
	class UClass*                                      mShellCaseEmitterClass;                                   // 0x112C(0x0004)
	class AwEmitter*                                   mShellCaseEmitter;                                        // 0x1130(0x0004)
	class UClass*                                      mTracerClass;                                             // 0x1134(0x0004)
	class AEmitter*                                    mTracer;                                                  // 0x1138(0x0004) (Edit, EditInline)
	class AEmitter*                                    marrTracer[0xA];                                          // 0x113C(0x0004) (Edit, EditInline)
	float                                              mTracerPullback;                                          // 0x1164(0x0004) (Edit)
	float                                              mTracerMinDistance;                                       // 0x1168(0x0004) (Edit)
	float                                              mTracerSpeed;                                             // 0x116C(0x0004) (Edit)
	struct FVector                                     mOldHitLocation;                                          // 0x1170(0x000C)
	class AwSkinShell*                                 wParts[0x3];                                              // 0x117C(0x0004)
	float                                              fPartsCullDistance;                                       // 0x1188(0x0004)
	byte                                               iSelfTraceCount;                                          // 0x118C(0x0001)
	byte                                               Padding00[0x3];                                           // 0x118D(0x0003) MISSED OFFSET
	bool                                               bAttachSilencer;                                          // 0x1190(0x0004)
	bool                                               bModMuzFlash;                                             // 0x1190(0x0004)
	string                                             strModMuzFlashClass;                                      // 0x1194(0x000C) (NeedCtorLink)

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
	FName GetBoneNameSilencer();
	FName GetBoneNameRotation();
	FName GetBoneNameTip();
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
// 0x0000 (0x11A0 - 0x11A0)
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
// 0x0014 (0x01DC - 0x01C8)
class UwRocketFire : public UwProjectileFire
{
public:
	FName                                              Aim_FireAnim;                                             // 0x01C8(0x0004) (Edit)
	FName                                              Aim_FireLoopAnim;                                         // 0x01CC(0x0004) (Edit)
	float                                              Aim_FireAnimRate;                                         // 0x01D0(0x0004) (Edit)
	float                                              Aim_FireLoopAnimRate;                                     // 0x01D4(0x0004) (Edit)
	float                                              fWaitingTime;                                             // 0x01D8(0x0004)

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
// 0x0000 (0x04E8 - 0x04E8)
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
// 0x0010 (0x0788 - 0x0778)
class AwTelegraphPack : public AwWeapon
{
public:
	byte                                               byType;                                                   // 0x0778(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0779(0x0003) MISSED OFFSET
	bool                                               bUsed;                                                    // 0x077C(0x0004)
	FName                                              m_naAnim_Plant;                                           // 0x0780(0x0004)
	FName                                              m_naAnim_StopPlant;                                       // 0x0784(0x0004)

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
// 0x0050 (0x07D8 - 0x0788)
class AwTelegraphPack_Install : public AwTelegraphPack
{
public:
	FName                                              m_naAnim_PutDown;                                         // 0x0788(0x0004)
	string                                             m_FmodSound_Putdown_Plant;                                // 0x078C(0x000C) (NeedCtorLink)
	string                                             m_FmodSound_Putdown_Defuse;                               // 0x0798(0x000C) (NeedCtorLink)
	bool                                               m_bPlayedPutdownSound;                                    // 0x07A4(0x0004)
	float                                              m_fElpasedCheckEnableInstall;                             // 0x07A8(0x0004)
	struct FVector                                     m_v3OldinstigatorLocation;                                // 0x07AC(0x000C)
	struct FRotator                                    m_rotOldinstigatorRotation;                               // 0x07B8(0x000C)
	struct FVector                                     m_v3SpawnNormal;                                          // 0x07C4(0x000C)
	int                                                m_iUpSide;                                                // 0x07D0(0x0004)
	bool                                               m_bDisplayedEnableInstallMessage;                         // 0x07D4(0x0004)
	bool                                               m_bDisplayingInstallMessage;                              // 0x07D4(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class WWeapons.wTelegraphPack_Install");
		return ptr;
	}


	void InstallPack();
	void ClientChangePrevWeapon();
	void StopPlantAnimation();
	void PlayPlantAnimation();
	void AnimEnd(int Channel);
	bool PutDown();
	bool IsCanUseWeapon();
	bool DisplayEnableInstallMessage();
	void BringUp(class AwWeapon* PrevWeapon);
	void Tick(float Delta);
	void ServerDestroy();
	bool UseWeapon();
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
