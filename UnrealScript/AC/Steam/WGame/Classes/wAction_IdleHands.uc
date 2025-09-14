/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_IdleHands.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class wAction_IdleHands extends wAction;

var float IdleTime;

function wAction_IdleHands Init(float inIdleTime)
{
    IdleTime = inIdleTime;
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.Ammo != 0;
}

function float Sim_GetTime(wState ws)
{
    return 1.0;
}

function Sim_PreEffect(wState ws)
{
    ws.FreeHands = false;
}

function Sim_PostEffect(wState ws)
{
    ws.FreeHands = true;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 5.0);
}

defaultproperties
{
    Layer=1
    ActionName="IH"
}