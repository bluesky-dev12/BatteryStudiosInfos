class wAction_Dodge extends wAction;

var float StayLength;

function wAction_Dodge Init(float inStayLength)
{
    StayLength = inStayLength;
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return ws.FreeLegs;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    ws.FreeLegs = false;
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    ws.FreeLegs = true;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_DodgeAround(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_DodgeAround')).Init(Owner, Owner.Level.GetClosestNavigationPoint(Owner.Pawn.Location), 20.0000000, 4.0000000);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="DA"
}