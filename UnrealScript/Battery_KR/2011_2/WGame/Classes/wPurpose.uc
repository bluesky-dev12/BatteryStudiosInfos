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
    //return;    
}

function float Evaluate(out wState S)
{
    //return;    
}

function float GetActivationScore()
{
    //return;    
}

defaultproperties
{
    ActionMaxTime=9999.0000000
    PlanLength=3.0000000
}