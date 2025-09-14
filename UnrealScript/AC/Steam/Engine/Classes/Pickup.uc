/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Pickup.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:22
 *	States:6
 *
 *******************************************************************************/
class Pickup extends Actor
    dependson(wPickUpBase)
    dependson(InventorySpot)
    native
    nativereplication
    abstract
    placeable;

var float MaxDesireability;
var InventorySpot myMarker;
var NavigationPoint PickupCache;
var() class<Inventory> InventoryType;
var() bool bInstantRespawn;
var bool bOnlyReplicateHidden;
var(Display) bool bAmbientGlow;
var bool bDropped;
var bool bPredictRespawns;
var() float RespawnTime;
var float RespawnEffectTime;
var() localized string PickupMessage;
var() Sound PickupSound;
var() string PickupForce;
var() wPickUpBase PickUpBase;
var Controller TeamOwner[4];
var(Collision) bool bPostLandingCollision;
var(Collision) float PostLandingCollisionRadius;
var(Collision) float PostLandingCollisionHeight;
var(Collision) float CollisionHeightBuffer;

// Export UPickup::execAddToNavigation(FFrame&, void* const)
native final function AddToNavigation();
// Export UPickup::execRemoveFromNavigation(FFrame&, void* const)
native final function RemoveFromNavigation();
static function StaticPrecache(LevelInfo L);
function Destroyed()
{
    super.Destroyed();
    // End:0x21
    if(myMarker != none)
    {
        myMarker.markedItem = none;
    }
    // End:0x38
    if(Inventory != none)
    {
        Inventory.Destroy();
    }
}

simulated function string GetHumanReadableName()
{
    // End:0x19
    if(InventoryType == none)
    {
        return GetItemName(string(Class));
    }
    // End:0x3c
    if(InventoryType.default.ItemName == "")
    {
        return GetItemName(string(InventoryType));
    }
    return InventoryType.default.ItemName;
}

function bool IsSuperItem()
{
    return PickUpBase != none && PickUpBase.bDelayedSpawn;
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
}

function Reset()
{
    // End:0x11
    if(Inventory != none)
    {
        Destroy();
    }
    // End:0x4c
    else
    {
        // End:0x3f
        if(myMarker != none && myMarker.bSuperPickup)
        {
            GotoState('Sleeping', 'DelayedSpawn');
        }
        // End:0x46
        else
        {
            GotoState('Pickup');
        }
        super.Reset();
    }
}

function RespawnEffect();
function Pickup Transmogrify(class<Pickup> NewClass)
{
    local Pickup NewPickup;

    NewPickup = Spawn(NewClass);
    NewPickup.PickUpBase = PickUpBase;
    NewPickup.RespawnTime = RespawnTime;
    // End:0x70
    if(myMarker != none)
    {
        myMarker.markedItem = NewPickup;
        NewPickup.myMarker = myMarker;
        myMarker = none;
    }
    Destroy();
    return NewPickup;
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    return 0.0;
}

function float BotDesireability(Pawn Bot)
{
    local Inventory AlreadyHas;
    local float desire;

    desire = MaxDesireability;
    // End:0x9a
    if(RespawnTime < float(10))
    {
        AlreadyHas = Bot.FindInventoryType(InventoryType);
        // End:0x9a
        if(AlreadyHas != none)
        {
            // End:0x73
            if(Inventory != none)
            {
                // End:0x70
                if(Inventory.Charge <= AlreadyHas.Charge)
                {
                    return -1.0;
                }
            }
            // End:0x9a
            else
            {
                // End:0x9a
                if(InventoryType.default.Charge <= AlreadyHas.Charge)
                {
                    return -1.0;
                }
            }
        }
    }
    return desire;
}

function Inventory SpawnCopy(Pawn Other)
{
    local Inventory Copy;

    // End:0x20
    if(Inventory != none)
    {
        Copy = Inventory;
        Inventory = none;
    }
    // End:0x42
    else
    {
        Copy = Spawn(InventoryType, Other,,, rot(0, 0, 0));
    }
    // End:0x4f
    if(Copy == none)
    {
        return none;
    }
    Copy.GiveTo(Other, self);
    return Copy;
}

function StartSleeping()
{
    // End:0x0f
    if(bDropped)
    {
        Destroy();
    }
    // End:0x16
    else
    {
        GotoState('Sleeping');
    }
}

function AnnouncePickup(Pawn Receiver)
{
    Receiver.HandlePickup(self);
    PlaySound(PickupSound, 5, 1.0);
}

function SetRespawn()
{
    // End:0x25
    if(Level.Game.ShouldRespawn(self))
    {
        StartSleeping();
    }
    // End:0x28
    else
    {
        Destroy();
    }
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return "";
}

function InitDroppedPickupFor(Inventory Inv)
{
    SetPhysics(2);
    GotoState('FallingPickup');
    Inventory = Inv;
    bAlwaysRelevant = false;
    bOnlyReplicateHidden = false;
    bUpdateSimulatedPosition = true;
    bDropped = true;
    LifeSpan = 16.0;
    bIgnoreEncroachers = false;
    NetUpdateFrequency = 8.0;
}

function InitDroppedPack()
{
    SetPhysics(2);
    GotoState('FallingPickup');
    bAlwaysRelevant = false;
    bOnlyReplicateHidden = false;
    bUpdateSimulatedPosition = true;
    bDropped = true;
    bIgnoreEncroachers = false;
    NetUpdateFrequency = 8.0;
}

function bool ReadyToPickup(float MaxWait)
{
    return false;
}

