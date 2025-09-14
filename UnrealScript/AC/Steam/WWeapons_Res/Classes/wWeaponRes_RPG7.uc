/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons_Res\Classes\wWeaponRes_RPG7.uc
 * Package Imports:
 *	WWeapons_Res
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wWeaponRes_RPG7 extends wWeaponRes_Base;

defaultproperties
{
    stProj=StaticMesh'WPS_HW.Rpg7_Warhead'
    szClass_Muzz_1st="Xeffects.RPG_MuzFlash_1RD"
    szClass_Muzz_3rd="XEffects.RPG_MuzFlash_smoke_F_3RD"
    szClass_Smoke_1st="XEffects.RPG_MuzzleSmoke_1RD"
    effect_Explosion=Class'XEffects.XWFX_Grenade_explosion'
    effect_Explosion_dirt=Class'XEffects.XWFX_Grenade_explosion_dirt'
    effect_Explosion_grass=Class'XEffects.XWFX_Grenade_explosion_grass'
    effect_Explosion_metal=Class'XEffects.XWFX_Grenade_explosion_metal'
    effect_Explosion_snow=Class'XEffects.XWFX_Grenade_explosion_snow'
    effect_Explosion_water=Class'XEffects.XWFX_Grenade_explosion_water'
    effect_Explosion_wood=Class'XEffects.XWFX_Grenade_explosion_wood'
    Proj_Smoke=Class'XEffects.WFX_RocketTrailSmoke'
    Proj_ExplosionDecal=Class'XEffects.RocketMark'
    szIcon_HUD="Warfare_UI_Item.HUDIcon.Item_HUD_WP_HW_RPG7"
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=128,Y=36,W=128,H=32)
    szType_DisplayAmmo="ammoRPG"
    sound_Fire=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_fire'
    sound_Fire_Stereo=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_fire_s'
    sound_Explosion=SoundGroup'Warfare_Sound_Weapon.RPG.weapon_rpg7_explosion'
    sound_Melee_Ok=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_attack'
    sound_Melee_Miss=SoundGroup'Warfare_Sound_Weapon.Knife.weapon_melee_knife_miss'
    sound_Reload=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_reload'
    sound_Select=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_select'
    sound_Pickup=SoundGroup'Warfare_Sound_Char.GetItem.char_getitem_weapon'
    sound_Bullet_Move=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_projectile'
    sound_Select_New=Sound'Warfare_Sound_Weapon.RPG.weapon_rpg7_select_n'
    rad_Explosion=350.0
    rad_Bullet_Move=500.0
    UseWarhead=true
    bDelayedDamage=true
}