class wWeaponRes_FragGrenade_Easter_A extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Frag Grenade.Frag_EasterA'
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Explosion=Class'XEffects.XWFX_Grenade_explosion_easter_A'
    effect_Explosion_dirt=Class'XEffects.XWFX_Grenade_explosion_easter_A'
    effect_Explosion_grass=Class'XEffects.XWFX_Grenade_explosion_easter_A'
    effect_Explosion_metal=Class'XEffects.XWFX_Grenade_explosion_easter_A'
    effect_Explosion_snow=Class'XEffects.XWFX_Grenade_explosion_easter_A'
    effect_Explosion_water=Class'XEffects.XWFX_Grenade_explosion_easter_A'
    effect_Explosion_wood=Class'XEffects.XWFX_Grenade_explosion_easter_A'
    Proj_ExplosionDecal=Class'XEffects.Event_Cash_Gacha_Easter_GR_mark_01'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Frag_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=240,W=128,H=32)
    fsound_Ready="Warfare_Sound_Weapon/TW/Frag_Easter/ready"
    fsound_Fire="Warfare_Sound_Weapon/TW/Frag_Easter/frag_fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/TW/Frag_Easter/frag_fire_2d"
    fsound_Explosion="Warfare_Sound_Weapon/TW/Frag_Easter/frag_explode"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Select="Warfare_Sound_Weapon/TW/Frag_Easter/select"
    fsound_Pickup="Warfare_Sound_Char/GetItem/char_getitem_weapon"
    fsound_Bullet_Impact="Warfare_Sound_Weapon/TW/Frag_Easter/bound_stone"
    str_sound_Grenade="/Combat_team_near/v_cb_team_grenade_M"
    bDelayedDamage=true
}