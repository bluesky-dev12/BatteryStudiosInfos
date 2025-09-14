class wAction_CaptureFlag extends wAction;

var wFlagObjectiveBase flag;

function wAction_CaptureFlag Init(wFlagObjectiveBase inFlag)
{
    flag = inFlag;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_CaptureFlag::ClearReferences]");
    flag = none;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ((ws.FreeLegs && ws.FlagIamOn != none) && ws.FlagIamOn == flag) && ws.FlagIamOn.iActiveTeam != ws.Owner.GetTeamNum();
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
    ws.MeetNewEnemyProbabilty += (float(ws.World_NumEnemies) / 8.0000000);
    ws.NumCapturedFlags++;
    //return;    
}

function WriteFutureState(out wFutureState fs)
{
    fs.FlagCapturing = flag;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_CaptureFlag(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_CaptureFlag')).Init(Owner, flag);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="CapFLG"
}