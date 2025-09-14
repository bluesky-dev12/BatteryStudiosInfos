class wAmmunition extends Inventory
    abstract
    native
    nativereplication
    notplaceable;

var travel int MaxAmmo;
var travel int AmmoAmount;
var int InitialAmount;
var travel int PickupAmmo;
var bool bRecommendSplashDamage;
var bool bTossed;
var bool bTrySplash;
var bool bLeadTarget;
var bool bInstantHit;
var bool bSplashDamage;
var bool bTryHeadShot;
var Class<wProjectile> ProjectileClass;
var Class<DamageType> MyDamageType;
var float WarnTargetPct;
var float RefireRate;
var Sound FireSound;
var float MaxRange;
var() Material IconFlashMaterial;

replication
{
    // Pos:0x000
    reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
        AmmoAmount;
}

simulated function CheckOutOfAmmo()
{
    // End:0x28
    if(AmmoAmount <= 0)
    {
        Pawn(Owner).Weapon.OutOfAmmo();
    }
    //return;    
}

simulated function bool UseAmmo(int AmountNeeded, optional bool bAmountNeededIsMax)
{
    // End:0x25
    if(bAmountNeededIsMax && AmmoAmount < AmountNeeded)
    {
        AmountNeeded = AmmoAmount;
    }
    // End:0x3C
    if(AmmoAmount < AmountNeeded)
    {
        CheckOutOfAmmo();
        return false;
    }
    AmmoAmount -= AmountNeeded;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x9B
    if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
    {
        CheckOutOfAmmo();
    }
    return true;
    //return;    
}

simulated function bool HasAmmo()
{
    return AmmoAmount > 0;
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.DrawText((((("Ammunition " $ (GetItemName(string(self)))) $ " amount ") $ string(AmmoAmount)) $ " Max ") $ string(MaxAmmo));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function bool HandlePickupQuery(Pickup Item)
{
    // End:0x6C
    if(Class == Item.InventoryType)
    {
        // End:0x29
        if(AmmoAmount == MaxAmmo)
        {
            return true;
        }
        Item.AnnouncePickup(Pawn(Owner));
        AddAmmo(Ammo(Item).AmmoAmount);
        Item.SetRespawn();
        return true;
    }
    // End:0x79
    if(Inventory == none)
    {
        return false;
    }
    return Inventory.HandlePickupQuery(Item);
    //return;    
}

simulated function bool AddAmmo(int AmmoToAdd)
{
    // End:0x2F
    if(Level.GRI.WeaponBerserk > 1.0000000)
    {
        AmmoAmount = MaxAmmo;        
    }
    else
    {
        // End:0x57
        if(AmmoAmount < MaxAmmo)
        {
            AmmoAmount = Min(MaxAmmo, AmmoAmount + AmmoToAdd);
        }
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    return true;
    //return;    
}

defaultproperties
{
    InitialAmount=10
    MyDamageType=Class'Engine_Decompressed.DamageType'
    WarnTargetPct=0.5000000
    RefireRate=0.5000000
    NetUpdateFrequency=1.0000000
}