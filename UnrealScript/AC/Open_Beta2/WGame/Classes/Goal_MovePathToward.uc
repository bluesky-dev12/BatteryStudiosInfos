class Goal_MovePathToward extends Goal;

var Actor Destination;
var int RouteCacheIdx;
var float ReachRadius;
var bool Sprint;

function Goal_MovePathToward Init(wAIBotBase inOwner, Actor inDestination, optional float inReachRadius)
{
    InitBase(inOwner);
    Destination = inDestination;
    // End:0x49
    if((Destination != none) && !Destination.IsA('NavigationPoint'))
    {
        Destination.RegisterDestroyListener(self);
    }
    RouteCacheIdx = default.RouteCacheIdx;
    // End:0x6F
    if(inReachRadius == float(0))
    {
        ReachRadius = 50.0000000;        
    }
    else
    {
        ReachRadius = inReachRadius;
    }
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_MovePathToward::ClearRefenreces]");
    Destination = none;
    //return;    
}

function Start()
{
    // End:0x94
    if(int(GoalStatus) == int(0))
    {
        // End:0x8C
        if(Destination != none)
        {
            Sprint = (Owner.fSprintTime >= Owner.Pawn.wMyParam.Stm_MaxTime) && FRand() < (float(Owner.NPCParam.SprintRate) / 100.0000000);
            GoalStatus = 1;
            AddGoalMoveToward();            
        }
        else
        {
            GoalStatus = 2;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    // End:0x25
    if((Destination == none) || Owner.IsStopAction)
    {
        return 2;        
    }
    else
    {
        gs = ProcessSubGoals(dt);
        // End:0xAF
        if(int(gs) == int(3))
        {
            // End:0x9A
            if(Owner.Pawn.ReachedDestination(Destination))
            {
                Log("[Goal_MovePathToward] reached destination!");
                return 3;                
            }
            else
            {
                // End:0xA9
                if(AddGoalMoveToward())
                {
                    return 1;                    
                }
                else
                {
                    return 2;
                }
            }            
        }
        else
        {
            // End:0xC5
            if(int(gs) == int(1))
            {
                return 1;                
            }
            else
            {
                return 2;
            }
        }
    }
    //return;    
}

function bool AddGoalMoveToward(optional int stackLevel)
{
    local Actor Next, Focus, temp;

    // End:0x15A
    if((RouteCacheIdx == 0) || RouteCacheIdx == 16)
    {
        // End:0x58
        if(RouteCacheIdx == 0)
        {
            Owner.UpdateNavDetourExtraCost(Owner.Pawn.Location, Destination.Location);
        }
        Owner.CopyNavExtraCost();
        temp = Owner.FindPathToward(Destination);
        // End:0xA9
        if(temp == none)
        {
            temp = Owner.FindPathTo(Destination.Location);
        }
        Owner.ZeroExtraCost();
        // End:0x153
        if(temp == none)
        {
            // End:0xF6
            if(stackLevel >= 3)
            {
                wAIPawn(Owner.Pawn).SetCannotFIndPath(Destination);
                return false;                
            }
            else
            {
                wAIPawn(Owner.Pawn).LogCannotFindPath(Destination);
                Destination = Owner.Level.GetRandomNavigationPointAround(Destination.Location);
                return AddGoalMoveToward(stackLevel + 1);
            }
        }
        RouteCacheIdx = 0;
    }
    Next = Owner.RouteCache[RouteCacheIdx++];
    // End:0x18C
    if(Next == none)
    {
        Next = Destination;
    }
    // End:0x1B2
    if(RouteCacheIdx < 16)
    {
        Focus = Owner.RouteCache[RouteCacheIdx];
    }
    // End:0x1C8
    if(Focus == none)
    {
        Focus = Next;
    }
    ClearSubgoals(true);
    AddSubgoal(Goal_MoveToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToward')).Init(Owner, Next, Focus, ReachRadius, Sprint, false, false));
    return true;
    //return;    
}

function string ToString()
{
    return (((("[Goal_MovePathToward] dest=" $ string(Destination.Name)) $ ", dist to dest=") $ string(VSize(Owner.Pawn.Location - Destination.Location))) $ " sprint=") $ string(Sprint);
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Destination == A)
    {
        Destination = none;
    }
    //return;    
}
