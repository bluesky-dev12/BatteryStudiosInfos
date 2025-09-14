/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_Empty.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class wAction_Empty extends wAction;

function wAction_Empty Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return true;
}

function float Sim_GetTime(wState ws)
{
    return 0.0;
}

function Sim_PreEffect(wState ws);
function Sim_PostEffect(wState ws);
