class DAE_RecentTarget extends DAE;

var float Time;
var wAIBotBase Owner;

static function DAE_RecentTarget Create(wAIBotBase inOwner, float InTime)
{
    local DAE_RecentTarget i;

    i = new default.Class;
    i.Time = InTime;
    i.Owner = inOwner;
    return i;
    //return;    
}

function float Evaluate(MemoryItem MI)
{
    local float Score;

    Score = (Owner.Level.TimeSeconds - MI.LastTargetedTime) / Time;
    Score = 1.0000000 - FClamp(Score, 0.0000000, 1.0000000);
    return Score;
    //return;    
}
