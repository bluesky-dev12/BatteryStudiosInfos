/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\karmatest.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class karmatest extends KActor;

var Vector RepLocation;
var Rotator RepRotation;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        RepLocation, RepRotation;

}

function Tick(float Delta)
{
    // End:0x47
    if(Role == 4)
    {
        // End:0x2a
        if(RepLocation != Location)
        {
            RepLocation = Location;
        }
        // End:0x44
        if(RepRotation != Rotation)
        {
            RepRotation = Rotation;
        }
    }
    // End:0x57
    else
    {
        // End:0x57
        if(Role < 4)
        {
        }
    }
}

simulated event PostNetReceive()
{
    super(Actor).PostNetReceive();
    SetLocation(RepLocation);
    SetRotation(RepRotation);
}

defaultproperties
{
    bNoDelete=true
    RemoteRole=2
    bBlockActors=true
    begin object name=KParams00 class=KarmaParams
        KMass=0.40
        KAngularDamping=1.0
        KBuoyancy=1.0
        KActorGravScale=2.0
        bHighDetailOnly=true
        bClientOnly=true
        KFriction=0.250
        KRestitution=0.60
    object end
    // Reference: KarmaParams'karmatest.KParams00'
    KParams=KParams00
}