class wAction_PickHelicopter extends wAction;

var Pickup Pack;

function wAction_PickHelicopter Init(Pickup inPack)
{
    Pack = inPack;
    Pack.RegisterDestroyListener(self);
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_PickHelicopter::ClearReferences]");
    Pack = none;
    //return;    
}

function bool CheckRequirement(wStateData ws)
{
    return ((ws.FreeLegs && !ws.CannotFindPath) && !ws.HasSupplyHelicopter) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wStateData ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wStateData ws)
{
    ws.FreeLegs = false;
    //return;    
}

function Sim_PostEffect(wStateData ws)
{
    ws.FreeLegs = true;
    ws.FlagIamOn = none;
    ws.MeetNewEnemyProbabilty += Class'WGame_Decompressed.wAction_Explore'.static.CalcMeetNewEnemyProbability(ws);
    ws.HasSupplyHelicopter = true;
    ws.PropsectDealtDamage += 150;
    //return;    
}

function Goal GetGoal(wAIBotBase Owner)
{
    return Goal_MovePathToward(Owner.AILevel.PoolGoal.AllocateObject(Class'WGame_Decompressed.Goal_MovePathToward')).Init(Owner, Pack, 20.0000000);
    //return;    
}

function NotifyDestroyed(Actor A)
{
    super(Object).NotifyDestroyed(A);
    // End:0x21
    if(Pack == A)
    {
        Pack = none;
    }
    //return;    
}

defaultproperties
{
    Layer=2
    ActionName="PCK_HELI"
}