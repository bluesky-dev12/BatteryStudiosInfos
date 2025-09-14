class Goal_ExecPartialPlan extends Goal;

var wActionContainer PartialPlan;
var Goal GoalMain;
var Goal_ExecPartialPlan GoalSub;
var int GoalSubIndex;
var float Progress;

function Goal_ExecPartialPlan Init(wAIBotBase inOwner, wActionContainer inPartialPlan)
{
    InitBase(inOwner);
    PartialPlan = inPartialPlan;
    GoalMain = none;
    GoalSub = none;
    GoalSubIndex = 0;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[Goal_ExecPartialPlan::ClearRefenreces]");
    GoalMain = none;
    GoalSub = none;
    //return;    
}

function Start()
{
    // End:0x47
    if(int(GoalStatus) == int(0))
    {
        GoalStatus = 1;
        GoalMain = PartialPlan.Action.GetGoal(Owner);
        GoalSub = GetNextSubGoal();
    }
    //return;    
}

function float GetProgress(float Min, float Size)
{
    // End:0x22
    if(GoalSub == none)
    {
        return Min + (Size * Progress);        
    }
    else
    {
        return GoalSub.GetProgress(Min + (Size * Progress), Size / float(PartialPlan.SubActionContainersLength));
    }
    //return;    
}

function Goal_ExecPartialPlan GetNextSubGoal()
{
    // End:0x8B
    if(GoalSubIndex < PartialPlan.SubActionContainersLength)
    {
        Progress = float(GoalSubIndex) / float(PartialPlan.SubActionContainersLength);
        return Goal_ExecPartialPlan(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_ExecPartialPlan')).Init(Owner, PartialPlan.SubActionContainers[GoalSubIndex++]);        
    }
    else
    {
        return none;
    }
    //return;    
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = GoalMain.Process(dt);
    // End:0x3B
    if(int(gs) == int(2))
    {
        Progress = 1.0000000;
        return 2;        
    }
    else
    {
        // End:0x5C
        if(int(gs) == int(3))
        {
            Progress = 1.0000000;
            return 3;            
        }
        else
        {
            // End:0x141
            if(int(gs) == int(1))
            {
                // End:0x117
                if(GoalSub != none)
                {
                    gs = GoalSub.Process(dt);
                    // End:0xB2
                    if(int(gs) == int(2))
                    {
                        Progress = 1.0000000;
                        return 2;                        
                    }
                    else
                    {
                        // End:0x107
                        if(int(gs) == int(3))
                        {
                            GoalSub.ClearSubgoals(true);
                            Owner.AILevel.PoolGoal.FreeObject(GoalSub);
                            GoalSub = GetNextSubGoal();                            
                        }
                        else
                        {
                            // End:0x117
                            if(int(gs) == int(1))
                            {
                            }
                        }
                    }
                }
                // End:0x13E
                if((GoalSub == none) && PartialPlan.SubActionContainersLength != 0)
                {
                    return 3;                    
                }
                else
                {
                    return 1;
                }
            }
        }
    }
    Log("[Goal_ExecPartialPlan::ActualWork] reached unreachable");
    return 2;
    //return;    
}

function End()
{
    super.End();
    // End:0x20
    if(GoalSub != none)
    {
        GoalSub.End();
    }
    // End:0x3A
    if(GoalMain != none)
    {
        GoalMain.End();
    }
    //return;    
}

function ClearSubgoals(optional bool free)
{
    super.ClearSubgoals(free);
    // End:0xA5
    if(free)
    {
        // End:0x5D
        if(GoalSub != none)
        {
            GoalSub.ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(GoalSub);
            GoalSub = none;
        }
        // End:0xA5
        if(GoalMain != none)
        {
            GoalMain.ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(GoalMain);
            GoalMain = none;
        }
    }
    //return;    
}

function bool SetFocus()
{
    // End:0x24
    if((GoalSub != none) && GoalSub.SetFocus())
    {
        return true;        
    }
    else
    {
        // End:0x48
        if((GoalMain != none) && GoalMain.SetFocus())
        {
            return true;            
        }
        else
        {
            return SetFocusValue();
        }
    }
    //return;    
}

function DisplayDebug(Canvas C, int Level, out float YL, out float YPos)
{
    // End:0x31
    if(GoalMain != none)
    {
        GoalMain.DisplayDebug(C, Level + 1, YL, YPos);
    }
    // End:0x62
    if(GoalSub != none)
    {
        GoalSub.DisplayDebug(C, Level + 1, YL, YPos);
    }
    //return;    
}

function string ToString()
{
    return (((("[Goal_ExecPartialPlan] Plan=" $ PartialPlan.ToString()) $ " GoalSubIndex=") $ string(GoalSubIndex)) $ " GoalSubTotal=") $ string(PartialPlan.SubActionContainersLength);
    //return;    
}
