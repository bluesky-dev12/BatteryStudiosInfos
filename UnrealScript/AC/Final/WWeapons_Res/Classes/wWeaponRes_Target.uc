class wWeaponRes_Target extends wWeaponRes_Base;

defaultproperties
{
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_PointMark=Class'XEffects.WFX_PinpointBomb_redmark'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_ETC_TargetIndicator"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=2,W=128,H=32)
    fsound_Fire="Warfare_Sound_Weapon/HW/Target/fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/HW/Target/fire"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Select="Warfare_Sound_Weapon/HW/Target/select"
    fsound_Pickup="Warfare_Sound_Char/GetItem/char_getitem_weapon"
}