class wAction_Explore extends wAction;

function wAction_Explore Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return ((ws.FreeLegs && !ws.CannotFindPath) && !ws.World_TeamGame) && !ws.IsFlashed;
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
    ws.MeetNewEnemyProbabilty += (CalcMeetNewEnemyProbability(ws));
    //return;    
}

static function float CalcMeetNewEnemyProbability(wStateData ws)
{
    return float(ws.World_NumEnemies) / 8.0000000;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_Roam(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_Roam')).Init(Owner);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="EXP"
}