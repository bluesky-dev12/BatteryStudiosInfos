/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_Reload.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_Reload extends wAction
    dependson(Goal_Reload);

function wAction_Reload Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.Magazine > 0 && ws.Ammo != ws.MaxAmmo;
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
    local int fill;

    fill = Min(ws.Magazine, ws.MaxAmmo - ws.Ammo);
    ws.Ammo += fill;
    ws.Magazine -= fill;
    ws.FreeHands = true;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_Reload(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Reload')).Init(Owner);
}

defaultproperties
{
    Layer=1
    ActionName="R"
}