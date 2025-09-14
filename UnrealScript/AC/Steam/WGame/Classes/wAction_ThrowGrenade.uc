/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_ThrowGrenade.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:7
 *
 *******************************************************************************/
class wAction_ThrowGrenade extends wAction;

var Actor Target;

function wAction_ThrowGrenade Init(Actor inTarget)
{
    Target = inTarget;
    return self;
}

function ClearReferences()
{
    Log("[wAction_ThrowGrenade::ClearReferences]");
    Target = none;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.NumFragGrenade > 0 && ws.Time == 0.0 && !ws.IsFlashed;
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
    ws.PropsectDealtDamage += 100;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_SwitchAndThrow(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_SwitchAndThrow')).Init(Owner, Target, 4);
}

defaultproperties
{
    Layer=1
    ActionName="TG"
}