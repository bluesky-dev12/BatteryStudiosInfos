/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_LookAround.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class wAction_LookAround extends wAction;

var float Duration;

function wAction_LookAround Init(float inDuration)
{
    Duration = inDuration;
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && ws.CannotFindPath;
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
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_LookAround(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_LookAround')).Init(Owner, Duration);
}

defaultproperties
{
    Layer=2
    ActionName="LA"
}