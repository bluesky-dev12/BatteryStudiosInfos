/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wInventory.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:1
 *
 *******************************************************************************/
class wInventory extends Object
    native;

struct native init WeaponPart
{
    var byte byType;
    var int iID;
    var string Name;
    var int Price;
};

var array<WeaponPart> Weapons;
