class WeaponPickup extends Pickup
    abstract
    placeable;

var bool bWeaponStay;
var() bool bThrown;
var() int AmmoAmount[2];

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SetWeaponStay();
    MaxDesireability = 1.2000000 * Class<wWeapon>(InventoryType).default.AIRating;
    //return;    
}

function SetWeaponStay()
{
    bWeaponStay = bWeaponStay && Level.Game.bWeaponStay;
    //return;    
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastWeaponPickupTime = H.LastPickupTime;
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
        // End:0x21
        if(!bWeaponStay)
        {
            GotoState('Sleeping');
        }
    }
    //return;    
}

function bool AllowRepeatPickup()
{
    return !bWeaponStay || bDropped && !bThrown;
    //return;    
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local wWeapon AlreadyHas;

    AlreadyHas = wWeapon(Other.FindInventoryType(InventoryType));
    // End:0x53
    if((AlreadyHas != none) && bWeaponStay || AlreadyHas.AmmoAmount(0) > 0)
    {
        return 0.0000000;
    }
    // End:0xB6
    if(AIController(Other.Controller).PriorityObjective() && (Other.Weapon.AIRating > 0.5000000) || PathWeight > float(400))
    {
        return 0.2000000 / PathWeight;
    }
    return Class<wWeapon>(InventoryType).default.AIRating / PathWeight;
    //return;    
}

function float BotDesireability(Pawn Bot)
{
    local wWeapon AlreadyHas;
    local Class<Pickup> AmmoPickupClass;
    local float desire;

    desire = MaxDesireability + Bot.Controller.AdjustDesireFor(self);
    AlreadyHas = wWeapon(Bot.FindInventoryType(InventoryType));
    // End:0x172
    if(AlreadyHas != none)
    {
        // End:0x71
        if(Bot.Controller.bHuntPlayer)
        {
            return 0.0000000;
        }
        // End:0x82
        if(!AllowRepeatPickup())
        {
            return 0.0000000;
        }
        // End:0xB6
        if((RespawnTime < float(10)) && bHidden || AlreadyHas.AmmoMaxed(0))
        {
            return 0.0000000;
        }
        // End:0xD6
        if(AlreadyHas.AmmoMaxed(0))
        {
            return 0.2500000 * desire;
        }
        // End:0x16C
        if(AlreadyHas.AmmoAmount(0) > 0)
        {
            AmmoPickupClass = AlreadyHas.AmmoPickupClass(0);
            // End:0x116
            if(AmmoPickupClass == none)
            {
                return 0.0500000;                
            }
            else
            {
                return FMax(0.2500000 * desire, AmmoPickupClass.default.MaxDesireability * FMin(1.0000000, (0.1500000 * float(AlreadyHas.MaxAmmo(0))) / float(AlreadyHas.AmmoAmount(0))));
            }            
        }
        else
        {
            return 0.0500000;
        }
    }
    // End:0x1C4
    if(Bot.Controller.bHuntPlayer && (MaxDesireability * 0.8330000) < (Bot.Weapon.AIRating - 0.1000000))
    {
        return 0.0000000;
    }
    // End:0x208
    if((Bot.Weapon == none) || Bot.Weapon.AIRating < 0.5000000)
    {
        return 2.0000000 * desire;
    }
    return desire;
    //return;    
}

function float GetRespawnTime()
{
    // End:0x41
    if((int(Level.NetMode) != int(NM_Standalone)) || Level.Game.GameDifficulty > float(3))
    {
        return RespawnTime;
    }
    return RespawnTime * (0.3300000 + (0.2200000 * Level.Game.GameDifficulty));
    //return;    
}

function InitDroppedPickupFor(Inventory Inv)
{
    local wWeapon W;

    W = wWeapon(Inv);
    // End:0x4B
    if(W != none)
    {
        AmmoAmount[0] = W.AmmoAmount(0);
        AmmoAmount[1] = W.AmmoAmount(1);
    }
    super.InitDroppedPickupFor(none);
    //return;    
}

function Reset()
{
    AmmoAmount[0] = 0;
    AmmoAmount[1] = 0;
    super.Reset();
    //return;    
}

state FallingPickup
{
    function bool ValidTouch(Actor Other)
    {
        // End:0x76
        if((((bThrown && int(Physics) == int(2)) && Velocity.Z > float(0)) && (Velocity Dot Other.Velocity) > float(0)) && (Velocity Dot (Location - Other.Location)) > float(0))
        {
            return false;
        }
        return super(Pickup).ValidTouch(Other);
        //return;        
    }
    stop;    
}

defaultproperties
{
    bWeaponStay=true
    MaxDesireability=0.5000000
    bAmbientGlow=true
    bPredictRespawns=true
    RespawnTime=30.0000000
    PickupMessage="Weapon acquired."
    CullDistance=6500.0000000
    Physics=5
    Texture=Texture'Engine_Decompressed.S_Weapon'
    AmbientGlow=128
    CollisionRadius=36.0000000
    CollisionHeight=30.0000000
    RotationRate=(Pitch=0,Yaw=32768,Roll=0)
}