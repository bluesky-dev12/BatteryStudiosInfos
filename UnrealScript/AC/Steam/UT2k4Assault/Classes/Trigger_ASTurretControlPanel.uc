/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASTurretControlPanel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:11
 *
 *******************************************************************************/
class Trigger_ASTurretControlPanel extends Trigger_ASUseAndPossess;

var(MonitorEffects) Material StatusTex[4];
var byte Status;
var byte OldStatus;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        Status;

}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    Skins.Length = 2;
    Skins[0] = none;
    Skins[1] = StatusTex[0];
    UpdateCapacity();
}

simulated event Destroyed()
{
    super(Actor).Destroyed();
}

event VehicleSpawned()
{
    UpdateCapacity();
}

event VehicleDestroyed()
{
    UpdateCapacity();
}

event VehiclePossessed()
{
    UpdateCapacity();
}

event VehicleUnPossessed()
{
    UpdateCapacity();
}

function UpdateCapacity();
event NotifyAvailability(bool bAvailableSpace)
{
    // End:0x19
    if(bAvailableSpace)
    {
        TriggerEvent(EventNonFull, self, none);
    }
    // End:0x26
    else
    {
        TriggerEvent(EventFull, self, none);
    }
    // End:0x3a
    if(bAvailableSpace)
    {
        ChangeStatus(2);
    }
    // End:0x42
    else
    {
        ChangeStatus(3);
    }
}

function ChangeStatus(byte NewStatus)
{
    // End:0x15
    if(Status == NewStatus)
    {
        return;
    }
    Status = NewStatus;
    // End:0x3f
    if(Level.NetMode != 1)
    {
        PostNetReceive();
    }
}

simulated function PostNetReceive();
function Reset()
{
    super.Reset();
    Status = 0;
    UpdateCapacity();
}

defaultproperties
{
    StatusTex=Texture'Engine.BlackTexture'
    DrawType=8
    bHidden=true
    bOnlyAffectPawns=true
    bReplicateMovement=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    RemoteRole=1
    DrawScale=0.50
    PrePivot=(X=-48.0,Y=0.0,Z=160.0)
    AmbientGlow=32
    bMovable=true
    CollisionHeight=80.0
    bCollideWorld=true
    bBlockActors=true
    bBlockKarma=true
    bNetNotify=true
    bEdShouldSnap=true
}