/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_IncGrenadeFlame.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_IncGrenadeFlame extends wWeaponRes_Base;

defaultproperties
{
    effect_Explosion=Class'XEffects.XWFX_IncGrenade_Flame_Ally'
    effect_Explosion_dirt=Class'XEffects.XWFX_IncGrenade_Flame_Ally'
    effect_Explosion_grass=Class'XEffects.XWFX_IncGrenade_Flame_Ally'
    effect_Explosion_metal=Class'XEffects.XWFX_IncGrenade_Flame_Ally'
    effect_Explosion_snow=Class'XEffects.XWFX_IncGrenade_Flame_Ally'
    effect_Explosion_water=Class'XEffects.XWFX_IncGrenade_Flame_Ally'
    effect_Explosion_wood=Class'XEffects.XWFX_IncGrenade_Flame_Ally'
    effect_Explosion_enemy=Class'XEffects.XWFX_IncGrenade_Flame_Enemy'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Incen_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=206,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.frag.weapon_frag_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Explosion=Sound'Warfare_Sound_Weapon.Incendiary.weapon_Incendiary_fire_loop'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.frag.weapon_frag_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_bound_stone'
    rad_Explosion=100.0
    bDelayedDamage=true
}