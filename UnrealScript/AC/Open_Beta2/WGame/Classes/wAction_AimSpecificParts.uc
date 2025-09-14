class wAction_AimSpecificParts extends wAction;

function wAction_AimSpecificParts Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    // End:0x16
    if(none == ws.Target)
    {
        return false;
    }
    // End:0x2D
    if(false == ws.TargetVisible)
    {
        return false;
    }
    return true;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 1.0000000;
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

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_AimSpecificParts(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_AimSpecificParts')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="AimSpecificParts"
}