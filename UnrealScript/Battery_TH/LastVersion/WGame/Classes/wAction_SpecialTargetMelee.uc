class wAction_SpecialTargetMelee extends wAction;

var Actor Target;
var float DmgFactor;

function wAction_SpecialTargetMelee Init(Actor inTarget, float inDmgFactor)
{
    Target = inTarget;
    Target.RegisterDestroyListener(self);
    DmgFactor = inDmgFactor;
    return self;
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super(Object).NotifyDestroyed(A);
    // End:0x21
    if(Target == A)
    {
        Target = none;
    }
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    local float fDist;

    // End:0x73
    if(((Target != none) && ws.Owner != none) && VSize(ws.Owner.Location) > float(0))
    {
        fDist = VSize(Target.Location - ws.Owner.Location);
    }
    return ((((ws.FreeLegs && ws.FreeHands) && !ws.CannotFindPath) && ws.Target != none) && fDist < ws.Owner.NPCParam.MeleeActionRange) && !ws.IsFlashed;
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
    return Goal_ApproachAndMeleeActor(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_ApproachAndMeleeActor')).Init(Owner, Target);
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="SATM"
}