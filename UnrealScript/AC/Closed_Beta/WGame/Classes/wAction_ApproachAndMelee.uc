class wAction_ApproachAndMelee extends wAction;

function wAction_ApproachAndMelee Init()
{
    return self;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ((((((ws.FreeLegs && ws.FreeHands) && !ws.CannotFindPath) && ws.Target != none) && ws.TargetVisible) && ws.TargetReachable) && VSize(ws.Target.Pawn.Location - ws.Location) < ws.Owner.NPCParam.MeleeActionRange) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    ws.PropsectDealtDamage += 2000;
    ws.FreeLegs = false;
    ws.FreeHands = false;
    //return;    
}

function Sim_PostEffect(wState ws)
{
    ws.FreeLegs = true;
    ws.FreeHands = true;
    ws.FlagIamOn = none;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_ApproachAndMelee(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_ApproachAndMelee')).Init(Owner, Pawn(Owner.Target));
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="AM"
}