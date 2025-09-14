class DAE_Inverse extends DAE;

var DAE Base;

static function DAE_Inverse Create(DAE inBase)
{
    local DAE_Inverse i;

    i = new default.Class;
    i.Base = inBase;
    return i;
    //return;    
}

function float Evaluate(MemoryItem MI)
{
    return 1.0000000 - Base.Evaluate(MI);
    //return;    
}
