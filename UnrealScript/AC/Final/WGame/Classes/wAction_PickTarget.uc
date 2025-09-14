class wAction_PickTarget extends wAction;

var MemoryItem TargetMemoryItem;

function wAction_PickTarget Init(MemoryItem inTarget)
{
    TargetMemoryItem = inTarget;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_PickTarget::ClearReferences]");
    TargetMemoryItem.ClearReferences();
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return (ws.TargetChangeCount == 0) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 0.0000000;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    ws.Target = TargetMemoryItem;
    ws.TargetVisible = TargetMemoryItem.IsVisible;
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    ws.TargetChangeCount++;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_PickTarget(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_PickTarget')).Init(Owner, TargetMemoryItem);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="PT"
}