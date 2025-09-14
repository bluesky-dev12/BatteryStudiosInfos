class wWeaponRes_MG3 extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_MG"
    szClass_Shell_3rd="Xeffects.ShellSpewer_MG_3rd"
    fTracerPop=0.3300000
    szClass_Muzz_1st="Xeffects.MG_MuzFlash_01_1RD"
    szClass_Muzz_3rd="Xeffects.MG_MuzFlash_01_3RD"
    szClass_Smoke_1st="Xeffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.AR_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_HW_M249"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=384,Y=2,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.mg3.weapon_mg3_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.mg3.weapon_mg3_fire'
    sound_Fire_Silencer=Sound'Warfare_Sound_Weapon.ak47.weapon_ak47_fire_silencer'
    sound_Fire_Silencer_Stereo=Sound'Warfare_Sound_Weapon.ak47.weapon_ak47_fire_silencer'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_762mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_ar_fire_nobullet'
    sound_Melee_Ok=Sound'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_attack_01'
    sound_Melee_Miss=Sound'Warfare_Sound_Weapon.buttplate.weapon_melee_buttplate_miss_01'
    sound_Reload=Sound'Warfare_Sound_Weapon.ak47.weapon_ak47_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.ak47.weapon_ak47_reload_empty'
    sound_Select=Sound'Warfare_Sound_Weapon.ak47.weapon_ak47_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
}