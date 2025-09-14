/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_BarrettM82A1.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_BarrettM82A1 extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_127"
    szClass_Shell_3rd="Xeffects.ShellSpewer_127_3rd"
    fTracerPop=1.0
    szClass_Muzz_1st="Xeffects.SR_MuzFlash_02_1RD"
    szClass_Muzz_3rd="Xeffects.SR_MuzFlash_02_3RD"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.SR_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_SR_BARRETT"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=546,W=128,H=32)
    szType_DisplayAmmo="ammoSniper"
    sound_Fire=Sound'Warfare_Sound_Weapon.BarrettM82.weapon_BarrettM82_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.BarrettM82.weapon_BarrettM82_fire_s'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_762mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_sr_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_miss'
    sound_Rechamber=Sound'Warfare_Sound_Weapon.CheyTac.weapon_cheytaclrrs_rechamber'
    sound_Reload=Sound'Warfare_Sound_Weapon.BarrettM82.weapon_BarrettM82_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.BarrettM82.weapon_BarrettM82_reload_empty'
    sound_Select=Sound'Warfare_Sound_Weapon.BarrettM82.weapon_BarrettM82_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    sound_Select_New=Sound'Warfare_Sound_Weapon.BarrettM82.weapon_BarrettM82_select_n'
}