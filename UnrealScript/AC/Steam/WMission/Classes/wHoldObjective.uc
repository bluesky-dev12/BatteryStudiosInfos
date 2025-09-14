/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wHoldObjective.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class wHoldObjective extends HoldObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var float fSetTime;
var() float fSettingLength;

defaultproperties
{
    fSettingLength=5.0
    ObjectiveName="Hold & Set Objective"
    ObjectiveDescription="Touch and Hold and Set Objective to disable it."
    Objective_Info_Attacker="Hold & Set Objective"
}