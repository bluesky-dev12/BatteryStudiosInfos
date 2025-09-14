class wHoldObjective extends HoldObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var float fSetTime;
var() float fSettingLength;

defaultproperties
{
    fSettingLength=5.0000000
    ObjectiveName="Hold & Set Objective"
    ObjectiveDescription="Touch and Hold and Set Objective to disable it."
    Objective_Info_Attacker="Hold & Set Objective"
}