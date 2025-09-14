/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_HeliAK47.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_HeliAK47 extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_762"
    szClass_Shell_3rd="Xeffects.ShellSpewer_762_3rd"
    fTracerPop=0.330
    szClass_Muzz_1st="Xeffects.AR_MuzFlash_01_1RD"
    szClass_Muzz_3rd="Xeffects.AR_MuzFlash_01_3RD"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.heli.weapon_heli_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.heli.weapon_heli_fire'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_762mm'
    rad_Fire=1700.0
    bDelayedDamage=true
}