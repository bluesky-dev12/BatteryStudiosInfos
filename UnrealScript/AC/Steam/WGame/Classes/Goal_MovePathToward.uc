/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_MovePathToward.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
class Goal_MovePathToward extends Goal
    dependson(wAIPawn)
    dependson(Goal_MoveToward);

var Actor Destination;
var int RouteCacheIdx;
var float ReachRadius;
var bool Sprint;

function Goal_MovePathToward Init(wAIBotBase inOwner, Actor inDestination, optional float inReachRadius)
{
    InitBase(inOwner);
    Destination = inDestination;
    // End:0x49
    if(Destination != none && !Destination.IsA('NavigationPoint'))
    {
        Destination.RegisterDestroyListener(self);
    }
    RouteCacheIdx = default.RouteCacheIdx;
    // End:0x6f
    if(inReachRadius == float(0))
    {
        ReachRadius = 50.0;
    }
    // End:0x7a
    else
    {
        ReachRadius = inReachRadius;
    }
    return self;
}

function ClearReferences()
{
    Log("[Goal_MovePathToward::ClearRefenreces]");
    Destination = none;
}

function Start()
{
    // End:0x94
    if(GoalStatus == 0)
    {
        // End:0x8c
        if(Destination != none)
        {
            Sprint = Owner.fSprintTime >= Owner.Pawn.wMyParam.Stm_MaxTime && FRand() < float(Owner.NPCParam.SprintRate) / 100.0;
            GoalStatus = 1;
            AddGoalMoveToward();
        }
        // End:0x94
        else
        {
            GoalStatus = 2;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x11
    if(Destination == none)
    {
        return 2;
    }
    // End:0xb4
    else
    {
        gs = ProcessSubGoals(dt);
        // End:0x9b
        if(gs == 3)
        {
            // End:0x86
            if(Owner.Pawn.ReachedDestination(Destination))
            {
                Log("[Goal_MovePathToward] reached destination!");
                return 3;
            }
            // End:0x98
            else
            {
                // End:0x95
                if(AddGoalMoveToward())
                {
                    return 1;
                }
                // End:0x98
                else
                {
                    return 2;
                }
            }
        }
        // End:0xb4
        else
        {
            // End:0xb1
            if(gs == 1)
            {
                return 1;
            }
            // End:0xb4
            else
            {
                return 2;
            }
        }
    }
}

function bool AddGoalMoveToward(optional int stackLevel)
{
    local Actor Next, Focus, temp;

    // End:0x15a
    if(RouteCacheIdx == 0 || RouteCacheIdx == 16)
    {
        // End:0x58
        if(RouteCacheIdx == 0)
        {
            Owner.UpdateNavDetourExtraCost(Owner.Pawn.Location, Destination.Location);
        }
        Owner.CopyNavExtraCost();
        temp = Owner.FindPathToward(Destination);
        // End:0xa9
        if(temp == none)
        {
            temp = Owner.FindPathTo(Destination.Location);
        }
        Owner.ZeroExtraCost();
        // End:0x153
        if(temp == none)
        {
            // End:0xf6
            if(stackLevel >= 3)
            {
                wAIPawn(Owner.Pawn).SetCannotFIndPath(Destination);
                return false;
            }
            // End:0x153
            else
            {
                wAIPawn(Owner.Pawn).LogCannotFindPath(Destination);
                Destination = Owner.Level.GetRandomNavigationPointAround(Destination.Location);
                return AddGoalMoveToward(stackLevel + 1);
            }
        }
        RouteCacheIdx = 0;
    }
    Next = Owner.RouteCache[++ RouteCacheIdx];
    // End:0x18c
    if(Next == none)
    {
        Next = Destination;
    }
    // End:0x1b2
    if(RouteCacheIdx < 16)
    {
        Focus = Owner.RouteCache[RouteCacheIdx];
    }
    // End:0x1c8
    if(Focus == none)
    {
        Focus = Next;
    }
    ClearSubgoals(true);
    AddSubgoal(Goal_MoveToward(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MoveToward')).Init(Owner, Next, Focus, ReachRadius, Sprint, false, false));
    return true;
}

function string ToString()
{
    return "[Goal_MovePathToward] dest=" $ string(Destination.Name) $ ", dist to dest=" $ string(VSize(Owner.Pawn.Location - Destination.Location)) $ " sprint=" $ string(Sprint);
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Destination == A)
    {
        Destination = none;
    }
}
