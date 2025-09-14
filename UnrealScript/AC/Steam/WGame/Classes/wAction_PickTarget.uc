/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_PickTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:7
 *
 *******************************************************************************/
class wAction_PickTarget extends wAction;

var MemoryItem TargetMemoryItem;

function wAction_PickTarget Init(MemoryItem inTarget)
{
    TargetMemoryItem = inTarget;
    return self;
}

function ClearReferences()
{
    Log("[wAction_PickTarget::ClearReferences]");
    TargetMemoryItem.ClearReferences();
}

function bool CheckRequirement(wState ws)
{
    return ws.TargetChangeCount == 0 && !ws.IsFlashed;
}

function float Sim_GetTime(wState ws)
{
    return 0.0;
}

function Sim_PreEffect(wState ws)
{
    ws.Target = TargetMemoryItem;
    ws.TargetVisible = TargetMemoryItem.IsVisible;
}

function Sim_PostEffect(wState ws)
{
    ++ ws.TargetChangeCount;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_PickTarget(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_PickTarget')).Init(Owner, TargetMemoryItem);
}

defaultproperties
{
    Layer=2
    ActionName="PT"
}