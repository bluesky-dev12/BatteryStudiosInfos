class wWeaponRes_Target extends wWeaponRes_Base;

defaultproperties
{
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_ETC_TargetIndicator"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=0,Y=2,W=128,H=32)
    sound_Fire=Sound'Warfare_Sound_Weapon.Target.weapon_target_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.Target.weapon_target_fire'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Select=Sound'Warfare_Sound_Weapon.Target.weapon_target_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
}