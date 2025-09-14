class wWeaponRes_Artillery extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_HW.Artillery'
    effect_Explosion=Class'XEffects.XWFX_Artillery_explosion'
    Proj_Smoke=Class'XEffects.WFX_ArtilleryTrailSmoke'
    Proj_SmokeEx=Class'XEffects.Alien_omega_airstrike'
    Proj_Corona=Class'XEffects.RocketCorona'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=2,W=128,H=32)
    szType_DisplayAmmo="ammoRPG"
    fsound_Explosion="Warfare_Sound_Vehicle/bombing/veh_bombing_explode"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Bullet_Move="Warfare_Sound_Vehicle/bombing/veh_bombing_whistle"
    bDelayedDamage=true
}