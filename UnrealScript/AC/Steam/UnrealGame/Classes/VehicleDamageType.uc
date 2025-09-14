/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\VehicleDamageType.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class VehicleDamageType extends DamageType
    abstract;

var() class<Vehicle> VehicleClass;

defaultproperties
{
    bDirectDamage=true
}