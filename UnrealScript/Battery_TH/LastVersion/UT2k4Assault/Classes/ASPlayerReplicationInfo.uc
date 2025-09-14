class ASPlayerReplicationInfo extends wPlayerReplicationInfo
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
    local NavigationPoint np;
    local Controller C;
    local GameObjective Go;

    super(PlayerReplicationInfo).Timer();
    // End:0x148
    if((bBot && bTeleportToSpawnArea) && float(TeleportTime) != Level.TimeSeconds)
    {
        C = Controller(Owner);
        Go = ASGameInfo(Level.Game).GetCurrentObjective();
        // End:0x90
        if((Go == none) || !CanBotTeleport(C))
        {
            bTeleportToSpawnArea = false;
            return;
        }
        np = Level.Game.FindPlayerStart(C, byte(C.GetTeamNum()));
        // End:0x140
        if(VSize(Go.Location - C.Pawn.Location) > (VSize(Go.Location - np.Location) + float(1024)))
        {
            ASGameInfo(Level.Game).TeleportPlayerToSpawn(C);            
        }
        else
        {
            bTeleportToSpawnArea = false;
        }
    }
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
    NumLives = 0;
    bOutOfLives = false;
    bTeleportToSpawnArea = false;
    //return;    
}
