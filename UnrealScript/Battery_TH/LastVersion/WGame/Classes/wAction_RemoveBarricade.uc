class wAction_RemoveBarricade extends wAction;

var Decoration DecoBarricade;
var wFlagObjectiveBase flag;

function wAction_RemoveBarricade Init(Decoration Deco, wFlagObjectiveBase inFlag)
{
    DecoBarricade = Deco;
    flag = inFlag;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_RemoveBarricade::ClearReferences]");
    DecoBarricade = none;
    flag = none;
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
    return Goal_RemoveBarricade(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_RemoveBarricade')).Init(Owner, DecoBarricade);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="RBRC"
}