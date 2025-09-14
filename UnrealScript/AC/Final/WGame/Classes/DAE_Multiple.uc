class DAE_Multiple extends DAE;

var array<DAE> DAEs;
var array<float> Factors;
var float TotalFactors;

static function DAE_Multiple Create()
{
    local DAE_Multiple i;

    i = new default.Class;
    return i;
    //return;    
}

function Add(float factor, DAE inDAE)
{
    DAEs[DAEs.Length] = inDAE;
    Factors[Factors.Length] = factor;
    TotalFactors += factor;
    //return;    
}

function float Evaluate(MemoryItem mi)
{
    local int lp1;
    local float sum, fScore;

    lp1 = 0;
    J0x07:

    // End:0x87 [Loop If]
    if(lp1 < DAEs.Length)
    {
        fScore = DAEs[lp1].Evaluate(mi);
        // End:0x64
        if(DAEs[lp1].bFailAllEvaluation)
        {
            // End:0x64
            if(0.0000000 >= fScore)
            {
                return 0.0000000;
            }
        }
        sum += (Factors[lp1] * fScore);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return sum / TotalFactors;
    //return;    
}
