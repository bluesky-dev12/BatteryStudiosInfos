/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_M4Custom.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_M4Custom extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_762"
    szClass_Shell_3rd="Xeffects.ShellSpewer_762_3rd"
    fTracerPop=0.50
    szClass_Muzz_1st="Xeffects.AR_MuzFlash_03_1RD_M4A1"
    szClass_Muzz_3rd="Xeffects.AR_MuzFlash_03_3RD_M4A1"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.AR_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_AR_M4A1Custom"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=750,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_fire_s'
    sound_Fire_Silencer=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_fire_silencer'
    sound_Fire_Silencer_Stereo=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_fire_silencer_s'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_762mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_ar_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_miss'
    sound_Reload=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_reload_empty'
    sound_Select=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    sound_Select_New=Sound'Warfare_Sound_Weapon.m4a1.weapon_m4a1_select_n'
}