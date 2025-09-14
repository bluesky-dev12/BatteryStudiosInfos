class Goal extends Object;

enum EGoalStatus
{
    GS_NONE,                        // 0
    GS_WORKING,                     // 1
    GS_FAILED,                      // 2
    GS_COMPLETED                    // 3
};

var wAIBotBase Owner;
var string GoalName;
var array<Goal> Subgoals;
var Goal.EGoalStatus GoalStatus;
var string MessageNotifyKilled;
var string MessageMemoryVisibleChanged;
var string MessageFlashed;
var string MessageBePeaceful;
var string MessageNotifyDied;

function InitBase(wAIBotBase inOwner)
{
    Owner = inOwner;
    Subgoals.Length = 0;
    GoalStatus = 0;
    Owner.RegisterDestroyListener(self);
    //return;    
}

function ClearReferences()
{
    Log("[Goal::ClearRefenreces]");
    Owner = none;
    Subgoals.Length = 0;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    // End:0x16
    if(Owner == A)
    {
        Owner = none;
    }
    //return;    
}

function AddSubgoal(Goal inGoal)
{
    Subgoals[Subgoals.Length] = inGoal;
    //return;    
}

function ClearSubgoals(optional bool free)
{
    local int lp1;

    // End:0x6C
    if(free)
    {
        lp1 = 0;
        J0x10:

        // End:0x6C [Loop If]
        if(lp1 < Subgoals.Length)
        {
            Subgoals[lp1].ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(Subgoals[lp1]);
            lp1++;
            // [Loop Continue]
            goto J0x10;
        }
    }
    // End:0x89
    if(Subgoals.Length > 0)
    {
        Subgoals[0].End();
    }
    Subgoals.Length = 0;
    //return;    
}

function Start()
{
    //return;    
}

function StartIfNotStarted()
{
    // End:0x16
    if(int(GoalStatus) == int(0))
    {
        Start();
    }
    //return;    
}

function Goal.EGoalStatus Process(float dt)
{
    StartIfNotStarted();
    // End:0x27
    if(int(GoalStatus) == int(1))
    {
        GoalStatus = ActualWork(dt);
    }
    return GoalStatus;
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    return ProcessSubGoals(dt);
    //return;    
}

function Goal.EGoalStatus ProcessSubGoals(float dt)
{
    local Goal.EGoalStatus gs;
    local bool atomicSubgoal;

    // End:0x12
    if(Subgoals.Length == 0)
    {
        return 3;        
    }
    else
    {
        atomicSubgoal = Subgoals[0].Subgoals.Length == 0;
        gs = Subgoals[0].Process(dt);
        // End:0x5F
        if(int(gs) == int(1))
        {
            return 1;            
        }
        else
        {
            Subgoals[0].End();
            Subgoals[0].ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(Subgoals[0]);
            Subgoals.Remove(0, 1);
            // End:0xDA
            if(int(gs) == int(3))
            {
                // End:0xD4
                if(Subgoals.Length == 0)
                {
                    return 3;                    
                }
                else
                {
                    return 1;
                }                
            }
            else
            {
                // End:0xF4
                if(int(gs) == int(2))
                {
                    ClearSubgoals(true);
                    return 2;
                }
            }
        }
    }
    //return;    
}

function End()
{
    // End:0x1D
    if(Subgoals.Length > 0)
    {
        Subgoals[0].End();
    }
    //return;    
}

function HandleMessage(string Msg)
{
    // End:0x22
    if(Subgoals.Length > 0)
    {
        Subgoals[0].HandleMessage(Msg);
    }
    //return;    
}

function DisplayDebug(Canvas C, int Level, out float YL, out float YPos)
{
    YPos += YL;
    C.SetPos(4.0000000 + float(Level * 16), YPos);
    C.DrawText(ToString());
    // End:0x78
    if(Subgoals.Length > 0)
    {
        Subgoals[0].DisplayDebug(C, Level + 1, YL, YPos);
    }
    //return;    
}

function string ToString()
{
    // End:0x21
    if(Subgoals.Length > 0)
    {
        return Subgoals[0].ToString();        
    }
    else
    {
        return "";
    }
    //return;    
}

function bool SetFocusValueToTarget()
{
    // End:0x102
    if(Owner.TargetSystem.Target != none)
    {
        // End:0xBE
        if(Owner.TargetSystem.Target.IsVisible)
        {
            Owner.Focus = Owner.TargetSystem.Target.Pawn;
            Owner.FocalPoint.X = 0.0000000;
            Owner.FocalPoint.Y = 0.0000000;
            Owner.FocalPoint.Z = 0.0000000;            
        }
        else
        {
            Owner.Focus = none;
            Owner.FocalPoint = Owner.TargetSystem.Target.LastPosition;
        }
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool SetFocusValue()
{
    return false;
    //return;    
}

function bool SetFocus()
{
    // End:0x27
    if((Subgoals.Length > 0) && Subgoals[0].SetFocus())
    {
        return true;        
    }
    else
    {
        return SetFocusValue();
    }
    //return;    
}

defaultproperties
{
    MessageNotifyKilled="MSG_NOTIFY_KILLED"
    MessageMemoryVisibleChanged="MSG_MEMORY_VISIBLE_CHANGED"
    MessageFlashed="MSG_MY_EYE_MY_EYE"
    MessageBePeaceful="MessageBePeaceful"
    MessageNotifyDied="MessageNotifyDied"
}