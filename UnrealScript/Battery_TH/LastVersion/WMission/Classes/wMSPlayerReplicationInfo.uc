class wMSPlayerReplicationInfo extends wPlayerReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var byte DisabledObjectivesCount;
var byte DisabledFinalObjective;
var byte DestroyedVehicles;
var float TrophiesXOffset;
var bool bAutoRespawn;
var bool bTeleportToSpawnArea;
var int TeleportTime;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        DestroyedVehicles, DisabledFinalObjective, 
        DisabledObjectivesCount, TeleportTime, 
        bAutoRespawn, bTeleportToSpawnArea;
}

function Timer()
{
    super(PlayerReplicationInfo).Timer();
    //return;    
}

function bool CanBotTeleport(Controller C)
{
    local Vehicle V;

    // End:0x16
    if(C.Pawn == none)
    {
        return false;
    }
    // End:0xA8
    if(Vehicle(C.Pawn) != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x72
        if(V.IndependentVehicle() && !V.bStationary)
        {
            return false;
        }
        // End:0xA8
        if(!V.IndependentVehicle() && !V.GetVehicleBase().bStationary)
        {
            return false;
        }
    }
    return true;
    //return;    
}

function Reset()
{
    HasFlag = none;
    bReadyToPlay = false;
    Log(("[wMSPlayerReplicationInfo::Reset] " $ PlayerName) $ " NumLives=1");
    NumLives = 1;
    bOutOfLives = false;
    bTeleportToSpawnArea = false;
    //return;    
}
