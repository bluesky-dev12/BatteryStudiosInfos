class wWeaponRes_FragGrenade_xmas extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Frag Grenade.Frag_Xmas'
    effect_Explosion=Class'XEffects.XWFX_Grenade_explosion'
    effect_Explosion_dirt=Class'XEffects.XWFX_Grenade_explosion_dirt'
    effect_Explosion_grass=Class'XEffects.XWFX_Grenade_explosion_grass'
    effect_Explosion_metal=Class'XEffects.XWFX_Grenade_explosion_metal'
    effect_Explosion_snow=Class'XEffects.XWFX_Grenade_explosion_snow'
    effect_Explosion_water=Class'XEffects.XWFX_Grenade_explosion_water'
    effect_Explosion_wood=Class'XEffects.XWFX_Grenade_explosion_wood'
    Proj_ExplosionDecal=Class'XEffects.Event_Cash_Gacha_XMAS_GR_mark_01'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Frag_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=240,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.frag.weapon_frag_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.Frag_Xmas.weapon_frag_xmas_explode'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.frag.weapon_frag_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_bound_stone'
    str_sound_Grenade=".v_cb_team_grenade_M"
    rad_Fire=50.0000000
    bDelayedDamage=true
}