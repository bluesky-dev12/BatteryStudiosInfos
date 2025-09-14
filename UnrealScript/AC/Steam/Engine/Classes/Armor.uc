/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Armor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *	States:1
 *
 *******************************************************************************/
class Armor extends Powerups
    dependson(Powerups)
    abstract
    notplaceable;

var() class<DamageType> ProtectionType;
var() int ArmorAbsorption;
var() int AbsorptionPriority;
var Armor NextArmor;

function int ArmorAbsorbDamage(int Damage, class<DamageType> DamageType, Vector HitLocation)
{
    local int ArmorDamage;

    // End:0x1d
    if(DamageType.default.bArmorStops)
    {
        ArmorImpactEffect(HitLocation);
    }
    // End:0x3b
    if(DamageType != none && ProtectionType == DamageType)
    {
        return 0;
    }
    // End:0x55
    if(!DamageType.default.bArmorStops)
    {
        return Damage;
    }
    ArmorDamage = Damage * ArmorAbsorption / 100;
    // End:0x8b
    if(ArmorDamage >= Charge)
    {
        ArmorDamage = Charge;
        Destroy();
    }
    // End:0x97
    else
    {
        Charge -= ArmorDamage;
    }
    return Damage - ArmorDamage;
}

function int ArmorPriority(class<DamageType> DamageType)
{
    // End:0x14
    if(DamageType.default.bArmorStops)
    {
        return 0;
    }
    // End:0x36
    if(DamageType != none && ProtectionType == DamageType)
    {
        return 1000000;
    }
    return AbsorptionPriority;
}

function ArmorImpactEffect(Vector HitLocation);
function Armor PrioritizeArmor(int Damage, class<DamageType> DamageType, Vector HitLocation)
{
    local Armor FirstArmor, InsertAfter;

    // End:0x32
    if(Inventory != none)
    {
        FirstArmor = Inventory.PrioritizeArmor(Damage, DamageType, HitLocation);
    }
    // End:0x39
    else
    {
        FirstArmor = none;
    }
    // End:0x4d
    if(FirstArmor == none)
    {
        NextArmor = none;
        return self;
    }
    // End:0x7e
    if(FirstArmor.ArmorPriority(DamageType) < ArmorPriority(DamageType))
    {
        NextArmor = FirstArmor;
        return self;
    }
    InsertAfter = FirstArmor;
    J0x89:
    // End:0xe3 [While If]
    if(InsertAfter.NextArmor != none && InsertAfter.NextArmor.ArmorPriority(DamageType) > ArmorPriority(DamageType))
    {
        InsertAfter = InsertAfter.NextArmor;
        // This is an implied JumpToken; Continue!
        goto J0x89;
    }
    NextArmor = InsertAfter.NextArmor;
    InsertAfter.NextArmor = self;
    return FirstArmor;
}

state Activated
{
    function BeginState()
    {
        super.BeginState();
        // End:0x2a
        if(ProtectionType != none)
        {
            Pawn(Owner).ReducedDamageType = ProtectionType;
        }
    }

    function EndState()
    {
        super.EndState();
        // End:0x4a
        if(Pawn(Owner) != none && ProtectionType != Pawn(Owner).ReducedDamageType)
        {
            Pawn(Owner).ReducedDamageType = none;
        }
    }

}
