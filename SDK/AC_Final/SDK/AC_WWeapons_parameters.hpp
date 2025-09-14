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

// Function WWeapons.wWeaponFireInstallPack.GetInstallRate
struct UwWeaponFireInstallPack_GetInstallRate_Params
{
	float                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wWeaponFireInstallPack.ModeTick
struct UwWeaponFireInstallPack_ModeTick_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WWeapons.wWeaponFireInstallPack.StopFiring
struct UwWeaponFireInstallPack_StopFiring_Params
{
};

// Function WWeapons.wWeaponFireInstallPack.ModeDoFire
struct UwWeaponFireInstallPack_ModeDoFire_Params
{
};

// Function WWeapons.wWeaponFireInstallPack.AllowFire
struct UwWeaponFireInstallPack_AllowFire_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wWeaponFireInstallPack.wLoadOut
struct UwWeaponFireInstallPack_wLoadOut_Params
{
};

// Function WWeapons.wAirStrikeProj.wLoadOut
struct AwAirStrikeProj_wLoadOut_Params
{
	int                                                iID;                                                      // (Parm)
};

// Function WWeapons.wAirStrikeProj.IncreaseBombCnt
struct AwAirStrikeProj_IncreaseBombCnt_Params
{
};

// Function WWeapons.wAirStrikeProj.ForceBegin
struct AwAirStrikeProj_ForceBegin_Params
{
};

// Function WWeapons.wAirStrikeProj.SpawnProjectile
struct AwAirStrikeProj_SpawnProjectile_Params
{
	struct FVector                                     Start;                                                    // (Parm)
	struct FRotator                                    Dir;                                                      // (Parm)
	class AwProjectile*                                ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wAirStrikeProj.SpawnBomb
struct AwAirStrikeProj_SpawnBomb_Params
{
};

// Function WWeapons.wAirStrikeProj.Destroyed
struct AwAirStrikeProj_Destroyed_Params
{
};

// Function WWeapons.wWeapon_Turret_FNM240.DisplayDebug
struct AwWeapon_Turret_FNM240_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WWeapons.wWeapon_Turret_FNM240.RenderOverlays
struct AwWeapon_Turret_FNM240_RenderOverlays_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function WWeapons.wWeapon_Turret_FNM240.Timer
struct AwWeapon_Turret_FNM240_Timer_Params
{
};

// Function WWeapons.wWeapon_Turret_FNM240.OverHeatDown
struct AwWeapon_Turret_FNM240_OverHeatDown_Params
{
};

// Function WWeapons.wWeapon_Turret_FNM240.OverHeatUp
struct AwWeapon_Turret_FNM240_OverHeatUp_Params
{
};

// Function WWeapons.wWeapon_Turret_FNM240.BringUp
struct AwWeapon_Turret_FNM240_BringUp_Params
{
	class AwWeapon*                                    PrevWeapon;                                               // (OptionalParm, Parm)
};

// Function WWeapons.wWeapon_Turret_FNM240.HasAmmo
struct AwWeapon_Turret_FNM240_HasAmmo_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wWeapon_Turret_FNM240.BestMode
struct AwWeapon_Turret_FNM240_BestMode_Params
{
	byte                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wWeapon_Turret_FNM240.PawnUnpossessed
struct AwWeapon_Turret_FNM240_PawnUnpossessed_Params
{
};

// Function WWeapons.wWeapon_Turret_FNM240.wLoadOut
struct AwWeapon_Turret_FNM240_wLoadOut_Params
{
	int                                                iID;                                                      // (Parm)
	int                                                iAddPartsID;                                              // (Parm)
};

// Function WWeapons.wWeapon_Turret_FNM240.SetResParams
struct AwWeapon_Turret_FNM240_SetResParams_Params
{
	class UClass*                                      wRes;                                                     // (Parm)
};

// Function WWeapons.wWeapon_Turret_FNM240.PostNetBeginPlay
struct AwWeapon_Turret_FNM240_PostNetBeginPlay_Params
{
};

// Function WWeapons.wWeapon_Turret_FNM240.PostBeginPlay
struct AwWeapon_Turret_FNM240_PostBeginPlay_Params
{
};

// Function WWeapons.wRocketLauncher.IsCanUseWeapon
struct AwRocketLauncher_IsCanUseWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketLauncher.IsATR
struct AwRocketLauncher_IsATR_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketLauncher.IsRPG
struct AwRocketLauncher_IsRPG_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketLauncher.AnimEnd
struct AwRocketLauncher_AnimEnd_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WWeapons.wRocketLauncher.ServerDoFire
struct AwRocketLauncher_ServerDoFire_Params
{
};

// Function WWeapons.wRocketLauncher.ServerDestroy
struct AwRocketLauncher_ServerDestroy_Params
{
};

// Function WWeapons.wRocketLauncher.StopFire
struct AwRocketLauncher_StopFire_Params
{
	int                                                Mode;                                                     // (Parm)
};

// Function WWeapons.wRocketLauncher.WeaponTick
struct AwRocketLauncher_WeaponTick_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WWeapons.wRocketLauncher.HasAmmoRocket
struct AwRocketLauncher_HasAmmoRocket_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketLauncher.Destroyed
struct AwRocketLauncher_Destroyed_Params
{
};

// Function WWeapons.wRocketLauncher.PutDown
struct AwRocketLauncher_PutDown_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketLauncher.Reload
struct AwRocketLauncher_Reload_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketLauncher.FireOne
struct AwRocketLauncher_FireOne_Params
{
	int                                                iFireMode;                                                // (Parm)
};

// Function WWeapons.wRocketLauncher.AttWarhead
struct AwRocketLauncher_AttWarhead_Params
{
	bool                                               bAttOrDtt;                                                // (Parm)
};

// Function WWeapons.wRocketLauncher.LoadWarhead
struct AwRocketLauncher_LoadWarhead_Params
{
	class UStaticMesh*                                 stProj;                                                   // (Parm)
};

// Function WWeapons.wRocketLauncher.FillToInitialAmmo
struct AwRocketLauncher_FillToInitialAmmo_Params
{
};

// Function WWeapons.wRocketLauncher.SetResParams
struct AwRocketLauncher_SetResParams_Params
{
	class UClass*                                      wRes;                                                     // (Parm)
};

// Function WWeapons.wTurret_FNM240_Fire.StopFiring
struct UwTurret_FNM240_Fire_StopFiring_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.StartFiring
struct UwTurret_FNM240_Fire_StartFiring_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.DisplayDebug
struct UwTurret_FNM240_Fire_DisplayDebug_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
	float                                              YL;                                                       // (Parm, OutParm)
	float                                              YPos;                                                     // (Parm, OutParm)
};

// Function WWeapons.wTurret_FNM240_Fire.ModeTick
struct UwTurret_FNM240_Fire_ModeTick_Params
{
	float                                              dt;                                                       // (Parm)
};

// Function WWeapons.wTurret_FNM240_Fire.StartMuzzleSmoke
struct UwTurret_FNM240_Fire_StartMuzzleSmoke_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.UpdateEmitter
struct UwTurret_FNM240_Fire_UpdateEmitter_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.FlashMuzzleFlash
struct UwTurret_FNM240_Fire_FlashMuzzleFlash_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.DrawMuzzleFlash
struct UwTurret_FNM240_Fire_DrawMuzzleFlash_Params
{
	class UCanvas*                                     Canvas;                                                   // (Parm)
};

// Function WWeapons.wTurret_FNM240_Fire.InitEffects
struct UwTurret_FNM240_Fire_InitEffects_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.AllowFire
struct UwTurret_FNM240_Fire_AllowFire_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wTurret_FNM240_Fire.PlayFiring
struct UwTurret_FNM240_Fire_PlayFiring_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.Timer
struct UwTurret_FNM240_Fire_Timer_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.DoFireEffectForClient
struct UwTurret_FNM240_Fire_DoFireEffectForClient_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.DoFireEffect
struct UwTurret_FNM240_Fire_DoFireEffect_Params
{
};

// Function WWeapons.wTurret_FNM240_Fire.ModeDoFire
struct UwTurret_FNM240_Fire_ModeDoFire_Params
{
};

// Function WWeapons.wGunAttachment.ClearParts
struct AwGunAttachment_ClearParts_Params
{
};

// Function WWeapons.wGunAttachment.AddParts
struct AwGunAttachment_AddParts_Params
{
	int                                                iWeaponID;                                                // (Parm)
	int                                                iAddPartsID;                                              // (Parm)
};

// Function WWeapons.wGunAttachment.wLoadOut
struct AwGunAttachment_wLoadOut_Params
{
	int                                                iID;                                                      // (Parm)
	int                                                iAddPartsID;                                              // (Parm)
};

// Function WWeapons.wGunAttachment.ThirdPersonEffects
struct AwGunAttachment_ThirdPersonEffects_Params
{
};

// Function WWeapons.wGunAttachment.FakeThirdPersonEffects
struct AwGunAttachment_FakeThirdPersonEffects_Params
{
	class AActor*                                      HitActor;                                                 // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
	class UMaterial*                                   HitMaterial;                                              // (Parm)
};

// Function WWeapons.wGunAttachment.FakeUpdateTracer
struct AwGunAttachment_FakeUpdateTracer_Params
{
	struct FVector                                     LastHitLocation;                                          // (Parm)
};

// Function WWeapons.wGunAttachment.MakeSmoke
struct AwGunAttachment_MakeSmoke_Params
{
};

// Function WWeapons.wGunAttachment.GetBoneNameSilencer
struct AwGunAttachment_GetBoneNameSilencer_Params
{
	FName                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wGunAttachment.GetBoneNameRotation
struct AwGunAttachment_GetBoneNameRotation_Params
{
	FName                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wGunAttachment.GetBoneNameTip
struct AwGunAttachment_GetBoneNameTip_Params
{
	FName                                              ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wGunAttachment.MakeSpawnShell
struct AwGunAttachment_MakeSpawnShell_Params
{
	bool                                               bRechamber;                                               // (OptionalParm, Parm)
};

// Function WWeapons.wGunAttachment.MakeMuzzleFlash
struct AwGunAttachment_MakeMuzzleFlash_Params
{
};

// Function WWeapons.wGunAttachment.SpawnEmitter
struct AwGunAttachment_SpawnEmitter_Params
{
	class UClass*                                      EmitterClass;                                             // (Parm)
};

// Function WWeapons.wGunAttachment.UpdateHit
struct AwGunAttachment_UpdateHit_Params
{
	class AActor*                                      HitActor;                                                 // (Parm)
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
	class UMaterial*                                   HitMaterial;                                              // (Parm)
};

// Function WWeapons.wGunAttachment.UpdatePenetrateHit
struct AwGunAttachment_UpdatePenetrateHit_Params
{
	class AActor*                                      mHitActor;                                                // (Parm)
	struct FVector                                     mHitLocation;                                             // (Parm)
	struct FVector                                     mHitNormal;                                               // (Parm)
	class UMaterial*                                   mHitMaterial;                                             // (Parm)
	int                                                mLastHitIdx;                                              // (Parm)
};

// Function WWeapons.wGunAttachment.UpdateTracer
struct AwGunAttachment_UpdateTracer_Params
{
};

// Function WWeapons.wGunAttachment.GetTracerStart
struct AwGunAttachment_GetTracerStart_Params
{
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wGunAttachment.Destroyed
struct AwGunAttachment_Destroyed_Params
{
};

// Function WWeapons.wTurretAttachmet.MakeSmoke
struct AwTurretAttachmet_MakeSmoke_Params
{
};

// Function WWeapons.wTurretAttachmet.MakeMuzzleFlash
struct AwTurretAttachmet_MakeMuzzleFlash_Params
{
};

// Function WWeapons.wTurretAttachmet.GetTipLocation
struct AwTurretAttachmet_GetTipLocation_Params
{
	struct FVector                                     ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketFire.StartFiring
struct UwRocketFire_StartFiring_Params
{
};

// Function WWeapons.wRocketFire.PlayFiring
struct UwRocketFire_PlayFiring_Params
{
};

// Function WWeapons.wRocketFire.ResetInputFire
struct UwRocketFire_ResetInputFire_Params
{
};

// Function WWeapons.wRocketFire.IsInputFire
struct UwRocketFire_IsInputFire_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketFire.CheckRPGAimMode
struct UwRocketFire_CheckRPGAimMode_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wRocketFire.ServerDoFire
struct UwRocketFire_ServerDoFire_Params
{
};

// Function WWeapons.wRocketFire.StartMuzzleSmoke
struct UwRocketFire_StartMuzzleSmoke_Params
{
};

// Function WWeapons.wRocketFire.FlashMuzzleFlash
struct UwRocketFire_FlashMuzzleFlash_Params
{
};

// Function WWeapons.wRocketFire.NewActiveStartFire
struct UwRocketFire_NewActiveStartFire_Params
{
};

// Function WWeapons.wRocketFire.ModeDoFire
struct UwRocketFire_ModeDoFire_Params
{
};

// Function WWeapons.wAirStrikeBomb.Explode
struct AwAirStrikeBomb_Explode_Params
{
	struct FVector                                     HitLocation;                                              // (Parm)
	struct FVector                                     HitNormal;                                                // (Parm)
};

// Function WWeapons.wAirStrikeBomb.PostBeginPlay
struct AwAirStrikeBomb_PostBeginPlay_Params
{
};

// Function WWeapons.wTelegraphPack.IsCanUseWeapon
struct AwTelegraphPack_IsCanUseWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wTelegraphPack.ServerDestroy
struct AwTelegraphPack_ServerDestroy_Params
{
};

// Function WWeapons.wTelegraphPack.ChangePrevWeapon
struct AwTelegraphPack_ChangePrevWeapon_Params
{
};

// Function WWeapons.wTelegraphPack.AnimEnd
struct AwTelegraphPack_AnimEnd_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WWeapons.wTelegraphPack.UsedWeapon
struct AwTelegraphPack_UsedWeapon_Params
{
};

// Function WWeapons.wTelegraphPack.UseWeapon
struct AwTelegraphPack_UseWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wTelegraphPack.CheckTryToDrive
struct AwTelegraphPack_CheckTryToDrive_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wTelegraphPack.wLoadOut
struct AwTelegraphPack_wLoadOut_Params
{
	int                                                iID;                                                      // (Parm)
	int                                                iAddPartsID;                                              // (Parm)
};

// Function WWeapons.wTelegraphPack_Install.InstallPack
struct AwTelegraphPack_Install_InstallPack_Params
{
};

// Function WWeapons.wTelegraphPack_Install.ClientChangePrevWeapon
struct AwTelegraphPack_Install_ClientChangePrevWeapon_Params
{
};

// Function WWeapons.wTelegraphPack_Install.StopPlantAnimation
struct AwTelegraphPack_Install_StopPlantAnimation_Params
{
};

// Function WWeapons.wTelegraphPack_Install.PlayPlantAnimation
struct AwTelegraphPack_Install_PlayPlantAnimation_Params
{
};

// Function WWeapons.wTelegraphPack_Install.AnimEnd
struct AwTelegraphPack_Install_AnimEnd_Params
{
	int                                                Channel;                                                  // (Parm)
};

// Function WWeapons.wTelegraphPack_Install.PutDown
struct AwTelegraphPack_Install_PutDown_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wTelegraphPack_Install.IsCanUseWeapon
struct AwTelegraphPack_Install_IsCanUseWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wTelegraphPack_Install.DisplayEnableInstallMessage
struct AwTelegraphPack_Install_DisplayEnableInstallMessage_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

// Function WWeapons.wTelegraphPack_Install.BringUp
struct AwTelegraphPack_Install_BringUp_Params
{
	class AwWeapon*                                    PrevWeapon;                                               // (OptionalParm, Parm)
};

// Function WWeapons.wTelegraphPack_Install.Tick
struct AwTelegraphPack_Install_Tick_Params
{
	float                                              Delta;                                                    // (Parm)
};

// Function WWeapons.wTelegraphPack_Install.ServerDestroy
struct AwTelegraphPack_Install_ServerDestroy_Params
{
};

// Function WWeapons.wTelegraphPack_Install.UseWeapon
struct AwTelegraphPack_Install_UseWeapon_Params
{
	bool                                               ReturnValue;                                              // (Parm, OutParm, ReturnParm)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
