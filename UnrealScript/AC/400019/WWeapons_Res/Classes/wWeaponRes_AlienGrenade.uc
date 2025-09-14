class wWeaponRes_AlienGrenade extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Frag Grenade.Frag_A'
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Explosion=Class'XEffects.XWFX_Grenade_explosion'
    effect_Explosion_dirt=Class'XEffects.XWFX_Grenade_explosion_dirt'
    effect_Explosion_grass=Class'XEffects.XWFX_Grenade_explosion_grass'
    effect_Explosion_metal=Class'XEffects.XWFX_Grenade_explosion_metal'
    effect_Explosion_snow=Class'XEffects.XWFX_Grenade_explosion_snow'
    effect_Explosion_water=Class'XEffects.XWFX_Grenade_explosion_water'
    effect_Explosion_wood=Class'XEffects.XWFX_Grenade_explosion_wood'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Frag_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=240,W=128,H=32)
    fsound_Explosion="Warfare_Sound_Defense_Mode/Monster_theta/char_enemy_attack_theta"
    str_sound_Grenade="/Combat_team_near/v_cb_team_grenade_M"
    bDelayedDamage=true
}