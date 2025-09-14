/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_HeliGun.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_HeliGun extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_127"
    szClass_Shell_3rd="Xeffects.ShellSpewer_127_3rd"
    szClass_Muzz_3rd="XEffects.Heli_Gun_MuzFlash_3RD"
    effect_Explosion=Class'XEffects.HitEffect_heli_attack_hit'
    Proj_Smoke=Class'XEffects.WFX_HeliTrailSmoke'
    Proj_Corona=Class'XEffects.RocketCorona'
    Proj_ExplosionDecal=Class'XEffects.HitEffect_heli_attack_BulletHole'
    szType_DisplayAmmo="ammoRPG"
    sound_Fire=Sound'Warfare_Sound_Weapon.heli.weapon_heli_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.heli.weapon_heli_fire'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.heli.weapon_heli_explode'
    rad_Fire=850.0
}