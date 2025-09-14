/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_Melee.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class wAction_Melee extends wAction;

function wAction_Melee Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeHands && ws.CanMeleeTarget && !ws.IsFlashed;
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

defaultproperties
{
    Layer=1
    ActionName="ML"
}