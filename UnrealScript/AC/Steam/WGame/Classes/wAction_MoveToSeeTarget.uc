/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_MoveToSeeTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_MoveToSeeTarget extends wAction;

function wAction_MoveToSeeTarget Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && ws.Target != none && !ws.TargetVisible && !ws.CannotFindPath && !ws.IsFlashed;
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
    ws.MeetNewEnemyProbabilty += float(ws.World_NumEnemies) / 8.0;
    ws.TargetVisible = true;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MoveToSeeTarget(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MoveToSeeTarget')).Init(Owner);
}

defaultproperties
{
    Layer=2
    ActionName="MOV2SEE"
}