class DAE_IsTurret extends DAE;

static function DAE_IsTurret Create()
{
    local DAE_IsTurret i;

    i = new default.Class;
    return i;
    //return;    
}

function float Evaluate(MemoryItem MI)
{
    // End:0x2A
    if((MI == none) || MI.Pawn == none)
    {
        return 0.0000000;        
    }
    else
    {
        // End:0x50
        if(MI.Pawn.DrivenVehicle != none)
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
