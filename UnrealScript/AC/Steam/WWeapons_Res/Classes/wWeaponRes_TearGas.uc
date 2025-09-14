/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_TearGas.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_TearGas extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Smoke Grenade.smoke_a'
    effect_Explosion=Class'XEffects.XWFX_Grenade_smoke'
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=384,Y=886,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.Smoke.weapon_smoke_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.Smoke.weapon_smoke_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.Smoke.weapon_smoke_fire'
    sound_Explosion=Sound'Warfare_Sound_Weapon.Smoke.weapon_smoke_explode'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.Smoke.weapon_smoke_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_bound_stone'
    str_sound_Grenade=".v_cb_team_smoke_M"
    rad_Fire=50.0
}