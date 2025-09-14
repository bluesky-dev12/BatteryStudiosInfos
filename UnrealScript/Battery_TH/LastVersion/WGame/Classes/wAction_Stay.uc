class wAction_Stay extends wAction;

var float StayLength;

function wAction_Stay Init(float inStayLength)
{
    StayLength = inStayLength;
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
    return 3.0000000;
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
    return Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Stay')).Init(Owner, 4.0000000);
    //return;    
}

defaultproperties
{
    StayLength=1.0000000
    Layer=2
    ActionName="S"
}