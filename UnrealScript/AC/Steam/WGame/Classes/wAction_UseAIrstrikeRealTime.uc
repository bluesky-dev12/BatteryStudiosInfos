/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_UseAIrstrikeRealTime.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_UseAIrstrikeRealTime extends wAction
    dependson(Goal_UseAirstrikeRealTime);

function wAction_UseAIrstrikeRealTime Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.HasSupplyAirstrike && !ws.World_Airstrike;
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
    ws.HasSupplyAirstrike = false;
    ws.PropsectDealtDamage += 700;
    ws.CurrentWeapon = none;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_UseAirstrikeRealTime(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_UseAirstrikeRealTime')).Init(Owner);
}

defaultproperties
{
    Layer=1
    ActionName="TGR"
}