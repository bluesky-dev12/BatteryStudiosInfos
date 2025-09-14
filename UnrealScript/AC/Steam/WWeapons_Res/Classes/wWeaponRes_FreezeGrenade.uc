/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_FreezeGrenade.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_FreezeGrenade extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Stun Grenade.Stun_A'
    effect_Explosion=Class'XEffects.XWFX_Stun_explosion'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Stun_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=256,Y=444,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.frag.weapon_frag_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.stun.weapon_stun_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.stun.weapon_stun_fire'
    sound_Fire_Silencer=Sound'Warfare_Sound_Char.etc.char_hit_stunbomb'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.stun.weapon_stun_explode'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.stun.weapon_stun_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_bound_stone'
    str_sound_Grenade=".v_cb_team_stungrenade_M"
    rad_Fire=50.0
    bDelayedDamage=true
    UseHitStunAni=true
}