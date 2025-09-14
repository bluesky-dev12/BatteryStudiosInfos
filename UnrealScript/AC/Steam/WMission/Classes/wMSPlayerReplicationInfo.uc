/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wMSPlayerReplicationInfo.uc
 * Package Imports:
 *	WMission
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
class wMSPlayerReplicationInfo extends wPlayerReplicationInfo
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
    super(PlayerReplicationInfo).Timer();
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
    Log("[wMSPlayerReplicationInfo::Reset] " $ PlayerName $ " NumLives=1");
    NumLives = 1;
    bOutOfLives = false;
    bTeleportToSpawnArea = false;
}
