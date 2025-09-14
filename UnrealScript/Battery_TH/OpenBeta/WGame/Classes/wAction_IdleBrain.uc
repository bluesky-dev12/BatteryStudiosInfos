class wAction_IdleBrain extends wAction;

function wAction_IdleBrain Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return true;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return MinTimeSegment;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    //return;    
}

function Sim_PostEffect(wState ws)
{
    //return;    
}

defaultproperties
{
    ActionName="IB"
}