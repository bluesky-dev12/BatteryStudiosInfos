/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_MoveToLocation.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:5
 *
 *******************************************************************************/
class Goal_MoveToLocation extends Goal;

var Vector Destination;
var bool bSprint;
var bool bCrouch;
var bool bProne;

function Goal_MoveToLocation Init(wAIBotBase inOwner, Vector inDestination, optional bool inSprint, optional bool inCrouch, optional bool inProne)
{
    inCrouch = inCrouch && !inSprint;
    inProne = inProne && !inSprint && !inCrouch;
    InitBase(inOwner);
    Destination = inDestination;
    bSprint = inSprint;
    bCrouch = inCrouch;
    bProne = inProne;
    return self;
}

function Start()
{
    // End:0xa4
    if(GoalStatus == 0)
    {
        GoalStatus = 1;
        Owner.Destination = Destination;
        Owner.SetSprint(bSprint);
        // End:0x5c
        if(bSprint)
        {
            Owner.TryStandUp();
        }
        // End:0x8f
        else
        {
            // End:0x77
            if(bCrouch)
            {
                Owner.TryCrouch();
            }
            // End:0x8f
            else
            {
                // End:0x8f
                if(bProne)
                {
                    Owner.TryProne();
                }
            }
        }
        Owner.GotoState('ProcessGoal', 'MovePosition');
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x2f
    if(VSize(Owner.Pawn.Location - Destination) < float(50))
    {
        return 3;
    }
    // End:0xbc
    else
    {
        // End:0x5e
        if(bSprint)
        {
            // End:0x5b
            if(!Owner.IsStandingUp())
            {
                Owner.TryStandUp();
            }
        }
        // End:0xb9
        else
        {
            // End:0x8d
            if(bProne)
            {
                // End:0x8a
                if(!Owner.IsProning())
                {
                    Owner.TryProne();
                }
            }
            // End:0xb9
            else
            {
                // End:0xb9
                if(bCrouch)
                {
                    // End:0xb9
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

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = Destination;
    return true;
}

function string ToString()
{
    return "[Goal_MoveToLocation] dest=" $ string(Destination) $ ", dist to dest=" $ string(VSize(Owner.Pawn.Location - Destination)) $ ", bSprint=" $ string(bSprint);
}
