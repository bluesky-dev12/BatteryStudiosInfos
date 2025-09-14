class Armor extends Powerups
    abstract
    notplaceable;

var() Class<DamageType> ProtectionType;
var() int ArmorAbsorption;
var() int AbsorptionPriority;
var Armor NextArmor;

function int ArmorAbsorbDamage(int Damage, Class<DamageType> DamageType, Vector HitLocation)
{
    local int ArmorDamage;

    // End:0x1D
    if(DamageType.default.bArmorStops)
    {
        ArmorImpactEffect(HitLocation);
    }
    // End:0x3B
    if((DamageType != none) && ProtectionType == DamageType)
    {
        return 0;
    }
    // End:0x55
    if(!DamageType.default.bArmorStops)
    {
        return Damage;
    }
    ArmorDamage = (Damage * ArmorAbsorption) / 100;
    // End:0x8B
    if(ArmorDamage >= Charge)
    {
        ArmorDamage = Charge;
        Destroy();        
    }
    else
    {
        Charge -= ArmorDamage;
    }
    return Damage - ArmorDamage;
    //return;    
}

function int ArmorPriority(Class<DamageType> DamageType)
{
    // End:0x14
    if(DamageType.default.bArmorStops)
    {
        return 0;
    }
    // End:0x36
    if((DamageType != none) && ProtectionType == DamageType)
    {
        return 1000000;
    }
    return AbsorptionPriority;
    //return;    
}

function ArmorImpactEffect(Vector HitLocation)
{
    //return;    
}

function Armor PrioritizeArmor(int Damage, Class<DamageType> DamageType, Vector HitLocation)
{
    local Armor FirstArmor, InsertAfter;

    // End:0x32
    if(Inventory != none)
    {
        FirstArmor = Inventory.PrioritizeArmor(Damage, DamageType, HitLocation);        
    }
    else
    {
        FirstArmor = none;
    }
    // End:0x4D
    if(FirstArmor == none)
    {
        NextArmor = none;
        return self;
    }
    // End:0x7E
    if(FirstArmor.ArmorPriority(DamageType) < (ArmorPriority(DamageType)))
    {
        NextArmor = FirstArmor;
        return self;
    }
    InsertAfter = FirstArmor;
    J0x89:

    // End:0xE3 [Loop If]
    if((InsertAfter.NextArmor != none) && InsertAfter.NextArmor.ArmorPriority(DamageType) > (ArmorPriority(DamageType)))
    {
        InsertAfter = InsertAfter.NextArmor;
        // [Loop Continue]
        goto J0x89;
    }
    NextArmor = InsertAfter.NextArmor;
    InsertAfter.NextArmor = self;
    return FirstArmor;
    //return;    
}

state Activated
{
    function BeginState()
    {
        super.BeginState();
        // End:0x2A
        if(ProtectionType != none)
        {
            Pawn(Owner).ReducedDamageType = ProtectionType;
        }
        //return;        
    }

    function EndState()
    {
        super.EndState();
        // End:0x4A
        if((Pawn(Owner) != none) && ProtectionType != Pawn(Owner).ReducedDamageType)
        {
            Pawn(Owner).ReducedDamageType = none;
        }
        //return;        
    }
    stop;    
}
