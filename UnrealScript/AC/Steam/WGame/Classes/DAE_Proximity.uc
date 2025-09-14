/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_Proximity.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class DAE_Proximity extends DAE;

var float MaxDistance;
var wAIBotBase Owner;

static function DAE_Proximity Create(wAIBotBase inOwner, float inMaxDistance)
{
    local DAE_Proximity i;

    i = new default.Class;
    i.MaxDistance = inMaxDistance;
    i.Owner = inOwner;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    local float dist;

    dist = VSize(MI.Pawn.Location - Owner.Pawn.Location);
    // End:0x50
    if(dist > MaxDistance)
    {
        return 0.0;
    }
    // End:0x64
    else
    {
        return 1.0 - dist / MaxDistance;
    }
}
