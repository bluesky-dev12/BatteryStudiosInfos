class wWeaponRes_HellFire extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_HW.Artillery'
    effect_Explosion=Class'XEffects.XWFX_Artillery_explosion'
    Proj_Smoke=Class'XEffects.WFX_ArtilleryTrailSmoke'
    Proj_Corona=Class'XEffects.RocketCorona'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_Kill="Warfare_UI_Item.KillIcon.Item_Kill_WP_ETC_TargetIndicator"
    szType_DisplayAmmo="ammoRPG"
    sound_Explosion=SoundGroup'Warfare_Sound_Vehicle.bombing.veh_bombing_burst_near'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Bullet_Move=SoundGroup'Warfare_Sound_Vehicle.bombing.veh_bombing_whistle'
    rad_Explosion=2200.0000000
    rad_Bullet_Move=3000.0000000
    bDelayedDamage=true
}