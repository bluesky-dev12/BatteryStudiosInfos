/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASOBJ_EnergyCore_Delivery.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *
 *******************************************************************************/
class ASOBJ_EnergyCore_Delivery extends ProximityObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var GameObject_EnergyCore EC;

function bool IsRelevant(Pawn Instigator, bool bAliveCheck)
{
    local PlayerReplicationInfo PRI;

    PRI = Instigator.PlayerReplicationInfo;
    // End:0x6c
    if(super.IsRelevant(Instigator, bAliveCheck) && PRI != none && PRI.HasFlag != none && PRI.HasFlag.IsA('GameObject_EnergyCore'))
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
    local PlayerReplicationInfo PRI;
    local GameObject_EnergyCore EnergyCore;

    PRI = Instigator.PlayerReplicationInfo;
    // End:0x65
    if(!IsActive() || PRI == none || PRI.HasFlag == none || !PRI.HasFlag.IsA('GameObject_EnergyCore'))
    {
        return;
    }
    EnergyCore = GameObject_EnergyCore(PRI.HasFlag);
    EnergyCore.ClearHolder();
    EnergyCore.Destroy();
    super(GameObjective).DisableObjective(Instigator);
}

function bool TellBotHowToDisable(Bot B)
{
    // End:0x95
    if(B.PlayerReplicationInfo.HasFlag != none)
    {
        // End:0x4a
        if(EC == none)
        {
            EC = GameObject_EnergyCore(B.PlayerReplicationInfo.HasFlag);
        }
        B.GoalString = "Take Energy Core to vehicle";
        return B.Squad.FindPathToObjective(B, self);
    }
    // End:0xd4
    if(EC == none)
    {
        // End:0xb4
        foreach DynamicActors(class'GameObject_EnergyCore', EC)
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
    DefenderTeamIndex=1
    ObjectiveName="??? ?? ??"
}