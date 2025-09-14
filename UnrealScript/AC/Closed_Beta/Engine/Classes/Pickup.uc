class Pickup extends Actor
    abstract
    native
    nativereplication
    placeable;

var float MaxDesireability;
var InventorySpot myMarker;
var NavigationPoint PickupCache;
var() Class<Inventory> InventoryType;
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

static function StaticPrecache(LevelInfo L)
{
    //return;    
}

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
    //return;    
}

simulated function string GetHumanReadableName()
{
    // End:0x19
    if(InventoryType == none)
    {
        return GetItemName(string(Class));
    }
    // End:0x3C
    if(InventoryType.default.ItemName == "")
    {
        return GetItemName(string(InventoryType));
    }
    return InventoryType.default.ItemName;
    //return;    
}

function bool IsSuperItem()
{
    return (PickUpBase != none) && PickUpBase.bDelayedSpawn;
    //return;    
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    //return;    
}

function Reset()
{
    // End:0x11
    if(Inventory != none)
    {
        Destroy();        
    }
    else
    {
        // End:0x3F
        if((myMarker != none) && myMarker.bSuperPickup)
        {
            GotoState('Sleeping', 'DelayedSpawn');            
        }
        else
        {
            GotoState('Pickup');
        }
        super.Reset();
    }
    //return;    
}

function RespawnEffect()
{
    //return;    
}

function Pickup Transmogrify(Class<Pickup> NewClass)
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
    //return;    
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    return 0.0000000;
    //return;    
}

function float BotDesireability(Pawn Bot)
{
    local Inventory AlreadyHas;
    local float desire;

    desire = MaxDesireability;
    // End:0x9A
    if(RespawnTime < float(10))
    {
        AlreadyHas = Bot.FindInventoryType(InventoryType);
        // End:0x9A
        if(AlreadyHas != none)
        {
            // End:0x73
            if(Inventory != none)
            {
                // End:0x70
                if(Inventory.Charge <= AlreadyHas.Charge)
                {
                    return -1.0000000;
                }                
            }
            else
            {
                // End:0x9A
                if(InventoryType.default.Charge <= AlreadyHas.Charge)
                {
                    return -1.0000000;
                }
            }
        }
    }
    return desire;
    //return;    
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
    else
    {
        Copy = Spawn(InventoryType, Other,,, rot(0, 0, 0));
    }
    // End:0x4F
    if(Copy == none)
    {
        return none;
    }
    Copy.GiveTo(Other, self);
    return Copy;
    //return;    
}

function StartSleeping()
{
    // End:0x0F
    if(bDropped)
    {
        Destroy();        
    }
    else
    {
        GotoState('Sleeping');
    }
    //return;    
}

function AnnouncePickup(Pawn Receiver)
{
    Receiver.HandlePickup(self);
    PlaySound(PickupSound, 5, 1.0000000);
    //return;    
}

function SetRespawn()
{
    // End:0x25
    if(Level.Game.ShouldRespawn(self))
    {
        StartSleeping();        
    }
    else
    {
        Destroy();
    }
    //return;    
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return "";
    //return;    
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
    LifeSpan = 16.0000000;
    bIgnoreEncroachers = false;
    NetUpdateFrequency = 8.0000000;
    //return;    
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
    NetUpdateFrequency = 8.0000000;
    //return;    
}

function bool ReadyToPickup(float MaxWait)
{
    return false;
    //return;    
}

event Landed(Vector HitNormal)
{
    // End:0x16
    if(bPostLandingCollision)
    {
        SetCollisionSize(PostLandingCollisionRadius, PostLandingCollisionHeight);
    }
    GotoState('Pickup', 'Begin');
    //return;    
}

function float GetRespawnTime()
{
    return RespawnTime;
    //return;    
}

