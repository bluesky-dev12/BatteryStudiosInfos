/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_Visibility.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class DAE_Visibility extends DAE;

var wAIBotBase Owner;

static function DAE_Visibility Create(wAIBotBase inOwner)
{
    local DAE_Visibility i;

    i = new default.Class;
    i.Owner = inOwner;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    // End:0x14
    if(MI == none)
    {
        return 0.0;
    }
    // End:0x35
    else
    {
        // End:0x2f
        if(MI.IsVisible)
        {
            return 1.0;
        }
        // End:0x35
        else
        {
            return 0.0;
        }
    }
}
