class wAction_Reload extends wAction;

function wAction_Reload Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return (ws.FreeHands && ws.Magazine > 0) && ws.Ammo != ws.MaxAmmo;
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