class DAE_Healthy extends DAE;

static function DAE_Healthy Create()
{
    local DAE_Healthy i;

    i = new default.Class;
    return i;
    //return;    
}

function float Evaluate(MemoryItem MI)
{
    return FClamp(float(MI.Pawn.Health) / MI.Pawn.HealthMax, 0.0000000, 1.0000000);
    //return;    
}
