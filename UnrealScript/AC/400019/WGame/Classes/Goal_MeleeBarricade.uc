class Goal_MeleeBarricade extends Goal;

var Actor Target;
var float DefaultFireCheckInterval;
var float FireCheckInterval;
var float elapsed;
var bool DidMelee;
var float FailTime;

function Goal_MeleeBarricade Init(wAIBotBase inOwner, Actor inTarget)
{
    InitBase(inOwner);
    Target = inTarget;
    // End:0x31
    if(Target != none)
    {
        Target.RegisterDestroyListener(self);
    }
    // End:0x96
    if((inOwner.Pawn != none) && inOwner.Pawn.Weapon != none)
    {
        DefaultFireCheckInterval = inOwner.Pawn.Weapon.BaseParams.fMeleeDelay;        
    }
    else
    {
        DefaultFireCheckInterval = default.FireCheckInterval;
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
    Log("[Goal_MeleeBarricade::ClearRefenreces]");
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
    // End:0x8E
    if(int(GoalStatus) == int(0))
    {
        // End:0x5B
        if(((Target == none) || Owner.Pawn == none) || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;            
        }
        else
        {
            Owner.Focus = wAIDefencePawn(Owner.Pawn).AttackFlag;
            GoalStatus = 1;
        }
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x18
    if(Target.bHidden == true)
    {
        return 3;
    }
    // End:0x107
    if(Target != none)
    {
        elapsed += dt;
        FireCheckInterval -= dt;
        // End:0x101
        if(FireCheckInterval < float(0))
        {
            FireCheckInterval = DefaultFireCheckInterval;
            // End:0xA2
            if(!Owner.Pawn.IsA('wAIDefencePawn_Alien'))
            {
                Owner.Pawn.Weapon.FireMode[2].ModeDoFire();                
            }
            else
            {
                Owner.Pawn.Weapon.FireMode[0].ModeDoFire();
            }
            // End:0x101
            if(int(Owner.Pawn.Weapon.MeleeState) == int(1))
            {
                DidMelee = true;
            }
        }
        return 1;        
    }
    else
    {
        // End:0x116
        if(DidMelee)
        {
            return 3;            
        }
        else
        {
            return 2;
        }
    }
    //return;    
}

function bool SetFocusValue()
{
    Owner.Focus = wAIDefencePawn(Owner.Pawn).AttackFlag;
    Owner.FocalPoint.X = 0.0000000;
    Owner.FocalPoint.Y = 0.0000000;
    Owner.FocalPoint.Z = 0.0000000;
    return true;
    //return;    
}

function string ToString()
{
    return (("[Goal_MeleeBarricade] Focus=" $ string(Owner.Focus)) $ " dotH=") $ string(Owner.Pawn.GetDotH(Owner.Focus.Location));
    //return;    
}

defaultproperties
{
    FireCheckInterval=0.1000000
    FailTime=5.0000000
}