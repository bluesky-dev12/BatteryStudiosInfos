class wAction_Melee extends wAction;

function wAction_Melee Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return (ws.FreeHands && ws.CanMeleeTarget) && !ws.IsFlashed;
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

defaultproperties
{
    Layer=1
    ActionName="ML"
}