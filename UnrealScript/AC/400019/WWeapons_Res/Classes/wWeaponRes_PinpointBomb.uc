class wWeaponRes_PinpointBomb extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_HW.Hydra_Rocket'
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Explosion=Class'XEffects.XWFX_Grenade_explosion'
    Proj_Smoke=Class'XEffects.WFX_PinpointBombTrailSmoke'
    Proj_Corona=Class'XEffects.RocketCorona'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=750,W=128,H=32)
    szType_DisplayAmmo="ammoRPG"
    fsound_Explosion="Warfare_Sound_Weapon/SP/RPG7/explosion"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Bullet_Move="Warfare_Sound_Vehicle/Bombing/veh_bombing_whistle"
    bDelayedDamage=true
}