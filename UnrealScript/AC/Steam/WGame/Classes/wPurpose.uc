/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPurpose.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:3
 *
 *******************************************************************************/
class wPurpose extends Object;

var wAIBotBase Owner;
var string PlanName;
var float ActionMinTime;
var float ActionMaxTime;
var float PlanLength;
var float _TEMP_SCORE;
var float _TEMP_COUNT;

static function wPurpose Create(wAIBotBase inOwner)
{
    local wPurpose i;

    i = new default.Class;
    i.Owner = inOwner;
    return i;
}

function float Evaluate(out wState S);
function float GetActivationScore();

defaultproperties
{
    ActionMaxTime=9999.0
    PlanLength=3.0
}