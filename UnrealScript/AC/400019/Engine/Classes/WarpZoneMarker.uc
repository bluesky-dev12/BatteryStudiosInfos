class WarpZoneMarker extends SmallNavigationPoint
    native
    notplaceable
    hidecategories(Lighting,LightColor,Karma,Force);

var WarpZoneInfo markedWarpZone;
var Actor TriggerActor;
var Actor TriggerActor2;

function PostBeginPlay()
{
    // End:0x1A
    if(markedWarpZone.numDestinations > 1)
    {
        FindTriggerActor();
    }
    super(NavigationPoint).PostBeginPlay();
    //return;    
}

function FindTriggerActor()
{
    local ZoneTrigger Z;

    // End:0x40
    foreach AllActors(Class'Engine.ZoneTrigger', Z)
    {
        // End:0x3F
        if(Z.Event == markedWarpZone.ZoneTag)
        {
            TriggerActor = Z;            
            return;
        }        
    }    
    //return;    
}

function Actor SpecialHandling(Pawn Other)
{
    // End:0x31
    if(Other.Region.Zone == markedWarpZone)
    {
        markedWarpZone.ActorEntered(Other);
    }
    return self;
    //return;    
}

defaultproperties
{
    bCollideWhenPlacing=false
    bHiddenEd=true
}