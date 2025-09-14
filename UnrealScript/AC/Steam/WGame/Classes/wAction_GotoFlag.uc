/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_GotoFlag.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class wAction_GotoFlag extends wAction;

var wFlagObjectiveBase flag;

function wAction_GotoFlag Init(wFlagObjectiveBase inFlag)
{
    flag = inFlag;
    return self;
}

function ClearReferences()
{
    Log("[wAction_GotoFlag::ClearReferences]");
    flag = none;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && !ws.CannotFindPath && !ws.IsFlashed;
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
    ws.FlagIamOn = flag;
    ws.MeetNewEnemyProbabilty += float(ws.World_NumEnemies) / 8.0;
}

function WriteFutureState(out wFutureState fs)
{
    fs.FlagDest = flag;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_GoToFlag(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_GoToFlag')).Init(Owner, flag);
}

defaultproperties
{
    Layer=2
    ActionName="GoFLG"
}