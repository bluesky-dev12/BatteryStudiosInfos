class wAction_Empty extends wAction;

function wAction_Empty Init()
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
    return 0.0000000;
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
