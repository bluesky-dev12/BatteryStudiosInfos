class wAction_LookAround extends wAction;

var float Duration;

function wAction_LookAround Init(float inDuration)
{
    Duration = inDuration;
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && ws.CannotFindPath;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    ws.FreeLegs = false;
    //return;    
}

function Sim_PostEffect(wState ws)
{
    ws.FreeLegs = true;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_LookAround(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_LookAround')).Init(Owner, Duration);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="LA"
}