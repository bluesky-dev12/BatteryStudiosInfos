/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_MoveToward.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:9
 *
 *******************************************************************************/
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
    inProne = inProne && !inSprint && !inCrouch;
    InitBase(inOwner);
    Destination = inDestination;
    // End:0x8a
    if(Destination != none && !Destination.IsA('NavigationPoint'))
    {
        Destination.RegisterDestroyListener(self);
    }
    Focus = inFocus;
    // End:0xc8
    if(Focus != none && !Focus.IsA('NavigationPoint'))
    {
        Focus.RegisterDestroyListener(self);
    }
    bSprint = inSprint;
    bCrouch = inCrouch;
    bProne = inProne;
    // End:0x10a
    if(inReachRadius == float(0))
    {
        ReachRadius = 50.0;
    }
    // End:0x115
    else
    {
        ReachRadius = inReachRadius;
    }
    return self;
}

function ClearReferences()
{
    Log("[Goal_MoveToward::ClearRefenreces]");
    Destination = none;
    Focus = none;
}

function bool PassedCheckPoint()
{
    local bool Update;

    // End:0x1c
    if(CheckPointTime == float(-1))
    {
        Update = true;
    }
    // End:0x76
    else
    {
        // End:0x76
        if(Owner.Level.PlayTimeSeconds - CheckPointTime > float(3))
        {
            // End:0x6e
            if(VSize(checkpoint - Owner.Pawn.Location) < float(50))
            {
                return false;
            }
            Update = true;
        }
    }
    // End:0xb9
    if(Update)
    {
        checkpoint = Owner.Pawn.Location;
        CheckPointTime = Owner.Level.PlayTimeSeconds;
    }
    return true;
}

function Start()
{
    // End:0xba
    if(GoalStatus == 0)
    {
        // End:0xb2
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
            // End:0x9a
            else
            {
                // End:0x82
                if(bCrouch)
                {
                    Owner.TryCrouch();
                }
                // End:0x9a
                else
                {
                    // End:0x9a
                    if(bProne)
                    {
                        Owner.TryProne();
                    }
                }
            }
            Owner.GotoState('ProcessGoal', 'Move');
        }
        // End:0xba
        else
        {
            GoalStatus = 2;
        }
    }
}

function bool doSprint()
{
    return bSprint && Owner.Level.TimeSeconds - Owner.Pawn.fLastFireNoiseTime > float(1);
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x0e
    if(!PassedCheckPoint())
    {
        return 2;
    }
    // End:0x1f
    if(Destination == none)
    {
        return 2;
    }
    // End:0x10b
    else
    {
        // End:0x45
        if(Owner.Pawn.ReachedDestination(Destination))
        {
            return 3;
        }
        // End:0x10b
        else
        {
            // End:0x5c
            if(Owner.MoveTarget == none)
            {
                return 2;
            }
            // End:0x6d
            if(Destination == none)
            {
                return 2;
            }
            // End:0x10b
            else
            {
                // End:0xad
                if(doSprint())
                {
                    // End:0x9b
                    if(Owner.IsStandingUp())
                    {
                        Owner.SetSprint(true);
                    }
                    // End:0xaa
                    else
                    {
                        Owner.TryStandUp();
                    }
                }
                // End:0x108
                else
                {
                    // End:0xdc
                    if(bProne)
                    {
                        // End:0xd9
                        if(!Owner.IsProning())
                        {
                            Owner.TryProne();
                        }
                    }
                    // End:0x108
                    else
                    {
                        // End:0x108
                        if(bCrouch)
                        {
                            // End:0x108
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
}

function bool SetFocusValue()
{
    Owner.Focus = Focus;
    Owner.FocalPoint.X = 0.0;
    Owner.FocalPoint.Y = 0.0;
    Owner.FocalPoint.Z = 0.0;
    return true;
}

function NotifyDestroyed(Actor A)
{
    // End:0x16
    if(Destination == A)
    {
        Destination = none;
    }
    // End:0x2c
    if(Focus == A)
    {
        Focus = none;
    }
    // End:0x87
    if(Owner != none)
    {
        // End:0x5f
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
}

function string ToString()
{
    return "[Goal_MoveToward] dest=" $ string(Destination.Name) $ ", dist to dest=" $ string(VSize(Owner.Pawn.Location - Destination.Location)) $ ", bSprint=" $ string(bSprint);
}

defaultproperties
{
    LostStartTime=-1.0
    CheckPointTime=-1.0
}