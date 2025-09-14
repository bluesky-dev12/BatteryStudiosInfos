class Goal_Melee extends Goal;

var Actor Target;
var float FireCheckInterval;
var float elapsed;
var bool DidMelee;
var float FailTime;

function Goal_Melee Init(wAIBotBase inOwner, Actor inTarget)
{
    InitBase(inOwner);
    Target = inTarget;
    // End:0x31
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    FireCheckInterval = default.FireCheckInterval;
    elapsed = default.elapsed;
    DidMelee = default.DidMelee;
    FailTime = default.FailTime;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_Melee::ClearRefenreces]");
    Target = none;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super.NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
    // End:0x49
    if(Owner.Focus == A)
    {
        Owner.Focus = none;
    }
    //return;    
}

function Start()
{
    // End:0x77
    if(int(GoalStatus) == int(0))
    {
        // End:0x5B
        if(((Target == none) || Owner.Pawn == none) || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            Owner.Focus = Target;
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x11
    if(Target == none)
    {
        return 2;        
    }
    else
    {
        elapsed += dt;
        FireCheckInterval -= dt;
        // End:0xEF
        if(FireCheckInterval < float(0))
        {
            FireCheckInterval = default.FireCheckInterval;
            // End:0x90
            if(!Owner.Pawn.IsA('wAIDefencePawn_Alien'))
            {
                Owner.Pawn.Weapon.FireMode[2].ModeDoFire();                
            }
            else
            {
                Owner.Pawn.Weapon.FireMode[0].ModeDoFire();
            }
            // End:0xEF
            if(int(Owner.Pawn.Weapon.MeleeState) == int(1))
            {
                DidMelee = true;
            }
        }
        // End:0xFE
        if(DidMelee)
        {
            return 3;            
        }
        else
        {
            // End:0x113
            if(elapsed > FailTime)
            {
                return 2;                
            }
            else
            {
                return 1;
            }
        }
    }
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = Target;
    Owner.FocalPoint.X = 0.0000000;
    Owner.FocalPoint.Y = 0.0000000;
    Owner.FocalPoint.Z = 0.0000000;
    return true;
    //return;    
}

function string ToString()
{
    return (("[Goal_Melee] Focus=" $ string(Owner.Focus)) $ " dotH=") $ string(Owner.Pawn.GetDotH(Owner.Focus.Location));
    //return;    
}

defaultproperties
{
    FireCheckInterval=0.1000000
    FailTime=3.0000000
}