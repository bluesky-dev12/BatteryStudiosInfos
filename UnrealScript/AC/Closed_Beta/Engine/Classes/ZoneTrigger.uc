class ZoneTrigger extends Trigger
    placeable;

function Touch(Actor Other)
{
    local ZoneInfo Z;

    // End:0x9F
    if(IsRelevant(Other))
    {
        // End:0x69
        if(Event != 'None')
        {
            // End:0x68
            foreach AllActors(Class'Engine.ZoneInfo', Z)
            {
                // End:0x67
                if(Z.ZoneTag == Event)
                {
                    Z.Trigger(Other, Other.Instigator);
                }                
            }            
        }
        // End:0x92
        if(Message != "")
        {
            Other.Instigator.ClientMessage(Message);
        }
        // End:0x9F
        if(bTriggerOnceOnly)
        {
            SetCollision(false);
        }
    }
    //return;    
}

function UnTouch(Actor Other)
{
    local ZoneInfo Z;

    // End:0x69
    if(IsRelevant(Other))
    {
        // End:0x69
        if(Event != 'None')
        {
            // End:0x68
            foreach AllActors(Class'Engine.ZoneInfo', Z)
            {
                // End:0x67
                if(Z.ZoneTag == Event)
                {
                    Z.UnTrigger(Other, Other.Instigator);
                }                
            }            
        }
    }
    //return;    
}
