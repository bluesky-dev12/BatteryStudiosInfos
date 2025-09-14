/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_M1897.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_M1897 extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_Gage_Red"
    szClass_Shell_3rd="Xeffects.ShellSpewer_Gage_Red_3rd"
    fTracerPop=1.0
    szClass_Muzz_1st="Xeffects.SG_MuzFlash_01_1RD"
    szClass_Muzz_3rd="Xeffects.SG_MuzFlash_01_3RD"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.AR_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_AR_M1897"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=818,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_fire_s'
    sound_Fire_Silencer_Stereo=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_fire_silencer_s'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_762mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_ar_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_miss'
    sound_Rechamber=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_rechamber'
    sound_Reload=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_reload_loop'
    sound_ReloadBegin=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_reload_start'
    sound_ReloadEnd=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_reload_end'
    sound_Select=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    sound_Select_New=Sound'Warfare_Sound_Weapon.M1897.weapon_M1897_select_n'
}