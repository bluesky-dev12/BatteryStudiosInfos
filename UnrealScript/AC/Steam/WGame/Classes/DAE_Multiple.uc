/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_Multiple.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class DAE_Multiple extends DAE;

var array<DAE> DAEs;
var array<float> Factors;
var float TotalFactors;

static function DAE_Multiple Create()
{
    local DAE_Multiple i;

    i = new default.Class;
    return i;
}

function Add(float factor, DAE inDAE)
{
    DAEs[DAEs.Length] = inDAE;
    Factors[Factors.Length] = factor;
    TotalFactors += factor;
}

function float Evaluate(MemoryItem MI)
{
    local int lp1;
    local float sum;

    lp1 = 0;
    J0x07:
    // End:0x4f [While If]
    if(lp1 < DAEs.Length)
    {
        sum += Factors[lp1] * DAEs[lp1].Evaluate(MI);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return sum / TotalFactors;
}
