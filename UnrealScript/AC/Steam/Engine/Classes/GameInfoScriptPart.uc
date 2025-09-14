/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GameInfoScriptPart.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *
 *******************************************************************************/
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
    RespawnFailDuration=0.50
    SafeSpawn_DAMAGE_DEAL_TIME=5.0
    SafeSpawn_DAMAGE_RECEIVE_TIME=5.0
    SafeSpawn_DISABLE_DISTANCE=1600.0
}