/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_MeleeNoTarget.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_MeleeNoTarget extends wAction;

function wAction_MeleeNoTarget Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.IsFlashed;
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
    ws.PropsectDealtDamage += 50;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MeleeNoTarget(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MeleeNoTarget')).Init(Owner, 4);
}

defaultproperties
{
    Layer=2
    ActionName="ML_NT"
}