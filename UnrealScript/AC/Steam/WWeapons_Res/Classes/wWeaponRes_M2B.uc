/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_M2B.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_M2B extends wWeaponRes_Base;

defaultproperties
{
    szClass_Muzz_1st="Xeffects.EF_Flash_M2B_Fire"
    szClass_Muzz_3rd="Xeffects.EF_Flash_3rd_M2B_Fire"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="XEffects.EF_Flash_3rd_M2B_smoke"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_HW_M2B"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=256,Y=2,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.m2b.weapon_m2b_fire_start'
    sound_Fire=Sound'Warfare_Sound_Weapon.m2b.weapon_m2b_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.m2b.weapon_m2b_fire'
    sound_Fire_Stop=Sound'Warfare_Sound_Weapon.m2b.weapon_m2b_fire_end'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.m2b.weapon_m2b_fire_empty'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.m2b.weapon_m2b_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    bDelayedDamage=true
}