class Trigger_ASTurretControlPanel extends Trigger_ASUseAndPossess;

var(MonitorEffects) Material StatusTex[4];
var byte Status;
var byte OldStatus;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        Status;
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    Skins.Length = 2;
    Skins[0] = none;
    Skins[1] = StatusTex[0];
    UpdateCapacity();
    //return;    
}

simulated event Destroyed()
{
    super(Actor).Destroyed();
    //return;    
}

event VehicleSpawned()
{
    UpdateCapacity();
    //return;    
}

event VehicleDestroyed()
{
    UpdateCapacity();
    //return;    
}

event VehiclePossessed()
{
    UpdateCapacity();
    //return;    
}

event VehicleUnPossessed()
{
    UpdateCapacity();
    //return;    
}

function UpdateCapacity()
{
    //return;    
}

event NotifyAvailability(bool bAvailableSpace)
{
    // End:0x19
    if(bAvailableSpace)
    {
        TriggerEvent(EventNonFull, self, none);        
    }
    else
    {
        TriggerEvent(EventFull, self, none);
    }
    // End:0x3A
    if(bAvailableSpace)
    {
        ChangeStatus(2);        
    }
    else
    {
        ChangeStatus(3);
    }
    //return;    
}

function ChangeStatus(byte NewStatus)
{
    // End:0x15
    if(int(Status) == int(NewStatus))
    {
        return;
    }
    Status = NewStatus;
    // End:0x3F
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        PostNetReceive();
    }
    //return;    
}

simulated function PostNetReceive()
{
    //return;    
}

function Reset()
{
    super.Reset();
    Status = 0;
    UpdateCapacity();
    //return;    
}

defaultproperties
{
    StatusTex=Texture'Engine.BlackTexture'
    DrawType=8
    bHidden=false
    bOnlyAffectPawns=false
    bReplicateMovement=false
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    RemoteRole=1
    DrawScale=0.5000000
    PrePivot=(X=-48.0000000,Y=0.0000000,Z=160.0000000)
    AmbientGlow=32
    bMovable=false
    CollisionHeight=80.0000000
    bCollideWorld=true
    bBlockActors=true
    bBlockKarma=true
    bNetNotify=true
    bEdShouldSnap=true
}