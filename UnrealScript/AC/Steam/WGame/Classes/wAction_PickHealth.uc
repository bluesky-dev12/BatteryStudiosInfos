/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_PickHealth.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class wAction_PickHealth extends wAction;

var Pickup Pack;

function wAction_PickHealth Init(Pickup inPack)
{
    Pack = inPack;
    Pack.RegisterDestroyListener(self);
    return self;
}

function ClearReferences()
{
    Log("[wAction_PickHealth::ClearReferences]");
    Pack = none;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && !ws.CannotFindPath && float(ws.Health) < ws.Owner.Pawn.HealthMax * 0.90 && !ws.IsFlashed;
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
    ws.FlagIamOn = none;
    ws.MeetNewEnemyProbabilty += float(ws.World_NumEnemies) / 8.0;
    ws.Health = Max(int(ws.Owner.Pawn.HealthMax), ws.Health + 50);
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_MovePathToward')).Init(Owner, Pack, 20.0);
}

function NotifyDestroyed(Actor A)
{
    super(Object).NotifyDestroyed(A);
    // End:0x21
    if(Pack == A)
    {
        Pack = none;
    }
}

defaultproperties
{
    Layer=2
    ActionName="PCK_HP"
}