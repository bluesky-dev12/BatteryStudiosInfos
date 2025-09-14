/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\WeaponPickup.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:10
 *	States:1
 *
 *******************************************************************************/
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
    MaxDesireability = 1.20 * class<wWeapon>(InventoryType).default.AIRating;
}

function SetWeaponStay()
{
    bWeaponStay = bWeaponStay && Level.Game.bWeaponStay;
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastWeaponPickupTime = H.LastPickupTime;
}

function StartSleeping()
{
    // End:0x0f
    if(bDropped)
    {
        Destroy();
    }
    // End:0x21
    else
    {
        // End:0x21
        if(!bWeaponStay)
        {
            GotoState('Sleeping');
        }
    }
}

function bool AllowRepeatPickup()
{
    return !bWeaponStay || bDropped && !bThrown;
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local wWeapon AlreadyHas;

    AlreadyHas = wWeapon(Other.FindInventoryType(InventoryType));
    // End:0x53
    if(AlreadyHas != none && bWeaponStay || AlreadyHas.AmmoAmount(0) > 0)
    {
        return 0.0;
    }
    // End:0xb6
    if(AIController(Other.Controller).PriorityObjective() && Other.Weapon.AIRating > 0.50 || PathWeight > float(400))
    {
        return 0.20 / PathWeight;
    }
    return class<wWeapon>(InventoryType).default.AIRating / PathWeight;
}

function float BotDesireability(Pawn Bot)
{
    local wWeapon AlreadyHas;
    local class<Pickup> AmmoPickupClass;
    local float desire;

    desire = MaxDesireability + Bot.Controller.AdjustDesireFor(self);
    AlreadyHas = wWeapon(Bot.FindInventoryType(InventoryType));
    // End:0x172
    if(AlreadyHas != none)
    {
        // End:0x71
        if(Bot.Controller.bHuntPlayer)
        {
            return 0.0;
        }
        // End:0x82
        if(!AllowRepeatPickup())
        {
            return 0.0;
        }
        // End:0xb6
        if(RespawnTime < float(10) && bHidden || AlreadyHas.AmmoMaxed(0))
        {
            return 0.0;
        }
        // End:0xd6
        if(AlreadyHas.AmmoMaxed(0))
        {
            return 0.250 * desire;
        }
        // End:0x16c
        if(AlreadyHas.AmmoAmount(0) > 0)
        {
            AmmoPickupClass = AlreadyHas.AmmoPickupClass(0);
            // End:0x116
            if(AmmoPickupClass == none)
            {
                return 0.050;
            }
            // End:0x169
            else
            {
                return FMax(0.250 * desire, AmmoPickupClass.default.MaxDesireability * FMin(1.0, 0.150 * float(AlreadyHas.MaxAmmo(0)) / float(AlreadyHas.AmmoAmount(0))));
            }
        }
        // End:0x172
        else
        {
            return 0.050;
        }
    }
    // End:0x1c4
    if(Bot.Controller.bHuntPlayer && MaxDesireability * 0.8330 < Bot.Weapon.AIRating - 0.10)
    {
        return 0.0;
    }
    // End:0x208
    if(Bot.Weapon == none || Bot.Weapon.AIRating < 0.50)
    {
        return 2.0 * desire;
    }
    return desire;
}

function float GetRespawnTime()
{
    // End:0x41
    if(Level.NetMode != 0 || Level.Game.GameDifficulty > float(3))
    {
        return RespawnTime;
    }
    return RespawnTime * 0.330 + 0.220 * Level.Game.GameDifficulty;
}

function InitDroppedPickupFor(Inventory Inv)
{
    local wWeapon W;

    W = wWeapon(Inv);
    // End:0x4b
    if(W != none)
    {
        AmmoAmount[0] = W.AmmoAmount(0);
        AmmoAmount[1] = W.AmmoAmount(1);
    }
    super.InitDroppedPickupFor(none);
}

function Reset()
{
    AmmoAmount[0] = 0;
    AmmoAmount[1] = 0;
    super.Reset();
}

state FallingPickup
{
    function bool ValidTouch(Actor Other)
    {
        // End:0x76
        if(bThrown && Physics == 2 && Velocity.Z > float(0) && Velocity Dot Other.Velocity > float(0) && Velocity Dot Location - Other.Location > float(0))
        {
            return false;
        }
        return super(Pickup).ValidTouch(Other);
    }

}

defaultproperties
{
    bWeaponStay=true
    MaxDesireability=0.50
    bAmbientGlow=true
    bPredictRespawns=true
    RespawnTime=30.0
    PickupMessage="Weapon acquired."
    CullDistance=6500.0
    Physics=5
    Texture=Texture'S_Weapon'
    AmbientGlow=128
    CollisionRadius=36.0
    CollisionHeight=30.0
    RotationRate=(Pitch=0,Yaw=32768,Roll=0)
}