class wAction_MoveToFrontLine extends wAction;

function wAction_MoveToFrontLine Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ((ws.FreeLegs && ws.World_IsSDRespawnTime) && !ws.CannotFindPath) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    ws.FreeLegs = false;
    //return;    
}

function Sim_PostEffect(wState ws)
{
    ws.FreeLegs = true;
    ws.MeetNewEnemyProbabilty += (float(ws.World_NumEnemies) / 2.0000000);
    ws.FlagIamOn = none;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MoveToFrontline(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToFrontline')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="FRT"
}