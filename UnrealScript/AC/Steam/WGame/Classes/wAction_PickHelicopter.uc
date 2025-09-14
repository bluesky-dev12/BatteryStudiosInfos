/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_PickHelicopter.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class wAction_PickHelicopter extends wAction;

var Pickup Pack;

function wAction_PickHelicopter Init(Pickup inPack)
{
    Pack = inPack;
    Pack.RegisterDestroyListener(self);
    return self;
}

function ClearReferences()
{
    Log("[wAction_PickHelicopter::ClearReferences]");
    Pack = none;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && !ws.CannotFindPath && !ws.HasSupplyHelicopter && !ws.IsFlashed;
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
    ws.MeetNewEnemyProbabilty += class'wAction_Explore'.static.CalcMeetNewEnemyProbability(ws);
    ws.HasSupplyHelicopter = true;
    ws.PropsectDealtDamage += 150;
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
    ActionName="PCK_HELI"
}