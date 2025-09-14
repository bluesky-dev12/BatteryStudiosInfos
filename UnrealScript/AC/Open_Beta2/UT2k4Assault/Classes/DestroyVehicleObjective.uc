class DestroyVehicleObjective extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var ASVehicleFactory TargetFactory;
var Vehicle TargetVehicle;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        TargetVehicle;
}

function PostBeginPlay()
{
    local ASVehicleFactory ASVF;

    super.PostBeginPlay();
    // End:0x61
    foreach AllActors(Class'UT2k4Assault_Decompressed.ASVehicleFactory', ASVF)
    {
        // End:0x60
        if(ASVF.VehicleEvent == Tag)
        {
            TargetFactory = ASVF;
            TargetVehicle = TargetFactory.Child;
            TargetFactory.MyDestroyVehicleObjective = self;
            // End:0x61
            break;
        }        
    }    
    //return;    
}

function VehicleSpawned(Vehicle NewTargetVehicle)
{
    NetUpdateTime = Level.TimeSeconds - float(1);
    TargetVehicle = NewTargetVehicle;
    TargetVehicle.bNoFriendlyFire = true;
    //return;    
}

function CompleteObjective(Pawn Instigator)
{
    // End:0x54
    if((TargetVehicle != none) && TargetVehicle.Health > 0)
    {
        TargetVehicle.Died(TargetVehicle.Controller, Class'Engine.Suicided', TargetVehicle.Location);        
    }
    else
    {
        DisableObjective(Instigator);
    }
    //return;    
}

function Trigger(Actor Other, Pawn Instigator)
{
    // End:0x39
    if(!bDisabled && UnrealMPGameInfo(Level.Game).CanDisableObjective(self))
    {
        DisableObjective(Instigator);
    }
    //return;    
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
    //return;    
}

simulated function float GetObjectiveProgress()
{
    // End:0x1C
    if(bDisabled || TargetVehicle == none)
    {
        return 0.0000000;
    }
    return float(TargetVehicle.Health) / TargetVehicle.HealthMax;
    //return;    
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