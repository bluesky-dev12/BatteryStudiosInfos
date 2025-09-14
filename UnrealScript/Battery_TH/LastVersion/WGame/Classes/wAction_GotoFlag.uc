class wAction_GotoFlag extends wAction;

var wFlagObjectiveBase flag;
var float inReachRadius;

function wAction_GotoFlag Init(wFlagObjectiveBase inFlag, optional float inRadius)
{
    flag = inFlag;
    // End:0x23
    if(inRadius > float(0))
    {
        inReachRadius = inRadius;
    }
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_GotoFlag::ClearReferences]");
    flag = none;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    local bool bResult;

    bResult = ((!ws.IsStopAction && ws.FreeLegs) && !ws.CannotFindPath) && !ws.IsFlashed;
    bResult = bResult && !ws.IsStopGotoFlag1 && !ws.IsStopGotoFlag2;
    return bResult;
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
    return Goal_GoToFlag(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_GoToFlag')).Init(Owner, flag, inReachRadius);
    //return;    
}

defaultproperties
{
    inReachRadius=30.0000000
    Layer=2
    ActionName="GoFLG"
}