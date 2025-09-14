class wInventory extends Object
    native;

struct native init WeaponPart
{
    var byte byType;
    var int iID;
    var string Name;
    var int Price;
};

var protected array<WeaponPart> Weapons;
