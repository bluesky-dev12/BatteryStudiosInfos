class wAction_Reload extends wAction;

function wAction_Reload Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return (ws.FreeHands && ws.Magazine > 0) && ws.Ammo != ws.MaxAmmo;
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
    local int fill;

    fill = Min(ws.Magazine, ws.MaxAmmo - ws.Ammo);
    ws.Ammo += fill;
    ws.Magazine -= fill;
    ws.FreeHands = true;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_Reload(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Reload')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="R"
}