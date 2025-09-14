/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\WeaponDamageType.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class WeaponDamageType extends DamageType
    abstract;

var() class<wWeapon> WeaponClass;

static function string GetWeaponClass()
{
    return string(default.WeaponClass);
}

defaultproperties
{
    bDirectDamage=true
}