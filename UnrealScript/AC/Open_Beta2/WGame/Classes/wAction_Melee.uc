class wAction_Melee extends wAction;

function wAction_Melee Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return (ws.FreeHands && ws.CanMeleeTarget) && !ws.IsFlashed;
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
    ws.PropsectDealtDamage += 50;
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="ML"
}