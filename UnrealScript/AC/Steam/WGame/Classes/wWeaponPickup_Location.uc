/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wWeaponPickup_Location.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:4
 *	States:2
 *
 *******************************************************************************/
class wWeaponPickup_Location extends wWeaponPickup;

var name ClassName;
var() int RespawnLimit;
var int RespawnCount;

simulated event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
}

simulated event PostNetBeginPlay()
{
    wLoadOut(iRepWeaponID, iRepAddPartsID);
    // End:0xab
    if(Role == 4)
    {
        // End:0x5b
        if(iRepWeaponID == 5001)
        {
            AmmoAmount[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);
        }
        // End:0x71
        else
        {
            AmmoAmount[0] = BaseParams.iAmmo_Initial;
        }
        AmmoAmount[1] = BaseParams.iAmmo_Initial;
        AmmoAmount_Loaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
    }
    Log("[wWeaponPickup_Location::PostNetBeginPlay]");
    // End:0x110
    if(Level.GetLocalPlayerController() != none)
    {
        Level.GetLocalPlayerController().myHUD.CacheSpecialPositions();
    }
    super.PostNetBeginPlay();
}

function PickWeapon(Actor Other)
{
    local Inventory Copy;
    local Pawn P;

    // End:0xbd
    if(ValidTouch(Other))
    {
        bHidden = true;
        NetUpdateTime = Level.TimeSeconds - float(1);
        P = Pawn(Other);
        Copy = SpawnCopy(P);
        AnnouncePickup(P);
        SetRespawn();
        // End:0x80
        if(Copy != none)
        {
            Copy.PickupFunction(P);
        }
        UnTouch(Other);
        // End:0xbd
        if(Level.GetMatchMaker().BotTutorial)
        {
            TriggerEvent(Event, self, Pawn(Other));
        }
    }
}

function Reset()
{
    super.Reset();
    // End:0x41
    if(iRepWeaponID == 5001)
    {
        AmmoAmount[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);
    }
    // End:0x57
    else
    {
        AmmoAmount[0] = BaseParams.iAmmo_Initial;
    }
    AmmoAmount_Loaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
}

auto state Pickup
{
    function EndState()
    {
        RespawnCount += 1;
        // End:0x29
        if(RespawnLimit != 0)
        {
            // End:0x29
            if(RespawnCount >= RespawnLimit)
            {
                GotoState('Disabled');
            }
        }
    }

}

state Sleeping
{
    function BeginState()
    {
        super.BeginState();
    }

    function EndState()
    {
        super.EndState();
    }

}

defaultproperties
{
    ClassName='
    RespawnTime=60.0
    bPostLandingCollision=true
    CollisionRadius=130.0
    CollisionHeight=10.0
}