class wAction_GotoFlag extends wAction;

var wFlagObjectiveBase flag;

function wAction_GotoFlag Init(wFlagObjectiveBase inFlag)
{
    flag = inFlag;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_GotoFlag::ClearReferences]");
    flag = none;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return (ws.FreeLegs && !ws.CannotFindPath) && !ws.IsFlashed;
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
    ws.FlagIamOn = flag;
    ws.MeetNewEnemyProbabilty += (float(ws.World_NumEnemies) / 8.0000000);
    //return;    
}

function WriteFutureState(out wFutureState fs)
{
    fs.FlagDest = flag;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_GoToFlag(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_GoToFlag')).Init(Owner, flag);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="GoFLG"
}