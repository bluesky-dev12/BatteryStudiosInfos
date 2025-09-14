/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_HellFire.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_HellFire extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_HW.Hydra_Rocket'
    effect_Explosion=Class'XEffects.XWFX_Grenade_explosion'
    Proj_Smoke=Class'XEffects.WFX_HeliRocketSmoke'
    Proj_Corona=Class'XEffects.RocketCorona'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_Kill="Warfare_UI_Item.KillIcon.Item_Kill_WP_ETC_TargetIndicator"
    szType_DisplayAmmo="ammoRPG"
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.RPG.weapon_rpg7_explosion'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Bullet_Move=Sound'Warfare_Sound_Vehicle.bombing.veh_bombing_whistle_02'
    rad_Explosion=850.0
    rad_Bullet_Move=700.0
    bDelayedDamage=true
}