class wWeaponRes_M2B extends wWeaponRes_Base;

defaultproperties
{
    szClass_Muzz_1st="Xeffects.EF_Flash_M2B_Fire"
    szClass_Muzz_3rd="Xeffects.EF_Flash_3rd_M2B_Fire"
    szClass_Smoke_1st="XEffects.AssaultMuzzleSmoke"
    szClass_Smoke_3rd="XEffects.EF_Flash_3rd_M2B_smoke"
    effect_Melee_Attack1=Class'XEffects.HitEffect_knife_Meleeattack'
    effect_Melee_Attack2=Class'XEffects.HitEffect_knife_Meleeattack'
    Proj_FlameEmitter=Class'XEffects.EF_Bullet_M2B_Fire'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_HW_M2B"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=256,Y=2,W=128,H=32)
    fsound_Ready="Warfare_Sound_Weapon/SP/m2b/fire_start"
    fsound_Fire="Warfare_Sound_Weapon/SP/m2b/fire"
    fsound_Fire_Stereo="Warfare_Sound_Weapon/SP/m2b/fire"
    fsound_Fire_Stop="Warfare_Sound_Weapon/SP/m2b/fire_end"
    fsound_Fire_Empty="Warfare_Sound_Weapon/SP/m2b/fire_empty"
    fsound_Melee_Ok="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_attack"
    fsound_Melee_Miss="Warfare_Sound_Weapon/ETC/knife/weapon_melee_knife_miss"
    fsound_Select="Warfare_Sound_Weapon/SP/m2b/select"
    fsound_Pickup="Warfare_Sound_Char/GetItem/char_getitem_weapon"
    bDelayedDamage=true
}