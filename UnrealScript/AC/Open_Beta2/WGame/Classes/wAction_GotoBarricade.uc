class wAction_GotoBarricade extends wAction;

var Decoration DecoBarricade;

function wAction_GotoBarricade Init(Decoration Deco)
{
    DecoBarricade = Deco;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_GotoBarricade::ClearReferences]");
    DecoBarricade = none;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return (ws.FreeLegs && !ws.CannotFindPath) && !ws.IsFlashed;
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
    ws.MeetNewEnemyProbabilty += (float(ws.World_NumEnemies) / 8.0000000);
    //return;    
}

function WriteFutureState(out wFutureState fs)
{
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_GoToBarricade(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_GoToBarricade')).Init(Owner, none, DecoBarricade);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="GoBRC"
}