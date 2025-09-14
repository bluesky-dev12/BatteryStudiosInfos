/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_DodgeAround.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:7
 *
 *******************************************************************************/
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
    StartTime = 0.0;
    Duration = inDuration;
    Radius = inRadius;
    candidates.Length = 0;
    return self;
}

function ClearReferences()
{
    Log("[Goal_DodgeAround::ClearRefenreces]");
    center = none;
}

function InitCandidates()
{
    local int lp1;
    local Vector V, Result;
    local NavigationPoint N;

    lp1 = 0;
    J0x07:
    // End:0xfc [While If]
    if(lp1 < center.PathList.Length)
    {
        N = center.PathList[lp1].End;
        // End:0xf2
        if(center.PathList[lp1].reachFlags | 1 != 0)
        {
            V = N.Location;
            // End:0xac
            if(VSize(V - center.Location) < Radius)
            {
                Result = V;
            }
            // End:0xe0
            else
            {
                Result = center.Location + Normal(V - center.Location) * Radius;
            }
            candidates[candidates.Length] = Result;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Start()
{
    // End:0x41
    if(GoalStatus == 0)
    {
        InitCandidates();
        StartTime = Owner.Level.TimeSeconds;
        AddGoal();
        GoalStatus = 1;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x2e
    if(Owner.Level.TimeSeconds - StartTime > Duration)
    {
        return 3;
    }
    // End:0x8d
    else
    {
        gs = ProcessSubGoals(dt);
        // End:0x55
        if(gs == 1)
        {
            return 1;
        }
        // End:0x8d
        else
        {
            // End:0x71
            if(gs == 3)
            {
                AddGoal();
                return 1;
            }
            // End:0x8d
            else
            {
                // End:0x87
                if(gs == 2)
                {
                    return 2;
                }
                // End:0x8d
                else
                {
                    return gs;
                }
            }
        }
    }
}

function AddGoal()
{
    local Vector Dest;

    Dest = candidates[Rand(candidates.Length)];
    AddSubgoal(Goal_MoveToLocation(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MoveToLocation')).Init(Owner, Dest));
    AddSubgoal(Goal_MoveToLocation(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MoveToLocation')).Init(Owner, center.Location));
}

function string ToString()
{
    return "[Goal_DodgeAround]";
}
