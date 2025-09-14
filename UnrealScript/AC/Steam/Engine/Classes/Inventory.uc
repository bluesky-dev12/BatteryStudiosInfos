/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Inventory.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:24
 *
 *******************************************************************************/
class Inventory extends Actor
    dependson(Pickup)
    dependson(InventoryAttachment)
    native
    nativereplication
    abstract
    notplaceable;

var byte InventoryGroup;
var byte GroupOffset;
var bool bDisplayableInv;
var bool bTossedOut;
var noimport class<Pickup> PickupClass;
var() travel int Charge;
var Vector PlayerViewOffset;
var(FirstPerson) Rotator PlayerViewPivot;
var() bool bDrawingFirstPerson;
var() float BobDamping;
var Actor ThirdPersonActor;
var noimport class<InventoryAttachment> AttachmentClass;
var() Material IconMaterial;
var() IntBox IconCoords;
var() noimport localized string ItemName;
var string InventoryClassName;
var int InventoryClassNumber;
var BtrDouble InventoryUniqueNumber;
var int InventoryClassAddPartsID;

replication
{
    // Pos:0x00
    reliable if(bNetOwner && bNetDirty && Role == 4)
        Charge, ThirdPersonActor;

    // Pos:0x23
    reliable if(Role == 4)
        InventoryClassNumber, InventoryUniqueNumber,
        InventoryClassAddPartsID;

}

function AttachToPawn(Pawn P)
{
    local name BoneName;

    Instigator = P;
    // End:0x41
    if(ThirdPersonActor == none)
    {
        ThirdPersonActor = Spawn(AttachmentClass, Owner);
        InventoryAttachment(ThirdPersonActor).InitFor(self);
    }
    // End:0x63
    else
    {
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    BoneName = P.GetWeaponBoneFor(self);
    // End:0xb6
    if(BoneName == 'None')
    {
        ThirdPersonActor.SetLocation(P.Location);
        ThirdPersonActor.SetBase(P);
    }
    // End:0xcf
    else
    {
        P.AttachToBone(ThirdPersonActor, BoneName);
    }
}

exec function updaterelative(int Pitch, int Yaw, int Roll)
{
    local Rotator NewRot;

    NewRot.Pitch = Pitch;
    NewRot.Yaw = Yaw;
    NewRot.Roll = Roll;
    ThirdPersonActor.SetRelativeLocation(ThirdPersonActor.default.RelativeLocation);
    ThirdPersonActor.SetRelativeRotation(NewRot);
}

function DetachFromPawn(Pawn P)
{
    // End:0x1e
    if(ThirdPersonActor != none)
    {
        ThirdPersonActor.Destroy();
        ThirdPersonActor = none;
    }
}

simulated event RenderOverlays(Canvas Canvas)
{
    // End:0x23
    if(Instigator == none || Instigator.Controller == none)
    {
        return;
    }
    SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
    SetRotation(Instigator.GetViewRotation());
    Canvas.DrawActor(self, false);
}

simulated function string GetHumanReadableName()
{
    // End:0x1f
    if(ItemName == "")
    {
        ItemName = GetItemName(string(Class));
    }
    return ItemName;
}

function PickupFunction(Pawn Other);
simulated function wWeapon RecommendWeapon(out float rating)
{
    // End:0x23
    if(Inventory != none)
    {
        return Inventory.RecommendWeapon(rating);
    }
    // End:0x30
    else
    {
        rating = -1.0;
        return none;
    }
}

event TravelPreAccept()
{
    super.TravelPreAccept();
    GiveTo(Pawn(Owner));
}

function TravelPostAccept()
{
    super.TravelPostAccept();
    PickupFunction(Pawn(Owner));
}

function Destroyed()
{
    // End:0x25
    if(Pawn(Owner) != none)
    {
        Pawn(Owner).DeleteInventory(self);
    }
    // End:0x3c
    if(ThirdPersonActor != none)
    {
        ThirdPersonActor.Destroy();
    }
    super.Destroyed();
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
    Instigator = Other;
    // End:0x28
    if(Other.AddInventory(self))
    {
        GotoState('None');
    }
    // End:0x2b
    else
    {
        Destroy();
    }
}

function bool HandlePickupQuery(Pickup Item)
{
    // End:0x1a
    if(Item.InventoryType == Class)
    {
        return true;
    }
    // End:0x27
    if(Inventory == none)
    {
        return false;
    }
    return Inventory.HandlePickupQuery(Item);
}

function Powerups SelectNext()
{
    // End:0x1e
    if(Inventory != none)
    {
        return Inventory.SelectNext();
    }
    // End:0x20
    else
    {
        return none;
    }
}

function DropFrom(Vector StartLocation, Rotator StartRotation)
{
    local Pickup P;

    // End:0x26
    if(Instigator != none)
    {
        DetachFromPawn(Instigator);
        Instigator.DeleteInventory(self);
    }
    SetDefaultDisplayProperties();
    Instigator = none;
    StopAnimating();
    GotoState('None');
    P = Spawn(PickupClass,,, StartLocation, StartRotation);
    // End:0x6a
    if(P == none)
    {
        Destroy();
        return;
    }
    P.InitDroppedPickupFor(self);
    P.Velocity = Velocity;
    Velocity = vect(0.0, 0.0, 0.0);
}

function Use(float Value);
simulated function wWeapon WeaponChange(byte f, bool bSilent)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;
    }
    // End:0x2b
    else
    {
        return Inventory.WeaponChange(f, bSilent);
    }
}

simulated function wWeapon WeaponChangeWClass(name wClass)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;
    }
    // End:0x25
    else
    {
        return Inventory.WeaponChangeWClass(wClass);
    }
}

simulated function wWeapon WeaponChangeWID(int iWeaponID)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;
    }
    // End:0x25
    else
    {
        return Inventory.WeaponChangeWID(iWeaponID);
    }
}

simulated function wWeapon PrevWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x2e
    else
    {
        return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
    }
}

simulated function wWeapon NextWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x2e
    else
    {
        return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
    }
}

function Armor PrioritizeArmor(int Damage, class<DamageType> DamageType, Vector HitLocation)
{
    local Armor FirstArmor;

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
    return FirstArmor;
}

function OwnerEvent(name EventName)
{
    // End:0x1f
    if(Inventory != none)
    {
        Inventory.OwnerEvent(EventName);
    }
}

function SetOwnerDisplay()
{
    // End:0x1a
    if(Inventory != none)
    {
        Inventory.SetOwnerDisplay();
    }
}

static function string StaticItemName()
{
    return default.ItemName;
}

defaultproperties
{
    BobDamping=0.960
    AttachmentClass=class'InventoryAttachment'
    DrawType=0
    bHidden=true
    bOnlyOwnerSee=true
    bOnlyRelevantToOwner=true
    bReplicateMovement=true
    bOnlyDirtyReplication=true
    RemoteRole=2
    NetPriority=1.40
    bTravel=true
    bClientAnim=true
}