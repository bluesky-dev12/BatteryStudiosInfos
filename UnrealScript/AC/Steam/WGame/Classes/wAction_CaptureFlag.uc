/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wAction_CaptureFlag.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class wAction_CaptureFlag extends wAction;

var wFlagObjectiveBase flag;

function wAction_CaptureFlag Init(wFlagObjectiveBase inFlag)
{
    flag = inFlag;
    return self;
}

function ClearReferences()
{
    Log("[wAction_CaptureFlag::ClearReferences]");
    flag = none;
}

function bool CheckRequirement(wState ws)
{
    return ws.FreeLegs && ws.FlagIamOn != none && ws.FlagIamOn == flag && ws.FlagIamOn.iActiveTeam != ws.Owner.GetTeamNum();
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
    ws.MeetNewEnemyProbabilty += float(ws.World_NumEnemies) / 8.0;
    ++ ws.NumCapturedFlags;
}

function WriteFutureState(out wFutureState fs)
{
    fs.FlagCapturing = flag;
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_CaptureFlag(Owner.AILevel.PoolGoal.AllocateObject(class'Goal_CaptureFlag')).Init(Owner, flag);
}

defaultproperties
{
    Layer=2
    ActionName="CapFLG"
}