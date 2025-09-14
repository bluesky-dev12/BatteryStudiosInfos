class wAction_Empty extends wAction;

function wAction_Empty Init()
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
    return 0.0000000;
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
