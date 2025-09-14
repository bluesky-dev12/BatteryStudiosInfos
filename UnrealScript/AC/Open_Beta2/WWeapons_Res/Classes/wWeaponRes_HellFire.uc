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
    fsound_Explosion="Warfare_Sound_Weapon/SP/RPG7/explosion"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Bullet_Move="Warfare_Sound_Weapon/HW/bombing/veh_bombing_whistle_02"
    bDelayedDamage=true
}