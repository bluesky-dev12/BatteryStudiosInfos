class wWeaponRes_SplitGrenade extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Cluster Grenade.Cluster'
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Explosion=Class'XEffects.XWFX_SplitGrenade'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Cluster_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=512,W=128,H=32)
    fsound_Ready="Warfare_Sound_Weapon/TW/frag/ready"
    fsound_Fire="Warfare_Sound_Weapon/TW/frag/frag_fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/TW/frag/frag_fire"
    fsound_Explosion="Warfare_Sound_Weapon/TW/stun/frag_explode"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Select="Warfare_Sound_Weapon/TW/frag/select"
    fsound_Pickup="Warfare_Sound_Char/GetItem/char_getitem_weapon"
    fsound_Bullet_Impact="Warfare_Sound_Weapon/TW/frag/bound_stone"
    str_sound_Grenade="/Combat_team_near/v_cb_team_devas_M"
    bDelayedDamage=true
}