class DAE_RecentTarget extends DAE;

var float Time;
var wAIBotBase Owner;

static function DAE_RecentTarget Create(bool bFailAllEvaluation, wAIBotBase inOwner, float InTime)
{
    local DAE_RecentTarget i;

    i = new default.Class;
    i.bFailAllEvaluation = bFailAllEvaluation;
    i.Time = InTime;
    i.Owner = inOwner;
    return i;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    local float Score;

    Score = (Owner.Level.TimeSeconds - mi.LastTargetedTime) / Time;
    Score = 1.0000000 - FClamp(Score, 0.0000000, 1.0000000);
    return Score;
    //return;    
}