event Landed(Vector HitNormal)
{
    // End:0x16
    if(bPostLandingCollision)
    {
        SetCollisionSize(PostLandingCollisionRadius, PostLandingCollisionHeight);
    }
    GotoState('Pickup', 'Begin');
}

function float GetRespawnTime()
{
    return RespawnTime;
}

auto state Pickup
{
    function bool ReadyToPickup(float MaxWait)
    {
        return true;
    }

    function bool ValidTouch(Actor Other)
    {
        // End:0x0d
        if(IsA('wWeaponPickup'))
        {
            return false;
        }
        // End:0x8b
        if(Pawn(Other) == none || !Pawn(Other).bCanPickupInventory || Pawn(Other).DrivenVehicle == none && Pawn(Other).Controller == none || Pawn(Other).Health <= 0)
        {
            return false;
        }
        // End:0x135
        if(!FastTrace(Other.Location + MakeVector(0.0, 0.0, CollisionHeightBuffer), Location + MakeVector(0.0, 0.0, CollisionHeightBuffer)))
        {
            clog("[Pickup::Pickup::ValidTouch] !FastTrace - actorLoc:" $ string(Other.Location) $ " loc:" $ string(Location));
            return false;
        }
        // End:0x173
        if(Level.Game.PickupQuery(Pawn(Other), self))
        {
            TriggerEvent(Event, self, Pawn(Other));
            return true;
        }
        return false;
    }

    function Touch(Actor Other)
    {
        local Inventory Copy;

        // End:0x6b
        if(ValidTouch(Other))
        {
            // End:0x1b
            if(IsA('wWeaponPickup'))
            {
                return;
            }
            Copy = SpawnCopy(Pawn(Other));
            AnnouncePickup(Pawn(Other));
            SetRespawn();
            // End:0x6b
            if(Copy != none)
            {
                Copy.PickupFunction(Pawn(Other));
            }
        }
    }

    function CheckTouching()
    {
        local Pawn P;

        // End:0x1c
        foreach TouchingActors(class'Pawn', P)
        {
            Touch(P);                        
        }
    }

    function Timer();
    function BeginState()
    {
        UntriggerEvent(Event, self, none);
        // End:0x1f
        if(bDropped)
        {
            SetTimer(8.0, false);
        }
    }

    function EndState()
    {
        // End:0x0f
        if(bDropped)
        {
            RemoveFromNavigation();
        }
    }

Begin:
    CheckTouching();
}

state FallingPickup extends Pickup
{
    function CheckTouching();
    function Timer()
    {
        GotoState('FadeOut');
    }

    function BeginState()
    {
        SetTimer(8.0, false);
    }

}

state FadeOut extends Pickup
{
    function Tick(float DeltaTime)
    {
        SetDrawScale(FMax(0.010, DrawScale - default.DrawScale * DeltaTime));
    }

    function BeginState()
    {
        RotationRate.Yaw = 60000;
        SetPhysics(5);
        LifeSpan = 1.0;
    }

    function EndState()
    {
        LifeSpan = 0.0;
        SetDrawScale(default.DrawScale);
        // End:0x2b
        if(Physics == 5)
        {
            SetPhysics(0);
        }
    }

}

state WaitingForMatch
{
    function MatchStarting()
    {
        GotoState('Sleeping', 'DelayedSpawn');
    }

    function BeginState()
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        bHidden = true;
    }

}

state Sleeping
{
    function bool ReadyToPickup(float MaxWait)
    {
        return bPredictRespawns && LatentFloat < MaxWait;
    }

    function StartSleeping();
    function BeginState()
    {
        local int i;

        NetUpdateTime = Level.TimeSeconds - float(1);
        bHidden = true;
        i = 0;
        J0x28:
        // End:0x4b [While If]
        if(i < 4)
        {
            TeamOwner[i] = none;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x28;
        }
    }

    function EndState()
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        bHidden = false;
    }

DelayedSpawn:
    // End:0x43
    if(Level.NetMode == 0)
    {
        Sleep(FMin(30.0, Level.Game.GameDifficulty * float(8)));
    }
    // End:0x4b
    else
    {
        Sleep(30.0);
    }
    goto 'respawn';
Begin:

    Sleep(GetRespawnTime() - RespawnEffectTime);
respawn:

    RespawnEffect();
    Sleep(RespawnEffectTime);
    // End:0x89
    if(PickUpBase != none)
    {
        PickUpBase.TurnOn();
    }
    GotoState('Pickup');
    stop;    
}

state Disabled
{
    function bool ReadyToPickup(float MaxWait)
    {
        return false;
    }

    function Reset();
    function StartSleeping();
    simulated function BeginState()
    {
        MaxDesireability = 0.0;
        bHidden = true;
        ResetStaticFilterState();
        SetCollision(false, false, false);
    }

}

defaultproperties
{
    MaxDesireability=0.10
    bOnlyReplicateHidden=true
    RespawnEffectTime=0.50
    PickupMessage="You acquired an item."
    CollisionHeightBuffer=20.0
    DrawType=2
    CullDistance=8000.0
    bOrientOnSlope=true
    bIgnoreEncroachers=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bIgnoreVehicles=true
    NetUpdateFrequency=1.0
    NetPriority=1.40
    Texture=Texture'S_Inventory'
    bShadowMap=true
    bShouldBaseAtStartup=true
    bCollideActors=true
    bCollideWorld=true
    bUseCylinderCollision=true
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=5000,Roll=0)
    DesiredRotation=(Pitch=0,Yaw=30000,Roll=0)
}