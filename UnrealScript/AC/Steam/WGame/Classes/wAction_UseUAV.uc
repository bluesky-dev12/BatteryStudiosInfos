/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_UseUAV.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_UseUAV extends wAction;

function wAction_UseUAV Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.HasSupplyUAV && ws.Target == none || !ws.TargetVisible;
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
    ws.PropsectDealtDamage += 150;
    ws.Health += 100;
    ws.TargetVisible = true;
    ws.HasSupplyUAV = false;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_SwitchAndUse(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchAndUse')).Init(Owner, 6);
}

defaultproperties
{
    Layer=1
    ActionName="U_UAV"
}