class wAction_ThrowGrenade extends wAction;

var Actor Target;

function wAction_ThrowGrenade Init(Actor inTarget)
{
    Target = inTarget;
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_ThrowGrenade::ClearReferences]");
    Target = none;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return ((ws.FreeHands && ws.NumFragGrenade > 0) && ws.Time == 0.0000000) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 1.0000000;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    ws.FreeHands = false;
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    ws.FreeHands = true;
    ws.NumFragGrenade--;
    ws.PropsectDealtDamage += 100;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_SwitchAndThrow(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_SwitchAndThrow')).Init(Owner, Target, 4);
    //return;    
}

defaultproperties
{
    Layer=1
    ActionName="TG"
}