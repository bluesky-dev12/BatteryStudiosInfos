class wAction_PickAirstrike extends wAction;

var Pickup Pack;

function wAction_PickAirstrike Init(Pickup inPack)
{
    Pack = inPack;
    Pack.RegisterDestroyListener(self);
    return self;
    //return;    
}

function ClearReferences()
{
    Log("[wAction_PickAirstrike::ClearReferences]");
    Pack = none;
    //return;    
}

function bool CheckRequirement(wState ws)
{
    return ((ws.FreeLegs && !ws.CannotFindPath) && !ws.HasSupplyAirstrike) && !ws.IsFlashed;
    //return;    
}

function float Sim_GetTime(wState ws)
{
    return 3.0000000;
    //return;    
}

function Sim_PreEffect(wState ws)
{
    ws.FreeLegs = false;
    //return;    
}

function Sim_PostEffect(wState ws)
{
    ws.FreeLegs = true;
    ws.FlagIamOn = none;
    ws.MeetNewEnemyProbabilty += Class'WGame_Decompressed.wAction_Explore'.static.CalcMeetNewEnemyProbability(ws);
    ws.HasSupplyAirstrike = true;
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
    ActionName="PCK_AIR"
}