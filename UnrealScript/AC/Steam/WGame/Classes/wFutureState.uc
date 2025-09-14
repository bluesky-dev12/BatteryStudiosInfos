/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wFutureState.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class wFutureState extends Object;

var wFlagObjectiveBase FlagDest;
var wFlagObjectiveBase FlagCapturing;

static function wFutureState Create()
{
    local wFutureState i;

    i = new default.Class;
    return i;
}

function Init()
{
    FlagDest = default.FlagDest;
    FlagCapturing = default.FlagCapturing;
}
