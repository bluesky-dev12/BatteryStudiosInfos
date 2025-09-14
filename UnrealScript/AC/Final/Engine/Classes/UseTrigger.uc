class UseTrigger extends Triggers
    placeable;

var() localized string Message;

function bool SelfTriggered()
{
    return true;
    //return;    
}

function UsedBy(Pawn User)
{
    TriggerEvent(Event, self, User);
    //return;    
}

function Touch(Actor Other)
{
    // End:0x63
    if(Pawn(Other) != none)
    {
        // End:0x35
        if(Message != "")
        {
            Pawn(Other).ClientMessage(Message);
        }
        // End:0x63
        if(AIController(Pawn(Other).Controller) != none)
        {
            UsedBy(Pawn(Other));
        }
    }
    //return;    
}
