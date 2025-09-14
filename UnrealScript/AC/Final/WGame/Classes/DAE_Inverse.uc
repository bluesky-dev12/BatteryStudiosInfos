class DAE_Inverse extends DAE;

var DAE Base;

static function DAE_Inverse Create(bool bFailAllEvaluation, DAE inBase)
{
    local DAE_Inverse i;

    i = new default.Class;
    i.bFailAllEvaluation = bFailAllEvaluation;
    i.Base = inBase;
    return i;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    return 1.0000000 - Base.Evaluate(mi);
    //return;    
}
