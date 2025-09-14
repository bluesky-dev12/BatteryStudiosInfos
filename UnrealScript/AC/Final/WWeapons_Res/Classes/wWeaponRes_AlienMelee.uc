class wWeaponRes_AlienMelee extends wWeaponRes_Base;

defaultproperties
{
    effect_Melee_Attack1=Class'XEffects.HitEffect_alien_meleeattack_Left'
    effect_Melee_Attack2=Class'XEffects.HitEffect_alien_meleeattack_Right'
    szIcon_Kill="Warfare_UI_Item.Item_killIcon"
    ibIcon_Kill=(X=384,Y=988,W=128,H=32)
    fsound_Melee_Ok="Warfare_Sound_Alien_Mode/Weapon/weapon_alien_attack_success_01"
    fsound_Melee_Miss="Warfare_Sound_Alien_Mode/Weapon/weapon_alien_attack_melee_01"
}