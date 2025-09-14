/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAmmunition.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:6
 *
 *******************************************************************************/
class wAmmunition extends Inventory
    dependson(Ammo)
    native
    nativereplication
    abstract
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
var class<wProjectile> ProjectileClass;
var class<DamageType> MyDamageType;
var float WarnTargetPct;
var float RefireRate;
var Sound FireSound;
var float MaxRange;
var() Material IconFlashMaterial;

replication
{
    // Pos:0x00
    reliable if(bNetOwner && bNetDirty && Role == 4)
        AmmoAmount;

}

simulated function CheckOutOfAmmo()
{
    // End:0x28
    if(AmmoAmount <= 0)
    {
        Pawn(Owner).Weapon.OutOfAmmo();
    }
}

simulated function bool UseAmmo(int AmountNeeded, optional bool bAmountNeededIsMax)
{
    // End:0x25
    if(bAmountNeededIsMax && AmmoAmount < AmountNeeded)
    {
        AmountNeeded = AmmoAmount;
    }
    // End:0x3c
    if(AmmoAmount < AmountNeeded)
    {
        CheckOutOfAmmo();
        return false;
    }
    AmmoAmount -= AmountNeeded;
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x9b
    if(Level.NetMode == 0 || Level.NetMode == 2)
    {
        CheckOutOfAmmo();
    }
    return true;
}

simulated function bool HasAmmo()
{
    return AmmoAmount > 0;
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.DrawText("Ammunition " $ GetItemName(string(self)) $ " amount " $ string(AmmoAmount) $ " Max " $ string(MaxAmmo));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

function bool HandlePickupQuery(Pickup Item)
{
    // End:0x6c
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
}

simulated function bool AddAmmo(int AmmoToAdd)
{
    // End:0x2f
    if(Level.GRI.WeaponBerserk > 1.0)
    {
        AmmoAmount = MaxAmmo;
    }
    // End:0x57
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
}

defaultproperties
{
    InitialAmount=10
    MyDamageType=class'DamageType'
    WarnTargetPct=0.50
    RefireRate=0.50
    NetUpdateFrequency=1.0
}