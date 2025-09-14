class wWeaponRes_SatchelCharge extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Satchel Charge C4.SatchelChargeC4'
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Explosion=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_dirt=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_grass=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_metal=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_snow=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_water=Class'XEffects.XWFX_Time_C4_explosion'
    effect_Explosion_wood=Class'XEffects.XWFX_Time_C4_explosion'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_SatchelChargeC4"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=274,W=128,H=32)
    fsound_Ready="Warfare_Sound_Weapon/HW/satchelchargec4/ready"
    fsound_Fire="Warfare_Sound_Weapon/HW/satchelchargec4/fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/HW/satchelchargec4/fire_s"
    fsound_Explosion="Warfare_Sound_Weapon/TW/frag/frag_explode"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/Knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/Knife/weapon_melee_knife_miss"
    fsound_Select="Warfare_Sound_Weapon/HW/SatchelChargeC4/select"
    fsound_Bullet_Impact="Warfare_Sound_Weapon/HW/SatchelChargeC4/bound"
    str_sound_Grenade="/Combat_team_near/v_cb_team_timec4_M"
    iCollisionRadius=16
    iCollisionHeight=5
    bDelayedDamage=true
}