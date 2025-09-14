/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wPlanMaster.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class wPlanMaster extends Object;

var int MaxItr;
var int ItrPerFrame;
var int CurItr;
var int Planner_MinItr;
var int Planner_MaxItr;
var int Planner_UpdateItr;
var wAILevel AILevel;

static function wPlanMaster Create(wAILevel inLevel)
{
    local wPlanMaster i;

    i = new default.Class;
    i.AILevel = inLevel;
    i.CurItr = i.MaxItr;
    return i;
}

function Update(float dt)
{
    CurItr += ItrPerFrame;
    // End:0x26
    if(CurItr > MaxItr)
    {
        CurItr = MaxItr;
    }
}

function int RequestUpdateItr()
{
    return _request(Planner_UpdateItr);
}

function int RequestItr()
{
    local int Request;

    Request = int(float(Planner_MaxItr) * FMin(1.0, float(CurItr) / float(MaxItr)));
    Request = Max(Min(CurItr, Request), Planner_MinItr);
    return _request(Request);
}

private function int _request(int i)
{
    CurItr -= i;
    CurItr = Max(CurItr, 0);
    return i;
}

defaultproperties
{
    MaxItr=100
    ItrPerFrame=5
    Planner_MinItr=5
    Planner_MaxItr=20
    Planner_UpdateItr=1
}