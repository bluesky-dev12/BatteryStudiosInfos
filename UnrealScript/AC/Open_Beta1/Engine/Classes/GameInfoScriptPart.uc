class GameInfoScriptPart extends Object;

var KillDeathLog KDLog;
var bool KDLogSaved;
var float RespawnFailDuration;
var float SafeSpawn_DAMAGE_DEAL_TIME;
var float SafeSpawn_DAMAGE_RECEIVE_TIME;
var float SafeSpawn_DISABLE_DISTANCE;
var array<int> AssistUIDs;
var array<byte> AssistType;
var int KillWeaponType;
var bool IsWeaponAiming;

defaultproperties
{
    RespawnFailDuration=0.5000000
    SafeSpawn_DAMAGE_DEAL_TIME=5.0000000
    SafeSpawn_DAMAGE_RECEIVE_TIME=5.0000000
    SafeSpawn_DISABLE_DISTANCE=1600.0000000
}