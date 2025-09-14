/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_ExecPartialPlan.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:11
 *
 *******************************************************************************/
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
}

function ClearReferences()
{
    Log("[Goal_ExecPartialPlan::ClearRefenreces]");
    GoalMain = none;
    GoalSub = none;
}

function Start()
{
    // End:0x47
    if(GoalStatus == 0)
    {
        GoalStatus = 1;
        GoalMain = PartialPlan.Action.GetGoal(Owner);
        GoalSub = GetNextSubGoal();
    }
}

function float GetProgress(float Min, float Size)
{
    // End:0x22
    if(GoalSub == none)
    {
        return Min + Size * Progress;
    }
    // End:0x5c
    else
    {
        return GoalSub.GetProgress(Min + Size * Progress, Size / float(PartialPlan.SubActionContainersLength));
    }
}

function Goal_ExecPartialPlan GetNextSubGoal()
{
    // End:0x8b
    if(GoalSubIndex < PartialPlan.SubActionContainersLength)
    {
        Progress = float(GoalSubIndex) / float(PartialPlan.SubActionContainersLength);
        return Goal_ExecPartialPlan(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_ExecPartialPlan')).Init(Owner, PartialPlan.SubActionContainers[++ GoalSubIndex]);
    }
    // End:0x8d
    else
    {
        return none;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    local Goal.EGoalStatus gs;

    gs = GoalMain.Process(dt);
    // End:0x3b
    if(gs == 2)
    {
        Progress = 1.0;
        return 2;
    }
    // End:0x141
    else
    {
        // End:0x5c
        if(gs == 3)
        {
            Progress = 1.0;
            return 3;
        }
        // End:0x141
        else
        {
            // End:0x141
            if(gs == 1)
            {
                // End:0x117
                if(GoalSub != none)
                {
                    gs = GoalSub.Process(dt);
                    // End:0xb2
                    if(gs == 2)
                    {
                        Progress = 1.0;
                        return 2;
                    }
                    // End:0x117
                    else
                    {
                        // End:0x107
                        if(gs == 3)
                        {
                            GoalSub.ClearSubgoals(true);
                            Owner.AILevel.PoolGoal.FreeObject(GoalSub);
                            GoalSub = GetNextSubGoal();
                        }
                        // End:0x117
                        else
                        {
                            // End:0x117
                            if(gs == 1)
                            {
                            }
                        }
                    }
                }
                // End:0x13e
                if(GoalSub == none && PartialPlan.SubActionContainersLength != 0)
                {
                    return 3;
                }
                // End:0x141
                else
                {
                    return 1;
                }
            }
        }
    }
    Log("[Goal_ExecPartialPlan::ActualWork] reached unreachable");
    return 2;
}

function End()
{
    super.End();
    // End:0x20
    if(GoalSub != none)
    {
        GoalSub.End();
    }
    // End:0x3a
    if(GoalMain != none)
    {
        GoalMain.End();
    }
}

function ClearSubgoals(optional bool free)
{
    super.ClearSubgoals(free);
    // End:0xa5
    if(free)
    {
        // End:0x5d
        if(GoalSub != none)
        {
            GoalSub.ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(GoalSub);
            GoalSub = none;
        }
        // End:0xa5
        if(GoalMain != none)
        {
            GoalMain.ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(GoalMain);
            GoalMain = none;
        }
    }
}

function bool SetFocus()
{
    // End:0x24
    if(GoalSub != none && GoalSub.SetFocus())
    {
        return true;
    }
    // End:0x4f
    else
    {
        // End:0x48
        if(GoalMain != none && GoalMain.SetFocus())
        {
            return true;
        }
        // End:0x4f
        else
        {
            return SetFocusValue();
        }
    }
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
}

function string ToString()
{
    return "[Goal_ExecPartialPlan] Plan=" $ PartialPlan.ToString() $ " GoalSubIndex=" $ string(GoalSubIndex) $ " GoalSubTotal=" $ string(PartialPlan.SubActionContainersLength);
}
