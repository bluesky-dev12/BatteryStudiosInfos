/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_SatchelCharge.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_SatchelCharge extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Satchel Charge C4.SatchelChargeC4'
    effect_Explosion=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_dirt=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_grass=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_metal=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_snow=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_water=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_wood=Class'XEffects.XWFX_Time_C4_explosion'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_SatchelChargeC4"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=274,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.SatchelChargeC4.weapon_satchelc4_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.SatchelChargeC4.weapon_satchelc4_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.SatchelChargeC4.weapon_satchelc4_fire'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_explode'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.SatchelChargeC4.weapon_satchelc4_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.SatchelChargeC4.weapon_satchelc4_bound'
    str_sound_Grenade=".v_cb_team_timec4_M"
    rad_Fire=50.0
    rad_Explosion=450.0
    iCollisionRadius=16
    iCollisionHeight=5
    bDelayedDamage=true
}