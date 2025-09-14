class wAction_MeleeNoTarget extends wAction;

function wAction_MeleeNoTarget Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return 1.0000000;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    ws.FreeHands = false;
    //return;    
}

function Sim_PostEffect(wState ws)
{
    ws.FreeHands = true;
    ws.PropsectDealtDamage += 50;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MeleeNoTarget(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MeleeNoTarget')).Init(Owner, 4);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="ML_NT"
}