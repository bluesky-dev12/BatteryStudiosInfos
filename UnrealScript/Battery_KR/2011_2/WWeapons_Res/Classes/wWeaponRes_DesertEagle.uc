class wWeaponRes_DesertEagle extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_50AE"
    szClass_Shell_3rd="Xeffects.ShellSpewer_50AE_3rd"
    fTracerPop=1.0000000
    szClass_Muzz_1st="Xeffects.AR_MuzFlash_01_1RD"
    szClass_Muzz_3rd="Xeffects.Pistol_MuzFlash_01_3RD"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="Xeffects.Pistol_MuzFlash_smoke_3rd"
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_PS_DesertEagle"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=512,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    sound_Fire=Sound'Warfare_Sound_Weapon.DesertEagle.weapon_DesertEagle_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.DesertEagle.weapon_DesertEagle_fire'
    sound_Fire_Silencer=Sound'Warfare_Sound_Weapon.DesertEagle.weapon_DesertEagle_fire_silencer'
    sound_Fire_Silencer_Stereo=Sound'Warfare_Sound_Weapon.DesertEagle.weapon_DesertEagle_fire_silencer'
    sound_Fire_Shell=SoundGroup'Warfare_Sound_Weapon.shell.shell_9mm'
    sound_Fire_Empty=Sound'Warfare_Sound_Weapon.dryfire.weapon_pistol_fire_nobullet'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Reload=Sound'Warfare_Sound_Weapon.DesertEagle.weapon_DesertEagle_reload'
    sound_ReloadEmpty=Sound'Warfare_Sound_Weapon.DesertEagle.weapon_DesertEagle_reload_empty'
    sound_Select=Sound'Warfare_Sound_Weapon.DesertEagle.weapon_DesertEagle_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
}