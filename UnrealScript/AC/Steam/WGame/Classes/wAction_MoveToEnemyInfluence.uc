/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_MoveToEnemyInfluence.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_MoveToEnemyInfluence extends wAction;

function wAction_MoveToEnemyInfluence Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && ws.World_TeamGame && !ws.CannotFindPath && !ws.IsFlashed;
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
    ws.MeetNewEnemyProbabilty += float(ws.World_NumEnemies) / 4.0;
    ws.FlagIamOn = none;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MoveToEnemyInfluence(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MoveToEnemyInfluence')).Init(Owner);
}

defaultproperties
{
    Layer=2
    ActionName="EnINF"
}