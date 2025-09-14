class DAE_Dummy extends DAE;

var float Value;

static function DAE_Dummy Create(bool bFailAllEvaluation, float inValue)
{
    local DAE_Dummy i;

    i = new default.Class;
    i.bFailAllEvaluation = bFailAllEvaluation;
    i.Value = inValue;
    return i;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    return Value;
    //return;    
}
