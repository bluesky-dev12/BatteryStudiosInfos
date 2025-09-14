class VolumeTrigger extends Triggers;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Volume V;

    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x41
    foreach AllActors(Class'Engine.Volume', V, Event)
    {
        V.Trigger(Other, EventInstigator);        
    }    
    //return;    
}

defaultproperties
{
    bCollideActors=false
}