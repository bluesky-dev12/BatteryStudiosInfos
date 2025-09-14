class wAction_UseUAV extends wAction;

function wAction_UseUAV Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return (ws.FreeHands && ws.HasSupplyUAV) && (ws.Target == none) || !ws.TargetVisible;
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
    ws.PropsectDealtDamage += 150;
    ws.Health += 100;
    ws.TargetVisible = true;
    ws.HasSupplyUAV = false;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_SwitchAndUse(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchAndUse')).Init(Owner, 10);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="U_UAV"
}