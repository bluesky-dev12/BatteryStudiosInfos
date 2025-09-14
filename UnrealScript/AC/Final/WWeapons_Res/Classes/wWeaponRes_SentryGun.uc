class wWeaponRes_SentryGun extends wWeaponRes_Base;

defaultproperties
{
    szClass_Shell="Xeffects.ShellSpewer_MG"
    szClass_Shell_3rd="Xeffects.ShellSpewer_MG_3rd"
    fTracerPop=0.3300000
    szClass_Muzz_1st="Xeffects.SR_MuzFlash_04_1RD"
    szClass_Muzz_3rd="Xeffects.SR_MuzFlash_04_3RD"
    szClass_Smoke_3rd="Xeffects.Sentry_Gun_MuzFlash_01_3RD"
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    szIcon_HUD="warfare_UI_Item.HUDIcon.Item_HUD_WP_ETC_Sentrygun"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=256,Y=988,W=128,H=32)
    szType_DisplayAmmo="ammo50"
    fsound_Fire="Warfare_Sound_Weapon/SP/SentryGun/fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/SP/SentryGun/fire_s"
    fsound_Fire_Shell="Warfare_Sound_Weapon/ETC/shell/shell_762mm"
    fsound_Fire_Empty="Warfare_Sound_Weapon/ETC/dryfire/weapon_ar_fire_nobullet"
    fsound_Select="Warfare_Sound_Weapon/SP/SentryGun/select"
    fsound_Select_New="Warfare_Sound_Weapon/SP/SentryGun/select_n"
}