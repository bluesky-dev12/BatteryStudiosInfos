/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_Melee.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:7
 *
 *******************************************************************************/
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
}

function ClearReferences()
{
    Log("[Goal_Melee::ClearRefenreces]");
    Target = none;
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
}

function Start()
{
    // End:0x63
    if(GoalStatus == 0)
    {
        // End:0x5b
        if(Target == none || Owner.Pawn == none || Owner.Pawn.Weapon == none)
        {
            GoalStatus = 2;
        }
        // End:0x63
        else
        {
            GoalStatus = 1;
        }
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    // End:0x11
    if(Target == none)
    {
        return 2;
    }
    // End:0xc8
    else
    {
        elapsed += dt;
        FireCheckInterval -= dt;
        // End:0xa1
        if(FireCheckInterval < float(0))
        {
            FireCheckInterval = default.FireCheckInterval;
            Owner.Pawn.Weapon.FireMode[2].ModeDoFire();
            // End:0xa1
            if(Owner.Pawn.Weapon.MeleeState == 1)
            {
                DidMelee = true;
            }
        }
        // End:0xb0
        if(DidMelee)
        {
            return 3;
        }
        // End:0xc8
        else
        {
            // End:0xc5
            if(elapsed > FailTime)
            {
                return 2;
            }
            // End:0xc8
            else
            {
                return 1;
            }
        }
    }
}

function bool SetFocusValue()
{
    Owner.Focus = Target;
    Owner.FocalPoint.X = 0.0;
    Owner.FocalPoint.Y = 0.0;
    Owner.FocalPoint.Z = 0.0;
    return true;
}

function string ToString()
{
    return "[Goal_Melee] Focus=" $ string(Owner.Focus) $ " dotH=" $ string(Owner.Pawn.GetDotH(Owner.Focus.Location));
}

defaultproperties
{
    FireCheckInterval=0.10
    FailTime=3.0
}