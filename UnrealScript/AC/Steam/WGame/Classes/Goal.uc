/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:9
 *	Functions:17
 *
 *******************************************************************************/
class Goal extends Object
    dependson(TargetingSystem)
    dependson(MemoryItem);

enum EGoalStatus
{
    GS_NONE,
    GS_WORKING,
    GS_FAILED,
    GS_COMPLETED
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
}

function ClearReferences()
{
    Log("[Goal::ClearRefenreces]");
    Owner = none;
    Subgoals.Length = 0;
}

function NotifyDestroyed(Actor A)
{
    // End:0x23
    if(Owner != none && Owner == A)
    {
        Owner = none;
    }
}

function AddSubgoal(Goal inGoal)
{
    Subgoals[Subgoals.Length] = inGoal;
}

function ClearSubgoals(optional bool free)
{
    local int lp1;

    // End:0x6c
    if(free)
    {
        lp1 = 0;
        J0x10:
        // End:0x6c [While If]
        if(lp1 < Subgoals.Length)
        {
            Subgoals[lp1].ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(Subgoals[lp1]);
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
    }
    // End:0x89
    if(Subgoals.Length > 0)
    {
        Subgoals[0].End();
    }
    Subgoals.Length = 0;
}

function Start();
function StartIfNotStarted()
{
    // End:0x16
    if(GoalStatus == 0)
    {
        Start();
    }
}

function Goal.EGoalStatus Process(float dt)
{
    StartIfNotStarted();
    // End:0x27
    if(GoalStatus == 1)
    {
        GoalStatus = ActualWork(dt);
    }
    return GoalStatus;
}

function Goal.EGoalStatus ActualWork(float dt)
{
    return ProcessSubGoals(dt);
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
    // End:0xf4
    else
    {
        atomicSubgoal = Subgoals[0].Subgoals.Length == 0;
        gs = Subgoals[0].Process(dt);
        // End:0x5f
        if(gs == 1)
        {
            return 1;
        }
        // End:0xf4
        else
        {
            Subgoals[0].End();
            Subgoals[0].ClearSubgoals(true);
            Owner.AILevel.PoolGoal.FreeObject(Subgoals[0]);
            Subgoals.Remove(0, 1);
            // End:0xda
            if(gs == 3)
            {
                // End:0xd4
                if(Subgoals.Length == 0)
                {
                    return 3;
                }
                // End:0xd7
                else
                {
                    return 1;
                }
            }
            // End:0xf4
            else
            {
                // End:0xf4
                if(gs == 2)
                {
                    ClearSubgoals(true);
                    return 2;
                }
            }
        }
    }
}

function End()
{
    // End:0x1d
    if(Subgoals.Length > 0)
    {
        Subgoals[0].End();
    }
}

function HandleMessage(string Msg)
{
    // End:0x22
    if(Subgoals.Length > 0)
    {
        Subgoals[0].HandleMessage(Msg);
    }
}

function DisplayDebug(Canvas C, int Level, out float YL, out float YPos)
{
    YPos += YL;
    C.SetPos(4.0 + float(Level * 16), YPos);
    C.DrawText(ToString());
    // End:0x78
    if(Subgoals.Length > 0)
    {
        Subgoals[0].DisplayDebug(C, Level + 1, YL, YPos);
    }
}

function string ToString()
{
    // End:0x21
    if(Subgoals.Length > 0)
    {
        return Subgoals[0].ToString();
    }
    // End:0x24
    else
    {
        return "";
    }
}

function bool SetFocusValueToTarget()
{
    // End:0x102
    if(Owner.TargetSystem.Target != none)
    {
        // End:0xbe
        if(Owner.TargetSystem.Target.IsVisible)
        {
            Owner.Focus = Owner.TargetSystem.Target.Pawn;
            Owner.FocalPoint.X = 0.0;
            Owner.FocalPoint.Y = 0.0;
            Owner.FocalPoint.Z = 0.0;
        }
        // End:0xfd
        else
        {
            Owner.Focus = none;
            Owner.FocalPoint = Owner.TargetSystem.Target.LastPosition;
        }
        return true;
    }
    // End:0x104
    else
    {
        return false;
    }
}

function bool SetFocusValue()
{
    return false;
}

function bool SetFocus()
{
    // End:0x27
    if(Subgoals.Length > 0 && Subgoals[0].SetFocus())
    {
        return true;
    }
    // End:0x2e
    else
    {
        return SetFocusValue();
    }
}

defaultproperties
{
    MessageNotifyKilled="MSG_NOTIFY_KILLED"
    MessageMemoryVisibleChanged="MSG_MEMORY_VISIBLE_CHANGED"
    MessageFlashed="MSG_MY_EYE_MY_EYE"
    MessageBePeaceful="MessageBePeaceful"
    MessageNotifyDied="MessageNotifyDied"
}