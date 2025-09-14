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
    //return;    
}

function Start()
{
    // End:0x3B
    if(int(GoalStatus) == int(0))
    {
        StartTime = Owner.Level.TimeSeconds;
        GoalStatus = 1;
        NextFocusTarget();
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x2E
    if((Owner.Level.TimeSeconds - StartTime) > Duration)
    {
        return 3;        
    }
    else
    {
        // End:0x5B
        if((Owner.Level.TimeSeconds - LastFocusTime) > float(2))
        {
            NextFocusTarget();
        }
        return 1;
    }
    //return;    
}

function NextFocusTarget()
{
    local NavigationPoint cur;
    local Actor Focus;

    cur = Owner.Level.GetClosestNavigationPoint(Owner.Pawn.Location);
    Focus = cur.PathList[Rand(cur.PathList.Length)].End;
    // End:0xC7
    if(Focus == none)
    {
        FocalPoint = Owner.Pawn.Location;
        FocalPoint.X += float(Rand(1000) - 500);
        FocalPoint.Y += float(Rand(1000) - 500);        
    }
    else
    {
        FocalPoint = Focus.Location;
        FocalPoint.Z = Owner.Pawn.Location.Z + float(144);
    }
    LastFocusTime = Owner.Level.TimeSeconds;
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = FocalPoint;
    return true;
    //return;    
}

function End()
{
    //return;    
}

function string ToString()
{
    return "[Goal_LookAround]";
    //return;    
}
