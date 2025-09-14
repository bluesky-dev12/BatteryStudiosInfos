class wWeaponRes_HeliRPG7 extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_HW.Hydra_Rocket'
    szClass_Muzz_3rd="XEffects.Heli_RPG_MuzFlash_3RD"
    effect_Explosion=Class'XEffects.XWFX_Grenade_explosion'
    effect_Explosion_dirt=Class'XEffects.XWFX_Grenade_explosion_dirt'
    effect_Explosion_grass=Class'XEffects.XWFX_Grenade_explosion_grass'
    effect_Explosion_metal=Class'XEffects.XWFX_Grenade_explosion_metal'
    effect_Explosion_snow=Class'XEffects.XWFX_Grenade_explosion_snow'
    effect_Explosion_water=Class'XEffects.XWFX_Grenade_explosion_water'
    effect_Explosion_wood=Class'XEffects.XWFX_Grenade_explosion_wood'
    Proj_Smoke=Class'XEffects.WFX_HeliRocketSmoke'
    Proj_Corona=Class'XEffects.RocketCorona'
    Proj_ExplosionDecal=Class'XEffects.RocketMark_gr'
    szType_DisplayAmmo="ammoRPG"
    sound_Fire=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_fire_s'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.RPG.weapon_rpg7_explosion'
    sound_Bullet_Move=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_projectile'
    rad_Fire=400.0000000
    rad_Explosion=350.0000000
    rad_Bullet_Move=500.0000000
    bDelayedDamage=true
}