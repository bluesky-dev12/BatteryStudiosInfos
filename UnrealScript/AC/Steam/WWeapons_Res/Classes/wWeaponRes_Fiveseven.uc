/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_Fiveseven.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_Fiveseven extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_9"
    szClass_Shell_3rd="Xeffects.ShellSpewer_9_3rd"
    fTracerPop=1.0
    szClass_Muzz_1st="Xeffects.Pistol_MuzFlash_01_1RD"
    szClass_Muzz_3rd="Xeffects.Pistol_MuzFlash_01_3RD"
    szClass_Smoke_1st="XEffects.PistolMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.Pistol_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_PS_SigP229"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=274,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.SigP229.weapon_SIGP229_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.FiveseveN.weapon_Five-seveN_fire_s'
    sound_Fire_Silencer=Sound'Warfare_Sound_Weapon.glock17.weapon_glock17_fire_silencer'
    sound_Fire_Silencer_Stereo=Sound'Warfare_Sound_Weapon.FiveseveN.weapon_Five-seveN_fire_silencer_s'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_9mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_pistol_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Reload=Sound'Warfare_Sound_Weapon.SigP229.weapon_SIGP229_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.SigP229.weapon_SIGP229_reload_empty'
    sound_Select=Sound'Warfare_Sound_Weapon.SigP229.weapon_SIGP229_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
}