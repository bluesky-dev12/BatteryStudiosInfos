class wWeaponRes_SplitGrenadeFragment extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_GR.Cluster Grenade.Cluster_Fragment'
    effect_Explosion=Class'XEffects.XWFX_SplitGndFragment_explo'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_GR_Cluster_A"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=512,W=128,H=32)
    sound_Ready=Sound'Warfare_Sound_Weapon.frag.weapon_frag_ready'
    sound_Fire=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.frag.weapon_frag_fire'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.devas.weapon_devas_explode'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.frag.weapon_frag_select'
    sound_Bullet_Impact=SoundGroup'Warfare_Sound_Weapon.frag.weapon_frag_bound_stone'
    rad_Fire=50.0000000
    rad_Explosion=1650.0000000
    bDelayedDamage=true
}