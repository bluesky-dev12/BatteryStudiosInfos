/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_Stay.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class wAction_Stay extends wAction;

var float StayLength;

function wAction_Stay Init(float inStayLength)
{
    StayLength = inStayLength;
    return self;
}

function bool CheckRequirement(wState ws)
{
    return true;
}

function float Sim_GetTime(wState ws)
{
    return 3.0;
}

function Sim_PreEffect(wState ws);
function Sim_PostEffect(wState ws);
function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_Stay(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_Stay')).Init(Owner, 4.0);
}

defaultproperties
{
    StayLength=1.0
    Layer=2
    ActionName="S"
}