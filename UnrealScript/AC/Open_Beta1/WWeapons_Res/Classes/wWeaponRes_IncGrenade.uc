class wWeaponRes_IncGrenade extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Incen Grenade.Incen'
    effect_Explosion=Class'XEffects.XWFX_IncGrenade_explosion'
    effect_Explosion_dirt=Class'XEffects.XWFX_IncGrenade_explosion'
    effect_Explosion_grass=Class'XEffects.XWFX_IncGrenade_explosion'
    effect_Explosion_metal=Class'XEffects.XWFX_IncGrenade_explosion'
    effect_Explosion_snow=Class'XEffects.XWFX_IncGrenade_explosion'
    effect_Explosion_water=Class'XEffects.XWFX_IncGrenade_explosion'
    effect_Explosion_wood=Class'XEffects.XWFX_IncGrenade_explosion'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Incen_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=206,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.Incendiary.weapon_Incendiary_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.Incendiary.weapon_Incendiary_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.Incendiary.weapon_Incendiary_fire'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.Incendiary.weapon_Incendiary_explode'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.Incendiary.weapon_Incendiary_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_bound_stone'
    str_sound_Grenade=".v_cb_team_incendi_M"
    rad_Fire=50.0000000
    iCollisionRadius=6
    iCollisionHeight=6
    bDelayedDamage=true
}