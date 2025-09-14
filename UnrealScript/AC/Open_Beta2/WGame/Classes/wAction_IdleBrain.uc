class wAction_IdleBrain extends wAction;

function wAction_IdleBrain Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return true;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return MinTimeSegment;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    //return;    
}

defaultproperties
{
    ActionName="IB"
}