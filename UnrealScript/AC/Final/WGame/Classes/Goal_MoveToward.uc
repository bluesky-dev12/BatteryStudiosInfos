class Goal_MoveToward extends Goal;

var Actor Destination;
var Actor Focus;
var bool bSprint;
var bool bCrouch;
var bool bProne;
var float ReachRadius;
var float LostStartTime;
var Vector checkpoint;
var float CheckPointTime;

function Goal_MoveToward Init(wAIBotBase inOwner, Actor inDestination, Actor inFocus, optional float inReachRadius, optional bool inSprint, optional bool inCrouch, optional bool inProne)
{
    inCrouch = inCrouch && !inSprint;
    inProne = (inProne && !inSprint) && !inCrouch;
    InitBase(inOwner);
    Destination = inDestination;
    // End:0x8A
    if((Destination != none) && !Destination.IsA('NavigationPoint'))
    {
        Destination.RegisterDestroyListener(self);
    }
    Focus = inFocus;
    // End:0xC8
    if((Focus != none) && !Focus.IsA('NavigationPoint'))
    {
        Focus.RegisterDestroyListener(self);
    }
    bSprint = inSprint;
    bCrouch = inCrouch;
    bProne = inProne;
    // End:0x10A
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
    Log("[Goal_MoveToward::ClearRefenreces]");
    Destination = none;
    Focus = none;
    //return;    
}

function bool PassedCheckPoint()
{
    local bool Update;

    // End:0x1C
    if(CheckPointTime == float(-1))
    {
        Update = true;        
    }
    else
    {
        // End:0x76
        if((Owner.Level.PlayTimeSeconds - CheckPointTime) > float(3))
        {
            // End:0x6E
            if(VSize(checkpoint - Owner.Pawn.Location) < float(50))
            {
                return false;
            }
            Update = true;
        }
    }
    // End:0xB9
    if(Update)
    {
        checkpoint = Owner.Pawn.Location;
        CheckPointTime = Owner.Level.PlayTimeSeconds;
    }
    return true;
    //return;    
}

function Start()
{
    // End:0xBA
    if(int(GoalStatus) == int(0))
    {
        // End:0xB2
        if(Destination != none)
        {
            GoalStatus = 1;
            Owner.MoveTarget = Destination;
            Owner.SetSprint(doSprint());
            // End:0x67
            if(doSprint())
            {
                Owner.TryStandUp();                
            }
            else
            {
                // End:0x82
                if(bCrouch)
                {
                    Owner.TryCrouch();                    
                }
                else
                {
                    // End:0x9A
                    if(bProne)
                    {
                        Owner.TryProne();
                    }
                }
            }
            Owner.GotoState('ProcessGoal', 'Move');            
        }
        else
        {
            GoalStatus = 2;
        }
    }
    //return;    
}

function bool doSprint()
{
    return bSprint && (Owner.Level.TimeSeconds - Owner.Pawn.fLastFireNoiseTime) > float(1);
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x0E
    if(!PassedCheckPoint())
    {
        return 2;
    }
    // End:0x33
    if((Destination == none) || Owner.IsStopAction)
    {
        return 2;        
    }
    else
    {
        // End:0x59
        if(Owner.Pawn.ReachedDestination(Destination))
        {
            return 3;            
        }
        else
        {
            // End:0x70
            if(Owner.MoveTarget == none)
            {
                return 2;
            }
            // End:0x81
            if(Destination == none)
            {
                return 2;                
            }
            else
            {
                // End:0xC1
                if(doSprint())
                {
                    // End:0xAF
                    if(Owner.IsStandingUp())
                    {
                        Owner.SetSprint(true);                        
                    }
                    else
                    {
                        Owner.TryStandUp();
                    }                    
                }
                else
                {
                    // End:0xF0
                    if(bProne)
                    {
                        // End:0xED
                        if(!Owner.IsProning())
                        {
                            Owner.TryProne();
                        }                        
                    }
                    else
                    {
                        // End:0x11C
                        if(bCrouch)
                        {
                            // End:0x11C
                            if(!Owner.IsCrouching())
                            {
                                Owner.TryCrouch();
                            }
                        }
                    }
                }
                return 1;
            }
        }
    }
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = Focus;
    Owner.FocalPoint.X = 0.0000000;
    Owner.FocalPoint.Y = 0.0000000;
    Owner.FocalPoint.Z = 0.0000000;
    return true;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    // End:0x16
    if(Destination == A)
    {
        Destination = none;
    }
    // End:0x2C
    if(Focus == A)
    {
        Focus = none;
    }
    // End:0x87
    if(Owner != none)
    {
        // End:0x5F
        if(Owner.MoveTarget == A)
        {
            Owner.MoveTarget = none;
        }
        // End:0x87
        if(Owner.Focus == A)
        {
            Owner.Focus = none;
        }
    }
    super.NotifyDestroyed(A);
    //return;    
}

function string ToString()
{
    return (((("[Goal_MoveToward] dest=" $ string(Destination.Name)) $ ", dist to dest=") $ string(VSize(Owner.Pawn.Location - Destination.Location))) $ ", bSprint=") $ string(bSprint);
    //return;    
}

defaultproperties
{
    LostStartTime=-1.0000000
    CheckPointTime=-1.0000000
}