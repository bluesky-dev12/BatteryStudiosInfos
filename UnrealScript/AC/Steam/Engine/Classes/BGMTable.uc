/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BGMTable.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class BGMTable extends Object;

var array<string> Files;
var array<int> Durations;

static function int GetDuration(string File)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x42 [While If]
    if(lp1 < default.Files.Length)
    {
        // End:0x38
        if(default.Files[lp1] == File)
        {
            return default.Durations[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 0;
}

defaultproperties
{
    Files=// Object reference not set to an instance of an object.
    
    Durations=// Object reference not set to an instance of an object.
    
}