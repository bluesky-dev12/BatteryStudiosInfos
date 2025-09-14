/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_Inverse.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class DAE_Inverse extends DAE;

var DAE Base;

static function DAE_Inverse Create(DAE inBase)
{
    local DAE_Inverse i;

    i = new default.Class;
    i.Base = inBase;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    return 1.0 - Base.Evaluate(MI);
}
