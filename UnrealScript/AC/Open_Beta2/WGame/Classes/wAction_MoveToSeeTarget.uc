class wAction_MoveToSeeTarget extends wAction;

function wAction_MoveToSeeTarget Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return (((ws.FreeLegs && ws.Target != none) && !ws.TargetVisible) && !ws.CannotFindPath) && !ws.IsFlashed;
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
    ws.FlagIamOn = none;
    ws.MeetNewEnemyProbabilty += (float(ws.World_NumEnemies) / 8.0000000);
    ws.TargetVisible = true;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MoveToSeeTarget(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MoveToSeeTarget')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="MOV2SEE"
}