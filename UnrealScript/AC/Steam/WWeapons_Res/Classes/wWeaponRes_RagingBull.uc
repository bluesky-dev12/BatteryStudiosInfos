/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_RagingBull.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_RagingBull extends wWeaponRes_Base;

defaultproperties
{
    fTracerPop=1.0
    szClass_Muzz_1st="Xeffects.Pistol_MuzFlash_01_1RD"
    szClass_Muzz_3rd="Xeffects.Pistol_MuzFlash_01_3RD"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.pistol_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_PS_RagingBull"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=70,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.RagingBull.weapon_ragingbull_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.RagingBull.weapon_ragingbull_fire_s'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_9mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_pistol_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Reload=Sound'Warfare_Sound_Weapon.RagingBull.weapon_ragingbull_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.RagingBull.weapon_ragingbull_reload'
    sound_Select=Sound'Warfare_Sound_Weapon.RagingBull.weapon_ragingbull_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    Use2ndAni=true
}