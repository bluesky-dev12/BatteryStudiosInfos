/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\Goal_PickTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class Goal_PickTarget extends Goal;

var MemoryItem MI;

function Goal_PickTarget Init(wAIBotBase inOwner, MemoryItem inMI)
{
    InitBase(inOwner);
    MI = inMI;
    return self;
}

function ClearReferences()
{
    Log("[Goal_PickTarget::ClearRefenreces]");
    MI.ClearReferences();
    MI = none;
}

function Start()
{
    // End:0x5b
    if(GoalStatus == 0)
    {
        MI.LastTargetedTime = Owner.Level.TimeSeconds;
        Owner.Target = MI.Pawn;
        GoalStatus = 3;
    }
}

function Goal.EGoalStatus ActualWork(float dt)
{
    return 3;
}

function string ToString()
{
    return "[Goal_PickTarget] Target=" $ MI.Pawn.PlayerReplicationInfo.PlayerName;
}
