class Goal_Look extends Goal;

var Vector LookLocation;
var byte old;
var bool pitchSet;

function Goal_Look Init(wAIBotBase inOwner, Vector inLookLocation)
{
    InitBase(inOwner);
    LookLocation = inLookLocation;
    old = default.old;
    pitchSet = default.pitchSet;
    return self;
    //return;    
}

function Start()
{
    // End:0x56
    if(int(GoalStatus) == int(0))
    {
        // End:0x4E
        if((Owner.Pawn == none) || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x45
    if(int(old) != int(Owner.Pawn.ViewPitch))
    {
        old = Owner.Pawn.ViewPitch;        
    }
    else
    {
        pitchSet = true;
    }
    // End:0x87
    if((Abs(Owner.Pawn.GetDotH(LookLocation)) > 0.9500000) && pitchSet)
    {
        return 3;        
    }
    else
    {
        return 1;
    }
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = none;
    Owner.FocalPoint = LookLocation;
    return true;
    //return;    
}

function End()
{
    //return;    
}

function string ToString()
{
    return (("[Goal_Look] LookLocation=" $ string(LookLocation)) $ " dotH=") $ string(Owner.Pawn.GetDotH(LookLocation));
    //return;    
}
