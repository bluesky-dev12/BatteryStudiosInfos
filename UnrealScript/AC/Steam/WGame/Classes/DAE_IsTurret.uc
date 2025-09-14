/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_IsTurret.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class DAE_IsTurret extends DAE;

static function DAE_IsTurret Create()
{
    local DAE_IsTurret i;

    i = new default.Class;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    // End:0x2a
    if(MI == none || MI.Pawn == none)
    {
        return 0.0;
    }
    // End:0x56
    else
    {
        // End:0x50
        if(MI.Pawn.DrivenVehicle != none)
        {
            return 1.0;
        }
        // End:0x56
        else
        {
            return 0.0;
        }
    }
}
