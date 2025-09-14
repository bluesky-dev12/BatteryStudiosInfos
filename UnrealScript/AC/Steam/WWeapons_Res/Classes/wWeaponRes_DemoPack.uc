/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_DemoPack.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_DemoPack extends wWeaponRes_Base;

defaultproperties
{
    effect_Explosion=Class'XEffects.XWFX_SD_Bomb_explosion'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_ETC_DemoPack"
    sound_Fire=Sound'Warfare_Sound_Weapon.DemolitionPack.weapon_demolition_plant'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.DemolitionPack.weapon_demolition_plant'
    sound_Fire_Silencer=Sound'Warfare_Sound_Weapon.DemolitionPack.weapon_demolition_defuse'
    sound_Fire_Silencer_Stereo=Sound'Warfare_Sound_Weapon.DemolitionPack.weapon_demolition_defuse'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.DemolitionPack.weapon_demolition_explode'
    rad_Fire=80.0
    rad_Fire_Silencer=100.0
    rad_Explosion=3000.0
    SkipDeathIncrement=true
}