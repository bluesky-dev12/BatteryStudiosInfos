/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_UseHelicopter.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_UseHelicopter extends wAction;

function wAction_UseHelicopter Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.HasSupplyHelicopter && !ws.World_Helicopter;
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
    ws.PropsectDealtDamage += 1000;
    ws.HasSupplyHelicopter = false;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_SwitchAndUse(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchAndUse')).Init(Owner, 6);
}

defaultproperties
{
    Layer=1
    ActionName="U_HELI"
}