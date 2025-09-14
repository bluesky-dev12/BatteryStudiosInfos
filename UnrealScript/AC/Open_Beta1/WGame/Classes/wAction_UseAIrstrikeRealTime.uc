class wAction_UseAIrstrikeRealTime extends wAction;

function wAction_UseAIrstrikeRealTime Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return (ws.FreeHands && ws.HasSupplyAirstrike) && !ws.World_Airstrike;
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
    ws.HasSupplyAirstrike = false;
    ws.PropsectDealtDamage += 700;
    ws.CurrentWeapon = none;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_UseAirstrikeRealTime(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_UseAirstrikeRealTime')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="TGR"
}