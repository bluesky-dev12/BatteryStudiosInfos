class wFutureState extends Object;

var wFlagObjectiveBase FlagDest;
var wFlagObjectiveBase FlagCapturing;

static function wFutureState Create()
{
    local wFutureState i;

    i = new default.Class;
    return i;
    //return;    
}

function Init()
{
    FlagDest = default.FlagDest;
    FlagCapturing = default.FlagCapturing;
    //return;    
}
