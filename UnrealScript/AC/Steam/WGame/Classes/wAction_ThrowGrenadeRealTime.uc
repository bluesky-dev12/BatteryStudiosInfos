/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_ThrowGrenadeRealTime.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_ThrowGrenadeRealTime extends wAction;

function wAction_ThrowGrenadeRealTime Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.NumFragGrenade > 0 && !ws.IsFlashed && ws.Target == none || ws.Target.IsVisible == false;
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
    -- ws.NumFragGrenade;
    ws.PropsectDealtDamage += 150;
    ws.CurrentWeapon = none;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_ThrowGrenadeRealTime(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_ThrowGrenadeRealTime')).Init(Owner);
}

defaultproperties
{
    Layer=1
    ActionName="TGR"
}