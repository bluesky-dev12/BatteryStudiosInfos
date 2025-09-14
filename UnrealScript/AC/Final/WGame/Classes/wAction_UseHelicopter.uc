class wAction_UseHelicopter extends wAction;

function wAction_UseHelicopter Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return (ws.FreeHands && ws.HasSupplyHelicopter) && !ws.World_Helicopter;
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
    ws.PropsectDealtDamage += 1000;
    ws.HasSupplyHelicopter = false;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_SwitchAndUse(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchAndUse')).Init(Owner, 6);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="U_HELI"
}