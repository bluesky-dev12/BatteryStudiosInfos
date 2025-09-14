class karmatest extends KActor;

var Vector RepLocation;
var Rotator RepRotation;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        RepLocation, RepRotation;
}

function Tick(float Delta)
{
    // End:0x47
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x2A
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
    else
    {
        // End:0x57
        if(int(Role) < int(ROLE_Authority))
        {
        }
    }
    //return;    
}

simulated event PostNetReceive()
{
    super(Actor).PostNetReceive();
    SetLocation(RepLocation);
    SetRotation(RepRotation);
    //return;    
}

defaultproperties
{
    bNoDelete=false
    RemoteRole=2
    bBlockActors=false
    // Reference: KarmaParams'WGame_Decompressed.karmatest.KParams00'
    begin object name="KParams00" class=Engine.KarmaParams
        KMass=0.4000000
        KAngularDamping=1.0000000
        KBuoyancy=1.0000000
        KActorGravScale=2.0000000
        bHighDetailOnly=false
        bClientOnly=false
        KFriction=0.2500000
        KRestitution=0.6000000
    end object
    KParams=KParams00
}