/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASPlayerReplicationInfo.uc
 * Package Imports:
 *	UT2k4Assault
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:3
 *
 *******************************************************************************/
class ASPlayerReplicationInfo extends wPlayerReplicationInfo
    dependson(ASGameInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var byte DisabledObjectivesCount;
var byte DisabledFinalObjective;
var byte DestroyedVehicles;
var float TrophiesXOffset;
var string PawnOverrideClass;
var bool bAutoRespawn;
var bool bTeleportToSpawnArea;
var int TeleportTime;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        DisabledObjectivesCount, DisabledFinalObjective,
        DestroyedVehicles, bAutoRespawn,
        bTeleportToSpawnArea, TeleportTime;

}

function Timer()
{
    local NavigationPoint np;
    local Controller C;
    local GameObjective Go;

    super(PlayerReplicationInfo).Timer();
    // End:0x148
    if(bBot && bTeleportToSpawnArea && float(TeleportTime) != Level.TimeSeconds)
    {
        C = Controller(Owner);
        Go = ASGameInfo(Level.Game).GetCurrentObjective();
        // End:0x90
        if(Go == none || !CanBotTeleport(C))
        {
            bTeleportToSpawnArea = false;
            return;
        }
        np = Level.Game.FindPlayerStart(C, byte(C.GetTeamNum()));
        // End:0x140
        if(VSize(Go.Location - C.Pawn.Location) > VSize(Go.Location - np.Location) + float(1024))
        {
            ASGameInfo(Level.Game).TeleportPlayerToSpawn(C);
        }
        // End:0x148
        else
        {
            bTeleportToSpawnArea = false;
        }
    }
}

function bool CanBotTeleport(Controller C)
{
    local Vehicle V;

    // End:0x16
    if(C.Pawn == none)
    {
        return false;
    }
    // End:0xa8
    if(Vehicle(C.Pawn) != none)
    {
        V = Vehicle(C.Pawn);
        // End:0x72
        if(V.IndependentVehicle() && !V.bStationary)
        {
            return false;
        }
        // End:0xa8
        if(!V.IndependentVehicle() && !V.GetVehicleBase().bStationary)
        {
            return false;
        }
    }
    return true;
}

function Reset()
{
    PawnOverrideClass = "";
    HasFlag = none;
    bReadyToPlay = false;
    NumLives = 0;
    bOutOfLives = false;
    bTeleportToSpawnArea = false;
}
