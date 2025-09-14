class wWeaponRes_M21 extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_762"
    szClass_Shell_3rd="Xeffects.ShellSpewer_762_3rd"
    fTracerPop=1.0000000
    szClass_Muzz_1st="Xeffects.SR_MuzFlash_01_1RD"
    szClass_Muzz_3rd="Xeffects.SR_MuzFlash_01_3RD"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.SR_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_SR_M21"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=240,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.M21.weapon_m21_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.M21.weapon_m21_fire_s'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_762mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_sr_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_miss'
    sound_Reload=Sound'Warfare_Sound_Weapon.M21.weapon_m21_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.M21.weapon_m21_reload_empty'
    sound_Select=Sound'Warfare_Sound_Weapon.M21.weapon_m21_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    sound_Select_New=Sound'Warfare_Sound_Weapon.M21.weapon_M21_select_n'
}