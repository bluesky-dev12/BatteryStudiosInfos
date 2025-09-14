/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_IdleBrain.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class wAction_IdleBrain extends wAction;

function wAction_IdleBrain Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return true;
}

function float Sim_GetTime(wState ws)
{
    return MinTimeSegment;
}

function Sim_PreEffect(wState ws);
function Sim_PostEffect(wState ws);

defaultproperties
{
    ActionName="IB"
}