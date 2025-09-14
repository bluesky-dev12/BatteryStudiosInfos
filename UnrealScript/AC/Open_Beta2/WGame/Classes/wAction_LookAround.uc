class wAction_LookAround extends wAction;

var float Duration;

function wAction_LookAround Init(float inDuration)
{
    Duration = inDuration;
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return ws.FreeLegs && ws.CannotFindPath;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    ws.FreeLegs = false;
    //return;    
}

function Sim_PostEffect(wStateData ws)
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