class Inventory extends Actor
    abstract
    native
    nativereplication
    notplaceable;

var byte InventoryGroup;
var byte GroupOffset;
var bool bDisplayableInv;
var bool bTossedOut;
var cache Class<Pickup> PickupClass;
var() travel int Charge;
var Vector PlayerViewOffset;
var(FirstPerson) Rotator PlayerViewPivot;
var() bool bDrawingFirstPerson;
var() float BobDamping;
var Actor ThirdPersonActor;
var cache Class<InventoryAttachment> AttachmentClass;
var() Material IconMaterial;
var() IntBox IconCoords;
var() localized cache string ItemName;
var string InventoryClassName;
var int InventoryClassNumber;
var BtrDouble InventoryUniqueNumber;
var int InventoryClassAddPartsID;

replication
{
    // Pos:0x000
    reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
        Charge, ThirdPersonActor;

    // Pos:0x023
    reliable if(int(Role) == int(ROLE_Authority))
        InventoryClassAddPartsID, InventoryClassNumber, 
        InventoryUniqueNumber;
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
    else
    {
        ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
    }
    BoneName = P.GetWeaponBoneFor(self);
    // End:0xB6
    if(BoneName == 'None')
    {
        ThirdPersonActor.SetLocation(P.Location);
        ThirdPersonActor.SetBase(P);        
    }
    else
    {
        P.AttachToBone(ThirdPersonActor, BoneName);
    }
    //return;    
}

exec function updaterelative(int Pitch, int Yaw, int Roll)
{
    local Rotator NewRot;

    NewRot.Pitch = Pitch;
    NewRot.Yaw = Yaw;
    NewRot.Roll = Roll;
    ThirdPersonActor.SetRelativeLocation(ThirdPersonActor.default.RelativeLocation);
    ThirdPersonActor.SetRelativeRotation(NewRot);
    //return;    
}

function DetachFromPawn(Pawn P)
{
    // End:0x1E
    if(ThirdPersonActor != none)
    {
        ThirdPersonActor.Destroy();
        ThirdPersonActor = none;
    }
    //return;    
}

simulated event RenderOverlays(Canvas Canvas)
{
    // End:0x23
    if((Instigator == none) || Instigator.Controller == none)
    {
        return;
    }
    SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
    SetRotation(Instigator.GetViewRotation());
    Canvas.DrawActor(self, false);
    //return;    
}

simulated function string GetHumanReadableName()
{
    // End:0x1F
    if(ItemName == "")
    {
        ItemName = GetItemName(string(Class));
    }
    return ItemName;
    //return;    
}

function PickupFunction(Pawn Other)
{
    //return;    
}

simulated function wWeapon RecommendWeapon(out float rating)
{
    // End:0x23
    if(Inventory != none)
    {
        return Inventory.RecommendWeapon(rating);        
    }
    else
    {
        rating = -1.0000000;
        return none;
    }
    //return;    
}

event TravelPreAccept()
{
    super.TravelPreAccept();
    GiveTo(Pawn(Owner));
    //return;    
}

function TravelPostAccept()
{
    super.TravelPostAccept();
    PickupFunction(Pawn(Owner));
    //return;    
}

function Destroyed()
{
    // End:0x25
    if(Pawn(Owner) != none)
    {
        Pawn(Owner).DeleteInventory(self);
    }
    // End:0x3C
    if(ThirdPersonActor != none)
    {
        ThirdPersonActor.Destroy();
    }
    super.Destroyed();
    //return;    
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
    Instigator = Other;
    // End:0x28
    if(Other.AddInventory(self))
    {
        GotoState('None');        
    }
    else
    {
        Destroy();
    }
    //return;    
}

function bool HandlePickupQuery(Pickup Item)
{
    // End:0x1A
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
    //return;    
}

function Powerups SelectNext()
{
    // End:0x1E
    if(Inventory != none)
    {
        return Inventory.SelectNext();        
    }
    else
    {
        return none;
    }
    //return;    
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
    // End:0x6A
    if(P == none)
    {
        Destroy();
        return;
    }
    P.InitDroppedPickupFor(self);
    P.Velocity = Velocity;
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function Use(float Value)
{
    //return;    
}

simulated function wWeapon WeaponChange(byte F, bool bSilent)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;        
    }
    else
    {
        return Inventory.WeaponChange(F, bSilent);
    }
    //return;    
}

simulated function wWeapon WeaponChangeWClass(name wClass)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;        
    }
    else
    {
        return Inventory.WeaponChangeWClass(wClass);
    }
    //return;    
}

simulated function wWeapon WeaponChangeWID(int iWeaponID)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;        
    }
    else
    {
        return Inventory.WeaponChangeWID(iWeaponID);
    }
    //return;    
}

simulated function wWeapon PrevWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;        
    }
    else
    {
        return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
    }
    //return;    
}

simulated function wWeapon NextWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;        
    }
    else
    {
        return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
    }
    //return;    
}

function Armor PrioritizeArmor(int Damage, Class<DamageType> DamageType, Vector HitLocation)
{
    local Armor FirstArmor;

    // End:0x32
    if(Inventory != none)
    {
        FirstArmor = Inventory.PrioritizeArmor(Damage, DamageType, HitLocation);        
    }
    else
    {
        FirstArmor = none;
    }
    return FirstArmor;
    //return;    
}

function OwnerEvent(name EventName)
{
    // End:0x1F
    if(Inventory != none)
    {
        Inventory.OwnerEvent(EventName);
    }
    //return;    
}

function SetOwnerDisplay()
{
    // End:0x1A
    if(Inventory != none)
    {
        Inventory.SetOwnerDisplay();
    }
    //return;    
}

static function string StaticItemName()
{
    return default.ItemName;
    //return;    
}

defaultproperties
{
    BobDamping=0.9600000
    AttachmentClass=Class'Engine_Decompressed.InventoryAttachment'
    DrawType=0
    bHidden=true
    bOnlyOwnerSee=true
    bOnlyRelevantToOwner=true
    bReplicateMovement=false
    bOnlyDirtyReplication=true
    RemoteRole=2
    NetPriority=1.4000000
    bTravel=true
    bClientAnim=true
}