class wAction_MoveToEnemyInfluence extends wAction;

function wAction_MoveToEnemyInfluence Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ((ws.FreeLegs && ws.World_TeamGame) && !ws.CannotFindPath) && !ws.IsFlashed;
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
    ws.MeetNewEnemyProbabilty += (float(ws.World_NumEnemies) / 4.0000000);
    ws.FlagIamOn = none;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MoveToEnemyInfluence(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToEnemyInfluence')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="EnINF"
}