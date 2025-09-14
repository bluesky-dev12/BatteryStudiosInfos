/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_Healthy.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class DAE_Healthy extends DAE;

static function DAE_Healthy Create()
{
    local DAE_Healthy i;

    i = new default.Class;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    return FClamp(float(MI.Pawn.Health) / MI.Pawn.HealthMax, 0.0, 1.0);
}
