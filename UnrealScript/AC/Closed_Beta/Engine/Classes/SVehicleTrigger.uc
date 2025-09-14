class SVehicleTrigger extends Triggers
    native
    notplaceable;

var() bool bEnabled;
var bool BACKUP_bEnabled;
var bool bMarkWithPath;
var NavigationPoint myMarker;

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    BACKUP_bEnabled = bEnabled;
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    bEnabled = !bEnabled;
    //return;    
}

function UsedBy(Pawn User)
{
    // End:0x0D
    if(!bEnabled)
    {
        return;
    }
    Vehicle(Owner).TryToDrive(User);
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bEnabled = BACKUP_bEnabled;
    //return;    
}

defaultproperties
{
    bEnabled=true
    bOnlyAffectPawns=true
    bHardAttach=true
    CollisionRadius=80.0000000
    CollisionHeight=400.0000000
    bCollideActors=false
}