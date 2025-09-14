/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\WarpZoneMarker.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class WarpZoneMarker extends SmallNavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var WarpZoneInfo markedWarpZone;
var Actor TriggerActor;
var Actor TriggerActor2;

function PostBeginPlay()
{
    // End:0x1a
    if(markedWarpZone.numDestinations > 1)
    {
        FindTriggerActor();
    }
    super(NavigationPoint).PostBeginPlay();
}

function FindTriggerActor()
{
    local ZoneTrigger Z;

    // End:0x40
    foreach AllActors(class'ZoneTrigger', Z)
    {
        // End:0x3f
        if(Z.Event == markedWarpZone.ZoneTag)
        {
            TriggerActor = Z;
            break;
            return;
        }                
    }
}

function Actor SpecialHandling(Pawn Other)
{
    // End:0x31
    if(Other.Region.Zone == markedWarpZone)
    {
        markedWarpZone.ActorEntered(Other);
    }
    return self;
}

defaultproperties
{
    bCollideWhenPlacing=true
    bHiddenEd=true
}