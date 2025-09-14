/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_ApproachAndMelee.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wAction_ApproachAndMelee extends wAction;

function wAction_ApproachAndMelee Init()
{
    return self;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && ws.FreeHands && !ws.CannotFindPath && ws.Target != none && ws.TargetVisible && ws.TargetReachable && VSize(ws.Target.Pawn.Location - ws.Location) < ws.Owner.NPCParam.MeleeActionRange && !ws.IsFlashed;
}

function float Sim_GetTime(wState ws)
{
    return 3.0;
}

function Sim_PreEffect(wState ws)
{
    ws.PropsectDealtDamage += 2000;
    ws.FreeLegs = false;
    ws.FreeHands = false;
}

function Sim_PostEffect(wState ws)
{
    ws.FreeLegs = true;
    ws.FreeHands = true;
    ws.FlagIamOn = none;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_ApproachAndMelee(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_ApproachAndMelee')).Init(Owner, Pawn(Owner.Target));
}

defaultproperties
{
    Layer=2
    ActionName="AM"
}