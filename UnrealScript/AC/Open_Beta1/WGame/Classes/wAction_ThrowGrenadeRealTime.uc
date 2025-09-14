class wAction_ThrowGrenadeRealTime extends wAction;

function wAction_ThrowGrenadeRealTime Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ((ws.FreeHands && ws.NumFragGrenade > 0) && !ws.IsFlashed) && (ws.Target == none) || ws.Target.IsVisible == false;
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
    ws.NumFragGrenade--;
    ws.PropsectDealtDamage += 150;
    ws.CurrentWeapon = none;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_ThrowGrenadeRealTime(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_ThrowGrenadeRealTime')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="TGR"
}