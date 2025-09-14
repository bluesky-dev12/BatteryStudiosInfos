class DAE_Visibility extends DAE;

var wAIBotBase Owner;

static function DAE_Visibility Create(wAIBotBase inOwner)
{
    local DAE_Visibility i;

    i = new default.Class;
    i.Owner = inOwner;
    return i;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    // End:0x14
    if(mi == none)
    {
        return 0.0000000;        
    }
    else
    {
        // End:0x2F
        if(mi.IsVisible)
        {
            return 1.0000000;            
        }
        else
        {
            return 0.0000000;
        }
    }
    //return;    
}
