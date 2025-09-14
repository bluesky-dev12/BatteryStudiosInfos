/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_LookAround.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
class Goal_LookAround extends Goal;

var float LastFocusTime;
var float Duration;
var float StartTime;
var Vector FocalPoint;

function Goal_LookAround Init(wAIBotBase inOwner, float inDuration)
{
    InitBase(inOwner);
    LastFocusTime = default.LastFocusTime;
    Duration = inDuration;
    return self;
}

function Start()
{
    // End:0x3b
    if(GoalStatus == 0)
    {
        StartTime = Owner.Level.TimeSeconds;
        GoalStatus = 1;
        NextFocusTarget();
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x2e
    if(Owner.Level.TimeSeconds - StartTime > Duration)
    {
        return 3;
    }
    // End:0x5e
    else
    {
        // End:0x5b
        if(Owner.Level.TimeSeconds - LastFocusTime > float(2))
        {
            NextFocusTarget();
        }
        return 1;
    }
}

function NextFocusTarget()
{
    local NavigationPoint cur;
    local Actor Focus;

    cur = Owner.Level.GetClosestNavigationPoint(Owner.Pawn.Location);
    Focus = cur.PathList[Rand(cur.PathList.Length)].End;
    // End:0xc7
    if(Focus == none)
    {
        FocalPoint = Owner.Pawn.Location;
        FocalPoint.X += float(Rand(1000) - 500);
        FocalPoint.Y += float(Rand(1000) - 500);
    }
    // End:0x108
    else
    {
        FocalPoint = Focus.Location;
        FocalPoint.Z = Owner.Pawn.Location.Z + float(144);
    }
    LastFocusTime = Owner.Level.TimeSeconds;
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = FocalPoint;
    return true;
}

function End();
function string ToString()
{
    return "[Goal_LookAround]";
}
