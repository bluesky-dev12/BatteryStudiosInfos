/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_G3.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_G3 extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_762"
    szClass_Shell_3rd="Xeffects.ShellSpewer_762_3rd"
    fTracerPop=0.50
    szClass_Muzz_1st="Xeffects.AR_MuzFlash_02_1RD"
    szClass_Muzz_3rd="Xeffects.AR_MuzFlash_02_3RD"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.AR_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_AR_G3"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=206,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.g3.weapon_g3_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.g3.weapon_g3_fire_s'
    sound_Fire_Silencer=Sound'Warfare_Sound_Weapon.g3.weapon_g3_fire_silencer'
    sound_Fire_Silencer_Stereo=Sound'Warfare_Sound_Weapon.g3.weapon_g3_fire_silencer_s'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_762mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_ar_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_miss'
    sound_Reload=Sound'Warfare_Sound_Weapon.g3.weapon_g3_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.g3.weapon_g3_reload_empty'
    sound_Select=Sound'Warfare_Sound_Weapon.g3.weapon_g3_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    sound_Select_New=Sound'Warfare_Sound_Weapon.g3.weapon_g3_select_n'
}