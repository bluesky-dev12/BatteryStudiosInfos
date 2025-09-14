class wAction_IdleHands extends wAction;

var float IdleTime;

function wAction_IdleHands Init(float inIdleTime)
{
    IdleTime = inIdleTime;
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return ws.FreeHands && ws.Ammo != 0;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 1.0000000;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    ws.FreeHands = false;
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    ws.FreeHands = true;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 5.0000000);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="IH"
}