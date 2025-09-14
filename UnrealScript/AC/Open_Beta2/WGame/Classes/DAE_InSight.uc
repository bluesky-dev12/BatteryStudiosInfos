class DAE_InSight extends DAE;

var wAIBotBase Owner;

static function DAE_InSight Create(wAIBotBase inOwner)
{
    local DAE_InSight i;

    i = new default.Class;
    i.Owner = inOwner;
    return i;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    // End:0x2A
    if((mi == none) || mi.Pawn == none)
    {
        return 0.0000000;        
    }
    else
    {
        // End:0x45
        if(mi.InSight)
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
