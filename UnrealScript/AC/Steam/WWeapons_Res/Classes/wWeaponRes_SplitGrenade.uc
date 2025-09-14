/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_SplitGrenade.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_SplitGrenade extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Cluster Grenade.Cluster'
    effect_Explosion=Class'XEffects.XWFX_SplitGrenade'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Cluster_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=512,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.frag.weapon_frag_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.stun.weapon_stun_explode'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.frag.weapon_frag_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_bound_stone'
    str_sound_Grenade=".v_cb_team_devas_M"
    rad_Fire=50.0
    bDelayedDamage=true
}