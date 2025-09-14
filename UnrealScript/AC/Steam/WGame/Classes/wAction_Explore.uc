/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_Explore.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:7
 *
 *******************************************************************************/
class wAction_Explore extends wAction
    dependson(Goal_Roam);

function wAction_Explore Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && !ws.CannotFindPath && !ws.World_TeamGame && !ws.IsFlashed;
}

function float Sim_GetTime(wState ws)
{
    return 3.0;
}

function Sim_PreEffect(wState ws)
{
    ws.FreeLegs = false;
}

function Sim_PostEffect(wState ws)
{
    ws.FreeLegs = true;
    ws.FlagIamOn = none;
    ws.MeetNewEnemyProbabilty += CalcMeetNewEnemyProbability(ws);
}

static function float CalcMeetNewEnemyProbability(wState ws)
{
    return float(ws.World_NumEnemies) / 8.0;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_Roam(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Roam')).Init(Owner);
}

defaultproperties
{
    Layer=2
    ActionName="EXP"
}