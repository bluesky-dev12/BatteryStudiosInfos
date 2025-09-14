/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\DestroyVehicleObjective.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class DestroyVehicleObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var ASVehicleFactory TargetFactory;
var Vehicle TargetVehicle;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        TargetVehicle;

}

function PostBeginPlay()
{
    local ASVehicleFactory ASVF;

    super.PostBeginPlay();
    // End:0x61
    foreach AllActors(class'ASVehicleFactory', ASVF)
    {
        // End:0x60
        if(ASVF.VehicleEvent == Tag)
        {
            TargetFactory = ASVF;
            TargetVehicle = TargetFactory.Child;
            TargetFactory.MyDestroyVehicleObjective = self;
        }
        // End:0x61
        else
        {
            continue;
        }        
    }
}

function VehicleSpawned(Vehicle NewTargetVehicle)
{
    NetUpdateTime = Level.TimeSeconds - float(1);
    TargetVehicle = NewTargetVehicle;
    TargetVehicle.bNoFriendlyFire = true;
}

function CompleteObjective(Pawn Instigator)
{
    // End:0x54
    if(TargetVehicle != none && TargetVehicle.Health > 0)
    {
        TargetVehicle.Died(TargetVehicle.Controller, class'Suicided', TargetVehicle.Location);
    }
    // End:0x5f
    else
    {
        DisableObjective(Instigator);
    }
}

function Trigger(Actor Other, Pawn Instigator)
{
    // End:0x39
    if(!bDisabled && UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        DisableObjective(Instigator);
    }
}

function bool TellBotHowToDisable(Bot B)
{
    // End:0x18
    if(bDisabled || TargetVehicle == none)
    {
        return false;
    }
    // End:0x66
    if(B.CanAttack(TargetVehicle))
    {
        B.GoalString = "Attack Objective";
        B.DoRangedAttackOn(TargetVehicle);
        return true;
    }
    return super.TellBotHowToDisable(B);
}

simulated function float GetObjectiveProgress()
{
    // End:0x1c
    if(bDisabled || TargetVehicle == none)
    {
        return 0.0;
    }
    return float(TargetVehicle.Health) / TargetVehicle.HealthMax;
}

defaultproperties
{
    bReplicateObjective=true
    bPlayCriticalAssaultAlarm=true
    ObjectiveName="????? ????"
    ObjectiveDescription="????? ???? ???????"
    Objective_Info_Attacker="?? ??? ????"
    Objective_Info_Defender="?? ??? ????"
    bNotBased=true
    bDestinationOnly=true
    bAlwaysRelevant=true
}