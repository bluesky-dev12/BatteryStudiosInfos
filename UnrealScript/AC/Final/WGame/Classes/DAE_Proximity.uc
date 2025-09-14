class DAE_Proximity extends DAE;

var float MaxDistance;
var wAIBotBase Owner;

static function DAE_Proximity Create(bool bFailAllEvaluation, wAIBotBase inOwner, float inMaxDistance)
{
    local DAE_Proximity i;

    i = new default.Class;
    i.bFailAllEvaluation = bFailAllEvaluation;
    i.MaxDistance = inMaxDistance;
    i.Owner = inOwner;
    return i;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    local float dist;

    dist = VSize(mi.Pawn.Location - Owner.Pawn.Location);
    // End:0x50
    if(dist > MaxDistance)
    {
        return 0.0000000;        
    }
    else
    {
        return 1.0000000 - (dist / MaxDistance);
    }
    //return;    
}
