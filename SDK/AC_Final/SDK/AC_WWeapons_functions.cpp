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

// Function WWeapons.wWeaponFireInstallPack.GetInstallRate
// (Defined, Public)
// Parameters:
// float                          ReturnValue                    (Parm, OutParm, ReturnParm)

float UwWeaponFireInstallPack::GetInstallRate()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeaponFireInstallPack.GetInstallRate");

	UwWeaponFireInstallPack_GetInstallRate_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wWeaponFireInstallPack.ModeTick
// (Defined, Event, Public)
// Parameters:
// float                          dt                             (Parm)

void UwWeaponFireInstallPack::ModeTick(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeaponFireInstallPack.ModeTick");

	UwWeaponFireInstallPack_ModeTick_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeaponFireInstallPack.StopFiring
// (Defined, Public)

void UwWeaponFireInstallPack::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeaponFireInstallPack.StopFiring");

	UwWeaponFireInstallPack_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeaponFireInstallPack.ModeDoFire
// (Defined, Event, Public)

void UwWeaponFireInstallPack::ModeDoFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeaponFireInstallPack.ModeDoFire");

	UwWeaponFireInstallPack_ModeDoFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeaponFireInstallPack.AllowFire
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwWeaponFireInstallPack::AllowFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeaponFireInstallPack.AllowFire");

	UwWeaponFireInstallPack_AllowFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wWeaponFireInstallPack.wLoadOut
// (Defined, Simulated, Public)

void UwWeaponFireInstallPack::wLoadOut()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeaponFireInstallPack.wLoadOut");

	UwWeaponFireInstallPack_wLoadOut_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wAirStrikeProj.wLoadOut
// (Defined, Simulated, Public)
// Parameters:
// int                            iID                            (Parm)

void AwAirStrikeProj::wLoadOut(int iID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeProj.wLoadOut");

	AwAirStrikeProj_wLoadOut_Params params;
	params.iID = iID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wAirStrikeProj.IncreaseBombCnt
// (Defined, Public)

void AwAirStrikeProj::IncreaseBombCnt()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeProj.IncreaseBombCnt");

	AwAirStrikeProj_IncreaseBombCnt_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wAirStrikeProj.ForceBegin
// (Defined, Public)

void AwAirStrikeProj::ForceBegin()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeProj.ForceBegin");

	AwAirStrikeProj_ForceBegin_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wAirStrikeProj.SpawnProjectile
// (Defined, Public)
// Parameters:
// struct FVector                 Start                          (Parm)
// struct FRotator                Dir                            (Parm)
// class AwProjectile*            ReturnValue                    (Parm, OutParm, ReturnParm)

class AwProjectile* AwAirStrikeProj::SpawnProjectile(const struct FVector& Start, const struct FRotator& Dir)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeProj.SpawnProjectile");

	AwAirStrikeProj_SpawnProjectile_Params params;
	params.Start = Start;
	params.Dir = Dir;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wAirStrikeProj.SpawnBomb
// (Defined, Public)

void AwAirStrikeProj::SpawnBomb()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeProj.SpawnBomb");

	AwAirStrikeProj_SpawnBomb_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wAirStrikeProj.Destroyed
// (Defined, Event, Public)

void AwAirStrikeProj::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeProj.Destroyed");

	AwAirStrikeProj_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.DisplayDebug
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void AwWeapon_Turret_FNM240::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.DisplayDebug");

	AwWeapon_Turret_FNM240_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WWeapons.wWeapon_Turret_FNM240.RenderOverlays
// (Defined, Simulated, Event, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void AwWeapon_Turret_FNM240::RenderOverlays(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.RenderOverlays");

	AwWeapon_Turret_FNM240_RenderOverlays_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.Timer
// (Defined, Event, Public)

void AwWeapon_Turret_FNM240::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.Timer");

	AwWeapon_Turret_FNM240_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.OverHeatDown
// (Defined, Public)

void AwWeapon_Turret_FNM240::OverHeatDown()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.OverHeatDown");

	AwWeapon_Turret_FNM240_OverHeatDown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.OverHeatUp
// (Defined, Public)

void AwWeapon_Turret_FNM240::OverHeatUp()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.OverHeatUp");

	AwWeapon_Turret_FNM240_OverHeatUp_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.BringUp
// (Defined, Simulated, Public)
// Parameters:
// class AwWeapon*                PrevWeapon                     (OptionalParm, Parm)

void AwWeapon_Turret_FNM240::BringUp(class AwWeapon* PrevWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.BringUp");

	AwWeapon_Turret_FNM240_BringUp_Params params;
	params.PrevWeapon = PrevWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.HasAmmo
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwWeapon_Turret_FNM240::HasAmmo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.HasAmmo");

	AwWeapon_Turret_FNM240_HasAmmo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wWeapon_Turret_FNM240.BestMode
// (Defined, Public)
// Parameters:
// byte                           ReturnValue                    (Parm, OutParm, ReturnParm)

byte AwWeapon_Turret_FNM240::BestMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.BestMode");

	AwWeapon_Turret_FNM240_BestMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wWeapon_Turret_FNM240.PawnUnpossessed
// (Defined, Simulated, Public)

void AwWeapon_Turret_FNM240::PawnUnpossessed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.PawnUnpossessed");

	AwWeapon_Turret_FNM240_PawnUnpossessed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.wLoadOut
// (Defined, Simulated, Public)
// Parameters:
// int                            iID                            (Parm)
// int                            iAddPartsID                    (Parm)

void AwWeapon_Turret_FNM240::wLoadOut(int iID, int iAddPartsID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.wLoadOut");

	AwWeapon_Turret_FNM240_wLoadOut_Params params;
	params.iID = iID;
	params.iAddPartsID = iAddPartsID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.SetResParams
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  wRes                           (Parm)

void AwWeapon_Turret_FNM240::SetResParams(class UClass* wRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.SetResParams");

	AwWeapon_Turret_FNM240_SetResParams_Params params;
	params.wRes = wRes;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.PostNetBeginPlay
// (Defined, Simulated, Event, Public)

void AwWeapon_Turret_FNM240::PostNetBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.PostNetBeginPlay");

	AwWeapon_Turret_FNM240_PostNetBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wWeapon_Turret_FNM240.PostBeginPlay
// (Defined, Simulated, Public)

void AwWeapon_Turret_FNM240::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wWeapon_Turret_FNM240.PostBeginPlay");

	AwWeapon_Turret_FNM240_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.IsCanUseWeapon
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwRocketLauncher::IsCanUseWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.IsCanUseWeapon");

	AwRocketLauncher_IsCanUseWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketLauncher.IsATR
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwRocketLauncher::IsATR()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.IsATR");

	AwRocketLauncher_IsATR_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketLauncher.IsRPG
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwRocketLauncher::IsRPG()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.IsRPG");

	AwRocketLauncher_IsRPG_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketLauncher.AnimEnd
// (Defined, Simulated, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwRocketLauncher::AnimEnd(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.AnimEnd");

	AwRocketLauncher_AnimEnd_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.ServerDoFire
// (Defined, Net, NetReliable, Public)

void AwRocketLauncher::ServerDoFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.ServerDoFire");

	AwRocketLauncher_ServerDoFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.ServerDestroy
// (Defined, Net, NetReliable, Public)

void AwRocketLauncher::ServerDestroy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.ServerDestroy");

	AwRocketLauncher_ServerDestroy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.StopFire
// (Defined, Simulated, Event, Public)
// Parameters:
// int                            Mode                           (Parm)

void AwRocketLauncher::StopFire(int Mode)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.StopFire");

	AwRocketLauncher_StopFire_Params params;
	params.Mode = Mode;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.WeaponTick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          dt                             (Parm)

void AwRocketLauncher::WeaponTick(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.WeaponTick");

	AwRocketLauncher_WeaponTick_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.HasAmmoRocket
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwRocketLauncher::HasAmmoRocket()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.HasAmmoRocket");

	AwRocketLauncher_HasAmmoRocket_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketLauncher.Destroyed
// (Defined, Simulated, Public)

void AwRocketLauncher::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.Destroyed");

	AwRocketLauncher_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.PutDown
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwRocketLauncher::PutDown()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.PutDown");

	AwRocketLauncher_PutDown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketLauncher.Reload
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwRocketLauncher::Reload()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.Reload");

	AwRocketLauncher_Reload_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketLauncher.FireOne
// (Defined, Simulated, Public)
// Parameters:
// int                            iFireMode                      (Parm)

void AwRocketLauncher::FireOne(int iFireMode)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.FireOne");

	AwRocketLauncher_FireOne_Params params;
	params.iFireMode = iFireMode;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.AttWarhead
// (Defined, Simulated, Public)
// Parameters:
// bool                           bAttOrDtt                      (Parm)

void AwRocketLauncher::AttWarhead(bool bAttOrDtt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.AttWarhead");

	AwRocketLauncher_AttWarhead_Params params;
	params.bAttOrDtt = bAttOrDtt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.LoadWarhead
// (Defined, Simulated, Public)
// Parameters:
// class UStaticMesh*             stProj                         (Parm)

void AwRocketLauncher::LoadWarhead(class UStaticMesh* stProj)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.LoadWarhead");

	AwRocketLauncher_LoadWarhead_Params params;
	params.stProj = stProj;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.FillToInitialAmmo
// (Defined, Simulated, Public)

void AwRocketLauncher::FillToInitialAmmo()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.FillToInitialAmmo");

	AwRocketLauncher_FillToInitialAmmo_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketLauncher.SetResParams
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  wRes                           (Parm)

void AwRocketLauncher::SetResParams(class UClass* wRes)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketLauncher.SetResParams");

	AwRocketLauncher_SetResParams_Params params;
	params.wRes = wRes;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.StopFiring
// (Defined, Public)

void UwTurret_FNM240_Fire::StopFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.StopFiring");

	UwTurret_FNM240_Fire_StopFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.StartFiring
// (Defined, Public)

void UwTurret_FNM240_Fire::StartFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.StartFiring");

	UwTurret_FNM240_Fire_StartFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.DisplayDebug
// (Defined, Simulated, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)
// float                          YL                             (Parm, OutParm)
// float                          YPos                           (Parm, OutParm)

void UwTurret_FNM240_Fire::DisplayDebug(class UCanvas* Canvas, float* YL, float* YPos)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.DisplayDebug");

	UwTurret_FNM240_Fire_DisplayDebug_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	if (YL != nullptr)
		*YL = params.YL;
	if (YPos != nullptr)
		*YPos = params.YPos;
}


// Function WWeapons.wTurret_FNM240_Fire.ModeTick
// (Defined, Event, Public)
// Parameters:
// float                          dt                             (Parm)

void UwTurret_FNM240_Fire::ModeTick(float dt)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.ModeTick");

	UwTurret_FNM240_Fire_ModeTick_Params params;
	params.dt = dt;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.StartMuzzleSmoke
// (Defined, Public)

void UwTurret_FNM240_Fire::StartMuzzleSmoke()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.StartMuzzleSmoke");

	UwTurret_FNM240_Fire_StartMuzzleSmoke_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.UpdateEmitter
// (Defined, Simulated, Public)

void UwTurret_FNM240_Fire::UpdateEmitter()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.UpdateEmitter");

	UwTurret_FNM240_Fire_UpdateEmitter_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.FlashMuzzleFlash
// (Defined, Public)

void UwTurret_FNM240_Fire::FlashMuzzleFlash()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.FlashMuzzleFlash");

	UwTurret_FNM240_Fire_FlashMuzzleFlash_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.DrawMuzzleFlash
// (Defined, Public)
// Parameters:
// class UCanvas*                 Canvas                         (Parm)

void UwTurret_FNM240_Fire::DrawMuzzleFlash(class UCanvas* Canvas)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.DrawMuzzleFlash");

	UwTurret_FNM240_Fire_DrawMuzzleFlash_Params params;
	params.Canvas = Canvas;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.InitEffects
// (Defined, Simulated, Public)

void UwTurret_FNM240_Fire::InitEffects()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.InitEffects");

	UwTurret_FNM240_Fire_InitEffects_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.AllowFire
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwTurret_FNM240_Fire::AllowFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.AllowFire");

	UwTurret_FNM240_Fire_AllowFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wTurret_FNM240_Fire.PlayFiring
// (Defined, Public)

void UwTurret_FNM240_Fire::PlayFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.PlayFiring");

	UwTurret_FNM240_Fire_PlayFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.Timer
// (Defined, Event, Public)

void UwTurret_FNM240_Fire::Timer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.Timer");

	UwTurret_FNM240_Fire_Timer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.DoFireEffectForClient
// (Defined, Public)

void UwTurret_FNM240_Fire::DoFireEffectForClient()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.DoFireEffectForClient");

	UwTurret_FNM240_Fire_DoFireEffectForClient_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.DoFireEffect
// (Defined, Public)

void UwTurret_FNM240_Fire::DoFireEffect()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.DoFireEffect");

	UwTurret_FNM240_Fire_DoFireEffect_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurret_FNM240_Fire.ModeDoFire
// (Defined, Event, Public)

void UwTurret_FNM240_Fire::ModeDoFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurret_FNM240_Fire.ModeDoFire");

	UwTurret_FNM240_Fire_ModeDoFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.ClearParts
// (Defined, Simulated, Public)

void AwGunAttachment::ClearParts()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.ClearParts");

	AwGunAttachment_ClearParts_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.AddParts
// (Defined, Simulated, Public)
// Parameters:
// int                            iWeaponID                      (Parm)
// int                            iAddPartsID                    (Parm)

void AwGunAttachment::AddParts(int iWeaponID, int iAddPartsID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.AddParts");

	AwGunAttachment_AddParts_Params params;
	params.iWeaponID = iWeaponID;
	params.iAddPartsID = iAddPartsID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.wLoadOut
// (Defined, Simulated, Event, Public)
// Parameters:
// int                            iID                            (Parm)
// int                            iAddPartsID                    (Parm)

void AwGunAttachment::wLoadOut(int iID, int iAddPartsID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.wLoadOut");

	AwGunAttachment_wLoadOut_Params params;
	params.iID = iID;
	params.iAddPartsID = iAddPartsID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.ThirdPersonEffects
// (Defined, Simulated, Event, Public)

void AwGunAttachment::ThirdPersonEffects()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.ThirdPersonEffects");

	AwGunAttachment_ThirdPersonEffects_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.FakeThirdPersonEffects
// (Defined, Simulated, Public)
// Parameters:
// class AActor*                  HitActor                       (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)
// class UMaterial*               HitMaterial                    (Parm)

void AwGunAttachment::FakeThirdPersonEffects(class AActor* HitActor, const struct FVector& HitLocation, const struct FVector& HitNormal, class UMaterial* HitMaterial)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.FakeThirdPersonEffects");

	AwGunAttachment_FakeThirdPersonEffects_Params params;
	params.HitActor = HitActor;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;
	params.HitMaterial = HitMaterial;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.FakeUpdateTracer
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 LastHitLocation                (Parm)

void AwGunAttachment::FakeUpdateTracer(const struct FVector& LastHitLocation)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.FakeUpdateTracer");

	AwGunAttachment_FakeUpdateTracer_Params params;
	params.LastHitLocation = LastHitLocation;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.MakeSmoke
// (Defined, Simulated, Public)

void AwGunAttachment::MakeSmoke()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.MakeSmoke");

	AwGunAttachment_MakeSmoke_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.GetBoneNameSilencer
// (Defined, Simulated, Public)
// Parameters:
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwGunAttachment::GetBoneNameSilencer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.GetBoneNameSilencer");

	AwGunAttachment_GetBoneNameSilencer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wGunAttachment.GetBoneNameRotation
// (Defined, Simulated, Public)
// Parameters:
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwGunAttachment::GetBoneNameRotation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.GetBoneNameRotation");

	AwGunAttachment_GetBoneNameRotation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wGunAttachment.GetBoneNameTip
// (Defined, Simulated, Public)
// Parameters:
// FName                          ReturnValue                    (Parm, OutParm, ReturnParm)

FName AwGunAttachment::GetBoneNameTip()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.GetBoneNameTip");

	AwGunAttachment_GetBoneNameTip_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wGunAttachment.MakeSpawnShell
// (Defined, Simulated, Public)
// Parameters:
// bool                           bRechamber                     (OptionalParm, Parm)

void AwGunAttachment::MakeSpawnShell(bool bRechamber)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.MakeSpawnShell");

	AwGunAttachment_MakeSpawnShell_Params params;
	params.bRechamber = bRechamber;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.MakeMuzzleFlash
// (Defined, Simulated, Public)

void AwGunAttachment::MakeMuzzleFlash()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.MakeMuzzleFlash");

	AwGunAttachment_MakeMuzzleFlash_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.SpawnEmitter
// (Defined, Simulated, Public)
// Parameters:
// class UClass*                  EmitterClass                   (Parm)

void AwGunAttachment::SpawnEmitter(class UClass* EmitterClass)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.SpawnEmitter");

	AwGunAttachment_SpawnEmitter_Params params;
	params.EmitterClass = EmitterClass;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.UpdateHit
// (Defined, Public)
// Parameters:
// class AActor*                  HitActor                       (Parm)
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)
// class UMaterial*               HitMaterial                    (Parm)

void AwGunAttachment::UpdateHit(class AActor* HitActor, const struct FVector& HitLocation, const struct FVector& HitNormal, class UMaterial* HitMaterial)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.UpdateHit");

	AwGunAttachment_UpdateHit_Params params;
	params.HitActor = HitActor;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;
	params.HitMaterial = HitMaterial;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.UpdatePenetrateHit
// (Defined, Public)
// Parameters:
// class AActor*                  mHitActor                      (Parm)
// struct FVector                 mHitLocation                   (Parm)
// struct FVector                 mHitNormal                     (Parm)
// class UMaterial*               mHitMaterial                   (Parm)
// int                            mLastHitIdx                    (Parm)

void AwGunAttachment::UpdatePenetrateHit(class AActor* mHitActor, const struct FVector& mHitLocation, const struct FVector& mHitNormal, class UMaterial* mHitMaterial, int mLastHitIdx)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.UpdatePenetrateHit");

	AwGunAttachment_UpdatePenetrateHit_Params params;
	params.mHitActor = mHitActor;
	params.mHitLocation = mHitLocation;
	params.mHitNormal = mHitNormal;
	params.mHitMaterial = mHitMaterial;
	params.mLastHitIdx = mLastHitIdx;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.UpdateTracer
// (Defined, Simulated, Public)

void AwGunAttachment::UpdateTracer()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.UpdateTracer");

	AwGunAttachment_UpdateTracer_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wGunAttachment.GetTracerStart
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwGunAttachment::GetTracerStart()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.GetTracerStart");

	AwGunAttachment_GetTracerStart_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wGunAttachment.Destroyed
// (Defined, Simulated, Public)

void AwGunAttachment::Destroyed()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wGunAttachment.Destroyed");

	AwGunAttachment_Destroyed_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurretAttachmet.MakeSmoke
// (Defined, Simulated, Public)

void AwTurretAttachmet::MakeSmoke()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurretAttachmet.MakeSmoke");

	AwTurretAttachmet_MakeSmoke_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurretAttachmet.MakeMuzzleFlash
// (Defined, Simulated, Public)

void AwTurretAttachmet::MakeMuzzleFlash()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurretAttachmet.MakeMuzzleFlash");

	AwTurretAttachmet_MakeMuzzleFlash_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTurretAttachmet.GetTipLocation
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 ReturnValue                    (Parm, OutParm, ReturnParm)

struct FVector AwTurretAttachmet::GetTipLocation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTurretAttachmet.GetTipLocation");

	AwTurretAttachmet_GetTipLocation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketFire.StartFiring
// (Defined, Public)

void UwRocketFire::StartFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.StartFiring");

	UwRocketFire_StartFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketFire.PlayFiring
// (Defined, Public)

void UwRocketFire::PlayFiring()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.PlayFiring");

	UwRocketFire_PlayFiring_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketFire.ResetInputFire
// (Defined, Simulated, Public)

void UwRocketFire::ResetInputFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.ResetInputFire");

	UwRocketFire_ResetInputFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketFire.IsInputFire
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwRocketFire::IsInputFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.IsInputFire");

	UwRocketFire_IsInputFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketFire.CheckRPGAimMode
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool UwRocketFire::CheckRPGAimMode()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.CheckRPGAimMode");

	UwRocketFire_CheckRPGAimMode_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wRocketFire.ServerDoFire
// (Defined, Event, Public)

void UwRocketFire::ServerDoFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.ServerDoFire");

	UwRocketFire_ServerDoFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketFire.StartMuzzleSmoke
// (Defined, Public)

void UwRocketFire::StartMuzzleSmoke()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.StartMuzzleSmoke");

	UwRocketFire_StartMuzzleSmoke_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketFire.FlashMuzzleFlash
// (Defined, Public)

void UwRocketFire::FlashMuzzleFlash()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.FlashMuzzleFlash");

	UwRocketFire_FlashMuzzleFlash_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketFire.NewActiveStartFire
// (Defined, Simulated, Public)

void UwRocketFire::NewActiveStartFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.NewActiveStartFire");

	UwRocketFire_NewActiveStartFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wRocketFire.ModeDoFire
// (Defined, Event, Public)

void UwRocketFire::ModeDoFire()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wRocketFire.ModeDoFire");

	UwRocketFire_ModeDoFire_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wAirStrikeBomb.Explode
// (Defined, Simulated, Public)
// Parameters:
// struct FVector                 HitLocation                    (Parm)
// struct FVector                 HitNormal                      (Parm)

void AwAirStrikeBomb::Explode(const struct FVector& HitLocation, const struct FVector& HitNormal)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeBomb.Explode");

	AwAirStrikeBomb_Explode_Params params;
	params.HitLocation = HitLocation;
	params.HitNormal = HitNormal;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wAirStrikeBomb.PostBeginPlay
// (Defined, Simulated, Public)

void AwAirStrikeBomb::PostBeginPlay()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wAirStrikeBomb.PostBeginPlay");

	AwAirStrikeBomb_PostBeginPlay_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack.IsCanUseWeapon
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTelegraphPack::IsCanUseWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.IsCanUseWeapon");

	AwTelegraphPack_IsCanUseWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wTelegraphPack.ServerDestroy
// (Defined, Net, NetReliable, Public)

void AwTelegraphPack::ServerDestroy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.ServerDestroy");

	AwTelegraphPack_ServerDestroy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack.ChangePrevWeapon
// (Defined, Simulated, Public)

void AwTelegraphPack::ChangePrevWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.ChangePrevWeapon");

	AwTelegraphPack_ChangePrevWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack.AnimEnd
// (Defined, Simulated, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwTelegraphPack::AnimEnd(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.AnimEnd");

	AwTelegraphPack_AnimEnd_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack.UsedWeapon
// (Defined, Simulated, Public)

void AwTelegraphPack::UsedWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.UsedWeapon");

	AwTelegraphPack_UsedWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack.UseWeapon
// (Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTelegraphPack::UseWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.UseWeapon");

	AwTelegraphPack_UseWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wTelegraphPack.CheckTryToDrive
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTelegraphPack::CheckTryToDrive()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.CheckTryToDrive");

	AwTelegraphPack_CheckTryToDrive_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wTelegraphPack.wLoadOut
// (Defined, Simulated, Public)
// Parameters:
// int                            iID                            (Parm)
// int                            iAddPartsID                    (Parm)

void AwTelegraphPack::wLoadOut(int iID, int iAddPartsID)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack.wLoadOut");

	AwTelegraphPack_wLoadOut_Params params;
	params.iID = iID;
	params.iAddPartsID = iAddPartsID;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.InstallPack
// (Defined, Net, NetReliable, Public)

void AwTelegraphPack_Install::InstallPack()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.InstallPack");

	AwTelegraphPack_Install_InstallPack_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.ClientChangePrevWeapon
// (Defined, Net, NetReliable, Simulated, Public)

void AwTelegraphPack_Install::ClientChangePrevWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.ClientChangePrevWeapon");

	AwTelegraphPack_Install_ClientChangePrevWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.StopPlantAnimation
// (Defined, Simulated, Public)

void AwTelegraphPack_Install::StopPlantAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.StopPlantAnimation");

	AwTelegraphPack_Install_StopPlantAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.PlayPlantAnimation
// (Defined, Simulated, Public)

void AwTelegraphPack_Install::PlayPlantAnimation()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.PlayPlantAnimation");

	AwTelegraphPack_Install_PlayPlantAnimation_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.AnimEnd
// (Defined, Simulated, Public)
// Parameters:
// int                            Channel                        (Parm)

void AwTelegraphPack_Install::AnimEnd(int Channel)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.AnimEnd");

	AwTelegraphPack_Install_AnimEnd_Params params;
	params.Channel = Channel;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.PutDown
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTelegraphPack_Install::PutDown()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.PutDown");

	AwTelegraphPack_Install_PutDown_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wTelegraphPack_Install.IsCanUseWeapon
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTelegraphPack_Install::IsCanUseWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.IsCanUseWeapon");

	AwTelegraphPack_Install_IsCanUseWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wTelegraphPack_Install.DisplayEnableInstallMessage
// (Defined, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTelegraphPack_Install::DisplayEnableInstallMessage()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.DisplayEnableInstallMessage");

	AwTelegraphPack_Install_DisplayEnableInstallMessage_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


// Function WWeapons.wTelegraphPack_Install.BringUp
// (Defined, Simulated, Public)
// Parameters:
// class AwWeapon*                PrevWeapon                     (OptionalParm, Parm)

void AwTelegraphPack_Install::BringUp(class AwWeapon* PrevWeapon)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.BringUp");

	AwTelegraphPack_Install_BringUp_Params params;
	params.PrevWeapon = PrevWeapon;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.Tick
// (Defined, Simulated, Event, Public)
// Parameters:
// float                          Delta                          (Parm)

void AwTelegraphPack_Install::Tick(float Delta)
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.Tick");

	AwTelegraphPack_Install_Tick_Params params;
	params.Delta = Delta;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.ServerDestroy
// (Defined, Net, NetReliable, Public)

void AwTelegraphPack_Install::ServerDestroy()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.ServerDestroy");

	AwTelegraphPack_Install_ServerDestroy_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;
}


// Function WWeapons.wTelegraphPack_Install.UseWeapon
// (Defined, Simulated, Public)
// Parameters:
// bool                           ReturnValue                    (Parm, OutParm, ReturnParm)

bool AwTelegraphPack_Install::UseWeapon()
{
	static auto fn = UObject::FindObject<UFunction>("Function WWeapons.wTelegraphPack_Install.UseWeapon");

	AwTelegraphPack_Install_UseWeapon_Params params;

	auto flags = fn->FunctionFlags;

	UObject::ProcessEvent(fn, &params);

	fn->FunctionFlags = flags;

	return params.ReturnValue;
}


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
