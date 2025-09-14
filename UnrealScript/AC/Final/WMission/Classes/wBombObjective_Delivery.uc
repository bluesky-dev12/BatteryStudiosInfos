class wBombObjective_Delivery extends ProximityObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var wGameObject_Bomb EC;
var Class DeliveringObject;
var name DeliveringObjectName;

simulated event PreBeginPlay()
{
    local wMatchMaker rMM;

    rMM = Level.GetMatchMaker();
    // End:0x55
    if((rMM != none) && rMM.szGameClass != ApplyGameInfo)
    {
        bCanActive = false;
        bActive = false;
        DefensePriority = 0;        
    }
    else
    {
        bActive = true;
    }
    super(GameObjective).PreBeginPlay();
    //return;    
}

function bool IsRelevant(Pawn Instigator, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = Instigator.PlayerReplicationInfo;
    // End:0x6C
    if(((super.IsRelevant(Instigator, bAliveCheck) && PRI != none) && PRI.HasFlag != none) && PRI.HasFlag.IsA(DeliveringObjectName))
    {
        return true;
    }
    return false;
    //return;    
}

function CompleteObjective(Pawn Instigator)
{
    DisableObjective(Instigator);
    //return;    
}

function DisableObjective(Pawn Instigator)
{
    return;
    //return;    
}

function ForceDisableObjective(Pawn Instigator)
{
    local PlayerReplicationInfo PRI;
    local wGameObject_Bomb Bomb;
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:

    // End:0x113 [Loop If]
    if(Ctrl != none)
    {
        // End:0xFC
        if(PlayerController(Ctrl) != none)
        {
            PRI = Ctrl.PlayerReplicationInfo;
            // End:0xFC
            if(((PRI != none) && PRI.HasFlag != none) && PRI.HasFlag.IsA(DeliveringObjectName))
            {
                Bomb = wGameObject_Bomb(PRI.HasFlag);
                // End:0xE0
                if(Ctrl.Pawn != none)
                {
                    Bomb.Drop(Ctrl.Pawn.Velocity * 0.5000000);                    
                }
                else
                {
                    Bomb.Drop(vect(0.0000000, 0.0000000, 0.0000000));
                }
            }
        }
        Ctrl = Ctrl.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    DisableObjective(Instigator);
    //return;    
}

function bool TellBotHowToDisable(Bot B)
{
    // End:0x95
    if(B.PlayerReplicationInfo.HasFlag != none)
    {
        // End:0x4A
        if(EC == none)
        {
            EC = wGameObject_Bomb(B.PlayerReplicationInfo.HasFlag);
        }
        B.GoalString = "Take Energy Core to vehicle";
        return B.Squad.FindPathToObjective(B, self);
    }
    // End:0xD4
    if(EC == none)
    {
        // End:0xB4
        foreach DynamicActors(Class'WMission_Decompressed.wGameObject_Bomb', EC)
        {
            // End:0xB4
            break;            
        }        
        // End:0xD4
        if(EC == none)
        {
            Log("NO ENERGY CORE");
            return false;
        }
    }
    // End:0x17F
    if(EC.Holder != none)
    {
        B.GoalString = "Protect Energy Core holder";
        // End:0x153
        if(VSize(EC.Holder.Location - B.Pawn.Location) < float(1200))
        {
            return false;
        }
        return B.Squad.FindPathToObjective(B, EC.Holder);
    }
    B.GoalString = "Go pick up Energy Core";
    return B.Squad.FindPathToObjective(B, EC);
    //return;    
}

defaultproperties
{
    DeliveringObject=Class'WMission_Decompressed.wGameObject_Bomb'
    DeliveringObjectName="'"
    DefenderTeamIndex=1
    DefensePriority=100
    ObjectiveName="Bomb Delivery"
    DestructionMessage=""
    ApplyGameInfo="wMission.wSDGameInfo"
}