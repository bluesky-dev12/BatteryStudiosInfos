class wWeaponRes_FreezeGrenade extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Stun Grenade.Stun_A'
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Explosion=Class'XEffects.XWFX_Stun_explosion'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Stun_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=256,Y=444,W=128,H=32)
    fsound_Ready="Warfare_Sound_Weapon/TW/frag/ready"
    fsound_Fire="Warfare_Sound_Weapon/TW/stun/frag_fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/TW/stun/frag_fire_2d"
    fSound_Fire_Silencer="Warfare_Sound_Char/etc/hit_stunbomb"
    fsound_Explosion="Warfare_Sound_Weapon/TW/stun/frag_explode"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Select="Warfare_Sound_Weapon/TW/stun/select"
    fsound_Pickup="Warfare_Sound_Char/GetItem/char_getitem_weapon"
    fsound_Bullet_Impact="Warfare_Sound_Weapon/TW/frag/bound_stone"
    str_sound_Grenade="/Combat_team_near/v_cb_team_stungrenade_M"
    bDelayedDamage=true
    UseHitStunAni=true
}