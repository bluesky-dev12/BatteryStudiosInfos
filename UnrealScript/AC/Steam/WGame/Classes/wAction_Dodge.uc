/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_Dodge.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class wAction_Dodge extends wAction;

var float StayLength;

function wAction_Dodge Init(float inStayLength)
{
    StayLength = inStayLength;
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs;
}

function float Sim_GetTime(wState ws)
{
    return 3.0;
}

function Sim_PreEffect(wState ws)
{
    ws.FreeLegs = false;
}

function Sim_PostEffect(wState ws)
{
    ws.FreeLegs = true;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_DodgeAround(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_DodgeAround')).Init(Owner, Owner.Level.GetClosestNavigationPoint(Owner.Pawn.Location), 20.0, 4.0);
}

defaultproperties
{
    Layer=2
    ActionName="DA"
}