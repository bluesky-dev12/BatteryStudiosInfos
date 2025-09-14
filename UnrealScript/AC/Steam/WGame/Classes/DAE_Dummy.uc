/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_Dummy.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class DAE_Dummy extends DAE;

var float Value;

static function DAE_Dummy Create(float inValue)
{
    local DAE_Dummy i;

    i = new default.Class;
    i.Value = inValue;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    return Value;
}
