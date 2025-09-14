class DAE_Healthy extends DAE;

static function DAE_Healthy Create(bool bFailAllEvaluation)
{
    local DAE_Healthy i;

    i = new default.Class;
    i.bFailAllEvaluation = bFailAllEvaluation;
    return i;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    return FClamp(float(mi.Pawn.Health) / mi.Pawn.HealthMax, 0.0000000, 1.0000000);
    //return;    
}
