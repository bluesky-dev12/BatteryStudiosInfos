/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DAE_RecentTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class DAE_RecentTarget extends DAE;

var float Time;
var wAIBotBase Owner;

static function DAE_RecentTarget Create(wAIBotBase inOwner, float InTime)
{
    local DAE_RecentTarget i;

    i = new default.Class;
    i.Time = InTime;
    i.Owner = inOwner;
    return i;
}

function float Evaluate(MemoryItem MI)
{
    local float Score;

    Score = Owner.Level.TimeSeconds - MI.LastTargetedTime / Time;
    Score = 1.0 - FClamp(Score, 0.0, 1.0);
    return Score;
}
