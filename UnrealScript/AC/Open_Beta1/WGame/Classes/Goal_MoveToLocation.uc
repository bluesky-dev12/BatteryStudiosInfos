class Goal_MoveToLocation extends Goal;

var Vector Destination;
var bool bSprint;
var bool bCrouch;
var bool bProne;

function Goal_MoveToLocation Init(wAIBotBase inOwner, Vector inDestination, optional bool inSprint, optional bool inCrouch, optional bool inProne)
{
    inCrouch = inCrouch && !inSprint;
    inProne = (inProne && !inSprint) && !inCrouch;
    InitBase(inOwner);
    Destination = inDestination;
    bSprint = inSprint;
    bCrouch = inCrouch;
    bProne = inProne;
    return self;
    //return;    
}

function Start()
{
    // End:0xA4
    if(int(GoalStatus) == int(0))
    {
        GoalStatus = 1;
        Owner.Destination = Destination;
        Owner.SetSprint(bSprint);
        // End:0x5C
        if(bSprint)
        {
            Owner.TryStandUp();            
        }
        else
        {
            // End:0x77
            if(bCrouch)
            {
                Owner.TryCrouch();                
            }
            else
            {
                // End:0x8F
                if(bProne)
                {
                    Owner.TryProne();
                }
            }
        }
        Owner.GotoState('ProcessGoal', 'MovePosition');
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x2F
    if(VSize(Owner.Pawn.Location - Destination) < float(50))
    {
        return 3;        
    }
    else
    {
        // End:0x5E
        if(bSprint)
        {
            // End:0x5B
            if(!Owner.IsStandingUp())
            {
                Owner.TryStandUp();
            }            
        }
        else
        {
            // End:0x8D
            if(bProne)
            {
                // End:0x8A
                if(!Owner.IsProning())
                {
                    Owner.TryProne();
                }                
            }
            else
            {
                // End:0xB9
                if(bCrouch)
                {
                    // End:0xB9
                    if(!Owner.IsCrouching())
                    {
                        Owner.TryCrouch();
                    }
                }
            }
        }
        return 1;
    }
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = Destination;
    return true;
    //return;    
}

function string ToString()
{
    return (((("[Goal_MoveToLocation] dest=" $ string(Destination)) $ ", dist to dest=") $ string(VSize(Owner.Pawn.Location - Destination))) $ ", bSprint=") $ string(bSprint);
    //return;    
}
