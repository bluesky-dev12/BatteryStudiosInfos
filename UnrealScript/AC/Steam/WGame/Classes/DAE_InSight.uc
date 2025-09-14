/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_InSight.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class DAE_InSight extends DAE;

var wAIBotBase Owner;

static function DAE_InSight Create(wAIBotBase inOwner)
{
    local DAE_InSight i;

    i = new default.Class;
    i.Owner = inOwner;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    // End:0x2a
    if(MI == none || MI.Pawn == none)
    {
        return 0.0;
    }
    // End:0x4b
    else
    {
        // End:0x45
        if(MI.InSight)
        {
            return 1.0;
        }
        // End:0x4b
        else
        {
            return 0.0;
        }
    }
}
