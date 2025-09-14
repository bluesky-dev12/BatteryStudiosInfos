class DAE_Dummy extends DAE;

var float Value;

static function DAE_Dummy Create(float inValue)
{
    local DAE_Dummy i;

    i = new default.Class;
    i.Value = inValue;
    return i;
    //return;    
}

function float Evaluate(MemoryItem MI)
{
    return Value;
    //return;    
}
