class wAction_ApproachTarget extends wAction;

function wAction_ApproachTarget Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    local float fDist;
    local bool bResult;

    // End:0x6B
    if((ws.Target != none) && ws.Target.Pawn != none)
    {
        fDist = VSize(ws.Target.Pawn.Location - ws.Location);
    }
    bResult = ((((!ws.IsStopAction && !ws.CannotFindPath) && ws.Target != none) && ws.TargetVisible) && fDist < ws.Owner.NPCParam.MeleeActionRange) && !ws.IsFlashed;
    ws.Owner.IsStopGotoFlag2 = bResult;
    return bResult;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    ws.PropsectDealtDamage += 2000;
    ws.FreeLegs = false;
    ws.FreeHands = false;
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    ws.FreeLegs = true;
    ws.FreeHands = true;
    ws.FlagIamOn = none;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_ApproachTarget(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_ApproachTarget')).Init(Owner, Pawn(Owner.Target));
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="AT"
}