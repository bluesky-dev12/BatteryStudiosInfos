class RedirectionTrigger extends Triggers;

var() name RedirectionEvent;

function Trigger(Actor Other, Pawn EventInstigator)
{
    local Pawn P;

    // End:0x44
    foreach DynamicActors(Class'Engine.Pawn', P, Event)
    {
        // End:0x43
        if(P.Health > 0)
        {
            P.TriggerEvent(RedirectionEvent, self, P);
        }        
    }    
    //return;    
}

defaultproperties
{
    bCollideActors=false
}