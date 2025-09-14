/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wBombObjective_Delivery.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
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
    if(rMM != none && rMM.szGameClass != ApplyGameInfo)
    {
        bCanActive = false;
        bActive = false;
        DefensePriority = 0;
    }
    // End:0x5d
    else
    {
        bActive = true;
    }
    super(GameObjective).PreBeginPlay();
}

function bool IsRelevant(Pawn Instigator, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = Instigator.PlayerReplicationInfo;
    // End:0x6c
    if(super.IsRelevant(Instigator, bAliveCheck) && PRI != none && PRI.HasFlag != none && PRI.HasFlag.IsA(DeliveringObjectName))
    {
        return true;
    }
    return false;
}

function CompleteObjective(Pawn Instigator)
{
    DisableObjective(Instigator);
}

function DisableObjective(Pawn Instigator)
{
    return;
}

function ForceDisableObjective(Pawn Instigator)
{
    local PlayerReplicationInfo PRI;
    local wGameObject_Bomb Bomb;
    local Controller Ctrl;

    Ctrl = Level.ControllerList;
    J0x14:
    // End:0x113 [While If]
    if(Ctrl != none)
    {
        // End:0xfc
        if(PlayerController(Ctrl) != none)
        {
            PRI = Ctrl.PlayerReplicationInfo;
            // End:0xfc
            if(PRI != none && PRI.HasFlag != none && PRI.HasFlag.IsA(DeliveringObjectName))
            {
                Bomb = wGameObject_Bomb(PRI.HasFlag);
                // End:0xe0
                if(Ctrl.Pawn != none)
                {
                    Bomb.Drop(Ctrl.Pawn.Velocity * 0.50);
                }
                // End:0xfc
                else
                {
                    Bomb.Drop(vect(0.0, 0.0, 0.0));
                }
            }
        }
        Ctrl = Ctrl.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    DisableObjective(Instigator);
}

function bool TellBotHowToDisable(Bot B)
{
    // End:0x95
    if(B.PlayerReplicationInfo.HasFlag != none)
    {
        // End:0x4a
        if(EC == none)
        {
            EC = wGameObject_Bomb(B.PlayerReplicationInfo.HasFlag);
        }
        B.GoalString = "Take Energy Core to vehicle";
        return B.Squad.FindPathToObjective(B, self);
    }
    // End:0xd4
    if(EC == none)
    {
        // End:0xb4
        foreach DynamicActors(class'wGameObject_Bomb', EC)
        {
            // End:0xb4
            break;                        
        }
        // End:0xd4
        if(EC == none)
        {
            Log("NO ENERGY CORE");
            return false;
        }
    }
    // End:0x17f
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
}

defaultproperties
{
    DeliveringObject=class'wGameObject_Bomb'
    DeliveringObjectName='
    DefenderTeamIndex=1
    DefensePriority=100
    ObjectiveName="Bomb Delivery"
    DestructionMessage=""
    Announcer_ObjectiveInfo="v_sd_destroy_R"
    Announcer_DefendObjective="v_sd_guard_R"
    ApplyGameInfo="wMission.wSDGameInfo"
}