auto state Pickup
{
    function bool ReadyToPickup(float MaxWait)
    {
        return true;
        //return;        
    }

    function bool ValidTouch(Actor Other)
    {
        // End:0x0D
        if(IsA('wWeaponPickup'))
        {
            return false;
        }
        // End:0x8B
        if((((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory) || (Pawn(Other).DrivenVehicle == none) && Pawn(Other).Controller == none) || Pawn(Other).Health <= 0)
        {
            return false;
        }
        // End:0x135
        if(!FastTrace(Other.Location + (MakeVector(0.0000000, 0.0000000, CollisionHeightBuffer)), Location + (MakeVector(0.0000000, 0.0000000, CollisionHeightBuffer))))
        {
            clog((("[Pickup::Pickup::ValidTouch] !FastTrace - actorLoc:" $ string(Other.Location)) $ " loc:") $ string(Location));
            return false;
        }
        // End:0x173
        if(Level.Game.PickupQuery(Pawn(Other), self))
        {
            TriggerEvent(Event, self, Pawn(Other));
            return true;
        }
        return false;
        //return;        
    }

    function Touch(Actor Other)
    {
        local Inventory Copy;

        // End:0x6B
        if(ValidTouch(Other))
        {
            // End:0x1B
            if(IsA('wWeaponPickup'))
            {
                return;
            }
            Copy = SpawnCopy(Pawn(Other));
            AnnouncePickup(Pawn(Other));
            SetRespawn();
            // End:0x6B
            if(Copy != none)
            {
                Copy.PickupFunction(Pawn(Other));
            }
        }
        //return;        
    }

    function CheckTouching()
    {
        local Pawn P;

        // End:0x1C
        foreach TouchingActors(Class'Engine.Pawn', P)
        {
            Touch(P);            
        }        
        //return;        
    }

    function Timer()
    {
        //return;        
    }

    function BeginState()
    {
        UntriggerEvent(Event, self, none);
        // End:0x1F
        if(bDropped)
        {
            SetTimer(8.0000000, false);
        }
        //return;        
    }

    function EndState()
    {
        // End:0x0F
        if(bDropped)
        {
            RemoveFromNavigation();
        }
        //return;        
    }
Begin:

    CheckTouching();
    stop;        
}

state FallingPickup extends Pickup
{
    function CheckTouching()
    {
        //return;        
    }

    function Timer()
    {
        GotoState('FadeOut');
        //return;        
    }

    function BeginState()
    {
        SetTimer(8.0000000, false);
        //return;        
    }
    stop;    
}

state FadeOut extends Pickup
{
    function Tick(float DeltaTime)
    {
        SetDrawScale(FMax(0.0100000, DrawScale - (default.DrawScale * DeltaTime)));
        //return;        
    }

    function BeginState()
    {
        RotationRate.Yaw = 60000;
        SetPhysics(5);
        LifeSpan = 1.0000000;
        //return;        
    }

    function EndState()
    {
        LifeSpan = 0.0000000;
        SetDrawScale(default.DrawScale);
        // End:0x2B
        if(int(Physics) == int(5))
        {
            SetPhysics(0);
        }
        //return;        
    }
    stop;    
}

state WaitingForMatch
{
    ignores BeginState, MatchStarting;

    function MatchStarting()
    {
        GotoState('Sleeping', 'DelayedSpawn');
        //return;        
    }

    function BeginState()
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        bHidden = true;
        //return;        
    }
    stop;    
}

state Sleeping
{
    ignores EndState, BeginState, StartSleeping, ReadyToPickup;

    function bool ReadyToPickup(float MaxWait)
    {
        return bPredictRespawns && LatentFloat < MaxWait;
        //return;        
    }

    function StartSleeping()
    {
        //return;        
    }

    function BeginState()
    {
        local int i;

        NetUpdateTime = Level.TimeSeconds - float(1);
        bHidden = true;
        i = 0;
        J0x28:

        // End:0x4B [Loop If]
        if(i < 4)
        {
            TeamOwner[i] = none;
            i++;
            // [Loop Continue]
            goto J0x28;
        }
        //return;        
    }

    function EndState()
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        bHidden = false;
        //return;        
    }
DelayedSpawn:

    // End:0x43
    if(int(Level.NetMode) == int(NM_Standalone))
    {
        Sleep(FMin(30.0000000, Level.Game.GameDifficulty * float(8)));        
    }
    else
    {
        Sleep(30.0000000);
    }
    goto 'respawn';
Begin:


    Sleep((GetRespawnTime()) - RespawnEffectTime);
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
        //return;        
    }

    function Reset()
    {
        //return;        
    }

    function StartSleeping()
    {
        //return;        
    }

    simulated function BeginState()
    {
        MaxDesireability = 0.0000000;
        bHidden = true;
        ResetStaticFilterState();
        SetCollision(false, false, false);
        //return;        
    }
    stop;    
}

defaultproperties
{
    MaxDesireability=0.1000000
    bOnlyReplicateHidden=true
    RespawnEffectTime=0.5000000
    PickupMessage="You acquired an item."
    CollisionHeightBuffer=20.0000000
    DrawType=2
    CullDistance=8000.0000000
    bOrientOnSlope=true
    bIgnoreEncroachers=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bIgnoreVehicles=true
    NetUpdateFrequency=1.0000000
    NetPriority=1.4000000
    Texture=Texture'Engine.S_Inventory'
    bShadowMap=true
    bShouldBaseAtStartup=true
    bCollideActors=true
    bCollideWorld=true
    bUseCylinderCollision=true
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=5000,Roll=0)
    DesiredRotation=(Pitch=0,Yaw=30000,Roll=0)
}