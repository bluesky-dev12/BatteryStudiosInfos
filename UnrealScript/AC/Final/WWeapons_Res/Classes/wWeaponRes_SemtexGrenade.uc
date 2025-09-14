class wWeaponRes_SemtexGrenade extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Centex grenade.Centex'
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Explosion=Class'XEffects.XWFX_SemtexGrenade_explo'
    effect_Explosion_dirt=Class'XEffects.XWFX_SemtexGrenade_explo'
    effect_Explosion_grass=Class'XEffects.XWFX_SemtexGrenade_explo'
    effect_Explosion_metal=Class'XEffects.XWFX_SemtexGrenade_explo'
    effect_Explosion_snow=Class'XEffects.XWFX_SemtexGrenade_explo'
    effect_Explosion_water=Class'XEffects.XWFX_SemtexGrenade_explo'
    effect_Explosion_wood=Class'XEffects.XWFX_SemtexGrenade_explo'
    effect_StartFuse=Class'XEffects.SemtexGrenade_Glow_Red_3rd'
    effect_Idle_1st=Class'XEffects.SemtexGrenade_Glow_Green_1st'
    effect_Idle_3rd=Class'XEffects.SemtexGrenade_Glow_Green_3rd'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Frag_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=988,W=128,H=32)
    fsound_Ready="Warfare_Sound_Weapon/TW/frag/ready"
    fsound_Fire="Warfare_Sound_Weapon/TW/frag/frag_fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/TW/frag/frag_fire_2d"
    fsound_Explosion="Warfare_Sound_Weapon/TW/frag/frag_explode"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Select="Warfare_Sound_Weapon/TW/frag/select"
    fsound_Pickup="Warfare_Sound_Char/GetItem/char_getitem_weapon"
    fsound_Bullet_Impact="Warfare_Sound_Weapon/TW/frag/bound_stone"
    fsound_Start_Fuse="Warfare_Sound_ATS/com/ats_com_semtex_countdown"
    str_sound_Grenade="/Combat_team_near/v_cb_team_grenade_M"
    bDelayedDamage=true
}