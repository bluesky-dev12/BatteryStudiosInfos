class wWeaponPickup_Location extends wWeaponPickup;

var name ClassName;
var() int RespawnLimit;
var int RespawnCount;

simulated event PreBeginPlay()
{
    local bool Destroyed;

    // End:0x27
    if(!Level.Game.SpawnWeaponPickupLocations)
    {
        Destroyed = Destroy();
    }
    // End:0xB4
    if(Level.GetMatchMaker() != none)
    {
        // End:0xB4
        if((int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().5)) || int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().1))
        {
            Destroyed = Destroy();
        }
    }
    super(Actor).PreBeginPlay();
    //return;    
}

simulated event PostNetBeginPlay()
{
    wLoadOut(iRepWeaponID, iRepAddPartsID);
    // End:0xBA
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x5B
        if(iRepWeaponID == 5001)
        {
            AmmoAmount[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);            
        }
        else
        {
            // End:0x80
            if(iRepWeaponID == 5003)
            {
                AmmoAmount[0] = BaseParams.iAmmo_Initial;
            }
        }
        AmmoAmount[1] = BaseParams.iAmmo_Initial;
        AmmoAmount_Loaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
    }
    Log("[wWeaponPickup_Location::PostNetBeginPlay]");
    // End:0x11F
    if(Level.GetLocalPlayerController() != none)
    {
        Level.GetLocalPlayerController().myHUD.CacheSpecialPositions();
    }
    super.PostNetBeginPlay();
    //return;    
}

function PickWeapon(Actor Other)
{
    local Inventory Copy;
    local Pawn P;

    // End:0x8B
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
    }
    //return;    
}

function Reset()
{
    super.Reset();
    // End:0x41
    if(iRepWeaponID == 5001)
    {
        AmmoAmount[0] = Max(0, BaseParams.iAmmo_Initial - BaseParams.iAmmo_Magazine);        
    }
    else
    {
        // End:0x66
        if(iRepWeaponID == 5003)
        {
            AmmoAmount[0] = BaseParams.iAmmo_Initial;
        }
    }
    AmmoAmount_Loaded = Min(BaseParams.iAmmo_Initial, BaseParams.iAmmo_Magazine);
    //return;    
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
        //return;        
    }
    stop;    
}

state Sleeping
{
    ignores EndState, BeginState;

    function BeginState()
    {
        super.BeginState();
        //return;        
    }

    function EndState()
    {
        super.EndState();
        //return;        
    }
    stop;    
}

defaultproperties
{
    ClassName="'"
    RespawnTime=60.0000000
    bPostLandingCollision=false
    CollisionRadius=130.0000000
    CollisionHeight=10.0000000
}