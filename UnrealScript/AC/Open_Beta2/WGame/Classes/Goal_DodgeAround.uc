class Goal_DodgeAround extends Goal;

var NavigationPoint center;
var float StartTime;
var float Duration;
var float Radius;
var array<Vector> candidates;

function Goal_DodgeAround Init(wAIBotBase inOwner, NavigationPoint inCenter, float inRadius, float inDuration)
{
    InitBase(inOwner);
    center = inCenter;
    StartTime = 0.0000000;
    Duration = inDuration;
    Radius = inRadius;
    candidates.Length = 0;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_DodgeAround::ClearRefenreces]");
    center = none;
    //return;    
}

function InitCandidates()
{
    local int lp1;
    local Vector V, Result;
    local NavigationPoint N;

    lp1 = 0;
    J0x07:

    // End:0xFC [Loop If]
    if(lp1 < center.PathList.Length)
    {
        N = center.PathList[lp1].End;
        // End:0xF2
        if((center.PathList[lp1].reachFlags | 1) != 0)
        {
            V = N.Location;
            // End:0xAC
            if(VSize(V - center.Location) < Radius)
            {
                Result = V;                
            }
            else
            {
                Result = center.Location + (Normal(V - center.Location) * Radius);
            }
            candidates[candidates.Length] = Result;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Start()
{
    // End:0x41
    if(int(GoalStatus) == int(0))
    {
        InitCandidates();
        StartTime = Owner.Level.TimeSeconds;
        AddGoal();
        GoalStatus = 1;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x2E
    if((Owner.Level.TimeSeconds - StartTime) > Duration)
    {
        return 3;        
    }
    else
    {
        gs = ProcessSubGoals(dt);
        // End:0x55
        if(int(gs) == int(1))
        {
            return 1;            
        }
        else
        {
            // End:0x71
            if(int(gs) == int(3))
            {
                AddGoal();
                return 1;                
            }
            else
            {
                // End:0x87
                if(int(gs) == int(2))
                {
                    return 2;                    
                }
                else
                {
                    return gs;
                }
            }
        }
    }
    //return;    
}

function AddGoal()
{
    local Vector Dest;

    Dest = candidates[Rand(candidates.Length)];
    AddSubgoal(Goal_MoveToLocation(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToLocation')).Init(Owner, Dest));
    AddSubgoal(Goal_MoveToLocation(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToLocation')).Init(Owner, center.Location));
    //return;    
}

function string ToString()
{
    return "[Goal_DodgeAround]";
    //return;    
}
